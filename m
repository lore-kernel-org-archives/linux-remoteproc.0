Return-Path: <andriy.shevchenko@linux.intel.com>
Date: Fri, 15 Feb 2019 17:06:20 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH V2 2/2] rpmsg: add syslog redirection driver
Message-ID: <20190215150620.GB9224@smile.fi.intel.com>
References: <1550124158-1111-1-git-send-email-xiaoxiang@xiaomi.com>
 <1550124158-1111-2-git-send-email-xiaoxiang@xiaomi.com>
 <20190214130940.GV9224@smile.fi.intel.com>
 <CAH2Cfb8UYMLpxb5DDPxf_C0umgPgLK8FBedhcNUcYQ_gLs2dFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH2Cfb8UYMLpxb5DDPxf_C0umgPgLK8FBedhcNUcYQ_gLs2dFw@mail.gmail.com>
To: xiang xiao <xiaoxiang781216@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Greg KH <gregkh@linuxfoundation.org>, alexander.shishkin@linux.intel.com, Ohad Ben Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, wendy.liang@xilinx.com, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Kumar Gala <kumar.gala@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Guiding Li <liguiding@pinecone.net>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Feb 15, 2019 at 12:31:17AM +0800, xiang xiao wrote:
> On Thu, Feb 14, 2019 at 9:09 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Feb 14, 2019 at 02:02:38PM +0800, Xiang Xiao wrote:

> > > This driver allows the remote processor to redirect the output of
> > > syslog or printf into the kernel log, which is very useful to see
> > > what happen in the remote side.
> >
> > > +struct rpmsg_syslog_header {
> > > +     u32                             command;
> > > +     s32                             result;
> > > +} __packed;
> >
> > Isn't packed already?
> >
> 
> But, I want to make it more explicitly and prepare for struct expansion later.

How? Why it's not in this patch / patch series?

> > > +     /* output the message before '\n' to the kernel log */
> > > +     nl = memrchr(msg->data, '\n', msg->count);
> >
> > Hmm... To me it sounds somehow fragile.
> >
> > If your text contains binary data, how can you guarantee that it would be not
> > in the middle of two \n:s?
> 
> This driver is just for log/printf redirection, so we could safely
> assume the data is pure text.

Then I don't see a point to use memrchr() at all here.

Use strchr or strrchr().

> > OTOH, if it text data, why do you need to take all strings at once?
> 
> Remote side may decide to buffer more log to reduce the IPC number
> since IPC is a time consuming operation.

So, you always can do something like

p = msg->data;
while (...strsep(..., "\n")) {
	pr_info("%s\n", token);
	...
}

> 
> >  It might be worse from performance prospective (if you know how and when printk() supplies buffer to the console).
> 
> Yes, it's very slow if the log send to serial console. But in
> production environment, printk normally just save in ram and viewed by
> dmesg which is very fast.

You may not do such assumptions. For someone it would be RAM, for some
customers it might be a slow channel.


> > > +             strncpy(priv->buf + priv->next, msg->data + printed, copied);
> >
> > Hmm... shouldn't be memcpy()?
> 
> I use memcpy initially, but found that the unaligned exception happen randomly.
> To avoid the cache issue, the IPC memory normally map as device memory, but
> ARM just allow the alignment access to this type of memory.

So, than it's an architecture level issue. With strncpy() here you will get a
pretty rightful GCC warning.

> > > +     /* flush the buffered log if need */
> > > +     if (priv->next)
> > > +             pr_info("%.*s\n", priv->next, priv->buf);
> > > +     kfree(priv->buf);
> >
> > I don't see how it's serialized. Does rpmsg core take care of this?
> 
> Yes, the callback come from a dedicated work thread.

Please, add a comment explaining that.

-- 
With Best Regards,
Andy Shevchenko
