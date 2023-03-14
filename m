Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D505C05027
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Mar 2023 20:08:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbjCNUIh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Mar 2023 16:08:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjCNUIg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Mar 2023 16:08:36 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80571457D9
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Mar 2023 13:08:34 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id fd5so33019936edb.7
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Mar 2023 13:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678824513;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RBqd5amS3Q98CpQpuE067MY7M8nGht8QO6g+M3bT6Yo=;
        b=G0G0/dj90Qw/R7avrs3s5KD3DVZHkx3Z4+Vs+/Smz3XwKe/tS4eW8/FUg2yGPJRzSb
         2JqUKnnoUUL08vumPeEn31lCAXctdzeWEWsw6hK7nb0CGLnvWpPX3r1v6hvYR5eioJ1k
         8Q7AI/sM+XckV0UkUvGJkIhsD/NMWKHGFwMZNc2i603J/FpwSmS0dUmJA2/aAxYGUUhq
         aJngMAS2Ui5BZlThhgobbaUSp/Wqi6DQQa5uZLg3q0htcl92fdE2dbHEw/g4ffhoHdAw
         6rHq5n/U3JNpAuie362YL/pl9OQYTzFTvHpxvDCvfK/czWHU/qO7snqCRpy+RxeuQfSB
         aXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678824513;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RBqd5amS3Q98CpQpuE067MY7M8nGht8QO6g+M3bT6Yo=;
        b=5I720HwITtbxaJu78UPAPuBDK7elV7A0KR2Lb2BlJ8Dt624i/Ounn8j9Y5sbxiHI1R
         VAOjB7MsYAsQGZRp/tu4Ym0/DOW+qdspcQVR4Lcg/GP8o0B04PSWBjyvlGO2y45MWXak
         E28RioPHQatMYT6l03IJP1abX6K3GZFvTTxvTgisVVEnzsWoI4oA3C3ClOgQnqdeH9BM
         wQgGLYYma3ej4+C/9eepLlLuSgIomhIcUh+1Uw2gkBlg9x4TXLmIanAQJgyg/Mh2Slp+
         uIYeO1rMaysyYYmSoIPHK+JYfbdbZSvQQrw7iKYP8QRIuXpKKmhXsWd2useraobWeoQM
         XXVA==
X-Gm-Message-State: AO0yUKX/p5RblEPiqIJrMoxL1f09wYFeJdX7ru0P5188wQgZGVuxmVdf
        GNwMJWA1aHrnSN4BmlVL5MN5+A==
X-Google-Smtp-Source: AK7set8gHLu8iAvvUbC57h4H7l9g7Gv4fvpCS6pcJ5Gxw6P3Oy7kpW4+ew8pi9V+n0A25RKIyb0Skg==
X-Received: by 2002:aa7:d54d:0:b0:4fa:cbd8:3f6f with SMTP id u13-20020aa7d54d000000b004facbd83f6fmr328618edr.6.1678824512964;
        Tue, 14 Mar 2023 13:08:32 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:642b:87c2:1efc:c8af? ([2a02:810d:15c0:828:642b:87c2:1efc:c8af])
        by smtp.gmail.com with ESMTPSA id b12-20020a170906038c00b00924d38bbdc0sm1545981eja.105.2023.03.14.13.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 13:08:32 -0700 (PDT)
Message-ID: <9a9f25b2-5279-8fbf-6451-b2c6af5bc981@linaro.org>
Date:   Tue, 14 Mar 2023 21:08:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 2/3] dt-bindings: remoteproc: ti: Add new compatible
 for AM62 SoC family
Content-Language: en-US
To:     Devarsh Thakkar <devarsht@ti.com>, andersson@kernel.org,
        devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, s-anna@ti.com
Cc:     hnagalla@ti.com, praneeth@ti.com, nm@ti.com, vigneshr@ti.com,
        a-bhatia1@ti.com, j-luthra@ti.com, rogerq@kernel.org
References: <20230310162544.3468365-1-devarsht@ti.com>
 <20230310162544.3468365-3-devarsht@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230310162544.3468365-3-devarsht@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 10/03/2023 17:25, Devarsh Thakkar wrote:
> AM62 family of devices don't have a R5F cluster, instead they have
> single core DM R5F.  Add new compatible string ti,am62-r5fss to support
> this scenario.
> 
> When this new compatible is used cluster-mode property can only be set
> to value 3 i.e.  CLUSTER_MODE_SINGLECORE which is also the default value
> in case cluster-mode is not defined in device-tree.
> 
> While at it, also sort the compatible lists in alphabetical order.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

