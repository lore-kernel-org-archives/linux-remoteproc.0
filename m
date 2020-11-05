Return-Path: <SRS0=+gsc=EL=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79035C2D0A3
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Nov 2020 00:32:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0EB8720BED
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Nov 2020 00:32:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c08FE5tw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733161AbgKEAcA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 4 Nov 2020 19:32:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733015AbgKEAcA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Nov 2020 19:32:00 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4995BC0613D2
        for <linux-remoteproc@vger.kernel.org>; Wed,  4 Nov 2020 16:32:00 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id y22so510558oti.10
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Nov 2020 16:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DhtABJSiSskHDxawNAHeInkIhoLHhr/Rqw/OKeWlcko=;
        b=c08FE5twIizIFpFrR0X/M7OkgNhJ2p0x0vrQ6RGZw5VXMVCZFwNoSfrHcfZnn81BNj
         eiR3m10a/IwrOYu+Vle02m3Iw9+XrBhUZPKN2chKPhkqE9DkIOy4J6cFCy9Fuyqifk8P
         5F4tFe1zGCTXmGSw72IPxFzkbQcnGis8jRzIYh9YQJ9khSwPfD5urXbdLuhArBRytbMH
         B9Ikxy3A362Hq01A8oZkIXDC6fXPAJtLCv/MnjKdnLneUZA1HySt/Q+PMZO7rKWIQQuu
         7TpeOADFqg3g7rB3PpiM0iTVFPfO+Aowoj04YtG/tgkK9pDyk+vUJ+CcnBl0wk0pOXId
         wK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DhtABJSiSskHDxawNAHeInkIhoLHhr/Rqw/OKeWlcko=;
        b=W+/qJK0k8AqVU4SQ03+yin8jF8rRzoRsepXTvQRLtTA/tIcakqAF88ruLXsNfJwwz3
         f8QEqjwgzML/O7+k5QpMd7YSafbTMVRRfWAYTGVnyuEGaspMY1QPWlSJcppMkh2WlnTM
         D15nIfy1p46I8ly5nDaHuVjY7y8pvGwk/klfNupIUGHfqLW22MS5PnlLHXi+rDmv5HK8
         u2GBhr2BredzYDqHWGFWrewZUq5KE46wXwL7pKtw0c7fz9ftZXd42SskU6cD9u/GQItV
         uQB+vSDgG3FY0LG+ZPOncN3wlTYiEKVRfQUbb7e6uXmcep3KbgRiCL5sZ1UVQu+bkf3S
         zoqw==
X-Gm-Message-State: AOAM530nDUT3Xo9M94c/7cNQdSndxcFsa0+orPqqkBTQoBby67IfarsM
        qEHIsXwUmQ8jGxo0u+cgT1vSYQ==
X-Google-Smtp-Source: ABdhPJxCS/mOcYL7FqRe4TEjOvLWgtxG77KL5UeDdUxWeQP7HVo0sHNHQ89bndZeMYLeRuDsYPdHDg==
X-Received: by 2002:a9d:6419:: with SMTP id h25mr222385otl.79.1604536319425;
        Wed, 04 Nov 2020 16:31:59 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s28sm398527otr.4.2020.11.04.16.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 16:31:58 -0800 (PST)
Date:   Wed, 4 Nov 2020 18:31:57 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Siddharth Gupta <sidgup@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] remoteproc: sysmon: Ensure remote notification ordering
Message-ID: <20201105003157.GC1328@builder.lan>
References: <20201104161625.1085981-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104161625.1085981-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 04 Nov 10:16 CST 2020, Bjorn Andersson wrote:

> The reliance on the remoteproc's state for determining when to send
> sysmon notifications to a remote processor is racy with regard to
> concurrent remoteproc operations.
> 
> Further more the advertisement of the state of other remote processor to
> a newly started remote processor might not only send the wrong state,
> but might result in a stream of state changes that are out of order.
> 
> Address this by introducing state tracking within the sysmon instances
> themselves and extend the locking to ensure that the notifications are
> consistent with this state.
> 
> The use of a big lock for all instances will cause contention for
> concurrent remote processor state transitions, but the correctness of
> the remote processors' view of their peers is more important.
> 
> Fixes: 1f36ab3f6e3b ("remoteproc: sysmon: Inform current rproc about all active rprocs")
> Fixes: 1877f54f75ad ("remoteproc: sysmon: Add notifications for events")
> Fixes: 1fb82ee806d1 ("remoteproc: qcom: Introduce sysmon")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/remoteproc/qcom_sysmon.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
> index 9eb2f6bccea6..1e507b66354a 100644
> --- a/drivers/remoteproc/qcom_sysmon.c
> +++ b/drivers/remoteproc/qcom_sysmon.c
> @@ -22,6 +22,8 @@ struct qcom_sysmon {
>  	struct rproc_subdev subdev;
>  	struct rproc *rproc;
>  
> +	int state;
> +
>  	struct list_head node;
>  
>  	const char *name;
> @@ -448,7 +450,10 @@ static int sysmon_prepare(struct rproc_subdev *subdev)
>  		.ssr_event = SSCTL_SSR_EVENT_BEFORE_POWERUP
>  	};
>  
> +	mutex_lock(&sysmon_lock);

This doesn't work, because taking the big lock prevents a concurrently
failing remote processor from reaching smd orglink to indicate that that
remote is dead and the first remote's notifications should be
aborted/fail fast.

The result is in most cases that we're stuck here waiting for a timeout,
but there are extreme corner cases where the notification might be
waiting for the dead remote to drain the communication fifo.


Will send a new version that don't rely on the big lock, but still keeps
state information consistent.

Regards,
Bjorn
