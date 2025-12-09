Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CF92139CE;
	Tue,  9 Dec 2025 15:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765294043; cv=none; b=Vzf76LyXyxGIt81w6Sbx196TG8NoHRo05l4pUxZEBMtDv9XGYss4wj6j6npwCfI7w+OJ75IGfEPEzTNR5J4SKlS4axOd/FGzY7LLhKkrZEhc6wrsNE96zFMBCR2NGGHxil0UAmAltwiHd0/Ra+CpF/HIwfXlZPm+jBVMCnK79qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765294043; c=relaxed/simple;
	bh=Qk5XDgE6MXmLTeeYkvpV1YDDQc5ljLwJoGzJoCWkSqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tOZ4iJGm22o/kSFK3v4LFXHKoPQlIR8xQA325CEgOmwXGDyPeptfV8uSFNSOzRMOL1JpZsXbPlXtrygl9znA3qv8gXAQGj9GRciEES7EqVHREvGXWjbsJqttP1DFqay0oYtxg0o6+8NcaSCjnzR/3NQR7a/BwuWy9JpXyNiWwbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J3X2WePY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3X2WePY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4E5C4CEF5;
	Tue,  9 Dec 2025 15:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765294042;
	bh=Qk5XDgE6MXmLTeeYkvpV1YDDQc5ljLwJoGzJoCWkSqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J3X2WePYdApkKBFfJc6DqiuwwE40Y6BY9AFm/Pc/5cXIH/EOyBTtG9ToapPlS6KJP
	 mvZ+yS15dAB7uOvfhfwWA8ipT7r98zbsigloMq7Zxp+tAFruJeK0yLOY51rlk6GGWk
	 NTIbqaU9zA+bCv75XfzNG75tn/R0JpcWThSxI5LkmuS2kzAdjuxvWS3U1jBp6Hh/VK
	 SrIafMmhtAphWjy+nEVNlTMlKPaDky3oTp9adusestHZhkZj9ixReviHvARp3rxm5y
	 xdblATqFjnYFp46AiLkJZZDR8lToZVYvpAwM7M+XTbIBd50Bwh9Ujj74gEOubJJ/b9
	 2SGwBXvM1LYvw==
Date: Tue, 9 Dec 2025 09:27:20 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org,
	m.szyprowski@samsung.com, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com,
	arnaud.pouliquen@foss.st.com, geert+renesas@glider.be,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] remoteproc: imx_dsp_rproc: Fix multiple start/stop
 commands
Message-ID: <20251209152720.GA189083-robh@kernel.org>
References: <20251209140425.766742-1-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209140425.766742-1-daniel.baluta@nxp.com>

On Tue, Dec 09, 2025 at 04:04:25PM +0200, Daniel Baluta wrote:
> After commit 67a7bc7f0358 ("remoteproc: Use of reserved_mem_region_*
> functions for "memory-region"") following commands with
> imx-dsp-rproc started to fail:
>
> $ echo zephyr.elf > /sys/class/remoteproc/remoteproc0/firmware
> $ echo start > /sys/class/remoteproc/remoteproc0/state
> $ echo stop > /sys/class/remoteproc/remoteproc0/state
> $ echo start > /sys/class/remoteproc/remoteproc0/state #! This fails
> -sh: echo: write error: Device or resource busy

So unlike Marek's case, the first time works. Can you confirm your 
region is fixed address?

> This happens because aforementioned commit replaced devm_ioremap_wc with
> devm_ioremap_resource_wc which will "reserve" the memory region with the
> first start and then will fail at the second start if the memory
> region is already reserved.
> 
> So prefer using devm_ioremap_wc as there is no easy way to undo
> devm_iormep_resource_wc manually.
> 
> Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 5130a35214c9..79d5c15319f3 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -709,10 +709,10 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>  		if (imx_dsp_rproc_sys_to_da(priv, res.start, resource_size(&res), &da))
>  			return -EINVAL;
>  
> -		cpu_addr = devm_ioremap_resource_wc(dev, &res);
> -		if (IS_ERR(cpu_addr)) {
> +		cpu_addr = devm_ioremap_wc(dev, res.start, resource_size(&res));

Best case this is reusing the same mapping and we just have unnecessary 
ioremap and iounmap calls and devm entries. Worst case, we get a new 
virtual mapping every time. IIRC, arm32 will reuse existing mapping, but 
arm64 does not. But that's 10+ years ago I looked into it.

Seems like devres is not the right lifetime. This should be just 
ioremap_wc() instead.

Rob
