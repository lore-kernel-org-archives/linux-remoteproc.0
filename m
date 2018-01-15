Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v2 13/16] remoteproc: look-up memory-device for virtio
 device allocation
Date: Mon, 15 Jan 2018 20:57:26 +0000
Message-ID: <752081cee4104e15914bcecde911e793@SFHDAG7NODE2.st.com>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
 <1512060411-729-14-git-send-email-loic.pallardy@st.com>
 <20171214053248.GN17344@builder>
In-Reply-To: <20171214053248.GN17344@builder>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: Thursday, December 14, 2017 6:33 AM
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: ohad@wizery.com; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
> benjamin.gaignard@linaro.org
> Subject: Re: [PATCH v2 13/16] remoteproc: look-up memory-device for virti=
o
> device allocation
>=20
> On Thu 30 Nov 08:46 PST 2017, Loic Pallardy wrote:
>=20
> > This patch parse existing carveout list to find a memory area
> > matching on "vdev<vdev_id>buffer" name.
> > If found, memory device will be used as parent for vdev creation, else
> > rproc platform device will be used as today.
> >
> > Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> > ---
> >  drivers/remoteproc/remoteproc_core.c   | 13 +++++++++++++
> >  drivers/remoteproc/remoteproc_virtio.c |  2 +-
> >  include/linux/remoteproc.h             |  1 +
> >  3 files changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> > index 6b5e2b2..9c12319 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -583,8 +583,11 @@ static int rproc_handle_vdev(struct rproc *rproc,
> struct fw_rsc_vdev *rsc,
> >  {
> >  	struct device *dev =3D &rproc->dev;
> >  	struct rproc_vdev *rvdev;
> > +	struct device *memdev =3D dev->parent;
> > +	struct rproc_mem_entry *carveout;
> >  	int i, ret;
> >  	static int index;
> > +	char name[16];
> >
> >  	/* make sure resource isn't truncated */
> >  	if (sizeof(*rsc) + rsc->num_of_vrings * sizeof(struct
> fw_rsc_vdev_vring)
> > @@ -637,6 +640,16 @@ static int rproc_handle_vdev(struct rproc *rproc,
> struct fw_rsc_vdev *rsc,
> >
> >  	list_add_tail(&rvdev->node, &rproc->rvdevs);
> >
> > +	/* Find associated registered carveout. */
> > +	/* Try dedicated vdev buffer pool. */
> > +	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
> > +	carveout =3D rproc_find_carveout_by_name(rproc, name);
> > +
> > +	if (carveout && carveout->memdev)
> > +		memdev =3D &carveout->memdev->dev;
> > +
> > +	rvdev->dev =3D memdev;
> > +
> >  	rproc_add_subdev(rproc, &rvdev->subdev,
> >  			 rproc_vdev_do_probe, rproc_vdev_do_remove);
> >
> > diff --git a/drivers/remoteproc/remoteproc_virtio.c
> b/drivers/remoteproc/remoteproc_virtio.c
> > index 2946348..1f7a444 100644
> > --- a/drivers/remoteproc/remoteproc_virtio.c
> > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > @@ -303,7 +303,7 @@ static void rproc_virtio_dev_release(struct device
> *dev)
> >  int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> >  {
> >  	struct rproc *rproc =3D rvdev->rproc;
> > -	struct device *dev =3D &rproc->dev;
> > +	struct device *dev =3D rvdev->dev;
>=20
> This will cause the device structure to change shape based on there
> being a match of a carveout or not.
>=20
>=20
> I also think it's preferable to limit the life cycle of the allocations
> in this memory region to a single start->stop cycle, rather than
> boot->shutdown.
>=20
> So I think it makes more sense to use the vdev->dev and
> dmam_declare_coherent_memory on this. But as in the previous patch this
> can't be a carveout that has been remapped already.
>=20
Yes it is the main issue. Rproc_handle_carveout function will process it be=
fore, except if we create a new status to not allocate a carveout and provi=
de function to update carevout in resource table...
>=20
> A somewhat unrelated topic to this is the ability to associate DT nodes
> to rpmsg devices (I do this for the Qualcomm children), in this case we
> would have a DT node per vdev under the remoteproc, perhaps it would
> make more sense to introduce that and put the memory-region in that
> node. Only thin that comes to mind is that we still need to match a
> carveout in the resource table, in order to communicate the buffer
> region to the remote side for your memory protection purposes.
>=20
OK I'll have a look to Qualcom DT nodes. But as it is SW, is DT the right p=
lace?
But it will help to decide if there is a dedicated memory region or not for=
 virtio device.
I'll investigate...

Regards,
Loic

> Regards,
> Bjorn
