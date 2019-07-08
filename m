Return-Path: <BATV+84af0ccca5b63497293a+5797+infradead.org+hch@bombadil.srs.infradead.org>
Date: Mon, 8 Jul 2019 11:45:46 -0700
From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2] remoteproc: copy parent dma_pfn_offset for vdev
Message-ID: <20190708184546.GA20670@infradead.org>
References: <20190612095521.4703-1-cleger@kalray.eu>
 <20190701070245.32083-1-cleger@kalray.eu>
 <20190702132229.GA8100@infradead.org>
 <58c8b8bd30a949678c027eb42a1b1bbb@SFHDAG7NODE2.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58c8b8bd30a949678c027eb42a1b1bbb@SFHDAG7NODE2.st.com>
To: Loic PALLARDY <loic.pallardy@st.com>
Cc: Christoph Hellwig <hch@infradead.org>, Clement Leger <cleger@kalray.eu>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Jul 02, 2019 at 03:36:56PM +0000, Loic PALLARDY wrote:
> Agree there is definitively an issue with the way virtio device are defined.
> Today definition is based on rproc firmware ressource table and rproc 
> framework is in charge of vdev creation.
> Device tree definition was discarded as vdev is not HW but SW definition.

Well, it appears to be a firmware interface description.

> One solution would be to associate both resource table (which provides
> Firmware capabilities) and some virtio device tree nodes (declared as sub nodes
> of remote processor with associated resources like memory carveout).
> When we have a match between resource table and rproc DT sub node, we
> can register virtio device via of_platform_populate.
> Then need to adapt virtio_rpmsg or to create a virtio_rproc to be DT probe compliant
> like virtio_mmio is.
> 
> But that's breaking legacy as all platforms will have to add a virtio device node in
> their DT file...
> 
> Is it aligned with your view ?

Yes, that is how I'd assume it works.  But given that until recently
you did now have these subdevices for dma coherent purposes we can't
really break anything older than that, so I might still be missing
something.
