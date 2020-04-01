Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Wed, 1 Apr 2020 15:55:01 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v2 13/17] remoteproc: Introducting new functions to start
 and stop an MCU
Message-ID: <20200401215501.GH17383@xps15>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-14-mathieu.poirier@linaro.org>
 <160253ad-1be1-f8ea-573d-5a73af25b0c7@ti.com>
 <1a3ca6eb-df01-6c54-e3ef-dad2f49d1b05@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a3ca6eb-df01-6c54-e3ef-dad2f49d1b05@ti.com>
To: Suman Anna <s-anna@ti.com>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, loic.pallardy@st.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Mar 31, 2020 at 04:46:32PM -0500, Suman Anna wrote:
> On 3/31/20 1:08 PM, Suman Anna wrote:
> > Hi Mathieu,
> > 
> > On 3/24/20 4:45 PM, Mathieu Poirier wrote:
> >> Add new functions to replace direct calling of rproc->ops->start() and
> >> rproc->ops->stop().  That way different behaviour can be played out
> >> when booting an MCU or synchronising with it.
> >>
> >> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >> ---
> >>  drivers/remoteproc/remoteproc_core.c     |  6 +++---
> >>  drivers/remoteproc/remoteproc_internal.h | 12 ++++++++++++
> >>  2 files changed, 15 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >> index 488723fcb142..d3c4d7e6ca25 100644
> >> --- a/drivers/remoteproc/remoteproc_core.c
> >> +++ b/drivers/remoteproc/remoteproc_core.c
> >> @@ -1330,7 +1330,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
> >>  	}
> >>  
> >>  	/* power up the remote processor */
> >> -	ret = rproc->ops->start(rproc);
> >> +	ret = rproc_start_hw(rproc);
> >>  	if (ret) {
> >>  		dev_err(dev, "can't start rproc %s: %d\n", rproc->name, ret);
> >>  		goto unprepare_subdevices;
> >> @@ -1351,7 +1351,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
> >>  	return 0;
> >>  
> >>  stop_rproc:
> >> -	rproc->ops->stop(rproc);
> >> +	rproc_stop_hw(rproc);
> >>  unprepare_subdevices:
> >>  	rproc_unprepare_subdevices(rproc);
> >>  reset_table_ptr:
> >> @@ -1485,7 +1485,7 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
> >>  	rproc->table_ptr = rproc->cached_table;
> >>  
> >>  	/* power off the remote processor */
> >> -	ret = rproc->ops->stop(rproc);
> >> +	ret = rproc_stop_hw(rproc);
> >>  	if (ret) {
> >>  		dev_err(dev, "can't stop rproc: %d\n", ret);
> >>  		return ret;
> >> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> >> index 5f711ceb97ba..7ca23d46dfd4 100644
> >> --- a/drivers/remoteproc/remoteproc_internal.h
> >> +++ b/drivers/remoteproc/remoteproc_internal.h
> >> @@ -160,4 +160,16 @@ struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
> >>  	return NULL;
> >>  }
> >>  
> >> +static inline int rproc_start_hw(struct rproc *rproc)
> >> +{
> >> +	RPROC_OPS_HELPER(start, rproc);
> >> +	return -EINVAL;
> >> +}
> >> +
> >> +static inline int rproc_stop_hw(struct rproc *rproc)
> >> +{
> >> +	RPROC_OPS_HELPER(stop, rproc);
> >> +	return -EINVAL;
> >> +}
> > 
> > Since we already have the concept of subdevices, how about we call these
> > rproc_{start/stop}_device?
> 
> Actually, does this patch needs to be moved up in the order atleast
> prior to patch 11, may be after patch 9?

Sure, that can be done...

> 
> regards
> Suman
> 
> > 
> >> +
> >>  #endif /* REMOTEPROC_INTERNAL_H */
> >>
> > 
> 
