Date: Tue, 7 Apr 2020 16:27:02 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2] remoteproc: core: Prevent sleep when rproc crashes
Message-ID: <20200407232659.GM20625@builder.lan>
References: <1582164713-6413-1-git-send-email-sidgup@codeaurora.org>
 <1582164713-6413-3-git-send-email-sidgup@codeaurora.org>
 <20200407222958.GL20625@builder.lan>
 <c98b9b02c49b41c6e2493407f11c5eac@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c98b9b02c49b41c6e2493407f11c5eac@codeaurora.org>
To: rishabhb@codeaurora.org
Cc: Siddharth Gupta <sidgup@codeaurora.org>, ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org, psodagud@codeaurora.org, linux-remoteproc-owner@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 07 Apr 15:59 PDT 2020, rishabhb@codeaurora.org wrote:

> On 2020-04-07 15:29, Bjorn Andersson wrote:
> > On Wed 19 Feb 18:11 PST 2020, Siddharth Gupta wrote:
> > 
> > > Remoteproc recovery should be fast and any delay will have an impact
> > > on the
> > > user-experience. Use power management APIs (pm_stay_awake and
> > > pm_relax) to
> > > ensure that the system does not go to sleep.
> > > 
> > > Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> > > ---
> > >  drivers/remoteproc/remoteproc_core.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_core.c
> > > b/drivers/remoteproc/remoteproc_core.c
> > > index 5ab65a4..52e318c 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -1712,6 +1712,8 @@ static void rproc_crash_handler_work(struct
> > > work_struct *work)
> > > 
> > >  	if (!rproc->recovery_disabled)
> > >  		rproc_trigger_recovery(rproc);
> > > +
> > > +	pm_relax(&rproc->dev);
> > >  }
> > > 
> > >  /**
> > > @@ -2242,6 +2244,8 @@ void rproc_report_crash(struct rproc *rproc,
> > > enum rproc_crash_type type)
> > >  		return;
> > >  	}
> > > 
> > > +	pm_stay_awake(&rproc->dev);
> > 
> > Following Mathieu's question I was expecting you to do this on
> > rproc->dev.parent.
> > 
> > But looking at the implementation of pm_stay_awake(), it ends up being a
> > nop if dev->power.wakeup isn't specified. This in turn seems to come
> > from device_wakeup_enable(), which will bail if dev->power.can_wakeup is
> > not set. But I don't see where this would be set for either the platform
> > driver or the remoteproc's struct device - and neither one of them have
> > a "wakeup" attribute in sysfs.
> > 
> > Is there some additional plumbing needed for this?
> We should be able to create a standalone wakeup source using
> wakeup_source_init.
> Then we can use _pm_stay_awake and _pm_relax on it.

Afaict the way to do this would be to call device_wakeup_enable() on
either the remoteproc or platform driver's struct device.

Given that the resources related to waking up the system are associated
with the platform driver I think this should be done on the platform
driver's struct device and these calls should operate on the rproc's
parent.

Regards,
Bjorn

> > 
> > Regards,
> > Bjorn
> > 
> > > +
> > >  	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
> > >  		rproc->name, rproc_crash_to_string(type));
> > > 
> > > --
> > > Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > > a Linux Foundation Collaborative Project
