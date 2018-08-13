Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH] remoteproc/davinci: Mark error recovery as disabled
References: <20180723232757.9147-1-s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <0550997f-8e32-fb56-2a70-74235b969ce2@ti.com>
Date: Mon, 13 Aug 2018 10:11:51 -0500
MIME-Version: 1.0
In-Reply-To: <20180723232757.9147-1-s-anna@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

On 07/23/2018 06:27 PM, Suman Anna wrote:
> The Davinci remoteproc driver does not support error recovery at
> present, so mark the corresponding remoteproc flag appropriately
> so that the debugfs flag shows the value as 'disabled' by default.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>

Can you pick up this minor patch for 4.19 please, I do not see this in
your rproc-next branch?

Thanks,
Suman

> ---
>  drivers/remoteproc/da8xx_remoteproc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
> index b668e32996e2..53160d5ed543 100644
> --- a/drivers/remoteproc/da8xx_remoteproc.c
> +++ b/drivers/remoteproc/da8xx_remoteproc.c
> @@ -284,6 +284,9 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
>  		goto free_mem;
>  	}
>  
> +	/* error recovery is not supported at present */
> +	rproc->recovery_disabled = true;
> +
>  	drproc = rproc->priv;
>  	drproc->rproc = rproc;
>  	drproc->dsp_clk = dsp_clk;
> 
