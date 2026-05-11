Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F1A1339B1;
	Mon, 11 May 2026 16:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778516874; cv=none; b=QgaiF3qyrbHpI4gtLCllU+yRU6njQokSzZv2t9AzFYILsqzQ7MFfxjSHIrIrNeFXZfc4hi0aTCI1FeiSSIh9qDd47OWXZRuygDNGpzdVpvK8QxcZ1HzM8+F0/Mcc3DPWR7kVqwHnF2k8NqjTAog1LI8H7dQOiG1XROMWVKusiaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778516874; c=relaxed/simple;
	bh=V0wLh5KRspfOQ3ibRR/1QYF8R6kmly0cfDdqmRIJqvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VuyUnFkyFi4MBrxHV8698TfgL7O7ba27y/MRpjQEWQ6D9YPX73dBHxF/yohGJpXbLYDaFtRR79KlMCZt59JHKXtljAHXNIEa4qnNXpdE9j9Ll9lpxjUZoJjmV0dq2MI58SM6funrhQeAGUIVWny1EjI8cC4HbSn6na41wy1Hkqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gcmyAxHA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gcmyAxHA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05BBCC2BCB0;
	Mon, 11 May 2026 16:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778516873;
	bh=V0wLh5KRspfOQ3ibRR/1QYF8R6kmly0cfDdqmRIJqvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gcmyAxHAKFs6NB3meRHb14KoC6R9ksltSt15rHaXzZGZv3SOCwBupe3Q67oel5/qb
	 hMr4Q0I75R456Sean1nvn2ql0Nv/q/NKL/jC1Hsco3Td8/+uB0HIRTYeq1wy0KrVHJ
	 3/xT33SBXpz13eLPMF9CcEKP3UbhDX0t0qEsmzSwishRclNtw88eAZH0nIxnaQR+ZU
	 zcWleaZH9FTxJde+jDXQPhnFBFqhtk2GlcNAMgH2dy86LrHK8hQoXO7MctjL4zMFAs
	 nGFoSEGnTTLKfHtSopIXrClD54+3IG/wR+B8JApKw0cuRc2f1RMh0qrGp9PxIaBOal
	 zRUinbWJtU2Qg==
Date: Mon, 11 May 2026 17:27:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Arnab Layek <arnab.layek@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 1/1] dt-bindings: remoteproc: mtk,scp: Allow multiple
 memory regions for MT8188
Message-ID: <20260511-uncouth-pandemic-080dccd30f4b@spud>
References: <20260506133157.3283204-1-arnab.layek@mediatek.com>
 <20260511121004.2984149-1-arnab.layek@mediatek.com>
 <20260511121004.2984149-2-arnab.layek@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Cth8D7RmP7y3OUje"
Content-Disposition: inline
In-Reply-To: <20260511121004.2984149-2-arnab.layek@mediatek.com>


--Cth8D7RmP7y3OUje
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 08:10:04PM +0800, Arnab Layek wrote:
> The MT8188 SCP requires two reserved memory regions:
> 1. Main SCP SRAM memory region (required)
> 2. SCP L1TCM memory region (optional, for additional memory)
>=20
> Some other MediaTek SoCs only use a single memory region. This patch adds
> a conditional schema using if/then to allow 1-2 memory regions
> specifically for mediatek,mt8188-scp and mediatek,mt8188-scp-dual
> compatibles, while keeping the default maxItems: 1 for other
> SoCs.
>=20
> Each memory region is documented with descriptions to
> clarify their purpose, following the pattern used in other bindings.
>=20
> Signed-off-by: Arnab Layek <arnab.layek@mediatek.com>
> ---
>  .../bindings/remoteproc/mtk,scp.yaml          | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/=
Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index bdbb12118da4..df13be2026a6 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -205,6 +205,27 @@ allOf:
>            items:
>              - const: cfg
>              - const: l1tcm
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

Does this even work, given that memory-region has maxItems: 1 outside
the conditional section?

Cheers,
Conor.

> =20
>  additionalProperties: false
> =20
> --=20
> 2.45.2
>=20

--Cth8D7RmP7y3OUje
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagIDhAAKCRB4tDGHoIJi
0l1KAP4ogMR4hY4vl2iFHrcWq1THHYzittMIqmeoOyXVWNsTAAEAuFti4lcrCBUc
+MZz9rCNT0pG273MQ05Xxrr/JE7IJgc=
=tkTv
-----END PGP SIGNATURE-----

--Cth8D7RmP7y3OUje--
