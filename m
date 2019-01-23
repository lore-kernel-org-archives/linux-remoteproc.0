Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:52148 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726322AbfAWVOJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 23 Jan 2019 16:14:09 -0500
Date: Wed, 23 Jan 2019 13:14:05 -0800
From: "hch@infradead.org" <hch@infradead.org>
Subject: Re: [Xen-devel] [RFC] virtio_ring: check dma_mem for xen_domain
Message-ID: <20190123211405.GA4971@infradead.org>
References: <20190121050056.14325-1-peng.fan@nxp.com>
 <alpine.DEB.2.10.1901221113410.17936@sstabellini-ThinkPad-X260>
 <20190123071232.GA20526@infradead.org>
 <alpine.DEB.2.10.1901230935280.17936@sstabellini-ThinkPad-X260>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.10.1901230935280.17936@sstabellini-ThinkPad-X260>
Sender: linux-remoteproc-owner@vger.kernel.org
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "hch@infradead.org" <hch@infradead.org>, Peng Fan <peng.fan@nxp.com>, "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, luto@kernel.org, jgross@suse.com, boris.ostrovsky@oracle.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, Jan 23, 2019 at 01:04:33PM -0800, Stefano Stabellini wrote:
> If vring_use_dma_api is actually supposed to return true when
> dma_dev->dma_mem is set, then both Peng's patch and the patch I wrote
> are not fixing the real issue here.
> 
> I don't know enough about remoteproc to know where the problem actually
> lies though.

The problem is the following:

Devices can declare a specific memory region that they want to use when
the driver calls dma_alloc_coherent for the device, this is done using
the shared-dma-pool DT attribute, which comes in two variants that
would be a little to much to explain here.

remoteproc makes use of that because apparently the device can
only communicate using that region.  But it then feeds back memory
obtained with dma_alloc_coherent into the virtio code.  For that
it calls vmalloc_to_page on the dma_alloc_coherent, which is a huge
no-go for the ĐMA API and only worked accidentally on a few platform,
and apparently arm64 just changed a few internals that made it stop
working for remoteproc.

The right answer is to not use the DMA API to allocate memory from
a device-speficic region, but to tie the driver directly into the
DT reserved memory API in a way that allows it to easilt obtain
a struct device for it.

This is orthogonal to another issue, and that is that hardware
virtio devices really always need to use the DMA API, otherwise
we'll bypass such features as the device specific DMA pools,
DMA offsets, cache flushing, etc, etc.
