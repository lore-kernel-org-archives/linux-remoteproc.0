Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9C1CCA47B
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Jul 2022 09:56:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233386AbiGNJ4v (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 Jul 2022 05:56:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbiGNJ4u (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 Jul 2022 05:56:50 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 919BB4C605
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Jul 2022 02:56:49 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id n18so1962526lfq.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Jul 2022 02:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gIE2z4Ff5AC2EfDWiZb4g0c5VgVN1/oUZLfEG5XVMy0=;
        b=IE99WmuK1hII6yRK+kzrFISACmY/7Y1xnKb20BU9zpedj18v2h0cbLJayP5bf/eRXD
         B5uPjU0MXPOqm+Gd/mkzAy2oEjm2bS4lGSpNEQkOZkpMbt3mJ8CeYrTgMAqP2eV3V3am
         UA11c/fzCOLrouhAFHmZa5E4hePs5ygAD2nO8yEG6Kr1EoGOWscCTbMZjPNV8xR4mj14
         5hVX7TnmmMQvokfYi6akmKmNZDktUknWmyUrcMgwsDXBTqOf8MgkEWABAZl/I6GYopAT
         cBXx8BAK2bXXdwUBeAfb2TFQNQCTHtZUloTL2mhRG8vwoqHAwt6tJSPOc1r4M4Ac4Y3W
         d6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gIE2z4Ff5AC2EfDWiZb4g0c5VgVN1/oUZLfEG5XVMy0=;
        b=45ZV3agMgrdSb7Yn7T2P25EArE+gWriLAmXqjfiGW6uUFLQ21qJLPeZcPkhKtiSZvT
         zJ4Hg6fK3uOIB5/o92M1YMv1HSaLio9efQTFLeKbFqQG8j5bKxXkfgvCYjcHKwagV5rY
         sAj15ZyfkysMeQbELgfHqECgmTDhfKhGqot2N9Dp0L3ieZ/Ey7IZEHwpnDYxstmOxcHP
         vwYJXUi0y4kryVteU7eB9dfyrPxg23kSv9PAOib7OlkpMo0LRbs2uDLhIu1G1S4bIyP9
         wiQh1MSv/iaGwPnDwFq3WQ8+3CkfspJ7xSM7Gxoy/w9t4vyrLyTc+4/FXvdGnJhvu5Mo
         pqSw==
X-Gm-Message-State: AJIora87PP+oIe1lxarNzr2tIef+Ft8GjaD6RvC6hDDAYVm7V+pVH+yl
        8zWaIUbsquxWfWcJQQpdGFa3BA==
X-Google-Smtp-Source: AGRyM1vpyadcwRCtiylu0eEk6Vq+yXDkj28btN8Uc4rmOVK/bwRRODSK7ozYr0UFqtnAMu2wPe4Ptw==
X-Received: by 2002:ac2:4e0b:0:b0:489:d4dd:20cb with SMTP id e11-20020ac24e0b000000b00489d4dd20cbmr4753516lfr.83.1657792607964;
        Thu, 14 Jul 2022 02:56:47 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id g4-20020a05651222c400b0047f6277db4csm268615lfu.300.2022.07.14.02.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 02:56:47 -0700 (PDT)
Message-ID: <a6e18f65-e818-15f1-ba8c-94d6c97fc31d@linaro.org>
Date:   Thu, 14 Jul 2022 11:56:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/6] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add
 MSM8974
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220712124421.3129206-1-stephan.gerhold@kernkonzept.com>
 <20220712124421.3129206-5-stephan.gerhold@kernkonzept.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220712124421.3129206-5-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 12/07/2022 14:44, Stephan Gerhold wrote:
> The "qcom,msm8974-mss-pil" binding is still similar enough to MSM8916
> to be covered by the same DT schema. The only difference is the
> additional "mss-supply", which can be easily handled using a single
> if statement.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---
> Note: I generated this patch on top of Sibi's series [1] to avoid
> conflicts later (I expect it will be picked up first).
> 
> [1]: https://lore.kernel.org/linux-arm-msm/1657020721-24939-1-git-send-email-quic_sibis@quicinc.com/
> ---
>  .../remoteproc/qcom,msm8916-mss-pil.yaml         | 16 ++++++++++++++++
>  .../devicetree/bindings/remoteproc/qcom,q6v5.txt | 16 ----------------
>  2 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
> index 3968348dc982..ca7146551ba9 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
> @@ -18,6 +18,7 @@ properties:
>      oneOf:
>        - enum:
>            - qcom,msm8916-mss-pil
> +          - qcom,msm8974-mss-pil
>  
>        - const: qcom,q6v5-pil
>          description: Deprecated, prefer using qcom,msm8916-mss-pil
> @@ -76,6 +77,9 @@ properties:
>    pll-supply:
>      description: PLL proxy supply (control handed over after startup)
>  
> +  mss-supply:
> +    description: MSS power domain supply (only valid for qcom,msm8974-mss-pil)
> +
>    resets:
>      items:
>        - description: MSS restart control
> @@ -177,6 +181,18 @@ required:
>    - qcom,smem-state-names
>    - smd-edge
>  
> +# mss-supply is only valid (and required) for MSM8974
> +if:

Put it under allOf. This makes it prepared for growing.

> +  properties:
> +    compatible:
> +      const: qcom,msm8974-mss-pil
> +then:
> +  required:
> +    - mss-supply
> +else:
> +  properties:
> +    mss-supply: false
> +

Best regards,
Krzysztof
