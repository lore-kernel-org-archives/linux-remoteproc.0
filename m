Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Wed, 8 Jan 2020 13:24:18 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH] remoteproc: qcom: wcnss: Allow specifying firmware-name
Message-ID: <20200108202418.GA28145@xps15>
References: <20200108055252.639791-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108055252.639791-1-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

On Tue, Jan 07, 2020 at 09:52:52PM -0800, Bjorn Andersson wrote:
> Introduce a firmware-name property, in order to be able to support
> device/platform specific firmware for the wireless connectivity
> subsystem; in line with other Qualcomm remoteproc drivers.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,wcnss-pil.txt     | 6 ++++++
>  drivers/remoteproc/qcom_wcnss.c                           | 8 +++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
> index d420f84ddfb0..00844a5d2ccf 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
> @@ -34,6 +34,12 @@ on the Qualcomm WCNSS core.
>  	Definition: should be "wdog", "fatal", optionally followed by "ready",
>  		    "handover", "stop-ack"
>  
> +- firmware-name:
> +	Usage: optional
> +	Value type: <string>
> +	Definition: must list the relative firmware image path for the
> +		    WCNSS core.

Perhaps mention that if omitted the firmware name will default to "wcnss.mdt".

> +
>  - vddmx-supply:
>  - vddcx-supply:
>  - vddpx-supply:
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index dc135754bb9c..a0468b3cc76f 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -457,6 +457,7 @@ static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
>  
>  static int wcnss_probe(struct platform_device *pdev)
>  {
> +	const char *fw_name = WCNSS_FIRMWARE_NAME;
>  	const struct wcnss_data *data;
>  	struct qcom_wcnss *wcnss;
>  	struct resource *res;
> @@ -474,8 +475,13 @@ static int wcnss_probe(struct platform_device *pdev)
>  		return -ENXIO;
>  	}
>  
> +	ret = of_property_read_string(pdev->dev.of_node, "firmware-name",
> +				      &fw_name);
> +	if (ret < 0 && ret != -EINVAL)
> +		return ret;
> +
>  	rproc = rproc_alloc(&pdev->dev, pdev->name, &wcnss_ops,
> -			    WCNSS_FIRMWARE_NAME, sizeof(*wcnss));
> +			    fw_name, sizeof(*wcnss));
>  	if (!rproc) {
>  		dev_err(&pdev->dev, "unable to allocate remoteproc\n");
>  		return -ENOMEM;

That is in line with what was done for q6v5_mss and q6v5_pas.  With or without
the above:

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> -- 
> 2.24.0
> 
