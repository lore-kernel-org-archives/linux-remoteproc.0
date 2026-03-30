Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD5D3290AF
	for <linux-remoteproc@vger.kernel.org>; Mon, 30 Mar 2026 14:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774882588; cv=none; b=gO7O6SZzhCaBl6GdtKwTow98Xmetg8fwjk/uZVVr34Psb2iJoSrlEF6swE6v+jwxO3e/X+sb7t+Zr+9NCy+eMTEOw8M7piHvQKIEB+NpLdTESJm+vRTG2fxfoAnA4Ry+yPKLMJ7FCBoOErtefb2Lli6wFA1Ya2XB2TkdZq3kJcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774882588; c=relaxed/simple;
	bh=srhtjV8OPQAa52pA6qgonit5rjCWp8J+Uu2JBmWEGk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSWyTzBCmcSlpaEna6tg0y7X6Kw9GhENR3xkwHxMR9DXhZ1jf7YCq8lTh27o0rnzov+Mf9Ot3pre9tyuAQrab6F2knY5n3VQpXhA9v8lK7mCTvNXhZN4iV8h9MQkgWDgVEm33yk7tUROAvaxeVEipuu/Ahm5UFKlAXRWN3fiW0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nljEApm+; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nljEApm+"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82ae378fff8so2903556b3a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Mar 2026 07:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774882586; x=1775487386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UOF3McKorP7VTGh3x2yrLA4/BnIsjXMpRz4887A+PYk=;
        b=nljEApm+ujlyRcHjOxUKB1g7AZI0bxl+Ou85vKKeZ8XH+/njpsSgvxOZ5XSRuVetEh
         TWpGJzBp5ShdHD3AuPQ/6qsqaBzHCj6k3fnAoUixLthyvnIyRgOAjGR2bilJLU1wdeh1
         MXzhcBEUteQLRqk2zcj/Q6SGBcEBEz5RcTJ5d6GhxUOqIAY55RKAERjnFRa8S5r0XkG8
         DoyQHM5dcPAfN+7T0ThWfgJ9MSQmasAs8POIwz4muFiSv42K9RKW6i3lOHaGkEHMJ4FB
         FNYuZK4dYh6MOr2P4R3piDM37EIIfWuZs6Ni13a7iTxghJJQ9PxgcqPzUuOkoP9AymjQ
         jiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774882586; x=1775487386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOF3McKorP7VTGh3x2yrLA4/BnIsjXMpRz4887A+PYk=;
        b=cRBdIOioAiVrWmsocgV+Nl4R29miW1T72Jh+XUKf0+yyPWHx/lS37psUoMo5Fbm3EL
         gMN+KTYHjBX7KbAcJh3QuOF4H/YdXMjdmX2bwT3GbPxypKdnr6EsYUNzk2emXMhLwHNr
         Gfvsvqk+VdHV9D3gNdQNFhW4M60CLC0q/h4XWq+1y46ROwER10gVp1GDt0OQEb2aIVA4
         3RiE85CEb2/hpqujafm9EF1LBRrbrTRSyo5Qslkz1gu4n0LY6HID0kDa01jGlY/i7imm
         NXf9RHFnYLSS20US7ylSNuqVl2hyX9rAgsNZK1M75V0aI9zIP2gyERJhbtXmz6aH2YR5
         DMqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7/ApMkSu93iU2Wusfc5unGWbZnOtcVBw7ZlvSZPeSG9CQXt2lVq8+zmcFx3Uz/VPDfjMNyyUB6Ziky645QCM3@vger.kernel.org
X-Gm-Message-State: AOJu0YzBdFR2AK0TSH1bFkFlGgXuLbNVt0e3wvzUyiBk+BEyrv3Jimro
	Jyxf6jzHK6K3b2Ds2Z6FWL7jOIIBxK/0yttOOQFknXva6waJrWOgTM3KnWoX/kBiGwY=
X-Gm-Gg: ATEYQzxTxLxHh+oVNuiE1lL/GdkioFgLNvxQfP5zkYleszXuFn+mG4NDfpC1vzQSa6V
	oZd7YsVvpuk8R+N7/8hW46AE5Y04IS4kO5KZgGak4jSjrhWVmKjc2JF/HxExWAqBophvS/wsQFN
	rgV0Y2uO0XeawihoneKsmXkAzEteHOSu4FBO1Y/Rn7UCd4JL4fnWYSpaipWtLgLlD5SA7znLVKn
	P7tn0hgt1J4ksefsYXwZO7CJqQ26LqD1okxWWvRDh5UBbwls20jGsQJK00ZD08cY1Xni1ohpp1J
	Eqs9Y42A9fKnCWgp6WgNqL9hzrANloE01O/tSPXSNHqp1MieZcxCrC2YqauQLJGmsImN6z8nfk6
	gYk0mbB3sf7zvV5+a2TzfCciaudsM4meLL3rMxZoHsT5duz/ABuYoF6fTcTlOc6pD0hPslsmerb
	F2MpLm70TfQ9mgOJk6olkZEXbwnVM=
