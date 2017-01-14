Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v1 4/6] rpmsg: virtio_rpmsg: get buffer configuration from
 virtio
Date: Sat, 14 Jan 2017 19:30:42 +0000
Message-ID: <c10134f5f6ab4fd3b41fc21743b8f0fc@SFHDAG7NODE2.st.com>
References: <1481142941-15616-1-git-send-email-loic.pallardy@st.com>
 <1481142941-15616-5-git-send-email-loic.pallardy@st.com>
 <eee13ee7-b728-ac4f-53f0-40692bd7c4a9@ti.com>
In-Reply-To: <eee13ee7-b728-ac4f-53f0-40692bd7c4a9@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Suman Anna <s-anna@ti.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, Patrice CHOTARD <patrice.chotard@st.com>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "kernel@stlinux.com" <kernel@stlinux.com>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Suman Anna [mailto:s-anna@ti.com]
> Sent: Saturday, January 14, 2017 3:27 AM
> To: Loic PALLARDY <loic.pallardy@st.com>; bjorn.andersson@linaro.org;
> ohad@wizery.com; lee.jones@linaro.org; Patrice CHOTARD
> <patrice.chotard@st.com>
> Cc: linux-remoteproc@vger.kernel.org; kernel@stlinux.com
> Subject: Re: [PATCH v1 4/6] rpmsg: virtio_rpmsg: get buffer configuration
> from virtio
>=20
> Hi Loic,
>=20
> On 12/07/2016 02:35 PM, Loic Pallardy wrote:
> > Some coprocessors have memory mapping constraints which require
> > predefined buffer location or specific buffer size different from
> > default definition.
> > Coprocessor resources are defined in associated firmware resource table=
.
> > Remoteproc offers access to firmware resource table via virtio get
> > interface.
> >
> > This patch modifies rpmsg_probe sequence to:
> > - retrieve rpmsg buffer configuration (if any)
> > - verify and apply configuration
> > - allocate buffer according to requested configuration
> >
> > Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> > ---
> >  drivers/rpmsg/virtio_rpmsg_bus.c | 52
> > +++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 49 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c
> > b/drivers/rpmsg/virtio_rpmsg_bus.c
> > index 0810d1f..1a97af8 100644
> > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > @@ -32,6 +32,7 @@
> >  #include <linux/sched.h>
> >  #include <linux/wait.h>
> >  #include <linux/rpmsg.h>
> > +#include <linux/rpmsg/virtio_rpmsg.h>
> >  #include <linux/mutex.h>
> >  #include <linux/of_device.h>
> >
> > @@ -871,6 +872,45 @@ static int rpmsg_ns_cb(struct rpmsg_device
> *rpdev, void *data, int len,
> >  	return 0;
> >  }
> >
> > +static int virtio_rpmsg_get_config(struct virtio_device *vdev) {
> > +	struct virtio_rpmsg_cfg virtio_cfg;
> > +	struct virtproc_info *vrp =3D vdev->priv;
> > +	size_t total_buf_space;
> > +	int ret =3D 0;
> > +
> > +	memset(&virtio_cfg, 0, sizeof(virtio_cfg));
> > +	vdev->config->get(vdev, RPMSG_CONFIG_OFFSET, &virtio_cfg,
> > +			  sizeof(virtio_cfg));
> > +
> > +	if (virtio_cfg.id =3D=3D VIRTIO_ID_RPMSG && virtio_cfg.version =3D=3D=
 1 &&
> > +	    virtio_cfg.reserved =3D=3D 0) {
> > +		if (virtio_cfg.buf_size <=3D MAX_RPMSG_BUF_SIZE) {
> > +			vrp->buf_size =3D virtio_cfg.buf_size;
> > +		} else {
> > +			WARN_ON(1);
> > +			dev_warn(&vdev->dev, "Requested RPMsg buffer
> size too big: %d\n",
> > +				 vrp->buf_size);
> > +			ret =3D -EINVAL;
> > +			goto out;
> > +		}
> > +		vrp->bufs_dma =3D virtio_cfg.pa;
>=20
> I believe this line belongs to the next patch. It gets overwritten in thi=
s patch
> anyway since you go through the normal dma allocation.
OK to move it in next patch

>=20
> > +
> > +		/* Check rpmsg buffer length */
> > +		total_buf_space =3D vrp->num_bufs * vrp->buf_size;
> > +		if ((virtio_cfg.len !=3D -1) && (total_buf_space > virtio_cfg.len))
> {
> > +			dev_warn(&vdev->dev, "Not enough memory for
> buffers: %d\n",
> > +					total_buf_space);
> > +			ret =3D -ENOMEM;
> > +			goto out;
> > +		}
> > +		return !ret;
> > +	}
> > +out:
> > +	return ret;
> > +
> > +}
> > +
> >  static int rpmsg_probe(struct virtio_device *vdev)  {
> >  	vq_callback_t *vq_cbs[] =3D { rpmsg_recv_done, rpmsg_xmit_done };
> @@
> > -901,6 +941,8 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >  	vrp->rvq =3D vqs[0];
> >  	vrp->svq =3D vqs[1];
> >
> > +	vdev->priv =3D vrp;
> > +
> >  	/* we expect symmetric tx/rx vrings */
> >  	WARN_ON(virtqueue_get_vring_size(vrp->rvq) !=3D
> >  		virtqueue_get_vring_size(vrp->svq));
> > @@ -911,9 +953,15 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >  	else
> >  		vrp->num_bufs =3D MAX_RPMSG_NUM_BUFS;
> >
> > +	vrp->buf_size =3D MAX_RPMSG_BUF_SIZE;
>=20
> As pointed previously, this assignment should be moved into Patch 1.
OK

>=20
> > +
> > +	/* Try to get rpmsg configuration if any */
> > +	err =3D virtio_rpmsg_get_config(vdev);
> > +	if (err < 0)
> > +		goto free_vrp;
> > +
> >  	total_buf_space =3D vrp->num_bufs * vrp->buf_size;
> >
> > -	/* allocate coherent memory for the buffers */
>=20
> don't delete the comment here, has nothing to do with the change you are
> doing.
Right

Regards,
Loic
>=20
> regards
> Suman
>=20
> >  	bufs_va =3D dma_alloc_coherent(vdev->dev.parent->parent,
> >  				     total_buf_space, &vrp->bufs_dma,
> >  				     GFP_KERNEL);
> > @@ -946,8 +994,6 @@ static int rpmsg_probe(struct virtio_device *vdev)
> >  	/* suppress "tx-complete" interrupts */
> >  	virtqueue_disable_cb(vrp->svq);
> >
> > -	vdev->priv =3D vrp;
> > -
> >  	/* if supported by the remote processor, enable the name service */
> >  	if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_NS)) {
> >  		/* a dedicated endpoint handles the name service msgs */
> >
