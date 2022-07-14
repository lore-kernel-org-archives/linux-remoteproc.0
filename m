Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0745CCA480
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Jul 2022 09:45:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238441AbiGNJpt (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 Jul 2022 05:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237825AbiGNJpc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 Jul 2022 05:45:32 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C5111260F
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Jul 2022 02:45:31 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id t1so1882879lft.8
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Jul 2022 02:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=U7bE4AFFaqlBpYGWGp2bDcGNToCNNNh+R2dU+aim+1I=;
        b=aAacLcEaAKm5bx3USPkdVVrwv0zguEu8rs1lY5F6lNOeMAWK+8D/A9m4WBr/44c1XH
         LjpTQrqg2GOuzh62iX8vVHYvrvM1BmWkK0TdoeVHMYGqu7iNBK9Pb2WlWt2yiiW55k7O
         a1Uewv3Eh3QXfplrqJHwnIuip7m5R6MSqvAol32na8mvx6P5EFZjqtYZI27p/kvwznqU
         hFCVjuNsjXUEC8J4Oz2Br3ZlaUgC47Cmx086b+Cinv7CqI2/LLhOBboXUA1tbSATjM0q
         iRvtW5lwOF31ZgAmE0CDH0K6oNH0tLR1IJyD/s/wWqaUMm1KTImvgYg5uALvwAQ1+2Oz
         3/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=U7bE4AFFaqlBpYGWGp2bDcGNToCNNNh+R2dU+aim+1I=;
        b=lQYoCPgtS1ByDoT4FlxbkiipxWGjgbqDrW+G8yZKptmhhsJvb+IaAv1wHbBQ/o30m5
         tSCX222ehdnHBk3s/2xylfBHqH3q8EZe3yAv9zl0Joo/nBu6E4ukWROJWDumNOUEidmr
         GhClbku0TF+FVqbmeJVN2STaGqkmWqoPiH+REs+VNo3+z7Rp1DoQXKJEk4wkm8VAr15X
         gAUUqvQRbJ2XCFW3XjSNO+XYcEIvR7k+hyMJ3xfyff76TNQxNiIhcWeHInQxTIwXR7TE
         2LreoZ7q3bk5jZyJ7s7F/gmyO+TwlytrML/t4kNvSunN+7Pj09kHe9tehOZ2hkQ1W3jp
         Bv6w==
X-Gm-Message-State: AJIora8hSlndIZHmZb1WDr33Q0PJ14zyDdv0GrQMTQhRPu6D/D14mrNo
        0jFfTUW6YRzrLQvjyRPSz2PhGA==
X-Google-Smtp-Source: AGRyM1vGpON0DG4ORvaWqjTmXe+q+KTMeS1n2R2I9F705IDWK+oapuyCfjSrtWQhaNSEqjPpmb36Ug==
X-Received: by 2002:a05:6512:139a:b0:48a:1a73:8adc with SMTP id p26-20020a056512139a00b0048a1a738adcmr757796lfa.226.1657791929867;
        Thu, 14 Jul 2022 02:45:29 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id 10-20020a05651c008a00b0025d2d495dc6sm185480ljq.66.2022.07.14.02.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 02:45:29 -0700 (PDT)
Message-ID: <4936df27-e5b5-8ef5-5831-82fdf414ea90@linaro.org>
Date:   Thu, 14 Jul 2022 11:45:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/6] arm64: dts: qcom: msm8916: Drop MSS fallback
 compatible
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
 <20220712124421.3129206-2-stephan.gerhold@kernkonzept.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220712124421.3129206-2-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 12/07/2022 14:44, Stephan Gerhold wrote:
> MSM8916 was originally using the "qcom,q6v5-pil" compatible for the
> MSS remoteproc. Later it was decided to use SoC-specific compatibles
> instead, so "qcom,msm8916-mss-pil" is now the preferred compatible.
> 
> Commit 60a05ed059a0 ("arm64: dts: qcom: msm8916: Add MSM8916-specific
> compatibles to SCM/MSS") updated the MSM8916 device tree to make use of
> the new compatible but still kept the old "qcom,q6v5-pil" as fallback.
> 
> This is inconsistent with other SoCs and conflicts with the description
> in the binding documentation (which says that only one compatible should
> be present). Also, it has no functional advantage since older kernels
> could not handle this DT anyway (e.g. "power-domains" in the MSS node is
> only supported by kernels that also support "qcom,msm8916-mss-pil").
> 
> Make this consistent with other SoCs by using only the
> "qcom,msm8916-mss-pil" compatible.
> 
> Fixes: 60a05ed059a0 ("arm64: dts: qcom: msm8916: Add MSM8916-specific compatibles to SCM/MSS")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
