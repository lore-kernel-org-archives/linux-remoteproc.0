Return-Path: <SRS0=Lo8U=AD=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE999C433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Jun 2020 22:26:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDD3C2075A
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Jun 2020 22:26:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p7Qxqg5d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730943AbgFVW0U (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Jun 2020 18:26:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730777AbgFVW0T (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Jun 2020 18:26:19 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 358CAC061795
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2020 15:26:16 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id n5so14607545otj.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2020 15:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Whj9pPjVdxqNoQPO3/j1uYot6iyKYAdZJXRmnTL5xO8=;
        b=p7Qxqg5dSBmq2hSsNLlQ5+RQja1zy1WyYt7A69O13Qz64ge9PlX6tdodta5m1mOyoJ
         fiN5mS59lG0/DHWLxyJ9fd6KgT+4T2u8M+Zym1mEOB2eT60Whl+ktEDA7Siy1kfUs+pT
         RTJKTDghbBAAP0xM0ZAogIU5UbG7kBnbN5TOrz+IU39QodAFe3Z+JdLSeGMjAEOq3OX6
         tpHADkHQ6kFosnXVXny6G1T41zqnx80pSGoiTAgGTdFI/7qsaJcMRNt3NjrppdPtcJvg
         /5k3CS58NDCDoEPLweGzunQJ2GpmotulLtyhI5asWN0alRZp6X5DSbnYKp98UKA7wwgw
         4ftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Whj9pPjVdxqNoQPO3/j1uYot6iyKYAdZJXRmnTL5xO8=;
        b=a3jxu6OP4rDj8mQ24nb7qEv0iKwcQZh7e/NbTMKeiNOOUuPSdOiKF3Pj+iL5TbxN5y
         OvgoM0pAIFOC4AX3clp5/6oLYZm3FdWwpwDudB4k+PdI7RB8DBjH8bFkCU+AIZE5xuFD
         2JMLfxkQH9eaV+tlO8PhplHhO5KpNVqkgw71JuoaEwJrdK+YLgYO94sXBUvcsACKribb
         zEidg6IT7pwF5+o7fHoGIFuJpwVC9He3vfhFKPL1HHyNQF4E0IvTJc/+htprdjknlvrU
         7tQRH2FCatEIcu2lWgrveMwsfkv87qYLbYAHYekxmCgU090lnf172LXXpkuvj58SaOif
         rBAg==
X-Gm-Message-State: AOAM5336X8rvRrntixRnmCapB8wv3ergr5H5+UaRpSGF0HbX+o6kEz3F
        Tx+0XYFtb7irfw3Hwkt+EQhqhQ==
X-Google-Smtp-Source: ABdhPJwPN1WmV+udGRk+h9E1afL6SIOkLi8rjKfsh1tBIrwek2pmebCqB86B9yLovtcWMsgdL/vfnQ==
X-Received: by 2002:a05:6830:1dbb:: with SMTP id z27mr15880575oti.340.1592864775362;
        Mon, 22 Jun 2020 15:26:15 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p1sm3753330oot.34.2020.06.22.15.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 15:26:14 -0700 (PDT)
Date:   Mon, 22 Jun 2020 15:23:30 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org, mathieu.poirier@linaro.org
Subject: Re: [v4 PATCH 0/3] Extend coredump functionality
Message-ID: <20200622222330.GN149351@builder.lan>
References: <1590611177-15826-1-git-send-email-rishabhb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590611177-15826-1-git-send-email-rishabhb@codeaurora.org>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 27 May 13:26 PDT 2020, Rishabh Bhatnagar wrote:

> This patch series moves the coredump functionality to a separate
> file and adds "inline" coredump feature. Inline coredump directly
> copies segments from device memory during coredump to userspace.
> This avoids extra memory usage at the cost of speed. Recovery is
> stalled until all data is read by userspace.
> 
> Changelog:
> 

Hi Rishabh,

This looks good to me, but it doesn't apply cleanly on linux-next. Can
you please take a look?

Regards,
Bjorn

> v4 -> v3:
> - Write a helper function to copy segment memory for every dump format
> - Change segment dump fn to add offset and size adn covert mss driver
> 
> v3 -> v2:
> - Move entire coredump functionality to remoteproc_coredump.c
> - Modify rproc_coredump to perform dump according to conf. set by userspace
> - Move the userspace configuration to debugfs from sysfs.
> - Keep the default coredump implementation as is
> 
> v2 -> v1:
> - Introduce new file for coredump.
> - Add userspace sysfs configuration for dump type.
> 
> Rishabh Bhatnagar (3):
>   remoteproc: Move coredump functionality to a new file
>   remoteproc: Add inline coredump functionality
>   remoteproc: Add coredump debugfs entry
> 
>  drivers/remoteproc/Makefile              |   1 +
>  drivers/remoteproc/qcom_q6v5_mss.c       |   9 +-
>  drivers/remoteproc/remoteproc_core.c     | 191 ------------------
>  drivers/remoteproc/remoteproc_coredump.c | 328 +++++++++++++++++++++++++++++++
>  drivers/remoteproc/remoteproc_debugfs.c  |  86 ++++++++
>  drivers/remoteproc/remoteproc_internal.h |   4 +
>  include/linux/remoteproc.h               |  21 +-
>  7 files changed, 443 insertions(+), 197 deletions(-)
>  create mode 100644 drivers/remoteproc/remoteproc_coredump.c
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
