Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 9 Oct 2018 23:19:20 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: qcom: q6v5: shore up resource probe handling
Message-ID: <20181010061920.GS12063@builder>
References: <20181009222527.74260-1-briannorris@chromium.org>
 <CAD=FV=Vh4NWUS--dDU5N0b86ZoRd7kEj7Zuk5VCE=WkaRWp=tg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=Vh4NWUS--dDU5N0b86ZoRd7kEj7Zuk5VCE=WkaRWp=tg@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Brian Norris <briannorris@chromium.org>, ohad@wizery.com, linux-remoteproc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, sibis@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 09 Oct 16:34 PDT 2018, Doug Anderson wrote:

> Hi,
> 
> On Tue, Oct 9, 2018 at 3:33 PM Brian Norris <briannorris@chromium.org> wrote:
> > +       if (q6v5->wdog_irq < 0) {
> > +               if (q6v5->wdog_irq != -EPROBE_DEFER)
> > +                       dev_err(&pdev->dev,
> > +                               "failed to retrieve wdog IRQ: %d\n",
> > +                               q6v5->wdog_irq);
> > +               return q6v5->wdog_irq;
> > +       }
> 
> optional: Since there's the same pattern 5 times here, I wonder if we
> should abstract it out to a helper function that would print the
> error?
> 

Before breaking this code out to a common function shared between the
various q6v5 drivers this was a separate helper function, but that
wasn't pretty either :/

> ...in the ideal case it would be somewhere that all Linux drivers
> could use since this is a super common pattern, but that might be a
> bit too much yak shaving...
> 

Yeah I agree, it would be a nice helper but there's a bunch of variants
involved. I've added it on the "someday/maybe" list.

> 
> > @@ -237,8 +260,13 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
> >         disable_irq(q6v5->handover_irq);
> >
> >         q6v5->stop_irq = platform_get_irq_byname(pdev, "stop-ack");
> > -       if (q6v5->stop_irq == -EPROBE_DEFER)
> > -               return -EPROBE_DEFER;
> > +       if (q6v5->stop_irq < 0) {
> > +               if (q6v5->stop_irq != -EPROBE_DEFER)
> > +                       dev_err(&pdev->dev,
> > +                               "failed to retrieve stop IRQ: %d\n",
> > +                               q6v5->stop_irq);
> > +               return q6v5->stop_irq;
> 
> Nitty nit that it's the "stop-ack" IRQ, not the "stop" IRQ.  The error
> message below this one calls it stop-ack too so it would be ideal to
> keep it consistent between the two error messages.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

I applied the patch with the nit fixed and your r-b.

Thanks,
Bjorn
