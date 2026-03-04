Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB7133DEC8
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Mar 2026 13:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772631504; cv=none; b=hSa9OcjsnMtybKE8JZu9fUDxI1aH3vwGrpqgBxRvekqIBm7zrawj0X6zE6k70ltLikEMSuQbbUbxfxaZQxTftyt/RNsr6TVexuIGUblUxbWO2Q3iRkcgoyg5hFJiLLodwae/j09nx6qPMhVOqFdUaLrSi3MPUKVA/riAbfzFryQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772631504; c=relaxed/simple;
	bh=GUYEALaM6WRnx8wWumgwjF/F8NjS7pDDweLv1LJL5/U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DbScbICvvRnBmDfscvU3/EzHPSyHkSNYH2sr3t+JNjnD4Md3IJT7lBDOiOsz2VcAxEFRc2RiVMVvBdEfKSwy7z2lSF8T16y9+XL5Tkz7Ub4TyUuxnFuHiqKf2ripuEIJvDgcEhL+Eaqqk/e19WAq4b1QnyMAYWci6Q+uu74yVyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UX1DbG51; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UX1DbG51"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439b611274bso2233801f8f.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Mar 2026 05:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772631500; x=1773236300; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6xKCzFEa575Ece/U0GGFSt+Fu+C5w9MJrHLEfRQR2Cg=;
        b=UX1DbG515dcjMXIdTHKQxWPTBHXq9dgyw8CfJ+QSb2p6U2OTv8NrOnD6EPAe/ljmMF
         ZARgEk7hv802vGVqUz+tD6i5dCOZkcw8FLbeJu1IVxQEVAqP5zSYhPea4MnwrjhmSolU
         OwswT77M+ReQzkzUkX7ws18yXfdPfrJ4IkALsnBYIh8AHD51ywOYE1Mwsog4RixDECDj
         NyUn1G+i8SutzgOGm+trt/inbX9/l8cxckrwXig9VEvnxEJsN4VmbyPQpNz8DTyp30N2
         H/6KgVY38hTNHwiPo/AiyLiHFg9K8WGj/nI3YU368CGzfYOjNRdHhqp7bXqRcteIu/iV
         qYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772631500; x=1773236300;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xKCzFEa575Ece/U0GGFSt+Fu+C5w9MJrHLEfRQR2Cg=;
        b=ZJKjR6QN5HkHTnorEIYWJX4ERfBYarooAGUxANLJWImwenWLGDZ7YtkkKbePllAxbl
         T10jc4pZQSXRtdGBL5tp3QmrGgVQ3NS/dVlE7XzYFNReKSpxE8/0bDzJ/IAYT1Ir6cZ3
         94PZRCwPiLoxnp7uOqq/nXOIyRCfq9Dx391+GS9a4Dbtj3SLJtP7o6+DYZA5+zKfPgQ3
         QpYCwmyC7e92Lgfzlb64/4lH+0qc9SsMbq+MOdCKTwhnjFk5YIC4kQ8ySJ9SXA0ImURj
         ETCwB/7z8t1RQoOR8qUNMTDmT7v5ehWUk8tD1ZETNndHMO+dV2G4Iy9jzjSjrsnIPBEK
         wdMg==
X-Forwarded-Encrypted: i=1; AJvYcCUfchdgUtwkDYYm+/Fg300MrHT0UTHvVQgbD1ylxQ6v1f9Rr860BIBUfMwTwADEJKMi4RFg/fhE/oTQZOCJKrh1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8bYXHip32sofn6eAyhZx205jebRXkrx+d63dQYTzFss8CiNFG
	dCp3td9e1bHtNavhnFByVOiww9qhLz8i/MxUf/n1RXLV/SlCIhUOHeEfgDVYQL5yOwk=
X-Gm-Gg: ATEYQzxPBkLaKwHruBr6Fez/PZxYygwQM+C3TKe5+bEzh6QwyGMo5IKOh0STrbPYXn+
	Wh44HsHX8o5x8qhekMw+vr9YAj+bMPle6XKhHxiGSXgQca1sjAqqvfnACzd1lR3nXAD2BenU/3N
	sQDnpwNR03vguGpmd+rEpEfBz+0ef1brU/W5ISaa0oGdRYUxavlcW8YXjzvcwXpcUsGRRq0zJ+Y
	/dWNY3gykBmLefV3qfOR+baZqnX769uVRLIm58ERIiOIBAzELcw8ITQP0ilM79NUU7/f07xpuuk
	Otwzse3fSNHWET9R07N7GKKSuh8Tpf1+KI1QcgUPer5+6MxnDJsp6oyBTkSyk75ocJQJeIQRd72
	MRJHlN9vNmJNYLHWsXHldxPZdolzVgxM9UzocBttN3xYd/32a/LxLwpKZJ9cE7zrl6x88e+HBwY
	Z2Qio/2hpp22d1wRg=
