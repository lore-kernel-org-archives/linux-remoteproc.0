Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43E4ECAAA1
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Sep 2022 19:24:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbiIITYE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 9 Sep 2022 15:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbiIITYC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Sep 2022 15:24:02 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C50BB143429
        for <linux-remoteproc@vger.kernel.org>; Fri,  9 Sep 2022 12:24:01 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id b144so2544707pfb.7
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Sep 2022 12:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=1YL3JOnJhxMrmebag05eoFsKq7z4k+Mtpi8WQ+HWkBA=;
        b=PFWHM6FNgcGzrNw+awdzUIJDCQyBKEQEKSlevJNyzCOj8tF/Q+hkpQjcpOciNhux9x
         A0OdJumurQVQi1hUylldetn/Dicm6OGl1cwgvO1EgKFkc6h2YtJrmqHz464PBtcjGDSd
         eXfyW4aqpypuN4Ldeon/6uequtYfihPaPzsVa1X9WircOCblJlS7alBk/5SPufUiqWWG
         EE9cRuQcpwjPvVozrW4ItoU1r+I9X/Y931Cq70WNq2wfK1a3Bx0nUxLlNqF5Q6ev919z
         q6vRtgguuTUyeeCPp2Bc4HBx070AZE40+M4agC1mW+twJFYyWDiT4mgb2YCdTMRCYVh+
         plwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=1YL3JOnJhxMrmebag05eoFsKq7z4k+Mtpi8WQ+HWkBA=;
        b=XCBi8Qem83f6YBXmxuzYlUjWNlfGKLfWMeimb9crGq4Ly2ycaKZDsi1XmY0hsvBJLH
         XStoKJXvwUwy0NsUwMjUSJUhI7gOzMQHp1Lf0/3iWvDjpTqbuRaWQ1fpftgV2lJT/SG4
         5MOcwVlvFpgARPGTxBSULaOmQSQJxFBrWt1p7VUWWqdx9tFm0KlJ68+E3b7gOHow3mJz
         x5EGE5WWtjayxKS2WrmXSLUstQUkbDu7wnhT63jHGd+0O4UVO1tcOtKxyKYVdqkOg23/
         ms6067IAZ0wUb0F3aeS4syYQwdEqlIqqjI5zDy0Z2y4evyxHj7hnovt/5drjbEF9Fa5J
         t/Ww==
X-Gm-Message-State: ACgBeo0Kph41esOdVn/zjhsuCET85n6mH5TWfy596jP1C+5BNyyxiWIP
        WH5kEovju7znGrZg4QSU++yytw==
X-Google-Smtp-Source: AA6agR5GxFgslNSJSVhP7jovTdqKbGSdAnXUIpR+aTUm3kfP3svOkUQ9KU1U48DF+jRxLqyIW2628g==
X-Received: by 2002:a63:5526:0:b0:434:c99c:6fdc with SMTP id j38-20020a635526000000b00434c99c6fdcmr13521836pgb.558.1662751441109;
        Fri, 09 Sep 2022 12:24:01 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id z8-20020a170903018800b001768452d4d7sm887925plg.14.2022.09.09.12.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 12:23:59 -0700 (PDT)
Date:   Fri, 9 Sep 2022 13:23:57 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Maria Yu <quic_aiquny@quicinc.com>
Cc:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_clew@quicinc.com
Subject: Re: [PATCH v1] remoteproc: core: do pm relax when not first crash
Message-ID: <20220909192357.GA319190@p14s>
References: <1662712413-38233-1-git-send-email-quic_aiquny@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1662712413-38233-1-git-send-email-quic_aiquny@quicinc.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Maria,

On Fri, Sep 09, 2022 at 04:33:33PM +0800, Maria Yu wrote:
> Even if it is not first crash, need to relax the pm
> wakelock otherwise the device will stay awake.
> 

The goal is exactly to keep the device awake... 

> Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index e5279ed9a8d7..30078043e939 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1956,6 +1956,7 @@ static void rproc_crash_handler_work(struct work_struct *work)
>  	if (rproc->state == RPROC_CRASHED || rproc->state == RPROC_OFFLINE) {
>  		/* handle only the first crash detected */
>  		mutex_unlock(&rproc->lock);
> +		pm_relax(rproc->dev.parent);

If we are here it means that rproc_crash_handler_work() has already been called
_and_ that a recovery is in process.  When the first crash handler completes
pm_relax() will be called and the device will go to sleep as expected.

Thanks,
Mathieu

>  		return;
>  	}
>  
> -- 
> 2.7.4
> 
