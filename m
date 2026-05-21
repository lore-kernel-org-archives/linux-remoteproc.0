Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8390C3E16A6;
	Thu, 21 May 2026 20:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779395190; cv=none; b=iP0Fte3doGI6MqSoODHLq1jyBjxhft07Y9wgLbSSy8EgM1HuJoXQsT8x8lKn2WLTVrOcgAVDNP4Vw2OgiVii+uHQOgb/Ko9f9oT139Zi3CwgDFXewYwUrQgNam6fM10B/1DL+Ge02noM/JaK481PzO7yUTHRpIShSz24B3bUifE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779395190; c=relaxed/simple;
	bh=MFA4cMvKhbGBNpvihLapYD7MamV6C/ICz/ZEgiXrPBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SgALErptTZuoa90m/OcPVJAW+1teDNVqL1qoeQekIsvKPHxYJr/HP01nVDX2ZfJpgVN7hGbSN4z5DmuwU1q8rAGnn0q8GaPsoPanAsshFZdJl2JKOIlqztUshD1Gx0ad7lUcY/eXx62cNutnpU0FLEJd+SJ2uXCRKkjf5piGzHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lwvm4EBQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lwvm4EBQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 767E31F000E9;
	Thu, 21 May 2026 20:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779395189;
	bh=mR7/bge6JcX24xjulaB5vvJqpecE2qhCKlDej64wNVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lwvm4EBQPc2T68E60wfFJqRqq2TPk7TNTo9++A1sbAr8w0yOwyMWu5zNYmPcBPsLE
	 GC6N7r998f4JX1yEUTKdLPneuGhr8xRQBJrIXggVJgr2b5Crzg8/l++N9Mjhw8mfsF
	 S5C7rJ/mqFdtchY2OduLmlAyTQhJH0XHsP+r5KwiyCcn23BHKbqx1SJZsRAc/FcAhs
	 cYq/pxd+9Gzf86uaQhJUh4x0pTEVG+uuv6qDeZ3UV23pAZJaykDSML3LFBUpvWraYG
	 vyM83L+fJjk3jfq+HGVfDgKcM8v0/Q73Ladt7fPQ3c1LlSGdv2GcZ+TfDcLhu1kdQD
	 fFHmiFRvT0PSA==
Date: Thu, 21 May 2026 21:26:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Arnab Layek <arnab.layek@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, andersson@kernel.org,
	mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4 1/1] dt-bindings: remoteproc: mtk,scp: Allow multiple
 memory regions for MT8188
Message-ID: <20260521-rarity-degree-4d5ae12b6fd0@spud>
References: <20260520112629.3420612-1-arnab.layek@mediatek.com>
 <20260520112629.3420612-2-arnab.layek@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KMuahv1k41CftHWI"
Content-Disposition: inline
In-Reply-To: <20260520112629.3420612-2-arnab.layek@mediatek.com>


--KMuahv1k41CftHWI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 07:26:29PM +0800, Arnab Layek wrote:
> The MT8188 SCP can use either one or two reserved memory regions:
> - Required: Main SCP SRAM memory region (mandatory for SCP operation)
> - Optional: SCP L1TCM memory region (Level 1 Tightly Coupled Memory,
>   used for performance optimization when available, but not required
>   for basic SCP functionality)
>=20
> Other MediaTek SoCs (MT8183, MT8186, MT8192, MT8195) use only a single
> memory region and must remain restricted to one region for backward
> compatibility.
>=20
> Update the base schema to allow 1-2 memory regions (minItems: 1,
> maxItems: 2), following the pattern used by other MediaTek dt-bindings
> like mediatek,vcodec-encoder.yaml where the base property defines a
> permissive range accommodating all device variants.
>=20
> Add two conditionals:
> 1. Explicitly restrict non-MT8188 devices to maxItems: 1
> 2. Document MT8188's two regions with descriptions (minItems: 1 makes
>    the L1TCM region optional, allowing boards to specify 1-2 regions
>    based on hardware configuration)
>=20
> This approach maintains backward compatibility while enabling MT8188 to
> specify 1-2 memory regions depending on board design and performance
> requirements.
>=20
> Signed-off-by: Arnab Layek <arnab.layek@mediatek.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

Cheers,
Conor.

> ---
>  .../bindings/remoteproc/mtk,scp.yaml          | 45 ++++++++++++++++++-
>  1 file changed, 43 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/=
Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index bdbb12118da4..fca9b0675eae 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -55,7 +55,8 @@ properties:
>        initializing SCP.
> =20
>    memory-region:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> =20
>    cros-ec-rpmsg:
>      $ref: /schemas/embedded-controller/google,cros-ec.yaml
> @@ -123,7 +124,8 @@ patternProperties:
>            initializing sub cores of multi-core SCP.
> =20
>        memory-region:
> -        maxItems: 1
> +        minItems: 1
> +        maxItems: 2
> =20
>        cros-ec-rpmsg:
>          $ref: /schemas/embedded-controller/google,cros-ec.yaml
> @@ -205,6 +207,45 @@ allOf:
>            items:
>              - const: cfg
>              - const: l1tcm
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - mediatek,mt8183-scp
> +            - mediatek,mt8186-scp
> +            - mediatek,mt8192-scp
> +            - mediatek,mt8195-scp
> +            - mediatek,mt8195-scp-dual
> +    then:
> +      properties:
> +        memory-region:
> +          maxItems: 1
> +      patternProperties:
> +        "^scp@[a-f0-9]+$":
> +          properties:
> +            memory-region:
> +              maxItems: 1
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - mediatek,mt8188-scp
> +            - mediatek,mt8188-scp-dual
> +    then:
> +      properties:
> +        memory-region:
> +          minItems: 1
> +          items:
> +            - description: Main SCP SRAM memory region
> +            - description: Optional SCP L1TCM memory region
> +      patternProperties:
> +        "^scp@[a-f0-9]+$":
> +          properties:
> +            memory-region:
> +              minItems: 1
> +              items:
> +                - description: Main SCP SRAM memory region
> +                - description: Optional SCP L1TCM memory region
> =20
>  additionalProperties: false
> =20
> --=20
> 2.45.2

--KMuahv1k41CftHWI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag9qcAAKCRB4tDGHoIJi
0rcRAQCLjBxasDXV57xfl5XfSkQ3fL4xZ8EJcvOKXBI9aa0ZWgD+LTstcSvBjZQz
vpMsjWdsvrPrK8D0qh0BwR+7yr+7OgY=
=QOd/
-----END PGP SIGNATURE-----

--KMuahv1k41CftHWI--
