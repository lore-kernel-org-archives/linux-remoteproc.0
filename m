Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Subject: Re: [PATCH 1/2] remoteproc: core: Add an API for booting with
 firmware name
References: <1582164713-6413-1-git-send-email-sidgup@codeaurora.org>
 <1582164713-6413-2-git-send-email-sidgup@codeaurora.org>
 <20200224183043.GA9477@xps15>
From: Siddharth Gupta <sidgup@codeaurora.org>
Message-ID: <bbccf58a-2c3a-38f3-bd63-e7aeb8213b34@codeaurora.org>
Date: Wed, 26 Feb 2020 15:10:31 -0800
MIME-Version: 1.0
In-Reply-To: <20200224183043.GA9477@xps15>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org, psodagud@codeaurora.org, rishabhb@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hey Mathieu,

On 2/24/2020 10:30 AM, Mathieu Poirier wrote:

> Hi Siddharth,
>
> On Wed, Feb 19, 2020 at 06:11:52PM -0800, Siddharth Gupta wrote:
>> Add an API which allows to change the name of the firmware to be booted on
>> the specified rproc. This change gives us the flixibility to change the
>> firmware at run-time depending on the usecase. Some remoteprocs might use
>> a different firmware for testing, production and development purposes,
>> which may be selected based on the fuse settings during bootup.
>>
>> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
>> ---
>>   drivers/remoteproc/remoteproc_core.c | 34 ++++++++++++++++++++++++++++++++++
>>   include/linux/remoteproc.h           |  1 +
>>   2 files changed, 35 insertions(+)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 097f33e..5ab65a4 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1779,6 +1779,40 @@ int rproc_boot(struct rproc *rproc)
>>   EXPORT_SYMBOL(rproc_boot);
>>   
>>   /**
>> + * rproc_boot_with_fw() - boot a remote processor with the specified firmware
>> + * @rproc: handle of a remote processor
>> + * @firmware: name of the firmware to boot with
>> + *
>> + * Change the name of the firmware to be loaded to @firmware in the rproc
>> + * structure, and call rproc_boot().
>> + *
>> + * Returns 0 on success, and an appropriate error value otherwise.
>> + */
>> +int rproc_boot_with_fw(struct rproc *rproc, const char *firmware)
>> +{
>> +	char *p;
>> +
>> +	if (!rproc) {
>> +		pr_err("invalid rproc handle\n");
>> +		return -EINVAL;
>> +	}
>          if (!rproc || !firmware)
>                  return -EINVAL;
>
> There is no user involved here so no point in printing anything.  If @rproc or
> @firmware is NULL than callers should be smart enough to figure it out from the
> error code.

I was trying to mimic the behaviour of rproc_boot here actually, since 
we were trying to make this
an API for users to directly boot with firmware name.

>
>> +
>> +	if (firmware) {
>> +		p = kstrdup(firmware, GFP_KERNEL);
>> +		if (!p)
>> +			return -ENOMEM;
> As in firmware_store() I think it is a good idea to mandate the MCU be offline
> before changing the firmware name.  That way we avoid situations where what is
> running on the MCU is not what gets reported in sysfs.

Sure, that makes sense.

>> +
>> +		mutex_lock(&rproc->lock);
>> +		kfree(rproc->firmware);
>> +		rproc->firmware = p;
>> +		mutex_unlock(&rproc->lock);
>> +	}
>> +
>> +	return rproc_boot(rproc);
> Function rproc_boot() is also an exported symbol and belongs in the caller -
> please move it out of here.  When that is done rproc_boot_with_fw() can become
> rproc_set_firmware_name() and concentrate on doing just that.

Okay sounds good.

>
>> +}
>> +EXPORT_SYMBOL(rproc_boot_with_fw);
> Although choosing the firmware image to boot without user involvement seems like
> a valid scenario to me, this can't be added until there is an actual user of
> this API.
That's true. We have a few cases downstream where we need this 
functionality. We were wondering
if anyone else might have use of such functionality, and create an 
upstream API in that case. Your
suggestion of creating rproc_set_firmware_name() is a better approach 
for sure though. We're looking
at creating a new remoteproc (platform) driver which will need this 
functionality.
>> +
>> +/**
>>    * rproc_shutdown() - power off the remote processor
>>    * @rproc: the remote processor
>>    *
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index 16ad666..e2eaba9 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -609,6 +609,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, int len,
>>   			     u32 da, const char *name, ...);
>>   
>>   int rproc_boot(struct rproc *rproc);
>> +int rproc_boot_with_fw(struct rproc *rproc, const char *firmware);
>>   void rproc_shutdown(struct rproc *rproc);
>>   void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
>>   int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
>> -- 
>> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
