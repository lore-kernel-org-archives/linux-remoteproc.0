Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B5AAC28D13
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Aug 2022 03:08:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239926AbiHWDIo (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Aug 2022 23:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239933AbiHWDIG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Aug 2022 23:08:06 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 375E3F6C
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Aug 2022 20:05:50 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id bb16so14571056oib.11
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Aug 2022 20:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc;
        bh=VmBfhr0vpPVDGehePX0qDoV9RWqgGhohFmKMY5nUDoM=;
        b=CZx1U4Ln0EyZYh59YOjcfrH+vkIPu5/IUhsoq1qWJqeQ8h/fUonDwwjeCuYodkBllx
         AYCOflksLOktkUTjuBHTnPM5rxiyxFXB1UxpbQTuKWyQpzktO7aP/4FYUHLllD+uEDbM
         JfDn9njIiH/P+1VVG8k10Q2XpLJNGFGZgMSCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc;
        bh=VmBfhr0vpPVDGehePX0qDoV9RWqgGhohFmKMY5nUDoM=;
        b=mtFYUaYImm+gN1muUFeplfg+rLbpE4nw5FCEkSZ/HvOMK85PGgTL7JmmdEkAK+6eY/
         apSH6/FT/Wu1ChfhNuz34HnftHFWxK45AXThoj0PSBKTPC6noSxTSfYM81vHte1lxxrF
         bGR1Mz9Tc20hCGYmnH7zQxRei0iIeJjNpBBlG5oA9Zhpv16zNQR5PUKqpSz5qp68W2Eu
         g2HlUwmBKGxA7dNeJ6gESRnbTOYcQV8IBIjt4TGPsd8GmUhg+saNghOgTA8RUL1sV3ZN
         ZMQzm8Bg+YorIM3qiOWZpRQaZdK082qQBjIa5YBVbtk50XSADisjMFRQhCEhHuFuo6mR
         mo+w==
X-Gm-Message-State: ACgBeo0FhspKazJwePbPGc0UhCuWHhrecqTqCOA//QksJPTN1kEQ6jKM
        ROn86+6Tj6g/bT1X4qCdzp7tNtUSKvVLkNzLzFZAmg==
X-Google-Smtp-Source: AA6agR7x4KeAQutL5kyySAJzlnPzefZEz+ruRD7XlKs+TiWS1yrY8IIEz6wt1zAT4lA87TOfAYTxdqvLMxsfCLgAzm8=
X-Received: by 2002:a05:6808:bca:b0:344:ef42:930f with SMTP id
 o10-20020a0568080bca00b00344ef42930fmr516939oik.0.1661223949623; Mon, 22 Aug
 2022 20:05:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Aug 2022 22:05:49 -0500
MIME-Version: 1.0
In-Reply-To: <1661156523-22611-4-git-send-email-quic_srivasam@quicinc.com>
References: <1661156523-22611-1-git-send-email-quic_srivasam@quicinc.com> <1661156523-22611-4-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 22 Aug 2022 22:05:49 -0500
Message-ID: <CAE-0n52iLf0R0ovrpzMs0jp_Ty-RsONy0gcUvDsBvCz38R1fWw@mail.gmail.com>
Subject: Re: [RESEND v5 3/7] remoteproc: qcom: Add compatible name for SC7280 ADSP
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, bgoswami@quicinc.com,
        bjorn.andersson@linaro.org, broonie@kernel.org,
        devicetree@vger.kernel.org, judyhsiao@chromium.org,
        lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        perex@perex.cz, quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
        robh+dt@kernel.org, srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-08-22 01:21:59)
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index d0b767f..6d409ca 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -701,6 +701,22 @@ static const struct adsp_pil_data adsp_resource_init = {
>         },
>  };
>
> +static const struct adsp_pil_data adsp_sc7280_resource_init = {
> +       .crash_reason_smem = 423,
> +       .firmware_name = "adsp.mbn",
> +       .load_state = "adsp",
> +       .ssr_name = "lpass",
> +       .sysmon_name = "adsp",
> +       .ssctl_id = 0x14,
> +       .is_wpss = false,

This can be left out, it's the default.

> +       .adsp_sandbox_needed = true,
> +       .auto_boot = true,
> +       .clk_ids = (const char*[]) {
> +               "gcc_cfg_noc_lpass", NULL
> +       },
> +       .num_clks = 1,
