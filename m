Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH v2 6/8] remoteproc: Introduce "panic" callback in ops
References: <20191227053215.423811-1-bjorn.andersson@linaro.org>
 <20191227053215.423811-7-bjorn.andersson@linaro.org>
 <20200110212307.GC11555@xps15>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <13ea6f8e-c017-d4b3-6658-c193cb4d18f1@st.com>
Date: Thu, 30 Jan 2020 11:07:21 +0100
MIME-Version: 1.0
In-Reply-To: <20200110212307.GC11555@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>, Rishabh Bhatnagar <rishabhb@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

On 1/10/20 10:23 PM, Mathieu Poirier wrote:
> On Thu, Dec 26, 2019 at 09:32:13PM -0800, Bjorn Andersson wrote:
>> Introduce a "panic" function in the remoteproc ops table, to allow
>> remoteproc instances to perform operations needed in order to aid in
>> post mortem system debugging, such as flushing caches etc, when the
>> kernel panics.
>>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> ---
>>
>> Changes since v1:
>> - None
>>
>>  drivers/remoteproc/remoteproc_core.c | 17 +++++++++++++++++
>>  include/linux/remoteproc.h           |  4 ++++
>>  2 files changed, 21 insertions(+)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 307df98347ba..779f19d6d8e7 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1832,6 +1832,17 @@ void rproc_shutdown(struct rproc *rproc)
>>  }
>>  EXPORT_SYMBOL(rproc_shutdown);
>>  
>> +static int rproc_panic_handler(struct notifier_block *nb, unsigned long event,
>> +			       void *ptr)
>> +{
>> +	struct rproc *rproc = container_of(nb, struct rproc, panic_nb);
>> +
>> +	if (rproc->state == RPROC_RUNNING)
>> +		rproc->ops->panic(rproc);
>> +
>> +	return NOTIFY_DONE;
>> +}
>> +
>>  /**
>>   * rproc_get_by_phandle() - find a remote processor by phandle
>>   * @phandle: phandle to the rproc
>> @@ -2057,6 +2068,12 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
>>  		rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
>>  	}
>>  
>> +	/* Register panic notifier for remoteprocs with "panic" callback */
>> +	if (rproc->ops->panic) {
>> +		rproc->panic_nb.notifier_call = rproc_panic_handler;
>> +		atomic_notifier_chain_register(&panic_notifier_list, &rproc->panic_nb);
> 
> Line over 80 characters.
atomic_notifier_chain_unregister should be added in rproc_del.

Regards,
Arnaud
> 
>> +	}
>> +
>>  	mutex_init(&rproc->lock);
>>  
>>  	idr_init(&rproc->notifyids);
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index 16ad66683ad0..7836c528d309 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -369,6 +369,7 @@ enum rsc_handling_status {
>>   *			expects to find it
>>   * @sanity_check:	sanity check the fw image
>>   * @get_boot_addr:	get boot address to entry point specified in firmware
>> + * @panic:	optional callback to react to system panic
>>   */
>>  struct rproc_ops {
>>  	int (*start)(struct rproc *rproc);
>> @@ -383,6 +384,7 @@ struct rproc_ops {
>>  	int (*load)(struct rproc *rproc, const struct firmware *fw);
>>  	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
>>  	u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
>> +	void (*panic)(struct rproc *rproc);
>>  };
>>  
>>  /**
>> @@ -481,6 +483,7 @@ struct rproc_dump_segment {
>>   * @auto_boot: flag to indicate if remote processor should be auto-started
>>   * @dump_segments: list of segments in the firmware
>>   * @nb_vdev: number of vdev currently handled by rproc
>> + * @panic_nb: notifier_block for remoteproc's panic handler
>>   */
>>  struct rproc {
>>  	struct list_head node;
>> @@ -514,6 +517,7 @@ struct rproc {
>>  	bool auto_boot;
>>  	struct list_head dump_segments;
>>  	int nb_vdev;
>> +	struct notifier_block panic_nb;
>>  };
>>  
>>  /**
>> -- 
>> 2.24.0
>>
