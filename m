Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883EF2F7EE6;
	Fri, 15 May 2026 17:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778865408; cv=none; b=t+v7K2w/RraaIkFco6atiBm5wt3C5D4/IDwWe7VrKdakp29ca8AkCt52F6We4eBTzdRpD68db+Wu7LPr+IJUyCQBmdmHZ82oiUlZjX1wrd/AlxmXEbN2BZztRXwfay4jUaxqgN6Jr7c+ELS/rmGWIBzNaEvMrsdlk93GrQN7YCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778865408; c=relaxed/simple;
	bh=D+Q8K+kyVP1ubvD6+VjZYeCUsgDgt/zV7OkqOGgslYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=apQkf9Cre7LmA8lIDOkQ8gdmNUyq1saIbXqHImV0DGesQGiM3v+WoPq1qegz+BCmV+7vmpNRypmJaRDyGZVlOvIJK4TpdmtfeCTzVKR7i/dE3EnGSVfUYT+9EPCv1a7cQHeToyZbTCoAKBfiPKyZITLA5BgexmRl1Pkl+2VFRyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tRBeCytV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tRBeCytV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BBD4C2BCB0;
	Fri, 15 May 2026 17:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778865408;
	bh=D+Q8K+kyVP1ubvD6+VjZYeCUsgDgt/zV7OkqOGgslYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tRBeCytVo/KzhVNigILjTJIrsLlMjsCt6dCJ/x/86uhGP1uw7EX1y7oHCqiyxUgdZ
	 cAoQxuz+9pDEQqRybR2+gDKyw2Eezx6OK3AB9Kavcx2Z1TTRhncvaLYHKCWE/fzqLa
	 mi4bbGqCmPR1HPRBJW1J6R1evSVhq1UyG9ivKMFvGR5w9uL7BM6UQB6OIN6hXKmKxO
	 hdDyNLyjW5e2WJgbsLp2F0BI7ye9yNycDTgdyEb9y2otQJg0Kw78tPAEJ4fke9j7+r
	 AiPVIVBxTnn8B//mfSAdxQTEvLHPNN9btNTJMWbIQSaor42iyA0Bmt47IKHQFL9MRy
	 /gLOFlycsF92A==
Date: Fri, 15 May 2026 18:16:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwlock: Add StarFive JHB100 HW lock
Message-ID: <20260515-modify-explode-3ac45a97d5e3@spud>
References: <20260515095357.75998-1-xingyu.wu@starfivetech.com>
 <20260515095357.75998-2-xingyu.wu@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TGbiMdThHDvx8bnA"
Content-Disposition: inline
In-Reply-To: <20260515095357.75998-2-xingyu.wu@starfivetech.com>


--TGbiMdThHDvx8bnA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--TGbiMdThHDvx8bnA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagdU/AAKCRB4tDGHoIJi
0uLgAP91GASUxzBQGWkR12w6NuAfkfltcr++cBCVqmXjT4iuiQD+OSKAzfH2NLe8
tqBtud8BvomFF8/DIlmrv6aa0L8nhwY=
=goG1
-----END PGP SIGNATURE-----

--TGbiMdThHDvx8bnA--
