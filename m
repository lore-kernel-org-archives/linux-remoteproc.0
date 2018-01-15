Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v2 12/16] remoteproc: look-up memory-device for vring
 allocation
Date: Mon, 15 Jan 2018 20:44:26 +0000
Message-ID: <638aed21e2cd4b1d9144a75e92a88f36@SFHDAG7NODE2.st.com>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
 <1512060411-729-13-git-send-email-loic.pallardy@st.com>
 <20171214014407.GM17344@builder>
In-Reply-To: <20171214014407.GM17344@builder>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: Thursday, December 14, 2017 2:44 AM
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: ohad@wizery.com; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
> benjamin.gaignard@linaro.org
> Subject: Re: [PATCH v2 12/16] remoteproc: look-up memory-device for vring
> allocation
>=20
> On Thu 30 Nov 08:46 PST 2017, Loic Pallardy wrote:
> >  	} else {
> > +		/* Find any carveout matching vring */
> > +		/* Try dedicated vdev j vring i pool. */
> > +		snprintf(name, sizeof(name), "vdev%dvring%d", rvdev-
> >index, i);
> > +		carveout =3D rproc_find_carveout_by_name(rproc, name);
>=20
> This might match a carveout representing remapped device memory, which
> wouldn't have a memdev so the logic below would silently allocate from
> the parent dma_mem instead.
>=20
> I don't think this is user friendly and would be better to just use the
> information in the already mapped carveout.
=20
Yes best will be to have a "real" device. If over memory config, dma alloca=
tion will rely on dedicated memory pool, else on generic one.
>=20
> > +
> > +		if (!carveout) {
> > +			/* Try dedicated vdev j vrings pool. */
> > +			snprintf(name, sizeof(name), "vdev%dvring", rvdev-
> >index);
> > +			carveout =3D rproc_find_carveout_by_name(rproc,
> name);
> > +		}
> > +
> > +		if (carveout && carveout->memdev)
> > +			memdev =3D &carveout->memdev->dev;
> > +
> > +		rvring->dev =3D memdev;
> > +
> >  		/*
> >  		 * Allocate non-cacheable memory for the vring. In the future
> >  		 * this call will also configure the IOMMU for us
> >  		 */
> > -		va =3D dma_alloc_coherent(dev->parent, size, &dma,
> GFP_KERNEL);
> > +		va =3D dma_alloc_coherent(memdev, size, &dma,
> GFP_KERNEL);
>=20
> It's possible that you have fulfilled a resource_table carveout request
> with this memory, making the dynamic allocation likely to cause issues.
>=20
Yes if memory carveout is not dedicated to vring, indeed some other allocat=
ions could have been done before...
In that case it means the region is not well sized and firmware and associa=
ted resources can't be supported

/Loic
> >  		if (!va) {
> >  			dev_err(dev->parent, "dma_alloc_coherent
> failed\n");
> >  			return -EINVAL;
>=20
> Regards,
> Bjorn
