Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7708C05027
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Feb 2023 08:09:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbjBNIJ3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Feb 2023 03:09:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjBNIJ2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Feb 2023 03:09:28 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74CB72D4F
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Feb 2023 00:09:27 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id h16so14693910wrz.12
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Feb 2023 00:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pf9170XvU7zLLAHBJUBXw8LaXOs2tRKFoZ7PkVXYtIY=;
        b=LPaw8u0ct7tKtQNnm9Nx7k30Lqv1q3WeXUXy9e2Gd6QHcdvXAE67RvKMGi3qZWUoIg
         e7X/IdGd7CpY22bkryhv5EUqfE65YWzy5ilmG300PpNCUxugKDSMDMYqcTUWEc+Dk42s
         WwTMOFlV7+BYn6khsV4Zy3/9UsU5umHdY1eQB9h4+g5DeuRYUekGNH7+KEhF9pEzQPi4
         T6ACNEscTe7S2OTMWhgH40DZuPdbO1QD5BVzb4vvw4S7RKgVIux0yGq5rCuX+ynXd+CZ
         kAwHKytA8yjpvF1W6BzhCKYP8URTXGePXMGLjacd43Fo9mXqiRtBXQHGECvQJVS3e/i1
         pfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pf9170XvU7zLLAHBJUBXw8LaXOs2tRKFoZ7PkVXYtIY=;
        b=r17A+ZYTPLbEM0iGiI+io0AL3iRugLQvUbhlmkaCandcBqMi3/NnVa5V6GaWRTqtYP
         iGYD5cSOT7adXsg3OJn/tfGt55kQsRAwmevqc1ZOnwVA4uFks1+DRmp7ADgzdWUH3K+v
         Ht5CUAxUlaXufr8rTnpuzJYK4U4V5lWOO4MRjSsRMa6plFuwOyoJXWin1ioRjcF1hWVs
         oap0HWTXz1CcRxMDvP9dIIrWPzWA0wvoJuhKKXyLvEYgAfSibpXUtRguzU9o+uFTfPML
         gxPED3Rh9xVqy0yPgH4dHdRhEhpQNO736q1Wj4NmfMnbtuuTu3LqgbabtEJgXFo7dyQr
         GRYg==
X-Gm-Message-State: AO0yUKX9FaXutw6mhXpg7xd3tAJVB+t+zwDcZnELN3dlLPXE3iAW/hEc
        dwqxDINT1+KA7bW0CVLlDc1GIA==
X-Google-Smtp-Source: AK7set8WK084Wm25gzk8fxH+tdMAdKMKDQpEY60rw+rQLHE2Nft2xLZqt5ECPRmIVsfYPqc19DrP/A==
X-Received: by 2002:adf:f685:0:b0:2c5:5687:5ed5 with SMTP id v5-20020adff685000000b002c556875ed5mr1183986wrp.18.1676362166084;
        Tue, 14 Feb 2023 00:09:26 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id b16-20020adfe650000000b002c5534db60bsm6115122wrn.71.2023.02.14.00.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 00:09:25 -0800 (PST)
Message-ID: <1f03e625-3385-06bc-1800-d30ba5da6f0c@linaro.org>
Date:   Tue, 14 Feb 2023 09:09:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] dt-bindings: hwlock: sun6i: Add missing names
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
 <20230213231931.6546-3-bage@debian.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230213231931.6546-3-bage@debian.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 14/02/2023 00:19, Bastian Germann wrote:
> The allwinner,sun6i-a31-hwspinlock.yaml binding needs clock-names
> and reset-names set to "ahb" as required by the driver.
> 
> Fixes: f9e784dcb63f ("dt-bindings: hwlock: add sun6i_hwspinlock")
> Signed-off-by: Bastian Germann <bage@debian.org>
> ---

With the changes from Andre:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

