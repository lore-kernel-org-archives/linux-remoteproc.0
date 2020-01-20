Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH] remoteproc: Add support for predefined notifyids
References: <20200115102142.11229-1-cleger@kalray.eu>
 <088ceab9-f135-6e70-dcf6-f75ec46110b1@st.com>
 <79048597.12371594.1579098506802.JavaMail.zimbra@kalray.eu>
 <a1116656-cf2e-c1a1-7cc3-0fe2a79f076e@st.com>
 <612100872.12377996.1579101063237.JavaMail.zimbra@kalray.eu>
 <20200117225217.GA27535@xps15>
 <377421261.12898679.1579462834671.JavaMail.zimbra@kalray.eu>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <49a1a4f7-3b08-91c1-e619-cba33880385d@st.com>
Date: Mon, 20 Jan 2020 10:52:26 +0100
MIME-Version: 1.0
In-Reply-To: <377421261.12898679.1579462834671.JavaMail.zimbra@kalray.eu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: =?UTF-8?Q?Cl=c3=a9ment_Leger?= <cleger@kalray.eu>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc <linux-remoteproc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

On 1/19/20 8:40 PM, Clément Leger wrote:
> Hi Mathieu,
> 
> ----- On 17 Jan, 2020, at 23:52, Mathieu Poirier mathieu.poirier@linaro.org wrote:
> 
>> Hey guys,
>>
>> On Wed, Jan 15, 2020 at 04:11:03PM +0100, Clément Leger wrote:
>>>
>>>
>>> ----- On 15 Jan, 2020, at 16:09, Arnaud Pouliquen arnaud.pouliquen@st.com wrote:
>>>
>>>> On 1/15/20 3:28 PM, Clément Leger wrote:
>>>>> Hi Arnaud,
>>>>>
>>>>> ----- On 15 Jan, 2020, at 15:06, Arnaud Pouliquen arnaud.pouliquen@st.com wrote:
>>>>>
>>>>>> Hi Clément,
>>>>>>
>>>>>> On 1/15/20 11:21 AM, Clement Leger wrote:
>>>>>>> In order to support preallocated notify ids, if their value is
>>>>>>> equal to FW_RSC_NOTIFY_ID_ANY, then do no allocate a notify id
>>>>>>> dynamically but try to allocate the requested one. This is useful when
>>>>>>> using custom ids to bind them to custom vendor resources. For instance,
>>>>>>> it allow to assign a group of queues to a specific interrupti in order
>>>>>>> to dispatch notifications.
>>>>>>>
>>>>>>> Signed-off-by: Clement Leger <cleger@kalray.eu>
>>>>>>> ---
>>>>>>>  drivers/remoteproc/remoteproc_core.c | 27 +++++++++++++++++++--------
>>>>>>>  include/linux/remoteproc.h           |  1 +
>>>>>>>  2 files changed, 20 insertions(+), 8 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/remoteproc/remoteproc_core.c
>>>>>>> b/drivers/remoteproc/remoteproc_core.c
>>>>>>> index 307df98347ba..b1485fcd0f11 100644
>>>>>>> --- a/drivers/remoteproc/remoteproc_core.c
>>>>>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>>>>>> @@ -351,14 +351,27 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
>>>>>>>  	/*
>>>>>>>  	 * Assign an rproc-wide unique index for this vring
>>>>>>>  	 * TODO: assign a notifyid for rvdev updates as well
>>>>>>> -	 * TODO: support predefined notifyids (via resource table)
>>>>>>>  	 */
>>>>>>> -	ret = idr_alloc(&rproc->notifyids, rvring, 0, 0, GFP_KERNEL);
>>>>>>> -	if (ret < 0) {
>>>>>>> -		dev_err(dev, "idr_alloc failed: %d\n", ret);
>>>>>>> -		return ret;
>>>>>>> +	if (rsc->vring[i].notifyid == FW_RSC_NOTIFY_ID_ANY) {
>>>>>>> +		ret = idr_alloc(&rproc->notifyids, rvring, 0, 0, GFP_KERNEL);
>>>>>>> +		if (ret < 0) {
>>>>>>> +			dev_err(dev, "idr_alloc failed: %d\n", ret);
>>>>>>> +			return ret;
>>>>>>> +		}
>>>>>>> +		notifyid = ret;
>>>>>>> +
>>>>>>> +		/* Let the rproc know the notifyid of this vring.*/
>>>>>>> +		rsc->vring[i].notifyid = notifyid;
>>>>>>> +	} else {
>>>>>>> +		/* Reserve requested notify_id */
>>>>>>> +		notifyid = rsc->vring[i].notifyid;
>>>>>>> +		ret = idr_alloc(&rproc->notifyids, rvring, notifyid,
>>>>>>> +				notifyid + 1, GFP_KERNEL);
>>>>>>> +		if (ret < 0) {
>>>>>>> +			dev_err(dev, "idr_alloc failed: %d\n", ret);
>>>>>>> +			return ret;
>>>>>>> +		}
>>>>>>>  	}
>>>>>>> -	notifyid = ret;
>>>>>>>  
>>>>>>>  	/* Potentially bump max_notifyid */
>>>>>>>  	if (notifyid > rproc->max_notifyid)
>>>>>>> @@ -366,8 +379,6 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
>>>>>>>  
>>>>>>>  	rvring->notifyid = notifyid;
>>>>>>>  
>>>>>>> -	/* Let the rproc know the notifyid of this vring.*/
>>>>>>> -	rsc->vring[i].notifyid = notifyid;
>>>>>>>  	return 0;
>>>>>>>  }
>>>>>> The rproc_free_vring function resets the notifyid to -1 on free.
>>>>>> This could generate a side effect if the resource table is not reloaded.
>>>>>
>>>>> Oh indeed, I did not thought of that. What would you recommend ?
>>>>> If using -1 in free vring, notify ids will be reallocated at next
>>>>> round.
>>>> Regarding the code i'm not sure that it is useful to reset the notifyID to -1 on
>>>> free.
>>
>> I'm not sure setting notifyid to -1 in rproc_free_vring() is such a big problem.
>> No matter the code path I look at, if rproc_free_vring() is called something
>> serious has happened and the resource table will be reloaded if another attempt
>> at booting the remote processor is done.  It can also be that a graceful
>> shutdown is underway, in which case the resource table will be reloaded anyway
>> if/when the slave is brought back in service.
>>
>> Let me know if I'm missing a scenario.
> 
> No, you are actually right
My concern here is that the resource table can be uncorrelated from the Firmware.
For instance the remote proc firmware could run autonomously.
In this case only the resource table will be managed.
Should we consider that this resource table must be reloaded on a stop/start from application?
Now regarding the da that is also reset to 0 (instead of FW_RSC_ADDR_ANY) in rproc_free_vring, i suppose that
my scenario is not realistic...on restart rproc would try to allocate vring at address 0, Leading to a crash.

