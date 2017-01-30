Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 30 Jan 2017 13:46:57 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 2/4] remoteproc: qcom: Add additional agree2_clk and
 px regulator resource.
Message-ID: <20170130214657.GB31134@builder>
References: <1485788589-21968-1-git-send-email-akdwived@codeaurora.org>
 <1485788589-21968-3-git-send-email-akdwived@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1485788589-21968-3-git-send-email-akdwived@codeaurora.org>
To: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 30 Jan 07:03 PST 2017, Avaneesh Kumar Dwivedi wrote:

> This patch add additional clock and regulator resource which are
> initialized based on compatible and has no impact on existing driver
> working. This resourse addition enable the existing driver to handle.
> low pass sensor processor device also.
> 
> Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>

Applied, with below modification.

> ---
>  drivers/remoteproc/qcom_adsp_pil.c | 43 +++++++++++++++++++++++++++++++-------
>  1 file changed, 36 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_adsp_pil.c b/drivers/remoteproc/qcom_adsp_pil.c
[..]
>  static int adsp_init_regulator(struct qcom_adsp *adsp)
>  {
> -	adsp->cx_supply = devm_regulator_get(adsp->dev, "cx");
> +	adsp->cx_supply = devm_regulator_get(adsp->dev, "vdd_cx");

We should not change the name of devicetree properties, so I dropped
"vdd_" on both of these.

>  	if (IS_ERR(adsp->cx_supply))
>  		return PTR_ERR(adsp->cx_supply);
>  
>  	regulator_set_load(adsp->cx_supply, 100000);
>  
> +	adsp->px_supply = devm_regulator_get(adsp->dev, "vdd_px");
> +	if (IS_ERR(adsp->px_supply))
> +		return PTR_ERR(adsp->px_supply);

Regards,
Bjorn
