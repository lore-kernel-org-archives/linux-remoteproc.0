Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Wed, 25 Mar 2020 11:57:46 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [RFC 1/2] remoteproc: sysfs: authorize rproc shutdown when rproc
 is crashed
Message-ID: <20200325175746.GA6227@xps15>
References: <1583924072-20648-1-git-send-email-loic.pallardy@st.com>
 <1583924072-20648-2-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583924072-20648-2-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, fabien.dessenne@st.com, s-anna@ti.com
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Loic,

On Wed, Mar 11, 2020 at 11:54:31AM +0100, Loic Pallardy wrote:
> When remoteproc recovery is disabled and rproc crashed, user space
> client has no way to reboot co-processor except by a complete platform
> reboot.
> Indeed rproc_shutdown() is called by sysfs state_store() only is rproc
> state is RPROC_RUNNING.
> 
> This patch offers the possibility to shutdown the co-processor if
> it is in RPROC_CRASHED state and so to restart properly co-processor
> from sysfs interface.

If recovery is disabled on an rproc the platform likely intended to have a hard
reboot and as such we should not be concerned about this case.

Where I think we have a problem, something that is asserted by looking at your 2
patches, is cases where rproc_trigger_recovery() fails.  That leaves the system
in a state where it can't be recovered, something the remoteproc core should not
allow. 

> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c  | 2 +-
>  drivers/remoteproc/remoteproc_sysfs.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 097f33e4f1f3..7ac87a75cd1b 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1812,7 +1812,7 @@ void rproc_shutdown(struct rproc *rproc)
>  	if (!atomic_dec_and_test(&rproc->power))
>  		goto out;
>  
> -	ret = rproc_stop(rproc, false);
> +	ret = rproc_stop(rproc, rproc->state == RPROC_CRASHED);

Please add a comment that explains how we can be in rproc_shutdown() when the
processor has crashed and point to rproc_trigger_recovery().  See below for more
details. 

>  	if (ret) {
>  		atomic_inc(&rproc->power);
>  		goto out;
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index 7f8536b73295..1029458a4678 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -101,7 +101,7 @@ static ssize_t state_store(struct device *dev,
>  		if (ret)
>  			dev_err(&rproc->dev, "Boot failed: %d\n", ret);
>  	} else if (sysfs_streq(buf, "stop")) {
> -		if (rproc->state != RPROC_RUNNING)
> +		if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_CRASHED)
>  			return -EINVAL;

Wouldn't it be better to just prevent the MCU to stay in a crashed state (when
recovery is not disabled)?

I like what you did in the next patch where the state of the MCU is set to
RPROC_CRASHED in case of failure, so that we keep.  I also think the hunk
above is correct.  All that is left is to call rproc_shutdown() directly in
rproc_trigger_recovery() when something goes wrong.  I would also add a
dev_err() so that users have a clue of what happened.

That would leave the system in a stable state without having to add intelligence
to state_store().

Let me know that you think...

Mathieu

>  
>  		rproc_shutdown(rproc);
> -- 
> 2.7.4
> 
