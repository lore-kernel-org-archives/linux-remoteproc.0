Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 16 Sep 2016 11:12:03 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 3/3] remoteproc: core: add rproc ops for memory
 allocation
Message-ID: <20160916181203.GI21438@tuxbot>
References: <1473147584-13183-1-git-send-email-loic.pallardy@st.com>
 <1473147584-13183-4-git-send-email-loic.pallardy@st.com>
 <20160915172743.GE21438@tuxbot>
 <10b33f31-8e6f-2ea8-87bd-e9725aeacaea@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10b33f31-8e6f-2ea8-87bd-e9725aeacaea@st.com>
To: loic pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, lee.jones@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 16 Sep 00:47 PDT 2016, loic pallardy wrote:

> 
> 
> On 09/15/2016 07:27 PM, Bjorn Andersson wrote:
> >On Tue 06 Sep 00:39 PDT 2016, Loic Pallardy wrote:
> >
> >>Remoteproc core is currently using dma_alloc_coherent for
> >>carveout and vring allocation.
> >>It doesn't allow to support specific use cases like fixed memory
> >>region or internal RAM support.
> >>
> >>Two new rproc ops (alloc and free) is added to provide flexibility
> >>to platform implementation to provide specific memory allocator
> >>taking into account coprocessor characteristics.
> >>rproc_handle_carveout and rproc_alloc_vring functions are modified
> >>to invoke these ops if present, and fallback to regular processing
> >>if platform specific allocation failed and if resquested memory is
> >>not fixed (physical address == FW_RSC_ADDR_ANY)
> >>
> >>Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> >>---
> >> drivers/remoteproc/remoteproc_core.c | 67 ++++++++++++++++++++++++++++++------
> >> include/linux/remoteproc.h           |  4 +++
> >> 2 files changed, 60 insertions(+), 11 deletions(-)
> >>
> >>diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >>index 0d3c191..7493b08 100644
> >>--- a/drivers/remoteproc/remoteproc_core.c
> >>+++ b/drivers/remoteproc/remoteproc_core.c
> >>@@ -207,19 +207,29 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
> >> 	struct rproc_vring *rvring = &rvdev->vring[i];
> >> 	struct fw_rsc_vdev *rsc;
> >> 	dma_addr_t dma;
> >>-	void *va;
> >>+	void *va = NULL;
> >> 	int ret, size, notifyid;
> >>
> >> 	/* actual size of vring (in bytes) */
> >> 	size = PAGE_ALIGN(vring_size(rvring->len, rvring->align));
> >>
> >>+	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
> >>+
> >> 	/*
> >> 	 * Allocate non-cacheable memory for the vring. In the future
> >> 	 * this call will also configure the IOMMU for us
> >> 	 */
> >>-	va = dma_alloc_coherent(dev->parent, size, &dma, GFP_KERNEL);
> >>+
> >>+	dma = rsc->vring[i].pa;
> >>+
> >>+	if (rproc->ops->alloc)
> >>+		va = rproc->ops->alloc(rproc, size, &dma);
> >
> >I believe this will be awkward for the remoteproc drivers to implement.
> >
> >Imagine a driver that programmatically register some fixed positioned
> >carveouts and ioremapped vring buffers, it would then need internal book
> >keeping to figure out which type of allocation each call is related to.
> 
> Yes true like any allocator does. And it is needed to manage region overlap.

Right, but I'm hoping we don't have to make each remoteproc driver an
allocator - that we rather just have the drivers register a set of
regions with the core and then that's matched with the resource table.

Otherwise there will be a lot of duplicated boilerplate code in the drivers.

> >
> >
> >Rather then deferring the allocation until this point I think we should
> >tie a rproc_mem_entry to each vring and once we reach
> >rproc_alloc_vring() we simply use "va" and "dma" from that.
> >
> >We would get this from rproc_parse_vring() checking to find an existing
> >mem_entry matching the vring requirements (da, then pa) and falling back
> >to allocating a new carveout mem_entry.
> >
> This doesn't answer to use case described by Suman. What if no specific
> address are requested in firmware resource table, but buffers need to be
> allocated in internal RAM for example. Only rproc driver will know on which
> allocator to rely.
> 

If the vrings are listed with FW_RSC_ADDR_ANY as both da and pa, then we
have no way to match it towards an allocation and the same would go for
your proposed API. The alloc() function would not know if the request is
for a carveout or vring - or for which vring it is.

For the case of the vrings residing in some device memory that we
ioremap it makes sense to specify the "pa" for this in the resource
table and we can match this towards a rproc_mem_entry.

For the case of the vrings being allocated from sram using a dynamic
allocator, we're out of luck with the current resource table - we have
nothing to match this on.
By associating a rproc_mem_entry to the vring a driver could
programmatically register a vdev with a set of vrings with oddly
allocated memory. But there is no standard way of communicating these
addresses to the remote.

> By memremaping a complete memory area and offering va to dma (pa)
> conversion, you don't verify possible overlap between requested regions.
> This is done today by allocator.
> 

I share this view, I don't think we should rely on da_to_va() here, but
rather only match whole rproc_mem_entries.

> The idea from ST pov, was to rely on memory region, to declare subdev
> associated to rproc driver and to rely on dma_alloc_coherent.
> I think TI wants to rely on its internal RAM memory allocator.
> 

There are additional constraints, beyond using a fixed "pa" that makes
the ST suggestion of creating a dma-dev worth while - e.g. hardware that
can only address parts of RAM.
But as we've concluded we have an issue with dma_alloc_coherent() not
dealing with non-power-of-two sized memory regions. So this is something
I hope to discuss with people during Linaro Connect.

The issue with the setup of registering subdevices and then separately
registering a carveout that matches up is that in the Qualcomm driver I
want to be able to reuse the subdevice thing, but I don't want to create
a resource table as well, just to "trigger" the allocation.


In addition to that we still have the request of allowing ioremapped
regions used instead of dma_alloc_coherent() and in an extension other
types of allocators. If we can represent all these types of regions in a
single list of rproc_mem_entries then the users (firmware, vrings,
trace...) will be oblivious to what type of allocation they are residing
in.

I'll write up a few patches to show what I'm suggesting.

Regards,
Bjorn
