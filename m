Return-Path: <SRS0=FIV4=6E=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D07C54FCC
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Apr 2020 07:05:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64E50218AC
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Apr 2020 07:05:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YhWj2yqj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgDTHFf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 20 Apr 2020 03:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725959AbgDTHFe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Apr 2020 03:05:34 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 287D1C061A10
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Apr 2020 00:05:33 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 18so869150pfx.6
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Apr 2020 00:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yfnkSN5f2gaTrJl0GVeCylF5vdCJFRacL3iq4ImD+rk=;
        b=YhWj2yqjYltdCafwN1HzBemr26x7U2lwSkpvnlqo6IJo0NlbzNWOVa0N07A77EWWwn
         d2a91DgOA4DrtHAUYiC1clPD7zxtFe+huZYpKXsIUAJUUEanN3GbJHsHNOF5n5MBgrrL
         LmmvUp4PIBnrB8/LsF0QrAWKyybh3GTDovnmlNTpu1Yg6wQ7+djap5VrV+JIDH79s3+Z
         x6x1zTpH7AM0+tQzYgMdlPXBDXUWkONuEBwWbtR0+Qj9dCl2U3N3ZKKY4atYgK171p/6
         T/6SojVqvnGwmoLFMhQt0EOkBStbxFKcI/VhdzCyb8PgZq+NWX6oktX01NeKbyuOnqGd
         qT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yfnkSN5f2gaTrJl0GVeCylF5vdCJFRacL3iq4ImD+rk=;
        b=kYDNI9Jgge/uBCHZM6NYjiMO3PSgoH5EBYpchjrZzpQmWENTD/G5itt4lyd+RxKZBT
         hQrY8X4Ipd72yOZpGAv55mFGjQiK9de4IWmOlJFPl3P2RKSt9knIed8uuvf4VOwDfRrG
         DA4l2FHeq25yzD8X96qHV667xdMwLOVYn3JiNL5wfUQZ7CKgz4edeny5LbJZJapDqqo8
         tE3An+/bgFjCHv4e2ze6WGvad3X0FLnLD7sEhuvhRhftAUwW+IPFEUbwI+W4sPuq/2gB
         cVsQIsVI0nTt7NYANcIWxa4VVku4+QfsRHRNZWZSzCGh/izUovzEw/uiLbYjdpkzGlL3
         yPIw==
X-Gm-Message-State: AGi0PuadwCqJcbn+8EHyoF7TwjbJKjITXkwlz7tcyDTLgJBIbJu1FLv2
        esWtSlsZwSJsR1fWS430AUh9mA==
X-Google-Smtp-Source: APiQypJioGGBXK8I/SnwK36fUlp2u0SXdz6IJW4yGBOeCoG0BZb46I63vjDyn384qG3lg9DF8qRufg==
X-Received: by 2002:a63:4c2:: with SMTP id 185mr14296077pge.1.1587366332598;
        Mon, 20 Apr 2020 00:05:32 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b5sm161749pfb.190.2020.04.20.00.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 00:05:31 -0700 (PDT)
Date:   Mon, 20 Apr 2020 00:05:55 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
Subject: Re: [PATCH v2 2/6] remoteproc: sysmon: Add notifications for events
Message-ID: <20200420070555.GE1868936@builder.lan>
References: <1586389003-26675-1-git-send-email-sidgup@codeaurora.org>
 <1586389003-26675-3-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586389003-26675-3-git-send-email-sidgup@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200420070555.Xg0jZmquGXdwQvGIThZvdkVtZ3D6WCXg3ccOipuBBbs@z>

On Wed 08 Apr 16:36 PDT 2020, Siddharth Gupta wrote:

> Add notification for other stages of remoteproc boot and shutdown. This
> includes adding callback functions for the prepare and unprepare events,
> and fleshing out the callback function for start.
> 
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/remoteproc/qcom_sysmon.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
> index 1366050..851664e 100644
> --- a/drivers/remoteproc/qcom_sysmon.c
> +++ b/drivers/remoteproc/qcom_sysmon.c
> @@ -439,8 +439,31 @@ static const struct qmi_ops ssctl_ops = {
>  	.del_server = ssctl_del_server,
>  };
>  
> +static int sysmon_prepare(struct rproc_subdev *subdev)
> +{
> +	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon,
> +						  subdev);
> +	struct sysmon_event event = {
> +		.subsys_name = sysmon->name,
> +		.ssr_event = SSCTL_SSR_EVENT_BEFORE_POWERUP
> +	};
> +
> +	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)&event);
> +
> +	return 0;
> +}
> +
>  static int sysmon_start(struct rproc_subdev *subdev)
>  {
> +	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon,
> +						  subdev);
> +	struct sysmon_event event = {
> +		.subsys_name = sysmon->name,
> +		.ssr_event = SSCTL_SSR_EVENT_AFTER_POWERUP
> +	};
> +
> +	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)&event);
> +
>  	return 0;
>  }
>  
> @@ -464,6 +487,18 @@ static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
>  		sysmon_request_shutdown(sysmon);
>  }
>  
> +static void sysmon_unprepare(struct rproc_subdev *subdev)
> +{
> +	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon,
> +						  subdev);
> +	struct sysmon_event event = {
> +		.subsys_name = sysmon->name,
> +		.ssr_event = SSCTL_SSR_EVENT_AFTER_SHUTDOWN
> +	};
> +
> +	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)&event);
> +}
> +
>  /**
>   * sysmon_notify() - notify sysmon target of another's SSR
>   * @nb:		notifier_block associated with sysmon instance
> @@ -563,8 +598,10 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
>  
>  	qmi_add_lookup(&sysmon->qmi, 43, 0, 0);
>  
> +	sysmon->subdev.prepare = sysmon_prepare;
>  	sysmon->subdev.start = sysmon_start;
>  	sysmon->subdev.stop = sysmon_stop;
> +	sysmon->subdev.unprepare = sysmon_unprepare;
>  
>  	rproc_add_subdev(rproc, &sysmon->subdev);
>  
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
