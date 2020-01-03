Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 03 Jan 2020 18:17:43 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v3 3/3] soc: qcom: apr: Add avs/audio tracking
 functionality
In-Reply-To: <20200102205757.GH988120@minitux>
References: <20191230050008.8143-1-sibis@codeaurora.org>
 <20191230050008.8143-4-sibis@codeaurora.org>
 <20200102205757.GH988120@minitux>
Message-ID: <a937f62868dbb2856eb72dda024a40bc@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, tsoni@codeaurora.org, agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 2020-01-03 02:27, Bjorn Andersson wrote:
> On Sun 29 Dec 21:00 PST 2019, Sibi Sankar wrote:
>> diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
> [..]
>> -static void of_register_apr_devices(struct device *dev)
>> +static void of_apr_add_pd_lookups(struct device *dev)
>>  {
>> +	const char *service_name, *service_path;
>>  	struct apr *apr = dev_get_drvdata(dev);
>>  	struct device_node *node;
>> +	int ret;
>> +
>> +	for_each_child_of_node(dev->of_node, node) {
>> +		ret = of_property_read_string_index(node, "qcom,protection-domain",
>> +						    0, &service_name);
>> +		if (ret < 0)
>> +			continue;
> 
> While this implies that the qcom,protection-domain property is
> missing...
> 
>> +
>> +		ret = of_property_read_string_index(node, "qcom,protection-domain",
>> +						    1, &service_path);
>> +		if (ret < 0)
>> +			continue;
> 
> ...this would imply that it's there but the format is wrong. I think 
> you
> should log this and propagate the error.
> 
>> +
>> +		ret = pdr_add_lookup(&apr->pdr, service_name, service_path);
>> +		if (ret && ret != -EALREADY)
>> +			dev_err(dev, "pdr add lookup failed: %d\n", ret);
> 
> So we have a DT that denotes that PDR is required, but we failed to
> register a lookup (for some reason). That would imply that apr is not
> going to work. I think you should propagate this and make apr_probe()
> fail to make this obvious.

this was predominantly done to deal
with a mix of apr devices where some
of them are independent of PDs so
making apr_probe fail is detrimental
here. Also apr devices having improper
format will not be registered or removed.

> 
>> +	}
>> +}
>> +
>> +static void of_register_apr_devices(struct device *dev, const char 
>> *svc_path)
>> +{
>> +	struct apr *apr = dev_get_drvdata(dev);
>> +	struct device_node *node;
>> +	const char *service_path;
>> +	int ret;
>> 
>>  	for_each_child_of_node(dev->of_node, node) {
>>  		struct apr_device_id id = { {0} };
> 
> I think you should add a comment here describing what's actually going
> on. Something along the lines of:
> 
> /*
>  * This function is called with svc_path NULL during apr_probe(), in
>  * which case we register any apr devices without a
>  * qcom,protection-domain specified.
>  *
>  * Then as the protection domains becomes available (if applicable) 
> this
>  * function is again called, but with svc_path representing the service
>  * becoming available. In this case we register any apr devices with a
>  * matching qcom,protection-domain.
>  */

Thanks for writing ^^ up will include
it in my next re-spin.

> 
>> 
>> +		ret = of_property_read_string_index(node, "qcom,protection-domain",
>> +						    1, &service_path);
>> +		if (svc_path) {
>> +			/* skip APR services that are PD independent */
>> +			if (ret)
>> +				continue;
>> +
>> +			/* skip APR services whose PD paths don't match */
>> +			if (strcmp(service_path, svc_path))
>> +				continue;
>> +		} else {
>> +			/* skip APR services whose PD lookups are registered */
>> +			if (ret == 0)
>> +				continue;
>> +		}
>> +
> 
> Regards,
> Bjorn

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