> 
>>
>> To me the real problem is if a FW image has set the notifyids in the resource
>> table to 0xffffffff, thinking they will be overwritten.  In that case things
>> will really south.
> 
> Hum, if set to 0xFFFFFFFF, then they will be assigned dynamically and updated
> in the resource table (with this patch). But your probably mean existing code,
> right ?
point also not clear for me. In existing code the notifyids is always overwritten.
Mathieu could you details what you have in mind here?
> 
>>
>>>> In current version, on alloc, the notifyID is overwriten without check.
>>>> And as vdev status is updated, vring struct in resource table should be
>>>> considered as invalid
>>>> Except if i missed a usecase/race condition...
>>>>
>>>>>
>>>>> I was also worried that it would break some existing user applications
>>>>> which uses "0" as a notify id in vring but expect the id to be
>>>>> allocated dynamically. With my modification, it means it will try to
>>>>> use "0" as a predefined id, leading to allocation failure.
>>
>> From my point of view they will have been lucky for all this time.  Even with
>> a new version of the resource table (which I think is the right way go)
>> cases like this will break.
> 
> Agreed, and actually, I may have missread some code. I can't find were I read
> that. By the way, is there any documentation which state the allowed values of
> notify ids ?
0 seems a valid value. I'm not aware about a constraint on the notify ID.
With the current implementation, the initial values are simply ignored, therefore do not seem to be a problem.    
With Clément's patch, the issue is for legacy firmwares with both vrings IDs initialized to the same value (0 or another value different from -1).
The rproc_alloc_vring fails while trying to reserve the same IDs for both vring.
If this patch is introduced with a new version of the resource table a constraint on the notiifyID seems acceptable.

Thanks,
Arnaud

> 
>>
>> Thanks,
>> Mathieu
>>
>>>>>
>>>> Yes this could introduce regression for firmware that sets 0 as default value.
>>>> Probably better to introduce this patch with a new version of the resource table
>>>> :)
>>>
>>> Understood ;)
>>>
>>> Regards,
>>>
>>> Clément
>>>
>>>>
>>>> Regards
>>>> Arnaud
>>>>>>
>>>>>>>  
>>>>>>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>>>>>>> index 16ad66683ad0..dcae3394243e 100644
>>>>>>> --- a/include/linux/remoteproc.h
>>>>>>> +++ b/include/linux/remoteproc.h
>>>>>>> @@ -123,6 +123,7 @@ enum fw_resource_type {
>>>>>>>  };
>>>>>>>  
>>>>>>>  #define FW_RSC_ADDR_ANY (-1)
>>>>>>> +#define FW_RSC_NOTIFY_ID_ANY (-1)This define can also be used in
>>>>>>> rproc_free_vring
>>>>>
>>>>> Indeed.
>>>>>
>>>>> Thanks for your review.
>>>>>
>>>>> Regards,
>>>>>
>>>>> Clément
>>>>>
>>>>>>
>>>>>> Regards,
>>>>>> Arnaud
>>>>>>>  
>>>>>>>  /**
>>>>>>>   * struct fw_rsc_carveout - physically contiguous memory request
