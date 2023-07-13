Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39DAEB64DD
	for <linux-remoteproc@archiver.kernel.org>; Thu, 13 Jul 2023 06:38:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234062AbjGMGii (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 13 Jul 2023 02:38:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233658AbjGMGih (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 13 Jul 2023 02:38:37 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D449E1BFA
        for <linux-remoteproc@vger.kernel.org>; Wed, 12 Jul 2023 23:38:34 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9939fbb7191so72887766b.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 12 Jul 2023 23:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689230313; x=1691822313;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xhvrUb30J2edJpoQqu3Ve5o4Vqiq35Gsxr6puMxZdLE=;
        b=WO/84obLzqfprnuZf5BucZpZNEvlWLPVvU/nZvAWiDIXft56fOIwAq2w4H5i8ujdtx
         bb5Jd7JkkdCPT0kV+9bix3JFASCntRjLV2VWxvrmbqAzEBblSf1Gpb+x9Wq517i9WTka
         F6ewDCsdMK11IAKlfWc6G2Zz6bh0AwyjL6jXfpj9GG1q2325yg1S6S6m5XUo9yrcX6zu
         8qIiXvT+TmAlt1+VY47c06hYxRhrOLR8dPxAgqx1nM1CsYrjr+gGFAPJSOl9MwLK3xoC
         Jz4H7A1tPFT1u+khPap5pyriIbMphKMtG7ALCFtT7iP8DVVhHiM9sT8yIbrumsHF7DAy
         rOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689230313; x=1691822313;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xhvrUb30J2edJpoQqu3Ve5o4Vqiq35Gsxr6puMxZdLE=;
        b=ZKJi8KC8K+OasPPBrXPB8ELBIWAGYqvqaYWFFbl9xjNjUIcJck14BDzwn+cZQTufea
         vW0LfJ8NU+WYTaBkvkfYe4gxPelP2dB24S4vFIOpkxMTA5q93A67SXIG08mRftNftzmB
         77FRxHmBW2BE5jwQ4UfDlwOtNh0RXZg8q2ms3ioKCthc7w6eiRnZZIika98XhhzJLjPF
         6DbwFWMjvpO56N2JQnc9s9Ykl/wnyJ2ztq4B6GjJ+tarYvp36j8xJuRGJpwurDNm1b2U
         kWSb+uzKOtCFAdhC9HwZdDReIPm/bLCf6npmRzN4QII5iY+ZEM2y6LIkeFfVA/PXQHpa
         bF8A==
X-Gm-Message-State: ABy/qLaKMHOVUmCi/Pgy4oH/WevWpxCZEDLJvK12JxY5d3IHBSYQckiY
        afW5HiQzS8SFGUscQStTFf6EEA==
X-Google-Smtp-Source: APBJJlHK8KOdzhadChYh2RosBkx2P1ku9Uxjv4wZmPQuC8miB0eN51h561Npnb9y3ofJwDZE0xoN/Q==
X-Received: by 2002:a17:907:16a5:b0:98e:48cc:4cbf with SMTP id hc37-20020a17090716a500b0098e48cc4cbfmr5764765ejc.26.1689230313392;
        Wed, 12 Jul 2023 23:38:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id t20-20020a05640203d400b0051de38eb925sm3795981edw.93.2023.07.12.23.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 23:38:32 -0700 (PDT)
Message-ID: <29358bac-6c1b-1e6e-9f21-20ec62518cec@linaro.org>
Date:   Thu, 13 Jul 2023 08:38:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom: adsp: document
 firmware-name property
Content-Language: en-US
To:     David Heidelberg <david@ixit.cz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230712235409.97213-1-david@ixit.cz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230712235409.97213-1-david@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 13/07/2023 01:54, David Heidelberg wrote:
> Signed-off-by: David Heidelberg <david@ixit.cz>


You miss commit msg. Anyway, this was sent:

https://lore.kernel.org/all/20230309083548.47205-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

