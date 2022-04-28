Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A18C433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 28 Apr 2022 06:18:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240515AbiD1GVv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 28 Apr 2022 02:21:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243705AbiD1GVs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 28 Apr 2022 02:21:48 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA24D5C67D
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Apr 2022 23:18:30 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id k23so7491143ejd.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 27 Apr 2022 23:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2ka+U96p3mWa8YtcGvHmVunz9f1bBqkZga9nU8xelW4=;
        b=bWtL8GJxDjez6YZRoyeLva17ctVPhg6AB3yMDk+VetiPY7F61b03OsVZHYVQfjIDUK
         fkwEOJfvbEIREId/6EOmupf9U2KUwFuKZUMhoD9dLwUb3Dj81OuqwyB5JXICisdFoQsf
         GMeXgcjqGMbZm4ovDAzJbw2iJ3HQ5LoSfHFJ63Vhp5hsJvx3Umj779SnnqSGNxRVA3tm
         MCWKe//VAwcWpP24rY+HeKjIqEzZTfFM9vNZkDN6Pt44kcShf/AS6QMqYw2Uo7xLfYDg
         vaA+O6mBrctxTknc210z3q0NMl9tkKafkw0UJTU3yP7iF7nP5oIAOg6eYJJ9v3YdvK3i
         oIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2ka+U96p3mWa8YtcGvHmVunz9f1bBqkZga9nU8xelW4=;
        b=y64n/9YJc8Va+LfwmsFpnRy9bYT5GvCR40njeFBVvYC7724LQrOH13HJZ7SUQWGsJu
         7MTGg/9bLj43Nj5pod3nvxXSJ/kGadXraSH0p3nqQhGfmzc3hySorzGhC7fqeG6ScjJ+
         Hg+cf1i4Y2baoxU0sthLAI18z3UN/eX28CbDZ9SvsSRDMh8bGJ6cLEH5tfkI9BtcwmX7
         I9Crxl/lC3l2uvk35g+1xdtha9CowOFwBEMHPA7qB2YrznFy1QP6bHMj4GSy6K+1Zuom
         kUq1MbsaucqYslSCn4rd58kkxQv2nkyGaRvTXr1lXszKCGCyMZNgZzqLl6VGr4NtiGHN
         2x4g==
X-Gm-Message-State: AOAM530shQAzYbtHfzH6aKIKcAViTadRW+wW8Kt3TicMU1PJ0auI8qlw
        xUwEK2zbs5oxCMknE3GkKOSjAA==
X-Google-Smtp-Source: ABdhPJzGPTtihnZa64THvw4tJANIuRGtu9moMI9bxSnACK4VAzUvsXTZbTTRshaV/izEKfxP0hdrog==
X-Received: by 2002:a17:907:9488:b0:6f3:e746:6fa9 with SMTP id dm8-20020a170907948800b006f3e7466fa9mr459750ejc.12.1651126709493;
        Wed, 27 Apr 2022 23:18:29 -0700 (PDT)
Received: from [192.168.0.159] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c3-20020a17090654c300b006e4e1a3e9d5sm8030490ejp.144.2022.04.27.23.18.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 23:18:29 -0700 (PDT)
Message-ID: <7bc6fb49-ae7e-d270-b2a4-a14a1d933d61@linaro.org>
Date:   Thu, 28 Apr 2022 08:18:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: pru: Update bindings for K3
 AM62x SoCs
Content-Language: en-US
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Suman Anna <s-anna@ti.com>, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220427083509.14458-1-kishon@ti.com>
 <20220427083509.14458-2-kishon@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220427083509.14458-2-kishon@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 27/04/2022 10:35, Kishon Vijay Abraham I wrote:
> Update the PRU remoteproc bindings for the PRU cores on AM62x SoCs.
> 
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
> index d7c3a78e37e6..e351550b012c 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
> @@ -47,6 +47,7 @@ properties:
>        - ti,j721e-pru    # for PRUs in K3 J721E SoC family
>        - ti,j721e-rtu    # for RTUs in K3 J721E SoC family
>        - ti,j721e-tx-pru # for Tx_PRUs in K3 J721E SoC family
> +      - ti,am625-pru    # for PRUs in K3 AM62x SoC family

Looks like out of order.


Best regards,
Krzysztof
