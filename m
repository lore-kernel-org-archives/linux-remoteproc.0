Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 3 Aug 2016 15:02:31 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/4] remoteproc: Introduce always-on flag
Message-ID: <20160803220231.GF13516@tuxbot>
References: <1470077883-7419-1-git-send-email-bjorn.andersson@linaro.org>
 <57A0B99F.6040206@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57A0B99F.6040206@st.com>
To: loic pallardy <loic.pallardy@st.com>
Cc: linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 02 Aug 08:17 PDT 2016, loic pallardy wrote:

> Hi Bjorn,
> 
> On 08/01/2016 08:58 PM, Bjorn Andersson wrote:
> >Introduce an "always-on" flag on rprocs to make it possible to flag
> >remote processors without vdevs to automatically boot once the firmware
> >is found.
> >
> Should this flag rather be named "auto-boot"? From my pov, "always-on" means
> coprocessor can't be shutdown.
> 

I saw it from the view of the remoteproc driver, in which case it's
always-on. But I'm fine with naming it "auto-boot" instead.

[..]
> >diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
[..]
> >@@ -978,11 +982,16 @@ static int rproc_add_virtio_devices(struct rproc *rproc)
> >  int rproc_trigger_recovery(struct rproc *rproc)
> >  {
> >  	struct rproc_vdev *rvdev, *rvtmp;
> >+	int ret;
> >
> >  	dev_err(&rproc->dev, "recovering %s\n", rproc->name);
> >
> >  	init_completion(&rproc->crash_comp);
> >
> >+	/* shut down the remote */
> >+	/* TODO: make sure this works with rproc->power > 1 */
> >+	rproc_shutdown(rproc);
> >+
> >  	/* clean up remote vdev entries */
> >  	list_for_each_entry_safe(rvdev, rvtmp, &rproc->rvdevs, node)
> >  		rproc_remove_virtio_dev(rvdev);
> >@@ -993,7 +1002,17 @@ int rproc_trigger_recovery(struct rproc *rproc)
> >  	/* Free the copy of the resource table */
> >  	kfree(rproc->cached_table);
> >
> >-	return rproc_add_virtio_devices(rproc);
> >+	ret = rproc_add_virtio_devices(rproc);
> >+	if (ret)
> >+		return ret;
> >+
> >+	/*
> >+	 * boot the remote processor up again, waiting for the async fw load to
> >+	 * finish
> >+	 */
> >+	rproc_boot(rproc);
> You are changing current behavior by forcing rproc boot whatever
> "always-on". Moreover coprocessor already rebooted by
> rproc_add_virtio_device if "always-on" flag is set, doesn't it?
> If yes, rproc->power will be equal to 2 and rproc_shutdown call will failed
> as this second rproc_boot call is unknown from customer pov.
> 

rproc_add_virtio_devices() does no longer call rproc_boot(), this patch
moves that call. So for always-on rprocs "power" will go 1 -> 0 -> 1 in
this function.

What does change is that for a non-always-on case.

If we have 1 client that has requested rproc_boot() then the current
implementation will bring "power" down to 1 and we will wait until the
client for some reason calls rproc_shutdown(). After that we might boot
the system again, if there are any vdevs in the resource table.

Here we will bring "power" from 1 -> 0 -> 1, without regarding who's
holding references.

> >+
> >+	return 0;
> >  }

Regards,
Bjorn
