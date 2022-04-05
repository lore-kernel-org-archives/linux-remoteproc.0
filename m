Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E72C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue,  5 Apr 2022 22:10:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbiDEWMN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 5 Apr 2022 18:12:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1457005AbiDEQCi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 Apr 2022 12:02:38 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E31E885A
        for <linux-remoteproc@vger.kernel.org>; Tue,  5 Apr 2022 08:26:00 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id bo5so12400451pfb.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 Apr 2022 08:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nlcDYyeczHYZLKKspnEu5slcPvr1pfijlItskO0pzK4=;
        b=WSNHXs0W5TvbEOpBlw4zJj47ZPJYMlXRx38aBCLgqNH7+XypYFRt5yKXe0RB33UwAd
         9GXSl3H2QZdgdjjw1DVmkeiCWy7OFsGJxQ9AIJDl9xWsI3LdmBemt/xfgkP0ylPygVwm
         6dp/v+CS1pNAxhx9s0/pxXqeNriszfYAbVUQ5CwEq3s+78WvdQuOKuIeQZuQwSj5Y39c
         apKLZoESUXrIz+8bjtHnRzregsiWaIWvOv2Pfh4CT1FccGCCM7kG/UwKr+4UY1KooFuR
         Uweewlazq2UY4f4rRh3J8byLQIKBjp3zMT9N77YtIfQnlBye/0nKv4vcd73+az/yI7+X
         xY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nlcDYyeczHYZLKKspnEu5slcPvr1pfijlItskO0pzK4=;
        b=HkDu7acjkPw4xmutmEjaLueIXTHHRWTfIgvTd6xVT9BZ7DzcvtdN1UDim84lG9aO5/
         YyGB6KGMICqDGw22n5rXQjcDpgbXR71TCsPvRixVVg+WzLl/rRwYe75BIJlcxxIamfvW
         4NwcsLK90D0xq1Lm8vPYr5/s2PvxAbN3d5VLrNATNwTRPLbWLkfQR2imM2z2nmqSzsHb
         20unxkPNIULnstlgtMFrjp4HaWi2Z+v1qfcsTK7WiUCnNrHAPziP2HiU1z4x1cRxouN0
         qjmfNEVTU6YQ22VjbM2wAGzRDLnhR0i5iO4gqaOXy6Cchs+wLVA8L4gTUVXc8A6EaBVc
         ofaw==
X-Gm-Message-State: AOAM530nOmjqOMx/IEAmUGr01FKXWR5ROJri6iNCEBoYcI9o7T/jjBl1
        EZf8WDBoGpDyS8E/ocDcnsL7jA==
X-Google-Smtp-Source: ABdhPJz7yF6N9ZNXE6NMcS2CsOkoYIqxjjYdWdWKVmamt8X+07AjeWC8YH9Zx5T3RQEHz4C5J9vmJA==
X-Received: by 2002:a63:a902:0:b0:398:cdd3:f85e with SMTP id u2-20020a63a902000000b00398cdd3f85emr3358626pge.122.1649172360274;
        Tue, 05 Apr 2022 08:26:00 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id i6-20020a633c46000000b003817d623f72sm13886071pgn.24.2022.04.05.08.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 08:25:57 -0700 (PDT)
Date:   Tue, 5 Apr 2022 09:25:55 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2] arm64: defconfig: Config that had RPMSG_CHAR now gets
 RPMSG_CTRL
Message-ID: <20220405152555.GB4147585@p14s>
References: <20220405115524.1020499-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405115524.1020499-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Apr 05, 2022 at 01:55:24PM +0200, Arnaud Pouliquen wrote:
> In the commit 617d32938d1b ("rpmsg: Move the rpmsg control device
> from rpmsg_char to rpmsg_ctrl"), we split the rpmsg_char driver in two.
> By default give everyone who had the old driver enabled the rpmsg_ctrl
> driver too.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

This patch is missing a separation marker, i.e "---", just above.  Without it
the text below is also included in the changelog, and it shouldn't.

Thanks,
Mathieu

> 
> This patch is extracted from the series [1] that has been partially
> integrated in the Linux Kernel 5.18-rc1.
> 
> Update vs previous version:
> - remove "Fixes:" tag in commit, requested by Mathieu Poirier in [2]
> 
> [1]https://lore.kernel.org/lkml/15be2f08-ba03-2b80-6f53-2056359d5c41@gmail.com/T/
> [2]https://lore.kernel.org/linux-arm-kernel/CANLsYky1_b80qPbgOaLGVYD-GEr21V6C653iGEB7VCU=GbGvAQ@mail.gmail.com/T/
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 50aa3d75ab4f..3f8906b8a2ca 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1053,6 +1053,7 @@ CONFIG_QCOM_Q6V5_PAS=m
>  CONFIG_QCOM_SYSMON=m
>  CONFIG_QCOM_WCNSS_PIL=m
>  CONFIG_RPMSG_CHAR=m
> +CONFIG_RPMSG_CTRL=m
>  CONFIG_RPMSG_QCOM_GLINK_RPM=y
>  CONFIG_RPMSG_QCOM_GLINK_SMEM=m
>  CONFIG_RPMSG_QCOM_SMD=y
> -- 
> 2.25.1
> 
