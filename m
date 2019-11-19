Return-Path: <0101016e83324621-6aac98a7-bc7c-4354-8c35-d6b09928df09-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 19 Nov 2019 10:25:40 +0000
From: sibis@codeaurora.org
Subject: Re: [PATCH 3/3] soc: qcom: apr: Add avs/audio tracking functionality
In-Reply-To: <20191119065325.GF18024@yoga>
References: <20191118142728.30187-1-sibis@codeaurora.org>
 <0101016e7ee9d8b5-9759d0ba-4acf-4fc4-a863-fac9c738397f-000000@us-west-2.amazonses.com>
 <20191119065325.GF18024@yoga>
Message-ID: <0101016e83324621-6aac98a7-bc7c-4354-8c35-d6b09928df09-000000@us-west-2.amazonses.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, tsoni@codeaurora.org, agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, rnayak@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 2019-11-19 12:23, Bjorn Andersson wrote:
> On Mon 18 Nov 06:28 PST 2019, Sibi Sankar wrote:
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> [..]
>> +static void of_register_apr_devices(struct device *dev, const char 
>> *svc_path)
>>  {
>>  	struct apr *apr = dev_get_drvdata(dev);
>>  	struct device_node *node;
>> +	const char *service_path;
>> +	int ret;
>> 
>>  	for_each_child_of_node(dev->of_node, node) {
>>  		struct apr_device_id id = { {0} };
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
>> +			/* skip APR services whose PD lookups are registered*/
> 
> Missing space before */

Thanks will add it

> 
>> +			if (ret == 0)
>> +				continue;
>> +		}
>> +
>>  		if (of_property_read_u32(node, "reg", &id.svc_id))
>>  			continue;
>> 
>> @@ -318,6 +365,37 @@ static void of_register_apr_devices(struct device 
>> *dev)
>>  	}
>>  }
>> 
>> +static int apr_remove_device(struct device *dev, void *svc_path)
>> +{
>> +	struct apr_device *adev = to_apr_device(dev);
>> +
>> +	if (svc_path) {
>> +		if (!strcmp(adev->service_path, (char *)svc_path))
>> +			device_unregister(&adev->dev);
>> +	} else {
>> +		device_unregister(&adev->dev);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int apr_pd_status(struct pdr_handle *pdr, struct pdr_service 
>> *pds)
> 
> Why is the pdr status function returning an int?

yes since I am not using the
return value in pdr_helpers
will make it void.

> 
>> +{
>> +	struct apr *apr = container_of(pdr, struct apr, pdr);
>> +
>> +	switch (pds->state) {
>> +	case SERVREG_SERVICE_STATE_UP:
>> +		of_register_apr_devices(apr->dev, pds->service_path);
>> +		break;
>> +	case SERVREG_SERVICE_STATE_DOWN:
>> +		device_for_each_child(apr->dev, pds->service_path,
>> +				      apr_remove_device);
>> +		break;
>> +	}
>> +
>> +	return 0;
>> +}
> [..]
>> @@ -343,20 +421,19 @@ static int apr_probe(struct rpmsg_device *rpdev)
>>  		return -ENOMEM;
>>  	}
>>  	INIT_WORK(&apr->rx_work, apr_rxwq);
>> +
>> +	ret = pdr_handle_init(&apr->pdr, apr_pd_status);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to init PDR handle\n");
> 
> You need to destroy apr->rxwq here as well.

sry missed this

> 
>> +		return ret;
>> +	}
>> +
>>  	INIT_LIST_HEAD(&apr->rx_list);
>>  	spin_lock_init(&apr->rx_lock);
>>  	spin_lock_init(&apr->svcs_lock);
>>  	idr_init(&apr->svcs_idr);
>> -	of_register_apr_devices(dev);
>> -
>> -	return 0;
>> -}
> 
> Regards,
> Bjorn
