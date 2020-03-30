Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Mon, 30 Mar 2020 17:07:56 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v2 06/17] remoteproc: Introduce function
 rproc_alloc_internals()
Message-ID: <20200330230756.GC31331@xps15>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-7-mathieu.poirier@linaro.org>
 <064cda96467f4ab39b494d543198fa7e@SFHDAG7NODE2.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <064cda96467f4ab39b494d543198fa7e@SFHDAG7NODE2.st.com>
To: Loic PALLARDY <loic.pallardy@st.com>
Cc: "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>, "s-anna@ti.com" <s-anna@ti.com>, "peng.fan@nxp.com" <peng.fan@nxp.com>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Fabien DESSENNE <fabien.dessenne@st.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Mar 27, 2020 at 11:10:20AM +0000, Loic PALLARDY wrote:
> Hi Mathieu,
> 
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: mardi 24 mars 2020 22:46
> > To: bjorn.andersson@linaro.org
> > Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
> > anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
> > <arnaud.pouliquen@st.com>; Fabien DESSENNE
> > <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
> > Subject: [PATCH v2 06/17] remoteproc: Introduce function
> > rproc_alloc_internals()
> > 
> > In preparation to allocate the synchronisation operation and state
> > machine, spin off a new function in order to keep rproc_alloc() as
> > clean as possible.
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 26 ++++++++++++++++++++++---
> > -
> >  1 file changed, 22 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c
> > b/drivers/remoteproc/remoteproc_core.c
> > index ee277bc5556c..9da245734db6 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -2018,6 +2018,26 @@ static int rproc_alloc_ops(struct rproc *rproc,
> > const struct rproc_ops *ops)
> >  	return 0;
> >  }
> > 
> > +static int rproc_alloc_internals(struct rproc *rproc, const char *name,
> > +				 const struct rproc_ops *boot_ops,
> > +				 const char *firmware, int len)
> 
> len argument is not used in the patch nor in the following, maybe removed from my pov.

I debated over this one... It is either introduce the function signature as a
whole or incrementally as parameters are needed.  I'm fine with both and will
adopt the latter on the next revision.

> 
> Regards,
> Loic
> > +{
> > +	int ret;
> > +
> > +	/* We have a boot_ops so allocate firmware name and operations */
> > +	if (boot_ops) {
> > +		ret = rproc_alloc_firmware(rproc, name, firmware);
> > +		if (ret)
> > +			return ret;
> > +
> > +		ret = rproc_alloc_ops(rproc, boot_ops);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * rproc_alloc() - allocate a remote processor handle
> >   * @dev: the underlying device
> > @@ -2064,10 +2084,8 @@ struct rproc *rproc_alloc(struct device *dev, const
> > char *name,
> >  	rproc->dev.class = &rproc_class;
> >  	rproc->dev.driver_data = rproc;
> > 
> > -	if (rproc_alloc_firmware(rproc, name, firmware))
> > -		goto out;
> > -
> > -	if (rproc_alloc_ops(rproc, ops))
> > +	if (rproc_alloc_internals(rproc, name, ops,
> > +				  firmware, len))
> >  		goto out;
> > 
> >  	/* Assign a unique device index and name */
> > --
> > 2.20.1
> 
