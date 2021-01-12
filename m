Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 442E6C433DB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Jan 2021 14:48:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7BD123121
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Jan 2021 14:48:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbhALOrl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Jan 2021 09:47:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726259AbhALOrj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Jan 2021 09:47:39 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 535F8C061786
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Jan 2021 06:46:59 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id y23so2357214wmi.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Jan 2021 06:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DZADJFLeZtNtX5++V0ne+jZ8MKQsoTlf7N3vwNewytQ=;
        b=Apip1QRFUEpviUbTbzPw4KB3McpMhbRJK8+Mwl30en21Imr9rk4BbH2f742gqc0BTq
         n0qC2pbeYMJjkeFQLhSXKxqcXnyZuXg+qfCd7V73aIUSL73UTrshelk9rquoq8y6EL/y
         LTTrMKNPfCxD6plIjya7AsDT+wim2aiqPtAhqjv99z4lA34Eeys4uXHZPCRM+5oTOQCk
         CQ+h8RmXvsCZ5hcinNGQWQQLIk+2Y53+gAn/lLu7CKp4HBrHEt6oOuH0CL75c2IOpvxa
         OXvoQMQgOaqJmUQU5hX/sAjHI8obPv8d6keUkIBpuPIp1ZJqroj4HzOriJRqF3XRYi2M
         7MgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=DZADJFLeZtNtX5++V0ne+jZ8MKQsoTlf7N3vwNewytQ=;
        b=XpsnbN2nfjPJk1tlxeGgFph7TBEK1Zl6vtjgxefdnkhjKIHznZfpOL7K3/KMNtgSRX
         vNLOLRrU4HflO+YC6USzcYqAqyzLlNaw1y37CdoZOZELT0RPuO6X+B1rS4wHy3KtDcvz
         UZ+nNlqfR4RJrm60H1FLPxiyTD4UULGMh8RZBT0hmwbSk5vut4H8yTc9EVNU7Ik+CdO7
         /PpZeFhUy8yRS/ompdJ9ZPm+6zQJCITqSyRybKstTuB1OSvdziJuOdit+aXUwCg/GvKm
         XO/l1QfQu+1y+6r10WDOtw+aoYn6XjgjyQtOewvBG8F00whtJZiIVlEKENOj/G9xQxML
         faVA==
X-Gm-Message-State: AOAM5318KpoNzJgvC8/50chC2jc9YmJLtHbLuIzlYPPbcyapNeGBoRB7
        6Tt0WBygkyvWUAjDmlctRiX25Q==
X-Google-Smtp-Source: ABdhPJwpb3Y3B1CkOaFrt+N90j0H2uT/NLlT88IOLOCa7lyOvi7ctcedFic09kIFxMrpeGbl3/bakg==
X-Received: by 2002:a1c:a706:: with SMTP id q6mr3943259wme.7.1610462817766;
        Tue, 12 Jan 2021 06:46:57 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:c414:1f2d:e8b9:b00e? ([2a01:e35:2ec0:82b0:c414:1f2d:e8b9:b00e])
        by smtp.gmail.com with ESMTPSA id c10sm5679465wrb.92.2021.01.12.06.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jan 2021 06:46:56 -0800 (PST)
Subject: Re: [PATCH v2 5/5] ARM: dts: meson: add the AO ARC remote processor
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc:     ohad@wizery.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
 <20210102205904.2691120-6-martin.blumenstingl@googlemail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <f6bb1468-1fd6-e7a3-64b3-5cbcacf37599@baylibre.com>
