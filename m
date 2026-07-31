Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAAD3346B4;
	Fri, 31 Jul 2026 09:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785490635; cv=none; b=mgh0+j6HwvxWQL7YnMl4/7+FRAQVcQG5f+hXXTnuscuhlHp50u/RapvHsmEd37VKgeuK9x5J1t1dGvRCP7lb60M0seXvPptT/vnA0ckll1mG2DacSAJPUsXm7c11nh1D62qLDlse0BkDsFJ9xV8lCxNA4WAiBh7jQ2r7QlFFXFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785490635; c=relaxed/simple;
	bh=8EtTUJpvn4Axjw76DBogLBQoeu4vtUaTKOgEg9qD8Uk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PrK9CeT10s6vSD7uQDpDGOd9dOk4feJvnVIhegFKAxgkOm3nMS9wRqaGwCMd+aIRLAydeYls7ZvTR4uRLEHTs3DDjfJxysJOD3i3YWxL/c4Ove0jIaArIqBtV+FiA2E8zn/YhQD+py8Yk4kbv6IGF/lUBkc7YI2L/ohECY62PZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dC50tkWc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dC50tkWc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD8C31F000E9;
	Fri, 31 Jul 2026 09:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785490633;
	bh=VtOJfD4p94dJgUc2OpIekcciEzoJu2Zgz9AGQI7/JTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dC50tkWcX5U1kIBETUug6y4niAnBF4Ww+ABwoFRhkm/qo5+02DrpWT4y8aiFmjnBl
	 E2Uu+S0YNS60FYGhZBBHblpmFpWGaSX+hEz7da8r7F54aCLbWZ+LCNstx20Moj75ez
	 emBWljhnrvNf6XaK8dHdp411RTBhG3nij2/Ax5AzebkJzZ2op9IR+N5yx7+q/yZjAs
	 z33frTnXcUPuMeZcZmqWLMYuf09idRf+Nuk9NKD6ESJ2XH6RTU9t6whaqh/hgfFaOQ
	 dlADzbfPDOmB395QI1QI+jghcrYxsumlIKiTRsjeuFnLaS58sihV53SPUaSPrW7HV3
	 wHfl2F3VUzohQ==
Date: Fri, 31 Jul 2026 11:37:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@oss.nxp.com>, 
	Francesco Dolcini <francesco@dolcini.it>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
Message-ID: <20260731-merciful-whispering-serpent-3a8eef@quoll>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
 <20260730163412.1145-2-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260730163412.1145-2-laurentiumihalcea111@gmail.com>

On Thu, Jul 30, 2026 at 09:34:09AM -0700, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> The carveout region names are derived based on the DT node names. Because
> of this, the DT node names are ABI, which is not supposed to happen.
> 
> Fix this by documenting an additional, optional property:
> "memory-region-names". This way, the software will have a way to build the
> carveout region names without relying on the DT node names.

That's not the point of xxx-names property. It only serves as a helper
to get the resource.

> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index c18f71b64889..8e3e6676a95e 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -62,6 +62,10 @@ properties:
>      minItems: 1
>      maxItems: 32
>  
> +  memory-region-names:
> +    minItems: 1
> +    maxItems: 32

This cannot be flexible and unspecific. Why "yellow submarine" would be
a correct name?

Best regards,
Krzysztof

