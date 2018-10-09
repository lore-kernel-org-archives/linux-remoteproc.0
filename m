Return-Path: <briannorris@chromium.org>
Return-Path: <briannorris@chromium.org>
MIME-Version: 1.0
References: <20181009222527.74260-1-briannorris@chromium.org> <CAD=FV=Vh4NWUS--dDU5N0b86ZoRd7kEj7Zuk5VCE=WkaRWp=tg@mail.gmail.com>
In-Reply-To: <CAD=FV=Vh4NWUS--dDU5N0b86ZoRd7kEj7Zuk5VCE=WkaRWp=tg@mail.gmail.com>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 9 Oct 2018 16:48:31 -0700
Message-ID: <CA+ASDXP5iBWgX1K3=QHke4ZoqO72hLk6Q09=cP3X-esrTOhk+w@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: qcom: q6v5: shore up resource probe handling
Content-Type: text/plain; charset="UTF-8"
To: Doug Anderson <dianders@chromium.org>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, sibis@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Oct 9, 2018 at 4:34 PM Doug Anderson <dianders@chromium.org> wrote:
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

I'll leave that up to Bjorn. I don't personally care to do this, but I
also acknowledge that there are a bunch of drivers that do this wrong.

> ...in the ideal case it would be somewhere that all Linux drivers
> could use since this is a super common pattern, but that might be a
> bit too much yak shaving...

Yeah, I'll pass on shaving that yak.

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

Ack. I thought I double checked on comparing the error messages.

Bjorn already has this on his radar, so I'll let him decide if he
wants other changes, or if he wants to make his own transformations
before applying it.

> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks,
Brian
