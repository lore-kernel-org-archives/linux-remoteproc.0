Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Mon, 30 Mar 2020 16:56:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH 08/11] remoteproc: stm32: Introduce new start and stop
 ops for synchronisation
Message-ID: <20200330225633.GB31331@xps15>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
 <20200324220329.15523-9-mathieu.poirier@linaro.org>
 <cf76679a1a7248df9620aeb2ca659062@SFHDAG7NODE2.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf76679a1a7248df9620aeb2ca659062@SFHDAG7NODE2.st.com>
To: Loic PALLARDY <loic.pallardy@st.com>
Cc: "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>, "s-anna@ti.com" <s-anna@ti.com>, "peng.fan@nxp.com" <peng.fan@nxp.com>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Fabien DESSENNE <fabien.dessenne@st.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Mar 27, 2020 at 05:04:34PM +0000, Loic PALLARDY wrote:
> Hi Mathieu,
> 
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: mardi 24 mars 2020 23:03
> > To: bjorn.andersson@linaro.org
> > Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
> > anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
> > <arnaud.pouliquen@st.com>; Fabien DESSENNE
> > <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
> > Subject: [PATCH 08/11] remoteproc: stm32: Introduce new start and stop ops
> > for synchronisation
> > 
> > Introduce new start and stop rproc_ops functions to be used when
> > synchonising with an MCU.
> > 
> > Mainly based on the work published by Arnaud Pouliquen [1].
> > 
> > [1]. https://patchwork.kernel.org/project/linux-
> > remoteproc/list/?series=239877
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/stm32_rproc.c | 37
> > ++++++++++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/stm32_rproc.c
> > b/drivers/remoteproc/stm32_rproc.c
> > index 5bac0baf8f4c..734605a9223e 100644
> > --- a/drivers/remoteproc/stm32_rproc.c
> > +++ b/drivers/remoteproc/stm32_rproc.c
> > @@ -449,6 +449,13 @@ static int stm32_rproc_start(struct rproc *rproc)
> >  	return stm32_rproc_set_hold_boot(rproc, true);
> >  }
> > 
> > +static int stm32_rproc_sync_start(struct rproc *rproc)
> > +{
> > +	stm32_rproc_add_coredump_trace(rproc);
> > +
> > +	return stm32_rproc_set_hold_boot(rproc, true);
> > +}
> > +
> >  static int stm32_rproc_stop(struct rproc *rproc)
> >  {
> >  	struct stm32_rproc *ddata = rproc->priv;
> > @@ -489,6 +496,30 @@ static int stm32_rproc_stop(struct rproc *rproc)
> >  	return 0;
> >  }
> > 
> > +static int stm32_rproc_sync_stop(struct rproc *rproc)
> > +{
> > +	struct stm32_rproc *ddata = rproc->priv;
> > +	int err;
> > +
> > +	err = stm32_rproc_stop(rproc);
> > +	if (err)
> > +		return err;
> > +
> > +	/* update copro state to OFF */
> > +	if (ddata->m4_state.map) {
> > +		err = regmap_update_bits(ddata->m4_state.map,
> > +					 ddata->m4_state.reg,
> > +					 ddata->m4_state.mask,
> > +					 M4_STATE_OFF);
> > +		if (err) {
> > +			dev_err(&rproc->dev, "failed to set copro state\n");
> > +			return err;
> > +		}
> > +	}
> In fact m4_state is updated in following way:
> - it is set by Linux when M4 is guarantee, that means only when Linux is stopping the M4.
> in that case M4 is under reset and m4_state could be updated to M4_STATE_OFF
> - for all other states, it is M4 responsibility to update m4_state when running
> That means the code above is common to both stm32_rproc_stop() and stm32_rproc_sync_stop().
> Only one function is required.

Very well, I'll get it fixed.

> 
> Regards,
> Loic
> > +
> > +	return 0;
> > +}
> > +
> >  static void stm32_rproc_kick(struct rproc *rproc, int vqid)
> >  {
> >  	struct stm32_rproc *ddata = rproc->priv;
> > @@ -522,6 +553,12 @@ static struct rproc_ops st_rproc_ops = {
> >  	.get_boot_addr	= rproc_elf_get_boot_addr,
> >  };
> > 
> > +static __maybe_unused struct rproc_ops st_rproc_sync_ops = {
> > +	.start		= stm32_rproc_sync_start,
> > +	.stop		= stm32_rproc_sync_stop,
> > +	.kick		= stm32_rproc_kick,
> > +};
> > +
> >  static const struct of_device_id stm32_rproc_match[] = {
> >  	{ .compatible = "st,stm32mp1-m4" },
> >  	{},
> > --
> > 2.20.1
> 
