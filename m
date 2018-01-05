Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 5 Jan 2018 10:50:50 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 7/8] remoteproc: Drop dangling find_rsc_table dummies
Message-ID: <20180105185050.GD478@tuxbook>
References: <20171213224111.17864-1-bjorn.andersson@linaro.org>
 <20171213224111.17864-8-bjorn.andersson@linaro.org>
 <c3e80239c8d84645919713897fcf9e46@SFHDAG7NODE2.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3e80239c8d84645919713897fcf9e46@SFHDAG7NODE2.st.com>
To: Loic PALLARDY <loic.pallardy@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 05 Jan 08:53 PST 2018, Loic PALLARDY wrote:

> 
> 
> > -----Original Message-----
> > From: linux-remoteproc-owner@vger.kernel.org [mailto:linux-remoteproc-
> > owner@vger.kernel.org] On Behalf Of Bjorn Andersson
> > Sent: Wednesday, December 13, 2017 11:41 PM
> > To: Ohad Ben-Cohen <ohad@wizery.com>; Bjorn Andersson
> > <bjorn.andersson@linaro.org>
> > Cc: linux-remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: [PATCH 7/8] remoteproc: Drop dangling find_rsc_table dummies
> > 
> > As the core now deals with the lack of a resource table, remove the
> > dangling custom dummy implementations of find_rsc_table from drivers.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  drivers/remoteproc/qcom_adsp_pil.c |  1 -
> >  drivers/remoteproc/qcom_common.c   | 19 -------------------
> >  drivers/remoteproc/qcom_common.h   |  4 ----
> >  drivers/remoteproc/qcom_q6v5_pil.c | 11 -----------
> >  drivers/remoteproc/qcom_wcnss.c    |  1 -
> >  drivers/remoteproc/st_slim_rproc.c | 18 ------------------
> >  include/linux/remoteproc.h         |  4 ----
> >  7 files changed, 58 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_adsp_pil.c
> > b/drivers/remoteproc/qcom_adsp_pil.c
> > index 7b9d810b23f1..b0b0d5ca1ca0 100644
> > --- a/drivers/remoteproc/qcom_adsp_pil.c
> > +++ b/drivers/remoteproc/qcom_adsp_pil.c
> > @@ -181,7 +181,6 @@ static const struct rproc_ops adsp_ops = {
> >  	.start = adsp_start,
> >  	.stop = adsp_stop,
> >  	.da_to_va = adsp_da_to_va,
> > -	.find_rsc_table = qcom_mdt_find_rsc_table,
> >  	.load = adsp_load,
> >  };
> > 
> > diff --git a/drivers/remoteproc/qcom_common.c
> > b/drivers/remoteproc/qcom_common.c
> > index 818ee3657043..ce2dcc4f7de7 100644
> > --- a/drivers/remoteproc/qcom_common.c
> > +++ b/drivers/remoteproc/qcom_common.c
> > @@ -32,25 +32,6 @@
> > 
> >  static BLOCKING_NOTIFIER_HEAD(ssr_notifiers);
> > 
> > -/**
> > - * qcom_mdt_find_rsc_table() - provide dummy resource table for
> > remoteproc
> > - * @rproc:	remoteproc handle
> > - * @fw:		firmware header
> > - * @tablesz:	outgoing size of the table
> > - *
> > - * Returns a dummy table.
> > - */
> > -struct resource_table *qcom_mdt_find_rsc_table(struct rproc *rproc,
> > -					       const struct firmware *fw,
> > -					       int *tablesz)
> > -{
> > -	static struct resource_table table = { .ver = 1, };
> > -
> > -	*tablesz = sizeof(table);
> > -	return &table;
> > -}
> > -EXPORT_SYMBOL_GPL(qcom_mdt_find_rsc_table);
> > -
> >  static int glink_subdev_probe(struct rproc_subdev *subdev)
> >  {
> >  	struct qcom_rproc_glink *glink = to_glink_subdev(subdev);
> > diff --git a/drivers/remoteproc/qcom_common.h
> > b/drivers/remoteproc/qcom_common.h
> > index 541586e528b3..73efed969bfd 100644
> > --- a/drivers/remoteproc/qcom_common.h
> > +++ b/drivers/remoteproc/qcom_common.h
> > @@ -30,10 +30,6 @@ struct qcom_rproc_ssr {
> >  	const char *name;
> >  };
> > 
> > -struct resource_table *qcom_mdt_find_rsc_table(struct rproc *rproc,
> > -					       const struct firmware *fw,
> > -					       int *tablesz);
> > -
> >  void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink
> > *glink);
> >  void qcom_remove_glink_subdev(struct rproc *rproc, struct
> > qcom_rproc_glink *glink);
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pil.c
> > b/drivers/remoteproc/qcom_q6v5_pil.c
> > index fbff5d842581..6f6ea0414366 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pil.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pil.c
> > @@ -304,16 +304,6 @@ static void q6v5_clk_disable(struct device *dev,
> >  		clk_disable_unprepare(clks[i]);
> >  }
> > 
> > -static struct resource_table *q6v5_find_rsc_table(struct rproc *rproc,
> > -						  const struct firmware *fw,
> > -						  int *tablesz)
> > -{
> > -	static struct resource_table table = { .ver = 1, };
> > -
> > -	*tablesz = sizeof(table);
> > -	return &table;
> > -}
> > -
> >  static int q6v5_xfer_mem_ownership(struct q6v5 *qproc, int
> > *current_perm,
> >  				   bool remote_owner, phys_addr_t addr,
> >  				   size_t size)
> > @@ -927,7 +917,6 @@ static const struct rproc_ops q6v5_ops = {
> >  	.start = q6v5_start,
> >  	.stop = q6v5_stop,
> >  	.da_to_va = q6v5_da_to_va,
> > -	.find_rsc_table = q6v5_find_rsc_table,
> >  	.load = q6v5_load,
> >  };
> > 
> > diff --git a/drivers/remoteproc/qcom_wcnss.c
> > b/drivers/remoteproc/qcom_wcnss.c
> > index cc44ec598522..1fa5253020dd 100644
> > --- a/drivers/remoteproc/qcom_wcnss.c
> > +++ b/drivers/remoteproc/qcom_wcnss.c
> > @@ -310,7 +310,6 @@ static const struct rproc_ops wcnss_ops = {
> >  	.start = wcnss_start,
> >  	.stop = wcnss_stop,
> >  	.da_to_va = wcnss_da_to_va,
> > -	.find_rsc_table = qcom_mdt_find_rsc_table,
> >  	.load = wcnss_load,
> >  };
> > 
> > diff --git a/drivers/remoteproc/st_slim_rproc.c
> > b/drivers/remoteproc/st_slim_rproc.c
> > index 1538ea915c49..c6a2a8b68c7a 100644
> > --- a/drivers/remoteproc/st_slim_rproc.c
> > +++ b/drivers/remoteproc/st_slim_rproc.c
> > @@ -200,28 +200,10 @@ static void *slim_rproc_da_to_va(struct rproc
> > *rproc, u64 da, int len)
> >  	return va;
> >  }
> > 
> > -/*
> > - * Firmware handler operations: sanity, boot address, load ...
> > - */
> > -
> > -static struct resource_table empty_rsc_tbl = {
> > -	.ver = 1,
> > -	.num = 0,
> > -};
> > -
> > -static struct resource_table *slim_rproc_find_rsc_table(struct rproc *rproc,
> > -					       const struct firmware *fw,
> > -					       int *tablesz)
> > -{
> > -	*tablesz = sizeof(empty_rsc_tbl);
> > -	return &empty_rsc_tbl;
> > -}
> > -
> >  static const struct rproc_ops slim_rproc_ops = {
> >  	.start		= slim_rproc_start,
> >  	.stop		= slim_rproc_stop,
> >  	.da_to_va       = slim_rproc_da_to_va,
> > -	.find_rsc_table = slim_rproc_find_rsc_table,
> Hi Bjorn, 
> Your patch is not complete for st_slim_rproc and so not working.
> In your patch 6/8, .load_rsc_table is define to default rproc_elf_load_rsc_table if no load ops defined.
> 
> 	/* Default to ELF loader if no load function is specified */
>  	if (!rproc->ops->load) {
>  		rproc->ops->load = rproc_elf_load_segments;
> -		rproc->ops->find_rsc_table = rproc_elf_find_rsc_table;
> +		rproc->ops->load_rsc_table = rproc_elf_load_rsc_table;
> 
> As st_slim_rproc has no load ops, it will inherit from all default ops including rproc_elf_load_rsc_table.
> As no resource table present in firmware, an error will be returned and st_slim_rproc will failed.

Thanks for catching my mistake, Loic! The expected outcome would be that
the slim_rproc_ops does point the "load" to the now exported ELF loader
symbol and by that won't get a find_rsc_table entry from the default
set..

> In case of Qualcom, load ops is defined...

Right, in the end the st_slim driver should have been defined just as
the Qualcomm one - but referencing rproc_elf_load_segments().

> See below B2260 log (with additional error message in rproc_load_rsc_table function.
> 
> [   10.201079] remoteproc remoteproc2: st231-delta is available
> [   10.258121] remoteproc remoteproc2: powering up st231-delta
> [   10.258143] remoteproc remoteproc2: Booting fw image rproc-st231-delta-fw, size 44416
> [   10.258151] rproc_load_rsc_table: error -22  
> 
> Moreover with your proposal, as the choice to support or not a
> resource table is based on the fact rproc->ops->load_rsc_table is set
> or not, it is not possible with one unique driver to support firmware
> with resource table and firmware without resource table.

This is retaining the previous behaviour of failing to load/start a
remoteproc if no resource table is found, when the driver expects one.
The new scheme would allow you to specify a custom load_rsc_table that
calls rproc_elf_load_rsc_table() and ignores the return value to support
your use case.

> Will be better from my pov to consider that no resource table  found
> in rproc_elf_load_rsc_table function as a normal case and not an
> error.

This would be a change in behavior and I can see how this could be
annoying to people (by not catching their mistakes during development).

If you think this is the preferred implementation then please submit a
separate patch for this so we can get some feedback from other users. 

Regards,
Bjorn
