Return-Path: <sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 14 Dec 2018 23:02:29 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 2/2] remoteproc: sysmon: Wait for shutdown-ack/ind on
 sysmon shutdown
In-Reply-To: <20181206071608.GA31596@builder>
References: <20181120210209.9029-1-sibis@codeaurora.org>
 <20181120210209.9029-2-sibis@codeaurora.org>
 <20181206071608.GA31596@builder>
Message-ID: <07ed312abae89f797e78c91d3fb0a315@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, ohad@wizery.com, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, linux-remoteproc-owner@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,
Thanks for the review!

On 2018-12-06 12:46, Bjorn Andersson wrote:
> On Tue 20 Nov 13:02 PST 2018, Sibi Sankar wrote:
> 
>> After sending a sysmon shutdown request to the SSCTL service on the
>> subsystem, wait for the service to send shutdown-ack interrupt or
>> an indication message back.
>> 
> 
> So we get a reply immediate on the shutdown request, and then some time
> later we get either an indication or an interrupt to state that it's
> actually complete?
> 

Yes, after the immediate qmi result response
we get either indication/shutdown-ack interrupt
or both. This would indicate that the graceful
shutdown is complete and wouldn't further require
a qcom_q6v5_request_stop.

>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  drivers/remoteproc/qcom_sysmon.c | 59 
>> +++++++++++++++++++++++++++++++-
>>  1 file changed, 58 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/remoteproc/qcom_sysmon.c 
>> b/drivers/remoteproc/qcom_sysmon.c
> [..]
>> @@ -283,6 +311,14 @@ static void ssctl_request_shutdown(struct 
>> qcom_sysmon *sysmon)
>>  		dev_err(sysmon->dev, "shutdown request failed\n");
>>  	else
>>  		dev_dbg(sysmon->dev, "shutdown request completed\n");
>> +
>> +	if (sysmon->shutdown_irq > 0) {
>> +		ret = wait_for_completion_timeout(&sysmon->shutdown_comp,
>> +						  msecs_to_jiffies(5000));
> 
> 5 * HZ
> 

sure

>> +		if (!ret)
>> +			dev_err(sysmon->dev,
>> +				"timeout waiting for shutdown ack\n");
>> +	}
>>  }
> [..]
>> @@ -453,14 +499,25 @@ struct qcom_sysmon 
>> *qcom_add_sysmon_subdev(struct rproc *rproc,
>> 
>>  	sysmon->dev = rproc->dev.parent;
>>  	sysmon->rproc = rproc;
>> +	pdev = container_of(sysmon->dev, struct platform_device, dev);
>> 
>>  	sysmon->name = name;
>>  	sysmon->ssctl_instance = ssctl_instance;
>> 
>>  	init_completion(&sysmon->comp);
>> +	init_completion(&sysmon->shutdown_comp);
>>  	mutex_init(&sysmon->lock);
>> 
>> -	ret = qmi_handle_init(&sysmon->qmi, SSCTL_MAX_MSG_LEN, &ssctl_ops, 
>> NULL);
>> +	sysmon->shutdown_irq = platform_get_irq_byname(pdev, 
>> "shutdown-ack");
> 
> Use of_irq_get_byname() on sysmon->dev instead of relying on the fact
> that the remoteproc driver is a platform_device.
> 
> Also, check and handle the return value - because an EPROBE_DEFER here
> will be turned into a -EINVAL by devm_request_threaded_irq().
> 

handling -EPROBE_DEFER would require changing the prototype
of add_sysmon_subdev, so can it come as a separate patch?

>> +	ret = devm_request_threaded_irq(sysmon->dev, sysmon->shutdown_irq,
>> +					NULL, sysmon_shutdown_interrupt,
>> +					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
>> +					"q6v5 shutdown-ack", sysmon);
>> +	if (ret)
>> +		dev_err(sysmon->dev, "failed to acquire shutdown-ack IRQ\n");
> 
> In the event that sysmon->shutdown_irq is != -ENODATA, you should fail
> here.
> 

don't we want this to be a optional property? meaning we
shouldn't fail for -EINVAL..

>> +
>> +	ret = qmi_handle_init(&sysmon->qmi, SSCTL_MAX_MSG_LEN, &ssctl_ops,
>> +			      qmi_indication_handler);
> 
> Regards,
> Bjorn

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
