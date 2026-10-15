Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC4A50AC30;
	Thu, 15 Oct 2026 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057797; cv=none; b=JAN/ChAhBLTstuGstdRZrUyrMIFZJ04+8uHqtFRBHa5/SEfHdsXzrOPy/vSx/0yMaPCvcBhe7WY+7RY561FQAfwGaffki1adPEaFRKuQx9BkQBiVWoZ3n0Se7jOhfK4VB4AbLKBXS81gv9hw+dbrKevqdSglPpqzjw8H9+ehZr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057797; c=relaxed/simple;
	bh=ttF/dM1aNWk+AZDVMok9w7Nn+KdeWaOEjOQa4pxBBsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B0dNnmf//U95fP9h+JTlGqeA3HnzThyhZsKt5m7WXCWwvDHiMnl2wjxLB6fbcxyVGTeIfSzc9a3KmwQdeEnDLHm2FQl/wlOimeewvqW2I2dE4O0gQX++QCUk635uELmTrVrJhD13C2Vz+67W2KH1n8m7CHHcrbbNXflTeIcmBY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jQgQPj/Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQgQPj/Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233B21F000C6;
	Thu, 15 Oct 2026 09:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792057796;
	bh=5PdCABJ02UEmwfes7qBJeAq3DKKkIaoZlycMlEcT4GQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jQgQPj/ZjFMZM4uyFl0mFkxraZP3JYZwWge9ZIamXvMhHNeXud5J+qHuAo7XtCYbG
	 4oX6UVprcNldwkS85/6FoQZBadxP867J2YvC0XwvzEBhOQQBIPCHxr4tgmKYKW5fc5
	 q/TQGl5UpwUHgBCLMmgNaftljAgtK/hCIAjBocdeOMVckzV8rMq9whCgXVaCtIzLcM
	 Czr67UxyZO7WhAJKI6ZwB/9U0+c/OEf/ev0msuQ+TcbnMWwHFasjmuPaJogFkFPQR9
	 XqFA8MzjUHD1XmD7IrGGh/lwTSjJm8xkfJaoIq9YY9hbl14fU2lpFnPqoZhDDVflo7
	 As9MLVH/pZNOA==
Date: Thu, 15 Oct 2026 11:49:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: jassisinghbrar@gmail.com, andersson@kernel.org, 
	mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	michal.simek@amd.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, tanmay.shah@amd.com
Subject: Re: [PATCH 5/6] dt-bindings: remoteproc: Add RPMsg resources to AMD
 BRAM rproc
Message-ID: <20261015-ethereal-cicada-of-perspective-c1aaca@quoll>
References: <20261014213426.2957480-1-ben.levinsky@amd.com>
 <20261014213426.2957480-6-ben.levinsky@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014213426.2957480-6-ben.levinsky@amd.com>

On Wed, Oct 14, 2026 at 02:34:25PM -0700, Ben Levinsky wrote:
> Describe the optional mailbox channels and named reserved-memory
> regions used for RPMsg communication with a BRAM-based MicroBlaze
> remote processor.
> 
> The three named memory regions provide the two virtio vrings and the
> shared RPMsg buffer pool. Firmware and its loaded resource table remain
> in the executable BRAM described by reg.
> 
> Assisted-by: LLM sparse

How sparse can assist here?

> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  .../bindings/remoteproc/amd,bram-rproc.yaml   | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
> index c0359f447ea8..daff8e615ab6 100644
> --- a/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
> @@ -84,6 +84,33 @@ properties:
>      description:
>        GPIO specifier controlling the soft-core reset input.
>  
> +  mboxes:
> +    maxItems: 2
> +
> +  mbox-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +
> +  memory-region:
> +    maxItems: 3
> +
> +  memory-region-names:
> +    items:
> +      - const: vdev0vring0
> +      - const: vdev0vring1
> +      - const: vdev0buffer
> +
> +dependentRequired:
> +  mboxes:
> +    - mbox-names
> +  mbox-names:
> +    - mboxes

Why do you add this? Please instruct your LLM to actually understand and
learn dtschema.

Best regards,
Krzysztof

