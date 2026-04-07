Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3D5363095
	for <linux-remoteproc@vger.kernel.org>; Tue,  7 Apr 2026 15:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575180; cv=none; b=cckivRSDb9MgzB/K8yJu3t0uU1be2lCJiJhGLkT7hHRLXk1ABy9AB9r23EatRcPLkIHHknXCEdoPAAW2IeUy+LV4TUBDNfz03VNfM3iIlXnWlpHg7H0LLjPJOAhaQev6dTuuDN/iCjm35+8AUHZV9814qE+1j4MCYyX+C3ivz+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575180; c=relaxed/simple;
	bh=Esr4m/CWzlzGxIEXM4jv9Iy3Hrt7tqhgId2RGV+BjP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PkYh++CIG+O+kJoRedv87Dd10X2xrK4D3sc/7mCwcltOw9TwKhY4Bqj9Xc89gHbnMQosPR20BZDUuR26efIpQhz0zJQtrpA95dvenwvXA/EzG5ikNDwQXkLq7DV9nkV1O+tgBzRz+9wdZ806PAeQNYIU7SaMTaRwgDTk/WvvGbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K6cdDzB7; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K6cdDzB7"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82418b0178cso2351087b3a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Apr 2026 08:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775575178; x=1776179978; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=px+aTSO680+yUdTUoCh2tkBc+4urCGyGCdnmZi+tHi8=;
        b=K6cdDzB7ua+XmUA45Lin2VIetbvOKK/wffm12AUzyrjYmXFM7xFiV/uSKyfro+dRGI
         LvOmiOJV7FGxpHyU6Qqgw4m6wNQpOYsAmIDUGtVsqSUf0JOPvZxq1HdtJCD0zvjC4amt
         EJHElZY0TavY/qe0hyynWCUYg1LJoD1dirDPUG/cenqb/huHbhPe8qIFIKHpDjHNHiMn
         ldzB/5QgnWWAEWaWJW718D4B357YF2H//3LSJwybmqoWrnFyJu05+MubTS6iMVdOjHSv
         GQDi/1WTw7OD/Wr8w+PdFxf65c8jGRRsFZYNworRYp/sUl0/9uwCSsg+vMvNmMDJqES5
         yJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775575178; x=1776179978;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=px+aTSO680+yUdTUoCh2tkBc+4urCGyGCdnmZi+tHi8=;
        b=ngsITI5P2DQ3qOHqLHBXSt/SJbbrnn1sGgZ9AwxwJ1EVAfAatkAVLv9WYpRb/apBix
         ZgpJ2YM+dQQ3Qg4PlmLZgOwk5Wzzb76jg0QGKwegs9VVogk8sfJ8uLBzmq39OyfVulYK
         Wc0MY2dR18EUfZNoS14RBEMDBvK6va/qDrBtLN9wZeB2OCpzI0//ts2raO4B6iN1uLUT
         GGfT6UY17mid/vqxDuUEIv3YVeaMUv4SHqj7xBD3pnUhLlXMyvR2MQDxRpBBC1zZtXs6
         K0EHppnjxrkIyVcSHd0nXPKjV2NSSazmOhB5iy0TbFweyGGRdP8HzrFAPar1QgK8rGkp
         BKxw==
X-Forwarded-Encrypted: i=1; AJvYcCUNc8pi9iqn9dAhpGOnw0pjek/ttany4yreproUi7TWVC2zoYqNkjOML2h26HGBxfJ/FBPo8YbLtFYC9GEoZGaC@vger.kernel.org
X-Gm-Message-State: AOJu0YyYU8MsYNA4VgM8Y0EMg6rR3Gof2Pt7akpJyy3zt98mATZaJAEe
	bNUsOmCIKrSjMrboT8XJDkm9KEZHiJeG5M7rU4pMk0IFi3V8MEEvOOrIPSr4Lp+Z82E=
