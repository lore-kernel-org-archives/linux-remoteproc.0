Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB47496D59
	for <linux-remoteproc@vger.kernel.org>; Wed, 23 Sep 2026 15:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178551; cv=none; b=BfTIW1iVFGTiRiBlTwKjrDK9ecBX96YdrGzBq4mp72+3NG+s/vefM3cB/+UuqTqL2p2gf+4V3IwmiEd38Mw0RoHuWKV++KIiB1xgDCsoK8luFGQTWof3pzVRqruYOuhT2v8BjvLOWaba+GFwR24vdbAAiILn1/6J2hJoA5KDzSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178551; c=relaxed/simple;
	bh=D7cyQBV9qs11eHhXM8csmYcI53GAL/ttmttLP1deXns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6ek4QraEX3Ms8ODOMamhzqc+VTBJfZSXBzOAORZ5ep9Ur+UZCTnEy65nBwmfc5/LXLv7rob1Kd0eL0GjRc/yjFFvp+hoEndseQ68DOGzi9V5idQM4ePDVRDm3UvVbJhwD/kpWlSDLPUKn6qCSPy7OI/QXA4qDlT6ByoBHCV+tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XZv55R1l; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XZv55R1l"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ef15d3so146799066b.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Sep 2026 08:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790178547; x=1790783347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AC1V7c4WU6arvaHg1fiICTCR6GKg0EaeyLEpLHxpNDY=;
        b=XZv55R1lpsNiAARSNYFtDYe+86tS/CF5jhSgsGMGbzqIkrZ/DtPsTMdmeams0N7wEU
         qBjq95Se3/8Z6a2JLHMj/O19d2fjEYRZ6EXohJ7FGZ+ALQZNdOGBbLoEjpU4DY/8mAwC
         K4jn3l6eBrHXpV1AiMjz8n8x00Yjv9cmM9GT/FigaVg4xCRktR4Mn2ZuWoC/VdsIXhTc
         /M+xhWmrdSR9X2X4VhCd61Od5HJ324qhjV0c2sF0UJzJTvojaH+qdF/+OwN2MynCuZvZ
         k2Ar076Esrg8OhQHIb8XEu+lRcMGZRneOmPtjG6NYayKBna9Gb9r+Akyz3JS0x+mqT7i
         flSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178547; x=1790783347;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AC1V7c4WU6arvaHg1fiICTCR6GKg0EaeyLEpLHxpNDY=;
        b=1v6WuS2yL/du1qanuAoV49QBYqXb75bMX/q5Tb5KNNVeaqsoGE8atnjdO0NA5gNUB4
         Xg9+jFUCgMEyvK6u9wsa+cPkGOnpdYckRVS/TB0RsjC1beUYfOjcIVxoFTlxichjtoE5
         vPp3lD/F9eIlZK5sKKoAuJrvITzA+H3VpZUGeSbr9HyKQYSliSn4dil9+B1zvfErkcam
         WJebjMgoAoLyq3+M3UDjofQP4xEX7xVMO6JTJgSeYzWHYZPWs+7Nm0g9JxeUDw/wtCdj
         XriZcitX842fWp6f+6elzvt42uQP5GTtP32SvbfhhLeHq6LJfA/OOzbmK5E00dipFkDo
         +QVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmd0qQFLp4xLAA60+fSQRZV8PSvPAQGjMjI9lor1ec0T6aLAhIoUgL1j242KVU08hdI4JYfvUoMgIjoQRxDnwR@vger.kernel.org
X-Gm-Message-State: AFuF++lDjyujqnQ91pqQWNDjZ9o/ejCuKIfAoF777WpGjaL5boYDRQ1+
	nav4HmA/njOL2iorj3CJ8CHgEwSXhDKbR53oh+EYltgvctBaiOmn3JcDXrr6Fp2DLho=
X-Gm-Gg: AYBFou3hA+YOGl5/5VV2CTkpIHxyuOt5j+xVQaHm48SuBz3WdHMYv27RePoYX8rCVdn
	5nBVhJPaolOG2D3kGUCS1uxUkpARpP8JbsaZwRYAqK440+YQPKM+uCgrTa0Bb42UQyYlqxiDKTL
	gljVAMct0LG9AFMH5r+BXv+933G6hHnhQmWkJxYXBj6RFkMhUayZ5HFJXgO4ZFJhtzsRVoHW8W8
	WazZdISTku5eWEtMMbfmhZFQSLzDizEDkJWc92At+aHazsXDEs051mFvCTa5Y+myy/7Q0pXqajW
	NfE86OATgDJUTNFyNehyE8OSv5cmN4e7zb6aoz69YL7erbCpk0rxgPTeuu7mrXPNhOXD5Jatfuy
	Gl7XgMrGvaBKyopPdKA9Oqm6GenLHv/V+7mMlp9bsVdBuxNvs+12YWYlURZQt4Y+jjZDBqzqzU6
	DbF3NWbpGDtPLvgT3Z2BVQoQnB96RTfeZ/vd6jgagyfUul+ScGruv1Chg+mermgczpLnTkoLM=
