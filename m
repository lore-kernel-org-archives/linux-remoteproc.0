Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Subject: Re: [PATCH 2/2] remoteproc: core: Prevent sleep when rproc crashes
References: <1582164713-6413-1-git-send-email-sidgup@codeaurora.org>
 <1582164713-6413-3-git-send-email-sidgup@codeaurora.org>
 <20200224185334.GB9477@xps15>
From: Siddharth Gupta <sidgup@codeaurora.org>
Message-ID: <1a6a8661-d44f-adad-b262-ff42633c7b38@codeaurora.org>
Date: Tue, 7 Apr 2020 11:00:00 -0700
MIME-Version: 1.0
In-Reply-To: <20200224185334.GB9477@xps15>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org, psodagud@codeaurora.org, rishabhb@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hey Mathieu,
I will be sending a revised patchset soon. Will try to address your 
comments there.

Thanks,
Siddharth

On 2/24/2020 10:53 AM, Mathieu Poirier wrote:
> On Wed, Feb 19, 2020 at 06:11:53PM -0800, Siddharth Gupta wrote:
>> Remoteproc recovery should be fast and any delay will have an impact on the
>> user-experience. Use power management APIs (pm_stay_awake and pm_relax) to
>> ensure that the system does not go to sleep.
> When you say "ensure the system does not go to sleep", you're referring to the
> system going idle from the CPUidle subsystem?
>
>> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
>> ---
>>   drivers/remoteproc/remoteproc_core.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 5ab65a4..52e318c 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1712,6 +1712,8 @@ static void rproc_crash_handler_work(struct work_struct *work)
>>   
>>   	if (!rproc->recovery_disabled)
>>   		rproc_trigger_recovery(rproc);
>> +
>> +	pm_relax(&rproc->dev);
>>   }
>>   
>>   /**
>> @@ -2242,6 +2244,8 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
>>   		return;
>>   	}
>>   
>> +	pm_stay_awake(&rproc->dev);
>> +
> I fail to understand how this can be useful since there is no HW associted to
> rproc->dev...  Is it possible for you to elaborate more on the problem you're
> trying to fix?
>
> Thanks,
> Mathieu
>
>>   	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
>>   		rproc->name, rproc_crash_to_string(type));
>>   
>> -- 
>> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
