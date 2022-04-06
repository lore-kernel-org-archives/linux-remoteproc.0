Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E58C433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Apr 2022 17:02:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238353AbiDFREY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 6 Apr 2022 13:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238419AbiDFREI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 6 Apr 2022 13:04:08 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 202A61FE91D
        for <linux-remoteproc@vger.kernel.org>; Wed,  6 Apr 2022 07:48:55 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id dr20so4752807ejc.6
        for <linux-remoteproc@vger.kernel.org>; Wed, 06 Apr 2022 07:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hWg5rr2A6nX4SfC/Pk1Y5oFdVdet7nrbWCNkMt2/CtE=;
        b=ZJkoxABazYWZUfKwJQVJsQ/f/sTRqY4q7kgP+BmxaBH680bfL8NW5LK3KR7IA8F2ld
         ulYkm89Hqy1x/SIN8TER5PEnWvE7HzxHAWRdzQKr1lRwAf5tY+bEmmuf7LwyLqeWJh6m
         62DKI1uSzSGkDlIrZE4PkZXYW4TBAB3BtsW94v3Wn7SvAfnmBDCd83hhBZtEVmT2Surg
         YqwCEMqxbPGHGHvU9FW/+KJvX5l9nL+lqWSkjfSp7tym1/sMBChf/UrMvHJQNbxBv/4d
         M5js8KfZsABnGi+5pfUSk9E474jEhDICPLCgPY3/sikIHhZfb5uVBVp1wWOHJ3Quq0zd
         uebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hWg5rr2A6nX4SfC/Pk1Y5oFdVdet7nrbWCNkMt2/CtE=;
        b=IVkBl51NKM6W3OLRfg7Kwy4TBOhtPO42Yc57PLW2YMyYamsuJ23W2k/ho0Qai4jBug
         MlNcO7pq0Q1avzz0yherR1437dHXr4Isy75p4y0vuCcIa+ti+fLR/GE6LrmvxMUdnlYp
         cK31Tvv2EN4+XI6uFF4xOb582VrCq0aJleYC/b5e5joU91PnQFkQXHmBEO43FlBpdSUN
         Ug5mT9C4HnzZe27KAverl8gxGWJWjFSnsrVIEQE69jpp7niiLckHKm9/tEN9muC7HU5d
         BcTJgyMliiJ0VdAyYeyNxkJFFFq8Ddk1v+pza9z1KkWU0pFcgVmWuROslTAtqhAWA2nM
         CI4A==
X-Gm-Message-State: AOAM532pWOFC1sFMLe1apgpI1bOqAzncilV0kY7mhLKB3rcc7uLTjArL
        trs6aI6v950ohtNt70bsFsxriR120UvxjKySw78y6A==
X-Google-Smtp-Source: ABdhPJwNgadfcl8AdRRaDfiaVyBHv4fyImm+NLtsG6q4Q83Avrp9z6SLWFvc1ZCKExavjB0TD/Gp9XyFA3ws9rxpwnQ=
X-Received: by 2002:a17:906:3cf1:b0:6cf:86c6:8a12 with SMTP id
 d17-20020a1709063cf100b006cf86c68a12mr8739042ejh.202.1649256533034; Wed, 06
 Apr 2022 07:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220405161114.1107745-1-arnaud.pouliquen@foss.st.com>
In-Reply-To: <20220405161114.1107745-1-arnaud.pouliquen@foss.st.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 6 Apr 2022 08:48:40 -0600
Message-ID: <CANLsYkzFr5Zfzz5YL+bOLijwsrWdGiM=zcyS4-G2+A+p9JdGEw@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: defconfig: Config that had RPMSG_CHAR now gets RPMSG_CTRL
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 5 Apr 2022 at 10:12, Arnaud Pouliquen
<arnaud.pouliquen@foss.st.com> wrote:
>
> In the commit 617d32938d1b ("rpmsg: Move the rpmsg control device
> from rpmsg_char to rpmsg_ctrl"), we split the rpmsg_char driver in two.
> By default give everyone who had the old driver enabled the rpmsg_ctrl
> driver too.
>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>
> This patch is extracted from the series [1] that has been partially
> integrated in the Linux Kernel 5.18-rc1.
>
> Update vs previous version:
> - Add missing "---" separation marker after "Signed-off-by".
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

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> --
> 2.25.1
>
