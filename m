Return-Path: <loic.pallardy@st.com>
Subject: Re: [PATCH v2 3/3] remoteproc: core: add rproc ops for memory
 allocation
References: <1473147584-13183-1-git-send-email-loic.pallardy@st.com>
 <1473147584-13183-4-git-send-email-loic.pallardy@st.com>
 <20160915172743.GE21438@tuxbot>
From: loic pallardy <loic.pallardy@st.com>
Message-ID: <10b33f31-8e6f-2ea8-87bd-e9725aeacaea@st.com>
Date: Fri, 16 Sep 2016 09:47:29 +0200
MIME-Version: 1.0
In-Reply-To: <20160915172743.GE21438@tuxbot>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: ohad@wizery.com, lee.jones@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>



On 09/15/2016 07:27 PM, Bjorn Andersson wrote:
> On Tue 06 Sep 00:39 PDT 2016, Loic Pallardy wrote:
>
>> Remoteproc core is currently using dma_alloc_coherent for
>> carveout and vring allocation.
>> It doesn't allow to support specific use cases like fixed memory
>> region or internal RAM support.
>>
>> Two new rproc ops (alloc and free) is added to provide flexibility
>> to platform implementation to provide specific memory allocator
>> taking into account coprocessor characteristics.
>> rproc_handle_carveout and rproc_alloc_vring functions are modified
>> to invoke these ops if present, and fallback to regular processing
>> if platform specific allocation failed and if resquested memory is
>> not fixed (physical address == FW_RSC_ADDR_ANY)
>>
>> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 67 ++++++++++++++++++++++++++++++------
>>  include/linux/remoteproc.h           |  4 +++
>>  2 files changed, 60 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 0d3c191..7493b08 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -207,19 +207,29 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
>>  	struct rproc_vring *rvring = &rvdev->vring[i];
>>  	struct fw_rsc_vdev *rsc;
>>  	dma_addr_t dma;
>> -	void *va;
>> +	void *va = NULL;
>>  	int ret, size, notifyid;
>>
>>  	/* actual size of vring (in bytes) */
>>  	size = PAGE_ALIGN(vring_size(rvring->len, rvring->align));
>>
>> +	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
>> +
>>  	/*
>>  	 * Allocate non-cacheable memory for the vring. In the future
>>  	 * this call will also configure the IOMMU for us
>>  	 */
>> -	va = dma_alloc_coherent(dev->parent, size, &dma, GFP_KERNEL);
>> +
>> +	dma = rsc->vring[i].pa;
>> +
>> +	if (rproc->ops->alloc)
>> +		va = rproc->ops->alloc(rproc, size, &dma);
>
> I believe this will be awkward for the remoteproc drivers to implement.
>
> Imagine a driver that programmatically register some fixed positioned
> carveouts and ioremapped vring buffers, it would then need internal book
> keeping to figure out which type of allocation each call is related to.

Yes true like any allocator does. And it is needed to manage region overlap.
>
>
> Rather then deferring the allocation until this point I think we should
> tie a rproc_mem_entry to each vring and once we reach
> rproc_alloc_vring() we simply use "va" and "dma" from that.
>
> We would get this from rproc_parse_vring() checking to find an existing
> mem_entry matching the vring requirements (da, then pa) and falling back
> to allocating a new carveout mem_entry.
>
This doesn't answer to use case described by Suman. What if no specific 
address are requested in firmware resource table, but buffers need to be 
allocated in internal RAM for example. Only rproc driver will know on 
which allocator to rely.

By memremaping a complete memory area and offering va to dma (pa) 
conversion, you don't verify possible overlap between requested regions. 
This is done today by allocator.

The idea from ST pov, was to rely on memory region, to declare subdev 
associated to rproc driver and to rely on dma_alloc_coherent.
I think TI wants to rely on its internal RAM memory allocator.

Regards,
Loic

>
> By then making the current "carveouts" list heterogeneous we would allow
> for arbitrary memory types to be used for backing vrings, as well as
> trace devices, code and data segments.
>
> Regards,
> Bjorn
>
