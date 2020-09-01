Return-Path: <SRS0=iY7d=CK=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6D7C433E6
	for <linux-remoteproc@archiver.kernel.org>; Tue,  1 Sep 2020 22:05:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 159D8206C0
	for <linux-remoteproc@archiver.kernel.org>; Tue,  1 Sep 2020 22:05:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B36Jbkkq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729559AbgIAWFs (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 1 Sep 2020 18:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727918AbgIAWFq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 1 Sep 2020 18:05:46 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0306FC061244
        for <linux-remoteproc@vger.kernel.org>; Tue,  1 Sep 2020 15:05:45 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id np15so1208734pjb.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 01 Sep 2020 15:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QmRQ0CWOdYSr3JJU7Ljb0Td0mDAoy48JJtlYjX1PJ+k=;
        b=B36JbkkquXk9bR5sDsF4SEnQZ8roTgYDa5LDi5ceGOo0WD5C980r6+n5x4/kY+Ibfv
         JeNKfH1EtTnY33O8RWjF3MjuBQMncOwDRf3sVrUhzoC8uDZMoxZdDEKE+b8WZM8Vo/x4
         27DW4qaD0UDajwWJxhFrP6i6aVEpv1gwlu52TfynE6ZcYag8FDhkErZC05NN5ovU/iOE
         /qupB7MXI4H/AU5Fi1N0JcVIbgOEWX32ZO+b/p7Cm+ayKe0HIPFpDxpSjPGxO/QOEiGI
         yrdsmA6w1fbWxZdU2TGaV2CeUHJCwoouqkVe04C7i9RRg1e94zo4NI3dUBxgXiXcf4Kl
         IYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QmRQ0CWOdYSr3JJU7Ljb0Td0mDAoy48JJtlYjX1PJ+k=;
        b=AkcUia6ynKSg7ILEYvftJbXm7he1HwQvnJ+usyAIXE4R4M/mWmOHgu4DXrDHTn+x8W
         KdSm9HhDgtdf1crNQXb19hjCV0YlamnbTyvFsfiXclKeqqr4uss8PQ1GE3SsYDPXzWlG
         +VZPxQEFXwYQjrDfTVNxj00G8UkHc5C37RCbVJpBp2kjaNIAC6QFGMeYpZtL+MrQuc8h
         a948uxJlP64P7F39daB9QOqonMy2nzSj+2ISb35fzA3eQ4X+cIqvl6SUC8HSSAfbony8
         3jYnbb26YVHvznxckAPnGCDZyKMFH83aHjj5ewvRf/I1XmBzRG2QSI3hCRyVI9EIXRSA
         mlwA==
X-Gm-Message-State: AOAM532dXvRmk6j9ONymrmxgH210jn72ur54yR3U5hudTuWxCzj74OXR
        iV2Qevv7+LjVBK5hkF4APcMP1A==
X-Google-Smtp-Source: ABdhPJxlK/Sr9VwSXukWAYdm9Yr62uWLt/UKlh8G/q3tCSePNqSE3R7j8Qd9o5cp/VAqA7TVIKrAEA==
X-Received: by 2002:a17:90a:d18f:: with SMTP id fu15mr2566918pjb.133.1598997945220;
        Tue, 01 Sep 2020 15:05:45 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o63sm2933682pfb.190.2020.09.01.15.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 15:05:44 -0700 (PDT)
Date:   Tue, 1 Sep 2020 16:05:42 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, sidgup@codeaurora.org
Subject: Re: [PATCH v2 0/3] Expose recovery/coredump configuration from sysfs
Message-ID: <20200901220542.GA121362@xps15>
References: <1598557731-1566-1-git-send-email-rishabhb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1598557731-1566-1-git-send-email-rishabhb@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Rishabh,

On Thu, Aug 27, 2020 at 12:48:48PM -0700, Rishabh Bhatnagar wrote:
> From Android R onwards Google has restricted access to debugfs in user
> and user-debug builds. This restricts access to most of the features
> exposed through debugfs. This patch series adds a configurable option
> to move the recovery/coredump interfaces to sysfs. If the feature
> flag is selected it would move these interfaces to sysfs and remove
> the equivalent debugfs interface.

What I meant wast to move the coredump entry from debugfs to sysfs and from
there make it available to user space using a kernel config.  But thinking
further on this it may be better to simply provide an API to set the coredump
mode from the platform driver, the same way rproc_coredump_set_elf_info() works.
That will prevent breaking a fair amount of user space code...

Let me know if that can work for you.

Thanks,
Mathieu

> 'Coredump' and 'Recovery' are critical
> interfaces that are required for remoteproc to work on Qualcomm Chipsets.
> Coredump configuration needs to be set to "inline" in debug/test build
> and "disabled" in production builds. Whereas recovery needs to be
> "disabled" for debugging purposes and "enabled" on production builds.
> 
> Changelog:
> 
> v1 -> v2:
> - Correct the contact name in the sysfs documentation.
> - Remove the redundant write documentation for coredump/recovery sysfs
> - Add a feature flag to make this interface switch configurable.
> 
> Rishabh Bhatnagar (3):
>   remoteproc: Expose remoteproc configuration through sysfs
>   remoteproc: Add coredump configuration to sysfs
>   remoteproc: Add recovery configuration to sysfs
> 
>  Documentation/ABI/testing/sysfs-class-remoteproc |  44 ++++++++
>  drivers/remoteproc/Kconfig                       |  12 +++
>  drivers/remoteproc/remoteproc_debugfs.c          |  10 +-
>  drivers/remoteproc/remoteproc_sysfs.c            | 126 +++++++++++++++++++++++
>  4 files changed, 190 insertions(+), 2 deletions(-)
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
