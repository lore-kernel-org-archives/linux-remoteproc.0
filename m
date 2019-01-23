Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:44574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726307AbfAWVEf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 23 Jan 2019 16:04:35 -0500
Date: Wed, 23 Jan 2019 13:04:33 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Xen-devel] [RFC] virtio_ring: check dma_mem for xen_domain
In-Reply-To: <20190123071232.GA20526@infradead.org>
Message-ID: <alpine.DEB.2.10.1901230935280.17936@sstabellini-ThinkPad-X260>
References: <20190121050056.14325-1-peng.fan@nxp.com> <alpine.DEB.2.10.1901221113410.17936@sstabellini-ThinkPad-X260> <20190123071232.GA20526@infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-remoteproc-owner@vger.kernel.org
To: "hch@infradead.org" <hch@infradead.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Peng Fan <peng.fan@nxp.com>, "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, luto@kernel.org, jgross@suse.com, boris.ostrovsky@oracle.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, 22 Jan 2019, hch@infradead.org wrote:
> On Tue, Jan 22, 2019 at 11:59:31AM -0800, Stefano Stabellini wrote:
> > >  	if (!virtio_has_iommu_quirk(vdev))
> > >  		return true;
> > >  
> > > @@ -260,7 +262,7 @@ static bool vring_use_dma_api(struct virtio_device *vdev)
> > >  	 * the DMA API if we're a Xen guest, which at least allows
> > >  	 * all of the sensible Xen configurations to work correctly.
> > >  	 */
> > > -	if (xen_domain())
> > > +	if (xen_domain() && !dma_dev->dma_mem)
> > >  		return true;
> > >  
> > >  	return false;
> > 
> > I can see you spotted a real issue, but this is not the right fix. We
> > just need something a bit more flexible than xen_domain(): there are
> > many kinds of Xen domains on different architectures, we basically want
> > to enable this (return true from vring_use_dma_api) only when the xen
> > swiotlb is meant to be used. Does the appended patch fix the issue you
> > have?
> 
> The problem generally is the other way around - if dma_dev->dma_mem
> is set the device decription in the device tree explicitly requires
> using this memory, so we must _always_ use the DMA API.
> 
> The problem is just that that rproc driver absuses the DMA API
> in horrible ways.

If vring_use_dma_api is actually supposed to return true when
dma_dev->dma_mem is set, then both Peng's patch and the patch I wrote
are not fixing the real issue here.

I don't know enough about remoteproc to know where the problem actually
lies though.
