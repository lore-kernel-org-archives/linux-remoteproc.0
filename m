Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24C11586C8;
	Thu, 27 Mar 2025 16:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093496; cv=none; b=B0U3pFaTMUZbcTtQuJqlvdvvtddR/ZxU1fWlf8ru+GbxgImEKrsa+UkJCkH5XpCh4uRlQMrx0eqatsMJ77bgoS6alxS47EgkjLOvDW/grntskReNcxOujBjJD15eO8N2eSp47VAi+MQR5cfKdx6Gip2wl/f+lAc9rYHjRKfp43M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093496; c=relaxed/simple;
	bh=NvC16u1aqR/2KG04a8f4N6Xoq/iI1HOtNPpUepOa0Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2AJ9EB+13Trywv+FbxUzuZQ14zAe1jmB+z6+F0eeHUCsRXHaKySKVH3yHQ6L7yCq8yjNv/W+NQm1tYpgLosrF9T+Y7TDzZ8Y0l2Q9PZ6u2lyn7os1N5hLlVaGOvcNc8haPis72fYz2LojKaboAnZ8Hlpnt4LZT4YKTTi7Dx/es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o3ztZUCE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o3ztZUCE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15777C4CEE8;
	Thu, 27 Mar 2025 16:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743093496;
	bh=NvC16u1aqR/2KG04a8f4N6Xoq/iI1HOtNPpUepOa0Ms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o3ztZUCEsTgAufZFIr54bxgGmr3liOeSSxSNHer94WsXcmqD6VkiFMJpgxN4qBDpI
	 BtOIwp8CLI6Ri4PDU0wPxHZv5eCUfsEgY7UXGM0/Ipj1Quhx6WA8bn+cnuw5/RSjpN
	 bGulEuC72O8WOwISAx5IXkbmdCIw4BWmhGMyjjoQINgPphdojzU37IE9tM1hJf4cHc
	 O4CLk/OaeYXzHinKCDM+z/NZ/ltVO6XamoCGyi9f6WXu+dYHBuxHbEWcS2uYtUzd9Q
	 XeWV1DkJRBHxTNFVnGvmccUeI6FFgZYGXMTEfcfvg4P/nF4X5H6d7Hs+9tSjt4MFvc
	 v8so7ojzrKQSA==
Date: Thu, 27 Mar 2025 16:38:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: stm32-rproc: Add
 firmware-name property
Message-ID: <20250327-defiant-quicksand-83cfdd8cf8d8@spud>
References: <20250327082721.641278-1-arnaud.pouliquen@foss.st.com>
 <20250327082721.641278-2-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ytieV3SLIaVgIcdG"
Content-Disposition: inline
In-Reply-To: <20250327082721.641278-2-arnaud.pouliquen@foss.st.com>


--ytieV3SLIaVgIcdG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 09:27:20AM +0100, Arnaud Pouliquen wrote:
> Add the 'firmware-name' property to the remote processor binding
> to allow specifying the default firmware name in the device tree.
>=20
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ytieV3SLIaVgIcdG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ+V+8wAKCRB4tDGHoIJi
0rA7AP9JyUbjLOakoM+hJBNcmQksv1MkDD5pE8noBMWu3qQ68AEAsjA4jPrHo7Co
a14daJ3eTuSb4JbviHqOsCWo9L2j0As=
=9SvW
-----END PGP SIGNATURE-----

--ytieV3SLIaVgIcdG--
