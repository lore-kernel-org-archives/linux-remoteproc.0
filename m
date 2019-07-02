Return-Path: <BATV+83adf40d3a3f76e3ee8d+5791+infradead.org+hch@bombadil.srs.infradead.org>
Date: Tue, 2 Jul 2019 06:22:29 -0700
From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2] remoteproc: copy parent dma_pfn_offset for vdev
Message-ID: <20190702132229.GA8100@infradead.org>
References: <20190612095521.4703-1-cleger@kalray.eu>
 <20190701070245.32083-1-cleger@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190701070245.32083-1-cleger@kalray.eu>
To: Clement Leger <cleger@kalray.eu>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This is just increasing the mess remoteproc has created with the vdev.
It is poking its nose way to deep into the DMA layer internals, and
creating massive problems that way.  Can we go back to the table
and figure out what the root problem even was?  To me it seems if you
clearly need separate devices they should be declared as such in the
device tree.
