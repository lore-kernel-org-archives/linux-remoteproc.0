Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EB9328B67;
	Mon, 10 Nov 2025 18:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762800255; cv=none; b=KlbKYNBSBeCdv4zmylmsCBlGzcBNlBVqugf/8ByYy9ZRzblbaiI39UsGNOea35mQ+SFGN/lnvWgTIq+L6hgrGUNxTPw3aQDNFoYqD0VTzSzdIoe4j1HPU/+DDUWE7QUY0NWY5CR4rjOaJ1CYm/NYvWVy/FGueEZ8pUZAGxeXjbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762800255; c=relaxed/simple;
	bh=uDgT3OLYqBNSwhcwVokASYsuRbIZdhKM2PFAjL4kmfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R9Av7cGO7jo/4KyYdWh/prLY8i8HTq4aIkBXPJPEipneBBeedur3byHRGijArqFwGduDOwdVXOZRUygt4oYyuAAulsr4f8RrymQu3PWaFzMbCdE1iegQA5j/JSCJ1pUl3C4mJ2mmcgUaK/YNQos55yTTOGmdApP+f2/6L4Fiz8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pm2NaPdw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pm2NaPdw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A019C113D0;
	Mon, 10 Nov 2025 18:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762800255;
	bh=uDgT3OLYqBNSwhcwVokASYsuRbIZdhKM2PFAjL4kmfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pm2NaPdw1pQxcle3LBq1dJXMeAMTKMxQbo/+GoyGaNPZBOKVb6/TDfIsKHNpr05R5
	 wNPlNpJhlPqu5KE2DS6Uo80rTSC7qp0/hMfiBs0sADDUZJBRykNV/KTx8o92qQdOCX
	 cW1k03hHMEFQd1sFxVchziMlpK1YtdUByq5q1ChpmgWYMTzIVQp46z8UbC0as8zWTf
	 MC96jrFvdqHy84cZTKRdN5jOARljbnwgmrHBPZmNJ5g43XidoVN9lnBJcHCMretitp
	 48bxa5dw6EadcnFUoDkymMxz0P91/CTQeN+lFrYP4kx3tfpNhx6dNVTU4sluOjmFhJ
	 mCNvbrNvRhgwg==
Date: Mon, 10 Nov 2025 18:44:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Huayu Zong <huayu.zong@mediatek.com>
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
Subject: Re: [PATCH v3 3/3] dt-bindings: remoteproc: mediatek: Add MT8189 SCP
 binding
Message-ID: <20251110-wispy-unsliced-4eaa89c6a866@spud>
References: <20251110101342.24261-1-huayu.zong@mediatek.com>
 <20251110101342.24261-4-huayu.zong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lfkxYjN0AXZNGzBE"
Content-Disposition: inline
In-Reply-To: <20251110101342.24261-4-huayu.zong@mediatek.com>


--lfkxYjN0AXZNGzBE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--lfkxYjN0AXZNGzBE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRIyeQAKCRB4tDGHoIJi
0gZNAPwMSrWLJjJv/TIE354SXgaXXyg/Lhs1khSwgfyy9QS8eAEAxbotzJllfTAJ
lnDKXD4R7yCtnW6Jx10F2R9VKtJYVAg=
=pkeZ
-----END PGP SIGNATURE-----

--lfkxYjN0AXZNGzBE--
