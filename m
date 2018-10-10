Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v4 12/17] remoteproc: modify vring allocation to rely on
 centralized carveout allocator
Date: Wed, 10 Oct 2018 18:58:11 +0000
Message-ID: <89f3d4bbbc484c5fb5d85f03b1325103@SFHDAG7NODE2.st.com>
References: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
 <1532697292-14272-13-git-send-email-loic.pallardy@st.com>
 <20181010053206.GA20016@builder>
In-Reply-To: <20181010053206.GA20016@builder>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>, "s-anna@ti.com" <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: mercredi 10 octobre 2018 07:32
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: ohad@wizery.com; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
> benjamin.gaignard@linaro.org; s-anna@ti.com
> Subject: Re: [PATCH v4 12/17] remoteproc: modify vring allocation to rely=
 on
> centralized carveout allocator
>=20
> On Fri 27 Jul 06:14 PDT 2018, Loic Pallardy wrote:
> >  int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *=
fw)
> > diff --git a/drivers/remoteproc/remoteproc_virtio.c
> b/drivers/remoteproc/remoteproc_virtio.c
> [..]
> > @@ -114,6 +122,10 @@ static struct virtqueue *rp_find_vq(struct
> virtio_device *vdev,
> >  	rvring->vq =3D vq;
> >  	vq->priv =3D rvring;
> >
> > +	/* Update vring in resource table */
> > +	rsc =3D (void *)rproc->table_ptr + rvdev->rsc_offset;
> > +	rsc->vring[id].da =3D mem->da;
> > +
>=20
> This would now happen after we've started the remoteproc. Don't we need
> to do this in-between allocating the carveouts and booting the
> remoteproc?

Yes da is updated after coprocessor boot, but before vdev status in resourc=
e table is set to DRIVER_OK and kick.
Coprocessor should not parse this resource before as vrings not initialized=
 yet.
If coprocessor needs to get some information about vring carveout at boot t=
ime, carveout resources named vdev"x"vring"y" should be added to firmware r=
esource table.
In that case information will be filled before coprocessor boot.

Regards,
Loic
>=20
> Regards,
> Bjorn
