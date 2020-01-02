Date: Thu, 2 Jan 2020 12:58:01 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 3/3] soc: qcom: apr: Add avs/audio tracking
 functionality
Message-ID: <20200102205757.GH988120@minitux>
References: <20191230050008.8143-1-sibis@codeaurora.org>
 <20191230050008.8143-4-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191230050008.8143-4-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, tsoni@codeaurora.org, agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Sun 29 Dec 21:00 PST 2019, Sibi Sankar wrote:
> diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
[..]
> -static void of_register_apr_devices(struct device *dev)
> +static void of_apr_add_pd_lookups(struct device *dev)
>  {
> +	const char *service_name, *service_path;
>  	struct apr *apr = dev_get_drvdata(dev);
>  	struct device_node *node;
> +	int ret;
> +
> +	for_each_child_of_node(dev->of_node, node) {
> +		ret = of_property_read_string_index(node, "qcom,protection-domain",
> +						    0, &service_name);
> +		if (ret < 0)
> +			continue;

While this implies that the qcom,protection-domain property is
missing...

> +
> +		ret = of_property_read_string_index(node, "qcom,protection-domain",
> +						    1, &service_path);
> +		if (ret < 0)
> +			continue;

...this would imply that it's there but the format is wrong. I think you
should log this and propagate the error.

> +
> +		ret = pdr_add_lookup(&apr->pdr, service_name, service_path);
> +		if (ret && ret != -EALREADY)
> +			dev_err(dev, "pdr add lookup failed: %d\n", ret);

So we have a DT that denotes that PDR is required, but we failed to
register a lookup (for some reason). That would imply that apr is not
going to work. I think you should propagate this and make apr_probe()
fail to make this obvious.

> +	}
> +}
> +
> +static void of_register_apr_devices(struct device *dev, const char *svc_path)
> +{
> +	struct apr *apr = dev_get_drvdata(dev);
> +	struct device_node *node;
> +	const char *service_path;
> +	int ret;
>  
>  	for_each_child_of_node(dev->of_node, node) {
>  		struct apr_device_id id = { {0} };

I think you should add a comment here describing what's actually going
on. Something along the lines of:

/*
 * This function is called with svc_path NULL during apr_probe(), in
 * which case we register any apr devices without a
 * qcom,protection-domain specified.
 *
 * Then as the protection domains becomes available (if applicable) this
 * function is again called, but with svc_path representing the service
 * becoming available. In this case we register any apr devices with a
 * matching qcom,protection-domain.
 */

>  
> +		ret = of_property_read_string_index(node, "qcom,protection-domain",
> +						    1, &service_path);
> +		if (svc_path) {
> +			/* skip APR services that are PD independent */
> +			if (ret)
> +				continue;
> +
> +			/* skip APR services whose PD paths don't match */
> +			if (strcmp(service_path, svc_path))
> +				continue;
> +		} else {
> +			/* skip APR services whose PD lookups are registered */
> +			if (ret == 0)
> +				continue;
> +		}
> +

Regards,
Bjorn
