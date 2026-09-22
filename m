Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2D2552955
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 15:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091840; cv=none; b=D7xxAJXoNSOZHvEYuLYzo5qxtEUtawCHqMzLjd9REaXlOOUtqHTAQvOAZPq+0TCE5ghfBq9wiTer2hzoPJxGvtPFkQIr94+0NVpGpIXUSORj2SbdTUnQB1bxhK3UBR4eVSHol3XIEOp+35JhGMuMga/CyCSsxEAIoocpCU38X/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091840; c=relaxed/simple;
	bh=MPJa407hEU35uhm5nNbxl1o7nH1It+GZNahj267Ph9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6t9MK1hOi2ACRZJmmcYQDnscJOJk7us/FR0b/jrvLl/j5H5gNLqHPUIXzVXfNjVNE8BS644nCNL3xCMdT/uOmIycb2l2N8IaG8Z/gQVs+gWPiOJDT3OIBHwpTf0Oteinvl76/1wwEoqE8kiXAtF9pEE/4vlFlRsanFJ0d06OCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fs3qkBd0; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fs3qkBd0"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so29116a91.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 08:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790091836; x=1790696636; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M3+7e8iXJEjn74p0MvD+DqdSnpalQ9TYucgtTBbjy+c=;
        b=Fs3qkBd0zQ6ucr9QdRr/P75/EMkmrjSEbT5jRPu65SllB6psWZLuhEtIR8ipOit7A0
         dziV0+nGwg7V2nN1BC5p4jSOI6JqlJ4VhDCy1D2782OiNTCjIigPmBH3i1XdNxdsmN8v
         5TPnIzCBqfYbme/U6Y/AcKwZ8Pt2Rbu5OXLjLOQqF2vHaXs1YGGMYeaFIF4yHYcwiM6/
         SRIu8soPC7WwSEWc5AhWiIfOVfx5gdDTpchEwtevZGmhoCWU85RyAF/G3fg11L+RGdzC
         HZ9ky1Whz7rypN6AsszTu2oEE8qqHHmBZqmbfEUWLFH/fV/edyaoBSBbClCQBE+xiVbE
         C8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091836; x=1790696636;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M3+7e8iXJEjn74p0MvD+DqdSnpalQ9TYucgtTBbjy+c=;
        b=yfBrFtw8aQIap4C/eOVpw//d+ajGUpjPYeiOp5LKbK6JVSW/eZqOv/QLnggozzeVId
         QwE0fEhLuYt1uDCuZsdQUL5/G1WbUb91BxST6RGi0RF60xpASCymZ3rju94bw2aA9Uxh
         kxwsAflHL9aX3sv+VGe7Gk6kiVvWlP9CEYUfkvNX2Vbochb2dvIu6Lqwm0oYJyffM2ZX
         4OGjh3lFdkbLrVJVNxT6rwCPWyDVGEr3wqY+DHOWzWIM8mbYUB8AmgABS2jt5PkLrq3S
         ACJumXLttIZAX5qAn1w/EhWR1gfuO+HN7mgHt4ksh7Q1ePoT04184wDjZjWhcZqiaoFy
         GGTg==
X-Forwarded-Encrypted: i=1; AKwUvBz26Ep6/vea1GdHUJ2Tvpnar2Y/qiR4Dm5VVWgCd14xfWnbNxhmcBKlD1mStdY+W2JgrUzgAkuVwSp7SoW5BJBr@vger.kernel.org
X-Gm-Message-State: AFuF++mJIgzOcbhYVfNV7XZaZ3s4E4gcx0kRAZprvCVt9mXncqYsjBP5
	iC0jRrEniIWAV8CxAJDhIKBIv7J0zraMWQ658ds1gNPaoinn/7opwDqA1l/l1lzONTo=
X-Gm-Gg: AYBFou1fPTElhISOwtUYNA7Cm+TjloEWvkCdRKCktVPwxKVX6UoWWadTZ98CNhT6HCy
	/5JBh4J+O+iaKyLqdzowcE/WifSEmHXhR7UYTqXAPzJJlGJdBIWmbEqwWGo+Z+QE4NxcVMAbHLK
	ikhX/93azkirGub+vIr9o2mwh5GSDsubB+vEYZ0tXEcBFzv/kKeHGvciR/CSXH9BdrcaaAYU7Kk
	lXNBg3ewJITKshJeEYB92M0JuMb6YyEc2VoCG6DzEtDECR7r4W18ks/z5plkYMfGSKVeMjDI7OB
	ygjJaIotA4rt243EqcRko2iJWAmMPlTnGaiNhrOwyVPJglD7h37/DO0UnytP3/eKPSMnbjUVKGY
	GXFZ7Te+ZlXfM/9yYsnAUOftmDe5TdC9Y+J2rwG4PP2VPjOFH7lRcZihhU/NBBIjmaAolOIfGnz
	NtxlAo+2lv21Xi+Up2wSzbU1CjlW4k9E9NUMabl3ZItRPNoGwydHCrSSiOmhMFfcZcy0tKcxU9c
	GW2m/M/28c=
X-Received: by 2002:a17:90b:1d48:b0:39d:efa9:cd25 with SMTP id 98e67ed59e1d1-3a07306c5d9mr1633442a91.2.1790091835796;
        Tue, 22 Sep 2026 08:43:55 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1046:ab8:737c:d2e2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dbf69f0sm34882a91.8.2026.09.22.08.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:43:55 -0700 (PDT)
