Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4A820101F;
	Tue, 29 Jul 2025 17:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753811127; cv=none; b=LI42hmlmWlsVP2xPduhEjlB289xCODKdQeV2ZvNLoWtzwXFtxdT1O9nrSMAilvcz4tIJfPCs65/z2KWvVv6a6E1NsyCevrMUYkgi/7BYMTQ3GgFQqdAgS1Esy08KKOk7DxWzN20KUAdArw3ODwqvLnSsbO1r6m1XipfT1Wlg0F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753811127; c=relaxed/simple;
	bh=x3HNOWZw5hkcyGSQgmqXfoEJ+ny9/ZCvslOQJp7MB2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQIz1K7dV87UNLpihrCvzTlfbrR/86FR9CS6EiZfB4A/T4IFIkPeHPEI/Ozxllx6Jm7n69qaciF6gddL7gWphWayK+OAmCWbV4/20XefbICrL/TUjR/qlNeTEznuT/0tP8Gwt9RZDUXcTN1YefrH1LdymFKZQyVukD9yktHE4DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KpYz6p89; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KpYz6p89"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07791C4CEF4;
	Tue, 29 Jul 2025 17:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753811127;
	bh=x3HNOWZw5hkcyGSQgmqXfoEJ+ny9/ZCvslOQJp7MB2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KpYz6p89DzVpv//o/gFNgWEc5Gm98fYQHRh53L/XAWVBwKf6VN4selbeF3gdwwEvg
	 u98KjXQ+5iE3qf+0PljVq+7U6G0i+8g8/g9PlFz68kwZDKNgUlgQjigkgP9A1YfC6B
	 9X8Ms26uAs+GCTr1uCtrFAuSHuRLHW1z2YDRJsI5z3Nf70z4vA/bBChgiwI2YG2OEe
	 naZZVD+u9g8sLV6R4EQMlhKSJ7f/5V8LlkT4e+czD5gn/DRl/Y4EvNof/bpqSNfdpw
	 p+dlMs7GS/CXFDGcJ3/fWfe2l8DGD5l4E2fAVzl/R2WObcVvwyyop5zZBqcVz2NVQ6
	 VnYBAwpJko4pw==
Date: Tue, 29 Jul 2025 18:45:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Huayu Zong <huayu.zong@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 1/3] dt-bindings: remoteproc: mediatek: Add binding for
 mt8189 scp
Message-ID: <20250729-flask-applaud-7af817ef7a94@spud>
References: <20250729023125.9036-1-huayu.zong@mediatek.com>
 <20250729023125.9036-2-huayu.zong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kD2euniIewJpEG2U"
Content-Disposition: inline
In-Reply-To: <20250729023125.9036-2-huayu.zong@mediatek.com>


--kD2euniIewJpEG2U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 10:31:11AM +0800, Huayu Zong wrote:
> Add the compatible for mt8189 SCP to the binding.
>=20
> Signed-off-by: Huayu Zong <huayu.zong@mediatek.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--kD2euniIewJpEG2U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaIkIsQAKCRB4tDGHoIJi
0pwmAQDF9XgoLzRZN2+HymZe6A7A4abQRqFlzcGxlUnimpt8xQD7BQ2lbwb8Iw7n
KyWPgmI4hfaZEK9QDBPIsnCbJOyAaQk=
=qcBV
-----END PGP SIGNATURE-----

--kD2euniIewJpEG2U--
