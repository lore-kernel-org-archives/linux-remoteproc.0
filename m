Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH 2/2] remoteproc: core: Add fixed memory region support
References: <1472242795-23970-1-git-send-email-loic.pallardy@st.com>
 <1472242795-23970-3-git-send-email-loic.pallardy@st.com>
 <20160827003244.GL15161@tuxbot> <a56a6ff2-79c5-81d8-0891-a55bae2af184@st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <84241cf3-245e-0228-3b6e-1420076fae38@ti.com>
Date: Tue, 30 Aug 2016 18:13:43 -0500
MIME-Version: 1.0
In-Reply-To: <a56a6ff2-79c5-81d8-0891-a55bae2af184@st.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
To: loic pallardy <loic.pallardy@st.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: ohad@wizery.com, lee.jones@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Loic, Bjorn,

On 08/29/2016 03:09 AM, loic pallardy wrote:
> 
> 
> On 08/27/2016 02:32 AM, Bjorn Andersson wrote:
>> On Fri 26 Aug 13:19 PDT 2016, Loic Pallardy wrote:
>>
>>> Some coprocessors request fixed memory mapping for firmware execution
>>> and associated communication linked.
>>> Memory resources are defined in firmware resource table.
>>> Resource address different from 0x0 and 0xFFFFFFFF is considered as
>>> predefined
>>
>> Do you think we're required to support both 0 and -1 for this?
> Hi Bjorn,
> You're right, only -1 is needed. SoC can have internal RAM in 0x0 for
> example.
> I'll update in a V2.
>>
>>> and already reserved at system level.
>>> In that case, remoteproc core doesn't need to perform any allocation.
>>> Memory region access can be managed using memremap/memunmap functions
>>>
>>> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
>>> ---
>>>  drivers/remoteproc/remoteproc_core.c | 61
>>> ++++++++++++++++++++++++++----------
>>>  include/linux/remoteproc.h           |  4 +++
>>>  2 files changed, 49 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/remoteproc/remoteproc_core.c
>>> b/drivers/remoteproc/remoteproc_core.c
>>> index 18f4286..0ddbb92 100644
>>> --- a/drivers/remoteproc/remoteproc_core.c
>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>> @@ -213,13 +213,25 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev,
>>> int i)
>>>      /* actual size of vring (in bytes) */
>>>      size = PAGE_ALIGN(vring_size(rvring->len, rvring->align));
>>>
>>> -    /*
>>> -     * Allocate non-cacheable memory for the vring. In the future
>>> -     * this call will also configure the IOMMU for us
>>> -     */
>>> -    va = dma_alloc_coherent(dev->parent, size, &dma, GFP_KERNEL);
>>> +    rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
>>> +
>>> +    /* check if specific memory region requested by firmware */
>>> +    if (rsc->vring[i].da != 0 && rsc->vring[i].da != FW_RSC_ADDR_ANY) {
>>
>> I think we should convert that reserved field in the vring to a "pa";
>> allowing this resource to not be 1:1 mapped into the remote. And if
>> nothing else just to be consistent with the carveouts and devmem.
> In fact vring doesn't have pa because coprocessor diretly access it
> without help of hardware accelerator. On both carveout and devmem,
> hardware accelerators may be used.
> That's true having pa field will be more consistent from host pov.

I agree, and I actually have a need for the pa/dma address without
disturbing the da as well.
> 
> Regards,
> Loic
> 
>>
>> @Suman, do you have any input on this?

I was thinking about this as well, and the way I actually envisioned
this is to add additional rproc_ops with the default behavior falling
back to the dma_alloc API. I had two use-cases in mind for that - one is
the same as what Loic is trying to resolve here, and the other is a case
where I want to allocate these memories not through DMA API, but like
say allocate from an remote processor internal RAM or an on-chip
internal memory. This is the case atleast for vrings and vring buffers.
I think these decisions are best made in the individual platform drivers
as the integration can definitely vary from one SoC to another.

The other thing this series makes an assumption is that with a fixed da,
it is assuming the device is not behind an MMU, and whatever da is
pointing to is a bus accessible address. We have traditional meant the
da as "device address" so it translated as bus address on devices that
are not behind an MMU, or actual virtual addresses as seen by the device
if behind an MMU. On TI SoCs on some devices, we do have an MMU and so
we have a non (-1) da, but it is not valid for memremapping.
At the same time, we would also need any allocated address to be filled in.

regards
Suman