X-Received: by 2002:a05:6a00:ad03:b0:829:a590:6d0f with SMTP id d2e1a72fcca58-82c96087f4amr11583763b3a.58.1774882586297;
        Mon, 30 Mar 2026 07:56:26 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:51d0:8872:b109:d470])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8498779sm7540458b3a.25.2026.03.30.07.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 07:56:25 -0700 (PDT)
Date: Mon, 30 Mar 2026 08:56:21 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Vishal Mahaveer <vishalm@ti.com>,
	Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/7] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
Message-ID: <acqPFV005fH8qHpV@p14s>
References: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>

On Wed, Mar 18, 2026 at 04:13:06PM +0100, Markus Schneider-Pargmann (TI) wrote:
> Hi,
> 
> Split the firmware memory region in more specific parts so it is better
> described where which information is stored. Specifically the LPM metadata
> region is important as bootloader software like U-Boot has to know where
> that data is to be able to read that data and resume from RAM.
> 
> IO+DDR is a deep sleep state in which a few pins are set to be sensitive
> for wakeup while the DDR is kept in self refresh. Everything else is
> powered off.
> 
> The changes in this series were suggested as part of the IO+DDR u-boot series:
>   https://lore.kernel.org/r/814c211f-a9eb-4311-bb84-165b1a69755f@ti.com
> 
> There are currently no real users of the memory-region that is split in
> this series. The size of the memory-region in total stays the same.
> The new layout is derived from the software running on the r5f
> processor:
>   https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd#L172
>   https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/source/drivers/device_manager/sciclient.h#L459
> 
> Additionally the two important devicetree nodes for resuming from IO+DDR
> have the bootph-pre-ram flag added as this data needs to be read before
> the RAM is in use.
> 
> Best
> Markus
> 
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
> Changes in v3:
> - Squash the enforcement of the memory-region-names requirement in the
>   patch adding the memory-region-names, as suggested.
> - Link to v2: https://lore.kernel.org/r/20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com
> 
> Changes in v2:
> - Make memory-region-names required if memory-region is present
> - Fixup memory-region and memory-region-names conditions. Require either
>   2 or 6 regions for memory-region and memory-region-names
> - Reword and restructure the binding documentation for memory-region and
>   memory-region-names
> - Add memory-region-names to all uses of memory-region
> - Link to v1: https://lore.kernel.org/r/20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com
> 
> ---
> Markus Schneider-Pargmann (TI) (7):
>       dt-bindings: remoteproc: k3-r5f: Split up memory regions
>       dt-bindings: remoteproc: k3-r5f: Add memory-region-names

I have picked-up the above two.  The .dtsi files need to go through the TI
tree.

Thanks,
Mathieu

>       arm64: dts: ti: k3: Use memory-region-names for r5f
>       arm64: dts: ti: k3-am62a7-sk: Split r5f memory region
>       arm64: dts: ti: k3-am62p5-sk: Split r5f memory region
>       arm64: dts: ti: k3-am62a7-sk: Add r5f nodes to pre-ram bootphase
>       arm64: dts: ti: k3-am62p5-sk: Add r5f nodes to pre-ram bootphase
> 
>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml       | 55 ++++++++++++++++++----
>  .../arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi |  1 +
>  .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      |  2 +
>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            | 42 ++++++++++++++++-
>  .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      |  2 +
>  arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            | 42 ++++++++++++++++-
>  .../arm64/boot/dts/ti/k3-am64-ti-ipc-firmware.dtsi |  4 ++
>  .../arm64/boot/dts/ti/k3-am65-ti-ipc-firmware.dtsi |  2 +
>  .../boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi      |  4 ++
>  .../boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi      |  6 +++
>  .../boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi     |  6 +++
>  .../boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi      |  3 ++
>  .../k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi   |  8 ++++
>  13 files changed, 163 insertions(+), 14 deletions(-)
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7
> 
> Best regards,
> -- 
> Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> 
