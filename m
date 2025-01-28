Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146C51DDC22
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jan 2025 08:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738051545; cv=none; b=L+5I6IPH0n6HX/qC/+fSlLnbiXE+Vj0yce6C5SnE+0IWlNAvUm9DEmBCY9ukSVEdMS6E95c3GdIOye9jiCqvsStdNxnwaEqcX3RbfQ39kRCZs+7+8DFkt6pPwbtTYTzR5GtNJtZRfxBHibXBg3qOmcY3KdLMM5utJCb9Kesy4Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738051545; c=relaxed/simple;
	bh=Q0YF0DVZeFVEE1vVCuvD4EYSrmuqlryjxIBMgxE8T2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKb3kRSKqxv0Pbul2jlR6eX32XjnJHkxY21xjY4Q0rV0pydbxFLQgE6q08chvPJPEjfUxH2YYNwBbhSrTys6DLCYK3iOAbz8BU/Qv4MAmaPTauwThlxwCDotii+0VBwhmLlkwQH7ypq+lLwSN/w7OgZZHgMNYL6aGAsBj+4VSmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gsv2se+q; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gsv2se+q"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361f796586so57989205e9.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jan 2025 00:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738051541; x=1738656341; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qEMfYzXmSLIgnMJtxwb+i6Gd8d/iSboKcUt4HSkm4vw=;
        b=gsv2se+qhy/112hYZDKgd5EDkOr8F4BBLakH2jhMiA6UQzjRw9XiYMrOUuUDaMQ9Y3
         RptUlttdNbH+Gg7ih/4N1XYfFNlB8aXzmBXh429dOOaMxrcGfjnBpS8qlYrlHOa6wFx1
         obS4FCUo8owNau6u/Tyog+VERxUJOv+CudOXIh/iQ83Z1iRYJS+kcnEWltSNXC8rLTG8
         PTgoBv9wMYQ/gqbjZ+N/NXwqY0dYx3FycemQrbwI0L61aWmfWqciPKNT6tGxeFJZGD3h
         VJy8k1Z9b9kdGSpTBINcYQoU2ulz+IBoajFzHcP+zWANpC3ey4hPypJpueaBeHa76/2S
         FSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738051541; x=1738656341;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qEMfYzXmSLIgnMJtxwb+i6Gd8d/iSboKcUt4HSkm4vw=;
        b=VzrkLkhKdaLf0+0jsNf/JhpGfC4n+B4v42hgYpGJgT5t5dgvtc92qedSvvDpsfxXz0
         hLcXKyNJic9Sb/qOTisH2zZx9Qfrr9NczDcuZUu7dcdLlWclj+DqT8tez+aA/6royDvc
         KKuk9YLV3gfl/A9DuTuP0+WoQ4RHvYCF5TU+olTSR3jn/KGANnuL1Wx8u2YWSTRymUsh
         70JUgZBqrlufxErtF/AYS6D+gVvVdbzbrDE7EYYevtEWZc54Bh1JbfhPJrSBF093iXVt
         LmsA6LsnxOh9J19TIRLbjoD9gGXaoOvPvxI0Y+Fl0HzfhbQsHDFRDp2pP7UaeZ4U+Dqs
         2zoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLorRPBOlGeEgFD9EtnCAgxPfi99cNgYTeJF98VQ5Gub2mkvck8p46iBGwnDrjMfWX9gRz/JJFUcgvKWSyDOve@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnp2Vxqb4gUI0pTyMUH89K/+eKgqPnYyPucoQXjIoFvDSR9SjT
	YNYIQC8yKDBOTLc3W5/aBlS5QzYOQHBV/XIbDMo8ATqSqn1FsJc0mS8Jl+cDaXI=
X-Gm-Gg: ASbGncujvAkzQ3mTQGxx9EDc/ikqEJKwaRIZ2J+TZ71SZOwcvI0xhi5pgoOTRRZvqgF
	Q5D9/CyXzGYvZhtab7yozP2IknnVQ+dno/SJ+ByKSX4P0I09+kE+O1X3PW+8GHzkkbetVOclJxk
	OdjMQMdyKxyb3bspWIAXr6uQAyTUZDiUX4UVf2DPGr6cGSdwYmDmZXntgNlcT761b5wGKIbY2/T
	r90nmsuTeT9HZaoZ6vWQcX0EJvQt5Ncxc9Q6hnfAYqIwtg8l0/DtlO9YtOuhdxhM/attdduBzNj
	2I72+8XpMf3z+dMs/7FwMWCFNEM=
X-Google-Smtp-Source: AGHT+IEUh1KxWHB9u86+B2/y74R2MigmbSK1pRU1jrbd6wN67RRwueEsOCnR5xhqWQ9cL9gUplaNNg==
X-Received: by 2002:a05:600c:8712:b0:434:a802:e9a6 with SMTP id 5b1f17b1804b1-438913ce0b7mr434865235e9.7.1738051541203;
        Tue, 28 Jan 2025 00:05:41 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:3210:3bfd:4b47:59da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd507fe8sm157336445e9.24.2025.01.28.00.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 00:05:40 -0800 (PST)
Date: Tue, 28 Jan 2025 09:05:38 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Matti =?iso-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/13] ARM: dts: qcom: msm8226: Add modem remoteproc
 node
Message-ID: <Z5iP0nEm3P1RhLUu@linaro.org>
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
 <20250127-msm8226-modem-v3-9-67e968787eef@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250127-msm8226-modem-v3-9-67e968787eef@lucaweiss.eu>

