Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E5139A064
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 13:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773409119; cv=none; b=Se44+qaFgyto7AAgi0LZ1lZTH9uaco/fgdhrMvJz5kg2GshBNLyymGNCh4WKWINGNfeOgwXYXmjfdkU9/MjTDRcxG/Q2kJ1WcON48x2iO2VS69cL9BtDFct6+ZPE1gBzzDG6eFECxvmh/a890WjzTlvUA52Ynvjytb3C9avswnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773409119; c=relaxed/simple;
	bh=lALyNELP4GhcCwEMmdwHMxGdML3zxVTx/3bKq3MzITM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=YBtHoaIyOdfKulZ62QOGraZjM8tbIPpYxSiNtd/mIzB3sB+7GTjZTL1upJsgGNwAFnaxYQhweYuE4LmOjcaEhigVHDQpRIs0tonfmkxvSBLP+ebyqnBRDVRkAFYyiUa32qwhXXrXw26Hz6ok4QUhWbCQnv+ZnTp6Qe+Byq+BYn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Snd+7/Sj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Snd+7/Sj"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48538c5956bso21203085e9.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 06:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773409116; x=1774013916; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9IJm+mKNs0KTRazp7NbSh/Ls5bbV5YPO1smMsqzpWe4=;
        b=Snd+7/SjI6TLLMz6u2axFDofthrYFXqamUkrpflz27sK09Eo/H7mo+KXKIaEXdQv8k
         j6JbgJMVD51ZTqeCqFdyIqz2FjYdc82/D0DuizHfMrmZEQfHQ/g2LzFa116PRk/NzB4x
         nXRPAy5IalqDFK4Rnq9I4UsWLC9VU4fasCOqmOcDNPEtCsK3JW0w/Htx4im1v4SYtM/m
         EGZau3uLwL3D+iO+XIApzFfhW1pbnvIxT7BgJfxynYGZUu0lDuBYCdj7+4T+Lb+j3Cmm
         44cnwF0K2qktkeAIjutl2Y7a1//epgifB0N4d59Q3EGtQWRFv6qo0gIaf2+7UzaiYif3
         MrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773409116; x=1774013916;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IJm+mKNs0KTRazp7NbSh/Ls5bbV5YPO1smMsqzpWe4=;
        b=d5fLw19XeuQDnalNR6K838h0tR3VvQK0wPFTAmxc5OGX1zRALIgZr7rEq1A413WOwo
         xk7qJGbRH8JpTS4SMkuz6yedxPna/fEGMBp1mP2Ft5DyOs/tWNy1Hb8r8aibJ9PKnVXG
         5fTRdZ/lMAHLa4QLZi0L63aF1jZ/DxtQXs39URehROEPVccmYtT++niMVvoSBCQ6jncx
         k4DTlY4uOjc3EXyFheL2LYt64HlXOhEP+wpqhznjFU153o5ODgP0IydoNRnkpvOj2vdE
         w+3LJrJfWKrK8GWppY9jI1p6NQveuPK0W+5BknBqxbEGn0obbedHIWIKAUKycks9md5i
         PBYw==
X-Forwarded-Encrypted: i=1; AJvYcCWFl1pJlE9WbFfd0NKKIhG6H6uCOcL6qr9VF8h4S16IYAK62d2xBhUueclulPCsBvnrhEkTU3IZd6jmihm7pIjH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4GK9LL6jSlQyr2gWC/3nlvERyEtw2Uo6JdfK4npg9VqFPeHig
	ELnVjswbfMU24/rVOU4DmNRWnFEHtnMQhAlOUWOGN2o+OMn1F5jxP9Fef2Bvz1XXBxw=
X-Gm-Gg: ATEYQzz+1NLMYqw/C7z9IDeuQC+wK8RcflVi0ivE9pLzmAbcqMVGNgnm9Y6s1REpvnS
	roZQvUj6HnV2YtVF/tCAxzZ/jWVVeRianlNI1lAGURhN4C2RKR/LTkU5VqypEv77+Lhdoup8I86
	IGmIdo+B5U5bNjK31usDLkeiw2pm3cPgV4dqDxpW8LdJNTIcx8H8aGBAHuRdZnRQRhPf1Yj5FDa
	bXv3wn2xYn10EsJvvfHzPCsqxd/kNcb+Fc6PghMjXhG0Ui1I7GthIoxEA4ShGFdw+ol3GVhJJ6A
	hVy1ErIN4HqEl1dmOs3rHqZ9LxA/me0Qm2vBBK6JdSbEmur+MFh4rLiz2+dyS9AqMKCyeqS33En
	PnpTENofNsCdkwuhGUxZ0HVqzkRhNtBxnSInLu2Tj1Rmw3fX9Ree1run5fjh8JZDAFktV5g1qCq
	fIFZYJRbeZXtGYfMw=
X-Received: by 2002:a05:600c:3112:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-48555b4b092mr59466835e9.13.1773409115669;
        Fri, 13 Mar 2026 06:38:35 -0700 (PDT)
Received: from localhost ([195.52.25.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f3cdsm352579825e9.14.2026.03.13.06.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:38:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=1fbf434754da647e830e0071687a82f06d0ee1b21e3a2620f738b3f267a9;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 13 Mar 2026 14:38:25 +0100
Message-Id: <DH1P27ZP9QYQ.2IP3X8G218GR8@baylibre.com>
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Markus Schneider-Pargmann
 (TI)" <msp@baylibre.com>
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
Subject: Re: [PATCH v2 8/8] dt-bindings: remoteproc: k3-r5f: Require
 memory-region-names
X-Mailer: aerc 0.21.0
References: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com> <20260312-topic-am62a-ioddr-dt-v6-19-v2-8-37cb7ceec658@baylibre.com> <20260313-quantum-modest-prawn-896bde@quoll>
In-Reply-To: <20260313-quantum-modest-prawn-896bde@quoll>

--1fbf434754da647e830e0071687a82f06d0ee1b21e3a2620f738b3f267a9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Krzysztof,

On Fri Mar 13, 2026 at 2:13 PM CET, Krzysztof Kozlowski wrote:
> On Thu, Mar 12, 2026 at 04:49:02PM +0100, Markus Schneider-Pargmann (TI) =
wrote:
>> If memory-region is used, require memory-region-names.
>
> Why?

This was a suggestion/comment from Conor in the last version:

    Is this really optional? Shouldn't it be made mandatory so that it is
    easy to tell the difference between the two configurations?

https://lore.kernel.org/all/20260303-hesitate-preoccupy-5e311cbd3e58@spud/

>
> I don't understand also why this is a separate change, but maybe answer
> to "Why are you doing it" would cover it as well.

I made this a separate patch so the git tree never has any
binding/devicectree warnings for memory-region-names even in-between
patches. That's why I created these patches in this order:

1. Add the memory-region-names as an optional property.
2. Add memory-region-names to all users of memory-region.
3. Make the property required if memory-region exists.

Best
Markus

--1fbf434754da647e830e0071687a82f06d0ee1b21e3a2620f738b3f267a9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCabQTUhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlNY
PgD/dG12YM5FMmV5c9zq9GvJxbmUXk6S8TLCSlBHnaV51m0BAKJKmAgh9p0rHffR
2XYe9hOtFZ7Oqgui3rMKtB2Gqy4B
=uVCn
-----END PGP SIGNATURE-----

--1fbf434754da647e830e0071687a82f06d0ee1b21e3a2620f738b3f267a9--
