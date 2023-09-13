Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F1CEDEC7B
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Sep 2023 15:54:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbjIMPyq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 13 Sep 2023 11:54:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbjIMPyp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 Sep 2023 11:54:45 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C23CE
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Sep 2023 08:54:41 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2bfb0a2682fso24606351fa.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Sep 2023 08:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694620480; x=1695225280; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PV6H7MY3pYafdYjha+YwxubfEbezxXEhfC2aB0o7/80=;
        b=x+wVeK8BS+ldm/+KS+qKJto6DGwzL2e53/54rVSwwo9gDmZZRvTncASFcyNgM8eGVG
         Gt0wPz32OGJFUNYOrx2N/NZM1gBYuqhNJ53+XPe1t6tngy2jm36mist/mRLAEkkHF2bL
         viLi1I/TtSOwBjhqA3HRawaTaDR4QuJhVe+bLOvOH3bKXRGnDhmIVdmVEPoqu0+2LYjH
         GJb+NetrN69y6ha7bXj5sWEEArDf7Ls8csvM1HPj9tcxrVW+JVpPPUdw9EM85rWjJP5u
         8jKRhI6c8DAboT+o8vHsj796ewHkqOwz4u0LMRwAcJGbg91GFC7cst4SOnUOhlKH2Ssp
         8xKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694620480; x=1695225280;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PV6H7MY3pYafdYjha+YwxubfEbezxXEhfC2aB0o7/80=;
        b=uY9KVa/6EJDsATnfnISvLRFZnFfNFUGG/Awdw3tZbBR14BnpWWfcenNJH7WWayne75
         i+Iyop4BM0tVbuUG1ebPifknhUClyvknt0QVhymQIcsmpFxibBlPkhr4yV2lbsgB4BCI
         48AvNedHAQfPjIlgLLTpyPoMaR7UmRzjaxe8ZaXZ+sSRHiNFbtYo42j6uj62meydTm3m
         JMKVVNnYou+aTj3TSM9hBl4Q/xa4TDqbXFYqUSwDA4iX6U4TP676vsLPItCQW/EYEXjs
         Su7KOLNbEpIaSP0BQH3jXk3OEsGOmCzTEQfqOowt3SSqYXdfzoLO38Vgx5PzGtTyhTBn
         WdiA==
X-Gm-Message-State: AOJu0Yxr/6trCNoSnt9vnRBDQikT1sDa/LuZSjco1WORQ/rBT3eBBbYN
        j8vUdvd0W3U0FvYGse3Sc/RNwQ==
X-Google-Smtp-Source: AGHT+IFl0lyG4rkyAxRanpYoJepUFaViYKTHOyxflLutR7Tdl2sNNCM60S1AVZ3ZIYtlzyC2KV29Uw==
X-Received: by 2002:a2e:a282:0:b0:2bd:16e6:e34e with SMTP id k2-20020a2ea282000000b002bd16e6e34emr2403844lja.1.1694620479822;
        Wed, 13 Sep 2023 08:54:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id lh26-20020a170906f8da00b0099cd1c0cb21sm8594101ejb.129.2023.09.13.08.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 08:54:39 -0700 (PDT)
Message-ID: <48ff2a69-6eaf-78dc-0382-f0b6a6d8cddd@linaro.org>
Date:   Wed, 13 Sep 2023 17:54:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v6 1/4] dt-bindings: remoteproc: k3-m4f: Add K3 AM64x SoCs
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Hari Nagalla <hnagalla@ti.com>
Cc:     linux-kernel@vger.kernel.org, martyn.welch@collabora.com,
        devicetree@vger.kernel.org, andersson@kernel.org,
        linux-remoteproc@vger.kernel.org, robh+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        mathieu.poirier@linaro.org, p.zabel@pengutronix.de,
        krzysztof.kozlowski+dt@linaro.org
References: <20230913111644.29889-1-hnagalla@ti.com>
 <20230913111644.29889-2-hnagalla@ti.com>
 <169460861100.2790015.8526656812110915165.robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <169460861100.2790015.8526656812110915165.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 13/09/2023 14:36, Rob Herring wrote:
> 
> On Wed, 13 Sep 2023 06:16:41 -0500, Hari Nagalla wrote:
>> K3 AM64x SoC has a Cortex M4F subsystem in the MCU voltage domain.
>> The remote processor's life cycle management and IPC mechanisms are
>> similar across the R5F and M4F cores from remote processor driver
>> point of view. However, there are subtle differences in image loading
>> and starting the M4F subsystems.
>>
>> The YAML binding document provides the various node properties to be
>> configured by the consumers of the M4F subsystem.
>>
>> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
>> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
>> ---
>> Changes since v1:
>>  - Spelling corrections
>>  - Corrected to pass DT checks
>>
>> Changes since v2:
>>  - Missed spelling correction to commit message
>>
>> Changes since v3:
>>  - Removed unnecessary descriptions and used generic memory region names
>>  - Made mboxes and memory-region optional
>>  - Removed unrelated items from examples
>>
>> Changes since v4:
>>  - Rebased to the latest kernel-next tree
>>  - Added optional sram memory region for m4f device node
>>
>> Changes since v5:
>>  - None
>>
>>  .../bindings/remoteproc/ti,k3-m4f-rproc.yaml  | 136 ++++++++++++++++++
>>  1 file changed, 136 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-m4f-rproc.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/stericsson,dma40.example.dtb: dma-controller@801c0000: sram:0: [4294967295, 4294967295] is too long
> 	from schema $id: http://devicetree.org/schemas/dma/stericsson,dma40.yaml#

This looks unrelated but it is caused by this patch. Probably by
conflicting type for 'sram'. It seems we need to make exception for
'sram' in dtschema.

Best regards,
Krzysztof

