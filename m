Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v1 5/6] rpmsg: virtio_rpmsg: don't allocate buffer if
 provided by low level driver
Date: Sat, 14 Jan 2017 19:26:42 +0000
Message-ID: <bd9c98ff85bb4c328eea8d3b835014b6@SFHDAG7NODE2.st.com>
References: <1481142941-15616-1-git-send-email-loic.pallardy@st.com>
 <1481142941-15616-6-git-send-email-loic.pallardy@st.com>
 <58d97610-8973-76ba-1c5e-ee186408c6c1@ti.com>
In-Reply-To: <58d97610-8973-76ba-1c5e-ee186408c6c1@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Suman Anna <s-anna@ti.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, Patrice CHOTARD <patrice.chotard@st.com>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "kernel@stlinux.com" <kernel@stlinux.com>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Suman Anna [mailto:s-anna@ti.com]
> Sent: Saturday, January 14, 2017 3:38 AM
> To: Loic PALLARDY <loic.pallardy@st.com>; bjorn.andersson@linaro.org;
> ohad@wizery.com; lee.jones@linaro.org; Patrice CHOTARD
> <patrice.chotard@st.com>
> Cc: linux-remoteproc@vger.kernel.org; kernel@stlinux.com
> Subject: Re: [PATCH v1 5/6] rpmsg: virtio_rpmsg: don't allocate buffer if
> provided by low level driver
>=20
> On 12/07/2016 02:35 PM, Loic Pallardy wrote:
> > Low level platform specific driver has the knowledge of the different
> > communication link constraints like fixed or secured memory region to
> > use for buffer allocation.
> >
> > If virtual address is defined in virtio_rpmsg_cfg structure, a
> > dedicated memory pool buffer fitting platform requirements is available=
.
> > Rpmsg virtio layer should rely on it if its size is compliant with
> > link characteristics.
> >
> > Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> > ---
> >  drivers/rpmsg/virtio_rpmsg_bus.c | 54
> > ++++++++++++++++++++++++++--------------
> >  1 file changed, 36 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c
> > b/drivers/rpmsg/virtio_rpmsg_bus.c
> > index 1a97af8..b12fe2a 100644
> > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > @@ -57,6 +57,7 @@
> >   * @sendq:	wait queue of sending contexts waiting for a tx buffers
> >   * @sleepers:	number of senders that are waiting for a tx buffer
> >   * @ns_ept:	the bus's name service endpoint
> > + * @ext_buffer: buffer allocated by low level driver
> >   *
> >   * This structure stores the rpmsg state of a given virtio remote proc=
essor
> >   * device (there might be several virtio proc devices for each
> > physical @@ -76,6 +77,7 @@ struct virtproc_info {
> >  	wait_queue_head_t sendq;
> >  	atomic_t sleepers;
> >  	struct rpmsg_endpoint *ns_ept;
> > +	bool ext_buffer;
> >  };
> >
> >  /* The feature bitmap for virtio rpmsg */ @@ -904,6 +906,17 @@ static
> > int virtio_rpmsg_get_config(struct virtio_device *vdev)
> >  			ret =3D -ENOMEM;
> >  			goto out;
> >  		}
> > +
> > +		/* Level platform specific buffer driver ? */
> > +		if (virtio_cfg.va !=3D -1) {
> > +			vrp->ext_buffer =3D true;
> > +			/* half of the buffers is dedicated for RX */
> > +			vrp->rbufs =3D (void *)(uintptr_t)virtio_cfg.va;
> > +
> > +			/* and half is dedicated for TX */
> > +			vrp->sbufs =3D (void *)(uintptr_t) virtio_cfg.va +
> total_buf_space / 2;
> > +		}
> > +
> >  		return !ret;
> >  	}
> >  out:
> > @@ -960,24 +973,27 @@ static int rpmsg_probe(struct virtio_device
> *vdev)
> >  	if (err < 0)
> >  		goto free_vrp;
> >
> > -	total_buf_space =3D vrp->num_bufs * vrp->buf_size;
> > +	/* Allocate buffer if none provided by low level platform driver */
> > +	if (!vrp->ext_buffer) {
> > +		total_buf_space =3D vrp->num_bufs * vrp->buf_size;
> >
> > -	bufs_va =3D dma_alloc_coherent(vdev->dev.parent->parent,
> > -				     total_buf_space, &vrp->bufs_dma,
> > -				     GFP_KERNEL);
> > -	if (!bufs_va) {
> > -		err =3D -ENOMEM;
> > -		goto vqs_del;
> > -	}
> > +		bufs_va =3D dma_alloc_coherent(vdev->dev.parent->parent,
> > +				total_buf_space, &vrp->bufs_dma,
> > +				GFP_KERNEL);
>=20
> Can you run checkpatch with --strict when you resubmit the series, I beli=
eve
> a few have been introduced that weren't there before.

Sure I will.
Regards,
Loic
>=20
> regards
> Suman
>=20
> > +		if (!bufs_va) {
> > +			err =3D -ENOMEM;
> > +			goto vqs_del;
> > +		}
> >
> > -	dev_dbg(&vdev->dev, "buffers: va %p, dma %pad\n",
> > -		bufs_va, &vrp->bufs_dma);
> > +		dev_dbg(&vdev->dev, "buffers: va %p, dma %pad\n",
> > +				bufs_va, &vrp->bufs_dma);
> >
> > -	/* half of the buffers is dedicated for RX */
> > -	vrp->rbufs =3D bufs_va;
> > +		/* half of the buffers is dedicated for RX */
> > +		vrp->rbufs =3D bufs_va;
> >
> > -	/* and half is dedicated for TX */
> > -	vrp->sbufs =3D bufs_va + total_buf_space / 2;
> > +		/* and half is dedicated for TX */
> > +		vrp->sbufs =3D bufs_va + total_buf_space / 2;
> > +	}
> >
> >  	/* set up the receive buffers */
> >  	for (i =3D 0; i < vrp->num_bufs / 2; i++) { @@ -1028,8 +1044,9 @@
> > static int rpmsg_probe(struct virtio_device *vdev)
> >  	return 0;
> >
> >  free_coherent:
> > -	dma_free_coherent(vdev->dev.parent->parent, total_buf_space,
> > -			  bufs_va, vrp->bufs_dma);
> > +	if (!vrp->ext_buffer)
> > +		dma_free_coherent(vdev->dev.parent->parent,
> total_buf_space,
> > +				  bufs_va, vrp->bufs_dma);
> >  vqs_del:
> >  	vdev->config->del_vqs(vrp->vdev);
> >  free_vrp:
> > @@ -1063,8 +1080,9 @@ static void rpmsg_remove(struct virtio_device
> > *vdev)
> >
> >  	vdev->config->del_vqs(vrp->vdev);
> >
> > -	dma_free_coherent(vdev->dev.parent->parent, total_buf_space,
> > -			  vrp->rbufs, vrp->bufs_dma);
> > +	if (!vrp->ext_buffer)
> > +		dma_free_coherent(vdev->dev.parent->parent,
> total_buf_space,
> > +				  vrp->rbufs, vrp->bufs_dma);
> >
> >  	kfree(vrp);
> >  }
> >
