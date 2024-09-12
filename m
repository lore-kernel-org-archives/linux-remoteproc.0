Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEC41EB2A;
	Thu, 12 Sep 2024 17:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726161405; cv=none; b=FF1wrg1J6jsRNU7Fc6+otJCT7vloDEUer7pZ14bprgembLcJtpRoXn3BXc/6cdq5K817m6yU8ISq7QNacV+5DAagN+z0tbNhLi/vlaFDGyOjiPozefvnWf+yw8uY5E/JcMJGF/sMs7IIUCI0wm40smatXLwPL+7drTQytt1AmPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726161405; c=relaxed/simple;
	bh=lcXDiJUuSazbyiM7a9bDnM0VBOr4vDSb01GvcGWxj9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B+GwhMYCJVqliEaMbRjA2og86uD6SBfuF0ZLvdH8qXmJPoyevct2/cZTg/HSPqIlnXNfXhN1hcmsiatVmXlNDq70xJUQXcobrP1SfetWoqMPVgBYQJvHmva3By1kjgRuYBRESxCc6KsJO8Eqfo3fd6GNlkwngJEihD9f27KnOD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DA8+QBA7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DA8+QBA7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F3BC4CEC3;
	Thu, 12 Sep 2024 17:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726161405;
	bh=lcXDiJUuSazbyiM7a9bDnM0VBOr4vDSb01GvcGWxj9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DA8+QBA7MmBMhmWysQj3WpTWIQaCdjOvJ3jGqukftUb0iTA8PHxdaJ5kCkDDZAzHi
	 U4jxZB+tpspxCILjXAUoPMyVx8KN4aph/wzHz3JmUVGn8oXaluVkoOxQvpgFiF5kUf
	 waCQXQWhoVPUJJHXiDcg52niG85I6PppwmdZkAzJPGhtOCslPInuql8QqNfjtzdeBE
	 Q48scY29pdSKalRQjV52E1zzExUBKMk7a0xUFW9bGy0OTt2zDT6mo6XaQGsPYwrog9
	 8llo9e+YeK4GnCmPwoprbNIC3k+K9+uUlSOMpRdYoQigm1Ck04N4NMiPXMJDIiXP0i
	 icFEv0Msv2TnQ==
Date: Thu, 12 Sep 2024 18:16:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	peterlin@andestech.com, dminus@andestech.com,
	conor.dooley@microchip.com, conor+dt@kernel.org,
	ycliang@andestech.com, jassisinghbrar@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, andersson@kernel.org,
	mathieu.poirier@linaro.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v1 1/5] riscv: asm: vendorid_list: Add Microchip
 Technology to the vendor list
Message-ID: <20240912-landmass-sculpture-c4884637f5df@spud>
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
 <20240912170025.455167-2-valentina.fernandezalanis@microchip.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iuE30SpHjwyKCbFe"
Content-Disposition: inline
In-Reply-To: <20240912170025.455167-2-valentina.fernandezalanis@microchip.com>


--iuE30SpHjwyKCbFe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 06:00:21PM +0100, Valentina Fernandez wrote:
> Add Microchip Technology to the RISC-V vendor list.
>=20
> Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.c=
om>

In $subject "asm" should probably be "sbi", otherwise:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  arch/riscv/include/asm/vendorid_list.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/=
asm/vendorid_list.h
> index 2f2bb0c84f9a..a5150cdf34d8 100644
> --- a/arch/riscv/include/asm/vendorid_list.h
> +++ b/arch/riscv/include/asm/vendorid_list.h
> @@ -6,6 +6,7 @@
>  #define ASM_VENDOR_LIST_H
> =20
>  #define ANDES_VENDOR_ID		0x31e
> +#define MICROCHIP_VENDOR_ID	0x029
>  #define SIFIVE_VENDOR_ID	0x489
>  #define THEAD_VENDOR_ID		0x5b7
> =20
> --=20
> 2.34.1
>=20

--iuE30SpHjwyKCbFe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuMh9wAKCRB4tDGHoIJi
0n1ZAPwNlMdbujIfW5R6Du2ao945FO0uBhC/YZF+e2UTGjXQ5wEAr0myf1+5QDw9
e0ZL9gHXB3oSW9Z9B+aqz83pu5H6vAs=
=zdl8
-----END PGP SIGNATURE-----

--iuE30SpHjwyKCbFe--
