Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v3 11/13] remoteproc: create vdev subdevice with specific
 dma memory pool
Date: Mon, 14 May 2018 15:57:08 +0000
Message-ID: <1964b4422c324eb9a7d712ad1d278b55@SFHDAG7NODE2.st.com>
References: <1519921440-21356-1-git-send-email-loic.pallardy@st.com>
 <1519921440-21356-12-git-send-email-loic.pallardy@st.com>
 <20180510010601.GJ29093@builder>
In-Reply-To: <20180510010601.GJ29093@builder>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: Thursday, May 10, 2018 3:06 AM
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: ohad@wizery.com; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
> benjamin.gaignard@linaro.org
> Subject: Re: [PATCH v3 11/13] remoteproc: create vdev subdevice with
> specific dma memory pool
>=20
> On Thu 01 Mar 08:23 PST 2018, Loic Pallardy wrote:
> > @@ -479,6 +481,41 @@ static int rproc_handle_vdev(struct rproc *rproc,
> struct fw_rsc_vdev *rsc,
> >  			goto unwind_vring_allocations;
> >  	}
> >
> > +	/* Initialise vdev subdevice */
> > +	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
> > +	rvdev->dev.parent =3D rproc->dev.parent;
> > +	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev-
> >dev.parent), name);
> > +	dev_set_drvdata(&rvdev->dev, rvdev);
> > +	dma_set_coherent_mask(&rvdev->dev, DMA_BIT_MASK(32));
> > +
> > +	ret =3D device_register(&rvdev->dev);
> > +	if (ret)
> > +		goto unwind_vring_allocations;
> > +
> > +	/* Try to find dedicated vdev buffer carveout */
> > +	carveout =3D rproc_find_carveout_by_name(rproc, name);
> > +
> > +	if (carveout) {
> > +		phys_addr_t pa;
> > +
> > +		if (carveout->va) {
> > +			dev_warn(dev, "vdev %d buffer carveout already
> mapped\n",
> > +				 rvdev->index);
> > +			pa =3D rproc_va_to_pa(carveout->va);
> > +		} else {
> > +			/* Use dma address as carveout no memmapped yet
> */
> > +			pa =3D (phys_addr_t)carveout->dma;
> > +		}
> > +
> > +		/* Associate vdev buffer memory pool to vdev subdevice */
> > +		ret =3D dmam_declare_coherent_memory(&rvdev->dev, pa,
> > +						   carveout->da,
> > +						   carveout->len,
> > +
> DMA_MEMORY_EXCLUSIVE);
> > +		if (ret < 0)
> > +			goto unregister_device;
> > +	}
> > +
>=20
> So with this there will be one more device between rproc->dev and the
> virtio dev, for the sake of memory management. So e.g. a rpmsg device
> will still need to allocate memory from dev->parent->parent; which now
> possibly has a specific dma_mem.

Yes it is a new sub device between virtio dev and rproc dev, but this devic=
e owns memory region dedicated to this vdev
So, rpmsg device will allocate from dev->parent, not from dev->parent->pare=
nt.

>=20
> Is it not possible to assign the memory to the vdev->dev and allow the
> virtio devices can allocate memory from their parent device?
No sure to catch your point.
Who should be the parent device? Rproc dev itself? Doesn't fit well if you =
want to handle 2 different vdev with specific memory region for each of the=
m.

Regards,
Loic
>=20
> Regards,
> Bjorn