On Mon, Jan 27, 2025 at 11:45:41PM +0100, Luca Weiss wrote:
> Add a node for the modem remoteproc found on MSM8226.
> 
> Co-developed-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

> ---
>  .../dts/qcom/qcom-apq8026-samsung-milletwifi.dts   |  2 +
>  .../qcom/qcom-msm8226-samsung-matisse-common.dtsi  |  6 +-
>  arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           | 82 ++++++++++++++++++++++
>  arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts  |  2 +
>  4 files changed, 90 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dts b/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dts
> index 7d519156d91d156d801c477711751aba66cc3224..a8543ca7b5569549418683b6be320784eba1768c 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dts
> @@ -12,6 +12,8 @@
>  #include "pm8226.dtsi"
>  
>  /delete-node/ &adsp_region;
> +/delete-node/ &mba_region;
> +/delete-node/ &mpss_region;
>  /delete-node/ &smem_region;
>  
>  / {
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
> index a15a44fc0181bf23e7531ecdc8978505ca48189d..fbd568c7d6b7415d240aa1a2329d07cf9135274c 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-matisse-common.dtsi
> @@ -8,6 +8,8 @@
>  #include "pm8226.dtsi"
>  
>  /delete-node/ &adsp_region;
> +/delete-node/ &mba_region;
> +/delete-node/ &mpss_region;
>  /delete-node/ &smem_region;
>  
>  / {
> @@ -145,12 +147,12 @@ framebuffer@3200000 {
>  			no-map;
>  		};
>  
> -		mpss@8400000 {
> +		mpss_region: mpss@8400000 {
>  			reg = <0x08400000 0x1f00000>;
>  			no-map;
>  		};
>  
> -		mba@a300000 {
> +		mba_region: mba@a300000 {
>  			reg = <0x0a300000 0x100000>;
>  			no-map;
>  		};
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
> index 7e0838af6c2d0dc26e0082471b70578bc627491d..55bb070dcf489064f5b14902da1acd2762232ef9 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8226.dtsi
> @@ -213,6 +213,18 @@ smem_region: smem@3000000 {
>  			no-map;
>  		};
>  
> +		mpss_region: mpss@8000000 {
> +			reg = <0x08000000 0x5100000>;
> +			no-map;
> +			status = "disabled";
> +		};
> +
> +		mba_region: mba@d100000 {
> +			reg = <0x0d100000 0x100000>;
> +			no-map;
> +			status = "disabled";
> +		};
> +
>  		adsp_region: adsp@dc00000 {
>  			reg = <0x0dc00000 0x1900000>;
>  			no-map;
> @@ -253,6 +265,31 @@ adsp_smp2p_in: slave-kernel {
>  		};
>  	};
>  
> +	smp2p-modem {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <435>, <428>;
> +
> +		interrupt-parent = <&intc>;
> +		interrupts = <GIC_SPI 27 IRQ_TYPE_EDGE_RISING>;
> +
> +		mboxes = <&apcs 14>;
> +
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <1>;
> +
> +		modem_smp2p_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		modem_smp2p_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
>  	smsm {
>  		compatible = "qcom,smsm";
>  		#address-cells = <1>;
> @@ -879,6 +916,51 @@ spmi_bus: spmi@fc4cf000 {
>  			#interrupt-cells = <4>;
>  		};
>  
> +		modem: remoteproc@fc880000 {
> +			compatible = "qcom,msm8226-mss-pil";
> +			reg = <0xfc880000 0x100>,
> +			      <0xfc820000 0x020>;
> +			reg-names = "qdsp6", "rmb";
> +
> +			interrupts-extended = <&intc GIC_SPI 24 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack";
> +
> +			clocks = <&gcc GCC_MSS_Q6_BIMC_AXI_CLK>,
> +				 <&gcc GCC_MSS_CFG_AHB_CLK>,
> +				 <&gcc GCC_BOOT_ROM_AHB_CLK>,
> +				 <&xo_board>;
> +			clock-names = "iface", "bus", "mem", "xo";
> +
> +			resets = <&gcc GCC_MSS_RESTART>;
> +			reset-names = "mss_restart";
> +
> +			power-domains = <&rpmpd MSM8226_VDDCX>;
> +			power-domain-names = "cx";
> +
> +			qcom,ext-bhs-reg = <&tcsr_regs_1 0x194>;
> +			qcom,halt-regs = <&tcsr_regs_1 0x180 0x200 0x280>;
> +
> +			qcom,smem-states = <&modem_smp2p_out 0>;
> +			qcom,smem-state-names = "stop";
> +
> +			memory-region = <&mba_region>, <&mpss_region>;
> +
> +			status = "disabled";
> +
> +			smd-edge {
> +				interrupts = <GIC_SPI 25 IRQ_TYPE_EDGE_RISING>;
> +
> +				mboxes = <&apcs 12>;
> +				qcom,smd-edge = <0>;
> +
> +				label = "modem";
> +			};
> +		};
> +
>  		tcsr_mutex: hwlock@fd484000 {
>  			compatible = "qcom,msm8226-tcsr-mutex", "qcom,tcsr-mutex";
>  			reg = <0xfd484000 0x1000>;
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
> index 3037344eb24055071cc77c9cfce0f1d0f95de921..18396623a91dd4bf4b66f01c1d983c391722f3b5 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
> @@ -9,6 +9,8 @@
>  #include "pm8226.dtsi"
>  
>  /delete-node/ &adsp_region;
> +/delete-node/ &mba_region;
> +/delete-node/ &mpss_region;
>  /delete-node/ &smem_region;
>  
>  / {
> 
> -- 
> 2.48.1
> 
