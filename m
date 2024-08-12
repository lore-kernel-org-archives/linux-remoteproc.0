Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1217B18754E;
	Mon, 12 Aug 2024 16:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723478783; cv=none; b=pUzCLlI8vMHSw8N8aIV+UO6mDfLd6v6F6XiG4FxZF6EH7x94ZY5shZmU9mrV2xfmdFe6ko98u9Jot5n80/0VslsYZu1YbLM4s6XyVzhsZ+PqxbxnOK6bjsw2Fh+agA5kOgL2rfpW6L7i2sIg0AKsJaKFZSiJuxz5FsYVWounSsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723478783; c=relaxed/simple;
	bh=/53TkGFY/aqQAeMc1dRBRn5KDylqn5uXlNZaxXOa0U8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sng/r+Gsuk6595dujDnZlUC/tGWMq7oAKx8CPDpsHB+JKDV/z1nksRZLJOCqPMbDdUoSDlFqXXkcgKez1PldvI8ChGH61gg5TFNHZp+9Iq5bSgACAynyV40ycQgPJvAcqw2JlX5T9wNRp8lRxLcOxb75BYgAn1PAGYEQ3Kk7NvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WNvlJ7o1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WNvlJ7o1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2518AC32782;
	Mon, 12 Aug 2024 16:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723478782;
	bh=/53TkGFY/aqQAeMc1dRBRn5KDylqn5uXlNZaxXOa0U8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WNvlJ7o1lPlHBc9nkCbzeDQ1+WVJ2G1bJ8pbrpo0R6ZcLYHJnC+wZlPX4jpgABARk
	 I9RVScU4boaDHPVYdcjKfEOK4cYATzyvFFfPKzO4KuD4hywxj+MyQddMIPMwcqxr/O
	 nKk/Pi8Hrej+br70tn5R+nQmcyjn6+huxrgV8aAOgSGqch9mWGJbk9qvZ3iifbQKSY
	 VMatlkZvcunW4aUsHeacuXdV/U+09nwFZpl3SmqRmv9UvSfucVt5kPCWiMpUlSVc3t
	 N923X8V1mwzfJXrHA7houiT/xG/ONOLYo5Y1PFasO3HY0yBkdVDisEDgsCha/9/x7b
	 SK2GhmsncRQUw==
Date: Mon, 12 Aug 2024 17:06:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Ben Levinsky <ben.levinsky@amd.com>,
	Tanmay Shah <tanmay.shah@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: remoteproc: xlnx,zynqmp-r5fss: add missing
 "additionalProperties" on child nodes
Message-ID: <20240812-cycle-worrier-19d86c26b890@spud>
References: <20240811153438.126457-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zyKr280Y+chKHd+6"
Content-Disposition: inline
In-Reply-To: <20240811153438.126457-1-krzysztof.kozlowski@linaro.org>


--zyKr280Y+chKHd+6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2024 at 05:34:38PM +0200, Krzysztof Kozlowski wrote:
> All nodes need an explicit additionalProperties or unevaluatedProperties
> unless a $ref has one that's false.  Add missing additionalProperties
> to fix dt_binding_check warning:
>=20
>   xlnx,zynqmp-r5fss.yaml: ^r(.*)@[0-9a-f]+$: Missing additionalProperties=
/unevaluatedProperties constraint
>=20
> Fixes: 9e1b2a0757d0 ("dt-bindings: remoteproc: Add Tightly Coupled Memory=
 (TCM) bindings")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--zyKr280Y+chKHd+6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZroy+QAKCRB4tDGHoIJi
0nS3AP0RcoXHRQ1XhA4eLczTNCGWzDSqr1yLBU/uYgHFQL9lMAD/fCbv3Yq4ZTGN
mVDS/7q6QpbXf7pBeQaulGG8aFQTIAM=
=Tys/
-----END PGP SIGNATURE-----

--zyKr280Y+chKHd+6--
