Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A99C54EBE
	for <linux-remoteproc@archiver.kernel.org>; Sun,  8 Jan 2023 15:36:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233375AbjAHPgg (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 8 Jan 2023 10:36:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232624AbjAHPge (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 8 Jan 2023 10:36:34 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1240460C4
        for <linux-remoteproc@vger.kernel.org>; Sun,  8 Jan 2023 07:36:33 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id m26-20020a05600c3b1a00b003d9811fcaafso4722855wms.5
        for <linux-remoteproc@vger.kernel.org>; Sun, 08 Jan 2023 07:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d0Y9NXW1uR93OzQg0aE5HzcgNDOO8kxrR8xgvwlZmQg=;
        b=Fq2GBqZV+dO0qub33W4gajEmbdeDSPTSo5gcqjMty85eLhO3UiUDK7Oy6uJMZjXFad
         GarIRvry7ORaDD4PmTS2xk1esmBDzDruWmN++UHY5MSaF7zpez4dwf/JzBvuY7T0DWPP
         exzhHKudLSF+Uj7nGTXQtUJuJsCqZFW3fjdHB4IfEAMmivNBbsqPcxS9sHCKx8J3usHv
         60FxgdCgLn1wOULtb8e/hDD5SMLCrBV44iv0wFtsy7Vec10p8S6KVU5jY9rBuNCvYSye
         THgRWtarbzVliNpUuQcr/7vbT537cz3DZ6u7Eelg8Gd+wrn7YCUmCZVcaqY6oehwREvY
         W/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d0Y9NXW1uR93OzQg0aE5HzcgNDOO8kxrR8xgvwlZmQg=;
        b=56L0XuBy4zQrx+WZU+SW2vLUo+IZiKd//00sGWZjX83WN0j1xaMY+XgKgjAprTAWoM
         0zrWct5/pqe7kA8VcpJ0Im0M7FdZdgM/9bUjLNikL2H27ZIfttj7IRBoWRe6PQ1xlypO
         g2n+LDwirDJ4cQKn+IONoFU7TRkJhnAs1xmxve3WJTSxLYfvrD+z7IB2Cz0mjba/i+E3
         LrMUJ+eUvzZkMZTGGU+I2P8LpJ+RutLPeYFV2Q3PDTGwQiN6/wzmw5MPEpoMoOFkpUIr
         MZs12eghLo81Jfw5IYwhB9D1jqto9NAq6whclNrRMzNzIWg3u/B+7QeGh0JrR1XvvbNa
         XI6A==
X-Gm-Message-State: AFqh2kqtxnBfH5HdgxSLr6cIy+maHAEfLZDUVhDnH1RT8VQ8yKvcyzG0
        HJruY/iQvxfN8YQGN9xu1r0jgA==
X-Google-Smtp-Source: AMrXdXs7B9K+/qUy69qOI8OZeEAnJUYC7tslNm8V5WNaRoYfPvoX2f4B1yNlMUiw7m6xWYM5pp8mPw==
X-Received: by 2002:a05:600c:4f11:b0:3d9:ee01:ae5b with SMTP id l17-20020a05600c4f1100b003d9ee01ae5bmr1147386wmq.12.1673192191645;
        Sun, 08 Jan 2023 07:36:31 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id az28-20020a05600c601c00b003cf57329221sm12935721wmb.14.2023.01.08.07.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jan 2023 07:36:31 -0800 (PST)
Message-ID: <c6ea3f37-fe5a-9a61-3a02-99bc036fd23e@linaro.org>
Date:   Sun, 8 Jan 2023 16:36:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] dt-bindings: remoteproc: qcom: sc7280-adsp-pil: Add
 reg-names and power-domain-names
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        linux-remoteproc@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org, devicetree@vger.kernel.org,
        mathieu.poirier@linaro.org, corbet@lwn.net
References: <1672991425-898-1-git-send-email-quic_srivasam@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1672991425-898-1-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 06/01/2023 08:50, Srinivasa Rao Mandadapu wrote:
> Add reg-names and power-domain-names for remoteproc ADSP pheripheral
> loader. This is to make compatible with remoteproc ADSP PIL driver.

I don't understand the reasoning. Before binding was "incompatible"?

> Also change power domain from LCX to CX.

Why? Hardware changed?

> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---
> Changes Since v1:
>     -- Modify subject line to SoC specific.
> 
>  .../devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml  | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml
> index 94ca7a0..b5bee2c 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml
> @@ -23,6 +23,11 @@ properties:
>        - description: qdsp6ss register
>        - description: efuse q6ss register
>  
> +  reg-names:
> +    items:
> +      - const: qdsp6ss_base
> +      - const: lpass_efuse
> +
>    iommus:
>      items:
>        - description: Phandle to apps_smmu node with sid mask
> @@ -57,7 +62,11 @@ properties:
>  
>    power-domains:
>      items:
> -      - description: LCX power domain
> +      - description: CX power domain
> +
> +  power-domain-names:
> +    items:
> +      - const: cx
>  
>    resets:
>      items:

Best regards,
Krzysztof

