Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E486DC4332F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 Oct 2022 07:12:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbiJFHMf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 6 Oct 2022 03:12:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbiJFHMb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 6 Oct 2022 03:12:31 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEAB35850F
        for <linux-remoteproc@vger.kernel.org>; Thu,  6 Oct 2022 00:12:29 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id s10so1190379ljp.5
        for <linux-remoteproc@vger.kernel.org>; Thu, 06 Oct 2022 00:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=RRQC6Wj4SRQwXMivBVk6nrMKjf+fL4ckDTulVeUseAI=;
        b=ibvOgFJ4E3EzifdMOmymD5VZmflpKgcJUadj7VxP3zl3bCGIu1f/3tcH7ctf6QdgJm
         m5dJTiX5Yi922iCO/gLeWufufmDcp5l3lHQnu4e9HgCv6Xsai5KZ14RXgK5GOiWcWUb+
         i10FUcoqUPqPGxwZM9At5J/tF0i/pZtqrpARkkORISKHqE7RgGeVIJ5KzKF8XRtP7arh
         3tRjnBxVI/IWK+omgtSnA5h6m1ymzwSF/95YT4SluUN448iOWGmSSQQUx2LrAbqEAUf5
         KAkSxcl9xeNpZPTe2MHulYbRETwHkpOl0U2BR2nGSS1qGWaIsIu1Yh4Yhu7Fbx7LjKMU
         lCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=RRQC6Wj4SRQwXMivBVk6nrMKjf+fL4ckDTulVeUseAI=;
        b=MD86YMAbYzFhlVllWFLaj4RDV4WKfVA/QPWKrmPa0qS6tXTsL7lvELUkKY6US20zHY
         zYBMD3w79x1f2mk/JdnaTvAdF+AtDqwSKBxvWsnSoeLhdqY5gLutOrhr9KlnylOTtmRU
         62FlKla3TDygQWiH7KV+cfvNiX0bEN9O5EYlY0duHXdmdzg/8zY/Kvk95blmDD+ilDYv
         qd6/imZuT34Dg8reLWANzh17ThyCApjiS2dXIbQIlXQMgsEs4gKzJn+TMAJHQSRzvbEX
         sn9RvT9XSL9l4/z13fVZhnPZtR/au3vrpP3/9g2e0sySAf5pxULIitgR+i2uyEaXSKJZ
         N+xA==
X-Gm-Message-State: ACrzQf1yWajZiKHmevgVHnG0uZFeGfhQ+tl2aLICLKpNwCr2a8UKE8MQ
        XlDdJmbFpd2lagQKzQ6deIS1XQ==
X-Google-Smtp-Source: AMsMyM7it0Q+ACFG66IGbbQ/sIH0rHZdAo1arHDout6kheiT690vrJfKBG29TFot4GqwLVwkLj0j2g==
X-Received: by 2002:a2e:8e77:0:b0:26d:ffc3:6237 with SMTP id t23-20020a2e8e77000000b0026dffc36237mr1212007ljk.32.1665040348302;
        Thu, 06 Oct 2022 00:12:28 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p4-20020a05651212c400b00497ac6b2b15sm2596916lfg.157.2022.10.06.00.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 00:12:27 -0700 (PDT)
Message-ID: <14aca742-4a27-c1d9-3015-eade31a4a3ca@linaro.org>
Date:   Thu, 6 Oct 2022 09:12:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 2/2] dt-bindings: remoteproc: qcom: adsp: Add ADSP on
 MSM8953
Content-Language: en-US
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org
Cc:     andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        dmitry.baryshkov@linaro.org, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
References: <20221006044745.286264-1-sireeshkodali1@gmail.com>
 <20221006044745.286264-3-sireeshkodali1@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221006044745.286264-3-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 06/10/2022 06:47, Sireesh Kodali wrote:
> Add support for booting the Audio DSP on the MSM8953 platform. This is
> used by SoCs like SDM450, SDM625, SDM626, APQ8053, etc. Since the
> configuration is the same on all SoCs, a single compatible string is
> used.
> 
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> index 3072af5f9d79..c9d69f6160a1 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> @@ -18,6 +18,7 @@ properties:
>      enum:
>        - qcom,msm8226-adsp-pil
>        - qcom,msm8974-adsp-pil
> +      - qcom,msm8953-adsp-pil

Alphanumeric order.

Same in other places.

Best regards,
Krzysztof

