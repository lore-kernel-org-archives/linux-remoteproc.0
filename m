Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH] remoteproc: Populate hardcoded param using driver data
References: <1538215641-25665-1-git-send-email-govinds@codeaurora.org>
From: Suman Anna <s-anna@ti.com>
Message-ID: <71b4b413-b961-81f0-496e-66e9c6852995@ti.com>
Date: Mon, 1 Oct 2018 15:34:42 -0500
MIME-Version: 1.0
In-Reply-To: <1538215641-25665-1-git-send-email-govinds@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Govind Singh <govinds@codeaurora.org>, bjorn.andersson@linaro.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, sricharan@codeaurora.org, sibis@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Govind,

On 09/29/2018 05:07 AM, Govind Singh wrote:
> Q6 based WiFi fw loading is supported across
> different targets, ex: IPQ8074/QCS404. In order to
> support different fw names/pas id etc, populate
> hardcoded param using driver data.

The patch title suggests a core remoteproc change, but the change is
platform-specific. Can you fix up the title accordingly?

> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_wcss.c | 36 ++++++++++++++++++++++++++++++++----
>  1 file changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
> index f93e1e4..839b7bf 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -8,6 +8,7 @@
>  #include <linux/kernel.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
> +#include <linux/of_device.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> @@ -16,7 +17,6 @@
>  #include "qcom_common.h"
>  #include "qcom_q6v5.h"
>  
> -#define WCSS_CRASH_REASON		421

You can still use the macro as is even in the new data structure.

>  
>  /* Q6SS Register Offsets */
>  #define Q6SS_RESET_REG		0x014
> @@ -70,6 +70,14 @@
>  #define TCSR_WCSS_CLK_MASK	0x1F
>  #define TCSR_WCSS_CLK_ENABLE	0x14
>  
> +struct wcss_data {
> +	void (*pas_handover)(struct qcom_q6v5 *q6v5);
> +	const char *firmware_name;
> +	int crash_reason_smem;
> +	int version;
> +	int pas_id;
> +};
> +
>  struct q6v5_wcss {
>  	struct device *dev;
>  
> @@ -91,6 +99,10 @@ struct q6v5_wcss {
>  	phys_addr_t mem_reloc;
>  	void *mem_region;
>  	size_t mem_size;
> +
> +	int crash_reason_smem;
> +	int pas_id;
> +	int version;
>  };
>  
>  static int q6v5_wcss_reset(struct q6v5_wcss *wcss)
> @@ -527,12 +539,17 @@ static int q6v5_alloc_memory_region(struct q6v5_wcss *wcss)
>  
>  static int q6v5_wcss_probe(struct platform_device *pdev)
>  {
> +	const struct wcss_data *desc;
>  	struct q6v5_wcss *wcss;
>  	struct rproc *rproc;
>  	int ret;
>  
> +	desc = of_device_get_match_data(&pdev->dev);
> +	if (!desc)
> +		return -EINVAL;
> +

You may want to check for NULL firmware name as well before invoking
rproc_alloc.

>  	rproc = rproc_alloc(&pdev->dev, pdev->name, &q6v5_wcss_ops,
> -			    "IPQ8074/q6_fw.mdt", sizeof(*wcss));
> +			    desc->firmware_name, sizeof(*wcss));
>  	if (!rproc) {
>  		dev_err(&pdev->dev, "failed to allocate rproc\n");
>  		return -ENOMEM;
> @@ -540,6 +557,9 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
>  
>  	wcss = rproc->priv;
>  	wcss->dev = &pdev->dev;
> +	wcss->pas_id = desc->pas_id;
> +	wcss->version = desc->version;
> +	wcss->crash_reason_smem = desc->crash_reason_smem;
>  
>  	ret = q6v5_wcss_init_mmio(wcss, pdev);
>  	if (ret)
> @@ -553,7 +573,8 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto free_rproc;
>  
> -	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, WCSS_CRASH_REASON, NULL);
> +	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, desc->crash_reason_smem,
> +			     desc->pas_handover);
>  	if (ret)
>  		goto free_rproc;
>  
> @@ -581,8 +602,15 @@ static int q6v5_wcss_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct wcss_data wcss_ipq8074_res_init = {
> +		.firmware_name = "IPQ8074/q6_fw.mdt",
> +		.crash_reason_smem = 421,
> +		.pas_handover = NULL,
> +};
> +
>  static const struct of_device_id q6v5_wcss_of_match[] = {
> -	{ .compatible = "qcom,ipq8074-wcss-pil" },
> +	{ .compatible = "ipq8074-wcss-pil", .data = &wcss_ipq8074_res_init },

Why is your compatible changing?

regards
Suman

> +
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, q6v5_wcss_of_match);
> 
