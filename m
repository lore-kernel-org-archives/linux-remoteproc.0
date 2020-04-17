Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Fri, 17 Apr 2020 15:56:01 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v2 6/7] remoteproc: Split rproc_ops allocation from
 rproc_alloc()
Message-ID: <20200417215601.GC10372@xps15>
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
 <20200415204858.2448-7-mathieu.poirier@linaro.org>
 <61497230-40ec-ffc6-3cc0-e5cb754ac859@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61497230-40ec-ffc6-3cc0-e5cb754ac859@ti.com>
To: Suman Anna <s-anna@ti.com>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, elder@linaro.org, Markus.Elfring@web.de, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Apr 17, 2020 at 08:49:25AM -0500, Suman Anna wrote:
> On 4/15/20 3:48 PM, Mathieu Poirier wrote:
> > Make the rproc_ops allocation a function on its own in an effort
> > to clean up function rproc_alloc().
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Reviewed-by: Alex Elder <elder@linaro.org>
> > ---
> >   drivers/remoteproc/remoteproc_core.c | 32 +++++++++++++++++-----------
> >   1 file changed, 20 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index 0bfa6998705d..a5a0ceb86b3f 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -2001,6 +2001,25 @@ static int rproc_alloc_firmware(struct rproc *rproc,
> >   	return 0;
> >   }
> > +static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
> > +{
> > +	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
> > +	if (!rproc->ops)
> > +		return -ENOMEM;
> > +
> > +	/* Default to ELF loader if no load function is specified */
> > +	if (!rproc->ops->load) {
> > +		rproc->ops->load = rproc_elf_load_segments;
> > +		rproc->ops->parse_fw = rproc_elf_load_rsc_table;
> > +		rproc->ops->find_loaded_rsc_table =
> > +						rproc_elf_find_loaded_rsc_table;
> > +		rproc->ops->sanity_check = rproc_elf_sanity_check;
> 
> So, the conditional check on sanity check is dropped and the callback
> switched here without the changelog reflecting anything why. You should just
> rebase this patch on top of Clement's patch [1] that removes the conditional
> flag, and also usage from the remoteproc platform drivers.

That's a rebase that went very wrong...

Thanks for pointing it out,
Mathieu

> 
> regards
> Suman
> 
> [1] https://patchwork.kernel.org/patch/11462013/
> 
> 
> > +		rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >   /**
> >    * rproc_alloc() - allocate a remote processor handle
> >    * @dev: the underlying device
> > @@ -2040,8 +2059,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
> >   	if (rproc_alloc_firmware(rproc, name, firmware))
> >   		goto free_rproc;
> > -	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
> > -	if (!rproc->ops)
> > +	if (rproc_alloc_ops(rproc, ops))
> >   		goto free_firmware;
> >   	rproc->name = name;
> > @@ -2068,16 +2086,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
> >   	atomic_set(&rproc->power, 0);
> > -	/* Default to ELF loader if no load function is specified */
> > -	if (!rproc->ops->load) {
> > -		rproc->ops->load = rproc_elf_load_segments;
> > -		rproc->ops->parse_fw = rproc_elf_load_rsc_table;
> > -		rproc->ops->find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table;
> > -		if (!rproc->ops->sanity_check)
> > -			rproc->ops->sanity_check = rproc_elf32_sanity_check;
> > -		rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
> > -	}
> > -
> >   	mutex_init(&rproc->lock);
> >   	INIT_LIST_HEAD(&rproc->carveouts);
> > 
> 
