Return-Path: <sboyd@codeaurora.org>
Date: Wed, 9 Nov 2016 17:52:51 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 1/3] firmware: qcom: scm: add a video command for
 state setting
Message-ID: <20161110015251.GC16026@codeaurora.org>
References: <1478539853-23218-1-git-send-email-stanimir.varbanov@linaro.org>
 <1478539853-23218-2-git-send-email-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1478539853-23218-2-git-send-email-stanimir.varbanov@linaro.org>
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 11/07, Stanimir Varbanov wrote:
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index d95c70227c05..7e364691a87c 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -320,6 +320,22 @@ bool qcom_scm_is_available(void)
>  }
>  EXPORT_SYMBOL(qcom_scm_is_available);
>  
> +int qcom_scm_video_set_state(u32 state, u32 spare)
> +{
> +	int ret;
> +
> +	ret = qcom_scm_clk_enable();

Do we need clk control for this? Usually it's only required for
crypto engine things, and turning on video doesn't sound like it
uses crypto. I don't think downstream android kernel does this.

> +	if (ret)
> +		return ret;
> +
> +	ret = __qcom_scm_video_set_state(__scm->dev, state, spare);
> +
> +	qcom_scm_clk_disable();
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(qcom_scm_video_set_state);
> +
>  static int qcom_scm_probe(struct platform_device *pdev)
>  {
>  	struct qcom_scm *scm;

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
