Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v1 6/6] rpmsg: virtio_rpmsg: set buffer configuration to
 virtio
Date: Sat, 14 Jan 2017 19:36:15 +0000
Message-ID: <00e117183e8848839bc75530c159942d@SFHDAG7NODE2.st.com>
References: <1481142941-15616-1-git-send-email-loic.pallardy@st.com>
 <1481142941-15616-7-git-send-email-loic.pallardy@st.com>
 <948c0469-ff6c-6516-93ab-fa9f5e95edb7@ti.com>
In-Reply-To: <948c0469-ff6c-6516-93ab-fa9f5e95edb7@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Suman Anna <s-anna@ti.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, Patrice CHOTARD <patrice.chotard@st.com>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "kernel@stlinux.com" <kernel@stlinux.com>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Suman Anna [mailto:s-anna@ti.com]
> Sent: Saturday, January 14, 2017 3:41 AM
> To: Loic PALLARDY <loic.pallardy@st.com>; bjorn.andersson@linaro.org;
> ohad@wizery.com; lee.jones@linaro.org; Patrice CHOTARD
> <patrice.chotard@st.com>
> Cc: linux-remoteproc@vger.kernel.org; kernel@stlinux.com
> Subject: Re: [PATCH v1 6/6] rpmsg: virtio_rpmsg: set buffer configuration=
 to
> virtio
>=20
> On 12/07/2016 02:35 PM, Loic Pallardy wrote:
> > Rpmsg is allocating buffer one dedicated communication link with some
> > specificity like number of buffers, size of one buffer...
> > These characteristics should be shared with remote coprocessor to
> > guarantee communication link coherency.
> >
> > Proposal is to update rpmsg configuration fields in coprocessor
> > firmware resource table if it exists.
> >
> > This is possible thanks to virtio set interface which allows to update
> > cfg fields of struct fw_rsc_vdev.
> >
> > Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> > ---
> >  drivers/rpmsg/virtio_rpmsg_bus.c | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c
> > b/drivers/rpmsg/virtio_rpmsg_bus.c
> > index b12fe2a..5527b65 100644
> > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > @@ -924,6 +924,23 @@ static int virtio_rpmsg_get_config(struct
> > virtio_device *vdev)
> >
> >  }
> >
> > +static void virtio_rpmsg_set_config(struct virtio_device *vdev) {
> > +	struct virtio_rpmsg_cfg virtio_cfg;
> > +	struct virtproc_info *vrp =3D vdev->priv;
> > +
> > +	/* fill virtio_cfg struct */
> > +	memset(&virtio_cfg, 0, sizeof(virtio_cfg));
> > +	virtio_cfg.id =3D VIRTIO_ID_RPMSG;
> > +	virtio_cfg.da =3D vrp->bufs_dma;
>=20
> Hmm, I would expect this to fail if the device was behind an IOMMU.
I think so. I think I did the same vring. I need to check.
Perhaps better to set virtio_cfg.da to ANY_ADDRESS (-1) and add a comment a=
bout adding IOMMU support.
What do you think?

Regards,
Loic
>=20
> regards
> Suman
>=20
> > +	virtio_cfg.pa =3D	vrp->bufs_dma;
> > +	virtio_cfg.len =3D vrp->num_bufs * vrp->buf_size;
> > +	virtio_cfg.buf_size =3D vrp->buf_size;
> > +
> > +	vdev->config->set(vdev, RPMSG_CONFIG_OFFSET, &virtio_cfg,
> > +			  sizeof(virtio_cfg));
> > +}
> > +
> >  static int rpmsg_probe(struct virtio_device *vdev)  {
> >  	vq_callback_t *vq_cbs[] =3D { rpmsg_recv_done, rpmsg_xmit_done };
> @@
> > -934,6 +951,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >  	int err =3D 0, i;
> >  	size_t total_buf_space;
> >  	bool notify;
> > +	bool has_cfg =3D false;
> >
> >  	vrp =3D kzalloc(sizeof(*vrp), GFP_KERNEL);
> >  	if (!vrp)
> > @@ -973,6 +991,9 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >  	if (err < 0)
> >  		goto free_vrp;
> >
> > +	if (err)
> > +		has_cfg =3D true;
> > +
> >  	/* Allocate buffer if none provided by low level platform driver */
> >  	if (!vrp->ext_buffer) {
> >  		total_buf_space =3D vrp->num_bufs * vrp->buf_size; @@ -
> 993,6 +1014,10
> > @@ static int rpmsg_probe(struct virtio_device *vdev)
> >
> >  		/* and half is dedicated for TX */
> >  		vrp->sbufs =3D bufs_va + total_buf_space / 2;
> > +
> > +		/* Notify configuration to coprocessor */
> > +		if (has_cfg)
> > +			virtio_rpmsg_set_config(vdev);
> >  	}
> >
> >  	/* set up the receive buffers */
> >
