Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:45568 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727979AbfAUI2f (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Jan 2019 03:28:35 -0500
Date: Mon, 21 Jan 2019 00:28:30 -0800
From: "hch@infradead.org" <hch@infradead.org>
Subject: Re: [RFC] virtio_ring: check dma_mem for xen_domain
Message-ID: <20190121082830.GC12420@infradead.org>
References: <20190121050056.14325-1-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190121050056.14325-1-peng.fan@nxp.com>
Sender: linux-remoteproc-owner@vger.kernel.org
To: Peng Fan <peng.fan@nxp.com>
Cc: "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, "hch@infradead.org" <hch@infradead.org>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Jan 21, 2019 at 04:51:57AM +0000, Peng Fan wrote:
> on i.MX8QM, M4_1 is communicating with DomU using rpmsg with a fixed
> address as the dma mem buffer which is predefined.
> 
> Without this patch, the flow is:
> vring_map_one_sg -> vring_use_dma_api
>                  -> dma_map_page
> 		       -> __swiotlb_map_page
> 		                ->swiotlb_map_page
> 				->__dma_map_area(phys_to_virt(dma_to_phys(dev, dev_addr)), size, dir);
> However we are using per device dma area for rpmsg, phys_to_virt
> could not return a correct virtual address for virtual address in
> vmalloc area. Then kernel panic.

And that is the right thing to do.  You must not call dma_map_* on
memory that was allocated from dma_alloc_*.

We actually have another thread which appears to be for this same issue.
