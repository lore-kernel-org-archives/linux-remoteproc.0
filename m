Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA87EB64DD
	for <linux-remoteproc@archiver.kernel.org>; Mon, 17 Jul 2023 01:16:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbjGQBQD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 16 Jul 2023 21:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230059AbjGQBQD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 16 Jul 2023 21:16:03 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76DEF1B8
        for <linux-remoteproc@vger.kernel.org>; Sun, 16 Jul 2023 18:16:01 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-666eba6f3d6so2522008b3a.3
        for <linux-remoteproc@vger.kernel.org>; Sun, 16 Jul 2023 18:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689556561; x=1692148561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7oYHq1p/oXp0puIhFy9OrnpLdy2w5rBXDTDnolu96uM=;
        b=lpLLCmgz30TGZmwSdUJe4tDFJz5Fcd74dvul6RV1b10GYjbMvH7ymiHWYqHYwl1XDU
         AXvc9ttDTLXuhQDQ6AawB/CVruvT818GWrcl+rSI9CtyU4dUNshxytZ8qMbOnyt5hWo/
         NR2IUmY18rsbM26/5zCo5bACAbL5EdbpNCDmCSeu04IKz2/F38pSlK90Ee6/pp07p8iM
         2b312nFSgBZHusqLwvGAjAXkWhrRd+L6jTlWmn40iZ2VYBTHzaXHGEHE1QU2mvzpYcw2
         PcFrQ4ACun+46PghhI95QzcyTb0HxTlK8n0ChaNriwetm1HejWpDgt5yc+9WRH0WWLCv
         I4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689556561; x=1692148561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oYHq1p/oXp0puIhFy9OrnpLdy2w5rBXDTDnolu96uM=;
        b=Z5t8VpWQ+DZcADhcsABY0UqKiyzNUicqVL1OwMQgqLBntt/haVqBuCdOwlnGv9pOtw
         EVFiWGGoxH/69mUmyoZtsBNo+a8M7UlfI09s2sroXKUbjgxwuInzEXMcC22LkXOcxLOj
         PPxhpaAgdMmWo4mxuRvFVNPUdOLVMpsHnxFZL9pGthRXklhbENtCnHDfvTRkwIHgdhDl
         enkV0X9vHv/9eK3ZJL7IzzGN/RBbsSlRGI5FUaLRvmFOUZJQU8cx+ODSzTbqNoPwLIFU
         KxaTWsrlMLRzWhCzfxp9Jh1dKPAPTUkHATb8tEk7g8/gIH1O+hOL1gb53KN0S0HVFk3q
         j1Cg==
X-Gm-Message-State: ABy/qLYqehzpcFUJCWto3IzlVAwx9ztuRMk6BGdxK0vPZjwcpJoES5Jl
        CIWpDwahSG/x/Q4T2an6zORa0Q==
X-Google-Smtp-Source: APBJJlGT729jgOISi92Vcn9sb6yb8hOJik/a8kpi8tvYnR/R2ZGG42BlJaza9mC2BASDQp7lhQ53bw==
X-Received: by 2002:a05:6a20:2451:b0:126:43f7:e271 with SMTP id t17-20020a056a20245100b0012643f7e271mr12234973pzc.39.1689556560877;
        Sun, 16 Jul 2023 18:16:00 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1bdd:1b8b:7a6:78d0])
        by smtp.gmail.com with ESMTPSA id k10-20020a633d0a000000b0054fe6bae952sm11687701pga.4.2023.07.16.18.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 18:16:00 -0700 (PDT)
Date:   Sun, 16 Jul 2023 19:15:57 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     agross@kernel.org, konrad.dybcio@linaro.org, corbet@lwn.net,
        keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
        catalin.marinas@arm.com, will@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        srinivas.kandagatla@linaro.org,
        Mukesh Ojha <quic_mojha@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: (subset) [PATCH v3 00/18] Add basic Minidump kernel driver
 support
Message-ID: <ZLSWTaMtr9UGmrDy@p14s>
References: <1683133352-10046-1-git-send-email-quic_mojha@quicinc.com>
 <168945921478.1805013.7211960599963339759.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168945921478.1805013.7211960599963339759.b4-ty@kernel.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, Jul 15, 2023 at 03:13:34PM -0700, Bjorn Andersson wrote:
> 
> On Wed, 03 May 2023 22:32:14 +0530, Mukesh Ojha wrote:
> > Minidump is a best effort mechanism to collect useful and predefined data
> > for first level of debugging on end user devices running on Qualcomm SoCs.
> > It is built on the premise that System on Chip (SoC) or subsystem part of
> > SoC crashes, due to a range of hardware and software bugs. Hence, the
> > ability to collect accurate data is only a best-effort. The data collected
> > could be invalid or corrupted, data collection itself could fail, and so on.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [01/18] remoteproc: qcom: Expand MD_* as MINIDUMP_*
>         commit: 318da1371246fdc1806011a27138175cfb078687
>

Krzysztof asked for modifications on this patch.

> Best regards,
> -- 
> Bjorn Andersson <andersson@kernel.org>
