Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41BC9C2B9F7
	for <linux-remoteproc@archiver.kernel.org>; Tue, 25 May 2021 03:03:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F2F261423
	for <linux-remoteproc@archiver.kernel.org>; Tue, 25 May 2021 03:03:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhEYDEe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 24 May 2021 23:04:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbhEYDEe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 24 May 2021 23:04:34 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03DA3C061574
        for <linux-remoteproc@vger.kernel.org>; Mon, 24 May 2021 20:03:04 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id y76so19716203oia.6
        for <linux-remoteproc@vger.kernel.org>; Mon, 24 May 2021 20:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=13Aushf3tY/PY+ZRdx7CVt9S0OHJlx5/baJ0K6FwrGo=;
        b=zNpNmoh7r1LBKVpr6dYAFbxfVjBWXhNy1RtZHRGbd+BaA8M12l37XjSctod8bYvR/6
         lQ97SmzffoTky0qWE5J7NRbwuFuLLrgMaSSfZ7/AOmTbfx3GZ2q7A3RYSs9801GAZghH
         +IrntPqcJG/SLxK0XBf1xGaeBci0bOkseOj/yJAqOJ6ncFvap/+vUtfYAhGJbj6VPdmz
         Q5j6eSahZ0oFZeAcjc6IfWmlfC4/iC+DQ0Vbk+ItAy2Nkh5v9b+DrqtP5hESP9V+jFCm
         EL5R5Zfxpsgk5klP1IbBgLxg5yJn7C2golyk46KnLYt0/R5GK9ZSAww/UfZmfJ1XIwxm
         rtZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=13Aushf3tY/PY+ZRdx7CVt9S0OHJlx5/baJ0K6FwrGo=;
        b=orA+zZdIgjO9oflv6cAPGQZyXSRwVnUkcro4wyifWNEcjMjLykK4SHXVDXrg1OMHDD
         7LvmhcfaouHy+G9fu6QxLgBS4aAiHIGFpw3akEyZ7//nWAPnKh8aG/UiU8pI/sPAmDQ1
         M9QxcXzvWZ0zj8Ah+kq8/0Y+EjNJJh1VBsJ1mBXuvOLPI+wiy4z+QRRLA2Oc72NEhr0R
         /gJmw9bcXgZ2tyfk7nJCq1mEOK08pR8Tm/x9QeKyb8WxheYuucprBnjZhsn49gvExVT+
         mApMm5a4dROPX4El8RzIKhZq+CrAJPTPorb0/Mq55Z7ijD2dOdwl0qOYkbQVU/WMsgba
         qhgw==
X-Gm-Message-State: AOAM530azc3U2NzkS4UoGTX/hjswB/M7VVoRHUcHa2Lp0xRQcMYHpM8Q
        PqfD/Mx4yKvikCDJNzpIjP9TuA==
X-Google-Smtp-Source: ABdhPJzOpGxwTlfiTX6mHDdBxsix18g6y7XFe6BJUTfBt2QiEdxupceXqEbdTpkgzdPdi8yJDIm89Q==
X-Received: by 2002:a05:6808:143:: with SMTP id h3mr12872536oie.96.1621911783297;
        Mon, 24 May 2021 20:03:03 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o18sm3499328otp.61.2021.05.24.20.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 20:03:02 -0700 (PDT)
Date:   Mon, 24 May 2021 22:03:00 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, psodagud@codeaurora.org
Subject: Re: [PATCH] remoteproc: core: Invoke subdev callbacks in list order
Message-ID: <YKxo5BXwEPjS5K4d@yoga>
References: <1621292893-18827-1-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621292893-18827-1-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 17 May 18:08 CDT 2021, Siddharth Gupta wrote:

> Subdevices at the beginning of the subdev list should have
> higher priority than those at the end of the list. Reverse
> traversal of the list causes priority inversion, which can
> impact the performance of the device.
> 

The subdev lists layers of the communication onion, we bring them up
inside out and we take them down outside in.

This stems from the primary idea that we want to be able to shut things
down cleanly (in the case of a stop) and we pass the "crashed" flag to
indicate to each recipient during "stop" that it may not rely on the
response of a lower layer.

As such, I don't think it's right to say that we have a priority
inversion.

> For example a device adds the glink, sysmon and ssr subdevs
> to its list. During a crash the ssr notification would go
> before the glink and sysmon notifications. This can cause a
> degraded response when a client driver waits for a response
> from the crashed rproc.
> 

In general the design is such that components are not expected to
communicate with the crashed remote when "crashed" is set, this avoids
the single-remote crash.

The case where this isn't holding up is when two remote processors
crashes simultaneously, in which case e.g. sysmon has been seen hitting
its timeout waiting for an ack from a dead remoteproc - but I was under
the impression that this window shrunk dramatically as a side effect of
us fixing the notification ordering.

> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 626a6b90f..ac8fc42 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1167,7 +1167,7 @@ static int rproc_handle_resources(struct rproc *rproc,
>  
>  static int rproc_prepare_subdevices(struct rproc *rproc)
>  {
> -	struct rproc_subdev *subdev;
> +	struct rproc_subdev *subdev, *itr;
>  	int ret;
>  
>  	list_for_each_entry(subdev, &rproc->subdevs, node) {
> @@ -1181,9 +1181,11 @@ static int rproc_prepare_subdevices(struct rproc *rproc)
>  	return 0;
>  
>  unroll_preparation:
> -	list_for_each_entry_continue_reverse(subdev, &rproc->subdevs, node) {
> -		if (subdev->unprepare)
> -			subdev->unprepare(subdev);
> +	list_for_each_entry(itr, &rproc->subdevs, node) {
> +		if (itr == subdev)
> +			break;
> +		if (itr->unprepare)
> +			itr->unprepare(subdev);
>  	}
>  
>  	return ret;
> @@ -1191,7 +1193,7 @@ static int rproc_prepare_subdevices(struct rproc *rproc)
>  
>  static int rproc_start_subdevices(struct rproc *rproc)
>  {
> -	struct rproc_subdev *subdev;
> +	struct rproc_subdev *subdev, *itr;
>  	int ret;
>  
>  	list_for_each_entry(subdev, &rproc->subdevs, node) {
> @@ -1205,9 +1207,11 @@ static int rproc_start_subdevices(struct rproc *rproc)
>  	return 0;
>  
>  unroll_registration:
> -	list_for_each_entry_continue_reverse(subdev, &rproc->subdevs, node) {
> -		if (subdev->stop)
> -			subdev->stop(subdev, true);
> +	list_for_each_entry(itr, &rproc->subdevs, node) {
> +		if (itr == subdev)
> +			break;
> +		if (itr->stop)
> +			itr->stop(itr, true);
>  	}
>  
>  	return ret;
> @@ -1217,7 +1221,7 @@ static void rproc_stop_subdevices(struct rproc *rproc, bool crashed)
>  {
>  	struct rproc_subdev *subdev;
>  
> -	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
> +	list_for_each_entry(subdev, &rproc->subdevs, node) {

I presume this is the case you actually care about, can you help me
understand if you changed the others for consistence or if there's some
flow of events where that might be necessary.

Regards,
Bjorn

>  		if (subdev->stop)
>  			subdev->stop(subdev, crashed);
>  	}
> @@ -1227,7 +1231,7 @@ static void rproc_unprepare_subdevices(struct rproc *rproc)
>  {
>  	struct rproc_subdev *subdev;
>  
> -	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
> +	list_for_each_entry(subdev, &rproc->subdevs, node) {
>  		if (subdev->unprepare)
>  			subdev->unprepare(subdev);
>  	}
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
