Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B68C3DA7A
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Jan 2023 09:33:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbjABJdl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 Jan 2023 04:33:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbjABJdk (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Jan 2023 04:33:40 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6824B389A
        for <linux-remoteproc@vger.kernel.org>; Mon,  2 Jan 2023 01:33:39 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id b3so40891505lfv.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 02 Jan 2023 01:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6I7pG4FzR5B65zHV/J+dBn4KI4CUWo3OwuRAUggAxGo=;
        b=yjU3Jfn5+hNe5Kkv0n5/uOXoMe6Qc6Sedd7OIUaHWmQs8QCpbuLuxKM8AyTVaJGpvo
         8/Uew4hsDKzq5UVQvUF2VOiuD8RYwXBkKbOE1QZRpIAGTtgZ5ZPC6hALj8yP3SkIHTC5
         Ari1iPp1omIHagI8vJf/eDbqkIOoMQKgRNLSnKffdu/DtMCyEFi4Vhk5OP5LbxpFTnA9
         xR1Xt7aep6LsRRwEmi6LP66ZViYXdFC/wzWeo5apmRKBu11mbLzVsesxn+KiF+hNMEga
         ySxAuFq26SkT+AEGLoUU5YNaFAFHKfKrIqyhEkQ3ZmgwA444zmS0hj5+fFdbd/R2T0gE
         1CPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6I7pG4FzR5B65zHV/J+dBn4KI4CUWo3OwuRAUggAxGo=;
        b=CIvbdyD+bFmXaSpuTfVd7JAXc9T2cHgxdNwfBBUl9UrSI/Q5nXOmHnL4O69b+zgA5z
         9mNrrJGpGTgNyUesQ63tJOIYme/9wtSwBgFUd0Y7yHr1ljzdjuDMCldjKyFTQz8NXUx2
         5oEysMfXJIASl9UqgHpODbNlnDE4Tj2Jj0InJUNcZAVJ9Q4oYWW0C/ZOVlRID225qhKv
         yoYCeTr1/77SpIGXcfCIYJsZRxC82U/MVXY5PeWZX2InVYNrqsWBTgVgZjF1Gh3wJcCH
         opgverI+x02qXxR1TOR5CqwBwQDMPaUyJplgcN+m0P0ixmIJdfzLRmybwK7osj6jGSHy
         +JlQ==
X-Gm-Message-State: AFqh2krIqTCEcOx8lHKIM2ttawaw7SKeNU5qSqN7H9CPsF7JSPVfYZkD
        uXYfB+4KuUMRh4LzGoifgcJCPg==
X-Google-Smtp-Source: AMrXdXt1qGmIko3mm73WYvaVkVl4JeeaENt+GB8PHv9FPsHn5lIxCkGSIqBEr4R4HlYLf5Von4tVVQ==
X-Received: by 2002:a05:6512:3c97:b0:4a5:42ba:d827 with SMTP id h23-20020a0565123c9700b004a542bad827mr12651876lfv.14.1672652017821;
        Mon, 02 Jan 2023 01:33:37 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k6-20020ac257c6000000b004b551cdfe13sm4408414lfo.279.2023.01.02.01.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 01:33:37 -0800 (PST)
Message-ID: <d664db86-309e-5c84-b170-ac04616dc131@linaro.org>
Date:   Mon, 2 Jan 2023 10:33:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: k3-dsp: update bindings
 for AM62A SoCs
To:     Hari Nagalla <hnagalla@ti.com>, andersson@kernel.org,
        devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, s-anna@ti.com
Cc:     praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
        j-luthra@ti.com, devarsht@ti.com
References: <20221230132453.32022-1-hnagalla@ti.com>
 <20221230132453.32022-2-hnagalla@ti.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221230132453.32022-2-hnagalla@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 30/12/2022 14:24, Hari Nagalla wrote:
> The TI AM62A SoCs have a C7xv DSP and Analytics engine for deep
> learning purposes. The DSP part is similar to the C71x DSP found on
> K3 J7 SoCs, but additional hardware accelerators and IP are added to
> the subsystem for deep learning.
> 
> Compatible info is updated to match AM62A SoCs.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

