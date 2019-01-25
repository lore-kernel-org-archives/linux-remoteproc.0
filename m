Return-Path: <sstabellini@kernel.org>
Date: Fri, 25 Jan 2019 11:18:18 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
Subject: RE: [Xen-devel] [RFC] virtio_ring: check dma_mem for xen_domain
In-Reply-To: <AM0PR04MB4481F3986CFB6D1EF26FA135889B0@AM0PR04MB4481.eurprd04.prod.outlook.com>
Message-ID: <alpine.DEB.2.10.1901251116490.17936@sstabellini-ThinkPad-X260>
References: <20190121050056.14325-1-peng.fan@nxp.com> <alpine.DEB.2.10.1901221113410.17936@sstabellini-ThinkPad-X260> <20190123071232.GA20526@infradead.org> <alpine.DEB.2.10.1901230935280.17936@sstabellini-ThinkPad-X260> <20190123211405.GA4971@infradead.org>
 <AM0PR04MB4481F3986CFB6D1EF26FA135889B0@AM0PR04MB4481.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-143402054-1548443899=:17936"
To: Peng Fan <peng.fan@nxp.com>
Cc: "hch@infradead.org" <hch@infradead.org>, Stefano Stabellini <sstabellini@kernel.org>, "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "luto@kernel.org" <luto@kernel.org>, "jgross@suse.com" <jgross@suse.com>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, Andy Duan <fugang.duan@nxp.com>, bjorn.andersson@linaro.org, ohad@wizery.com
List-ID: <linux-remoteproc@vger.kernel.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-143402054-1548443899=:17936
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 25 Jan 2019, Peng Fan wrote:
> > On Wed, Jan 23, 2019 at 01:04:33PM -0800, Stefano Stabellini wrote:
> > > If vring_use_dma_api is actually supposed to return true when
> > > dma_dev->dma_mem is set, then both Peng's patch and the patch I wrote
> > > are not fixing the real issue here.
> > >
> > > I don't know enough about remoteproc to know where the problem
> > > actually lies though.
> > 
> > The problem is the following:
> > 
> > Devices can declare a specific memory region that they want to use when the
> > driver calls dma_alloc_coherent for the device, this is done using the
> > shared-dma-pool DT attribute, which comes in two variants that would be a
> > little to much to explain here.
> > 
> > remoteproc makes use of that because apparently the device can only
> > communicate using that region.  But it then feeds back memory obtained
> > with dma_alloc_coherent into the virtio code.  For that it calls
> > vmalloc_to_page on the dma_alloc_coherent, which is a huge no-go for the
> > ĐMA API and only worked accidentally on a few platform, and apparently
> > arm64 just changed a few internals that made it stop working for remoteproc.
> > 
> > The right answer is to not use the DMA API to allocate memory from a
> > device-speficic region, but to tie the driver directly into the DT reserved
> > memory API in a way that allows it to easilt obtain a struct device for it.
> 
> Just have a question, 
> 
> Since vmalloc_to_page is ok for cma area, no need to take cma and per device
> cma into consideration right? 
> 
> we only need to implement a piece code to handle per device specific region
> using RESERVEDMEM_OF_DECLARE, just like:
> RESERVEDMEM_OF_DECLARE(rpmsg-dma, "rpmsg-dma-pool", 
> rmem_rpmsg_dma_setup);
> And implement the device_init call back and build a map between page and phys.
> Then in rpmsg driver, scatter list could use page structure, no need vmalloc_to_page
> for per device dma.
> 
> Is this the right way?

I CC'ed the rpmsg maintainers, you want to keep them in the loop on
this.
--8323329-143402054-1548443899=:17936--
