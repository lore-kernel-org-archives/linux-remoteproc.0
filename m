Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH 2/2] remoteproc: Fix and restore the parenting hierarchy
 for vdev
References: <20200305224108.21351-1-s-anna@ti.com>
 <20200305224108.21351-3-s-anna@ti.com> <20200317180530.GA1801@xps15>
 <76772d98-93d9-e559-01b8-ba7d4d1cc1eb@st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <f08b15c2-639c-2919-e321-a5a5296e8112@ti.com>
Date: Wed, 18 Mar 2020 14:23:05 -0500
MIME-Version: 1.0
In-Reply-To: <76772d98-93d9-e559-01b8-ba7d4d1cc1eb@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Loic Pallardy <loic.pallardy@st.com>, Tero Kristo <t-kristo@ti.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Arnaud,

On 3/18/20 11:38 AM, Arnaud POULIQUEN wrote:
> Hi Suman, Mathieu,
> 
> On 3/17/20 7:05 PM, Mathieu Poirier wrote:
>> Hi Suman,
>>
>> On Thu, Mar 05, 2020 at 04:41:08PM -0600, Suman Anna wrote:
>>> The commit 086d08725d34 ("remoteproc: create vdev subdevice with specific
>>> dma memory pool") has introduced a new vdev subdevice for each vdev
>>> declared in the firmware resource table and made it as the parent for the
>>> created virtio rpmsg devices instead of the previous remoteproc device.
>>> This changed the overall parenting hierarchy for the rpmsg devices, which
>>> were children of virtio devices, and does not allow the corresponding
>>> rpmsg drivers to retrieve the parent rproc device through the
>>> rproc_get_by_child() API.
>>>
>>> Fix this by restoring the remoteproc device as the parent. The new vdev
>>> subdevice can continue to inherit the DMA attributes from the remoteproc's
>>> parent device (actual platform device).
>>>
>>> Fixes: 086d08725d34 ("remoteproc: create vdev subdevice with specific dma memory pool")
>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>> ---
>>>  drivers/remoteproc/remoteproc_core.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>>> index 097f33e4f1f3..ba18f32bd0c4 100644
>>> --- a/drivers/remoteproc/remoteproc_core.c
>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>> @@ -510,7 +510,7 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
>>>  
>>>  	/* Initialise vdev subdevice */
>>>  	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
>>> -	rvdev->dev.parent = rproc->dev.parent;
>>> +	rvdev->dev.parent = &rproc->dev;
>>
>> I can see how it would not be possible to retrieve the parent rproc device since
>> rvdev->dev.parent was set to be platform device...
> 
> In rpmsg_virtio_bus.c [1] the vdev buffers are allocated in a memory region using a dma_alloc_coherent
> So the buffers are allocated in the platform driver memory region if declared, else in the default memory region. 
> 
> According to  086d08725d34 ("remoteproc: create vdev subdevice with specific dma memory pool"),
> A patch has been integrated in rpmsg framework:  d999b622fcfb3 ("rpmsg: virtio: allocate buffer from parent")
> 
> -	bufs_va = dma_alloc_coherent(vdev->dev.parent->parent,
> +	bufs_va = dma_alloc_coherent(vdev->dev.parent,
> 
> So in term of parent-child relationchip the Loic's patches seem coherent, and don't affect parenting hierarchy
> for the rpmsg bus.

So, there are two things w.r.t rpmsg device hierarchy - buffer
allocations and the overall hierarchy to allow a child rpmsg device to
be able to retrieve the corresponding rproc. This is done using
rproc_get_by_child() which walks up the dev parent hierarchy and
matching the parent device type to rproc_type.

Commit 086d08725d34 adds a new vdevbuffer device with parent as the
rproc platform device and makes this the parent of the virtio device, so
the buffer allocations were unchanged just with that commit, but the
rproc lookup will always fail. The later commit d999b622fcfb3 switches
the buffer allocation over to the vdevbuffer device, and with rproc
drivers that added dedicated vdevbuf pools allocates from those pools
(these were mostly coming from a specific rproc platform device memory
region index anyway). For those that did not define, this actually
became the global pool even if the rproc device was using a single
DMA/CMA pool (patch 1).

Please see my cover-letter for an example of the dev hierarchy.

> 
> So It seems to me that this patch breaks the relationship between the rpmsg bus
> and the rproc platform driver, at least concerning the buffer allocation.

I am not sure if you were interpreting this patch with or without
d999b622fcfb3 ("rpmsg: virtio: allocate buffer from parent"). Both of
the above commits are in 5.1, so I consider this patch to be fixing only
on 5.1+ kernels and it does use d999b622fcfb3. Buffer allocations after
this patch without d999b622fcfb3 would try to allocate from rproc device
which is a pseudo-device and doesn't have any pools defined with it, so
will allocate from the global pool.

> But on the other side this patch doesn't introduce regression for rpmsg bus on my platform... 
> 
> I probably missed something important because i can not figure out how this patch don't introduce regression.
> Can the rproc->dev inherits from the rproc platform device in term of memory regions?
> 
> [1]: https://elixir.bootlin.com/linux/latest/source/drivers/rpmsg/virtio_rpmsg_bus.c#L915
> [2]: https://lkml.org/lkml/2018/11/30/180
> 
>>
>> I wonder how the original change didn't blow up sysmon_probe() and potentially
>> other out-of-tree users of rproc_get_by_child().  It would be nice to have
>> someone from the QCOM team test your patch.
> 
> You are right the rproc platform device is now the grand parent of a rpmsg device, while before it was the parent.
> Anyway, does it makes sense to have this kind of dependency between rpmsg device and rproc device?
> The fix could be done in the rpmsg device that would be rproc dependent (if out-of-tree).

Not sure what you are proposing here, since you cannot retrieve a rproc
handle. We use this to perform address translations in rpmsg drivers
since all the addresses are with the rproc device.

> The alternative could be to declare the rpmsg device in device tree as child of the rproc platform device...

And that is completely orthogonal and doesn't solve the current scenario
where rpmsg devices are created through the virtio-rpmsg bus nameservice
announcement.

regards
Suman


> 
> Regards,
> Arnaud
> 
>>
>>>  	rvdev->dev.dma_pfn_offset = rproc->dev.parent->dma_pfn_offset;
>>>  	rvdev->dev.release = rproc_rvdev_release;
>>>  	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
>>
>> Be mindful there might be fallouts from applying this patch since it does change
>> the location of the vdev under /sys/device/platform/ .
>>
>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>
>>> -- 
>>> 2.23.0
>>>
