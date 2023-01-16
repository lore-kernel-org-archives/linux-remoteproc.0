Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64EAC54EBE
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Jan 2023 19:06:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233685AbjAPTGl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 16 Jan 2023 14:06:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233680AbjAPTGe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Jan 2023 14:06:34 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C3932798D
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Jan 2023 11:06:33 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id v6so41912615edd.6
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Jan 2023 11:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CV8tAfRPf2IHKFO84VR70240CzDv/yHe+xWXBC9YNck=;
        b=QeJDGv2fUxNWwwetKotPZ+TRh8gJ+RlvO1uxBkjuQb8ZkAeeYnLOALxczfeh1MtpTl
         n08bJKkqBv3F3+bKDR1PjNg3wIcxrtb9Of+pgl2avg185N8CXce/m3zUpQ1kxVFneVRt
         WAFZtgGeaZ3ttMQ7H64Xw4sUpfJK0Ek5uQAHH3nI/uqEb3eEZDESzY+Vg39eotfynjGw
         TdpgVKRsCJmU7aSh0HDmWjvt2mebSkp46uH0fi1eWSHZpzW6Pmf2m7/M9yW0g327aTd4
         k4zALpCg0fGdSo8V/YssbcYg8VO/9wiqI5N+Mdk0d3VPT1kCRYyu2NQ1Iugow5LmK3dC
         3lnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CV8tAfRPf2IHKFO84VR70240CzDv/yHe+xWXBC9YNck=;
        b=AZiwLY036s5W1GIil9AsIIAP7XooByCcXnV4FKaql12i7MVcTbdpM15YNAqnKC3/Ny
         /H/wNVPGiBW7y+zftZoCh40EIoJ2p6ojGPNUZUeeUOBuantf58hEL1n/TDa2KvjVW8i2
         Jd/1Vz9eYz5jF+4gUZr1RiJtRxXYZ3FDAFmTlkh+7djXH4gYko9VCgxhTtVxW4LUx4gg
         9vGFOJFvUf81GN1Z/k5C5mCfUnXElbaVxkOp90xddHn/vrYH+NORsOImChjHR6CunA9l
         iHvMT2f7qmn/E+FmAUKZt/SZl9jlwnBFuFB7nb1GN6KL6BTIATB/1izDYsYGW50AP6eJ
         R5Rw==
X-Gm-Message-State: AFqh2kr87NlDgUWPAn09NH/z10LdGehJ2FHO6axgVR35d+uTaVUoRMmN
        2We7Eh720zpgm4xr1+nrZC+58A==
X-Google-Smtp-Source: AMrXdXsjBZjMnuV7YVxZpvP0hj3P56j70NAIFlFg7nArqAvUb/4acMKxsEX19XftKcyXLdXMVou5Jw==
X-Received: by 2002:aa7:dbc4:0:b0:47c:445b:b4f with SMTP id v4-20020aa7dbc4000000b0047c445b0b4fmr296641edt.32.1673895992067;
        Mon, 16 Jan 2023 11:06:32 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d20-20020a170906305400b007c0d64c1886sm12096487ejd.33.2023.01.16.11.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 11:06:31 -0800 (PST)
Message-ID: <1a70a28b-b406-4d84-ced9-4d66bad94652@linaro.org>
Date:   Mon, 16 Jan 2023 20:06:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 2/3] dt-bindings: remoteproc: ti: Add new compatible
 for AM62 SoC family
Content-Language: en-US
To:     Devarsh Thakkar <devarsht@ti.com>, andersson@kernel.org,
        devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, s-anna@ti.com
Cc:     hnagalla@ti.com, praneeth@ti.com, nm@ti.com, vigneshr@ti.com,
        a-bhatia1@ti.com, j-luthra@ti.com
References: <20230116151906.549384-1-devarsht@ti.com>
 <20230116151906.549384-3-devarsht@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230116151906.549384-3-devarsht@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 16/01/2023 16:19, Devarsh Thakkar wrote:
> AM62 family of devices don't have a R5F cluster, instead
> they have single core DM R5F.
> Add new compatible string ti,am62-r5fss to support this scenario.
> 

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.


Best regards,
Krzysztof

