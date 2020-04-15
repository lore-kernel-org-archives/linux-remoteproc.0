Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Wed, 15 Apr 2020 11:03:22 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v2 1/6] remoteproc: sysmon: Add ability to send type of
 notification
Message-ID: <20200415170322.GA16583@xps15>
References: <1586389003-26675-1-git-send-email-sidgup@codeaurora.org>
 <1586389003-26675-2-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586389003-26675-2-git-send-email-sidgup@codeaurora.org>
To: Siddharth Gupta <sidgup@codeaurora.org>
Cc: agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org, psodagud@codeaurora.org, rishabhb@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, Apr 08, 2020 at 04:36:38PM -0700, Siddharth Gupta wrote:
> Current implementation of the sysmon driver does not support adding
> notifications for other remoteproc events - prepare, start, unprepare.
> Clients on the remoteproc side might be interested in knowing when a
> remoteproc boots up. This change adds the ability to send the notification
> type along with the name. For example, audio DSP is interested in knowing
> when modem has crashed so that it can perform cleanup and wait for modem to
> boot up before it starts processing data again.
> 
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
>  drivers/remoteproc/qcom_sysmon.c | 54 +++++++++++++++++++++++++++-------------
>  1 file changed, 37 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
> index faf3822..1366050 100644
> --- a/drivers/remoteproc/qcom_sysmon.c
> +++ b/drivers/remoteproc/qcom_sysmon.c
> @@ -46,6 +46,25 @@ struct qcom_sysmon {
>  	struct sockaddr_qrtr ssctl;
>  };
>  
> +enum {
> +	SSCTL_SSR_EVENT_BEFORE_POWERUP,
> +	SSCTL_SSR_EVENT_AFTER_POWERUP,
> +	SSCTL_SSR_EVENT_BEFORE_SHUTDOWN,
> +	SSCTL_SSR_EVENT_AFTER_SHUTDOWN,
> +};
> +
> +static const char * const sysmon_state_string[] = {
> +	[SSCTL_SSR_EVENT_BEFORE_POWERUP]	= "before_powerup",
> +	[SSCTL_SSR_EVENT_AFTER_POWERUP]		= "after_powerup",
> +	[SSCTL_SSR_EVENT_BEFORE_SHUTDOWN]	= "before_shutdown",
> +	[SSCTL_SSR_EVENT_AFTER_SHUTDOWN]	= "after_shutdown",
> +};
> +
> +struct sysmon_event {
> +	const char *subsys_name;
> +	u32 ssr_event;
> +};
> +
>  static DEFINE_MUTEX(sysmon_lock);
>  static LIST_HEAD(sysmon_list);
>  
> @@ -54,13 +73,15 @@ static LIST_HEAD(sysmon_list);
>   * @sysmon:	sysmon context
>   * @name:	other remote's name
>   */
> -static void sysmon_send_event(struct qcom_sysmon *sysmon, const char *name)
> +static void sysmon_send_event(struct qcom_sysmon *sysmon,
> +			      const struct sysmon_event *event)
>  {
>  	char req[50];
>  	int len;
>  	int ret;
>  
> -	len = snprintf(req, sizeof(req), "ssr:%s:before_shutdown", name);
> +	len = snprintf(req, sizeof(req), "ssr:%s:%s", event->subsys_name,
> +		       sysmon_state_string[event->ssr_event]);
>  	if (len >= sizeof(req))
>  		return;
>  
> @@ -149,13 +170,6 @@ static int sysmon_callback(struct rpmsg_device *rpdev, void *data, int count,
>  #define SSCTL_SUBSYS_NAME_LENGTH	15
>  
>  enum {
> -	SSCTL_SSR_EVENT_BEFORE_POWERUP,
> -	SSCTL_SSR_EVENT_AFTER_POWERUP,
> -	SSCTL_SSR_EVENT_BEFORE_SHUTDOWN,
> -	SSCTL_SSR_EVENT_AFTER_SHUTDOWN,
> -};
> -
> -enum {
>  	SSCTL_SSR_EVENT_FORCED,
>  	SSCTL_SSR_EVENT_GRACEFUL,
>  };
> @@ -331,7 +345,8 @@ static void ssctl_request_shutdown(struct qcom_sysmon *sysmon)
>   * @sysmon:	sysmon context
>   * @name:	other remote's name
>   */
> -static void ssctl_send_event(struct qcom_sysmon *sysmon, const char *name)
> +static void ssctl_send_event(struct qcom_sysmon *sysmon,
> +			     const struct sysmon_event *event)
>  {
>  	struct ssctl_subsys_event_resp resp;
>  	struct ssctl_subsys_event_req req;
> @@ -346,9 +361,9 @@ static void ssctl_send_event(struct qcom_sysmon *sysmon, const char *name)
>  	}
>  
>  	memset(&req, 0, sizeof(req));
> -	strlcpy(req.subsys_name, name, sizeof(req.subsys_name));
> +	strlcpy(req.subsys_name, event->subsys_name, sizeof(req.subsys_name));
>  	req.subsys_name_len = strlen(req.subsys_name);
> -	req.event = SSCTL_SSR_EVENT_BEFORE_SHUTDOWN;
> +	req.event = event->ssr_event;
>  	req.evt_driven_valid = true;
>  	req.evt_driven = SSCTL_SSR_EVENT_FORCED;
>  
> @@ -432,8 +447,12 @@ static int sysmon_start(struct rproc_subdev *subdev)
>  static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
>  {
>  	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon, subdev);
> +	struct sysmon_event event = {
> +		.subsys_name = sysmon->name,
> +		.ssr_event = SSCTL_SSR_EVENT_BEFORE_SHUTDOWN
> +	};
>  
> -	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)sysmon->name);
> +	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)&event);
>  
>  	/* Don't request graceful shutdown if we've crashed */
>  	if (crashed)
> @@ -456,19 +475,20 @@ static int sysmon_notify(struct notifier_block *nb, unsigned long event,
>  {
>  	struct qcom_sysmon *sysmon = container_of(nb, struct qcom_sysmon, nb);
>  	struct rproc *rproc = sysmon->rproc;
> -	const char *ssr_name = data;
> +	struct sysmon_event *sysmon_event = data;
>  
>  	/* Skip non-running rprocs and the originating instance */
> -	if (rproc->state != RPROC_RUNNING || !strcmp(data, sysmon->name)) {
> +	if (rproc->state != RPROC_RUNNING ||
> +	    !strcmp(sysmon_event->subsys_name, sysmon->name)) {
>  		dev_dbg(sysmon->dev, "not notifying %s\n", sysmon->name);
>  		return NOTIFY_DONE;
>  	}
>  
>  	/* Only SSCTL version 2 supports SSR events */
>  	if (sysmon->ssctl_version == 2)
> -		ssctl_send_event(sysmon, ssr_name);
> +		ssctl_send_event(sysmon, sysmon_event);
>  	else if (sysmon->ept)
> -		sysmon_send_event(sysmon, ssr_name);
> +		sysmon_send_event(sysmon, sysmon_event);
>  
>  	return NOTIFY_DONE;
>  }
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