Date:   Tue, 12 Jan 2021 15:46:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210102205904.2691120-6-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 02/01/2021 21:59, Martin Blumenstingl wrote:
> The 32-bit Amlogic Meson SoCs embed an ARC processor in the Always-On
> power domain which is typically used for managing system suspend. The
> memory for this ARC core is taken from the AHB SRAM area. Depending on
> the actual SoC a different ARC core is used:
> - Meson6 and earlier: some ARCv1 ISA based core (probably an ARC625)
> - Meson8 and later: an ARC EM4 (ARCv2 ISA) based core
> 
> Add the device-tree node for this remote-processor along with the
> required SRAM sections, clocks and reset-lines. Also use the
> SoC-specific compatible string to manage any differences (should
> they exist).
> 
> On Meson8, Meson8b and Meson8m2 the "secbus2" IO region is needed as
> some bits need to be programmed there. Add this IO region for those
> SoCs as well.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  arch/arm/boot/dts/meson.dtsi   |  7 +++++++
>  arch/arm/boot/dts/meson8.dtsi  | 21 +++++++++++++++++++++
>  arch/arm/boot/dts/meson8b.dtsi | 21 +++++++++++++++++++++
>  3 files changed, 49 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
> index e0ca5f08d07d..8bae6ed0abb2 100644
> --- a/arch/arm/boot/dts/meson.dtsi
> +++ b/arch/arm/boot/dts/meson.dtsi
> @@ -200,6 +200,13 @@ aobus: aobus@c8100000 {
>  			#size-cells = <1>;
>  			ranges = <0x0 0xc8100000 0x100000>;
>  
> +			ao_arc_rproc: remoteproc@1c {
> +				compatible= "amlogic,meson-mx-ao-arc";
> +				reg = <0x1c 0x8>, <0x38 0x8>;
> +				reg-names = "remap", "cpu";
> +				status = "disabled";
> +			};
> +
>  			ir_receiver: ir-receiver@480 {
>  				compatible= "amlogic,meson6-ir";
>  				reg = <0x480 0x20>;
> diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
> index 420324ea2ad7..157a950a55d3 100644
> --- a/arch/arm/boot/dts/meson8.dtsi
> +++ b/arch/arm/boot/dts/meson8.dtsi
> @@ -369,6 +369,14 @@ mux {
>  	};
>  };
>  
> +&ao_arc_rproc {
> +	compatible= "amlogic,meson8-ao-arc", "amlogic,meson-mx-ao-arc";
> +	amlogic,secbus2 = <&secbus2>;
> +	sram = <&ao_arc_sram>;
> +	resets = <&reset RESET_MEDIA_CPU>;
> +	clocks = <&clkc CLKID_AO_MEDIA_CPU>;
> +};
> +
>  &cbus {
>  	reset: reset-controller@4404 {
>  		compatible = "amlogic,meson8b-reset";
> @@ -496,6 +504,12 @@ mux {
>  };
>  
>  &ahb_sram {
> +	ao_arc_sram: ao-arc-sram@0 {
> +		compatible = "amlogic,meson8-ao-arc-sram";
> +		reg = <0x0 0x8000>;
> +		pool;
> +	};
> +
>  	smp-sram@1ff80 {
>  		compatible = "amlogic,meson8-smp-sram";
>  		reg = <0x1ff80 0x8>;
> @@ -631,6 +645,13 @@ &sdhc {
>  	clock-names = "clkin0", "clkin1", "clkin2", "clkin3", "pclk";
>  };
>  
> +&secbus {
> +	secbus2: system-controller@4000 {
> +		compatible = "amlogic,meson8-secbus2", "syscon";
> +		reg = <0x4000 0x2000>;
> +	};
> +};
> +
>  &sdio {
>  	compatible = "amlogic,meson8-sdio", "amlogic,meson-mx-sdio";
>  	clocks = <&clkc CLKID_SDIO>, <&clkc CLKID_CLK81>;
> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> index dbf7963b6c87..c02b03cbcdf4 100644
> --- a/arch/arm/boot/dts/meson8b.dtsi
> +++ b/arch/arm/boot/dts/meson8b.dtsi
> @@ -320,6 +320,14 @@ mux {
>  	};
>  };
>  
> +&ao_arc_rproc {
> +	compatible= "amlogic,meson8b-ao-arc", "amlogic,meson-mx-ao-arc";
> +	amlogic,secbus2 = <&secbus2>;
> +	sram = <&ao_arc_sram>;
> +	resets = <&reset RESET_MEDIA_CPU>;
> +	clocks = <&clkc CLKID_AO_MEDIA_CPU>;
> +};
> +
>  &cbus {
>  	reset: reset-controller@4404 {
>  		compatible = "amlogic,meson8b-reset";
> @@ -464,6 +472,12 @@ mux {
>  };
>  
>  &ahb_sram {
> +	ao_arc_sram: ao-arc-sram@0 {
> +		compatible = "amlogic,meson8b-ao-arc-sram";
> +		reg = <0x0 0x8000>;
> +		pool;
> +	};
> +
>  	smp-sram@1ff80 {
>  		compatible = "amlogic,meson8b-smp-sram";
>  		reg = <0x1ff80 0x8>;
> @@ -628,6 +642,13 @@ &sdhc {
>  	clock-names = "clkin0", "clkin1", "clkin2", "clkin3", "pclk";
>  };
>  
> +&secbus {
> +	secbus2: system-controller@4000 {
> +		compatible = "amlogic,meson8b-secbus2", "syscon";
> +		reg = <0x4000 0x2000>;
> +	};
> +};
> +
>  &sdio {
>  	compatible = "amlogic,meson8b-sdio", "amlogic,meson-mx-sdio";
>  	clocks = <&clkc CLKID_SDIO>, <&clkc CLKID_CLK81>;
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
