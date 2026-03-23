Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A67D349AF4;
	Mon, 23 Mar 2026 19:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774293331; cv=none; b=MKQUVA8sNPO1T7SLDeJTtFbsP6cbwrL7E8uM5KoBhpX50Q1KulgkcmD2JQEQYUCgUxlj7PcC0bhmPR8xR76Ul0wToPXwoV5zps1puGlatXaLi7AM4eTSEmpEqBKA0dD2IoLXyioWP0b7o59hHcOJd+H/FFL2aXISr2zwqai35NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774293331; c=relaxed/simple;
	bh=WVQEv5BiSE1a5SJvjjKjBtJ6Twe7PvX4G5/XVYbMPAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUWx66IOBr4lRXzY0dCB5snJU2SFxmMxqzLUnqCZQ55frNDKSeRafIC1dFfK4wZ/aUw1unGtlaEPe+Qwo2XT0H4JeWYxwo/fBBx4if4qVwa9YPHo/tsmGf0rBHP5mRFLo3D5ioUAlYRYphHj9JVazhQvLOnlHp3jlOg/p9yamXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I8EhqmVm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I8EhqmVm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96595C4CEF7;
	Mon, 23 Mar 2026 19:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774293330;
	bh=WVQEv5BiSE1a5SJvjjKjBtJ6Twe7PvX4G5/XVYbMPAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I8EhqmVmj3xABQ8clRhtrD1H52IQfgrIsylyU4Hklz9rT+RqAOnzs8YtYywuYwMgb
	 LzNMnKUSBqVo36PV0TkwGEcwKvlilYt3ev7y82SUQBOzdsNMIsTsyVa7tFU0Y1or2C
	 FNn/r++z5wOMLtXXW7Ot9HZnQqxHpjdgNZfefoycJHtvfcYGuNx3cP01pa6Q5x3u7a
	 dSDsCrmF75ZfMJu4pa43e8EturFh2VSrvtbN7JqDQqitk8lfabK2YmhgSYPc5ATww2
	 ubW+HdZ+fV2MHUXJKDhh3Glm1M48M4E8ifKBcBzGWv4mVw/B4VrBhgNRPWClQEMpKU
	 atouRt3wP1qRw==
Date: Mon, 23 Mar 2026 14:15:29 -0500
From: Rob Herring <robh@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: imx-rproc: Introduce
 fsl,reset-vector-mask
Message-ID: <20260323191529.GA1054724-robh@kernel.org>
References: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
 <20260312-imx943-rproc-v1-1-3e66596592a8@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260312-imx943-rproc-v1-1-3e66596592a8@nxp.com>

On Thu, Mar 12, 2026 at 08:36:56PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Cortex-M[7,33] processors use a fixed reset vector table format:
> 
>   0x00  Initial SP value
>   0x04  Reset vector
>   0x08  NMI
>   0x0C  ...
>   ...
>   IRQ[n]
> 
> In ELF images, the corresponding layout is:
> 
> reset_vectors:  --> hardware reset address
>         .word __stack_end__
>         .word Reset_Handler
>         .word NMI_Handler
>         .word HardFault_Handler
>         ...
>         .word UART_IRQHandler
>         .word SPI_IRQHandler
>         ...
> 
> Reset_Handler:  --> ELF entry point address
>         ...
> 
> The hardware fetches the first two words from reset_vectors and populates
> SP with __stack_end__ and PC with Reset_Handler. Execution proceeds from
> Reset_Handler.
> 
> However, the ELF entry point does not always match the hardware reset
> address. For example, on i.MX94 CM33S:
> 
>   ELF entry point:           0x0ffc211d
>   CM33S hardware reset base: 0x0ffc0000
> 
> To derive the correct hardware reset address, the unused lower bits must
> be masked off. The boot code should apply a SoC‑specific mask before
> programming the reset address registers, e.g.:
> 
>   reset_address = entry & reset-vector-mask
> 
> This reset address derivation method is also applicable to i.MX8M
> Cortex-M7/4 cores.
> 
> Introduces the optional DT property `fsl,reset-vector-mask` to specify the
> mask used for deriving the hardware reset address from
> the ELF entry point.

Why can't you fix the ELF image to have the right address?

Or just imply the reset address from the compatible? It's fixed per SoC, 
right?

Rob
