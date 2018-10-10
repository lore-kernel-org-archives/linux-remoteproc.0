Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v4 13/17] remoteproc: create vdev subdevice with specific
 dma memory pool
Date: Wed, 10 Oct 2018 19:17:52 +0000
Message-ID: <54cd805121f34c15a64e283bf93e5737@SFHDAG7NODE2.st.com>
References: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
 <1532697292-14272-14-git-send-email-loic.pallardy@st.com>
 <20181010055823.GB20016@builder>
In-Reply-To: <20181010055823.GB20016@builder>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>, "s-anna@ti.com" <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: mercredi 10 octobre 2018 07:58
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: ohad@wizery.com; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
> benjamin.gaignard@linaro.org; s-anna@ti.com
> Subject: Re: [PATCH v4 13/17] remoteproc: create vdev subdevice with
> specific dma memory pool
>=20
> On Fri 27 Jul 06:14 PDT 2018, Loic Pallardy wrote:
>=20
> > This patch creates a dedicated vdev subdevice for each vdev declared
> > in firmware resource table and associates carveout named "vdev%dbuffer"
> > (with %d vdev index in resource table) if any as dma coherent memory
> pool.
> >
> > Then vdev subdevice is used as parent for virtio device.
> >
> > Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> > ---
> >  drivers/remoteproc/remoteproc_core.c     | 35
> +++++++++++++++++++++++---
> >  drivers/remoteproc/remoteproc_internal.h |  1 +
> >  drivers/remoteproc/remoteproc_virtio.c   | 42
> +++++++++++++++++++++++++++++++-
> >  include/linux/remoteproc.h               |  1 +
> >  4 files changed, 75 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> > index 4edc6f0..adcc66e 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -39,6 +39,7 @@
> >  #include <linux/idr.h>
> >  #include <linux/elf.h>
> >  #include <linux/crc32.h>
> > +#include <linux/of_reserved_mem.h>
> >  #include <linux/virtio_ids.h>
> >  #include <linux/virtio_ring.h>
> >  #include <asm/byteorder.h>
> > @@ -145,7 +146,7 @@ static void rproc_disable_iommu(struct rproc
> *rproc)
> >  	iommu_domain_free(domain);
> >  }
> >
> > -static phys_addr_t rproc_va_to_pa(void *cpu_addr)
> > +phys_addr_t rproc_va_to_pa(void *cpu_addr)
> >  {
> >  	/*
> >  	 * Return physical address according to virtual address location
> > @@ -160,6 +161,7 @@ static phys_addr_t rproc_va_to_pa(void
> *cpu_addr)
> >  	WARN_ON(!virt_addr_valid(cpu_addr));
> >  	return virt_to_phys(cpu_addr);
> >  }
> > +EXPORT_SYMBOL(rproc_va_to_pa);
> >
> >  /**
> >   * rproc_da_to_va() - lookup the kernel virtual address for a remotepr=
oc
> address
> > @@ -423,6 +425,20 @@ static void rproc_vdev_do_stop(struct
> rproc_subdev *subdev, bool crashed)
> >  }
> >
> >  /**
> > + * rproc_rvdev_release() - release the existence of a rvdev
> > + *
> > + * @dev: the subdevice's dev
> > + */
> > +static void rproc_rvdev_release(struct device *dev)
> > +{
> > +	struct rproc_vdev *rvdev =3D container_of(dev, struct rproc_vdev,
> dev);
> > +
> > +	of_reserved_mem_device_release(dev);
> > +
> > +	kfree(rvdev);
> > +}
> > +
> > +/**
> >   * rproc_handle_vdev() - handle a vdev fw resource
> >   * @rproc: the remote processor
> >   * @rsc: the vring resource descriptor
> > @@ -455,6 +471,7 @@ static int rproc_handle_vdev(struct rproc *rproc,
> struct fw_rsc_vdev *rsc,
> >  	struct device *dev =3D &rproc->dev;
> >  	struct rproc_vdev *rvdev;
> >  	int i, ret;
> > +	char name[16];
> >
> >  	/* make sure resource isn't truncated */
> >  	if (sizeof(*rsc) + rsc->num_of_vrings * sizeof(struct
> fw_rsc_vdev_vring)
> > @@ -488,6 +505,18 @@ static int rproc_handle_vdev(struct rproc *rproc,
> struct fw_rsc_vdev *rsc,
> >  	rvdev->rproc =3D rproc;
> >  	rvdev->index =3D rproc->nb_vdev++;
> >
> > +	/* Initialise vdev subdevice */
> > +	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
> > +	rvdev->dev.parent =3D rproc->dev.parent;
> > +	rvdev->dev.release =3D rproc_rvdev_release;
> > +	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev-
> >dev.parent), name);
> > +	dev_set_drvdata(&rvdev->dev, rvdev);
> > +	dma_set_coherent_mask(&rvdev->dev, DMA_BIT_MASK(32));
> > +
> > +	ret =3D device_register(&rvdev->dev);
> > +	if (ret)
> > +		goto free_rvdev;
> > +
> >  	/* parse the vrings */
> >  	for (i =3D 0; i < rsc->num_of_vrings; i++) {
> >  		ret =3D rproc_parse_vring(rvdev, rsc, i);
> > @@ -518,7 +547,7 @@ static int rproc_handle_vdev(struct rproc *rproc,
> struct fw_rsc_vdev *rsc,
> >  	for (i--; i >=3D 0; i--)
> >  		rproc_free_vring(&rvdev->vring[i]);
> >  free_rvdev:
> > -	kfree(rvdev);
> > +	device_unregister(&rvdev->dev);
> >  	return ret;
> >  }
> >
> > @@ -536,7 +565,7 @@ void rproc_vdev_release(struct kref *ref)
> >
> >  	rproc_remove_subdev(rproc, &rvdev->subdev);
> >  	list_del(&rvdev->node);
> > -	kfree(rvdev);
> > +	device_unregister(&rvdev->dev);
> >  }
> >
> >  /**
> > diff --git a/drivers/remoteproc/remoteproc_internal.h
> b/drivers/remoteproc/remoteproc_internal.h
> > index f6cad24..bfeacfd 100644
> > --- a/drivers/remoteproc/remoteproc_internal.h
> > +++ b/drivers/remoteproc/remoteproc_internal.h
> > @@ -52,6 +52,7 @@ struct dentry *rproc_create_trace_file(const char
> *name, struct rproc *rproc,
> >  int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
> >
> >  void *rproc_da_to_va(struct rproc *rproc, u64 da, int len);
> > +phys_addr_t rproc_va_to_pa(void *cpu_addr);
> >  int rproc_trigger_recovery(struct rproc *rproc);
> >
> >  int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware =
*fw);
> > diff --git a/drivers/remoteproc/remoteproc_virtio.c
> b/drivers/remoteproc/remoteproc_virtio.c
> > index de21f62..9ee63c0 100644
> > --- a/drivers/remoteproc/remoteproc_virtio.c
> > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > @@ -17,7 +17,9 @@
> >   * GNU General Public License for more details.
> >   */
> >
> > +#include <linux/dma-mapping.h>
> >  #include <linux/export.h>
> > +#include <linux/of_reserved_mem.h>
> >  #include <linux/remoteproc.h>
> >  #include <linux/virtio.h>
> >  #include <linux/virtio_config.h>
> > @@ -315,10 +317,48 @@ static void rproc_virtio_dev_release(struct devic=
e
> *dev)
> >  int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> >  {
> >  	struct rproc *rproc =3D rvdev->rproc;
> > -	struct device *dev =3D &rproc->dev;
> > +	struct device *dev =3D &rvdev->dev;
> >  	struct virtio_device *vdev =3D &rvdev->vdev;
> > +	struct rproc_mem_entry *mem;
> >  	int ret;
> >
> > +	/* Try to find dedicated vdev buffer carveout */
> > +	mem =3D rproc_find_carveout_by_name(rproc, "vdev%dbuffer",
> rvdev->index);
> > +	if (mem) {
> > +		phys_addr_t pa;
> > +
> > +		if (mem->of_resm_idx !=3D -1) {
> > +			struct device_node *np =3D rproc->dev.parent-
> >of_node;
> > +
> > +			/* Associate reserved memory to vdev device */
> > +			ret =3D of_reserved_mem_device_init_by_idx(dev, np,
> > +								 mem-
> >of_resm_idx);
> > +			if (ret) {
> > +				dev_err(dev, "Can't associate reserved
> memory\n");
> > +				goto out;
> > +			}
> > +		} else {
> > +			if (mem->va) {
> > +				dev_warn(dev, "vdev %d buffer already
> mapped\n",
> > +					 rvdev->index);
> > +				pa =3D rproc_va_to_pa(mem->va);
> > +			} else {
> > +				/* Use dma address as carveout no
> memmapped yet */
> > +				pa =3D (phys_addr_t)mem->dma;
> > +			}
> > +
> > +			/* Associate vdev buffer memory pool to vdev
> subdev */
> > +			ret =3D dmam_declare_coherent_memory(dev, pa,
> > +							   mem->da,
> > +							   mem->len,
> > +
> DMA_MEMORY_EXCLUSIVE);
>=20
> Is it not possible to associate the dma_mem with vdev->dev directly,
> instead of injecting yet another device in-between the remoteproc
> platform device and the virtio device?

Thank you for the review.
I'll check how to use virtio device. An additional ops for memory registrat=
ion may be needed at virtio level.=20

>=20
> That way the resulting allocation in e.g. virtio_rpmsg would be on the
> virtio device itself, not its parent.
Yes agree, it will simplify allocation/inheritance...

Regards,
Loic
>=20
> Regards,
> Bjorn
>=20
> > +			if (ret < 0) {
> > +				dev_err(dev, "Failed to associate buffer\n");
> > +				goto out;
> > +			}
> > +		}
> > +	}
> > +
> >  	vdev->id.device	=3D id,
> >  	vdev->config =3D &rproc_virtio_config_ops,
> >  	vdev->dev.parent =3D dev;
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index 6b3a234..2921dd2 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -547,6 +547,7 @@ struct rproc_vdev {
> >  	struct kref refcount;
> >
> >  	struct rproc_subdev subdev;
> > +	struct device dev;
> >
> >  	unsigned int id;
> >  	struct list_head node;
> > --
> > 1.9.1
> >
