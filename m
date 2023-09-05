Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC5B3C83F2C
	for <linux-remoteproc@archiver.kernel.org>; Tue,  5 Sep 2023 16:37:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233682AbjIEQhI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 5 Sep 2023 12:37:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353796AbjIEQ3B (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 Sep 2023 12:29:01 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48B0E35A9
        for <linux-remoteproc@vger.kernel.org>; Tue,  5 Sep 2023 09:19:24 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31f4950333cso1739438f8f.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 05 Sep 2023 09:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693930659; x=1694535459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZSU9k7U5l+JbONJFiOhrIjvO2o9Sv1BbHrtzBfvKaJQ=;
        b=SH31GcPreoMXAWEEkZtFpxh22qCcmp8BNg4XsbITchR08900NWFbqCDxcfYqi6BtTY
         Mhd+aE8aYZSFRQXmBn1Pj1+ct2o11VHe6jJN5IPPGofUMgbotSD+Ng40YBXSCX3SWrMK
         RwyZHfgKU4d2Iz1OnjoPvuI4tHJPR+qJN5fjxukvb4VMpWNKEQY5KFB2kwC/bnkltpuU
         6cxuAmvqQOQDhUm3oznAd8Qi7PTd9eGeC9sJbNWALvPx20cM4oBRBCYEPnGVJJQxmvZz
         8WsmpDzv96KQzNtib4CxGWsuLmfr5wuSc50KCZGbOkyhQEPSEeOubW3VXPRHpCSydYZc
         +42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693930659; x=1694535459;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSU9k7U5l+JbONJFiOhrIjvO2o9Sv1BbHrtzBfvKaJQ=;
        b=IlwqgSFc2xPM7zAOsNWFJxT86WAKRc07a+fm8WpjYnWuprv0HymdPcLZUBPihXkmQl
         ILpEidQ2VoDSdAG4nia9GIQSlj1uSunXNPPCd657A9x1/4H5uCGBlBDHderckZXaF+zN
         Jj+OYf6bRPzvFsZoNn+onUdT1eUPsSHh19SHAqDwAsDMq9g0Rm71rw3KfuYWBCu1fGRL
         XeYplMOr5NrkdkaeM92k7behauJowZ6BfAgj45g1169UC/K5Rql3KWCnD3/yqJVRY40B
         Ihc1VVjKDpDYX9K8Smlx5RrLXL0sn1zpDVJMCB8unOMNcjr4GxVgMuuPx7lPltmBn/Yh
         wrcw==
X-Gm-Message-State: AOJu0YwdJFeJhXMTAcBOTRAUDOmp4gr0ey2nEcv4XZ/MTUaeWZWmc/P8
        9FNlz2COD0qByOQJB6o1gOHRmg5lKEqA28FJRH0bbA==
X-Google-Smtp-Source: AGHT+IHmLe1g3na3+mMgD44UxKDlaLyzw3S0+7joAYdsj5hlVVZrv+mXBkC3DKuopZa28QZ8CRXfoQ==
X-Received: by 2002:a17:906:32c7:b0:9a5:9038:b1e7 with SMTP id k7-20020a17090632c700b009a59038b1e7mr236508ejk.36.1693930089748;
        Tue, 05 Sep 2023 09:08:09 -0700 (PDT)
Received: from [192.168.37.232] (178235177232.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.232])
        by smtp.gmail.com with ESMTPSA id rl21-20020a170907217500b0099315454e76sm7701782ejb.211.2023.09.05.09.08.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 09:08:09 -0700 (PDT)
Message-ID: <d89f9acb-60ca-4a86-a55f-194e7756107a@linaro.org>
Date:   Tue, 5 Sep 2023 18:08:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwspinlock: qcom: Remove IPQ6018 SOC specific
 compatible
Content-Language: en-US
To:     Vignesh Viswanathan <quic_viswanat@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ohad@wizery.com,
        baolin.wang@linux.alibaba.com, linux-remoteproc@vger.kernel.org
Cc:     quic_kathirav@quicinc.com, quic_anusha@quicinc.com,
        quic_sjaganat@quicinc.com, quic_srichara@quicinc.com,
        quic_varada@quicinc.com, stable@vger.kernel.org
References: <20230905095535.1263113-1-quic_viswanat@quicinc.com>
 <20230905095535.1263113-3-quic_viswanat@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230905095535.1263113-3-quic_viswanat@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 5.09.2023 11:55, Vignesh Viswanathan wrote:
> IPQ6018 has 32 tcsr_mutex hwlock registers with stride 0x1000.
> The compatible string qcom,ipq6018-tcsr-mutex is mapped to
> of_msm8226_tcsr_mutex which has 32 locks configured with stride of 0x80
> and doesn't match the HW present in IPQ6018.
> 
> Remove IPQ6018 specific compatible string so that it fallsback to
> of_tcsr_mutex data which maps to the correct configuration for IPQ6018.
> 
> Changes in v2:
>  - Updated commit message
>  - Added Fixes and stable tags
> 
> Cc: stable@vger.kernel.org
> Fixes: 5d4753f741d8 ("hwspinlock: qcom: add support for MMIO on older SoCs")
> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
