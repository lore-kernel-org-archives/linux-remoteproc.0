Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v2 07/16] remoteproc: st: add reserved memory support
Date: Fri, 12 Jan 2018 08:19:10 +0000
Message-ID: <6c76ad27e7974db2bf02de698ae92dd3@SFHDAG7NODE2.st.com>
References: <1512060411-729-1-git-send-email-loic.pallardy@st.com>
 <1512060411-729-8-git-send-email-loic.pallardy@st.com>
 <20171214011559.GI17344@builder>
In-Reply-To: <20171214011559.GI17344@builder>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: Thursday, December 14, 2017 2:16 AM
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: ohad@wizery.com; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
> benjamin.gaignard@linaro.org
> Subject: Re: [PATCH v2 07/16] remoteproc: st: add reserved memory support
>=20
> On Thu 30 Nov 08:46 PST 2017, Loic Pallardy wrote:
>=20
> > ST remote processor needs some specified memory regions for firmware
> and IPC.
> > Memory regions are defined as reserved memory and should be registered
> in
> > remoteproc core thanks to rproc_add_carveout function.
> > Memory region release is handled by ST driver itself on remove operatio=
n.
> >
> > Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> > ---
> >  drivers/remoteproc/st_remoteproc.c | 43
> +++++++++++++++++++++++++++++++-------
> >  1 file changed, 35 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/remoteproc/st_remoteproc.c
> b/drivers/remoteproc/st_remoteproc.c
> > index aacef0e..1549ce8 100644
> > --- a/drivers/remoteproc/st_remoteproc.c
> > +++ b/drivers/remoteproc/st_remoteproc.c
> > @@ -19,6 +19,7 @@
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > +#include <linux/of_address.h>
> >  #include <linux/of_device.h>
> >  #include <linux/of_reserved_mem.h>
> >  #include <linux/platform_device.h>
> > @@ -208,8 +209,10 @@ static int st_rproc_parse_dt(struct
> platform_device *pdev)
> >  	struct device *dev =3D &pdev->dev;
> >  	struct rproc *rproc =3D platform_get_drvdata(pdev);
> >  	struct st_rproc *ddata =3D rproc->priv;
> > -	struct device_node *np =3D dev->of_node;
> > -	int err;
> > +	struct device_node *node, *np =3D dev->of_node;
> > +	struct resource res;
> > +	struct rproc_mem_entry *mem;
> > +	int err, count, i;
> >
> >  	if (ddata->config->sw_reset) {
> >  		ddata->sw_reset =3D devm_reset_control_get_exclusive(dev,
> > @@ -254,10 +257,36 @@ static int st_rproc_parse_dt(struct
> platform_device *pdev)
> >  		return -EINVAL;
> >  	}
> >
> > -	err =3D of_reserved_mem_device_init(dev);
> > -	if (err) {
> > -		dev_err(dev, "Failed to obtain shared memory\n");
> > -		return err;
> > +	count =3D of_count_phandle_with_args(np, "memory-region", NULL);
> > +
> > +	for (i =3D 0; i < count; i++) {
>=20
> If you use of_phandle_iterator this becomes a little bit more compact
> and using of_reserved_mem_lookup() gives you the flexibility of
> specifying the reserved-memory using size=3D in addition to a reg=3D.
>=20
> of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> while ((err =3D of_phandle_iterator_next(&it)) =3D=3D 0) {
> 	rmem =3D of_reserved_mem_lookup(it->node);
>=20
> 	// Memory is rmem->base, rmem->size;
> }
>=20

Good point, thanks

> > +		node =3D of_parse_phandle(np, "memory-region", i);
> > +		if (!node) {
> > +			dev_err(dev, "No memory-region specified\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		err =3D of_address_to_resource(node, 0, &res);
> > +		if (err) {
> > +			dev_err(dev, "Bad memory-region definition\n");
> > +			return err;
> > +		}
> > +
> > +		mem =3D devm_kzalloc(dev, sizeof(*mem), GFP_KERNEL);
> > +		if (!mem)
> > +			return -ENOMEM;
> > +
> > +		mem->dma =3D res.start;
> > +		mem->da =3D res.start;
> > +		mem->len =3D resource_size(&res);
> > +		mem->va =3D devm_ioremap_wc(dev, mem->dma, mem-
> >len);
> > +		if (!mem->va) {
> > +			dev_err(dev, "Unable to map memory region:
> %pa+%zx\n",
> > +				&res.start, mem->len);
> > +			return -EBUSY;
> > +		}
> > +
> > +		rproc_add_carveout(rproc, mem);
> >  	}
>=20
> We have a few copies of this logic, how about we move this into a helper
> function in the core?
>
Yes, helper function to abstract rproc_mem_entry structure would be nice

Regards,
Loic
=20
> Regards,
> Bjorn
