Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94ED2C43460
	for <linux-remoteproc@archiver.kernel.org>; Sun,  4 Apr 2021 17:20:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A2566128D
	for <linux-remoteproc@archiver.kernel.org>; Sun,  4 Apr 2021 17:20:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbhDDRUq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 4 Apr 2021 13:20:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbhDDRUo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 4 Apr 2021 13:20:44 -0400
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D38ADC061788
        for <linux-remoteproc@vger.kernel.org>; Sun,  4 Apr 2021 10:20:39 -0700 (PDT)
Received: by mail-oo1-xc2f.google.com with SMTP id q127-20020a4a33850000b02901b646aa81b1so2400464ooq.8
        for <linux-remoteproc@vger.kernel.org>; Sun, 04 Apr 2021 10:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VXtcsMHNhwe+DVWvnO28yCAjs3uDsZfXK7wJO5SsYu0=;
        b=oIEUyW6/LMXcWTeJ0Lp+zssNy06KzKsLrLhboHb3iPJESxZW4LUjnc6QhulLM9vWha
         Izyjdvxl++DW90B7Ji1nU5+wLXBNGGsEkhx6nRJTFmF9V9XdR9D4VR6mpkr6EDqKJg5S
         6yV7nRSxGd9TPOXFJDPnfoMlxJd1uJYqA3RKGdF7psQzc/qmSW2PeR3YHaNqvBshWh6W
         mN5J6XUs8+01JW6u/KzMshNad7k4eVciW6IAxNjXUq0erWgSv2Lq59J3qmemjUXgdYSb
         e1yMy/NO0VGiR2fKvHxWmM+EdUnOyzfd2u+FtiFCGlg38ycL4aFNFLngqPjN+GEHzNUj
         99xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VXtcsMHNhwe+DVWvnO28yCAjs3uDsZfXK7wJO5SsYu0=;
        b=YyKd4ToCYbOVuA4V36naZ3R6wrfwwU7mUZwHSzNzvcXZBpkcTm+xDgxhjcxc4ejrd0
         sNj3POo5GpiRNq5xI1iTKf/ZD46wcrwLAsLRLPHGhYtc0l1VEstDlaDVtoF8bC1i2Mzy
         aoCtdpM9SGqlM0P/lVu1mHnJSWZ594NgYxuuwwdSvzYkCm1ZK2l0gTFT1scc5TGtMYhd
         wDAzSQcGyYqZs+xPo+yNlI0ft18aFzBn16iU0kM3ffGMWLgFi8nQ8azyz9pIIH7cdKdb
         O0MhZvKyFjzSecECHpTL7Z0eAW8NmjZlN3TQKkxr34NYgxtJRkYtl/jzF8jluqdxt2ng
         X47g==
X-Gm-Message-State: AOAM531IrAd681iKGK7+DfLjdR6ypHPbqtSykjWQFJguaSvKhWMiaEeh
        Vu6jOgzzvotPD0+HrWufJid4yg==
X-Google-Smtp-Source: ABdhPJyy9fEwwBWOsR7NFOdeDfPPYeE4bhPGo7Chb9gFcAp+JQlbAEL9aOtlMz3l2T2iZLKJY90xsA==
X-Received: by 2002:a4a:dd14:: with SMTP id m20mr19183701oou.47.1617556839119;
        Sun, 04 Apr 2021 10:20:39 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x2sm3500140ote.47.2021.04.04.10.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 10:20:38 -0700 (PDT)
Date:   Sun, 4 Apr 2021 12:20:37 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Deepak Kumar Singh <deesin@codeaurora.org>
Cc:     clew@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH V1 0/2] soc: qcom: aoss: Expose send for generic usecase
Message-ID: <YGn1ZXihsTyk4sIW@builder.lan>
References: <1617344238-12137-1-git-send-email-deesin@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617344238-12137-1-git-send-email-deesin@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri 02 Apr 01:17 CDT 2021, Deepak Kumar Singh wrote:

> [Change from V0]

It's typical that the first patchset, without a version specified, is
considered "version 1", and as such the second submission would be
"v2".

> Update qmp_get to parse qmp handle with binding qcom,qmp
> 

I won't be able to merge this until we have a user of the API, so would
it be possible to get at least one consumer introduced?

Regards,
Bjorn

> Deepak Kumar Singh (2):
>   soc: qcom: aoss: Expose send for generic usecase
>   soc: qcom: aoss: Add debugfs entry
> 
>  drivers/soc/qcom/qcom_aoss.c | 77 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 76 insertions(+), 1 deletion(-)
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
