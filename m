Return-Path: <jassisinghbrar@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170504200539.27027-1-bjorn.andersson@linaro.org>
References: <20170504200539.27027-1-bjorn.andersson@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 5 May 2017 16:03:31 +0530
Message-ID: <CABb+yY12=OksvgMeo+fT+R8m=_Lv+39EQwW0VGsnKuHRBM-5uw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] mailbox: Make startup and shutdown ops optional
Content-Type: text/plain; charset=UTF-8
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, May 5, 2017 at 1:35 AM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> Some mailbox hardware doesn't have to perform any additional operations
> on startup of shutdown, so make these optional.
>
Thanks, makes sense.

> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index 4671f8a12872..c88de953394a 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -137,6 +137,20 @@ static enum hrtimer_restart txdone_hrtimer(struct hrtimer *hrtimer)
>         return HRTIMER_NORESTART;
>  }
>
> +static int mbox_startup(struct mbox_chan *chan)
> +{
> +       if (chan->mbox->ops->startup)
> +               return chan->mbox->ops->startup(chan);
> +
> +       return 0;
> +}
> +
> +static void mbox_shutdown(struct mbox_chan *chan)
> +{
> +       if (chan->mbox->ops->shutdown)
> +               chan->mbox->ops->shutdown(chan);
> +}
> +
These functions are going to be called from exactly one place. So
maybe we simply do the check before startup/shutdown calls?

thanks.
