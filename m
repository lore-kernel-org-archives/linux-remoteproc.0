Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F19B9CCA479
	for <linux-remoteproc@archiver.kernel.org>; Thu,  7 Jul 2022 07:00:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234370AbiGGHAY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 7 Jul 2022 03:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235064AbiGGG7T (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 7 Jul 2022 02:59:19 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F1FB32051
        for <linux-remoteproc@vger.kernel.org>; Wed,  6 Jul 2022 23:58:56 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id z25so11985876lfr.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 06 Jul 2022 23:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=hvUzTt/hWuggOtdt8jKqR4jgNLkATU6+KSsc3GgXz+c=;
        b=VgBQJmVRd2BDZ9PeNdyrJAOvcPlTYn2PPTUzcs9LnhK0yYy8j3p18dyh+DltJm8dJV
         z5+zQAs1wXeP3uhRq9AQC8OzSDDtPUAo6vlVNuX/ASq0wzPGOeYTSRYuUEdE3OEQRwHq
         uvqil25uIWpRmRZGgE2D3hZvmIVKnN6Aitk9Hlz8izL9eN+AyJw0KGlm21FTXk0SptZU
         emsKK8QHsgseMyHsQD6JlLI9hSu3khmWuA9TIVNKrWUQrRSbrvxdVhkREjKXrdJilvtJ
         i5OGUPPoDjPWPb6xwEvEUz53MsRb3W6PMPaOgcy7EZdalm1MWbIB4ypuw9cAhxrIyxyJ
         0bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hvUzTt/hWuggOtdt8jKqR4jgNLkATU6+KSsc3GgXz+c=;
        b=WZheUHDLldwSORpLwEOxMVGB5j/ZwfULzYHTYUuVrTrZgfxWha1oolLX6QFtXghnqo
         +peXZeyf62Q3IJMm4lKUduxKW2kUg20jp1vvp/796RzOt6bVN/+EBi4uNrFD0kNv1G7c
         jdbUdt0OXGszjyugOYttPZNFCV/5OIfLreL2fkhnY5chw+Tlixgo327EnqfRkFN/S6qz
         OKt3Lahmw45DBo9Sr0ZS4bBVbEhyfuqtSK3CayGhJZqTpEwslyxuUVS4W+1rvuiuqbEp
         zINvrfi05HFCRXVBKVyihqJN63NwKFCEiCgSHbWcm5sbjmkr7Tu1EqnexrL8G+3PCog8
         1LMw==
X-Gm-Message-State: AJIora/G56AB3k2smIHC4HCG/7rb+U9VXc7XiARqLYE/ahyaVZWC8ilw
        lxSOtZoMREcFP6MCyN6RlpsYTA==
X-Google-Smtp-Source: AGRyM1tDaP3INpKJsy7RLE6N1Scip5mqFubiHpw1TEPBwZruoEcL5MnxC3Ndykpp+awMhrLd/txSqg==
X-Received: by 2002:a05:6512:ac7:b0:488:de2d:ba23 with SMTP id n7-20020a0565120ac700b00488de2dba23mr223870lfu.653.1657177134963;
        Wed, 06 Jul 2022 23:58:54 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id h4-20020ac250c4000000b00483e5f0192esm1252115lfm.87.2022.07.06.23.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 23:58:54 -0700 (PDT)
Message-ID: <95062dd8-0bc3-c350-7fd1-a02dfc4ef1d7@linaro.org>
Date:   Thu, 7 Jul 2022 08:58:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] ARM: dts: qcom: add missing hwlock for ipq8064 dtsi
Content-Language: en-US
To:     Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20220707013017.26654-1-ansuelsmth@gmail.com>
 <20220707013017.26654-2-ansuelsmth@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220707013017.26654-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 07/07/2022 03:30, Christian Marangi wrote:
> Add missing hwlock for ipq8064 dtsi provided by qcom,sfpb-mutex.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
