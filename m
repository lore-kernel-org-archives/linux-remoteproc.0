Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B52123E34C;
	Wed, 26 Mar 2025 18:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743012171; cv=none; b=ODTz5sMiUJhRB/hGLEZK38yQ7/CNCMi4XPSBmZF9A+e1uKqAWdEF+GA1jjNqeoW1nj10H7BKFzA3dy2Faeyyf8udj/ev785ebQ6yCPzr14IzskJGaCxP+6PByQVW8Ner5TTLGwS4z9iV/u1C9pAKhq9FmR6u2bP17lT5kfkSsMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743012171; c=relaxed/simple;
	bh=mCdk+P8p/pxLv5pZKLEF1MRBDsB6k071tpMVyXHg/i8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uxp5PCOwRNsSf01KRfX7/3DM7/7iQQdzKLHa/kTm18rFJVQYeH7bxEFB8XG0DL4+4i4iVXJNzwKEZ2TGx1qPegij/Ok/ePDgp1UwRo2JxnofeRSl8EJNvezB8pJSHFOuaDdoGTqpMameJSuUNk41vclILU8dtOgBgNQutgCQTAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DU7uG78f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DU7uG78f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80658C4CEE2;
	Wed, 26 Mar 2025 18:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743012170;
	bh=mCdk+P8p/pxLv5pZKLEF1MRBDsB6k071tpMVyXHg/i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DU7uG78fcayWWNWGPZI/LxhjRwbFf0OsHTKN4h0TxpNI2BotBiazAwhqSsBUSEUdk
	 s0GEk4PlA/khBLWS4nU/7WwdUecp7PpFI7q8xzTAtXJPGitYLtujmRDpWCa6gcv/IJ
	 YoSyWDmxUPC+kFOcxZeznrHy8OWHsUAk2ObcAf6QMJIQvcmetYj6AQOYWW9lunG19T
	 wuATgZm+59mKhninq8V0pcIex+Z3GIJEsvBsLmiXHkyYg0sDwaQdsxhdutn+IV9Cjf
	 vVLKSp8qm2KGES6cIk7mqRJA2tjZqedN9Iu5ZY1jw5hzW2LHbcddY8+ee6Tps7wo7N
	 IXK21x5v7Wgbw==
Date: Wed, 26 Mar 2025 18:02:46 +0000
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
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: stm32-rproc: Add
 firmware-name property
Message-ID: <20250326-giblet-endearing-cd76a00c6077@spud>
References: <20250326083912.12714-1-arnaud.pouliquen@foss.st.com>
 <20250326083912.12714-2-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pIJa1m7h2upDJxWu"
Content-Disposition: inline
In-Reply-To: <20250326083912.12714-2-arnaud.pouliquen@foss.st.com>


--pIJa1m7h2upDJxWu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 09:39:11AM +0100, Arnaud Pouliquen wrote:
> Add the 'firmware-name' property to the remote processor binding
> to allow specifying the default firmware name in the device tree.
>=20
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml       | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.=
yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> index 370af61d8f28..a0a16bfe8ef7 100644
> --- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> @@ -139,6 +139,11 @@ properties:
>        If defined, when remoteproc is probed, it loads the default firmwa=
re and
>        starts the remote processor.
> =20
> +  firmware-name:

> +    $ref: /schemas/types.yaml#/definitions/string-array

This should not be needed, it's a standard property, no?

> +    maxItems: 1
> +    description: Default name of the remote processor firmware.
> +
>  required:
>    - compatible
>    - reg
> --=20
> 2.25.1
>=20

--pIJa1m7h2upDJxWu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ+RBRgAKCRB4tDGHoIJi
0vE1AP9J58xanH9W6GTrEbCuKn5eu2aDyiiSA/vp2NtSg8fYyQD9EWt7Ndn+h+NW
CEY02RuwuVdniaCzT+U+CADdHf+7SgQ=
=4xuG
-----END PGP SIGNATURE-----

--pIJa1m7h2upDJxWu--
