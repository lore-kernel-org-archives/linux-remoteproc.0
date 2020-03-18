Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Subject: Re: [PATCH 2/2] remoteproc: Fix and restore the parenting hierarchy
 for vdev
References: <20200305224108.21351-1-s-anna@ti.com>
 <20200305224108.21351-3-s-anna@ti.com> <20200317180530.GA1801@xps15>
Message-ID: <76772d98-93d9-e559-01b8-ba7d4d1cc1eb@st.com>
Date: Wed, 18 Mar 2020 17:38:29 +0100
MIME-Version: 1.0
In-Reply-To: <20200317180530.GA1801@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Loic Pallardy <loic.pallardy@st.com>, Tero Kristo <t-kristo@ti.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Suman, Mathieu,

On 3/17/20 7:05 PM, Mathieu Poirier wrote:
> Hi Suman,
> 
> On Thu, Mar 05, 2020 at 04:41:08PM -0600, Suman Anna wrote:
>> The commit 086d08725d34 ("remoteproc: create vdev subdevice with specific
>> dma memory pool") has introduced a new vdev subdevice for each vdev
>> declared in the firmware resource table and made it as the parent for the
>> created virtio rpmsg devices instead of the previous remoteproc device.
>> This changed the overall parenting hierarchy for the rpmsg devices, which
>> were children of virtio devices, and does not allow the corresponding
>> rpmsg drivers to retrieve the parent rproc device through the
>> rproc_get_by_child() API.
>>
>> Fix this by restoring the remoteproc device as the parent. The new vdev
>> subdevice can continue to inherit the DMA attributes from the remoteproc's
>> parent device (actual platform device).
>>
>> Fixes: 086d08725d34 ("remoteproc: create vdev subdevice with specific dma memory pool")
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 097f33e4f1f3..ba18f32bd0c4 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -510,7 +510,7 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
>>  
>>  	/* Initialise vdev subdevice */
>>  	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
>> -	rvdev->dev.parent = rproc->dev.parent;
>> +	rvdev->dev.parent = &rproc->dev;
> 
> I can see how it would not be possible to retrieve the parent rproc device since
> rvdev->dev.parent was set to be platform device...

In rpmsg_virtio_bus.c [1] the vdev buffers are allocated in a memory region using a dma_alloc_coherent
So the buffers are allocated in the platform driver memory region if declared, else in the default memory region. 

According to  086d08725d34 ("remoteproc: create vdev subdevice with specific dma memory pool"),
A patch has been integrated in rpmsg framework:  d999b622fcfb3 ("rpmsg: virtio: allocate buffer from parent")

-	bufs_va = dma_alloc_coherent(vdev->dev.parent->parent,
+	bufs_va = dma_alloc_coherent(vdev->dev.parent,

So in term of parent-child relationchip the Loic's patches seem coherent, and don't affect parenting hierarchy
for the rpmsg bus.

So It seems to me that this patch breaks the relationship between the rpmsg bus
and the rproc platform driver, at least concerning the buffer allocation.
But on the other side this patch doesn't introduce regression for rpmsg bus on my platform... 

I probably missed something important because i can not figure out how this patch don't introduce regression.
Can the rproc->dev inherits from the rproc platform device in term of memory regions?

[1]: https://elixir.bootlin.com/linux/latest/source/drivers/rpmsg/virtio_rpmsg_bus.c#L915
[2]: https://lkml.org/lkml/2018/11/30/180

> 
> I wonder how the original change didn't blow up sysmon_probe() and potentially
> other out-of-tree users of rproc_get_by_child().  It would be nice to have
> someone from the QCOM team test your patch.

You are right the rproc platform device is now the grand parent of a rpmsg device, while before it was the parent.
Anyway, does it makes sense to have this kind of dependency between rpmsg device and rproc device?
The fix could be done in the rpmsg device that would be rproc dependent (if out-of-tree).  
The alternative could be to declare the rpmsg device in device tree as child of the rproc platform device...

Regards,
Arnaud

> 
>>  	rvdev->dev.dma_pfn_offset = rproc->dev.parent->dma_pfn_offset;
>>  	rvdev->dev.release = rproc_rvdev_release;
>>  	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
> 
> Be mindful there might be fallouts from applying this patch since it does change
> the location of the vdev under /sys/device/platform/ .
> 
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> 
>> -- 
>> 2.23.0
>>
