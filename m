Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF1A3C433E9
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Mar 2021 16:48:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8B6C64FD6
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Mar 2021 16:48:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232616AbhCJQrx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 10 Mar 2021 11:47:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233102AbhCJQrr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 10 Mar 2021 11:47:47 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 597FFC061762
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Mar 2021 08:47:47 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id y131so16904482oia.8
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Mar 2021 08:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cgRubcZ8gr18dJhcvKQdRz6M5SF9Mz8KCxOcwqh5JmQ=;
        b=cqnjaqFB0OmWcdCXsjguLAYjjyYyP82rMBcE4lKkkX/QiviAZO8XzI4j9luqkOiBIP
         mhoGQ0yM6NIoNOrNsSnBEKfMbH/b0QUQYPtpvJD1IBKbMPqcMZ0Bu+58bi0PQr/b5z6/
         3mOga/X6KVAKsz7Qn55+ALzzXgbds2yV0aMITdx11vPYqpHJXNb56rNxgZ3cH0MlQqKg
         uqKPuPK4nOza1aPJU9HqyXGCTC6kj+6FUxweBnnoVFzn9/A+s3a1TbJJi3FtrL0oClmg
         /CMsvabp8KaRDfnePh6mRkWQkazFC61OjThNEskGPBsL7ndR211vkPcK92FimrfqDDx+
         UmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cgRubcZ8gr18dJhcvKQdRz6M5SF9Mz8KCxOcwqh5JmQ=;
        b=TTgG8kDcbF1tCHO+gHIy8P43BbbSfrPcdCc46/6KLF7ll+mRgQs96O0+B8sqkP2n5B
         CiHWityuIFERiITmdNaNpafwL9r+Tzzad9L0g4gbCtqxJlgqvChRAHrBHoRbwrint7ti
         YvjO06YCSMYj7KrYYq1PmsGMt41U0n26nEeNJ9ZdvFOTjVN3OuRoLOlAJKTuf338v8cs
         zcjxiDO/nQAQ+XIqnXYIUKA3Rar/wM482otc5MAMS3pH7xkQy8OR2Ww9YKs3pGEDxO9J
         Xan+IazYDctiFA/0d1OAgmW3YJi5gFzE/VhQSecCp9lcgVeIhi6j85l0s72PNgdqATz7
         IeXw==
X-Gm-Message-State: AOAM532pOF0PWfoL59gtTLgiXS0QGVmoapCCKWEMtjcAJm6tXfQxfR3v
        jf2ySj60dN9EgKye8R28H6vgJA==
X-Google-Smtp-Source: ABdhPJztaVdC+W5hHxektR9FJRuokTIP9WnnTNOujKJ5N09MgSgrQaMoN1U+uNB3eubmcsr7K0n9UA==
X-Received: by 2002:aca:bf8a:: with SMTP id p132mr2935725oif.9.1615394866584;
        Wed, 10 Mar 2021 08:47:46 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b21sm3588101oot.34.2021.03.10.08.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 08:47:46 -0800 (PST)
Date:   Wed, 10 Mar 2021 10:47:44 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     agross@kernel.org, ohad@wizery.com, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, p.zabel@pengutronix.de, sibis@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom: Add SC7280 WPSS
 support
Message-ID: <YEj4MKMervDzUO6k@builder.lan>
References: <1615361290-19238-1-git-send-email-pillair@codeaurora.org>
 <1615361290-19238-2-git-send-email-pillair@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1615361290-19238-2-git-send-email-pillair@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 10 Mar 01:28 CST 2021, Rakesh Pillai wrote:

> Add WPSS PIL loading support for SC7280 SoCs.
> 

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

But can you please follow up with a patch that converts this to yaml?

Regards,
Bjorn

> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
>  .../bindings/remoteproc/qcom,hexagon-v56.txt       | 35 ++++++++++++----------
>  1 file changed, 20 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
> index 1337a3d..edad5e8 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
> @@ -9,6 +9,7 @@ on the Qualcomm Technology Inc. Hexagon v56 core.
>  	Definition: must be one of:
>  		    "qcom,qcs404-cdsp-pil",
>  		    "qcom,sdm845-adsp-pil"
> +		    "qcom,sc7280-wpss-pil"
>  
>  - reg:
>  	Usage: required
> @@ -24,7 +25,13 @@ on the Qualcomm Technology Inc. Hexagon v56 core.
>  - interrupt-names:
>  	Usage: required
>  	Value type: <stringlist>
> -	Definition: must be "wdog", "fatal", "ready", "handover", "stop-ack"
> +	Definition: The interrupts needed depends on the compatible string
> +	qcom,sdm845-adsp-pil:
> +	qcom,qcs404-cdsp-pil:
> +		must be "wdog", "fatal", "ready", "handover", "stop-ack"
> +	qcom,sc7280-wpss-pil:
> +		must be "wdog", "fatal", "ready", "handover", "stop-ack"
> +		"shutdown-ack"
>  
>  - clocks:
>  	Usage: required
> @@ -35,19 +42,17 @@ on the Qualcomm Technology Inc. Hexagon v56 core.
>  - clock-names:
>  	Usage: required for SDM845 ADSP
>  	Value type: <stringlist>
> -	Definition: List of clock input name strings sorted in the same
> -		    order as the clocks property. Definition must have
> -		    "xo", "sway_cbcr", "lpass_ahbs_aon_cbcr",
> -		    "lpass_ahbm_aon_cbcr", "qdsp6ss_xo", "qdsp6ss_sleep"
> -		    and "qdsp6ss_core".
> -
> -- clock-names:
> -	Usage: required for QCS404 CDSP
> -	Value type: <stringlist>
> -	Definition: List of clock input name strings sorted in the same
> -		    order as the clocks property. Definition must have
> -		    "xo", "sway", "tbu", "bimc", "ahb_aon", "q6ss_slave",
> -		    "q6ss_master", "q6_axim".
> +	Definition: The clocks needed depends on the compatible string
> +	qcom,sdm845-adsp-pil:
> +		must be "xo", "sway_cbcr", "lpass_ahbs_aon_cbcr",
> +		"lpass_ahbm_aon_cbcr", "qdsp6ss_xo", "qdsp6ss_sleep",
> +		"qdsp6ss_core"
> +	qcom,qcs404-cdsp-pil:
> +		must be "xo", "sway", "tbu", "bimc", "ahb_aon", "q6ss_slave",
> +		"q6ss_master", "q6_axim"
> +	qcom,sc7280-wpss-pil:
> +		must be "gcc_wpss_ahb_bdg_mst_clk", "gcc_wpss_ahb_clk",
> +		"gcc_wpss_rscp_clk"
>  
>  - power-domains:
>  	Usage: required
> @@ -65,7 +70,7 @@ on the Qualcomm Technology Inc. Hexagon v56 core.
>          Definition: must be "pdc_sync" and "cc_lpass"
>  
>  - reset-names:
> -        Usage: required for QCS404 CDSP
> +        Usage: required for QCS404 CDSP, SC7280 WPSS
>          Value type: <stringlist>
>          Definition: must be "restart"
>  
> -- 
> 2.7.4
> 
