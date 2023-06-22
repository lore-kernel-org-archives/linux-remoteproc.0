Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3999BEB64D8
	for <linux-remoteproc@archiver.kernel.org>; Thu, 22 Jun 2023 06:22:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbjFVGWw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 22 Jun 2023 02:22:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbjFVGWv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 22 Jun 2023 02:22:51 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84396199E
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Jun 2023 23:22:49 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f904dcc1e2so58821745e9.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Jun 2023 23:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687414968; x=1690006968;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gmobDT7+8aP4aCITE+/y9FPE9+vYWQGY04+aUMJ3l7w=;
        b=lID62h52Vg7jFEFKKGfYC1kkLFKjhrmEaN54va3c25gVRp2g2G2LKNjA5jU36CP/FM
         EfbeCTtZ0jFAIPb6YIKzWuxc33dMDC068Dmdje4pOUrNa7RqiaHdJfceWAyu39ky3b2/
         uhu0yXSogwt0krlQbGwRiKptmJh4XVy+BBwM3VTBzHNPY1zThzMoLOrBPEuxLJEbxf1c
         KBd6X7MCFiXtbd9mkazy+H7pM+4XzNNsn7eY0hsEg/x+pvQHa2UiV3euzouZ3GLf8vZ/
         uLCU1BqXhm6agprvaXHTCgJi7jzqht+Oyrm2KKpiYG6R4s/XRKsqWcU8PyHDfHRWY2rg
         VNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687414968; x=1690006968;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gmobDT7+8aP4aCITE+/y9FPE9+vYWQGY04+aUMJ3l7w=;
        b=YBGFoAFnkvoLvttsW6S8WfY7YaRDfSIAJ4qd3bGLmU+23oekA4l20bFN5IYVisLr6O
         c3LSFZNGEFPA+Fwh76Njax5Oi04I+YS6h2sEysQvFk0P+b7CjchKpvIdqDHLh20kY9E9
         hs3JxFKABk/x4RlRRHJQ2/ZTBDoNTGv9JEHMYZK7xbZtm1HZ1F+XzTWd30xXvdfCkCKv
         mRNblPXQMzziP3HmUo8OH7Y6FygKYvUAK+Epluf4c+2itUPtAAtUPqUF81iB0yVl0sY6
         D0FAbZUpFvwJGVdbApUpqCTZdg6ltN/iBh1I3dm32EjuvVXmUgx7mEZyNO2UiQ9DLPwB
         uJpg==
X-Gm-Message-State: AC+VfDwzrEa0j1ShtKgUKzXFRA0KmQOUZAdHLXuGGeVJ6P64Gj7Be/TO
        XqGgazbnd06biMeaZc0bc1EfZg==
X-Google-Smtp-Source: ACHHUZ6+nD3/452NS4FRuKF9FIbtua9FwfR8JwTgiR4FpTZ6V0c9K02Q1pSxdZdLn4/hpcjiNbVA3g==
X-Received: by 2002:a1c:7211:0:b0:3f9:206:c3a6 with SMTP id n17-20020a1c7211000000b003f90206c3a6mr12041497wmc.20.1687414967617;
        Wed, 21 Jun 2023 23:22:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id b8-20020adff248000000b003063772a55bsm6183782wrp.61.2023.06.21.23.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 23:22:46 -0700 (PDT)
Message-ID: <5e381133-969f-943a-a7a1-1243d7b105b2@linaro.org>
Date:   Thu, 22 Jun 2023 08:22:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sdm630: Add support for modem
 remoteproc
Content-Language: en-US
To:     Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230621175046.61521-1-alexeymin@postmarketos.org>
 <20230621175046.61521-3-alexeymin@postmarketos.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230621175046.61521-3-alexeymin@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 21/06/2023 19:50, Alexey Minnekhanov wrote:
> Modem subsystem in SDM630/660 is similar to MSM8998 and
> device tree node for it is based on the one from msm8998.dtsi.
> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 65 ++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 

...
> +
> +			qcom,halt-regs = <&tcsr_regs_1 0x3000 0x5000 0x4000>;
> +
> +			power-domains = <&rpmpd SDM660_VDDCX>,
> +					<&rpmpd SDM660_VDDMX>;
> +			power-domain-names = "cx", "mx";
> +
> +			status = "disabled";
> +
> +			mba {
> +				memory-region = <&mba_region>;
> +			};
> +
> +			mpss {
> +				memory-region = <&mpss_region>;
> +			};

mba and mpss are deprecated. I think this was changed to memory-regions
in remoteproc node.

Best regards,
Krzysztof

