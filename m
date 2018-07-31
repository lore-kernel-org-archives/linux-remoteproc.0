Return-Path: <p.zabel@pengutronix.de>
Message-ID: <1533027272.3444.9.camel@pengutronix.de>
Subject: Re: [PATCH 4/4] remoteproc: qcom: q6v5-pil: Add PDC restart for
 modem on SDM845 SoCs
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 31 Jul 2018 10:54:32 +0200
In-Reply-To: <20180727152811.15258-4-sibis@codeaurora.org>
References: <20180727152811.15258-1-sibis@codeaurora.org>
	 <20180727152811.15258-4-sibis@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
To: Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ohad@wizery.com, mark.rutland@arm.com, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, 2018-07-27 at 20:58 +0530, Sibi Sankar wrote:
> In the presence of a PDC block working with subsystem RSC,
> assert/deassert PDC restart in modem start/stop path.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../bindings/remoteproc/qcom,q6v5.txt         |  4 +++
>  drivers/remoteproc/qcom_q6v5_pil.c            | 27 ++++++++++++++++---
>  2 files changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> index 601dd9f389aa..124fb1dc6fb8 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
[...]
> @@ -1182,6 +1192,15 @@ static int q6v5_init_reset(struct q6v5 *qproc)
>  		return PTR_ERR(qproc->mss_restart);
>  	}
>  
> +	if (qproc->has_alt_reset) {
> +		qproc->pdc_restart = devm_reset_control_get(qproc->dev,
> +							    "pdc_restart");

Please use devm_reset_control_get_exclusive() instead.

> +		if (IS_ERR(qproc->pdc_restart)) {
> +			dev_err(qproc->dev, "failed to acquire pdc restart\n");
> +			return PTR_ERR(qproc->pdc_restart);
> +		}
> +	}
> +
>  	return 0;
>  }

regards
Philipp
