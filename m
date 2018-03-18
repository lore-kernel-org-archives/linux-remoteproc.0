Return-Path: <bjorn.andersson@linaro.org>
Date: Sun, 18 Mar 2018 15:45:37 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 4/7] mailbox: Add support for Qualcomm SDM845 SoCs
Message-ID: <20180318224537.GF5626@tuxbook-pro>
References: <1521019283-32212-1-git-send-email-sibis@codeaurora.org>
 <1521019283-32212-5-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521019283-32212-5-git-send-email-sibis@codeaurora.org>
To: Sibi S <sibis@codeaurora.org>
Cc: p.zabel@pengutronix.de, robh+dt@kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, georgi.djakov@linaro.org, jassisinghbrar@gmail.com, ohad@wizery.com, mark.rutland@arm.com, kyan@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 14 Mar 02:21 PDT 2018, Sibi S wrote:

> Add the corresponding APCS offset for SDM845 SoC
> 

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Sibi S <sibis@codeaurora.org>
> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index 57bde0d..62d704d 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -125,6 +125,7 @@ static int qcom_apcs_ipc_remove(struct platform_device *pdev)
>  static const struct of_device_id qcom_apcs_ipc_of_match[] = {
>  	{ .compatible = "qcom,msm8916-apcs-kpss-global", .data = (void *)8 },
>  	{ .compatible = "qcom,msm8996-apcs-hmss-global", .data = (void *)16 },
> +	{ .compatible = "qcom,sdm845-apcs-hmss-global", .data = (void *)12 },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, qcom_apcs_ipc_of_match);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