X-Received: by 2002:a05:6000:2302:b0:435:9d70:f299 with SMTP id ffacd0b85a97d-439c7f79f5fmr3963520f8f.22.1772631499943;
        Wed, 04 Mar 2026 05:38:19 -0800 (PST)
Received: from localhost ([195.52.25.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b503425asm25373373f8f.25.2026.03.04.05.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:38:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=9f27ca151f75da4521dca0ec3d004e6ed38b66748edd73afbb0ffdc24d2c;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 04 Mar 2026 14:38:10 +0100
Message-Id: <DGU1F4OMYXZY.3S9ZX8TB5S3IP@baylibre.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Mathieu Poirier"
 <mathieu.poirier@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Suman Anna" <s-anna@ti.com>, "Nishanth Menon" <nm@ti.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>, "Vishal
 Mahaveer" <vishalm@ti.com>, "Kevin Hilman" <khilman@baylibre.com>, "Dhruva
 Gole" <d-gole@ti.com>, "Sebin Francis" <sebin.francis@ti.com>, "Kendall
 Willis" <k-willis@ti.com>, "Akashdeep Kaur" <a-kaur@ti.com>,
 <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/6] dt-bindings: remoteproc: k3-r5f: Add
 memory-region-names
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Conor Dooley" <conor@kernel.org>, "Markus Schneider-Pargmann (TI)"
 <msp@baylibre.com>
X-Mailer: aerc 0.21.0
References: <20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com> <20260303-topic-am62a-ioddr-dt-v6-19-v1-2-12fe72bb40d2@baylibre.com> <20260303-hesitate-preoccupy-5e311cbd3e58@spud> <20260303-payphone-pancake-b6068c545bc3@spud>
In-Reply-To: <20260303-payphone-pancake-b6068c545bc3@spud>

--9f27ca151f75da4521dca0ec3d004e6ed38b66748edd73afbb0ffdc24d2c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Conor,

On Tue Mar 3, 2026 at 7:33 PM CET, Conor Dooley wrote:
> On Tue, Mar 03, 2026 at 06:31:56PM +0000, Conor Dooley wrote:
>> On Tue, Mar 03, 2026 at 04:13:00PM +0100, Markus Schneider-Pargmann (TI)=
 wrote:
>> > Add names to the memory-region-names for easier idenfitication of memo=
ry
>> > regions.
>> >=20
>> > Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
>> > ---
>> >  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml          | 19 ++++++++++=
+++++++++
>> >  1 file changed, 19 insertions(+)
>> >=20
>> > diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rp=
roc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yam=
l
>> > index 6aadc61e20f9f4c27f5b9c87ab2025a02776c5de..76ef23afe8c9f7f155dfec=
7fcabc7c60b8b286c6 100644
>> > --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yam=
l
>> > +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yam=
l
>> > @@ -182,6 +182,25 @@ patternProperties:
>> >            - description: DM RM/PM trace and firmware code/data
>> >          additionalItems: true
>> > =20
>> > +      memory-region-names:
>> > +        description: |
>> > +          Optional names for the memory regions specified in the memo=
ry-region
>>=20
>> Is this really optional? Shouldn't it be made mandatory so that it is
>> easy to tell the difference between the two configurations?
>
> Actually, so that you can tell at all, since it looks like anything from
> 2 to 8 regions is permitted (which this prop doesn't account for I guess,
> only allowing 2 or 6 regions).

Thanks for your feedback. I will fix both, make memory-region-names
required and fix the inconsistency between both properties regarding
what is allowed.

Best
Markus

--9f27ca151f75da4521dca0ec3d004e6ed38b66748edd73afbb0ffdc24d2c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaag1whsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlMO
BwEAlzDsVfiuqPCx/XTZv4wEd09mmQ8/q1n6TFL57MQ0VPsA/10oQtozFUWjofc9
KhaPSSQMHdxnVfQ4MrQdxnV+d+EP
=C3Zm
-----END PGP SIGNATURE-----

--9f27ca151f75da4521dca0ec3d004e6ed38b66748edd73afbb0ffdc24d2c--
