Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 5 May 2017 11:37:29 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 3/5] soc: qcom: Introduce APCS IPC driver
Message-ID: <20170505183729.GG15143@minitux>
References: <20170504200539.27027-1-bjorn.andersson@linaro.org>
 <20170504200539.27027-3-bjorn.andersson@linaro.org>
 <CABb+yY2P=qPTYB6PDkjV82Qc67Xzer40BHRsOQP2m-gM3eK_UA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABb+yY2P=qPTYB6PDkjV82Qc67Xzer40BHRsOQP2m-gM3eK_UA@mail.gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 05 May 03:26 PDT 2017, Jassi Brar wrote:

> On Fri, May 5, 2017 at 1:35 AM, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> 
> > +
> > +static int qcom_apcs_ipc_send_data(struct mbox_chan *chan, void *data)
> > +{
> > +       struct qcom_apcs_ipc *apcs = container_of(chan->mbox,
> > +                                                 struct qcom_apcs_ipc, mbox);
> > +       unsigned long idx = (unsigned long)chan->con_priv;
> > +
> > +       writel(BIT(idx), apcs->base + apcs->offset);
> > +
> When/how does this bit get ever cleared again?
> You may want to add last_tx_done() callback to check if this bit is
> cleared before you can send the next interrupt. And set
> txdone_poll/irq accordingly.
> 

It's a write-only register, writing a bit fires off an edge triggered
interrupt on the specific remote processor, which will ack the
associated IRQ status and handle the interrupt.

As the "message" is just a notification to the other side that it needs
to act on "something", there's no harm in notifying it multiple times
before it has a chance to ack the IRQ and a write after that will be
seen as a separate interrupt.

Regards,
Bjorn
