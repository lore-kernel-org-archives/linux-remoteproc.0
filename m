Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 22 Dec 2016 13:46:12 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 3/7] remoteproc: qcom: Add and initialize proxy and
 active regulators.
Message-ID: <20161222214612.GB10519@minitux>
References: <1481804490-8583-1-git-send-email-akdwived@codeaurora.org>
 <1481804490-8583-4-git-send-email-akdwived@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481804490-8583-4-git-send-email-akdwived@codeaurora.org>
To: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 15 Dec 04:21 PST 2016, Avaneesh Kumar Dwivedi wrote:

> -static int q6v5_regulator_init(struct q6v5 *qproc)
> +static int q6v5_regulator_init(struct device *dev, struct reg_info *regs,
> +				const struct qcom_mss_reg_res *reg_res)
>  {
> -	int ret;
> +	int count = 0;
> +	int rc;
> +	int i;
>  
> -	qproc->supply[Q6V5_SUPPLY_CX].supply = "cx";
> -	qproc->supply[Q6V5_SUPPLY_MX].supply = "mx";
> -	qproc->supply[Q6V5_SUPPLY_MSS].supply = "mss";
> -	qproc->supply[Q6V5_SUPPLY_PLL].supply = "pll";
> +	while (reg_res[count].supply)
> +	count++;
>  
> -	ret = devm_regulator_bulk_get(qproc->dev,
> -				      ARRAY_SIZE(qproc->supply), qproc->supply);
> -	if (ret < 0) {
> -		dev_err(qproc->dev, "failed to get supplies\n");
> -		return ret;
> -	}
> +	for (i = 0; i < count; i++) {

As with the clock init you can squash these two loops into one now.

[..]
>  static const struct rproc_hexagon_res msm8916_mss = {
>  	.hexagon_mba_image = "mba.mbn",
> +	.proxy_supply = (struct qcom_mss_reg_res[]) {
> +		{
> +			.supply = "mx",
> +			.uV = 1050000,
> +		},
> +		{
> +			.supply = "cx",
> +			.uA = 100000,
> +		},
> +		{
> +			.supply = "pll",
> +			.uA = 100000,
> +		},
> +		{ NULL }

It's idiomatic to use {} instead of { NULL }, so please update this (but
not in the clock patch).

As with the clock patch, please squash patch 4 into this one - so that
we have regulators before and after applying this single patch.

Regards,
Bjorn
