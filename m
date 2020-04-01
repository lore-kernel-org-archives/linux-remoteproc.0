Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Wed, 1 Apr 2020 14:41:52 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v2 07/17] remoteproc: Introduce function
 rproc_alloc_state_machine()
Message-ID: <20200401204152.GB17383@xps15>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-8-mathieu.poirier@linaro.org>
 <6c7225848da94bca8df85cbf6beb4255@SFHDAG7NODE2.st.com>
 <dc22cdaf-a70d-b27e-2971-5497188ba089@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc22cdaf-a70d-b27e-2971-5497188ba089@ti.com>
To: Suman Anna <s-anna@ti.com>
Cc: Loic PALLARDY <loic.pallardy@st.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>, "peng.fan@nxp.com" <peng.fan@nxp.com>, Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Fabien DESSENNE <fabien.dessenne@st.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Mar 30, 2020 at 06:10:51PM -0500, Suman Anna wrote:
> Hi Mathieu,
> > 
> >> -----Original Message-----
> >> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> >> Sent: mardi 24 mars 2020 22:46
> >> To: bjorn.andersson@linaro.org
> >> Cc: ohad@wizery.com; Loic PALLARDY <loic.pallardy@st.com>; s-
> >> anna@ti.com; peng.fan@nxp.com; Arnaud POULIQUEN
> >> <arnaud.pouliquen@st.com>; Fabien DESSENNE
> >> <fabien.dessenne@st.com>; linux-remoteproc@vger.kernel.org
> >> Subject: [PATCH v2 07/17] remoteproc: Introduce function
> >> rproc_alloc_state_machine()
> >>
> >> Introducing new function rproc_alloc_state_machine() to allocate
> >> the MCU synchronisation operations and position it as the central
> >> remoteproc core allocation function.
> >>
> >> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >> ---
> >>  drivers/remoteproc/remoteproc_core.c | 84
> >> +++++++++++++++++++++++++---
> >>  include/linux/remoteproc.h           |  5 ++
> >>  2 files changed, 81 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/remoteproc_core.c
> >> b/drivers/remoteproc/remoteproc_core.c
> >> index 9da245734db6..02dbb826aa29 100644
> >> --- a/drivers/remoteproc/remoteproc_core.c
> >> +++ b/drivers/remoteproc/remoteproc_core.c
> >> @@ -1954,6 +1954,7 @@ static void rproc_type_release(struct device *dev)
> >>
> >>  	kfree(rproc->firmware);
> >>  	kfree(rproc->ops);
> >> +	kfree(rproc->sync_ops);
> >>  	kfree(rproc);
> >>  }
> >>
> >> @@ -2018,12 +2019,34 @@ static int rproc_alloc_ops(struct rproc *rproc,
> >> const struct rproc_ops *ops)
> >>  	return 0;
> >>  }
> >>
> >> +static int rproc_alloc_sync_ops(struct rproc *rproc,
> >> +				const struct rproc_ops *sync_ops)
> >> +{
> >> +	/*
> >> +	 * Given the unlimited amount of possibilities when
> >> +	 * synchronising with an MCU, no constraints are imposed
> >> +	 * on sync_ops.
> >> +	 */
> >> +	rproc->sync_ops = kmemdup(sync_ops,
> >> +				  sizeof(*sync_ops), GFP_KERNEL);
> >> +	if (!rproc->sync_ops)
> >> +		return -ENOMEM;
> > Should we check a minimal set of functions in sync_ops to be required?
> > Or we should consider all pointers at NULL is ok ?
> > 
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  static int rproc_alloc_internals(struct rproc *rproc, const char *name,
> >>  				 const struct rproc_ops *boot_ops,
> >> +				 const struct rproc_ops *sync_ops,
> >> +				 struct rproc_sync_states *sync_states,
> > sync_states not used in this patch, should be introduced in patch 8
> 
> +1

I will do that.

> 
> > 
> > Regards,
> > Loic
> > 
> >>  				 const char *firmware, int len)
> >>  {
> >>  	int ret;
> >>
> >> +	/* We need at least a boot or a sync ops. */
> >> +	if (!boot_ops && !sync_ops)
> >> +		return -EINVAL;
> >> +
> >>  	/* We have a boot_ops so allocate firmware name and operations */
> >>  	if (boot_ops) {
> >>  		ret = rproc_alloc_firmware(rproc, name, firmware);
> >> @@ -2035,14 +2058,23 @@ static int rproc_alloc_internals(struct rproc
> >> *rproc, const char *name,
> >>  			return ret;
> >>  	}
> >>
> >> +	/* Allocate a sync_ops if need be */
> >> +	if (sync_ops) {
> >> +		ret = rproc_alloc_sync_ops(rproc, sync_ops);
> >> +		if (ret)
> >> +			return ret;
> >> +	}
> >> +
> >>  	return 0;
> >>  }
> >>
> >>  /**
> >> - * rproc_alloc() - allocate a remote processor handle
> >> + * rproc_alloc_state_machine() - allocate a remote processor handle
> >>   * @dev: the underlying device
> >>   * @name: name of this remote processor
> >>   * @ops: platform-specific handlers (mainly start/stop)
> >> + * @sync_ops: platform-specific handlers for synchronising with MCU
> >> + * @sync_states: states in which @ops and @sync_ops are to be used
> >>   * @firmware: name of firmware file to load, can be NULL
> >>   * @len: length of private data needed by the rproc driver (in bytes)
> >>   *
> >> @@ -2061,13 +2093,15 @@ static int rproc_alloc_internals(struct rproc
> >> *rproc, const char *name,
> >>   * Note: _never_ directly deallocate @rproc, even if it was not registered
> >>   * yet. Instead, when you need to unroll rproc_alloc(), use rproc_free().
> >>   */
> >> -struct rproc *rproc_alloc(struct device *dev, const char *name,
> >> -			  const struct rproc_ops *ops,
> >> -			  const char *firmware, int len)
> >> +struct rproc *rproc_alloc_state_machine(struct device *dev, const char
> >> *name,
> >> +					const struct rproc_ops *ops,
> >> +					const struct rproc_ops *sync_ops,
> >> +					struct rproc_sync_states
> >> *sync_states,
> >> +					const char *firmware, int len)
> 
> Do you foresee the need for sync_ops to be present as long as the rproc
> is registered? I am wondering if it is better to introduce an API where
> you can set the ops at runtime rather than allocate it upfront, so that
> once the initial handling is done, you can reset both the sync_states
> and ops.

That is something I spent a fair amount of time thinking about.  I decided to
proceed with an upfront allocation scheme and see if people would come up
with needs that would mandate a runtime allocation.  I am willing to provide the
API if there is a need for it but would rather not if someone "may" need it. 

> 
> 
> >>  {
> >>  	struct rproc *rproc;
> >>
> >> -	if (!dev || !name || !ops)
> >> +	if (!dev || !name)
> >>  		return NULL;
> >>
> >>  	rproc = kzalloc(sizeof(struct rproc) + len, GFP_KERNEL);
> >> @@ -2084,8 +2118,8 @@ struct rproc *rproc_alloc(struct device *dev, const
> >> char *name,
> >>  	rproc->dev.class = &rproc_class;
> >>  	rproc->dev.driver_data = rproc;
> >>
> >> -	if (rproc_alloc_internals(rproc, name, ops,
> >> -				  firmware, len))
> >> +	if (rproc_alloc_internals(rproc, name, ops, sync_ops,
> >> +				  sync_states, firmware, len))
> >>  		goto out;
> >>
> >>  	/* Assign a unique device index and name */
> >> @@ -2119,7 +2153,41 @@ struct rproc *rproc_alloc(struct device *dev, const
> >> char *name,
> >>  	put_device(&rproc->dev);
> >>  	return NULL;
> >>  }
> >> -EXPORT_SYMBOL(rproc_alloc);
> >> +EXPORT_SYMBOL(rproc_alloc_state_machine);
> >> +
> >> +/**
> >> + * rproc_alloc() - allocate a remote processor handle
> >> + * @dev: the underlying device
> >> + * @name: name of this remote processor
> >> + * @ops: platform-specific handlers (mainly start/stop)
> >> + * @firmware: name of firmware file to load, can be NULL
> >> + * @len: length of private data needed by the rproc driver (in bytes)
> >> + *
> >> + * Allocates a new remote processor handle, but does not register
> >> + * it yet. if @firmware is NULL, a default name is used.
> >> + *
> >> + * This function should be used by rproc implementations during
> >> initialization
> >> + * of the remote processor.
> >> + *
> >> + * After creating an rproc handle using this function, and when ready,
> >> + * implementations should then call rproc_add() to complete
> >> + * the registration of the remote processor.
> >> + *
> >> + * On success the new rproc is returned, and on failure, NULL.
> >> + *
> >> + * Note: _never_ directly deallocate @rproc, even if it was not registered
> >> + * yet. Instead, when you need to unroll rproc_alloc(), use rproc_free().
> >> + */
> >> +struct rproc *rproc_alloc(struct device *dev, const char *name,
> >> +			  const struct rproc_ops *ops,
> >> +			  const char *firmware, int len)
> >> +{
> >> +	if (!name && !firmware)
> 
> Retain the original checks on dev, name and ops from the previous
> rproc_alloc(). A NULL firmware was perfectly valid before, and the name
> is allocated using the default template.

Here firmware can be NULL, but we need a name in order to construct the default
one.  On the flip side ops can be NULL for scenarios where the remoteproc core
is never in charge of the MCU lifecycle.  As for dev, it is checked in
rproc_alloc_state_machine().

> 
> >> +		return NULL;
> >> +
> >> +	return rproc_alloc_state_machine(dev, name, ops, NULL, NULL,
> >> +					 firmware, len);
> >> +}
> 
> Missing the EXPORT_SYMBOL on rproc_alloc() -> it is an API used by modules.

Of course yes, good catch.

> 
> regards
> Suman
> 
> >>
> >>  /**
> >>   * rproc_free() - unroll rproc_alloc()
> >> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> >> index d115e47d702d..d1214487daac 100644
> >> --- a/include/linux/remoteproc.h
> >> +++ b/include/linux/remoteproc.h
> >> @@ -611,6 +611,11 @@ struct rproc *rproc_get_by_child(struct device
> >> *dev);
> >>  struct rproc *rproc_alloc(struct device *dev, const char *name,
> >>  			  const struct rproc_ops *ops,
> >>  			  const char *firmware, int len);
> >> +struct rproc *rproc_alloc_state_machine(struct device *dev, const char
> >> *name,
> >> +					const struct rproc_ops *ops,
> >> +					const struct rproc_ops *sync_ops,
> >> +					struct rproc_sync_states
> >> *sync_states,
> >> +					const char *firmware, int len);
> >>  void rproc_put(struct rproc *rproc);
> >>  int rproc_add(struct rproc *rproc);
> >>  int rproc_del(struct rproc *rproc);
> >> --
> >> 2.20.1
> > 
> 
