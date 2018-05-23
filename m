Return-Path: <vkoul@kernel.org>
Date: Wed, 23 May 2018 11:35:16 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [RFC PATCH 5/5] remoteproc: qcom: Introduce Hexagon V5 based
 WCSS driver
Message-ID: <20180523060516.GD20991@vkoul-mobl>
References: <20180523052054.19025-1-bjorn.andersson@linaro.org>
 <20180523052054.19025-6-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180523052054.19025-6-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Sricharan R <sricharan@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, Rohit kumar <rohitkr@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 22-05-18, 22:20, Bjorn Andersson wrote:

> +static int q6v5_wcss_reset(struct q6v5_wcss *wcss)
> +{
> +	int ret;
> +	u32 val;
> +	int i;
> +
> +	/* Assert resets, stop core */
> +	val = readl(wcss->reg_base + QDSP6SS_RESET_REG);
> +	val |= Q6SS_CORE_ARES | Q6SS_BUS_ARES_ENABLE | Q6SS_STOP_CORE;
> +	writel(val, wcss->reg_base + QDSP6SS_RESET_REG);
> +
> +	/* BHS require xo cbcr to be enabled */
> +	val = readl(wcss->reg_base + QDSP6SS_XO_CBCR);
> +	val |= 0x1;
> +	writel(val, wcss->reg_base + QDSP6SS_XO_CBCR);

As commented on previous patch, it would help IMO to add a modify() wrapper
here which would perform read, modify and write.

Looking at the patch, few other comments would be applicable too, so would be
great if you/Sricharan can update this

-- 
~Vinod
