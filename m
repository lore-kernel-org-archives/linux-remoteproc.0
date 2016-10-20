Return-Path: <sboyd@codeaurora.org>
Date: Thu, 20 Oct 2016 16:54:01 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] remoteproc: Add support for xo clock
Message-ID: <20161020235401.GG26139@codeaurora.org>
References: <1476989724-7464-1-git-send-email-spjoshi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1476989724-7464-1-git-send-email-spjoshi@codeaurora.org>
To: Sarangdhar Joshi <spjoshi@codeaurora.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Trilok Soni <tsoni@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On 10/20, Sarangdhar Joshi wrote:
> Add xo clock support required for Qualcomm ADSP
> Peripheral Image Loader.

Yes but why is xo needed?

> @@ -223,6 +232,17 @@ static irqreturn_t adsp_stop_ack_interrupt(int irq, void *dev)
>  	return IRQ_HANDLED;
>  }
>  
> +static int adsp_init_clock(struct qcom_adsp *adsp)
> +{
> +	adsp->xo = devm_clk_get(adsp->dev, "xo");
> +	if (IS_ERR(adsp->xo)) {
> +		dev_err(adsp->dev, "failed to get xo clock");

What if it's a probe defer error? Probably best to just be
silent/debug level, or we need a specific test for EPROBE_DEFER
and then silence in that case.

> +		return PTR_ERR(adsp->xo);
> +	}

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
