Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Thu, 27 Feb 2020 11:47:06 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH 3/6] remoteproc: sysmon: Inform current rproc about all
 active rprocs
Message-ID: <20200227184706.GA20116@xps15>
References: <1582167465-2549-1-git-send-email-sidgup@codeaurora.org>
 <1582167465-2549-4-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582167465-2549-4-git-send-email-sidgup@codeaurora.org>
To: Siddharth Gupta <sidgup@codeaurora.org>
Cc: agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org, psodagud@codeaurora.org, rishabhb@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, Feb 19, 2020 at 06:57:42PM -0800, Siddharth Gupta wrote:
> A remoteproc that has just recovered from a crash will not be aware of the
> state of other remoteprocs. Send sysmon notifications on behalf of all the
> active/online remoteprocs to the one that just booted up.
> 
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_sysmon.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
> index 851664e..d0d59d5 100644
> --- a/drivers/remoteproc/qcom_sysmon.c
> +++ b/drivers/remoteproc/qcom_sysmon.c
> @@ -457,6 +457,7 @@ static int sysmon_start(struct rproc_subdev *subdev)
>  {
>  	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon,
>  						  subdev);
> +	struct qcom_sysmon *target;
>  	struct sysmon_event event = {
>  		.subsys_name = sysmon->name,
>  		.ssr_event = SSCTL_SSR_EVENT_AFTER_POWERUP
> @@ -464,6 +465,17 @@ static int sysmon_start(struct rproc_subdev *subdev)
>  
>  	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)&event);
>  
> +	mutex_lock(&sysmon_lock);
> +	list_for_each_entry(target, &sysmon_list, node) {
> +		if (target == sysmon ||
> +		    target->rproc->state != RPROC_RUNNING)
> +			continue;
> +
> +		event.subsys_name = target->name;
> +		ssctl_send_event(sysmon, &event);
> +	}
> +	mutex_unlock(&sysmon_lock);
> +

The changelog is specific about crash recovery but to me this code will run
every time an MCU is switched on.  If I understand correctly, in a crash
recovery situation or simply an MCU coming on line, you want to make sure the
subdevices associated to the booting (or recovering) MCU knows about subdevices
that were registered with the sysmon_notifiers before it.

If that is the case, the changelog needs to be modified and a good chunk of
comments need to be added to this patch.

Lastly, shouldn't there be a provision for sysmon->ssctl_version == 2?

Thanks,
Mathieu 

>  	return 0;
>  }
>  
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
