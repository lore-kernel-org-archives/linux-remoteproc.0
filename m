Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988DF259CB6;
	Tue, 25 Nov 2025 09:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764064006; cv=none; b=Vdh2elv0t1CjLNGCenpBlsTxZhqulZePnx9kvdbyvT6gonBjQET8KXg4x/zrmvmL9Y/v0Ho44CK7YMf7fTOyiyQThgIHC3pQchGxgYS3Lb2sZImW+eNGGWER5MtJElvfXv7leUmdRe3iHdWNKZt3QwlXdOF85jkqi/lpDFVDhJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764064006; c=relaxed/simple;
	bh=0la6SWyMAsfefsuIcI5WCj2pyCbGOA6cqWv/sgKZUgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=umNyFelPZkVD6lKWZlmbiItAofDIJBVqn7Kx82vjClaTDnAnvDccBQ7IdxSgAOt3bI+CfpO7DPGSp+7NsFMuSS6nRLj1xC/h0foHmXScvFk8VNXPRhcW9vFO5xTCjr28Q/rFn/SyT+iA4kn0YaGNXYZ6cR8krw4YKxY1CY4AylI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cjg7gsGY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cjg7gsGY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FBB6C4CEF1;
	Tue, 25 Nov 2025 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764064006;
	bh=0la6SWyMAsfefsuIcI5WCj2pyCbGOA6cqWv/sgKZUgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cjg7gsGYrHchBN1nQY2FzOYj1qnoHz88KXyEkZTGP87JgZQR8gOC5VrLZ8BWSR45E
	 eMUqc9qAIq/bN9poxZadiktWKlpUlIf4qU/azZrvBFsjoFL1BOaIZiMlrg99e0j5w7
	 FyeMCpBsYGkQ71PyXinvwcpQfIaqCRBzy5IMHT8HQrOEjq9NX4yEn7U0LbMDlidTCq
	 VRSFfXwADZAWrA2sbH0CXmvnx9UfDF1sdR7Ss/qF4hCteX4bEgNE75tSa97PcpOSB+
	 ReKHJYg584KeoKBzpAPjv6NcIYlBRX+vrKB6FewqwJcOrrMZ5rm3RoYYVm9bCzMrZf
	 qC89GG3SEeZog==
Date: Tue, 25 Nov 2025 10:46:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: add Microchip IPC
 remoteproc
Message-ID: <20251125-aromatic-savvy-eagle-b81696@kuoka>
References: <20251121142157.3582463-1-valentina.fernandezalanis@microchip.com>
 <20251121142157.3582463-2-valentina.fernandezalanis@microchip.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251121142157.3582463-2-valentina.fernandezalanis@microchip.com>

On Fri, Nov 21, 2025 at 02:21:56PM +0000, Valentina Fernandez wrote:
> Microchip family of RISC-V SoCs typically have one or more application
> clusters. These clusters can be configured to run in an Asymmetric
> Multi Processing (AMP) mode.
> 
> Add a dt-binding for these application clusters.
> 
> Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
> ---
>  .../microchip,ipc-sbi-remoteproc.yaml         | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/microchip,ipc-sbi-remoteproc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/microchip,ipc-sbi-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/microchip,ipc-sbi-remoteproc.yaml
> new file mode 100644
> index 000000000000..348902f9a202
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/microchip,ipc-sbi-remoteproc.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/microchip,ipc-sbi-remoteproc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip IPC Remote Processor
> +
> +description:
> +  Microchip family of RISC-V SoCs typically have one or more
> +  clusters. These clusters can be configured to run in an Asymmetric
> +  Multi Processing (AMP) mode where clusters are split in independent
> +  software contexts.
> +
> +maintainers:
> +  - Valentina Fernandez <valentina.fernandezalanis@microchip.com>
> +
> +properties:
> +  compatible:
> +    const: microchip,ipc-sbi-remoteproc

This should be SoC specific compatible.

Best regards,
Krzysztof

