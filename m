Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A12C636CA
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Jul 2021 05:40:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBA0B6120D
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Jul 2021 05:40:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233088AbhGUE7d (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 21 Jul 2021 00:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232334AbhGUE7A (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 21 Jul 2021 00:59:00 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04E9FC061766
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Jul 2021 22:39:37 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id y66so1719878oie.7
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Jul 2021 22:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=H7yc0sUWLwZRCONFtYM7YCXnWO2nGYwRYj6B3UNzEJs=;
        b=RXAbGLUH10Ss3LNR9IPtohybfibX2YdEUJCF79rateBwMkR9cUTojA+pJAwibYzjeB
         lfKhZWlsFhF9FwEbBynrEvDIMF51vnkrwlBlfvf4Mtnmm0Ca7CZUyqlb0kecMynfQI8y
         bkmNkKy3B9BE+UO9rxfe7PdpkVTaxXZS7n5gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=H7yc0sUWLwZRCONFtYM7YCXnWO2nGYwRYj6B3UNzEJs=;
        b=fzAdQZhxetKbAxm0pyhfeaNA7R4xi/lpQAaw1+XmfksKIGOX6Ld9aadr0WSqEyc/Y3
         TCnplTIQgLubs9p4WDf26jrdSoR55Qqr2qG0KXrcJZmWVkqqQIwkiWbl1MVpkkTeYhZ4
         J+DProlChJ1jyGlx/pam4ai6EPYEaSz6Fr9tii9kanCvuKUyDxFedisvHp+GlBpZGLU9
         PWyBOTAemp5dqWZ9dPR6kU/zgfq0250E9fSxVbd0uVGIQ6x8+Mdwi1AZ2FshKHjGjraj
         oHMXWPOnOLdaNKvP5y7Oy6LCtVGA6T6sYmlIzlqBxNZwJLYdH1dp21rppA72ch6qpaLS
         mfQA==
X-Gm-Message-State: AOAM531adB4Ix1Sh0LbL/oHWguQvbVLA6so6sh+dxHs8hbaGHpzqPTxu
        iw88yILf1B5ZUde/ioaodtplkVPtjIV9dsPoPgP0GA==
X-Google-Smtp-Source: ABdhPJx2UHkVPEDyWbP72JK30Lgpu0SnXstoiMaKWCVJtiihdP3g5YSnVNcxWeDy7NvbbcBPcOO2xiFh3cuNmWl/k1w=
X-Received: by 2002:a05:6808:114a:: with SMTP id u10mr4795645oiu.19.1626845976389;
 Tue, 20 Jul 2021 22:39:36 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 05:39:36 +0000
MIME-Version: 1.0
In-Reply-To: <1626775980-28637-4-git-send-email-sibis@codeaurora.org>
References: <1626775980-28637-1-git-send-email-sibis@codeaurora.org> <1626775980-28637-4-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 21 Jul 2021 05:39:35 +0000
Message-ID: <CAE-0n51ujsHp+S9v2yTWVdFcWJswFyVyme8Bqp5i4w9Qv6GB6g@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] dt-bindings: remoteproc: qcom: Update Q6V5 Modem
 PIL binding
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mka@chromium.org, robh+dt@kernel.org,
        saiprakash.ranjan@codeaurora.org, will@kernel.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Sibi Sankar (2021-07-20 03:12:53)
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> index 494257010629..bc1394f5d677 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> @@ -198,6 +205,9 @@ For the compatible string below the following supplies are required:
>         Definition: a phandle reference to a syscon representing TCSR followed
>                     by the three offsets within syscon for q6, modem and nc
>                     halt registers.
> +                   a phandle reference to a syscon representing TCSR followed
> +                   by the four offsets within syscon for q6, modem, nc and vq6
> +                   halt registers on SC7280 SoCs.

This seems to be duplicated? Maybe it should be combined with the
previous sentence and sc7280 called out?

>
>  For the compatible strings below the following phandle references are required:
>    "qcom,sc7180-mss-pil"
