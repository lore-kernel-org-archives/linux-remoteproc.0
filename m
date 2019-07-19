Return-Path: <BATV+0127b854950d050a2cef+5808+infradead.org+hch@bombadil.srs.infradead.org>
Date: Thu, 18 Jul 2019 23:32:50 -0700
From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2] remoteproc: copy parent dma_pfn_offset for vdev
Message-ID: <20190719063250.GA9545@infradead.org>
References: <20190612095521.4703-1-cleger@kalray.eu>
 <20190701070245.32083-1-cleger@kalray.eu>
 <20190702132229.GA8100@infradead.org>
 <58c8b8bd30a949678c027eb42a1b1bbb@SFHDAG7NODE2.st.com>
 <20190708184546.GA20670@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190708184546.GA20670@infradead.org>
To: Loic PALLARDY <loic.pallardy@st.com>
Cc: Christoph Hellwig <hch@infradead.org>, Clement Leger <cleger@kalray.eu>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Jul 08, 2019 at 11:45:46AM -0700, Christoph Hellwig wrote:
> > But that's breaking legacy as all platforms will have to add a virtio device node in
> > their DT file...
> > 
> > Is it aligned with your view ?
> 
> Yes, that is how I'd assume it works.  But given that until recently
> you did now have these subdevices for dma coherent purposes we can't
> really break anything older than that, so I might still be missing
> something.

Any chance we could expedite this?  remoteproc is the only driver
inheriting dma ops to subdevices, and the only one using
dma_declare_coherent_memory.  I'd really like to clean this mess up
rather sooner than later.
