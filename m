Return-Path: <mathieu.poirier@linaro.org>
MIME-Version: 1.0
References: <20200304142628.8471-1-NShubin@topcon.com>
In-Reply-To: <20200304142628.8471-1-NShubin@topcon.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 5 Mar 2020 09:16:51 -0700
Message-ID: <CANLsYkzPROdphvmtpZ6YiajZ2dYLrojC-rGYkq4jK2yzTnAJ5A@mail.gmail.com>
Subject: Re: [PATCH 1/2] remoteproc: imx_rproc: dummy kick method
Content-Type: text/plain; charset="UTF-8"
To: Nikita Shubin <NShubin@topcon.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-remoteproc <linux-remoteproc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, 4 Mar 2020 at 07:25, Nikita Shubin <NShubin@topcon.com> wrote:
>
> add kick method that does nothing, to avoid errors in rproc_virtio_notify.
>
> Signed-off-by: Nikita Shubin <NShubin@topcon.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 3e72b6f38d4b..796b6b86550a 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -240,9 +240,15 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
>         return va;
>  }
>
> +static void imx_rproc_kick(struct rproc *rproc, int vqid)
> +{
> +
> +}
> +

If rproc::kick() is empty, how does the MCU know there is packets to
fetch in the virtio queues?

>  static const struct rproc_ops imx_rproc_ops = {
>         .start          = imx_rproc_start,
>         .stop           = imx_rproc_stop,
> +       .kick           = imx_rproc_kick,
>         .da_to_va       = imx_rproc_da_to_va,
>  };
>
> --
> 2.24.1
>
