Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1519ECAAD5
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Sep 2022 07:19:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbiIIHTH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 9 Sep 2022 03:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231315AbiIIHTD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Sep 2022 03:19:03 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B734DF16FA
        for <linux-remoteproc@vger.kernel.org>; Fri,  9 Sep 2022 00:18:56 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id k10so1222592lfm.4
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Sep 2022 00:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=MpCO7BR+w6iE4SzjoN7nooygSqdz+4X5UW/iYZDVQn0=;
        b=SfKcKnUjdWdPIaNa1tCSJfrIT0+RyQlmTWDphvQX9fVRwEGWWUjh2wYNsFIc/ZY1Vt
         NTdx0lRNDGJp7QqFm1ubFdtHgIUlAT8F+7SPS7urC4EQK17SYbACI9kkVyCzEi3lOW+x
         1MHO8vdLnFn6hctJVaJCyxb5lSrb6n9zdTk0WZpsjjcDuYMqqiEG01YVnrBsjcg5rEtc
         VTJUAVsVdQVRjVIf7a68b60q+NNWcWMFMR9an4TQlagzMLkU7Bkf+WXn+5aStOWeZ27u
         76e45N633vmaPkaW4PuStIpnC5y/xBS/LqabwRGszVmOkjp+vrhdAYuGVQn/lNPkJ5KE
         E95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=MpCO7BR+w6iE4SzjoN7nooygSqdz+4X5UW/iYZDVQn0=;
        b=k5cOPjy6N8WnjRE6P6LCmGOt+3oPjtnPErvJKNbT1DrVe8h7I0z0VfvEczeObEPsWm
         YLWbdqe3d8DRdz2HP+sBkvm7YGM5UWVR2w+IAPaeG0xAtZoacpoijuoaEZ26NXEfJw2h
         FUZxs+luMRiVgSqLzdWEBrI9+CTwODQw3jJCax6rbLqmFdVigbnqAlMKUkmKdr8tI6hm
         mJCrcy8VRJn3h63p4dA9Ns3LBq0vYWcF3pcOw9PuPZMEOKVdZO3qr2bsxLHurXCFkwEi
         o4ePygOlElY+iXmqpbUdWZyhjyfe1AdXR+gXKGcv/iUByKppBeU1uLX/nKXmD3xTveM/
         r0Mg==
X-Gm-Message-State: ACgBeo2HDM2A/Jw8YwcLodCUBwVMV5rRLMTnLM28pwZBhi1PLFzgr78h
        8NlBhUcKZyKaMSR9cr7eQbX5rg==
X-Google-Smtp-Source: AA6agR4TAElNS30Ue5OHuULRKoI8NRB/1ncveqn+M+HWXuHUhQFFi7AYEDJKKGgipcKmzFhKxJ6cRw==
X-Received: by 2002:a05:6512:3992:b0:493:e8c5:638c with SMTP id j18-20020a056512399200b00493e8c5638cmr3856800lfu.492.1662707934683;
        Fri, 09 Sep 2022 00:18:54 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o26-20020ac25e3a000000b0048cc076a03dsm149768lfg.237.2022.09.09.00.18.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 00:18:54 -0700 (PDT)
Message-ID: <578eec5b-e1bc-6e5a-9f98-222288dce2e6@linaro.org>
Date:   Fri, 9 Sep 2022 09:18:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,smd-edge: Add APR/FastRPC
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20220908181432.458900-1-stephan.gerhold@kernkonzept.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220908181432.458900-1-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 08/09/2022 20:14, Stephan Gerhold wrote:
> Similar to qcom,glink-edge.yaml the smd-edge can also contain
> apr/fastrpc nodes for functionality exposed by the modem or audio DSP.
> 
> These nodes are already used in existing device trees, adding them
> fixes the following dtbs_check warnings after converting
> qcom,msm8916-mss-pil to DT schema:
> 
> arch/arm64/boot/dts/qcom/apq8016-sbc.dtb: remoteproc@4080000: smd-edge:
> Unevaluated properties are not allowed ('fastrpc' was unexpected)
>   From schema: remoteproc/qcom,msm8916-mss-pil.yaml
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