Date: Tue, 22 Sep 2026 09:43:52 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, virtualization@lists.linux.dev,
	imx@lists.linux.dev, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 12/12] PoC: arm64: dts: imx93-11x11-frdm: add
 multiple vdevs
Message-ID: <arKiOCGrWAKyc-bc@p14s>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-12-dac8c5eb4aa9@valla.it>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-remoteproc_virtio_map-v1-12-dac8c5eb4aa9@valla.it>

On Wed, Sep 16, 2026 at 11:10:57PM +0200, Francesco Valla wrote:
> Add rings for multiple vdevs, as well as the required virtio nodes for
> I2C, SPI and GPIO functionalities. On top of that, add example
> peripherals using all of them.
> 
> NOTE: this is a Proof-Of-Concept, not meant to be integrated!
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 128 +++++++++++++++++++--
>  1 file changed, 119 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> index bd14ba28690c..dfa3b122ac5f 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> @@ -53,6 +53,32 @@ button-k3 {
>  		};
>  	};
>  
> +	gpio-keys-virtio {
> +		compatible = "gpio-keys-polled";
> +		poll-interval = <100>;
> +
> +		button-v1 {
> +			label = "Button V1";
> +			linux,code = <BTN_3>;
> +			gpios = <&v_gpio 23 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		button-v2 {
> +			label = "Button V2";
> +			linux,code = <BTN_4>;
> +			gpios = <&v_gpio 24 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led {
> +			gpios = <&v_gpio 18 GPIO_ACTIVE_HIGH>;
> +			label = "LED V";
> +		};
> +	};
> +
>  	reg_usdhc2_vmmc: regulator-usdhc2 {
>  		compatible = "regulator-fixed";
>  		off-on-delay-us = <12000>;
> @@ -89,11 +115,6 @@ linux,cma {
>  			linux,cma-default;
>  		};
>  
> -		rsc_table: rsc-table@2021e000 {
> -			reg = <0 0x2021e000 0 0x1000>;
> -			no-map;
> -		};
> -

Why is the resource table removed?  There is no mention of that in the
changelog...

>  		vdev0vring0: vdev0vring0@a4000000 {
>  			reg = <0 0xa4000000 0 0x8000>;
>  			no-map;
> @@ -105,12 +126,42 @@ vdev0vring1: vdev0vring1@a4008000 {
>  		};
>  
>  		vdev1vring0: vdev1vring0@a4010000 {
> -			reg = <0 0xa4010000 0 0x8000>;
> +			reg = <0 0xa4010000 0 0x1000>;
> +			no-map;
> +		};
> +
> +		vdev2vring0: vdev2vring0@a4011000 {
> +			reg = <0 0xa4011000 0 0x2000>;
> +			no-map;
> +		};
> +
> +		vdev2vring1: vdev2vring1@a4013000 {
> +			reg = <0 0xa4013000 0 0x2000>;
> +			no-map;
> +		};
> +
> +		vdev3vring0: vdev3vring0@a4015000 {
> +			reg = <0 0xa4015000 0 0x2000>;
> +			no-map;
> +		};
> +
> +		vdev4vring0: vdev4vring0@a4017000 {
> +			reg = <0 0xa4017000 0 0x4000>;
> +			no-map;
> +		};
> +
> +		vdev5vring0: vdev5vring0@a401B000 {
> +			reg = <0 0xa401B000 0 0x2000>;
> +			no-map;
> +		};
> +
> +		vdev5vring1: vdev5vring1@a401D000 {
> +			reg = <0 0xa401D000 0 0x2000>;
>  			no-map;
>  		};
>  
> -		vdev1vring1: vdev1vring1@a4018000 {
> -			reg = <0 0xa4018000 0 0x8000>;
> +		vdev5vring2: vdev5vring2@a401F000 {
> +			reg = <0 0xa401F000 0 0x1000>;
>  			no-map;
>  		};
>  
> @@ -149,8 +200,67 @@ &cm33 {
>  		 <&mu1 3 1>;
>  	mbox-names = "tx", "rx", "rxdb";
>  	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> -			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
> +			<&vdev1vring0>, <&vdev2vring0>, <&vdev2vring1>,
> +			<&vdev3vring0>, <&vdev4vring0>,
> +			<&vdev5vring0>, <&vdev5vring1>, <&vdev5vring2>;

Who is using vdev5 vrings?  

>  	status = "okay";
> +
> +	virtio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		vdev@2 {
> +			reg = <2>;
> +
> +			v_gpio: gpio {
> +				compatible = "virtio,device29";
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +			};
> +		};
> +
> +		vdev@3 {
> +			reg = <3>;
> +
> +			i2c {
> +				compatible = "virtio,device22";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				eeprom@50 {
> +					compatible = "atmel,24c1025";
> +					reg = <0x50>;
> +				};
> +			};
> +		};
> +
> +		vdev@4 {
> +			reg = <4>;
> +
> +			spi {
> +				compatible = "virtio,device2d";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				sram@0 {
> +					compatible = "microchip,mchp23k256";
> +					reg = <0>;
> +					spi-max-frequency = <20000000>;
> +				};
> +
> +				lcd@1 {
> +					compatible = "adafruit,yx240qv29", "ilitek,ili9341";
> +					reg = <1>;
> +					spi-max-frequency = <10000000>;
> +					dc-gpios = <&v_gpio 21 GPIO_ACTIVE_HIGH>;
> +					reset-gpios = <&v_gpio 20 GPIO_ACTIVE_HIGH>;
> +					rotation = <90>;
> +				};
> +			};
> +		};
> +	};
>  };
>  
>  &eqos {
> 
> -- 
> 2.55.0
> 
