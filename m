Return-Path: <SRS0=FIV4=6E=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6431C3815B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Apr 2020 07:04:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A5FE2078E
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Apr 2020 07:04:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qPMKe74A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgDTHEq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 20 Apr 2020 03:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725896AbgDTHEq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Apr 2020 03:04:46 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1E0DC061A10
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Apr 2020 00:04:45 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id h69so4598276pgc.8
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Apr 2020 00:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=s11JGkMo64bkJfoSlJ3gamPmjiZWAtO5TwTvV1WpWbE=;
        b=qPMKe74Axz3iuvAgEm5PUFr0JEzorHbSLpp+t8fsBt4zWIqblwuGPlrPdfbH6ynq+v
         k6BnEAr7JShE83PlTATp+w5cvsu+xYZ/tiNArEksPm3hswP5df/tqzSxdiOv84S4QsHb
         f9ytGiOWi2JvmqB9UnEjQJpi122Ewhr+DANygi5JPA2tmijZEM6/c8sIFmxgU4zO4inX
         1rnYKlj3GulChVuLX1GF9DOpMB2e3GJ+/LNoGikipve+CdFGffqdFwVlnlR+t2QnaY7B
         pT01gl9peG3qmgQkMCHHq0Lpa9csFASI87dKS8dfaYkXbX/+RJzg45FBbCGqpYIEm5TU
         3gaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=s11JGkMo64bkJfoSlJ3gamPmjiZWAtO5TwTvV1WpWbE=;
        b=fbI1C55RnmPDZbQXAwJ21+TGipApM3SUUHOuc3+mxuhJPWgTD6WEkHwYKKmhOyyPeL
         alflzGE22acChYWnw2lKoNC9F8aoQFP5EzOyGQ4nroE+5ZlzFbUAmZU1i+2T99/keUuV
         4i36w87qh/xrSjPS2fjhzawbGGUOkkKnrOmjqxeXMCTZayekG229v8JeXx0nPg02Hvt2
         Q1HAbAgCfqArH2qnZ4ajraV79Hg+oVP9Go3Z2QEMNpv+1MJlxmYl49y15ST+IoTf4wrg
         Vu6vHF1a3+DQLnPpHWOkFlCM9DhkQsVpcyO6lQmRjtcC9NxQ+q0kiPIiP1ZZlVfoJIkJ
         yuAg==
X-Gm-Message-State: AGi0PuZAaJCRg0xhb1Ow/8F8BrTvpc5SUASfYFJGNgthMgyHA2nRgxOb
        rR4ogxFU6s1ekw6x5IUcti1ciQ==
X-Google-Smtp-Source: APiQypKMKQQMJ6nKIy3wz/SKsVsP3OHHyydE/bozdcBab+k1rAjW8UgKZf3BSB7G8kadD+FVNopaMQ==
X-Received: by 2002:a05:6a00:2cb:: with SMTP id b11mr15087011pft.42.1587366285066;
        Mon, 20 Apr 2020 00:04:45 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a22sm159630pfg.169.2020.04.20.00.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 00:04:44 -0700 (PDT)
Date:   Mon, 20 Apr 2020 00:05:07 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
Subject: Re: [PATCH v2 1/6] remoteproc: sysmon: Add ability to send type of
 notification
Message-ID: <20200420070507.GD1868936@builder.lan>
References: <1586389003-26675-1-git-send-email-sidgup@codeaurora.org>
 <1586389003-26675-2-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586389003-26675-2-git-send-email-sidgup@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200420070507.Soe7LtPG5CBW9OYarjMx-BbSIj1U0UfHY3kvBbHvwhk@z>

On Wed 08 Apr 16:36 PDT 2020, Siddharth Gupta wrote:

> Current implementation of the sysmon driver does not support adding
> notifications for other remoteproc events - prepare, start, unprepare.
> Clients on the remoteproc side might be interested in knowing when a
> remoteproc boots up. This change adds the ability to send the notification
> type along with the name. For example, audio DSP is interested in knowing
> when modem has crashed so that it can perform cleanup and wait for modem to
> boot up before it starts processing data again.
> 
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

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
