Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1BAEEB64D9
	for <linux-remoteproc@archiver.kernel.org>; Sat, 17 Jun 2023 08:05:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346285AbjFQIFd (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 17 Jun 2023 04:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346281AbjFQIF1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 17 Jun 2023 04:05:27 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB33297F
        for <linux-remoteproc@vger.kernel.org>; Sat, 17 Jun 2023 01:05:18 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5186a157b85so2212717a12.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 17 Jun 2023 01:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686989117; x=1689581117;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xxp1rn5hr+h9i5CaSCoSMQfGudBpVIHRUp4VzBJuSvc=;
        b=JnNWThApOs1c+QHy+rxQAxoWpul4bmzp8MCbxpakMq8fTUDzGCHNa7a3z5G/duP6kB
         jTv86bXYZeOJU2Ucy/3TdGyEII19qAfCv6PyL2z2TyuE0VIHNlcRt8FWZ+UeXDfRiyOL
         kwilDJsdyQSGwvxi6S2IHFzYI30orRM+LdOC0l5ElCP23sbjzbAIR3mpw5o45RF8V3MZ
         nGFqK0c+ouKQxulGayoQ3QJnlF/yY9AKfM6iYqbCgM6zRI/z2rfb14a+HfTx4KP3IfcY
         lk8SxnFRZaypg8fCmdnFUqkMXAyDdvbZUKdg5+L0vEFTWArjbcltDWfP0Fuxe/EYw7FK
         Heyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686989117; x=1689581117;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xxp1rn5hr+h9i5CaSCoSMQfGudBpVIHRUp4VzBJuSvc=;
        b=O1qwNt1+BGjI1ue8MhtBuIvesd0YMOimLqQGMf/qdim7tAkswaj5KQxk+t9Cd1ELA2
         qUPBKbmEAZ2Hks2NAtRnvylOD7MTKe2rIgsC0xNpFpeCzxsZO+E6HJ085jW755UMqJPH
         I1899N+Q2QZl3CG/KoMJBoCAqJ3+SY0ZL2dx4WI0HpjT84bWJu0UeD/KUEBMrdCEn/OQ
         Ru6R2gonYPITIXOgJY2RG9Z8tUAli4PxbiHL6hQXXUCodst9EHsu9+DU+AG20+6n9iWm
         c+URHJOaY+Yo1gbwk6AFhCRPmQQacxhBNXJYSFsmZPGT/bx9HKtpIp+VUsdsjLPXweCe
         qd4Q==
X-Gm-Message-State: AC+VfDy4saxDOPsNZcm8UxtkhetAiOaFrQTfsEOwPovcw28oJl0nsIpz
        XyMULj77Uq809vi0ypA+CUIQ0w==
X-Google-Smtp-Source: ACHHUZ7fzVWC4mhfliHqEDlzKPRaPGVXyC+HO8O3hGv23dOoVZW7qwbG1HBrzyGlqbPOtTI0vuXcFQ==
X-Received: by 2002:a17:906:9b91:b0:982:227e:1a16 with SMTP id dd17-20020a1709069b9100b00982227e1a16mr4453886ejc.13.1686989116772;
        Sat, 17 Jun 2023 01:05:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id lo11-20020a170906fa0b00b009784915c660sm11812986ejb.136.2023.06.17.01.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jun 2023 01:05:16 -0700 (PDT)
Message-ID: <d2641843-3c00-2b38-709b-0f418328d525@linaro.org>
Date:   Sat, 17 Jun 2023 10:05:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 06/13] dt-bindings: remoteproc: Add Qualcomm RPM
 processor/subsystem
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
References: <20230531-rpm-rproc-v3-0-a07dcdefd918@gerhold.net>
 <20230531-rpm-rproc-v3-6-a07dcdefd918@gerhold.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230531-rpm-rproc-v3-6-a07dcdefd918@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 15/06/2023 18:50, Stephan Gerhold wrote:
> On Qualcomm platforms, most subsystems (e.g. audio/modem DSP) are
> described as remote processors in the device tree, with a dedicated
> node where properties and services related to them can be described.
> 
> The Resource Power Manager (RPM) is also such a subsystem, with a
> remote processor that is running a special firmware. Unfortunately,
> the RPM never got a dedicated node representing it properly in the
> device tree. Most of the RPM services are described below a top-level
> /smd or /rpm-glink node.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

