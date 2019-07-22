Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v2] remoteproc: copy parent dma_pfn_offset for vdev
Date: Mon, 22 Jul 2019 08:41:32 +0000
Message-ID: <3c2c98e785704969a862715ab52ce2de@SFHDAG7NODE2.st.com>
References: <20190612095521.4703-1-cleger@kalray.eu>
 <20190701070245.32083-1-cleger@kalray.eu>
 <20190702132229.GA8100@infradead.org>
 <58c8b8bd30a949678c027eb42a1b1bbb@SFHDAG7NODE2.st.com>
 <20190708184546.GA20670@infradead.org> <20190719063250.GA9545@infradead.org>
In-Reply-To: <20190719063250.GA9545@infradead.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Christoph Hellwig <hch@infradead.org>
Cc: Clement Leger <cleger@kalray.eu>, Ohad Ben-Cohen <ohad@wizery.com>, "Bjorn Andersson  <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Christoph Hellwig <hch@infradead.org>
> Sent: vendredi 19 juillet 2019 08:33
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: Christoph Hellwig <hch@infradead.org>; Clement Leger
> <cleger@kalray.eu>; Ohad Ben-Cohen <ohad@wizery.com>; Bjorn
> Andersson <bjorn.andersson@linaro.org>; linux-
> remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v2] remoteproc: copy parent dma_pfn_offset for vdev
>=20
> On Mon, Jul 08, 2019 at 11:45:46AM -0700, Christoph Hellwig wrote:
> > > But that's breaking legacy as all platforms will have to add a virtio=
 device
> node in
> > > their DT file...
> > >
> > > Is it aligned with your view ?
> >
> > Yes, that is how I'd assume it works.  But given that until recently
> > you did now have these subdevices for dma coherent purposes we can't
> > really break anything older than that, so I might still be missing
> > something.
>=20
> Any chance we could expedite this?  remoteproc is the only driver
> inheriting dma ops to subdevices, and the only one using
> dma_declare_coherent_memory.  I'd really like to clean this mess up
> rather sooner than later.

Ongoing...
Two topics to clean up:
- Sub device creation and DMA ops inheritance --> need to use platform_devi=
ce or device tree
- dma_declare_coherent_memory use --> it has been introduced to support int=
ernal memories declared via reg field.
I propose to migrate existing drivers on reserved memory usage and so remov=
e dma_declare_coherent call from remoteproc core.
