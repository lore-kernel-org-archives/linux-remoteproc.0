Date: Thu, 13 Feb 2020 20:37:51 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 6/8] remoteproc: Introduce "panic" callback in ops
Message-ID: <20200214043748.GR3948@builder>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
 <20200211005059.1377279-7-bjorn.andersson@linaro.org>
 <158164806895.184098.244699295706516537@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158164806895.184098.244699295706516537@swboyd.mtv.corp.google.com>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>, Rishabh Bhatnagar <rishabhb@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 13 Feb 18:41 PST 2020, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2020-02-10 16:50:57)
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index 097f33e4f1f3..8b6932027d36 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -2216,10 +2218,53 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
> >  }
> >  EXPORT_SYMBOL(rproc_report_crash);
> >  
> > +static int rproc_panic_handler(struct notifier_block *nb, unsigned long event,
> > +                              void *ptr)
> > +{
> > +       unsigned int longest = 0;
> > +       struct rproc *rproc;
> > +       unsigned int d;
> > +       int locked;
> > +
> > +       locked = mutex_trylock(&rproc_list_mutex);
> > +       if (!locked) {
> > +               pr_err("Failed to acquire rproc list lock, won't call panic functions\n");
> > +               return NOTIFY_DONE;
> > +       }
> > +
> > +       list_for_each_entry(rproc, &rproc_list, node) {
> > +               if (!rproc->ops->panic || rproc->state != RPROC_RUNNING)
> > +                       continue;
> > +
> > +               d = rproc->ops->panic(rproc);
> > +               if (d > longest)
> > +                       longest = d;
> 
> Could be
> 
> 	d = max(longest, d);
> 

I like this better and now I have an excuse to change to it.

> > +       }
> > +
> > +       mutex_unlock(&rproc_list_mutex);
> > +
> > +       /* Delay panic for the longest requested duration */
> > +       mdelay(longest);
> 
> Is this to flush caches? Maybe indicate that in the comment.
> 

Here, in the core, it's for whatever the individual drivers might need
it for, but "flushing caches" is likely the main purpose.

That said, the Qualcomm implementation is, as you can see, to issue a
generic "stop request", so flushing caches will not be the only thing
that happens.

> > +
> > +       return NOTIFY_DONE;
> > +}
> > +
> > +static void __init rproc_init_panic(void)
> > +{
> > +       rproc_panic_nb.notifier_call = rproc_panic_handler;
> > +       atomic_notifier_chain_register(&panic_notifier_list, &rproc_panic_nb);
> 
> This is an atomic notifier, but the notifier function takes a mutex,
> which sleeps. It should use spinlocks, and never sleep, given that panic
> can be called from anywhere.
> 

Given that we're only trylocking I was expecting there not to be a
sleep. But if that's the case I'll have to revisit this.

If I rework rproc_get_by_phandle() slightly I should be able to rely on
rcu instead of the mutex for the two readers, which would also resolve
Arnaud's concern regarding the possibility of a panic while updating the
list will cause the panic handling to be skipped.

> > +}
> > +
> > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > index 16ad66683ad0..14f05f26cbcd 100644
> > --- a/include/linux/remoteproc.h
> > +++ b/include/linux/remoteproc.h
> > @@ -369,6 +369,8 @@ enum rsc_handling_status {
> >   *                     expects to find it
> >   * @sanity_check:      sanity check the fw image
> >   * @get_boot_addr:     get boot address to entry point specified in firmware
> > + * @panic:     optional callback to react to system panic, core will delay
> > + *             panic at least the returned number of milliseconds
> >   */
> >  struct rproc_ops {
> >         int (*start)(struct rproc *rproc);
> > @@ -383,6 +385,7 @@ struct rproc_ops {
> >         int (*load)(struct rproc *rproc, const struct firmware *fw);
> >         int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
> >         u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
> > +       unsigned int (*panic)(struct rproc *rproc);
> 
> Maybe should be unsigned long to match other "timeouts" in the kernel.

Sounds good.

Thanks,
Bjorn
