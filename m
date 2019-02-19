Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 18 Feb 2019 23:02:50 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 5/8] remoteproc: qcom: wcss: populate hardcoded param
 using driver data
Message-ID: <20190219070250.GG13018@tuxbook-pro>
References: <20190202152626.1006-1-govinds@codeaurora.org>
 <20190202152626.1006-6-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190202152626.1006-6-govinds@codeaurora.org>
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-remoteproc@vger.kernel.org, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Sat 02 Feb 07:26 PST 2019, Govind Singh wrote:

> Q6 based WiFi fw loading is supported across
> different targets, ex: IPQ8074/QCS404. In order to
> support different fw names/pas id etc, populate
> hardcoded param using driver data.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_wcss.c | 35 ++++++++++++++++++++++++-----
>  1 file changed, 29 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
> index f93e1e4a1cc0..f18b55227805 100644
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
>  

After this series you two compatibles, both specifying 421 as the
crash-reason SMEM item. So it's fine to just leave this as a define
until that's not the case.

[..]
> @@ -581,8 +598,14 @@ static int q6v5_wcss_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct wcss_data wcss_ipq8074_res_init = {
> +	.firmware_name = "IPQ8074/q6_fw.mdt",
> +	.crash_reason_smem = 421,

Fill out "version"

> +};
> +
>  static const struct of_device_id q6v5_wcss_of_match[] = {
> -	{ .compatible = "qcom,ipq8074-wcss-pil" },
> +	{ .compatible = "qcom,ipq8074-wcss-pil", .data = &wcss_ipq8074_res_init },
> +
>  	{ },
>  };

Regards,
Bjorn
