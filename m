Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 5 Oct 2018 23:30:33 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: Populate hardcoded param using driver data
Message-ID: <20181006063033.GG12063@builder>
References: <1538215641-25665-1-git-send-email-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1538215641-25665-1-git-send-email-govinds@codeaurora.org>
To: Govind Singh <govinds@codeaurora.org>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, sricharan@codeaurora.org, sibis@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Sat 29 Sep 03:07 PDT 2018, Govind Singh wrote:

> Q6 based WiFi fw loading is supported across
> different targets, ex: IPQ8074/QCS404. In order to
> support different fw names/pas id etc, populate
> hardcoded param using driver data.
> 

This patch prepares the driver for the introduction of some variation of
some of the given parameters. Please submit this patch together with the
patch introducing that new code.

> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
[..]
> +static const struct wcss_data wcss_ipq8074_res_init = {
> +		.firmware_name = "IPQ8074/q6_fw.mdt",
> +		.crash_reason_smem = 421,
> +		.pas_handover = NULL,

Please don't inherit my broken indentation from the adsp driver ;)

> +};
> +
>  static const struct of_device_id q6v5_wcss_of_match[] = {
> -	{ .compatible = "qcom,ipq8074-wcss-pil" },
> +	{ .compatible = "ipq8074-wcss-pil", .data = &wcss_ipq8074_res_init },

You lost qcom, in the compatible here.

> +

Regards,
Bjorn
