Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18ADDEDEC46
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Sep 2023 11:37:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240292AbjIMLhS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 13 Sep 2023 07:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238480AbjIMLhR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 Sep 2023 07:37:17 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6D7D1726
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Sep 2023 04:37:13 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-403012f276dso45795705e9.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Sep 2023 04:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694605032; x=1695209832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nme/JcCZy+21A8LZUmcpQ/snwqu0c1CGtPKLSeADIRc=;
        b=j7gXvpyobUDiLzNyNTZ9Hw0Gug6li/qnT+W/tTKq296h9ORbbw2Dm43yl7dX3onYmx
         XKd1B5DAwdvQsAzyG2fSX0m44n6E4SJxmKaGr2lwcq+fwKoJOcHkPmKk/i73ICDOKxWz
         5dD0hJQQRjYE+lXxQfngpNv/f00gVgir6LKKNHPtFkR8RV3O3tqv97Tw7IncWux/tPgW
         MWhJKQcM8RTR7tg5SOw+mWQXz6q/ZzwD+P9vLS3ImKxhnOgFYwkCHfBzcgR7wk7gt5gx
         6FzpEka6NIQF5EUBQKditkH5w2OHLSS65lbrV5REXeApuUo/tf7ksHsyM2yd1O7BosPv
         h2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694605032; x=1695209832;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nme/JcCZy+21A8LZUmcpQ/snwqu0c1CGtPKLSeADIRc=;
        b=ZlR92qEf/jTtrJqsK0GIsy9SyBbTWqiEjRsOsjUMguRKwLp6aA456TP05JgFBh+sub
         iARw5oXj3LGH8FGJ9N5aC8iGP/t7PpnHc0NylpuAwqtVUnrYDPw7rGrU4hQcT447ExsC
         PCaVyH6nfADV9NmK50tVyAf9rtFSA8V3eKiFG7Cd2knUpitUR+xPilZHsFgriQOhbvp8
         qG75aR2DVe5fDWQ06Z1KGNA2sAsnmHT5suSLn1lNQAOtETlV47x12PUdfmwV+DjzhIIp
         wVtNkxLIqDaPbRWHosBh3L6VFa711/Tj+Sl5XFzed0UxIySZdts71MVwGSzLNqXF+Ovw
         HQEQ==
X-Gm-Message-State: AOJu0YxNsMr+64Ax/r1Zw7o1fbmKPxCyXJB6Zm+RzXT1ZzwM2O86Lh+e
        bfsRvnFL8GweGv+Gwz/bRfrhVQ==
X-Google-Smtp-Source: AGHT+IH2nVE8W7SFZFZN8wVN3nLWifI8J4zzhexkxNYGhAChtyZIJ5HHNdGp2o6YOXlYp4DS/nsyCw==
X-Received: by 2002:a05:600c:2346:b0:402:a464:1a20 with SMTP id 6-20020a05600c234600b00402a4641a20mr1713557wmq.33.1694605032176;
        Wed, 13 Sep 2023 04:37:12 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id l12-20020a1ced0c000000b003fed4fa0c19sm1803441wmh.5.2023.09.13.04.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 04:37:11 -0700 (PDT)
Message-ID: <75fbb3fa-8696-c2fe-0a41-a3e588241b79@linaro.org>
Date:   Wed, 13 Sep 2023 13:37:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v6 3/4] remoteproc: k3: Split out functions common with M4
 driver
Content-Language: en-US
To:     Hari Nagalla <hnagalla@ti.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, p.zabel@pengutronix.de,
        martyn.welch@collabora.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <20230913111644.29889-1-hnagalla@ti.com>
 <20230913111644.29889-4-hnagalla@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230913111644.29889-4-hnagalla@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 13/09/2023 13:16, Hari Nagalla wrote:
> From: Martyn Welch <martyn.welch@collabora.com>
> 
> In the next commit we will be adding the M4F driver which shares a lot of
> commonality with the DSP driver. Split this shared functionality out so
> that it can be used by both drivers.
> 
> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> ---
> Changes since v2:
>  - New patch (reordered refactored from v2)
> 
> Changes since v3:
>  - Removed "ipc_only" element from k3_rproc structure
>  - Refactored to bring 3 more common functions
> 
> Changes since v4:
>  - None
> 
> Changes since v5:
>  - Rearranged the functions order to match with the functions in
>    ti_k3_dsp_remoteproc.c to ease review.
> 
>  drivers/remoteproc/Makefile               |   2 +-
>  drivers/remoteproc/ti_k3_common.c         | 513 +++++++++++++++++++
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 598 ++--------------------

Generate your patch correctly with -M/-B/-C so the move will be detected.

Best regards,
Krzysztof

