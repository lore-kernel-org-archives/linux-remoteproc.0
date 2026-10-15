Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928A549A3A9;
	Thu, 15 Oct 2026 09:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057690; cv=none; b=dFjjOHAgwXTP5Tgb/hODycOyEzKXPrX+dJ/9SV6D6DTR6SIQJEeRklIYUZipTmiKI4nVIO/txqQYvqdqvtpqxJkb3oxT9pV0i7dhUtFOysV+K7/izfuGam59nplsXWBaAEfzElp9VX3LZ/TUYcXmt6Vu2zlrxOuhl3/eF8HAZmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057690; c=relaxed/simple;
	bh=su25gWE2+Y7EGI2Lf/PnhhFPZJZlsmdo+WV+G3+MxKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NYsxLPd4UQsjoXs/5/r8DstiUId9E90HmuKUz2iZStMjQMB0dEYPOrpQwZ2z0qxtzAtOOUIzmsGKHY66LfbP6WxPZakMUVVexciDVxMsoh+mCAaf7GZDPFV1jLsppcMl2654Sf8t6pD2UHlT0DkswsNT1ErHAQwLEctMVyuXj+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZAvUlNtM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZAvUlNtM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C57E1F000C4;
	Thu, 15 Oct 2026 09:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792057689;
	bh=nzqDuiIFu2S405waqYA4O1T2NcoOaihFIck2pbiUyMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZAvUlNtMlT7ShAsCpXkw1h3NuT8sOlfSo0pg+pUxd48ioSImegukmLrZvFvuYryC5
	 JTsgf2EGmX43fw3WRVyWvPxZtjoP4y3mJrkelHrcLuivwVBcsknVtm62m/FSpF8Stz
	 6lXuMf2KWuVRS3KBAwF9IO9NSjlSZftomllR8Ka8vIHOAULMgD/6N8zPX+8jCNq9T1
	 oEF4qXVNBHEbfZI9OzVtZRoZg6pHgopBHKcs+VrKSbTEGVnZNmzudlaxoWUaWstlJe
	 GgQ2yfZoDDJOrJOfSZgNFwj8mISeHuVbPr5ewuAQ/GGbWMdVhJ2EGnsVPwLexKHl5P
	 m7iX9iaIyRukg==
Date: Thu, 15 Oct 2026 11:48:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: jassisinghbrar@gmail.com, andersson@kernel.org, 
	mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	michal.simek@amd.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, tanmay.shah@amd.com
Subject: Re: [PATCH 4/6] mailbox: Add AMD PL Mailbox soft IP controller
Message-ID: <20261015-aromatic-ibex-of-opposition-dafb43@quoll>
References: <20261014213426.2957480-1-ben.levinsky@amd.com>
 <20261014213426.2957480-5-ben.levinsky@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014213426.2957480-5-ben.levinsky@amd.com>

On Wed, Oct 14, 2026 at 02:34:24PM -0700, Ben Levinsky wrote:
> Add a mailbox-framework controller for the AMD programmable-logic
> Mailbox soft IP. Expose separate transmit and receive FIFO channels.
> 
> Enable the interface clock only while a channel is started, before any
> register access, and disable it last when the channel shuts down. Keep
> provider probe free of register accesses and leave the IRQ disabled until
> a client starts the receive channel. Initialize each FIFO when its channel
> starts, use receive-threshold interrupts for incoming words, and poll the
> send-threshold status for transmit completion. Stop that polling from
> accessing registers once the transmit channel begins to shut down.
> 
> Carry mailbox payloads in struct zynqmp_ipi_message, limited to the FIFO
> depth given by the device tree. The FIFO transfers 32-bit words and the
> hardware conveys neither a byte count nor the FIFO occupancy, so a
> transmit length that is not a multiple of four is zero-padded to a whole
> word.
> 
> On a receive-threshold interrupt, read up to one FIFO depth of words and
> deliver them as one message, then acknowledge the interrupt. The event
> latches only when the FIFO goes from empty to nonempty, so a word that
> arrives between the drain and the acknowledge, or words left by the
> bounded drain, raise no new event. If the FIFO is nonempty after the
> acknowledge, toggle the threshold to latch a new event for them.
> 
> Assisted-by: LLM sparse
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  MAINTAINERS                      |   7 +
>  drivers/mailbox/Kconfig          |  10 +
>  drivers/mailbox/Makefile         |   1 +
>  drivers/mailbox/amd-pl-mailbox.c | 369 +++++++++++++++++++++++++++++++
>  4 files changed, 387 insertions(+)
>  create mode 100644 drivers/mailbox/amd-pl-mailbox.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f53047aa8d3c..4e28e0c311c0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1287,6 +1287,13 @@ S:	Supported
>  T:	git https://gitlab.freedesktop.org/agd5f/linux.git
>  F:	drivers/gpu/drm/amd/pm/
>  
> +AMD PROGRAMMABLE LOGIC MAILBOX DRIVER
> +M:	Ben Levinsky <ben.levinsky@amd.com>
> +L:	linux-kernel@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/mailbox/amd,zynqmp-pl-mbox-2.1.yaml
> +F:	drivers/mailbox/amd-pl-mailbox.c
> +
>  AMD PSTATE DRIVER
>  M:	Huang Rui <ray.huang@amd.com>
>  M:	Mario Limonciello <mario.limonciello@amd.com>
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index ab869769e278..3c3f262c903c 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -8,6 +8,16 @@ menuconfig MAILBOX
>  
>  if MAILBOX
>  
> +config AMD_PL_MAILBOX
> +	tristate "AMD PL Mailbox soft IP controller"

Missing depends on Zynq/Xilinx.

> +	depends on HAS_IOMEM
> +	depends on OF
> +	help
> +	  Mailbox controller for the AMD Programmable Logic Mailbox soft IP.
> +	  The controller exposes transmit and receive FIFO channels to mailbox
> +	  clients. It supports interrupt-driven receive notification and
> +	  polling-based transmit completion through the common mailbox framework.

...

> +	mb->controller.dev = dev;
> +	mb->controller.ops = &amd_pl_mbox_ops;
> +	mb->controller.chans = mb->chans;
> +	mb->controller.num_chans = AMD_PL_MBOX_NUM_CHANS;
> +	mb->controller.txdone_poll = true;
> +	mb->controller.txpoll_period = 1;
> +	mb->controller.of_xlate = amd_pl_mbox_xlate;
> +
> +	ret = devm_request_irq(dev, mb->irq, amd_pl_mbox_irq,
> +			       IRQF_NO_AUTOEN,
> +			       dev_name(dev), mb);
> +	if (ret)
> +		return ret;
> +
> +	return devm_mbox_controller_register(dev, &mb->controller);
> +}
> +
> +static const struct of_device_id amd_pl_mbox_of_match[] = {
> +	{ .compatible = "amd,zynqmp-pl-mbox-2.1" },
> +	{ .compatible = "amd,versal-pl-mbox-2.1" },
> +	{ .compatible = "amd,versal-net-pl-mbox-2.1" },
> +	{ .compatible = "amd,versal2-pl-mbox-2.1" },

So all of them are compatible? Then why do you need all this?

Best regards,
Krzysztof

