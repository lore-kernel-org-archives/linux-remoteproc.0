Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 5 May 2017 11:21:51 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 1/5] mailbox: Make startup and shutdown ops optional
Message-ID: <20170505182151.GF15143@minitux>
References: <20170504200539.27027-1-bjorn.andersson@linaro.org>
 <CABb+yY12=OksvgMeo+fT+R8m=_Lv+39EQwW0VGsnKuHRBM-5uw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABb+yY12=OksvgMeo+fT+R8m=_Lv+39EQwW0VGsnKuHRBM-5uw@mail.gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 05 May 03:33 PDT 2017, Jassi Brar wrote:

> On Fri, May 5, 2017 at 1:35 AM, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > Some mailbox hardware doesn't have to perform any additional operations
> > on startup of shutdown, so make these optional.
> >
> Thanks, makes sense.
> 

Thanks

> > diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> > index 4671f8a12872..c88de953394a 100644
> > --- a/drivers/mailbox/mailbox.c
> > +++ b/drivers/mailbox/mailbox.c
> > @@ -137,6 +137,20 @@ static enum hrtimer_restart txdone_hrtimer(struct hrtimer *hrtimer)
> >         return HRTIMER_NORESTART;
> >  }
> >
> > +static int mbox_startup(struct mbox_chan *chan)
> > +{
> > +       if (chan->mbox->ops->startup)
> > +               return chan->mbox->ops->startup(chan);
> > +
> > +       return 0;
> > +}
> > +
> > +static void mbox_shutdown(struct mbox_chan *chan)
> > +{
> > +       if (chan->mbox->ops->shutdown)
> > +               chan->mbox->ops->shutdown(chan);
> > +}
> > +
> These functions are going to be called from exactly one place. So
> maybe we simply do the check before startup/shutdown calls?
> 

I didn't want to add another indentation level at the bottom of
mbox_request_channel(), but now that I check again it still would stay
below 80 chars and doesn't look too unreasonable.

The shutdown() was moved out just to get some symmetry.

I'll inline the two checks and resend this together with the driver,
once we have concluded on your question/comment there.

Regards,
Bjorn
