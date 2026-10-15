Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E39E49DBB1;
	Thu, 15 Oct 2026 09:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057868; cv=none; b=aWMbeRkkfVp31YrF5kwWI/HAhXvkTO3Z22ZQv8lu5nJ8LmGl9lWKlvDi8x5j2tB4Mxp9hk0BOPAyBhLy06SVywQvj7gMyNOfJVNm9P70S/8oRlLLoPp/vwS1DRKsMPwcAItawHr94gMP1HBQ6Y7idGOlm1UYn9VSaQ9D8s+GGfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057868; c=relaxed/simple;
	bh=Mq47v+flZHLWwC8fpi8Q3bhmmbqX1lT4M0zWgmV5lZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRjB098JI1OqaDyeDRLv7Z1qcwSF3DGNGc8FI+3jidPcG6RdqtQG9AiECFOPXsxT5VmMWYBYXn3fVdqtLbrNpaWL7EUsEmfzJZ9nsYqQLzC4vrkrRe4VtnJ+CtL4U2T4nwjF+aYAlYbSmiVD1fp1RDHRrGUzEqGAHugXRNnGRtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFBPh2Jf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFBPh2Jf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 606FD1F000C5;
	Thu, 15 Oct 2026 09:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792057866;
	bh=Ciuww8GYCgeFiClfswF1NrS3AvHuKpWEdFzKRnqbzDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FFBPh2JfE21Jgdt4OH9tVMqAkq1OBwBZSephPUkhOVYon3UiAgZXC75JU6kS7tRff
	 U4qNtpQlX6QRDOVP9jI3Uj9iRbO+7Ak/kUUQGu5PNZBk9zWFSgve2ccg+foRTycjhJ
	 De3AZIGx4ZTJXrzHOSPr8wxGuXbk6qApYossAeXG11KepXzm2p/yt2pgYpv8jRsnFU
	 WJAa86akJMQY516mJA0shHroWIRZNuyH1L+qUQmh+avFGg8BQwXMAOd6n8GQ8Pdelz
	 0B9ynpLsWdxny4E5ME+2Eg6KBY6y9hHYUg771eGMc18i1/BtaNJ44fJ7qk+9Ellhls
	 +j06itIJMqfcw==
Date: Thu, 15 Oct 2026 11:51:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: jassisinghbrar@gmail.com, andersson@kernel.org, 
	mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	michal.simek@amd.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, tanmay.shah@amd.com
Subject: Re: [PATCH 6/6] remoteproc: amd_mbv_bram: Add RPMsg support
Message-ID: <20261015-amusing-private-hyena-65b1e8@quoll>
References: <20261014213426.2957480-1-ben.levinsky@amd.com>
 <20261014213426.2957480-7-ben.levinsky@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014213426.2957480-7-ben.levinsky@amd.com>

On Wed, Oct 14, 2026 at 02:34:26PM -0700, Ben Levinsky wrote:
> Register named reserved-memory carveouts and expose the firmware
> resource table after it has been loaded into BRAM. This lets remoteproc
> create virtqueues backed by reserved shared DDR without deriving
> carveout roles from DT node names. Map the shared-memory carveouts with
> the common rproc_mem_entry_ioremap_wc() and rproc_mem_entry_iounmap()
> callbacks.
> 
> Use the mailbox framework to send virtqueue notification IDs. Defer
> received notifications to process context before dispatching them to
> the remoteproc virtqueues. Keep mailbox payload storage valid until
> transmit completion and order write-combined vring updates before each
> kick.
> 
> For designs where the mailbox and remote processor share a clock, request
> the mailbox channels only after enabling that clock, while the processor
> is still held in reset. Release the channels before disabling the clock
> during stop.
> 
> The mailboxes are optional. Without them the driver keeps supporting
> load, start, and stop only.
> 
> Select the mailbox framework, the AMD PL Mailbox controller and the
> virtio RPMsg bus, which the driver uses for notifications and RPMsg
> channels. Selecting MAILBOX while depending on GPIOLIB creates a
> Kconfig recursive dependency, because GPIOLIB is selected by drivers
> that are reachable from MAILBOX, so select GPIOLIB as well instead of
> depending on it. The driver always needs GPIO for the reset line.
> Depend on HAS_IOMEM, which the selected mailbox controller and the
> write-combined carveout mappings require.
> 
> Assisted-by: LLM sparse
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  drivers/remoteproc/Kconfig              |   6 +-
>  drivers/remoteproc/amd_mbv_bram_rproc.c | 231 +++++++++++++++++++++++-
>  2 files changed, 235 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 5b56b2dcc725..9ebbbf76289f 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -25,7 +25,11 @@ config REMOTEPROC_CDEV
>  
>  config AMD_MBV_BRAM_REMOTEPROC
>  	tristate "AMD MicroBlaze/V BRAM-based remoteproc support"
> -	depends on OF && COMMON_CLK && (GPIOLIB || COMPILE_TEST)
> +	depends on OF && COMMON_CLK && HAS_IOMEM
> +	select GPIOLIB
> +	select MAILBOX
> +	select AMD_PL_MAILBOX

You should not select user-visible symbols.

Best regards,
Krzysztof

