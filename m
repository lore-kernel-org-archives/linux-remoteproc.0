Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 4 Aug 2016 10:23:53 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/4] remoteproc: Introduce always-on flag
Message-ID: <20160804172353.GJ13516@tuxbot>
References: <1470077883-7419-1-git-send-email-bjorn.andersson@linaro.org>
 <57A0B99F.6040206@st.com>
 <20160803220231.GF13516@tuxbot>
 <57A30E84.9010109@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57A30E84.9010109@st.com>
To: loic pallardy <loic.pallardy@st.com>
Cc: linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 04 Aug 02:44 PDT 2016, loic pallardy wrote:

> >>>diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
[..]
> >>>@@ -993,7 +1002,17 @@ int rproc_trigger_recovery(struct rproc *rproc)
> >>>  	/* Free the copy of the resource table */
> >>>  	kfree(rproc->cached_table);
> >>>
> >>>-	return rproc_add_virtio_devices(rproc);
> >>>+	ret = rproc_add_virtio_devices(rproc);
> >>>+	if (ret)
> >>>+		return ret;
> >>>+
> >>>+	/*
> >>>+	 * boot the remote processor up again, waiting for the async fw load to
> >>>+	 * finish
> >>>+	 */
> >>>+	rproc_boot(rproc);
> >>You are changing current behavior by forcing rproc boot whatever
> >>"always-on". Moreover coprocessor already rebooted by
> >>rproc_add_virtio_device if "always-on" flag is set, doesn't it?
> >>If yes, rproc->power will be equal to 2 and rproc_shutdown call will failed
> >>as this second rproc_boot call is unknown from customer pov.
> >>
> >
> >rproc_add_virtio_devices() does no longer call rproc_boot(), this patch
> >moves that call. So for always-on rprocs "power" will go 1 -> 0 -> 1 in
> >this function.
> >
> >What does change is that for a non-always-on case.
> >
> >If we have 1 client that has requested rproc_boot() then the current
> >implementation will bring "power" down to 1 and we will wait until the
> >client for some reason calls rproc_shutdown(). After that we might boot
> >the system again, if there are any vdevs in the resource table.
> >
> >Here we will bring "power" from 1 -> 0 -> 1, without regarding who's
> >holding references.
> 
> I'm fine with the final sequence in which only rproc_shutdown and rproc_boot
> are called (with patch 3 modifications).
> 
> But having a look only to this patch, we have the following function call:
> 
> rproc_trigger_recovery
>   |__ rproc_shutdown --> power from 1 -> 0
>   |__ rproc_add_virtio_devices
> 	|__ rproc_fw_config_virtio
> 		|__ (if always_on == 1) rproc_boot_nowait --> power from 0 --> 1
>   |__ rproc_boot
> 	if always_on == 1 power from 1 --> 2
> 	else power from 0 --> 1
> 
> on this patch rproc_boot should be called only is always_on flag is not set.
> 
> With patch 3, call to rproc_add_virtio_devices is suppressed and behavior is
> ok.
> 

Doh! Thanks for the explanation, you're of course correct.

Regards,
Bjorn
