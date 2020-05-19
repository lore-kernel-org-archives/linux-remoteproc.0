Return-Path: <SRS0=V02Z=7B=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E77B4C433DF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 May 2020 20:41:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADDF62072C
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 May 2020 20:41:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ECzgFQEq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbgESUlo (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 19 May 2020 16:41:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgESUln (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 May 2020 16:41:43 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1A0EC08C5C0
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2020 13:41:43 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id 5so200272pjd.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2020 13:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V6sKSE6C44cvXyb/g2V2AN4nvx5Jqz0pLmmsYUuA158=;
        b=ECzgFQEqswMLnmgp4t2ImvrB0dMEkJX/CNCleRbBsYPzmIJ5T/IZxdh5bAvlfhT+A/
         Ckyr1ua1yrzLCyr+YS6epqK80CBF5y7Trad7gcNuH3q/DjRGYVjXfe0rQTxxK8zMHHP7
         /7C9H+0PuK+Yaum38tF9eC5pnhFCTuSbnYo46fvk5iVLYZbKcJoQOQDHgDpewnhM8+hR
         1hB1nFtIQQYW2SdORmhoIq2aEVGDvPDmNo3uCyR1c+2kwZPTs5x67/0XtAWqdM/yZzSx
         FTU2LBhVKLPWa2BaPTE/MRrRJYYo5UwGugMwpd8y8AsLVRgTWoO7rP4I1A4mIdxfmq1r
         j/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V6sKSE6C44cvXyb/g2V2AN4nvx5Jqz0pLmmsYUuA158=;
        b=Axqxv7z5CI67g9TBLsdOXeyXqm3nU+Xe6ks579ZrWlSi+pxsbacVE7Y1IVjKEW06AZ
         lEt4zx9bZ2xdKcl0gj0PhYIbGu++O5axZyISjAETwbVR4RkGtmDhe6SZhwkytz7DZMTx
         +htXPcS/7TiCRGCu5vnMa9e5H6NW9TcoCVoEcmqE3WzA89rlDax/5Rwts4O7qo2bZcqh
         XtNKMDAmHHukqH+5HVdBIqpadM4LvXkp2iHggO11HyFouieU/uGudJoadf1Pvmdy+A2G
         rp7FlxYmDBttuUVG/ubW9zfeP21eh7P348VKZyWvbqeriiW2ttc/sxu1J6BGzfRkmk5W
         472A==
X-Gm-Message-State: AOAM5331apCQTI+jjDdwzr5kn56cZFmK1Ng5y5J32c1curckJ+TUdN5J
        72GL3UXcIOBKMBcqhYmOjZ+tkASmiGo=
X-Google-Smtp-Source: ABdhPJx3WLU3KCmYxZ2FekGD/+RxK1YmHHMukDs1jdvhz4tqMxuP/miIxCvfyqUEeW8AE+HnlnqEow==
X-Received: by 2002:a17:90a:141:: with SMTP id z1mr1382039pje.33.1589920903190;
        Tue, 19 May 2020 13:41:43 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id t21sm276915pgu.39.2020.05.19.13.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 13:41:42 -0700 (PDT)
Date:   Tue, 19 May 2020 13:40:21 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        linux-kernel@vger.kernel.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org
Subject: Re: [PATCH v3 2/2] remoteproc: qcom: Add notification types to SSR
Message-ID: <20200519204021.GD408178@builder.lan>
References: <1588112169-29447-1-git-send-email-rishabhb@codeaurora.org>
 <1588112169-29447-3-git-send-email-rishabhb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588112169-29447-3-git-send-email-rishabhb@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 28 Apr 15:16 PDT 2020, Rishabh Bhatnagar wrote:

> From: Siddharth Gupta <sidgup@codeaurora.org>
> 
> The SSR subdevice only adds callback for the unprepare event. Add callbacks
> for unprepare, start and prepare events. The client driver for a particular
> remoteproc might be interested in knowing the status of the remoteproc
> while undergoing SSR, not just when the remoteproc has finished shutting
> down.
> 
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_common.c      | 46 +++++++++++++++++++++++++++++++++--
>  include/linux/remoteproc/qcom_rproc.h | 14 +++++++++++
>  2 files changed, 58 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index 7cd17be..0d91cf3 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -197,7 +197,7 @@ struct rproc_notif_info *find_notif_info(const char *name)
>   *
>   * This registers the @nb notifier block as part the notifier chain for a
>   * remoteproc associated with @name. The notifier block's callback
> - * will be invoked when the particular remote processor is stopped.
> + * will be invoked when the particular remote processor is started/stopped.
>   */
>  void *qcom_register_ssr_notifier(const char *name, struct notifier_block *nb)
>  {
> @@ -239,6 +239,44 @@ int qcom_unregister_ssr_notifier(void *notify, struct notifier_block *nb)
>  }
>  EXPORT_SYMBOL_GPL(qcom_unregister_ssr_notifier);
>  
> +static int ssr_notify_prepare(struct rproc_subdev *subdev)
> +{
> +	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
> +	struct rproc_notif_data data = {
> +		.name = ssr->info->name,
> +		.crashed = false,
> +	};
> +
> +	srcu_notifier_call_chain(&ssr->info->notifier_list,
> +				 RPROC_BEFORE_POWERUP, &data);
> +	return 0;
> +}
> +
> +static int ssr_notify_start(struct rproc_subdev *subdev)
> +{
> +	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
> +	struct rproc_notif_data data = {
> +		.name = ssr->info->name,
> +		.crashed = false,
> +	};
> +
> +	srcu_notifier_call_chain(&ssr->info->notifier_list,
> +				 RPROC_AFTER_POWERUP, &data);
> +	return 0;
> +}
> +
> +static void ssr_notify_stop(struct rproc_subdev *subdev, bool crashed)
> +{
> +	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
> +	struct rproc_notif_data data = {
> +		.name = ssr->info->name,
> +		.crashed = crashed,
> +	};
> +
> +	srcu_notifier_call_chain(&ssr->info->notifier_list,
> +				 RPROC_BEFORE_SHUTDOWN, &data);
> +}
> +
>  static void ssr_notify_unprepare(struct rproc_subdev *subdev)
>  {
>  	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
> @@ -247,7 +285,8 @@ static void ssr_notify_unprepare(struct rproc_subdev *subdev)
>  		.crashed = false,
>  	};
>  
> -	srcu_notifier_call_chain(&ssr->info->notifier_list, 0, &data);
> +	srcu_notifier_call_chain(&ssr->info->notifier_list,
> +				 RPROC_AFTER_SHUTDOWN, &data);
>  }
>  
>  
> @@ -282,6 +321,9 @@ void qcom_add_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr,
>  	}
>  	mutex_unlock(&rproc_notif_lock);
>  	ssr->info = info;
> +	ssr->subdev.prepare = ssr_notify_prepare;
> +	ssr->subdev.start = ssr_notify_start;
> +	ssr->subdev.stop = ssr_notify_stop;
>  	ssr->subdev.unprepare = ssr_notify_unprepare;
>  
>  	rproc_add_subdev(rproc, &ssr->subdev);
> diff --git a/include/linux/remoteproc/qcom_rproc.h b/include/linux/remoteproc/qcom_rproc.h
> index 3dc65c0..567c1f9 100644
> --- a/include/linux/remoteproc/qcom_rproc.h
> +++ b/include/linux/remoteproc/qcom_rproc.h
> @@ -5,6 +5,20 @@
>  
>  #if IS_ENABLED(CONFIG_QCOM_RPROC_COMMON)
>  
> +/**
> + * enum rproc_notif_type - Different stages of remoteproc notifications
> + * @RPROC_BEFORE_SHUTDOWN:	unprepare stage of  remoteproc
> + * @RPROC_AFTER_SHUTDOWN:	stop stage of  remoteproc
> + * @RPROC_BEFORE_POWERUP:	prepare stage of  remoteproc
> + * @RPROC_AFTER_POWERUP:	start stage of  remoteproc
> + */
> +enum rproc_notif_type {
> +	RPROC_BEFORE_SHUTDOWN,
> +	RPROC_AFTER_SHUTDOWN,
> +	RPROC_BEFORE_POWERUP,
> +	RPROC_AFTER_POWERUP,

Given that these are not generic remoteproc things I would like a qcom
prefix on them.

How about QCOM_SSR_BEFORE_SHUTDOWN ... 

Apart from that, this looks good.

Thanks,
Bjorn

> +};
> +
>  struct rproc_notif_data {
>  	const char *name;
>  	bool crashed;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
