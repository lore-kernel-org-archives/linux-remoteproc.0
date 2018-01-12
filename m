Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v2 06/16] remoteproc: modify vring allocation to support
 preallocated region
Date: Fri, 12 Jan 2018 08:13:11 +0000
Message-ID: <3799d8685aff4a2b86c6db24aacfb33a@SFHDAG7NODE2.st.com>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
 <1512060411-729-7-git-send-email-loic.pallardy@st.com>
 <20171214010919.GH17344@builder>
In-Reply-To: <20171214010919.GH17344@builder>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: Thursday, December 14, 2017 2:09 AM
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: ohad@wizery.com; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
> benjamin.gaignard@linaro.org
> Subject: Re: [PATCH v2 06/16] remoteproc: modify vring allocation to supp=
ort
> preallocated region
>=20
> On Thu 30 Nov 08:46 PST 2017, Loic Pallardy wrote:
>=20
> > Current version of rproc_alloc_vring function supports only dynamic vri=
ng
> > allocation.
> > This patch extends rproc_alloc_vring to verify if requested vring DA is
> > already part or not of a registered carveout. If true, nothing to do, e=
lse
> > just allocate vring as before.
> >
> > Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 53
> +++++++++++++++++++++++-------------
> >  1 file changed, 34 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> > index 515a17a..bdc99cd 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -263,21 +263,41 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev,
> int i)
> >  	struct device *dev =3D &rproc->dev;
> >  	struct rproc_vring *rvring =3D &rvdev->vring[i];
> >  	struct fw_rsc_vdev *rsc;
> > -	dma_addr_t dma;
> > +	dma_addr_t dma =3D -1;
> >  	void *va;
> >  	int ret, size, notifyid;
> >
> >  	/* actual size of vring (in bytes) */
> >  	size =3D PAGE_ALIGN(vring_size(rvring->len, rvring->align));
> >
> > -	/*
> > -	 * Allocate non-cacheable memory for the vring. In the future
> > -	 * this call will also configure the IOMMU for us
> > -	 */
> > -	va =3D dma_alloc_coherent(dev->parent, size, &dma, GFP_KERNEL);
>=20
> This dma_alloc_coherent() should have been a full
> rproc_handle_carveout(), so that we don't duplicate the effort of
> allocation and setting up the iommu mapping.

If all memory region are defined as carveout, in that case all allocations =
will be done before by rproc_handle_carveout
and here we just get access to the area thanks to the carveout name...
>=20
> > -	if (!va) {
> > -		dev_err(dev->parent, "dma_alloc_coherent failed\n");
> > -		return -EINVAL;
> > +	/* get vring resource table pointer */
> > +	rsc =3D (void *)rproc->table_ptr + rvdev->rsc_offset;
> > +
> > +	if (rsc->vring[i].da !=3D FW_RSC_ADDR_ANY) {
>=20
> I think it's reasonable in a system with iommu to specify da, rely on
> dynamic allocation and expect the iommu to bet configured.

It is the same as for carveout. Agree to first lookup by name and then chec=
k requested resource parameters.
If no region found, in that case we rely on default dynamic allocation.

>=20
> > +		va =3D rproc_find_carveout_by_da(rproc, rsc->vring[i].da,
> size);
> > +
> > +		if (!va) {
> > +			/* No region not found */
> > +			dev_err(dev->parent, "Pre-allocated vring not
> found\n");
> > +			return -ENOMEM;
> > +		}
> [..]
> > @@ -304,14 +325,7 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, in=
t
> i)
> >  	rvring->dma =3D dma;
> >  	rvring->notifyid =3D notifyid;
> >
> > -	/*
> > -	 * Let the rproc know the notifyid and da of this vring.
> > -	 * Not all platforms use dma_alloc_coherent to automatically
> > -	 * set up the iommu. In this case the device address (da) will
> > -	 * hold the physical address and not the device address.
> > -	 */
> > -	rsc =3D (void *)rproc->table_ptr + rvdev->rsc_offset;
> > -	rsc->vring[i].da =3D dma;
>=20
> I prefer that we keep the rsc assignments in a single place.

Ok

>=20
> > +	/* Let the rproc know the notifyid of this vring. */
> >  	rsc->vring[i].notifyid =3D notifyid;
> >  	return 0;
> >  }
> > @@ -348,7 +362,8 @@ void rproc_free_vring(struct rproc_vring *rvring)
> >  	int idx =3D rvring->rvdev->vring - rvring;
> >  	struct fw_rsc_vdev *rsc;
> >
> > -	dma_free_coherent(rproc->dev.parent, size, rvring->va, rvring-
> >dma);
> > +	if (rvring->dma !=3D -1)
>=20
> This doesn't feel well designed.
>=20
> > +		dma_free_coherent(rproc->dev.parent, size, rvring->va,
> rvring->dma);
>=20
> How about we start by reworking rproc_alloc_vring() to utilize the
> carveout handler logic, i.e. when we parse the vring we create (or from
> your other patches find an existing) carveout and assign this to rvring.
> Then rproc_alloc_vring() becomes a matter of copying the information off
> the associated carveout to the rvring and rsc.

Yes good idea, if no name match on a registered carveout, rproc_alloc_vring=
 can create one. Like that we are sure to have all the carveout handled at =
the same location, in the same way.

/Loic
>=20
> This would also simplify the cleanup path as the carveout would be taken
> care of by rproc_resource_cleanup(), both in the successful and
> unsuccessful cases.
>=20
> Regards,
> Bjorn
