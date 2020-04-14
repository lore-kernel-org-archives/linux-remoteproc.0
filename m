Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Tue, 14 Apr 2020 13:44:41 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH 2/4] remoteproc: Split firmware name allocation from
 rproc_alloc()
Message-ID: <20200414194441.GA25931@xps15>
References: <20200413193401.27234-1-mathieu.poirier@linaro.org>
 <20200413193401.27234-3-mathieu.poirier@linaro.org>
 <bd8cc8d5-94c1-5767-d089-535731fc1055@linaro.org>
 <20200414005506.GG20625@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414005506.GG20625@builder.lan>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Alex Elder <elder@linaro.org>, ohad@wizery.com, s-anna@ti.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hey Bjorn,

On Mon, Apr 13, 2020 at 05:55:06PM -0700, Bjorn Andersson wrote:
> On Mon 13 Apr 13:56 PDT 2020, Alex Elder wrote:
> 
> > On 4/13/20 2:33 PM, Mathieu Poirier wrote:
> > > Make the firmware name allocation a function on its own in order to
> > > introduce more flexibility to function rproc_alloc().
> > > 
> > > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > 
> > I didn't look at the larger context (MCU series); I'm only looking
> > at this (and the others in this series) in isolation.  I like
> > that you're encapsulating this stuff into functions but doing so
> > doesn't really add any flexibility.
> > 
> > Two small suggestions for you to consider but they're truly
> > more about style so it's entirely up to you.  Outside of that
> > this looks straightforward to me, and the result of the series
> > is an improvement.
> > 
> > I'll let you comment on my suggestions before offering my
> > "reviewed-by" indication.
> > 
> > 					-Alex
> > 
> > > ---
> > >  drivers/remoteproc/remoteproc_core.c | 66 ++++++++++++++++------------
> > >  1 file changed, 39 insertions(+), 27 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index 80056513ae71..4dee63f319ba 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -1979,6 +1979,33 @@ static const struct device_type rproc_type = {
> > >  	.release	= rproc_type_release,
> > >  };
> > >  
> > > +static int rproc_alloc_firmware(struct rproc *rproc,
> > > +				const char *name, const char *firmware)
> > > +{
> > > +	char *p, *template = "rproc-%s-fw";
> > > +	int name_len;
> > 
> > Not a big deal (and maybe it's not consistent with other nearby
> > style) but template and name_len could be defined inside the
> > "if (!firmware)" block.
> > 
> 
> I prefer variables declared in the beginning of the function, so I'm
> happy with this.
> 
> > > +	if (!firmware) {
> > > +		/*
> > > +		 * If the caller didn't pass in a firmware name then
> > > +		 * construct a default name.
> > > +		 */
> > > +		name_len = strlen(name) + strlen(template) - 2 + 1;
> > > +		p = kmalloc(name_len, GFP_KERNEL);
> > 
> > 
> > I don't know if it would be an improvement, but you could
> > check for a null p value below for both cases.  I.e.:
> > 
> > 		if (p)
> > 			snprintf(p, ...);
> > 
> 
> Moving the common NULL check and return out seems nice, but given that
> we then have to have this positive conditional I think the end result is
> more complex.
> 
> That said, if we're not just doing a verbatim copy from rproc_alloc() I
> think we should make this function:
> 
> 	if (!firmware)
> 		p = kasprintf(GFP_KERNEL, "rproc-%s-fw", name);
> 	else
> 		p = kstrdup_const(firmware, GFP_KERNEL);

If you really want to use kstrdup_const() the return value has to be casted to a
"char *".  Variable 'p' can't be declared const "char *" because rproc->firmware is not
a "const".  Simply put somewhere the "const" will need to be dropped or casted out.

Mathieu

> 
> 	rproc->firmware = p;
> 
> 	return p ? 0 : -ENOMEM;
> 
> Regards,
> Bjorn
> 
> > (more below)
> > 
> > > +		if (!p)
> > > +			return -ENOMEM;
> > > +		snprintf(p, name_len, template, name);
> > > +	} else {
> > > +		p = kstrdup(firmware, GFP_KERNEL);
> > > +		if (!p)
> > > +			return -ENOMEM;
> > > +	}
> > > +
> > 
> > 	if (!p)
> > 		return -ENOMEM;
> > 	
> > > +	rproc->firmware = p;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  /**
> > >   * rproc_alloc() - allocate a remote processor handle
> > >   * @dev: the underlying device
> > > @@ -2007,42 +2034,21 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
> > >  			  const char *firmware, int len)
> > >  {
> > >  	struct rproc *rproc;
> > > -	char *p, *template = "rproc-%s-fw";
> > > -	int name_len;
> > >  
> > >  	if (!dev || !name || !ops)
> > >  		return NULL;
> > >  
> > > -	if (!firmware) {
> > > -		/*
> > > -		 * If the caller didn't pass in a firmware name then
> > > -		 * construct a default name.
> > > -		 */
> > > -		name_len = strlen(name) + strlen(template) - 2 + 1;
> > > -		p = kmalloc(name_len, GFP_KERNEL);
> > > -		if (!p)
> > > -			return NULL;
> > > -		snprintf(p, name_len, template, name);
> > > -	} else {
> > > -		p = kstrdup(firmware, GFP_KERNEL);
> > > -		if (!p)
> > > -			return NULL;
> > > -	}
> > > -
> > >  	rproc = kzalloc(sizeof(struct rproc) + len, GFP_KERNEL);
> > > -	if (!rproc) {
> > > -		kfree(p);
> > > +	if (!rproc)
> > >  		return NULL;
> > > -	}
> > > +
> > > +	if (rproc_alloc_firmware(rproc, name, firmware))
> > > +		goto free_rproc;
> > >  
> > >  	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
> > > -	if (!rproc->ops) {
> > > -		kfree(p);
> > > -		kfree(rproc);
> > > -		return NULL;
> > > -	}
> > > +	if (!rproc->ops)
> > > +		goto free_firmware;
> > >  
> > > -	rproc->firmware = p;
> > >  	rproc->name = name;
> > >  	rproc->priv = &rproc[1];
> > >  	rproc->auto_boot = true;
> > > @@ -2091,6 +2097,12 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
> > >  	rproc->state = RPROC_OFFLINE;
> > >  
> > >  	return rproc;
> > > +
> > > +free_firmware:
> > > +	kfree(rproc->firmware);
> > > +free_rproc:
> > > +	kfree(rproc);
> > > +	return NULL;
> > >  }
> > >  EXPORT_SYMBOL(rproc_alloc);
> > >  
> > > 
> > 
