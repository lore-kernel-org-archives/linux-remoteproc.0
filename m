Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH] rpmsg: virtio_rpmsg_bus: replace "%p" with "%pK"
From: Suman Anna <s-anna@ti.com>
References: <20181024011909.21674-1-s-anna@ti.com>
 <40831f80-1e36-66ca-b8e5-684d46ba167e@ti.com> <20190827051007.GK1263@builder>
 <8d36d695-dd66-c21f-f49e-f6dc3dbdfc5a@ti.com> <20190827220711.GK6167@minitux>
 <619b06b0-c3cc-e36f-c3e5-d13e98520c9c@ti.com>
Message-ID: <9c5f95a0-c95b-bf68-e78f-6e3d4d837b1e@ti.com>
Date: Tue, 27 Aug 2019 17:17:28 -0500
MIME-Version: 1.0
In-Reply-To: <619b06b0-c3cc-e36f-c3e5-d13e98520c9c@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 8/27/19 5:15 PM, Suman Anna wrote:
> On 8/27/19 5:07 PM, Bjorn Andersson wrote:
>> On Tue 27 Aug 13:25 PDT 2019, Suman Anna wrote:
>>
>>> Hi Bjorn,
>>>
>>> On 8/27/19 12:10 AM, Bjorn Andersson wrote:
>>>> On Fri 09 Aug 13:25 PDT 2019, Suman Anna wrote:
>>>>
>>>>> Hi Bjorn,
>>>>>
>>>>
>>>> Hi Suman
>>>>
>>>>> On 10/23/18 8:19 PM, Suman Anna wrote:
>>>>>> The virtio_rpmsg_bus driver uses the "%p" format-specifier for
>>>>>> printing the vring buffer address. This prints only a hashed
>>>>>> pointer even for previliged users. Use "%pK" instead so that
>>>>>> the address can be printed during debug using kptr_restrict
>>>>>> sysctl.
>>>>>
>>>>> Seems to have been lost among the patches, can you pick up this trivial
>>>>> patch for 5.4? Should apply cleanly on the latest HEAD as well.
>>>>>
>>>>
>>>> I share Andrew's question regarding what benefit you have from knowing
>>>> this value. Should we not just remove the va from the print? Or do you
>>>> actually have a use case for it?.
>>>
>>> I mainly use it during debug when comparing against kernel_page_tables
>>> and vmallocinfo. The pools that we use are not always guaranteed to be
>>> from linear memory, and behavior changes when using with CMA or DMA pools.
>>>
>>
>> Thanks Suman. It seems to me that there's room for improvement to aid
>> this kind of debugging. But your usecase seems reasonable, so I'm
>> merging the patch.
> 
> Thanks Bjorn.

Btw, looks like you applied the patch against rproc-next instead of
rpmsg-next.

regards
Suman

> 
>>
>>> Note that usage of %pK does not leak the addresses automatically, but
>>> atleast enables me to get the values when needed. The changes also bring
>>> the usage in rpmsg core in sync with the remoteproc core.
>>>
>>
>> Sounds like shouldn't have merged them in remoteproc then ;P
> 
> Slightly different reasoning looking at the commit, it was probably when
> %p was leaking the addresses.
> 
> regards
> Suman
> 
>>
>> Thanks,
>> Bjorn
>>
>>> regards
>>> Suman
>>>
>>>>
>>>> Regards,
>>>> Bjorn
>>>>
>>>>> regards
>>>>> Suman
>>>>>
>>>>>>
>>>>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>>>>> ---
>>>>>>  drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
>>>>>> index f29dee731026..1345f373a1a0 100644
>>>>>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>>>>>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>>>>>> @@ -950,7 +950,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>>>>>  		goto vqs_del;
>>>>>>  	}
>>>>>>  
>>>>>> -	dev_dbg(&vdev->dev, "buffers: va %p, dma %pad\n",
>>>>>> +	dev_dbg(&vdev->dev, "buffers: va %pK, dma %pad\n",
>>>>>>  		bufs_va, &vrp->bufs_dma);
>>>>>>  
>>>>>>  	/* half of the buffers is dedicated for RX */
>>>>>>
>>>>>
>>>
> 
