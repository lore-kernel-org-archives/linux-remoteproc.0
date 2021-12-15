Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 967B0C433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 15 Dec 2021 04:01:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239665AbhLOEB3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Dec 2021 23:01:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239664AbhLOEB2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Dec 2021 23:01:28 -0500
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B5A5C061574
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Dec 2021 20:01:28 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id p2-20020a4adfc2000000b002c2676904fdso5514783ood.13
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Dec 2021 20:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3p21cZX6VTVJfDbT+xtRQs4392W+Wmz3Ks+mLBHxP7M=;
        b=BZq61RILd+nULFwvm2GxQkU9S8LWIa1H1hgca+PB0mf2Kjj0r9PNv1LUepCNPM8jUj
         E2aTNbha2RqV+ObUt5CMqXgcv/g2s4rGeAPRsIptcmJPndDWCBC73VZXl1c2EvfAdcAC
         dn1zJ5P83Gr1PNFHtSjU0MfvNCNUUbTIAXUxsrmzPpzsmVYz+ch6b/xMQyS7xYkLYTQN
         bNNoa9VWPcyTQA2CioVbpG4bIFFWQvGGMRKKXItdwVD0XX9KhOrWsAjLHdMOLJNq0YKP
         MYp6flmUJnmy+gGxCXwB9eowL/p86IzLO+LQBDq7RTXMfOexqccg//UvfDhiV1RwSUk6
         l+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3p21cZX6VTVJfDbT+xtRQs4392W+Wmz3Ks+mLBHxP7M=;
        b=MrHPBGpp7cuZypR+ewjgcfypLAbDz6ghBkHWSpCPrK14fXiVtH2uW9gvLB6E0itaWp
         71MrNXfjD+61P7Bz9aC5lwdFsglimFot5iRUAZgDGtgTKZJSr2HEIhYhaQvKxXUOMEhe
         mxxhEBRfsApOtP31RaNIGaKUkdwgFfr7ART5uyGcGRjKez0W6H3st4eQcwKIxekKezGC
         4KgVsOcxcSLeqX6xmPrnOITxD+gac6aGreh+tEToy45O8j7JDahRbb9vDQxtytFeZeoU
         i5mjDTKNlTK7FmCJ7vraWPnAgw49IP5JkuYPSXaHu871aVwTHd6eaXP7+cGo7SR3SG0U
         Mc0w==
X-Gm-Message-State: AOAM533Z/PsHzoyT3Fq7XcA0M6ZaQdg40a9Y5xcnwryNYVBZhTVDsuEe
        j2KiQXqb0xJsdvV6Wpia6WOsYYyZLCZ2tA==
X-Google-Smtp-Source: ABdhPJylGahtXNpt8ZT81qnmWmURXAJa8/4nDbCQ3NP/HgyFvMAjCgzGr2/TKK0vAKV08Kyhp6HyTw==
X-Received: by 2002:a4a:3110:: with SMTP id k16mr6030549ooa.64.1639540887319;
        Tue, 14 Dec 2021 20:01:27 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p6sm221765oof.0.2021.12.14.20.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 20:01:26 -0800 (PST)
Date:   Tue, 14 Dec 2021 22:01:23 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Deepak Kumar Singh <deesin@codeaurora.org>
Cc:     clew@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH V3 0/2] smem partition remap and bound check changes
Message-ID: <Yblok/6vHI0Zv9he@builder.lan>
References: <1633426371-4827-1-git-send-email-deesin@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1633426371-4827-1-git-send-email-deesin@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue 05 Oct 04:32 CDT 2021, Deepak Kumar Singh wrote:

> Addressed pointer conversion error in previous set and devm_iounmap
> code reordering. Corrected code for calculating global partition size,
> added code inside hardware mutex p_size = avilable + free.
> 

Hi Deepak,

Sorry for taking my time reviewing and testing this series. I think it
looks good and was hoping to just merge it, but it no longer applies.

Could you please help me rebase it ontop of linux-next?

Thanks,
Bjorn

> Deepak Kumar Singh (2):
>   soc: qcom: smem: map only partitions used by local HOST
>   soc: qcom: smem: validate fields of shared structures
> 
>  drivers/soc/qcom/smem.c | 317 +++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 245 insertions(+), 72 deletions(-)
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
