Return-Path: <dianders@chromium.org>
Return-Path: <dianders@chromium.org>
MIME-Version: 1.0
References: <20181009222527.74260-1-briannorris@chromium.org>
In-Reply-To: <20181009222527.74260-1-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 9 Oct 2018 16:34:25 -0700
Message-ID: <CAD=FV=Vh4NWUS--dDU5N0b86ZoRd7kEj7Zuk5VCE=WkaRWp=tg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: qcom: q6v5: shore up resource probe handling
Content-Type: text/plain; charset="UTF-8"
To: Brian Norris <briannorris@chromium.org>
Cc: ohad@wizery.com, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, sibis@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

On Tue, Oct 9, 2018 at 3:33 PM Brian Norris <briannorris@chromium.org> wrote:
> +       if (q6v5->wdog_irq < 0) {
> +               if (q6v5->wdog_irq != -EPROBE_DEFER)
> +                       dev_err(&pdev->dev,
> +                               "failed to retrieve wdog IRQ: %d\n",
> +                               q6v5->wdog_irq);
> +               return q6v5->wdog_irq;
> +       }

optional: Since there's the same pattern 5 times here, I wonder if we
should abstract it out to a helper function that would print the
error?

...in the ideal case it would be somewhere that all Linux drivers
could use since this is a super common pattern, but that might be a
bit too much yak shaving...


> @@ -237,8 +260,13 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>         disable_irq(q6v5->handover_irq);
>
>         q6v5->stop_irq = platform_get_irq_byname(pdev, "stop-ack");
> -       if (q6v5->stop_irq == -EPROBE_DEFER)
> -               return -EPROBE_DEFER;
> +       if (q6v5->stop_irq < 0) {
> +               if (q6v5->stop_irq != -EPROBE_DEFER)
> +                       dev_err(&pdev->dev,
> +                               "failed to retrieve stop IRQ: %d\n",
> +                               q6v5->stop_irq);
> +               return q6v5->stop_irq;

Nitty nit that it's the "stop-ack" IRQ, not the "stop" IRQ.  The error
message below this one calls it stop-ack too so it would be ideal to
keep it consistent between the two error messages.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
