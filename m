Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACCB43150;
	Tue, 17 Sep 2024 12:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726576941; cv=none; b=roK3zDoPkvOHE3PdysahbxmrjPlIEcB6FYGnzGawzHruGV1AOJfVYcj6685lgSHeTCMkq3DYqZNOi2lwB5iv5qCn9zO3cI/8lZdDJW8qml9z1q9i0J7Ngj0rfRo+XKZ3FgmBrQVkvvDfyRP1+2TXwM997Yf26gZJq3z5sUyWqRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726576941; c=relaxed/simple;
	bh=DxSozZoTAZ0DZKRlRBivxsXIOBMMkja7Aw30jvEyvHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cd7b+D7ipxzcuPGqSq1nDwju0L9kjSRE5F8FmVNg2Vx8UvrC0nZgEvh0QtjO0cBFG3hneL8Yw5m5V4GlPN/wWSuJ317u5Xpx5aGxqWDtgOsjrhHITcfQgFAXbhlG4gjn3eRBIh3bn3TUReHJMTXKfuaE/C43zZrVKHtivGe0cyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZIY9Y9o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZIY9Y9o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44742C4CEC5;
	Tue, 17 Sep 2024 12:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726576940;
	bh=DxSozZoTAZ0DZKRlRBivxsXIOBMMkja7Aw30jvEyvHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KZIY9Y9owNsaaK3AAZupQDN3y2pgwXs4xNqjYWBE3HYsR1LyvlxCq0Dy4qX5EyxpD
	 2h4mTrMfMPNB2uDsRFHp8Rbr0a7VyD9Ii/Qj8jKolhK/bB7tndlBXYF2tKc1en/JFD
	 HdGB/GaR+TbbYi+0COtvSrnyLMP/PvlktqDZoNMqA4q9uqpXK4Vy/eQ8ZItsMtgQue
	 1qDME//sw+rdwpXuCMVfbqWSrvTXd1kuFgWBPD+TurZAbTsK/puSOuvQIXDFAK57dS
	 ib/xwQ5eu+G/7KfPBSA3L/Q9k5S6i/W+ubm2VUIFLcmYPlLDn8hkJ0a3B72Sog8zup
	 nvjjQJq27Cbyw==
Date: Tue, 17 Sep 2024 13:42:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Valentina.FernandezAlanis@microchip.com
Cc: ganboing@gmail.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, peterlin@andestech.com,
	dminus@andestech.com, Conor.Dooley@microchip.com,
	conor+dt@kernel.org, ycliang@andestech.com,
	jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	andersson@kernel.org, mathieu.poirier@linaro.org
Subject: Re: [PATCH v1 0/5] Add Microchip IPC mailbox and remoteproc support
Message-ID: <20240917-dealt-aloe-ebadde66d629@squawk>
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
 <fe87c66d-e5f6-46bd-828a-6fac2b0aa0ac@gmail.com>
 <1f269bea-ad97-424a-97cb-970194dd54a8@microchip.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cZTUsoZqjEDJFw2g"
Content-Disposition: inline
In-Reply-To: <1f269bea-ad97-424a-97cb-970194dd54a8@microchip.com>


--cZTUsoZqjEDJFw2g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 17, 2024 at 10:45:02AM +0000, Valentina.FernandezAlanis@microchip.com wrote:
> On 16/09/2024 23:28, Bo Gan wrote:
> > Perhaps checking-in
> > the microchip SBI extensions to major SBI implementations such as openSBI
> > first would be better?

It's worth pointing out that the "major SBI implementations" do not
support the platform this is currently being used on.

--cZTUsoZqjEDJFw2g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZul5KAAKCRB4tDGHoIJi
0kqlAP4pbYeB2cK6dhPhZdaySfzo6MdoqfYfQoRtP/XHSxx2CAD/Ywedo0qQATtf
B0CCZrnxcefbgISDLQSdg1r1Qkaofw4=
=uNE0
-----END PGP SIGNATURE-----

--cZTUsoZqjEDJFw2g--
