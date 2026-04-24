Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B5B33E355;
	Fri, 24 Apr 2026 17:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777050329; cv=none; b=XXq4yFvJtOc1eCAyBXV+4nwZdDKJe/lIpZskHCxaxIyScYOUPClQOeHWIMIRpWN/1mznR6E9zQb29GNBBmSE1S8z0VNYYoDTTOM3ENXy/4eRcTX+jOZuBKdsnG6T1U3G9z+znM1rJaTbXQqfLISXtHb74fxJAtf92rkmAg7OZhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777050329; c=relaxed/simple;
	bh=Inc4atWINJoIRMkC4cpTPYRpwZxTCdKIkqwzJazDSFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/0zhcNIvWD3pgYCYLSYlgql6oHy9FGWXdrR6QZPpV++Q/ni17W8WcaZ6RxUG/BVOlWQBBTY6BmXJjd3qmMNri8q0BggV27shoot9UuIJ96Rp5UcdwoLpEDteJ0vI1kAIffylKI5xBgTKiXN8R8m/3adV8LhZqWazt6r1XarX3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZleVoXaE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZleVoXaE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB18CC19425;
	Fri, 24 Apr 2026 17:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777050328;
	bh=Inc4atWINJoIRMkC4cpTPYRpwZxTCdKIkqwzJazDSFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZleVoXaEMpQIofIQrgERXrN67GeL8TC64JTUnu9gRI2IEc4CJ3Z7k5YlFMO4NFozP
	 mQReSJaBac3f9t9rd3IEBKAzBvNJibUzZkAb2FlJ9PHw1pVSO9wW8P46VWkOLBCSUV
	 +PG3bG09xFS0q4pPAuEFUqlN0hUJNXF8DHtl28zN3+yfjtBQjwxYlZI0Ui1UJRsS/k
	 SHvKb+rNqHkkFPPPN1OWu6ibbd6T3fWXRj8W10+ZU+S3GPwxlCFINyZzhPK6gnIGN9
	 1OUcltRf3yrWppep+QU5aetNd6eGyckqPqc7FGJbcnAsg4RFsqEx4Z6lQpuQRyX6Hn
	 YRVZx6nt9Bsog==
Date: Fri, 24 Apr 2026 18:05:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mason Huo <mason.huo@starfivetech.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: hwlock: Add the support of
 HWspinlock for StarFive JHB100
Message-ID: <20260424-corsage-strict-026754e5f045@spud>
References: <20260424032026.62301-1-xingyu.wu@starfivetech.com>
 <20260424032026.62301-2-xingyu.wu@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ws5Ee19j9hlkwfNQ"
Content-Disposition: inline
In-Reply-To: <20260424032026.62301-2-xingyu.wu@starfivetech.com>


--ws5Ee19j9hlkwfNQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 11:20:25AM +0800, Xingyu Wu wrote:
> Add the new documentation of hardware spinlock for the StarFive JHB100 So=
C.
>=20
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../hwlock/starfive,jhb100-hwspinlock.yaml    | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwlock/starfive,jhb=
100-hwspinlock.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwlock/starfive,jhb100-hws=
pinlock.yaml b/Documentation/devicetree/bindings/hwlock/starfive,jhb100-hws=
pinlock.yaml
> new file mode 100644
> index 000000000000..b1b27fafe9bc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwlock/starfive,jhb100-hwspinlock=
=2Eyaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwlock/starfive,jhb100-hwspinlock.yam=
l#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive Hardware Spinlock
> +
> +maintainers:
> +  - Xingyu Wu <xingyu.wu@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jhb100-hwspinlock
> +
> +  reg:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  "#hwlock-cells":
> +    const: 1

Does this peripheral not have a clock?
Seems unlikely to me that it doesnt.

> +
> +required:
> +  - compatible
> +  - reg
> +  - resets
> +  - "#hwlock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hwspinlock@13012000 {
> +        compatible =3D "starfive,jhb100-hwspinlock";
> +        reg =3D <0x13012000 0x400>;
> +        resets =3D <&sys0crg 0>;
> +        #hwlock-cells =3D <1>;
> +    };
> --=20
> 2.34.1
>=20
>=20

--ws5Ee19j9hlkwfNQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeui1AAKCRB4tDGHoIJi
0lX4AP9I0ki7wfjl+Gacih/5jCNWey2bv0Cl0SRH01mw9ST9igEAqTpOVGaDMlgH
KjESD6Z8K7DB8lcaXTzm4W5KAGwU2QA=
=GV8i
-----END PGP SIGNATURE-----

--ws5Ee19j9hlkwfNQ--
