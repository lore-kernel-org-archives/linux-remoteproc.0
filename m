Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH 2/2] remoteproc: core: Add fixed memory region support
References: <1472242795-23970-1-git-send-email-loic.pallardy@st.com>
 <1472242795-23970-3-git-send-email-loic.pallardy@st.com>
 <20160827003244.GL15161@tuxbot> <a56a6ff2-79c5-81d8-0891-a55bae2af184@st.com>
 <84241cf3-245e-0228-3b6e-1420076fae38@ti.com> <20160831163747.GT15161@tuxbot>
From: Suman Anna <s-anna@ti.com>
Message-ID: <b45a4b39-a4a5-ad46-cbbb-112727996560@ti.com>
Date: Wed, 31 Aug 2016 11:55:18 -0500
MIME-Version: 1.0
In-Reply-To: <20160831163747.GT15161@tuxbot>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: loic pallardy <loic.pallardy@st.com>, ohad@wizery.com, lee.jones@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 08/31/2016 11:37 AM, Bjorn Andersson wrote:
> On Tue 30 Aug 16:13 PDT 2016, Suman Anna wrote:
> 
>>>>> +    if (rsc->vring[i].da != 0 && rsc->vring[i].da != FW_RSC_ADDR_ANY) {
> [..]
>>>> @Suman, do you have any input on this?
>>
> 
> Thanks Suman
> 
>> I was thinking about this as well, and the way I actually envisioned
>> this is to add additional rproc_ops with the default behavior falling
>> back to the dma_alloc API. I had two use-cases in mind for that - one is
>> the same as what Loic is trying to resolve here, and the other is a case
>> where I want to allocate these memories not through DMA API, but like
>> say allocate from an remote processor internal RAM or an on-chip
>> internal memory.
> 
> Are these cases a matter of mapping the chunks with ioremap, or are
> there more fancy setups that would affect how we load the data into them
> as well?

The loading can be handled automatically as we do provide the
.da_to_va() ops for individual platform drivers to provide a translation
mechanism. The default ELF loader only needs the kernel va to be able to
copy the data over. In the case of fixed addresses, it is just a matter
of ioremap, but if using the mmio-sram driver, the platform drivers are
responsible for providing you the va and dma.

> 
> Also, in the case of you mapping vrings in on-chip memory, would you use
> the resource table to communicate these addresses or are they simply
> hard coded in the loaded firmware?

It really depends on how the on-chip memory get used. Unless there is a
limitation to use a fixed address location, the normal usage would be
used the mmio-sram driver and the gen_pool API to allocate on-chip
memory. We do fill in the resource table to communicate these addresses
to loaded firmware.

> 
>> This is the case atleast for vrings and vring buffers.
>> I think these decisions are best made in the individual platform drivers
>> as the integration can definitely vary from one SoC to another.
>>
> 
> This touches upon the discussion related to how to support fixed
> position vring buffers.

Indeed, in one of the usage patterns.

> 
>> The other thing this series makes an assumption is that with a fixed da,
>> it is assuming the device is not behind an MMU, and whatever da is
>> pointing to is a bus accessible address.
> 
> But doesn't the current code do the same?
> Isn't the "dma" that we assign "da" the physical address of the memory?

I meant this series is making the assumption. Previously, we were
ignoring the da and overwriting it with the allocated physical address
field, right.

> 
>> We have traditional meant the
>> da as "device address" so it translated as bus address on devices that
>> are not behind an MMU, or actual virtual addresses as seen by the device
>> if behind an MMU.
> 
> I like the idea of making this the uniform design among the various
> resource types.
> 
>> On TI SoCs on some devices, we do have an MMU and so
>> we have a non (-1) da, but it is not valid for memremapping.
>> At the same time, we would also need any allocated address to be filled in.
> 
> Right, so analog to the carveout case we need to allocate memory and
> potentially map the memory in the iommu.
> 
> As this case then repeats itself for the vring (rpmsg) buffers I think
> we should strive for representing and handling all these memory
> allocations in a more uniform way.

Yes agreed. Though there are currently some gaps w.r.t the vrings and
the vring buffers mapping, as the current code doesn't have an
associated iommu_map calls around the allocation. It might be that the
remoteproc would require these to be allocated/mapped in a specific
region for properly configuring the cacheability property around this.
We are using a work-around for the moment to get around this.

regards
Suman
