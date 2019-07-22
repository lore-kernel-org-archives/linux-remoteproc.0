Return-Path: <BATV+8b691fc55bcfc6b3008b+5811+infradead.org+hch@bombadil.srs.infradead.org>
Date: Mon, 22 Jul 2019 02:24:29 -0700
From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2] remoteproc: copy parent dma_pfn_offset for vdev
Message-ID: <20190722092429.GB12167@infradead.org>
References: <20190612095521.4703-1-cleger@kalray.eu>
 <20190701070245.32083-1-cleger@kalray.eu>
 <20190702132229.GA8100@infradead.org>
 <58c8b8bd30a949678c027eb42a1b1bbb@SFHDAG7NODE2.st.com>
 <20190708184546.GA20670@infradead.org>
 <20190719063250.GA9545@infradead.org>
 <3c2c98e785704969a862715ab52ce2de@SFHDAG7NODE2.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c2c98e785704969a862715ab52ce2de@SFHDAG7NODE2.st.com>
To: Loic PALLARDY <loic.pallardy@st.com>
Cc: Christoph Hellwig <hch@infradead.org>, Clement Leger <cleger@kalray.eu>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Jul 22, 2019 at 08:41:32AM +0000, Loic PALLARDY wrote:
> Ongoing...
> Two topics to clean up:
> - Sub device creation and DMA ops inheritance --> need to use platform_device or device tree
> - dma_declare_coherent_memory use --> it has been introduced to support internal memories declared via reg field.
> I propose to migrate existing drivers on reserved memory usage and so remove dma_declare_coherent call from remoteproc core.

I thought this was inter-related in that you needed the additional
field with the manual memory region for the subdevs, but I guess I
misunderstood.  Anyway, thanks for doing the work.