X-Gm-Gg: AeBDiesEPbCU53YPu7nlKW8B8odNo+IQWK1EQ+OcFBM1/bLorPBp42XT5DPhlET6oxL
	34DDLcq9dJiUaAaYdGdEgjFNna8X0eyehUl/tnM+ChZqwVnOU39+uvihPoDDZ5r/m9ZeXxzpXJ2
	9epVczTLTxAzwar9aqf0Oa4Pq4Mq4u1Kno/RmBfwlhZwwHJRfQ3HEpiaqtDq45PLzkxthCgVaS/
	5032tfQfBBqDkuCSyzvRMKBYsDInBJZsPH20mVI1fgp14SB1Uv78/WNlSGnuTCj+vzmKKlqvxwg
	sLFto8Ub9sq4pi6rN62Vgt/iUsM1dDZszV1XXsSsOdqlgZRP4pVeadJ8nIJDBMFI0a9gFsuVmod
	euQWFdhMhZmOd5gZ9nbAdXvhNyxHjXJV4gl4Yj5jknzjQOxFIfDH/QxuwuNUc6baE/81EvxYVxS
	HFrfhBBzVMe+igEM1A/x7rZm7coJg=
X-Received: by 2002:a05:6a00:3926:b0:7f7:2f82:9904 with SMTP id d2e1a72fcca58-82d0da2c50cmr17909669b3a.5.1775575177733;
        Tue, 07 Apr 2026 08:19:37 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:97a2:befd:d439:79fb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c6ba2fsm18101364b3a.45.2026.04.07.08.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 08:19:37 -0700 (PDT)
Date: Tue, 7 Apr 2026 09:19:34 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to SM
 CPU/LMM reset vector
Message-ID: <adUghiyZbe3fmcNX@p14s>
References: <20260327-imx943-rproc-v2-0-a547a3588730@nxp.com>
 <20260327-imx943-rproc-v2-2-a547a3588730@nxp.com>
 <acqjS440STRl2sK2@p14s>
 <acs2PAZq2k3zjmDW@shlinux89>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acs2PAZq2k3zjmDW@shlinux89>

On Tue, Mar 31, 2026 at 10:49:32AM +0800, Peng Fan wrote:
> On Mon, Mar 30, 2026 at 10:22:35AM -0600, Mathieu Poirier wrote:
> >On Fri, Mar 27, 2026 at 10:42:03AM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> >> Cortex-M[7,33] processors use a fixed reset vector table format:
> >> 
> >>   0x00  Initial SP value
> >>   0x04  Reset vector
> >>   0x08  NMI
> >>   0x0C  ...
> >>   ...
> >>   IRQ[n]
> >> 
> >> In ELF images, the corresponding layout is:
> >> 
> >> reset_vectors:  --> hardware reset address
> >>         .word __stack_end__
> >>         .word Reset_Handler
> >>         .word NMI_Handler
> >>         .word HardFault_Handler
> >>         ...
> >>         .word UART_IRQHandler
> >>         .word SPI_IRQHandler
> >>         ...
> >> 
> >> Reset_Handler:  --> ELF entry point address
> >>         ...
> >> 
> >> The hardware fetches the first two words from reset_vectors and populates
> >> SP with __stack_end__ and PC with Reset_Handler. Execution proceeds from
> >> Reset_Handler.
> >> 
> >> However, the ELF entry point does not always match the hardware reset
> >> address. For example, on i.MX94 CM33S:
> >> 
> >>   ELF entry point:     0x0ffc211d
> >>   hardware reset base: 0x0ffc0000 (default reset value, sw programmable)
> >>
> >
> >But why?  Why can't the ELF image be set to the right reset base?
> 
> Per zephyr general link script[1]:
> ENTRY(CONFIG_KERNEL_ENTRY)
> 
> CONFIG_KERNEL_ENTRY(_start) is the first instruction that Cortex-M starts to
> execute.
> 
> config KERNEL_ENTRY
>         string "Kernel entry symbol"
>         default "__start"
>         help
>           Code entry symbol, to be set at linking phase.
> 
> The hardware reset base is different: it is the address where the hardware
> fetches the initial MSP and PC values from the vector table. Hardware uses
> this base to initialize the stack pointer and program counter, and only then
> does the Cortex‑M begin execution at the reset handler.

That part is clear.

> 
> Aligning the ELF entry point with the hardware reset base on Cortex‑M systems
> is possible, but it comes with several risks.

I'm not asking to align the ELF entry point with the hardware reset base.  All I
want is to have the correct start address embedded in the ELF file to avoid
having to use a mask.

> 1, Semantic mismatch (ELF vs. hardware behavior)
> 2, Debuggers may attempt to set breakpoints or start execution at the entry symbol
> 
> [1] https://elixir.bootlin.com/zephyr/v4.4.0-rc1/source/include/zephyr/arch/arm/cortex_m/scripts/linker.ld#L103
> 
> Regards
> Peng.
> > 
