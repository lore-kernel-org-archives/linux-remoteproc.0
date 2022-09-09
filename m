Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD45ECAAD3
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Sep 2022 08:01:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbiIIIA6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 9 Sep 2022 04:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbiIIIAh (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Sep 2022 04:00:37 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AAAA357FB
        for <linux-remoteproc@vger.kernel.org>; Fri,  9 Sep 2022 01:00:35 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id bt10so1395382lfb.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Sep 2022 01:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=uTcmPq9C8WmKzONhBGnLIvwBsDuAnPDz32iKl2zExk8=;
        b=CRizkv5r09PF/ZUTZdBDm6O6KVcB5h8NvvvVD3q4ustuzc46runapS8CiN+fyOJF9F
         nL3djjU0NVTYgSvDP4xopaL6WcW9pH8RgE6UZ9UUwuPAr32cya6XCocLN3x7P/nZA2pR
         FcVT4PFbXYQaZDXRZYtawmDdjysuoQyjHB5N1jCl+M+ADbPK6d3Schwa21dj1xYdE7/X
         /tvCp+PNmEQYSmy/CeqslQ+ubZB7u0pPUQ4T7t41M03yFKK/HNMXvMUa5zYXMY40qY3Y
         bunNOIxfsLF8ik9Hx+fVj7eUO740EydmHtxsVljssptyZvIdUA8HvIfySt0bPk5PNm7k
         d0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=uTcmPq9C8WmKzONhBGnLIvwBsDuAnPDz32iKl2zExk8=;
        b=SoqJACLpmpqdeORDTGLMtDw4uP9LxwNzY99ad1Z3MwehmVRbhJBaKsY5jFwPhs58go
         yjhXTLZaxQGsB6dzC6jJeG2AfV4Vg9J0Qq/t701iT4TGnouETp0r5hUIZAM8oUtZUSUM
         bZtP6cT2ySbNmduV2Edep7lz17YaGZTiYhinAGE6/wcmAZAOiEUt+ZBHT8vcHzCL1mn7
         ZHYXk10sIpH7BWsw9kZjDvkSuDefjz0t2qbJAquole1NEkBPJn0u0rm3Kko8kL4PW03E
         SOhC9W5BPMCdXk9dJ58VdW9MyHLiG/cc8lHW+NFVB8kjEQ05lNSBDdvbHC+AMkeym1NI
         TLhQ==
X-Gm-Message-State: ACgBeo088qP3rA2QA3HSmZFxnC1x9eAO/l2UBB80LGPZSIpPATE6rgAk
        qwN4mcMyOo++0gCn63xn51tXYw==
X-Google-Smtp-Source: AA6agR6uQAsLuHHqLvq59PBilY3DBtpqQYyXIG7ekWgfRm9sjbEPv6X7Cg92psHLV4ebHE5ZQvh3DA==
X-Received: by 2002:a05:6512:312a:b0:498:f5d4:52fa with SMTP id p10-20020a056512312a00b00498f5d452famr1164063lfd.311.1662710433406;
        Fri, 09 Sep 2022 01:00:33 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b0049480c8e7bcsm171213lfk.176.2022.09.09.01.00.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 01:00:32 -0700 (PDT)
Message-ID: <ad201ee7-d83c-9ebc-3619-64632f1f266e@linaro.org>
Date:   Fri, 9 Sep 2022 10:00:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 3/4] dt-bindings: remoteproc: qcom: wcnss: Add
 qcom,pronto compatible
Content-Language: en-US
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     bjorn.andersson@linaro.org, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20220908184925.2714098-1-sireeshkodali1@gmail.com>
 <20220908184925.2714098-4-sireeshkodali1@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220908184925.2714098-4-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 08/09/2022 20:49, Sireesh Kodali wrote:
> The qcom,pronto compatible is used in the wcn36xx driver to determine
> which register to access. However, this compatible was not documented.
> This patch documents the existing compatible as is, since it isn't
> immediately clear why the wcn36xx driver uses this extra compatible,
> rather than relying directly on the regular compatible string.

The patch does much more - messes entirely all compatibles...

> 
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
> ---
>  .../bindings/remoteproc/qcom,wcnss-pil.yaml      | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
> index bc18139fdb91..5e4a97e9d330 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
> @@ -15,10 +15,18 @@ description:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,riva-pil
> -      - qcom,pronto-v1-pil
> -      - qcom,pronto-v2-pil
> +    description:
> +      Append "qcom,pronto" if the device is actually pronto, and not riva
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,pronto-v1-pil
> +              - qcom,pronto-v2-pil
> +          - enum:
> +              - qcom,pronto

It's const, not enum.

> +      - items:

No items.

> +          - enum:
> +              - qcom,riva-pil


Best regards,
Krzysztof
