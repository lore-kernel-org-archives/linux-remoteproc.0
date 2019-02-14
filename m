Return-Path: <xiaoxiang781216@gmail.com>
MIME-Version: 1.0
References: <1550124158-1111-1-git-send-email-xiaoxiang@xiaomi.com>
 <1550124158-1111-2-git-send-email-xiaoxiang@xiaomi.com> <20190214130940.GV9224@smile.fi.intel.com>
In-Reply-To: <20190214130940.GV9224@smile.fi.intel.com>
From: xiang xiao <xiaoxiang781216@gmail.com>
Date: Fri, 15 Feb 2019 00:31:17 +0800
Message-ID: <CAH2Cfb8UYMLpxb5DDPxf_C0umgPgLK8FBedhcNUcYQ_gLs2dFw@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] rpmsg: add syslog redirection driver
Content-Type: text/plain; charset="UTF-8"
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Greg KH <gregkh@linuxfoundation.org>, alexander.shishkin@linux.intel.com, Ohad Ben Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, wendy.liang@xilinx.com, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Kumar Gala <kumar.gala@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Guiding Li <liguiding@pinecone.net>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Feb 14, 2019 at 9:09 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Feb 14, 2019 at 02:02:38PM +0800, Xiang Xiao wrote:
> > From: Guiding Li <liguiding@pinecone.net>
> >
> > This driver allows the remote processor to redirect the output of
> > syslog or printf into the kernel log, which is very useful to see
> > what happen in the remote side.
>
> > +struct rpmsg_syslog_header {
> > +     u32                             command;
> > +     s32                             result;
> > +} __packed;
>
> Isn't packed already?
>

But, I want to make it more explicitly and prepare for struct expansion later.

> > +struct rpmsg_syslog_transfer {
> > +     struct rpmsg_syslog_header      header;
> > +     u32                             count;
> > +     char                            data[0];
> > +} __packed;
>
> Ditto.
>
> > +static int rpmsg_syslog_callback(struct rpmsg_device *rpdev,
> > +                              void *data, int len, void *priv_, u32 src)
> > +{
> > +     struct rpmsg_syslog *priv = dev_get_drvdata(&rpdev->dev);
> > +     struct rpmsg_syslog_transfer *msg = data;
> > +     struct rpmsg_syslog_transfer_done done;
> > +     unsigned int copied = msg->count;
> > +     unsigned int printed = 0;
> > +     const char *nl;
> > +
> > +     if (msg->header.command != RPMSG_SYSLOG_TRANSFER)
> > +             return -EINVAL;
> > +
> > +     /* output the message before '\n' to the kernel log */
> > +     nl = memrchr(msg->data, '\n', msg->count);
>
> Hmm... To me it sounds somehow fragile.
>
> If your text contains binary data, how can you guarantee that it would be not
> in the middle of two \n:s?

This driver is just for log/printf redirection, so we could safely
assume the data is pure text.
We have another rpmsg driver(rpmsg-tty) for binary data transfer.

> OTOH, if it text data, why do you need to take all strings at once?

Remote side may decide to buffer more log to reduce the IPC number
since IPC is a time consuming operation.

>  It might be worse from performance prospective (if you know how and when printk() supplies buffer to the console).

Yes, it's very slow if the log send to serial console. But in
production environment, printk normally just save in ram and viewed by
dmesg which is very fast.

>
> > +     if (nl) {
> > +             printed = nl + 1 - msg->data;
> > +             copied = msg->count - printed;
> > +
> > +             if (priv->next) {
> > +                     pr_info("%.*s%.*s", priv->next,
> > +                             priv->buf, printed, msg->data);
> > +                     priv->next = 0;
> > +             } else {
> > +                     pr_info("%.*s", printed, msg->data);
> > +             }
> > +     }
> > +
> > +     /* append the message after '\n' to the buffer */
>
> > +     if (copied != 0) {
>
>
>
> > +             unsigned int newsize = priv->next + copied;
> > +
> > +             if (newsize > priv->size) {
> > +                     char *newbuf;
> > +
> > +                     newbuf = krealloc(priv->buf, newsize, GFP_KERNEL);
> > +                     if (newbuf) {
> > +                             priv->buf  = newbuf;
> > +                             priv->size = newsize;
> > +                     } else {
> > +                             copied = priv->size - priv->next;
> > +                     }
> > +             }
> > +
>
> > +             strncpy(priv->buf + priv->next, msg->data + printed, copied);
>
> Hmm... shouldn't be memcpy()?

I use memcpy initially, but found that the unaligned exception happen randomly.
To avoid the cache issue, the IPC memory normally map as device memory, but
ARM just allow the alignment access to this type of memory.

>
> > +             priv->next += copied;
> > +     }
> > +
> > +     done.command = RPMSG_SYSLOG_TRANSFER_DONE;
> > +     done.result  = printed + copied;
> > +     return rpmsg_send(rpdev->ept, &done, sizeof(done));
> > +}
> > +
> > +static int rpmsg_syslog_probe(struct rpmsg_device *rpdev)
> > +{
> > +     struct rpmsg_syslog *priv;
> > +
> > +     priv = devm_kzalloc(&rpdev->dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     dev_set_drvdata(&rpdev->dev, priv);
> > +     return 0;
> > +}
> > +
> > +static void rpmsg_syslog_remove(struct rpmsg_device *rpdev)
> > +{
> > +     struct rpmsg_syslog *priv = dev_get_drvdata(&rpdev->dev);
> > +
>
> > +     /* flush the buffered log if need */
> > +     if (priv->next)
> > +             pr_info("%.*s\n", priv->next, priv->buf);
> > +     kfree(priv->buf);
>
> I don't see how it's serialized. Does rpmsg core take care of this?

Yes, the callback come from a dedicated work thread.

>
> > +}
>
> > +#ifdef CONFIG_PM_SLEEP
>
> You can consider to use __maybe_unused annotation to the below function.

Ok.

>
> > +static int rpmsg_syslog_dev_suspend(struct device *dev)
> > +{
>
> > +}
> > +
> > +static int rpmsg_syslog_dev_resume(struct device *dev)
> > +{
>
> > +}
> > +#endif
>
> > +static const struct rpmsg_device_id rpmsg_syslog_id_table[] = {
> > +     { .name = "rpmsg-syslog" },
> > +     { },
>
> Terminator better without comma.

Ok.

>
> > +};
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
