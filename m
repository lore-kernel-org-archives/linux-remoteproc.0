Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440D2C54EBC
	for <linux-remoteproc@archiver.kernel.org>; Sat,  7 Jan 2023 12:56:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjAGM4Z (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 7 Jan 2023 07:56:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjAGM4Y (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 7 Jan 2023 07:56:24 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9C5D25DE
        for <linux-remoteproc@vger.kernel.org>; Sat,  7 Jan 2023 04:56:21 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id k26-20020a05600c1c9a00b003d972646a7dso5349847wms.5
        for <linux-remoteproc@vger.kernel.org>; Sat, 07 Jan 2023 04:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GjCCYiC07OFkrVMulgyiYvpr1pkE3CxVBMq+E+wmT/M=;
        b=nb7ZUx0iBW8y13G8m7AvRmO1imV21ih599OSnzSqWan30SA88X0nIclKDnt8++FYAL
         yqn2nCYP0WT7OcyDxQNr77u52Mpm4onWtYSLIb4AR2ySz4ma3sN5V0a4ojJNYdKUxV7Y
         Y66FOK7rKt/1e2GFF6AQAxYDTEcKWjlrVAo+zjv1F+1QoKFxvPGmlrCkALmQ0bNllZZ4
         3D4CvWY/iDRsE7ymOYICoghWu4lJOFlrIPakpIMRsZxtJrexrTm4/SQwuRmHbLxzTIhN
         Ud7pMzD6yQTSqbNxQSR8olvt9t4iaDwwDklOYa2+W3elpKspeJwDp+xDhx3cyMXaI7t5
         bsfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GjCCYiC07OFkrVMulgyiYvpr1pkE3CxVBMq+E+wmT/M=;
        b=PJFTdbiN/bSoCvbyGvrBpVjKvOZ1b8siPQahfHS+QYfeGb9rr6QuXKcjuj5/Yti+Fl
         rC5QBqqREFOTpHj0QLSTWmjo8eplGlRyqqa9JDZNn5bcIlPf+8QCyRtZ8qFpTPbE8RLN
         WS+5/NX2oXkPRWP939EcErWz2SqgKW2/TRDA7OhZSCd48bfSWObm0jWhF5ueZv7Icodw
         R77/AHsIxbd2pKLIbC/7NAjaKyI/nNidFYGJgTZX2cXFc+1TnWKApt5y/oY0uJS5oR6F
         acSX6LPsh74y/Jbj8Y4+0j4ImigiPcFxdVLVM6LIiRfyvXh+1SeatyGQ2bAUTj+L0P8I
         gHTg==
X-Gm-Message-State: AFqh2kpWmsgO2IzTFywNOxWTxzQYoPKgov0tcGcht8fz5lW0GXHaZglJ
        zYXtStG2aUDFVf8J9D2SQksEVw==
X-Google-Smtp-Source: AMrXdXsSZLPMOqJP8xqmdkqAdscv37n7E8dxnIlv4EN6qtsIAdetpeFe6kP67nFrDUQuTsnWOPriAQ==
X-Received: by 2002:a05:600c:4c21:b0:3d3:468e:cedf with SMTP id d33-20020a05600c4c2100b003d3468ecedfmr41382302wmp.16.1673096180428;
        Sat, 07 Jan 2023 04:56:20 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m7-20020a05600c3b0700b003cfd4cf0761sm10950743wms.1.2023.01.07.04.56.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jan 2023 04:56:19 -0800 (PST)
Message-ID: <622afd8b-a469-4c95-d2b8-030e47b0cac2@linaro.org>
Date:   Sat, 7 Jan 2023 13:56:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: qcom,sm8150-pas: Add
 SM6375 MPSS
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230107120838.1903498-1-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230107120838.1903498-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 07/01/2023 13:08, Konrad Dybcio wrote:
> Add SM6375 MPSS to the 8150 binding, as it's so similar it falls into
> the pre-existing ifelse clauses.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

