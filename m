Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E24C4C636CC
	for <linux-remoteproc@archiver.kernel.org>; Thu, 16 Feb 2023 08:36:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbjBPIgW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 16 Feb 2023 03:36:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbjBPIgV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Feb 2023 03:36:21 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB4A474DB
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Feb 2023 00:36:12 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id dr8so3265172ejc.12
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Feb 2023 00:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=16RBvX2K5fEOc65TEX4CGMW4aoTgfh9Mm/UNw/VAU3g=;
        b=Ct04YhcQwiyukWh9jRrxjqrgGfT2820R8JZ9p0D8sliT8YMn58C+4+Leupc6/dUpmi
         AIKX+t4YdphFhKgHD0XTs4tlbi1mX1yFM2lMDJ2zBeOaBTi0ZQ6/Z40aiW7nqiI2bha/
         FrbfV3gSIyBHjTHaXKS7Bz/HJrktiN6eiHiGjI1IipCSeUBbLO9hS1+Ko7bqF9dUbsST
         2BsgAkSLaOFPwL98ctbXdQUBDBrKVC2deLNw3bB5k3f5lcKL+ELfsx71xoLoo72o2DFU
         jTcblEPqndNVSRUfDIJ3oDpeN1sxJOw5/nWtlF3hzxd/vaJFQheEBfmNHR2geuYkxV75
         x4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=16RBvX2K5fEOc65TEX4CGMW4aoTgfh9Mm/UNw/VAU3g=;
        b=qVzHr/pIFMnwN9kDXDPhwON83XQA2rVQIcjR/Z0VLaHUjNlJUVT7kFN89T6IWEM6UQ
         XDElOloNk8CQFPvMAcOiRWKVUH8YfHDkih8QFJyuNAyzAgrkhsPgI0G2NnmmJVMPM461
         faQeulLRN70SlqwPPF96fFX3XSc7S7YpqjZW/ZqPoxdocuHDYRapWEUZb+RrL2XlfG63
         mA8ohLoYck8IhAnzgCy5lPq5elz07HA25bgBDin9AV5FOvIET/qTanmMCTN42POMwXoo
         OWCAUvVIlV66kzYbMymm7+AF/pqkOckuKr5FdkUJQUcmNcbKmMSRVSpD+TZDAAgL+SI7
         5NSQ==
X-Gm-Message-State: AO0yUKX/4o5ZLKw4LgkgkjDoTGza1tVZ6eyWKXGgbISJcxQqKbDt3DX6
        Ko7y3r/+UV2rCww/5hUOsoSMSA==
X-Google-Smtp-Source: AK7set+6JdqmHrgsAeZvbyRq8PwsgciY8Be2DD/ZmGB20N36E1ggS7scV9cCgRysBHp/TfIoehBASA==
X-Received: by 2002:a17:907:6d99:b0:8af:2bb3:80d7 with SMTP id sb25-20020a1709076d9900b008af2bb380d7mr1172166ejc.31.1676536571096;
        Thu, 16 Feb 2023 00:36:11 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y21-20020a17090629d500b0087bda70d3efsm503337eje.118.2023.02.16.00.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 00:36:10 -0800 (PST)
Message-ID: <a2d10295-d9eb-cd1f-8f48-b61f97487208@linaro.org>
Date:   Thu, 16 Feb 2023 09:36:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/5] dt-bindings: hwlock: sun6i: Add missing names
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
References: <20230215203711.6293-1-bage@debian.org>
 <20230215203711.6293-4-bage@debian.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230215203711.6293-4-bage@debian.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 15/02/2023 21:37, Bastian Germann wrote:
> The allwinner,sun6i-a31-hwspinlock.yaml binding needs clock-names and
> reset-names set to "ahb" as required by the Linux driver.
> 
> Fixes: f9e784dcb63f ("dt-bindings: hwlock: add sun6i_hwspinlock") 
> Signed-off-by: Bastian Germann <bage@debian.org>

With new data, I changed my opinion and NAKed this. Still NAK, sorry.
Please drop the clock/reset-names from the driver (use indices) and DTS.

NAK means Not-acknowledge. Usually you should not send the same patch
after getting NAK, because it looks like you ignore the comment.

Best regards,
Krzysztof

