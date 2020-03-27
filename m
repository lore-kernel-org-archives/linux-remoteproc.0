Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Fri, 27 Mar 2020 15:49:44 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH 11/11] remoteproc: stm32: Allocate rproc for
 synchronisation with MCU
Message-ID: <20200327214944.GA25303@xps15>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
 <20200324220329.15523-12-mathieu.poirier@linaro.org>
 <fd4e531aa40b40bcb401268e720cefe6@SFHDAG7NODE2.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd4e531aa40b40bcb401268e720cefe6@SFHDAG7NODE2.st.com>
To: Loic PALLARDY <loic.pallardy@st.com>
Cc: "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>, "s-anna@ti.com" <s-anna@ti.com>, "peng.fan@nxp.com" <peng.fan@nxp.com>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Fabien DESSENNE <fabien.dessenne@st.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Mar 27, 2020 at 05:11:37PM +0000, Loic PALLARDY wrote:
> Hi Mathieu,
> 
> > -----Original Message-----
> > From: linux-remoteproc-owner@vger.kernel.org <linux-remoteproc-
> > owner@vger.kernel.org> On Behalf Of Mathieu Poirier
> > Sent: mardi 24 mars 2020 23:03
> > To: bjorn.andersson@linaro.org
> > Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
> > anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
> > <arnaud.pouliquen@st.com>; Fabien DESSENNE
> > <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
> > Subject: [PATCH 11/11] remoteproc: stm32: Allocate rproc for
> > synchronisation with MCU
> > 
> > Allocate remote processor structure with state machine if the MCU
> > has already been started by an external entity.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/stm32_rproc.c | 19 ++++++++++++++++---
> >  1 file changed, 16 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/stm32_rproc.c
> > b/drivers/remoteproc/stm32_rproc.c
> > index 07be306c0fb1..f320ef9ee286 100644
> > --- a/drivers/remoteproc/stm32_rproc.c
> > +++ b/drivers/remoteproc/stm32_rproc.c
> > @@ -608,7 +608,7 @@ static struct rproc_ops st_rproc_ops = {
> >  	.get_boot_addr	= rproc_elf_get_boot_addr,
> >  };
> > 
> > -static __maybe_unused struct rproc_ops st_rproc_sync_ops = {
> > +static struct rproc_ops st_rproc_sync_ops = {
> >  	.start		= stm32_rproc_sync_start,
> >  	.stop		= stm32_rproc_sync_stop,
> >  	.kick		= stm32_rproc_kick,
> > @@ -616,6 +616,12 @@ static __maybe_unused struct rproc_ops
> > st_rproc_sync_ops = {
> >  	.find_loaded_rsc_table =
> > stm32_rproc_sync_elf_find_loaded_rsc_table,
> >  };
> > 
> > +static struct rproc_sync_states st_sync_states = {
> > +	.on_init = true, /* sync with MCU when the kernel boots */
> > +	.after_stop = false, /* don't resync with MCU if stopped from sysfs
> > */
> > +	.after_crash = false, /* don't resync with MCU after a crash */
> > +};
> > +
> >  static const struct of_device_id stm32_rproc_match[] = {
> >  	{ .compatible = "st,stm32mp1-m4" },
> >  	{},
> > @@ -847,15 +853,22 @@ static int stm32_rproc_probe(struct
> > platform_device *pdev)
> >  		ret = stm32_rproc_get_loaded_rsc_table(pdev, ddata);
> >  		if (ret)
> >  			goto free_ddata;
> > +
> > +		rproc = rproc_alloc_state_machine(dev, np->name,
> > &st_rproc_ops,
> > +						  &st_rproc_sync_ops,
> > +						  &st_sync_states, NULL,
> > +						  sizeof(*ddata));
> Could we have only one call to rproc_alloc_state_machine(), simply configuring
> st_sync_states according to m4_state and other DT properties?

Yes, very much so - I'll do that for V2.

Mathieu

> 
> Regards,
> Loic
> > +	} else {
> > +		rproc = rproc_alloc(dev, np->name, &st_rproc_ops,
> > +				    NULL, sizeof(*ddata));
> > +		rproc->auto_boot = auto_boot;
> >  	}
> > 
> > -	rproc = rproc_alloc(dev, np->name, &st_rproc_ops, NULL,
> > sizeof(*ddata));
> >  	if (!rproc) {
> >  		ret = -ENOMEM;
> >  		goto free_ddata;
> >  	}
> > 
> > -	rproc->auto_boot = auto_boot;
> >  	rproc->has_iommu = false;
> >  	ddata->workqueue = create_workqueue(dev_name(dev));
> >  	if (!ddata->workqueue) {
> > --
> > 2.20.1
> 
