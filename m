Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E721DA318;
	Wed,  3 Jul 2024 15:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720019547; cv=none; b=uCCId0EI0hZ4AJsgSjXAlWdNnh7ycvOl7V1fmwJABA+q7dwRN8JzbsZgpEouUclL92G1iMkj+WKTmBNc2UULEYqRHEgc9HI5TBe0Eau7POP67sXOQAjLADIoPivzJS6GMINURQG+KxS+c3oxUwXuAO/bWkHAOlLH0cdPOiVDj0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720019547; c=relaxed/simple;
	bh=bZW21jBK4bJEw2Fkn/wNBZ23fNCVJapRR3j2cdfhGXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgZRjTukb7CE2Qd2swz0bBT1yCqRaVmiSM8w/F8iLE3YnY2hFAPMKkD4X7SBqRSqj2OlmCKMuK214h7281kux90RnCjWhaz3EjiuENsHff1FjkIE3tNUR28eCz0C4nCFpxfS/B+azh3O3EiZv0w9x55LSs1FSCdKMLxUTWm0YE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EW+JWy47; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EW+JWy47"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432FCC32781;
	Wed,  3 Jul 2024 15:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720019546;
	bh=bZW21jBK4bJEw2Fkn/wNBZ23fNCVJapRR3j2cdfhGXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EW+JWy47/PNUrBhyimitRESb08Tu0gmfg/JsQvSkFdBpCXrOFOQoPv7mrex1zEHQn
	 fHw+7OwWob78p44o2kc3ktZ6AI4ZvEJJDjSheACEQyt1OcfVHB3YvzC89i5Bc8ui5v
	 Y2QHxQp1oJi8DzjpMc8PbhCoA8HXCTdtm/wvn8RAnicv2xIwR5ql6cjjCCHD0Sd7Ci
	 RkbgCxt0inAZT189lomnTiFlYNKOLFyk3DRfWPp4HkxiGk/1dz7rDiq9AILZkGYXnl
	 KCy11+TrU/GSG7f3De2fynmwZ2uIhZ32PESwQyyajU89XFVRx9cFLr76pRny+x6c64
	 4aPR84sKe/Aog==
Date: Wed, 3 Jul 2024 16:12:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Stanislav Jakubek <stano.jakubek@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>, baolin.wang7@gmail.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: hwlock: sprd-hwspinlock: convert to YAML
Message-ID: <20240703-cartoon-blimp-aa9640ae8c29@spud>
References: <ZoVDeHCUCTZu7AT/@standask-GA-A55M-S2HP>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7fsRCS5eThH/Ab5L"
Content-Disposition: inline
In-Reply-To: <ZoVDeHCUCTZu7AT/@standask-GA-A55M-S2HP>


--7fsRCS5eThH/Ab5L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 03, 2024 at 02:26:32PM +0200, Stanislav Jakubek wrote:
> +examples:
> +  - |
> +    #include <dt-bindings/clock/sprd,sc9860-clk.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      hwlock@40500000 {
> +        compatible  = "sprd,hwspinlock-r3p0";

nit: double space here before the =

> +        reg = <0 0x40500000 0 0x1000>;

nit: if there's a respin, drop the 0s and use size/address cells of 1.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--7fsRCS5eThH/Ab5L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoVqVgAKCRB4tDGHoIJi
0uneAQCRdlQ7TihmxLlRjcZB5P9mcGoSZdiL3XYesILSRC55NAD8DDRxKW0LBom6
iTXDfsIQ2HzsjvV6XtkOW2B+yjFMuAI=
=f2DQ
-----END PGP SIGNATURE-----

--7fsRCS5eThH/Ab5L--
