Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Thu, 2 Apr 2020 14:16:42 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v2 09/17] remoteproc: Call the right core function based
 on synchronisation state
Message-ID: <20200402201642.GA9160@xps15>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-10-mathieu.poirier@linaro.org>
 <006ab94d-daf3-0e28-7098-982d473c00d5@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <006ab94d-daf3-0e28-7098-982d473c00d5@ti.com>
To: Suman Anna <s-anna@ti.com>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, loic.pallardy@st.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Mar 31, 2020 at 10:10:50AM -0500, Suman Anna wrote:
> Hi Mathieu,
> 
> On 3/24/20 4:45 PM, Mathieu Poirier wrote:
> > Call the right core function based on whether we should synchronise
> > with an MCU or boot it from scratch.
> 
> This patch does generate some checkpatch warnings.

Right, checkpatch is complaining but other than duplicating the same code for
all functions, I don't see another way to do this.

> 
> > 
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  drivers/remoteproc/remoteproc_internal.h | 36 +++++++++++-------------
> >  1 file changed, 17 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> > index 73ea32df0156..5f711ceb97ba 100644
> > --- a/drivers/remoteproc/remoteproc_internal.h
> > +++ b/drivers/remoteproc/remoteproc_internal.h
> > @@ -106,38 +106,41 @@ static inline void rproc_set_mcu_sync_state(struct rproc *rproc,
> >  	}
> >  }
> >  
> > +#define RPROC_OPS_HELPER(__operation, ...)				\
> > +	do {								\
> > +		if (rproc_sync_with_mcu(rproc)) {			\
> 
> So this does make the logic a bit convoluted, since you have three
> different flags for rproc_sync_with_mcu, and you apply them in common
> for all the ops. This is what I meant in my comment on Patch 1.

There is indeed 3 different flags but they are only valid in a specific state.
What "ops" are you referring to here?  I'm also not sure about the comment in
"patch 1" - which one would that be and how does it relate to the current block
of code.  Apologies, I need more clarifications.  

> 
> > +			if (!rproc->sync_ops ||				\
> > +			    !rproc->sync_ops->__operation)		\
> > +				return 0;				\
> > +			return rproc->sync_ops->__operation(__VA_ARGS__); \
> 
> Use the same semantics as the regular ops instead of two return
> statements, the code should fallback to the common return 0 after the
> RPROC_OPS_HELPER when neither of them are present.

Yes the tests are exactly the same, no reason to proceed differently.

> 
> regards
> Suman
> 
> > +		} else if (rproc->ops && rproc->ops->__operation)	\
> > +			return rproc->ops->__operation(__VA_ARGS__);	\
> > +	} while (0)							\
> > +
> >  static inline
> >  int rproc_fw_sanity_check(struct rproc *rproc, const struct firmware *fw)
> >  {
> > -	if (rproc->ops->sanity_check)
> > -		return rproc->ops->sanity_check(rproc, fw);
> > -
> > +	RPROC_OPS_HELPER(sanity_check, rproc, fw);
> >  	return 0;
> >  }
> >  
> >  static inline
> >  u32 rproc_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
> >  {
> > -	if (rproc->ops->get_boot_addr)
> > -		return rproc->ops->get_boot_addr(rproc, fw);
> > -
> > +	RPROC_OPS_HELPER(get_boot_addr, rproc, fw);
> >  	return 0;
> >  }
> >  
> >  static inline
> >  int rproc_load_segments(struct rproc *rproc, const struct firmware *fw)
> >  {
> > -	if (rproc->ops->load)
> > -		return rproc->ops->load(rproc, fw);
> > -
> > +	RPROC_OPS_HELPER(load, rproc, fw);
> >  	return -EINVAL;
> >  }
> >  
> >  static inline int rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> >  {
> > -	if (rproc->ops->parse_fw)
> > -		return rproc->ops->parse_fw(rproc, fw);
> > -
> > +	RPROC_OPS_HELPER(parse_fw, rproc, fw);
> >  	return 0;
> >  }
> >  
> > @@ -145,10 +148,7 @@ static inline
> >  int rproc_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc, int offset,
> >  		     int avail)
> >  {
> > -	if (rproc->ops->handle_rsc)
> > -		return rproc->ops->handle_rsc(rproc, rsc_type, rsc, offset,
> > -					      avail);
> > -
> > +	RPROC_OPS_HELPER(handle_rsc, rproc, rsc_type, rsc, offset, avail);
> >  	return RSC_IGNORED;
> >  }
> >  
> > @@ -156,9 +156,7 @@ static inline
> >  struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
> >  						   const struct firmware *fw)
> >  {
> > -	if (rproc->ops->find_loaded_rsc_table)
> > -		return rproc->ops->find_loaded_rsc_table(rproc, fw);
> > -
> > +	RPROC_OPS_HELPER(find_loaded_rsc_table, rproc, fw);
> >  	return NULL;
> >  }
> >  
> > 
> 
