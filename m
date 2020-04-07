Return-Path: <SRS0=8QH8=5X=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF994C2D0EC
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Apr 2020 22:29:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C1B4B2063A
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Apr 2020 22:29:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nI+28tmD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgDGW3y (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 7 Apr 2020 18:29:54 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41509 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbgDGW3x (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Apr 2020 18:29:53 -0400
Received: by mail-pg1-f195.google.com with SMTP id m13so2394255pgd.8
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Apr 2020 15:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/5Dlo9c6NkrNlKhGxo4WiMmRax8P6tj8YZhOaAlFBfg=;
        b=nI+28tmDYxfUXfht9m038gFrt7Recb9Ozlvc4UQxEyYgc+WlN6FE3ncBzInK0cMsj7
         y6a/Kuv1KV1lcnKjVKDGdW3KbWuhTVQdBSBvzjXT6vPIeqdwNiFn4YENmwLcFq8Y44xj
         YD262bhCXpaI5QIN2ofdWk/08Vwbn9w1s5BSA3VVn3imBJ14PW4djp9KiRr8M5GyWp8c
         RuQOKb+DCPoPS9TETWvkGfDF+qAWuR6h7hWZ63vvq3WAFCwOdF1jknf+ivEB3L1ghqyF
         RyDLDhe4hYKQ2LEDMwgXJQOdlA9MTwFwa5XRe75Kr1dUkD63YxfE0sIK/7aIRtmwJSkS
         b5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/5Dlo9c6NkrNlKhGxo4WiMmRax8P6tj8YZhOaAlFBfg=;
        b=EN6eYFT8SAvo3EdQC7W93Dh51Nkh+CpY+7aOZx2/fIy4nQufRzuGYl+aByTTQNjbIa
         zAi8Q4uHZ5kczE1inKj2HpDN/2nG/r844pz+JT7AGvDsVYPJELNhAT3oaPbWS8R5wJBJ
         +g/WXyL6f5pbJoJULiUy3h5dBIZopMlyTB1ZUlAJ1iDjPTl/5suZf0Ck3a24X1zkeRxR
         DwiV5GIeDvs8So/ce5Z2MyQON+xNHC10gYvPmqtfGBv/nQDSrQP7205GQ3T5KJZG5r3o
         D4rmnJX9D85TRnvJVe77SFA3esIBiuXAZ30I8/VUOs3X0fyk0OrNAE2Tez5i+0IvwO1i
         Vr+w==
X-Gm-Message-State: AGi0PuaACpDXsoKd/4reSl03bqvYR/gUH9n4aDDC1q8RscQ4TgRnwQlS
        VzfX4H2MDkPLDa36FZ/ThW9xTA==
X-Google-Smtp-Source: APiQypJz2ExCAgyCPPwVRM5J8c8RKa6kKi9IhliwMD/WX4yhCs1nX97X4GqALHk0m2lsH8vN6KHeAg==
X-Received: by 2002:a63:31c2:: with SMTP id x185mr4178337pgx.380.1586298592970;
        Tue, 07 Apr 2020 15:29:52 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 3sm11016636pfd.140.2020.04.07.15.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 15:29:52 -0700 (PDT)
Date:   Tue, 7 Apr 2020 15:29:58 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
Subject: Re: [PATCH 2/2] remoteproc: core: Prevent sleep when rproc crashes
Message-ID: <20200407222958.GL20625@builder.lan>
References: <1582164713-6413-1-git-send-email-sidgup@codeaurora.org>
 <1582164713-6413-3-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582164713-6413-3-git-send-email-sidgup@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200407222958.K9mWf0MRz2RE7Hejpve_H2Y4erCDZcwELbfgdWXgmaI@z>

On Wed 19 Feb 18:11 PST 2020, Siddharth Gupta wrote:

> Remoteproc recovery should be fast and any delay will have an impact on the
> user-experience. Use power management APIs (pm_stay_awake and pm_relax) to
> ensure that the system does not go to sleep.
> 
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 5ab65a4..52e318c 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1712,6 +1712,8 @@ static void rproc_crash_handler_work(struct work_struct *work)
>  
>  	if (!rproc->recovery_disabled)
>  		rproc_trigger_recovery(rproc);
> +
> +	pm_relax(&rproc->dev);
>  }
>  
>  /**
> @@ -2242,6 +2244,8 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
>  		return;
>  	}
>  
> +	pm_stay_awake(&rproc->dev);

Following Mathieu's question I was expecting you to do this on
rproc->dev.parent.

But looking at the implementation of pm_stay_awake(), it ends up being a
nop if dev->power.wakeup isn't specified. This in turn seems to come
from device_wakeup_enable(), which will bail if dev->power.can_wakeup is
not set. But I don't see where this would be set for either the platform
driver or the remoteproc's struct device - and neither one of them have
a "wakeup" attribute in sysfs.

Is there some additional plumbing needed for this?

Regards,
Bjorn

> +
>  	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
>  		rproc->name, rproc_crash_to_string(type));
>  
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
