Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: [PATCH v3 08/13] remoteproc: add prepare and unprepare ops
Date: Mon, 14 May 2018 15:03:00 +0000
Message-ID: <b4d9dfbdc6684e59bec149f80897bd42@SFHDAG7NODE2.st.com>
References: <1519921440-21356-1-git-send-email-loic.pallardy@st.com>
 <1519921440-21356-9-git-send-email-loic.pallardy@st.com>
 <20180510005249.GF29093@builder>
In-Reply-To: <20180510005249.GF29093@builder>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>



> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: Thursday, May 10, 2018 2:53 AM
> To: Loic PALLARDY <loic.pallardy@st.com>
> Cc: ohad@wizery.com; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
> benjamin.gaignard@linaro.org
> Subject: Re: [PATCH v3 08/13] remoteproc: add prepare and unprepare ops
>=20
> On Thu 01 Mar 08:23 PST 2018, Loic Pallardy wrote:
>=20
> > On some SoC architecture, it is needed to enable HW like
> > clock, bus, regulator, memory region... before loading
> > co-processor firmware.
> >
> > This patch introduces prepare and unprepare ops to execute
> > platform specific function before firmware loading and after
> > stop execution.
> >
> > Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 20 +++++++++++++++++++-
> >  include/linux/remoteproc.h           |  4 ++++
> >  2 files changed, 23 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/remoteproc/remoteproc_core.c
> b/drivers/remoteproc/remoteproc_core.c
> > index 7a500cb..0ebbc4f 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1058,12 +1058,22 @@ static int rproc_fw_boot(struct rproc *rproc,
> const struct firmware *fw)
> >  		return ret;
> >  	}
> >
> > +	/* Prepare rproc for firmware loading if needed */
> > +	if (rproc->ops->prepare) {
> > +		ret =3D rproc->ops->prepare(rproc);
> > +		if (ret) {
> > +			dev_err(dev, "can't prepare rproc %s: %d\n",
> > +				rproc->name, ret);
> > +			goto disable_iommu;
> > +		}
> > +	}
>=20
> We do allow drivers to implement custom versions of parse_fw() - and
> they can call the resource-table-parse-fw from the custom function.
>=20
> So with the proposed refactoring in patch 9 I would like for parse_fw()
> to call back into the core to fill out the resource lists and then
> before jumping to rproc_start() we loop over the allocator functions.

Agree
Regards,
Loic
>=20
> > +
> >  	rproc->bootaddr =3D rproc_get_boot_addr(rproc, fw);
> >
> >  	/* load resource table */
> >  	ret =3D rproc_load_rsc_table(rproc, fw);
> >  	if (ret)
> > -		goto disable_iommu;
> > +		goto unprepare_rproc;
> >
> >  	/* reset max_notifyid */
> >  	rproc->max_notifyid =3D -1;
> > @@ -1086,6 +1096,10 @@ static int rproc_fw_boot(struct rproc *rproc,
> const struct firmware *fw)
> >  	kfree(rproc->cached_table);
> >  	rproc->cached_table =3D NULL;
> >  	rproc->table_ptr =3D NULL;
> > +unprepare_rproc:
> > +	/* release HW resources if needed */
> > +	if (rproc->ops->unprepare)
> > +		rproc->ops->unprepare(rproc);
> >  disable_iommu:
> >  	rproc_disable_iommu(rproc);
> >  	return ret;
> > @@ -1331,6 +1345,10 @@ void rproc_shutdown(struct rproc *rproc)
> >  	/* clean up all acquired resources */
> >  	rproc_resource_cleanup(rproc);
> >
> > +	/* release HW resources if needed */
> > +	if (rproc->ops->unprepare)
> > +		rproc->ops->unprepare(rproc);
>=20
> And this would then be handled by the rproc_resource_cleanup() function,
> looping over all resources and calling release().
>=20
> Regards,
> Bjorn
