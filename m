Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:63286 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728200AbfAJNGp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 10 Jan 2019 08:06:45 -0500
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [rpmsg PATCH v2 1/1] rpmsg: virtio_rpmsg_bus: fix unexpected huge
 vmap mappings
Date: Thu, 10 Jan 2019 13:06:23 +0000
Message-ID: <42cbdef19ad74f84bc1222c3ad828487@SFHDAG7NODE2.st.com>
References: <1545812449-32455-1-git-send-email-fugang.duan@nxp.com>
 <CAKv+Gu-zfTZAZfiQt1iUn9otqeDkJP-y-siuBUrWUR-Kq=BsVQ@mail.gmail.com>
 <20181226145048.GA24307@infradead.org>
 <VI1PR0402MB3600AC833D6F29ECC34C8D4CFFB60@VI1PR0402MB3600.eurprd04.prod.outlook.com>
 <20181227121901.GA20892@infradead.org>
 <VI1PR0402MB3600799A06B6BFE5EBF8837FFFB70@VI1PR0402MB3600.eurprd04.prod.outlook.com>
 <VI1PR0402MB36000BD05AF4B242E13D9D05FF840@VI1PR0402MB3600.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR0402MB36000BD05AF4B242E13D9D05FF840@VI1PR0402MB3600.eurprd04.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-remoteproc-owner@vger.kernel.org
To: Andy Duan <fugang.duan@nxp.com>, Christoph Hellwig <hch@infradead.org>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Linux-MM <linux-mm@kvack.org>, Robin Murphy <robin.murphy@arm.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "anup@brainfault.org" <anup@brainfault.org>, dl-linux-imx <linux-imx@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, Jason Liu <jason.hui.liu@nxp.com>, Peng Fan <peng.fan@nxp.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Andy,

> -----Original Message-----
> From: Andy Duan <fugang.duan@nxp.com>
> Sent: jeudi 10 janvier 2019 02:45
> To: Christoph Hellwig <hch@infradead.org>; bjorn.andersson@linaro.org;
> ohad@wizery.com
> Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>; Andrew Morton
> <akpm@linux-foundation.org>; Linux-MM <linux-mm@kvack.org>; Robin
> Murphy <robin.murphy@arm.com>; linux-remoteproc@vger.kernel.org;
> anup@brainfault.org; Loic PALLARDY <loic.pallardy@st.com>; dl-linux-imx
> <linux-imx@nxp.com>; Richard Zhu <hongxing.zhu@nxp.com>; Jason Liu
> <jason.hui.liu@nxp.com>; Peng Fan <peng.fan@nxp.com>
> Subject: RE: [rpmsg PATCH v2 1/1] rpmsg: virtio_rpmsg_bus: fix unexpected
> huge vmap mappings
> 
> From: Andy Duan Sent: 2018年12月28日 9:48
> > From: Christoph Hellwig <hch@infradead.org> Sent: 2018年12月27日
> > 20:19
> > > On Thu, Dec 27, 2018 at 02:36:53AM +0000, Andy Duan wrote:
> > > > Rpmsg is used to communicate with remote cpu like M4, the allocated
> > > > memory is shared by Linux and M4 side. In general, Linux side
> > > > reserved the static memory region like per-device DMA pool as
> > > > coherent memory for the RPMSG receive/transmit buffers. For the
> > > > static memory region, normal page allocator cannot match the
> > > > requirement unless there have protocol to tell M4 the dynamic RPMSG
> > receive/transmit buffers.
> > >
> > > In that case you need a OF reserved memory node, like we use for the
> > > "shared-dma-pool" coherent or contiguous allocations.  Currently we
> > > have those two variants wired up the the DMA allocator, but they can
> > > also used directly by drivers.  To be honest I don't really like like
> > > drivers getting too intimate with the memory allocator, but I also
> > > don't think that providing a little glue code to instanciat a CMA pool
> > > for a memory that can be used directly by the driver is much of an
> > > issue.  Most of it could be reused from the existing code, just with a
> slightly
> > lower level interfaces.
> > >
> > > > To stop to extract pages from dma_alloc_coherent, the rpmsg bus
> > > > implementation base on virtio that already use the scatterlist
> > > > mechanism for vring memory. So for virtio driver like RPMSG bus, we
> > > > have to extract pages from dma_alloc_coherent.
> > >
> > > This sentence doesn't parse for me.
> >
> > Virtio supply the APIs that require the scatterlist pages for virtio in/out buf:
> > int virtqueue_add_inbuf(struct virtqueue *vq,
> >                         struct scatterlist *sg, unsigned int num,
> >                         void *data,
> >                         gfp_t gfp)
> > int virtqueue_add_outbuf(struct virtqueue *vq,
> >                          struct scatterlist *sg, unsigned int num,
> >                          void *data,
> >                          gfp_t gfp)
> >
> >
> > >
> > > > I don't think the patch is one hack,  as we already know the
> > > > physical address for the coherent memory,  just want to get pages,
> > > > the interface "pfn_to_page(PHYS_PFN(x))" is very reasonable to the
> > > > related pages.
> > >
> > > struct scatterlist doesn't (directly) refer to physical address, it
> > > refers to page structures, which encode a kernel virtual address in
> > > the kernel direct mapping, and we intentionally do not guarantee a
> > > return in the kernel direct mapping for the DMA coherent allocator, as
> > > in many cases we have to either allocate from a special pool, from a
> > > special address window or remap memory to mark it as uncached.  How
> > > that is done is an implenentation detail that is not exposed to drivers and
> > may change at any time.
> > >
> > > > If you stick to use normal page allocator and streaming DMA API in
> > > > RPMSG,  then we have to:
> > > > - add new quirk feature for virtio like the same function as
> > > > "VIRTIO_F_IOMMU_PLATFORM",
> > >
> > > You have to do that anyway.
> >
> > I discuss with our team, use page allocator cannot match our requirement.
> > i.MX8QM/QXP platforms have partition feature that limit M4 only access
> fixed
> > ddr memory region. Suppose other platforms also have similar limitation
> for
> > secure case.
> >
> > So it requires to use OF reserved memory for the "shared-dma-pool"
> coherent
> > or contiguous allocations.
> >
> Do you have any other comments for the patch ?

I tried your patch on ST platform and it doesn't compile neither on kernel v5.0-rc1 nor on Bjorn's rpmsg-next.
dma_to_phys() is unknown as dma-direct.h not included and ‘struct virtproc_info’ has no member named ‘bufs_dev’.

Could you please send a new version fixing compilation issue. I would like to test it on my platform to provide you feedback.

Regards,
Loic

> Current driver break remoteproc on NXP i.MX8 platform , the patch is bugfix
> the virtio rpmsg bus, we hope the patch enter to next and stable tree if no
> other comments.
