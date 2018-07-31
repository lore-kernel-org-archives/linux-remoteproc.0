Return-Path: <p.zabel@pengutronix.de>
Message-ID: <1533027423.3444.11.camel@pengutronix.de>
Subject: Re: [PATCH 3/4] remoteproc: qcom: q6v5-pil: Explicitly get
 mss_restart line
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 31 Jul 2018 10:57:03 +0200
In-Reply-To: <20180727152811.15258-3-sibis@codeaurora.org>
References: <20180727152811.15258-1-sibis@codeaurora.org>
	 <20180727152811.15258-3-sibis@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
To: Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ohad@wizery.com, mark.rutland@arm.com, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, 2018-07-27 at 20:58 +0530, Sibi Sankar wrote:
> Explicitly get mss_restart to facilitate adding PDC
> restart line for modem on SDM845 SoCs
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pil.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
> index b1296d614b8b..d57fdb34e3dd 100644
> --- a/drivers/remoteproc/qcom_q6v5_pil.c
> +++ b/drivers/remoteproc/qcom_q6v5_pil.c
> @@ -1176,8 +1176,7 @@ static int q6v5_init_clocks(struct device *dev, struct clk **clks,
>  
>  static int q6v5_init_reset(struct q6v5 *qproc)
>  {
> -	qproc->mss_restart = devm_reset_control_get_exclusive(qproc->dev,
> -							      NULL);
> +	qproc->mss_restart = devm_reset_control_get(qproc->dev, "mss_restart");

Please keep using devm_reset_control_get_exclusive.

regards
Philipp
