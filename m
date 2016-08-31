Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 31 Aug 2016 09:37:48 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] remoteproc: core: Add fixed memory region support
Message-ID: <20160831163747.GT15161@tuxbot>
References: <1472242795-23970-1-git-send-email-loic.pallardy@st.com>
 <1472242795-23970-3-git-send-email-loic.pallardy@st.com>
 <20160827003244.GL15161@tuxbot>
 <a56a6ff2-79c5-81d8-0891-a55bae2af184@st.com>
 <84241cf3-245e-0228-3b6e-1420076fae38@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84241cf3-245e-0228-3b6e-1420076fae38@ti.com>
To: Suman Anna <s-anna@ti.com>
Cc: loic pallardy <loic.pallardy@st.com>, ohad@wizery.com, lee.jones@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 30 Aug 16:13 PDT 2016, Suman Anna wrote:

> >>> +    if (rsc->vring[i].da != 0 && rsc->vring[i].da != FW_RSC_ADDR_ANY) {
[..]
> >> @Suman, do you have any input on this?
> 

Thanks Suman

> I was thinking about this as well, and the way I actually envisioned
> this is to add additional rproc_ops with the default behavior falling
> back to the dma_alloc API. I had two use-cases in mind for that - one is
> the same as what Loic is trying to resolve here, and the other is a case
> where I want to allocate these memories not through DMA API, but like
> say allocate from an remote processor internal RAM or an on-chip
> internal memory.

Are these cases a matter of mapping the chunks with ioremap, or are
there more fancy setups that would affect how we load the data into them
as well?

Also, in the case of you mapping vrings in on-chip memory, would you use
the resource table to communicate these addresses or are they simply
hard coded in the loaded firmware?

> This is the case atleast for vrings and vring buffers.
> I think these decisions are best made in the individual platform drivers
> as the integration can definitely vary from one SoC to another.
> 

This touches upon the discussion related to how to support fixed
position vring buffers.

> The other thing this series makes an assumption is that with a fixed da,
> it is assuming the device is not behind an MMU, and whatever da is
> pointing to is a bus accessible address.

But doesn't the current code do the same?
Isn't the "dma" that we assign "da" the physical address of the memory?

> We have traditional meant the
> da as "device address" so it translated as bus address on devices that
> are not behind an MMU, or actual virtual addresses as seen by the device
> if behind an MMU.

I like the idea of making this the uniform design among the various
resource types.

> On TI SoCs on some devices, we do have an MMU and so
> we have a non (-1) da, but it is not valid for memremapping.
> At the same time, we would also need any allocated address to be filled in.

Right, so analog to the carveout case we need to allocate memory and
potentially map the memory in the iommu.

As this case then repeats itself for the vring (rpmsg) buffers I think
we should strive for representing and handling all these memory
allocations in a more uniform way.

Regards,
Bjorn
