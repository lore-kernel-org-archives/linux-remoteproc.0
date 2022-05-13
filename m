Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B50BC433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 13 May 2022 08:16:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377472AbiEMIQ1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 13 May 2022 04:16:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353656AbiEMIPz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 13 May 2022 04:15:55 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EE82E0C9
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 May 2022 01:15:54 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id h16so9671649wrb.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 May 2022 01:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mTQPBz30cCLuWgIJk7/NZCaC5miWia1gCjLQnZteLLo=;
        b=y/nWzJG4Fbw8/7Hr2WEQpFWbOnZphvs3gwZ72nPwxDPJfy7dy0gJY7R2lFYGrleewa
         UvN7q6TursJjqMpYGLwvl54QyuMBBG279rXkcLYs8J8YGa9ZZh2XDKFqqevEAFoqYQ8N
         LI8AYCHjsqeJqRXdo95z9Gy5PyyEsRgzj2Hdg+VIhyTudoCxR35KZDtptDp2IZ+MQVpc
         txgGTwv9RJDpztlhSVPQRLtfIoWcXWhQ6ZkBHBOEgBUCbjl7nrhdTIGb0qpz3NDQR/8M
         eV2XuSjmdcXb+EHRGJTaJwOlpIQPvr2Uy5+yffzx+6X9wTEypxD84XizeuvKb1LDBxdJ
         N5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mTQPBz30cCLuWgIJk7/NZCaC5miWia1gCjLQnZteLLo=;
        b=8M4ULlDOBkrnQJ1E+LzfD205EsIfdmxS5nXyKHF0oHTzk3Z0f0sc41ptT0HGRoCHuU
         ooxyle+qLs62vDCKciaHVqDhnY/Jm3gecGcYKyTsHYgS0hK2SP5BIpMkTodqTvx91/Ko
         pN4mk1caCYNqRb0k7kf8BrMuNIjc48kMgQAvuRmGqUrzrDQBBS2/1yjl4EGA/+z7wuJB
         JEaKULk3nNC/CMrLW9miLRn+DWqbA0wQS0RrZgl4vAtDAvyq1Tq37NLRP8VZkV6NtGY8
         syiJXmnbvAPTkd6iRR5d2/loQkN8WUfV0gLI1/PE37iohEf+YQgYRi8XdCAsOnWIrvT0
         uFXw==
X-Gm-Message-State: AOAM530uM1msp+vbSiATC1dVm2uC5YKdzk6CBZL5xtlSqvwf6FyztRHC
        OwGhPV6TAuaoa+eyLl7LUasS/g==
X-Google-Smtp-Source: ABdhPJwXd3TWdB6hMve0fv2uJKyMa4NDpLkzRHAgkIR+esBN7x+bTCEeukkPdDda8xWohPhizuEaAw==
X-Received: by 2002:a5d:624c:0:b0:20c:d8f3:71b8 with SMTP id m12-20020a5d624c000000b0020cd8f371b8mr2897239wrv.670.1652429752615;
        Fri, 13 May 2022 01:15:52 -0700 (PDT)
Received: from [192.168.0.168] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o19-20020a1c7513000000b003942a244f57sm4708291wmc.48.2022.05.13.01.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 01:15:52 -0700 (PDT)
Message-ID: <30978e5a-18ef-3ea2-8df3-3ced50f44bfc@linaro.org>
Date:   Fri, 13 May 2022 10:15:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 1/2] dt-bindings: remoteproc: mediatek: Make l1tcm reg
 exclusive to mt819x
Content-Language: en-US
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     kernel@collabora.com,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        Tzung-Bi Shih <tzungbi@google.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
References: <20220511195452.871897-1-nfraprado@collabora.com>
 <20220511195452.871897-2-nfraprado@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220511195452.871897-2-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 11/05/2022 21:54, Nícolas F. R. A. Prado wrote:

Thank you for your patch. There is something to discuss/improve.

>  
> -if:
> -  properties:
> -    compatible:
> -      enum:
> -        - mediatek,mt8183-scp
> -        - mediatek,mt8192-scp
> -then:
> -  required:
> -    - clocks
> -    - clock-names
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - mediatek,mt8183-scp
> +            - mediatek,mt8192-scp
> +    then:
> +      required:
> +        - clocks
> +        - clock-names
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - mediatek,mt8183-scp
> +            - mediatek,mt8186-scp
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 2
> +        reg-names:
> +          maxItems: 2

Isn't l1tcm required on mt819x? Now it is left optional.


Best regards,
Krzysztof
