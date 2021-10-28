Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A031C433FE
	for <linux-remoteproc@archiver.kernel.org>; Thu, 28 Oct 2021 22:12:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F529610F8
	for <linux-remoteproc@archiver.kernel.org>; Thu, 28 Oct 2021 22:12:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbhJ1WOc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 28 Oct 2021 18:14:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231344AbhJ1WOb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 28 Oct 2021 18:14:31 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F4DC061570
        for <linux-remoteproc@vger.kernel.org>; Thu, 28 Oct 2021 15:12:04 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id v2-20020a05683018c200b0054e3acddd91so10707948ote.8
        for <linux-remoteproc@vger.kernel.org>; Thu, 28 Oct 2021 15:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=OHxLopxNEBanCZRKOtQcZ5uSqZ+qeUFTuCeN9w/lCos=;
        b=JLjHX6/8BiMeoxPRuWgnunt+TsIKdAQgoR8CnVpm6O2zWjouuINwX2w2NXimyHyMdS
         07wLyCV96TWEWIN2TawN9INC29Y7UxMpTIbRoHf2s63EPEHyJ6VgMtKpHjQKiWlqzpgZ
         k6GQ49H53onSLG6DJ8/uFk/oT11GpD7CZkRFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=OHxLopxNEBanCZRKOtQcZ5uSqZ+qeUFTuCeN9w/lCos=;
        b=wXwFFYpVH/19UVnSl7L4GRPqXy/PHOaztwVjl8MbpNMgSJGoudT26aLV3uS9Eh0R6c
         sqFKJqjZ3zzgLAMKH3REd6zoAMAjF9qJIjZ7iLAnb4U4xCUhe18rhSjhNpGNR2KtwfAo
         axvKmjCJ0YRutLgWLNzzRqGfXy4//7i75RF54S7RK3thq5ah0rVEHrEfYxJTdAy5S51n
         KfxJe0CnrMzUP54xfigJSxG2m0Vpo65bslvxtg5NRmtBtt75+QRmi5CYeeot4Cmr7des
         b+eJSkOQCOLDM7zCNhft2DwtJ7bwHm+9ZqDE3zX4YFWaznZuupp9sVpadSMhqp3WqhRR
         /DWw==
X-Gm-Message-State: AOAM530HZOQGp0NNGBj/afeVYwoiveHGKXUn6vBye1bW8xhlOwnSyv84
        aNhyRT5jR0oqd5dSCyiFA4ST5ILymUTKkxtLvB+IppuclNs=
X-Google-Smtp-Source: ABdhPJymYK7RRjD8jVuxnnAa91/fKSwHBCjvBeAtBGDqTrvqkslprxmA9McUv6qb/4kOS6YRYOGApzE+23oQHYB1iA0=
X-Received: by 2002:a9d:7655:: with SMTP id o21mr5635145otl.126.1635459123556;
 Thu, 28 Oct 2021 15:12:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 Oct 2021 15:12:03 -0700
MIME-Version: 1.0
In-Reply-To: <1635408817-14426-4-git-send-email-pillair@codeaurora.org>
References: <1635408817-14426-1-git-send-email-pillair@codeaurora.org> <1635408817-14426-4-git-send-email-pillair@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 28 Oct 2021 15:12:03 -0700
Message-ID: <CAE-0n53Xj_gCf4SucsQAHNF5fbfGpBzrCXzGyi3Jq6r=E=mL0w@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] remoteproc: qcom: q6v5_wpss: Add support for
 sc7280 WPSS
To:     Rakesh Pillai <pillair@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        ohad@wizery.com, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibis@codeaurora.org, mpubbise@codeaurora.org, kuabhs@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Rakesh Pillai (2021-10-28 01:13:37)
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index 098362e6..7d07e79 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -93,11 +100,143 @@ struct qcom_adsp {
>         void *mem_region;
>         size_t mem_size;
>
> +       struct device *proxy_pds[QCOM_Q6V5_RPROC_PROXY_PD_MAX];
> +       int proxy_pd_count;

size_t?

> +
>         struct qcom_rproc_glink glink_subdev;
>         struct qcom_rproc_ssr ssr_subdev;
>         struct qcom_sysmon *sysmon;
> +
> +       int (*shutdown)(struct qcom_adsp *adsp);
>  };
>
