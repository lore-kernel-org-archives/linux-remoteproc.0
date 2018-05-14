Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v3 10/13] remoteproc: modify vring allocation to support
 pre-registered region
Date: Mon, 14 May 2018 15:43:23 +0000
Message-ID: <e2ef90c56046442baf33fef10bb347f6@SFHDAG7NODE2.st.com>
References: <1519921440-21356-1-git-send-email-loic.pallardy@st.com>
 <1519921440-21356-11-git-send-email-loic.pallardy@st.com>
 <20180510005918.GI29093@builder>
In-Reply-To: <20180510005918.GI29093@builder>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: Thursday, May 10, 2018 2:59 AM
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: ohad@wizery.com; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
> benjamin.gaignard@linaro.org
> Subject: Re: [PATCH v3 10/13] remoteproc: modify vring allocation to supp=
ort
> pre-registered region
>=20
> On Thu 01 Mar 08:23 PST 2018, Loic Pallardy wrote:
> [..]
> > @@ -265,23 +269,45 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev,
> int i)
> >  	struct device *dev =3D &rproc->dev;
> >  	struct rproc_vring *rvring =3D &rvdev->vring[i];
> >  	struct fw_rsc_vdev *rsc;
> > -	dma_addr_t dma;
> > -	void *va;
> >  	int ret, size, notifyid;
> > +	struct fw_rsc_carveout rsc_carveout;
> > +	struct rproc_mem_entry *mem;
> >
> >  	/* actual size of vring (in bytes) */
> >  	size =3D PAGE_ALIGN(vring_size(rvring->len, rvring->align));
> >
> > -	/*
> > -	 * Allocate non-cacheable memory for the vring. In the future
> > -	 * this call will also configure the IOMMU for us
> > -	 */
> > -	va =3D dma_alloc_coherent(dev->parent, size, &dma, GFP_KERNEL);
> > -	if (!va) {
> > -		dev_err(dev->parent, "dma_alloc_coherent failed\n");
> > +	rsc =3D (void *)rproc->table_ptr + rvdev->rsc_offset;
> > +
> > +	/* Create virtual firmware carveout resource */
> > +	rsc_carveout.da =3D rsc->vring[i].da;
> > +	rsc_carveout.pa =3D FW_RSC_ADDR_ANY;
> > +	rsc_carveout.len =3D size;
> > +	rsc_carveout.flags =3D 0;
> > +	rsc_carveout.reserved =3D 0;
> > +	snprintf(rsc_carveout.name, sizeof(rsc_carveout.name),
> "vdev%dvring%d",
> > +		 rvdev->index, i);
> [..]
> > @@ -437,6 +460,7 @@ static int rproc_handle_vdev(struct rproc *rproc,
> struct fw_rsc_vdev *rsc,
> >
> >  	rvdev->id =3D rsc->id;
> >  	rvdev->rproc =3D rproc;
> > +	rvdev->index =3D index++;
>=20
> This index isn't deterministic over multiple remoteproc instances and
> multiple restarts of the remoteproc. It probably needs to be based
> generated based on the ordering in the resource table.
Yes it was my intention, but static use make it wrong.
I'll revisit this point

Regards,
Loic
>=20
> Regards,
> Bjorn
