Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v2] remoteproc: copy parent dma_pfn_offset for vdev
Date: Tue, 2 Jul 2019 15:36:56 +0000
Message-ID: <58c8b8bd30a949678c027eb42a1b1bbb@SFHDAG7NODE2.st.com>
References: <20190612095521.4703-1-cleger@kalray.eu>
 <20190701070245.32083-1-cleger@kalray.eu>
 <20190702132229.GA8100@infradead.org>
In-Reply-To: <20190702132229.GA8100@infradead.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Christoph Hellwig <hch@infradead.org>, Clement Leger <cleger@kalray.eu>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Christoph,

> -----Original Message-----
> From: Christoph Hellwig <hch@infradead.org>
> Sent: mardi 2 juillet 2019 15:22
> To: Clement Leger <cleger@kalray.eu>
> Cc: Ohad Ben-Cohen <ohad@wizery.com>; Bjorn Andersson
> <bjorn.andersson@linaro.org>; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; Loic PALLARDY <loic.pallardy@st.com>
> Subject: Re: [PATCH v2] remoteproc: copy parent dma_pfn_offset for vdev
>=20
> This is just increasing the mess remoteproc has created with the vdev.
> It is poking its nose way to deep into the DMA layer internals, and
> creating massive problems that way.  Can we go back to the table
> and figure out what the root problem even was?  To me it seems if you
> clearly need separate devices they should be declared as such in the
> device tree.

Agree there is definitively an issue with the way virtio device are defined=
.
Today definition is based on rproc firmware ressource table and rproc=20
framework is in charge of vdev creation.
Device tree definition was discarded as vdev is not HW but SW definition.
One solution would be to associate both resource table (which provides
Firmware capabilities) and some virtio device tree nodes (declared as sub n=
odes
of remote processor with associated resources like memory carveout).
When we have a match between resource table and rproc DT sub node, we
can register virtio device via of_platform_populate.
Then need to adapt virtio_rpmsg or to create a virtio_rproc to be DT probe =
compliant
like virtio_mmio is.

But that's breaking legacy as all platforms will have to add a virtio devic=
e node in
their DT file...

Is it aligned with your view ?

Regards,
Loic
