Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v3 08/13] remoteproc: add prepare and unprepare ops
References: <1519921440-21356-1-git-send-email-loic.pallardy@st.com>
 <1519921440-21356-9-git-send-email-loic.pallardy@st.com>
 <20180510005249.GF29093@builder>
 <b4d9dfbdc6684e59bec149f80897bd42@SFHDAG7NODE2.st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <eb72a51b-ca3c-6a50-fdcb-a06e1ddf9402@ti.com>
Date: Tue, 23 Oct 2018 22:12:54 -0500
MIME-Version: 1.0
In-Reply-To: <b4d9dfbdc6684e59bec149f80897bd42@SFHDAG7NODE2.st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Loic PALLARDY <loic.pallardy@st.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

> >> -----Original Message-----
>> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
>> Sent: Thursday, May 10, 2018 2:53 AM
>> To: Loic PALLARDY <loic.pallardy@st.com>
>> Cc: ohad@wizery.com; linux-remoteproc@vger.kernel.org; linux-
>> kernel@vger.kernel.org; Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
>> benjamin.gaignard@linaro.org
>> Subject: Re: [PATCH v3 08/13] remoteproc: add prepare and unprepare ops
>>
>> On Thu 01 Mar 08:23 PST 2018, Loic Pallardy wrote:
>>
>>> On some SoC architecture, it is needed to enable HW like
>>> clock, bus, regulator, memory region... before loading
>>> co-processor firmware.
>>>
>>> This patch introduces prepare and unprepare ops to execute
>>> platform specific function before firmware loading and after
>>> stop execution.
>>>
>>> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
>>> ---
>>>  drivers/remoteproc/remoteproc_core.c | 20 +++++++++++++++++++-
>>>  include/linux/remoteproc.h           |  4 ++++
>>>  2 files changed, 23 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/remoteproc/remoteproc_core.c
>> b/drivers/remoteproc/remoteproc_core.c
>>> index 7a500cb..0ebbc4f 100644
>>> --- a/drivers/remoteproc/remoteproc_core.c
>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>> @@ -1058,12 +1058,22 @@ static int rproc_fw_boot(struct rproc *rproc,
>> const struct firmware *fw)
>>>  		return ret;
>>>  	}
>>>
>>> +	/* Prepare rproc for firmware loading if needed */
>>> +	if (rproc->ops->prepare) {
>>> +		ret = rproc->ops->prepare(rproc);
>>> +		if (ret) {
>>> +			dev_err(dev, "can't prepare rproc %s: %d\n",
>>> +				rproc->name, ret);
>>> +			goto disable_iommu;
>>> +		}
>>> +	}
>>
>> We do allow drivers to implement custom versions of parse_fw() - and
>> they can call the resource-table-parse-fw from the custom function.
>>
>> So with the proposed refactoring in patch 9 I would like for parse_fw()
>> to call back into the core to fill out the resource lists and then
>> before jumping to rproc_start() we loop over the allocator functions.

I do like this patch and actually have a need for something similar for
supporting loading into internal memories for some R5F remote processors
on the latest TI SoCs. R5Fs have both resets and halt signals, and the
reset needs to be released to allow loading into TCMs, with the start
performing the halt. I am forced to do this between rproc_alloc() and
rproc_start() at the moment, but this really creates a mismatch between
my probe, start, stop and remove.

That said, I do agree with you that the way this was used with carveouts
should not have been used. Overloading the parse_fw to achieve above is
not right either. Please see my comments on Loic's v4 ST remoteproc
patch [1].

[1] https://patchwork.kernel.org/patch/10547153/

> 
> Agree
> Regards,
> Loic
>>
>>> +
>>>  	rproc->bootaddr = rproc_get_boot_addr(rproc, fw);
>>>
>>>  	/* load resource table */
>>>  	ret = rproc_load_rsc_table(rproc, fw);
>>>  	if (ret)
>>> -		goto disable_iommu;
>>> +		goto unprepare_rproc;
>>>
>>>  	/* reset max_notifyid */
>>>  	rproc->max_notifyid = -1;
>>> @@ -1086,6 +1096,10 @@ static int rproc_fw_boot(struct rproc *rproc,
>> const struct firmware *fw)
>>>  	kfree(rproc->cached_table);
>>>  	rproc->cached_table = NULL;
>>>  	rproc->table_ptr = NULL;
>>> +unprepare_rproc:
>>> +	/* release HW resources if needed */
>>> +	if (rproc->ops->unprepare)
>>> +		rproc->ops->unprepare(rproc);
>>>  disable_iommu:
>>>  	rproc_disable_iommu(rproc);
>>>  	return ret;
>>> @@ -1331,6 +1345,10 @@ void rproc_shutdown(struct rproc *rproc)
>>>  	/* clean up all acquired resources */
>>>  	rproc_resource_cleanup(rproc);
>>>
>>> +	/* release HW resources if needed */
>>> +	if (rproc->ops->unprepare)
>>> +		rproc->ops->unprepare(rproc);
>>
>> And this would then be handled by the rproc_resource_cleanup() function,
>> looping over all resources and calling release().
>>
>> Regards,
>> Bjorn
> --
> To unsubscribe from this list: send the line "unsubscribe linux-remoteproc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
