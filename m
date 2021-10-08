Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56796C433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Oct 2021 17:54:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D68B61029
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Oct 2021 17:54:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbhJHR4t (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 8 Oct 2021 13:56:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbhJHR4t (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 Oct 2021 13:56:49 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9D31C061570
        for <linux-remoteproc@vger.kernel.org>; Fri,  8 Oct 2021 10:54:53 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id c4so6664930pls.6
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Oct 2021 10:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=375qw9HEG1zeGWnh05aU0MtkYE91fpb3mTQ4zx4UO9E=;
        b=YH+ZNiYawAnxu0lRHakpiZFKCiAOXHCcdwcFSxDBzu/fPu5Rhu523cQ/QxX5iuOIq6
         vcBWyCBgSuAhPlzcvDDNSQn9ZZ8pIiC6gCOFTvIJkHtP6Rnhd7ZRnmuWaCCOPMyFuS6r
         x6KbX/vvxqHkmnx6JRhU+LwY7/8T57DrFoKBY+AhiMPvfZVHUwORjUQrnECqmeyPgrGy
         sUBu8quofrHLqgVElK9orjQI9AhWhnpofECsZAobyY8FRjwVkOFRTtcdyS/HEcuSAhkU
         SqwQ5wc+NJO9AzZEbkpAEdHrSt03ThRodDaPG8AqSwnXCE4FRK+EBVV5d5EzjivqLtVH
         gkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=375qw9HEG1zeGWnh05aU0MtkYE91fpb3mTQ4zx4UO9E=;
        b=m4ecC1KQSJvlFEcVgrfR9gRTc5n88De7snBwdqI8WcBOVMvZU8b2iZhePdlwG/20Jn
         7FE4WsmOS3rharvDIgfGbhLEw1SRSNQ5B3QgByt1Zdwk0qkOwpUqJ2HC/l7eAifp4wGB
         ASKavGaxVmgmcEo47fOJb+cxygq0KZbp2qFrMC/Zcm4nPUcme07Mk0v2xavqTN4b+pTV
         RXLRvBRukzr6xg7Atvgw0bwjRx0XKF5olosoWtaNhsybzUWYol4QJRPMbY4gQiF1hwP6
         i21Z4sVHE4FaZhoX7dHQMUpFT2VlPxGJKeFZoE6Db/dVUQyZuxLqIDRQLJ0QfW6970h9
         r2gg==
X-Gm-Message-State: AOAM533V9lNUxA9l/ratx+2q1HH44BEmHaT8/eaeJv3xG68UDgD0R8zF
        gS8FOem2JFh56J3NtroXG512xg==
X-Google-Smtp-Source: ABdhPJyGFRepbYfMRdvCwKHA+/CTcojukfMWZRbMkJ7WM5XQglqrst+WuLl14+Mxu3PdByg2aTU1Hw==
X-Received: by 2002:a17:90a:d58b:: with SMTP id v11mr13155906pju.207.1633715693383;
        Fri, 08 Oct 2021 10:54:53 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id g9sm31425pfv.80.2021.10.08.10.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 10:54:51 -0700 (PDT)
Date:   Fri, 8 Oct 2021 11:54:49 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Deepak Kumar Singh <deesin@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, swboyd@chromium.org,
        clew@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH V1 0/3] rpmsg and glink signaling api support
Message-ID: <20211008175449.GA3620020@p14s>
References: <1633015924-881-1-git-send-email-deesin@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1633015924-881-1-git-send-email-deesin@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Deepak,

On Thu, Sep 30, 2021 at 09:02:00PM +0530, Deepak Kumar Singh wrote:
> This patch series provides support for serial like signals (DTR, RTS etc)
> over glink. Clients on local host can use this interface for sending and 
> receiving these signals to and from modem for flow control purpose.
> 
> Deepak Kumar Singh (3):
>   rpmsg: core: Add signal API support
>   rpmsg: glink: Add support to handle signals command
>   rpmsg: char: Add TIOCMGET/TIOCMSET ioctl support
> 
>  drivers/rpmsg/qcom_glink_native.c | 75 +++++++++++++++++++++++++++++++++++++++
>  drivers/rpmsg/rpmsg_char.c        | 43 ++++++++++++++++++++++
>  drivers/rpmsg/rpmsg_core.c        | 21 +++++++++++
>  drivers/rpmsg/rpmsg_internal.h    |  2 ++
>  include/linux/rpmsg.h             | 15 ++++++++
>  5 files changed, 156 insertions(+)
> 

I have started to review this set - comments to follow next weeks.

Thanks,
Mathieu

> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