X-Received: by 2002:a17:907:c02:b0:c25:c67d:53cc with SMTP id a640c23a62f3a-c2aadeb4e22mr229458566b.8.1790178546725;
        Wed, 23 Sep 2026 08:49:06 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b4a:dc6a:68e:2592])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae687318sm152318266b.44.2026.09.23.08.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:49:06 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:48:58 -0600
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
Message-ID: <arP06mWDehsIDh5s@p14s>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-12-dac8c5eb4aa9@valla.it>
 <arKiOCGrWAKyc-bc@p14s>
 <arLawAw6kgFT2e0W@bywater>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arLawAw6kgFT2e0W@bywater>

On Tue, Sep 22, 2026 at 10:19:48PM +0200, Francesco Valla wrote:
> On Tue, Sep 22, 2026 at 09:43:52AM -0600, Mathieu Poirier wrote:
> > On Wed, Sep 16, 2026 at 11:10:57PM +0200, Francesco Valla wrote:
> > > Add rings for multiple vdevs, as well as the required virtio nodes for
> > > I2C, SPI and GPIO functionalities. On top of that, add example
> > > peripherals using all of them.
> > > 
> > > NOTE: this is a Proof-Of-Concept, not meant to be integrated!
> > > 
> > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 128 +++++++++++++++++++--
> > >  1 file changed, 119 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> > > index bd14ba28690c..dfa3b122ac5f 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> > > +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> > > @@ -53,6 +53,32 @@ button-k3 {
> > >  		};
> > >  	};
> > >  
> > > +	gpio-keys-virtio {
> > > +		compatible = "gpio-keys-polled";
> > > +		poll-interval = <100>;
> > > +
> > > +		button-v1 {
> > > +			label = "Button V1";
> > > +			linux,code = <BTN_3>;
> > > +			gpios = <&v_gpio 23 GPIO_ACTIVE_LOW>;
> > > +		};
> > > +
> > > +		button-v2 {
> > > +			label = "Button V2";
> > > +			linux,code = <BTN_4>;
> > > +			gpios = <&v_gpio 24 GPIO_ACTIVE_LOW>;
> > > +		};
> > > +	};
> > > +
> > > +	leds {
> > > +		compatible = "gpio-leds";
> > > +
> > > +		led {
> > > +			gpios = <&v_gpio 18 GPIO_ACTIVE_HIGH>;
> > > +			label = "LED V";
> > > +		};
> > > +	};
> > > +
> > >  	reg_usdhc2_vmmc: regulator-usdhc2 {
> > >  		compatible = "regulator-fixed";
> > >  		off-on-delay-us = <12000>;
> > > @@ -89,11 +115,6 @@ linux,cma {
> > >  			linux,cma-default;
> > >  		};
> > >  
> > > -		rsc_table: rsc-table@2021e000 {
> > > -			reg = <0 0x2021e000 0 0x1000>;
> > > -			no-map;
> > > -		};
> > > -
> > 
> > Why is the resource table removed?  There is no mention of that in the
> > changelog...
> >
> 
> You are obviously right, the commit message here should have been a
> poem, not a form of hermetic poetry. My bad.
> 
> The resource table here is causing problems with how Zephyr is managing
> it at its side. If it is kept in a separate memory location and copied
> there at runtime by the remote processor firmware during its startup
> (which is the current Zephyr behavior), then there might be a race
> condition when the aforesaid firmware is loaded and started by Linux
> *and* at least one of the vdev drivers (here including rpmsg_bus) is
> built-in. In this case, the copy of the resource table done by the
> remote processor might - depending on the async execution of the two
> processors - overwrite the status bit set by the Linux driver:
> 
>   Firmware load and startup (echo start > /sys/.../state)
>                            |
> 			   |
> 			   V
>   The vdev devices get registered (by register_virtio_device())
>                            |
> 			   |
> 			   V
>   If a driver is built-in, it probes and sets the vdev status
>   inside the resource table @rsc-table.
>                            .
> 			   . (in the mean time)
> 			   .
>   The remote processor starts up and copies the resource table from its
>   dedicated section to @rsc-table.
> 
> Depending on the system load and the complexity of the firmware, the two
> operations can happen in whatever sequence, causing a race condition.

This would happen regardless of this patchset.

> 
> This is somewhat masked if vdev drivers are built as modules, as the
> devices does not probe immediately but only after the modules have been
> loaded, giving the remote processor time to start. Note that this is not
> a solution! but a workaround.
> 
> If the rsc-table node is not there, the startup logic falls back to the
> classic rproc_elf_find_loaded_rsc_table().

We can't remove @rsc-table to make a problem go away.  

> 
> This is specific to i.MX platforms [1] and is probably not normally an
> issue because - as stated in [1] - the offical SDK from NXP seems not
> to check the status inside the resource table.
> 
> > >  		vdev0vring0: vdev0vring0@a4000000 {
> > >  			reg = <0 0xa4000000 0 0x8000>;
> > >  			no-map;
> > > @@ -105,12 +126,42 @@ vdev0vring1: vdev0vring1@a4008000 {
> > >  		};
> > >  
> > >  		vdev1vring0: vdev1vring0@a4010000 {
> > > -			reg = <0 0xa4010000 0 0x8000>;
> > > +			reg = <0 0xa4010000 0 0x1000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		vdev2vring0: vdev2vring0@a4011000 {
> > > +			reg = <0 0xa4011000 0 0x2000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		vdev2vring1: vdev2vring1@a4013000 {
> > > +			reg = <0 0xa4013000 0 0x2000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		vdev3vring0: vdev3vring0@a4015000 {
> > > +			reg = <0 0xa4015000 0 0x2000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		vdev4vring0: vdev4vring0@a4017000 {
> > > +			reg = <0 0xa4017000 0 0x4000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		vdev5vring0: vdev5vring0@a401B000 {
> > > +			reg = <0 0xa401B000 0 0x2000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		vdev5vring1: vdev5vring1@a401D000 {
> > > +			reg = <0 0xa401D000 0 0x2000>;
> > >  			no-map;
> > >  		};
> > >  
> > > -		vdev1vring1: vdev1vring1@a4018000 {
> > > -			reg = <0 0xa4018000 0 0x8000>;
> > > +		vdev5vring2: vdev5vring2@a401F000 {
> > > +			reg = <0 0xa401F000 0 0x1000>;
> > >  			no-map;
> > >  		};
> > >  
> > > @@ -149,8 +200,67 @@ &cm33 {
> > >  		 <&mu1 3 1>;
> > >  	mbox-names = "tx", "rx", "rxdb";
> > >  	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> > > -			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
> > > +			<&vdev1vring0>, <&vdev2vring0>, <&vdev2vring1>,
> > > +			<&vdev3vring0>, <&vdev4vring0>,
> > > +			<&vdev5vring0>, <&vdev5vring1>, <&vdev5vring2>;
> > 
> > Who is using vdev5 vrings?  
> > 
> 
> Another thing that should have been in the commit message. Vdevs are
> defined, in the Zephyr application I am using as PoC, as follows:
> 
>  - vdev0: RPMSG (tx and rx vrings)

To be backward compatible, there has to be a way to make vdev0 defaulting to
RPMSG.  It would also be nice if bindings were define for RPMSG so that it can
show up in the list of remoteproc-virtio devices like i2c, gpio and others.


>  - vdev1: entropy (single request vring)
>  - vdev2: GPIO (request and event vrings)
>  - vdev3: I2C (single request vring)
>  - vdev4: SPI (single request vring)
>  - vdev5: CAN (tx, rx and control vrings)
> 
> vdev5 is not represented inside the devicetree because the can-virtio
> driver registers a single CAN network device and has thus no need for
> such representation.

Then why is it part of the remoteproc's memory-regions?

> 
> > >  	status = "okay";
> > > +
> > > +	virtio {
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > > +
> > > +		vdev@2 {
> > > +			reg = <2>;
> > > +
> > > +			v_gpio: gpio {
> > > +				compatible = "virtio,device29";
> > > +				gpio-controller;
> > > +				#gpio-cells = <2>;
> > > +				interrupt-controller;
> > > +				#interrupt-cells = <2>;
> > > +			};
> > > +		};
> > > +
> > > +		vdev@3 {
> > > +			reg = <3>;
> > > +
> > > +			i2c {
> > > +				compatible = "virtio,device22";
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +
> > > +				eeprom@50 {
> > > +					compatible = "atmel,24c1025";
> > > +					reg = <0x50>;
> > > +				};
> > > +			};
> > > +		};
> > > +
> > > +		vdev@4 {
> > > +			reg = <4>;
> > > +
> > > +			spi {
> > > +				compatible = "virtio,device2d";
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +
> > > +				sram@0 {
> > > +					compatible = "microchip,mchp23k256";
> > > +					reg = <0>;
> > > +					spi-max-frequency = <20000000>;
> > > +				};
> > > +
> > > +				lcd@1 {
> > > +					compatible = "adafruit,yx240qv29", "ilitek,ili9341";
> > > +					reg = <1>;
> > > +					spi-max-frequency = <10000000>;
> > > +					dc-gpios = <&v_gpio 21 GPIO_ACTIVE_HIGH>;
> > > +					reset-gpios = <&v_gpio 20 GPIO_ACTIVE_HIGH>;
> > > +					rotation = <90>;
> > > +				};
> > > +			};
> > > +		};
> > > +	};
> > >  };
> > >  
> > >  &eqos {
> > > 
> > > -- 
> > > 2.55.0
> > >
> 
> Thank you!
> 
> Regards,
> Francesco
> 
> 
> [1] https://lore.kernel.org/all/20240719-imx_rproc-v2-2-10d0268c7eb1@nxp.com/
