Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB653C433FE
	for <linux-remoteproc@archiver.kernel.org>; Wed, 12 Oct 2022 20:44:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbiJLUoU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 12 Oct 2022 16:44:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbiJLUnx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 12 Oct 2022 16:43:53 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFA68BEF80
        for <linux-remoteproc@vger.kernel.org>; Wed, 12 Oct 2022 13:43:47 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id t12-20020a17090a3b4c00b0020b04251529so69924pjf.5
        for <linux-remoteproc@vger.kernel.org>; Wed, 12 Oct 2022 13:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/XV5pr8QqFGjPs8+6LG6NFfr+//dPbYGj0pCHlYmCJo=;
        b=O3BbsgmKcyrP8JEZyCXj8RAZ2efDkDTDsgnsREnCkCP1sXwl0wl4OXjVLPkwgocarI
         Eh6eeUvtYyniV3TaJaml6MFIpbXpJUN8gPtZa8iJCHm/NfijSkyViAb/LQNR4N7SzCR7
         Qk5eBDdK86ktcQzBhwiC0Wk/sF1B6d5H0y4JAcTWOir5CtQACV8ajvzApP9Py+HuQ8TC
         D8r/e6GKsJaa54aKLq7l/cIOB+ammSdhY6RCGanZqpHED9m/+wsFboJRj/XVYJCpbsaS
         GMDPv/h7KMlE5vZCQ45ySUITpN3V1y21y3mPz5QXL9BBC3C8PuvCN8/I6BCLt/Wmr6Hq
         7agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/XV5pr8QqFGjPs8+6LG6NFfr+//dPbYGj0pCHlYmCJo=;
        b=Wj0cCbd15+PHZh12WtTL/jYdEI0vw1Ko62L83fsHuEn+vO3HizlEgV542rduXSJWCt
         Bs+M2HVblkkX3QTqDOImDRkAXI0A6dbGO5ruKls77Xdu1ahkdyOyu1JIpVRiS9qmP3Ms
         L34mQNLsDVPex5d0V7s+wplkyzOXNQZeSKwfhv85iyaWbYPYETEue8ak5zTWuF17XE6t
         vq+3TFyYtyVGKzYorlUUn46gKciHTKv9uTcx+EEVpMakiOPTc7RcNP5M3IZCJOxmtBey
         jSBzv3+Pd8Hhs37Qj0yWD9OhjuyxrQk6O5mCwPz2LLYSMC4s8fDwx8HhE3MatOup1w+v
         qCLg==
X-Gm-Message-State: ACrzQf0RdSMSorHfcg/fBThkbpvKszD5aDfHVMa7QjZk5yGJAvGvto0I
        Uf3r5oj29y6mrMo826ltNuGhZQ==
X-Google-Smtp-Source: AMsMyM7LKuK725wPc8GpTSojQ0O9922L8xMD/vZb34gAp6nqMYstaPxFfsYeAgOfShV9qxydWjJbGA==
X-Received: by 2002:a17:902:e1cd:b0:184:aa71:217d with SMTP id t13-20020a170902e1cd00b00184aa71217dmr3824714pla.77.1665607427224;
        Wed, 12 Oct 2022 13:43:47 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c18-20020a624e12000000b005626c3e5fdbsm288176pfb.143.2022.10.12.13.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 13:43:46 -0700 (PDT)
Date:   Wed, 12 Oct 2022 14:43:44 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Maria Yu <quic_aiquny@quicinc.com>
Cc:     linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_clew@quicinc.com
Subject: Re: [PATCH v4] remoteproc: core: do pm relax when in RPROC_OFFLINE
Message-ID: <20221012204344.GA1178915@p14s>
References: <128dc161-8949-1146-bf8b-310aa33c06a8@quicinc.com>
 <1663312351-28476-1-git-send-email-quic_aiquny@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1663312351-28476-1-git-send-email-quic_aiquny@quicinc.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Please add what has changed from one version to another, either in a cover
letter or after the "Signed-off-by".  There are many examples on how to do that
on the mailing list.

On Fri, Sep 16, 2022 at 03:12:31PM +0800, Maria Yu wrote:
> RPROC_OFFLINE state indicate there is no recovery process
> is in progress and no chance to do the pm_relax.
> Because when recovering from crash, rproc->lock is held and
> state is RPROC_CRASHED -> RPROC_OFFLINE -> RPROC_RUNNING,
> and then unlock rproc->lock.

You are correct - because the lock is held rproc->state should be set to RPROC_RUNNING
when rproc_trigger_recovery() returns.  If that is not the case then something
went wrong.

Function rproc_stop() sets rproc->state to RPROC_OFFLINE just before returning,
so we know the remote processor was stopped.  Therefore if rproc->state is set
to RPROC_OFFLINE something went wrong in either request_firmware() or
rproc_start().  Either way the remote processor is offline and the system probably
in an unknown/unstable.  As such I don't see how calling pm_relax() can help
things along.  

I suggest spending time understanding what leads to the failure when recovering
from a crash and address that problem(s).

Thanks,
Mathieu


> When the state is in RPROC_OFFLINE it means separate request
> of rproc_stop was done and no need to hold the wakeup source
> in crash handler to recover any more.
> 
> Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index e5279ed9a8d7..6bc7b8b7d01e 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1956,6 +1956,17 @@ static void rproc_crash_handler_work(struct work_struct *work)
>  	if (rproc->state == RPROC_CRASHED || rproc->state == RPROC_OFFLINE) {
>  		/* handle only the first crash detected */
>  		mutex_unlock(&rproc->lock);
> +		/*
> +		 * RPROC_OFFLINE state indicate there is no recovery process
> +		 * is in progress and no chance to have pm_relax in place.
> +		 * Because when recovering from crash, rproc->lock is held and
> +		 * state is RPROC_CRASHED -> RPROC_OFFLINE -> RPROC_RUNNING,
> +		 * and then unlock rproc->lock.
> +		 * RPROC_OFFLINE is only an intermediate state in recovery
> +		 * process.
> +		 */
> +		if (rproc->state == RPROC_OFFLINE)
> +			pm_relax(rproc->dev.parent);
>  		return;
>  	}
>  
> -- 
> 2.7.4
> 
