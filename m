Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 3 Aug 2016 11:17:12 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 3/4] remoteproc: Move vdev handling to boot/shutdown
Message-ID: <20160803181712.GE13516@tuxbot>
References: <1470077883-7419-1-git-send-email-bjorn.andersson@linaro.org>
 <1470077883-7419-3-git-send-email-bjorn.andersson@linaro.org>
 <57A0B988.50803@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57A0B988.50803@st.com>
To: loic pallardy <loic.pallardy@st.com>
Cc: linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 02 Aug 08:17 PDT 2016, loic pallardy wrote:

> Hi Bjorn,
> 

Hi Loic,

Thanks for looking at the patches!

[..]
> >diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
[..]
> >@@ -984,23 +990,11 @@ int rproc_trigger_recovery(struct rproc *rproc)
> >  	/* TODO: make sure this works with rproc->power > 1 */
> >  	rproc_shutdown(rproc);
> >
> >-	/* clean up remote vdev entries */
> >-	list_for_each_entry_safe(rvdev, rvtmp, &rproc->rvdevs, node)
> >-		rproc_remove_virtio_dev(rvdev);
> >-
> >  	/* wait until there is no more rproc users */
> >  	wait_for_completion(&rproc->crash_comp);
> >
> >-	/* Free the copy of the resource table */
> >-	kfree(rproc->cached_table);
> I think this line should be part of patch 4 "Move handling of cached table
> to boot/shutdown"
> 
> Regards,
> Loic
> >-
> >-	ret = rproc_add_virtio_devices(rproc);
> >-	if (ret)
> >-		return ret;

Before this patch this operation will trigger an async firmware load
that will reallocate (kmemdup) cached_table. The rproc_boot() below
would wait for this to finish and there would be a cached_table in
place.

> >-
> >  	/*
> >-	 * boot the remote processor up again, waiting for the async fw load to
> >-	 * finish
> >+	 * boot the remote processor up again
> >  	 */
> >  	rproc_boot(rproc);
> >

Now that we instead directly handle the vdev resources in rproc_boot()
the cached_table is not reallocated in this code path and as such has
the life span of rproc_add() (or rather, the async fw callback) to
rproc_del(). Therefor it should not be freed here anymore.

Please do let me know if you see any concerns based on this life cycle
change.

Regards,
Bjorn
