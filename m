Return-Path: <sboyd@codeaurora.org>
Date: Wed, 28 Dec 2016 15:38:43 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v5 3/7] remoteproc: qcom: Add and initialize proxy and
 active regulators.
Message-ID: <20161228233843.GF17126@codeaurora.org>
References: <1481804490-8583-1-git-send-email-akdwived@codeaurora.org>
 <1481804490-8583-4-git-send-email-akdwived@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481804490-8583-4-git-send-email-akdwived@codeaurora.org>
To: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc: bjorn.andersson@linaro.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 12/15, Avaneesh Kumar Dwivedi wrote:
> @@ -148,29 +167,34 @@ enum {
>  	Q6V5_SUPPLY_PLL,
>  };
>  
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

Indent that count++ please.


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
