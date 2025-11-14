Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B99B3101C6
	for <linux-remoteproc@vger.kernel.org>; Fri, 14 Nov 2025 10:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763116200; cv=none; b=gs+YnWD4pxvW5c0zE6tem7o1+20SOztNSMgvvS/VgOD4pykBBdWK7cRCL7vGp1f3ZMM3W6n0zIOqa2d0xf4rmKn2P+X0CiwxoSdlWjmHfeZICpvRauj/I5ciTetlajNYq+C7/8uDKwXzNoY076TmBKNABeazD3u5PL4+iHqc4Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763116200; c=relaxed/simple;
	bh=UBbZsb4dMttftP1M96cy0ber+qZ1LFIDjn4+NP/XX9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDGgf/wv6E3xyUSLKuXELGLQEwphs9Ug+quRy/Djqydf/NanmT80IUTMgcc2/HtSwWuadSZT9h+YPbHpmunJCmSuYVMQpXk21ZRt8KejayTKQbKkvPG6zrZUBWamPRjZFX/P1H+xGBZNnKc5ri6v+mPfVu3k898vIC09BAotTSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQPgESbz; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQPgESbz"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-297ec50477aso13144325ad.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 14 Nov 2025 02:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763116198; x=1763720998; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3y1+oIlNcBvHQ2j5491FzfotPp6frKmcPxBxDRPYTII=;
        b=LQPgESbzX5BOqhCp4NEY+J7fatJ5kJEBi/URbCmEQTydrei7PSWmjTww9XecYsgLU4
         e5vIeUwLeBL+nBZFqkadQ1DacS/v+kZZP5L6oHR8jezQe7C/RW6J4tdOlVHcOs+RtKs6
         cLciyWQHrjyVLAoSb87N7KstdULo+RYPXk/5e7NseyzlArtaxaKSV1IvEdT5m1btAwdb
         Ig9vkPDmWfaPh67nqosHX8ckFnKR1IoNTN/TWPQcinwIctjFmoRYjIA5IaMe4PvVrT5s
         0z/pOgeZTEKX/IggHrZFlmD+8gbZVw0o2xrVw7URQ/q95QblUGXeRyoi+uAo4zKua3bJ
         i1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763116198; x=1763720998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3y1+oIlNcBvHQ2j5491FzfotPp6frKmcPxBxDRPYTII=;
        b=DQZopaZzzgvMplzUIOxYT8II0VfAd90ky3nt8HmDbeSR6xO3/NWBVatnKS81pM35mP
         GoufSr9kDbF2TeS83Pdh2oVxHXEsjbZtBEsmOU3aRAdbwNx9Fq0wQLIPPOzc4EtNMFX4
         jRlhpmt8MBNqsgymVI54SqRH+2gxf6u4xHNl+CxZRa29xMm7cjn8huGuoPE0rDTiYeF0
         P1srEwX2YENM9fhKKDNcZf8gJCmKcAO/rL394k72OhFFB2IkSK5n4D893CZLO+LP1B2O
         vG9AqafNUh3Rh7Wwmqs5V0jqS/2+yf5HMgAQk7e8oCY7ZFD15tPjUfhCqwHdHk66Pwwu
         RCEw==
X-Forwarded-Encrypted: i=1; AJvYcCVY6cmIM3Z69Gw8RaFSvQ8QTep1ev7O8n00hBEulxZgGNb7yi0wWnKh0ECOYqwIDdUQ15MFLqg8d5U2v3aEmjPx@vger.kernel.org
X-Gm-Message-State: AOJu0YxkvdIgQnrunJc8W79Ck0s4waBANvULboPyCqjJpRbXf6H01i1S
	PLnNndflgbrXLOA7jRE1wRjMPzYDUQQPCjBh0lfe2W4AqVwqXfRDVZq0
X-Gm-Gg: ASbGncv3ynV1kNNSl9gGxF+LF3v8k7Pn/JMGGi8Vr3FH87HHfoLmKTU42BtyhEd9BEU
	u1CjssZ+YpldJm4j2cdtgz0NN2PFXA6f6VzS3EVKnLucSH+3wY3AyVb5v6JiRCKs+EEckDKvXeg
	jafzzVLHyFq70WJaC/f2Y6BuenYu6wOIYFXAIX/G8c9GSeVRAyMcTsnfrzKAaBGeIEPrdZUpjcY
	uwkcD+NGamcNQnMU24OAEYWnAUiOPTOudQfBp4HM0IFVUFkF7SeFon+3PRKclYBuyyV6Ee3GiDX
	lq0EVsz6OVNHK5DMpWMXOZPAOWWUpQ7U/5xSH2SNDFab9hL8gGsSZuy3iZxPimL3FD58UG+/0i+
	joL1jSckxV35yvjUclAoh4kakPDMUudcbD75fZPDiKPkEMt7HKyAQFm2pH5gol1lmUHmCt5rTBW
	/x4Nk8/RlMqZo=
X-Google-Smtp-Source: AGHT+IF+0G1Z72gXcZasFEt+dR8TBz4EQdEyh5TXVK7VWrLSbxyg9r+z6DMShwpU4TKnPXmx9Qni9Q==
X-Received: by 2002:a17:902:e5c7:b0:295:6850:a38d with SMTP id d9443c01a7336-2985a52b1abmr69212555ad.19.1763116198280;
        Fri, 14 Nov 2025 02:29:58 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0710sm50609975ad.66.2025.11.14.02.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 02:29:57 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 95E2D4207D09; Fri, 14 Nov 2025 17:29:54 +0700 (WIB)
Date: Fri, 14 Nov 2025 17:29:53 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>, corbet@lwn.net,
	andersson@kernel.org, mathieu.poirier@linaro.org
Cc: dan.j.williams@intel.com, cedric.xing@intel.com,
	pasha.tatashin@soleen.com, kevin.tian@intel.com,
	skhawaja@google.com, yesanishhere@gmail.com, taimoorzaeem@gmail.com,
	linux@treblig.org, arnaud.pouliquen@foss.st.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, rdunlap@infradead.org,
	daniel.baluta@gmail.com, imx@lists.linux.dev
Subject: Re: [PATCH 2/2] Documentation: Fix filenames for remoteproc/rpmsg
Message-ID: <aRcEoX9saonpQuvf@archie.me>
References: <20251114065746.901649-1-daniel.baluta@nxp.com>
 <20251114065746.901649-3-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+twDMHafNSzP9Og8"
Content-Disposition: inline
In-Reply-To: <20251114065746.901649-3-daniel.baluta@nxp.com>


--+twDMHafNSzP9Og8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 08:57:45AM +0200, Daniel Baluta wrote:
>    This document describes the rpmsg bus and how to write rpmsg drivers.
> -  To learn how to add rpmsg support for new platforms, check out remotep=
roc.txt
> -  (also a resident of Documentation/).
> +  To learn how to add rpmsg support for new platforms, check out remotep=
roc.rst
> +  (also a resident of Documentation/driver-api).

I think "also a resident of ..." can be dropped, since it's redundant (it's
already covered in remoteproc.rst cross-reference which transforms into
the link when you build the docs).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--+twDMHafNSzP9Og8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaRcEnQAKCRD2uYlJVVFO
o5FeAP41XfZ1+B4P84roVhLdJjUIeYsbQoCOQ0JR5L2Ed+SfzQD/TQHSHzxQVA2Z
NrSRvC/d/fqFsQeTCtXU7p2M914xbQw=
=Lenc
-----END PGP SIGNATURE-----

--+twDMHafNSzP9Og8--
