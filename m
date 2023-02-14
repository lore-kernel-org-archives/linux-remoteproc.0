Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D682C61DA4
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Feb 2023 08:08:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231907AbjBNIIu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Feb 2023 03:08:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231865AbjBNIIm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Feb 2023 03:08:42 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 635CB13528
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Feb 2023 00:08:40 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id h16so14692236wrz.12
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Feb 2023 00:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iN3ZMqjZosbU/hI1NsSGntsECLWbts5tczKkDQ3dHxE=;
        b=Z5R8LJFZQF+sFxGg3eeP3py7bOQD5ul95g9EmK+/vvVJ342mee6DCybq4m7ubfLwtT
         wdKlLvtOJav9X6u780Ls+57PZnVx/x+OxhH5rSljW5e+ZJb8LFoagn/z3/CwfxUX5y8b
         gPJhqEj1TnWiZ1sw/RyIJk/DD7EWQ2CddJlgI6ei7HCY//k/try65ujUVTaiaofSpVSF
         z81oxGFfPTW6hXaxPSqzBCEMlhY9VAl+efSkBrUckRR59OOlId5oFmhLWwqk+SA9GVPx
         vSAYqq7a31bsWawmwrOxIU2dUU2b/VtfSnz3M9F2slRESU/jmExBKRbCOj+2MvQoFaNs
         9XrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iN3ZMqjZosbU/hI1NsSGntsECLWbts5tczKkDQ3dHxE=;
        b=7doda4088sVQ8KWM//d5WiD+QJWRcRU9/+xbiGChroaLUQptMjwmGFZRuDEOIJkAJr
         q0Uaanooq9M19ei76BNPZ45EjaKNhPsP97I9TJGiXFVR4GvaQruoOn6npz4NjM4GB/SQ
         ODETAFJw3opYR2kqhkt7+wyxtiYKG/Ryj/RlwliehGDu9smup5amQ86cQ/eQbTWibdUq
         fkVVDLN3r0vFsZoBpH6lyz1xzfHKXvENx8wZ3XIusdhq8Aruc4Hh+1gFH9ifpqCftyWl
         i0u8IGBi8SWKlHP/VG8BiCjuewIQMAxCBfeSgRnQNp3hxagGB9PbJPhqV2fBuTzyyIMw
         kAzA==
X-Gm-Message-State: AO0yUKUAK4aF84iSHVJoaGrHhI4tQLea49rvhiSsgIAp+5kNe4Dg+8iy
        qU5v/gHZmvjAXMKXYY7S/gaxAw==
X-Google-Smtp-Source: AK7set9Dc7KyT3AZCMzvREvN2+SdsG4snoQezyTd1qBf6XE5CvzudSSJGXe1PQVMBgtccGlStZ+bPQ==
X-Received: by 2002:a5d:654e:0:b0:2c5:56ff:4321 with SMTP id z14-20020a5d654e000000b002c556ff4321mr1197406wrv.4.1676362119008;
        Tue, 14 Feb 2023 00:08:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j4-20020adff544000000b002c54fb024b2sm7344051wrp.61.2023.02.14.00.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 00:08:38 -0800 (PST)
Message-ID: <64b88191-c419-e009-418b-174f66a5f26e@linaro.org>
Date:   Tue, 14 Feb 2023 09:08:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] dt-bindings: hwlock: sun6i: Add missing #hwlock-cells
Content-Language: en-US
To:     Bastian Germann <bage@debian.org>,
        Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20230213231931.6546-1-bage@debian.org>
 <20230213231931.6546-2-bage@debian.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230213231931.6546-2-bage@debian.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 14/02/2023 00:19, Bastian Germann wrote:
> The allwinner,sun6i-a31-hwspinlock.yaml binding needs #hwlock-cells
> which is required by the hwlock type.
> 
> Fixes: f9e784dcb63f ("dt-bindings: hwlock: add sun6i_hwspinlock")
> Signed-off-by: Bastian Germann <bage@debian.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

