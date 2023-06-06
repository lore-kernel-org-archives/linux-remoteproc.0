Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8709C7EE2F
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Jun 2023 06:27:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235425AbjFFG1D (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Jun 2023 02:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235177AbjFFG0o (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Jun 2023 02:26:44 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96EAF1BD6
        for <linux-remoteproc@vger.kernel.org>; Mon,  5 Jun 2023 23:25:34 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-973f78329e3so896932666b.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jun 2023 23:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686032733; x=1688624733;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AmuejoJeHN8EldA6gQK9in2sBXKsFxRHE2nxemHliVA=;
        b=H2t73c/MUrxYkiy6d/FXdt7ZLMZLAIM5COmSQl9zxydRjd6AepsMfAOtmnHik0Guc+
         rc9lNjHORqxoWdA7OblI2Oh8ysIHBtk/ekXpSqOxhz9AwPM37E/EpwXMc9Rg2PAQ0fWP
         dt8sAQHbxrtWkt5rhaxxi3jikHAuLmpn1aEneZArnesqQ0udnbFF6+87Po4UVUFNEFo8
         JMb8FWrTp3MozQX+jopYovc9bd5nsUv0X2c8cZVL4drEWsc6hMgTRZrMZRQ6xAsdo+eq
         K9rJ66YB4yXOi2TFheMJ2yMNzloMpPx4EduS9AltjqxXW9OuLTeY5I/LqvOyTVl/v6Lh
         TxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686032733; x=1688624733;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AmuejoJeHN8EldA6gQK9in2sBXKsFxRHE2nxemHliVA=;
        b=FT9I3x8Y5bvy+gTKIH5GweWKQtznNQcgWbKyXnU/Z4jj5UfVgk3A21StzUMs7ToHCc
         yjd8YQPNg5WYX53P2nYo5K8qD/priKodIAGJi4JCrM8lEuraSxOu/Ycfod8R2CuZ4kgu
         81U4lx9yM3vxb4+rSsWRfexShmqPbinQ+al/TK/emxiJ20mozBw+IXRxNDjIE2gMiR8Q
         Is2H6om4RQyfZ+HFluyLvI1K2+Td+E3Puc5EaEEWdjr2z1skuZO53bbXSq/uE8JcupG1
         +uwR2aQ/KMBZo4VFJ2cPjruZKBDCgXFisRCiFah+OlT/CL7H+f9o8nQ086WmKNrkFqlC
         DijQ==
X-Gm-Message-State: AC+VfDzd5cg3rs3hXQTJpAqSjgyYYlSKKHZ1pBjBj54Vl1MWsjzyUHhc
        rG+Kp76JSZJ3zlNqt2WDRF8Tkg==
X-Google-Smtp-Source: ACHHUZ5L6idkzO3bEQLABFvgweINi4eaoibE5pbJn7hFTY2jsvzdv0qJjx8fzYBbg9thOKHgpDVh3A==
X-Received: by 2002:a17:907:80c:b0:974:218d:c048 with SMTP id wv12-20020a170907080c00b00974218dc048mr1441420ejb.26.1686032732482;
        Mon, 05 Jun 2023 23:25:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id d10-20020a170906640a00b00965e1be3002sm5157877ejm.166.2023.06.05.23.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 23:25:32 -0700 (PDT)
Message-ID: <d2313558-c25d-ed58-c508-dac574183d08@linaro.org>
Date:   Tue, 6 Jun 2023 08:25:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 01/14] dt-bindings soc: qcom: smd-rpm: Fix sort order
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20230531-rpm-rproc-v1-0-e0a3b6de1f14@gerhold.net>
 <20230531-rpm-rproc-v1-1-e0a3b6de1f14@gerhold.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230531-rpm-rproc-v1-1-e0a3b6de1f14@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 05/06/2023 09:08, Stephan Gerhold wrote:
> Some of the enum entries are not properly ordered, fix that.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

