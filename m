Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA3528EA;
	Sun,  3 Nov 2024 04:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730608440; cv=none; b=TSUVm4K1HY34SsdWDtI6zsyaXwmmGJlEgJMKu9Cq3kAYsU7UFhYmcba/7bXxrZFvoj0Fb8sf5i4hgp/9gNvSmEB9+Q0z92tBPj2RO6aSZpLkfGVi/miBPCjD6OQci8+GkDZWu5A6+FAKR2DVv/xn+lzbo1ivFDwdjnRsH4LW1GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730608440; c=relaxed/simple;
	bh=AOXl2fE38g+pYffxexzXwnV1Ljihe717OpCxiasdEjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BvAcICS0CH0Qr1rn24d5jNwroOFXH1cHMmIOiV21km7WQD0dV3v4d4F+33as7oFOsS/ztKNAV2fiUWCiJ4tlqOr7OGFw0xxoYEY+9O/6zdqMrt83z2LqCnnHjCam7LiI2scrXCDZg3A2xtp0x5Li7E98No/dOoqh0u4P2ifKPFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3Pn4Nan; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3Pn4Nan"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71e52582cf8so2734805b3a.2;
        Sat, 02 Nov 2024 21:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730608438; x=1731213238; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WZAuhtOauwqrAoTjzUTGUR7IGr2nFokByGMzm/jQiDU=;
        b=m3Pn4NanY2yn+T1ggGdJK7vHKgDdcZtULR63WkVfwT58oE5lvbBgEt/yiPXmh/fRXM
         lGuW4gOolGbGdyZLJGNndlFh5aDt7I1PbVL8KvwHs092mNN1ZtmCUHqbBfOu5JUYkO4C
         jaeznurEotdGLuWJg7ERcv+AIg69tL8CrFFHoKGNhfveiqaWxCoS67vLIFrDhREa08Oc
         26ig6x/OKvsrPVMDgOgCaMBnYAIa1avSAml4c5sI53oTHitYP53wko2/6dvI1+fx/wXF
         vdN5YmMY0zKo6Wm50MRLaoluItIQE3dD4TLFDjuyImveZ1ZykaFQSbQayHrxTpfO/XS1
         53lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730608438; x=1731213238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZAuhtOauwqrAoTjzUTGUR7IGr2nFokByGMzm/jQiDU=;
        b=wQi9zeXboxPA1X5FXGtIoFeDVChVNWKDVetuMf2tuMRD+N5INrUmw6k5Tm9yj9DzJI
         FLbBjho0i4MHkysZeWhq6zDR58jKtw6AHRAq/4cwMXgG35gW8MxgJkOvufVvZLMIt6i2
         KYSebmzMlEY0LAYtZstp3xg0YG3JWOpZt1ygWoVETdKvbQ3JR9wrbUbfhZ2Yq4ElQZz2
         KPiGLDz0ZVgYUegyRTijLoQNlVe6MLt0Dj4ZJHwNgXm7MhjE4GKiwqC4b8T10xUsdmrJ
         tXcG6IvfNeobwygxWMwp4YUSQl9tTTG9YbRUuEv4CA+J0mn9u7EzJb76LSjPCAoYxHI3
         i1bg==
X-Forwarded-Encrypted: i=1; AJvYcCUnL10XeO0AhWJ874++mXXmeYtJatq5jI52umPi5Qt7EoEXFKpwpkrPdRPFYaTjaMHFLKxXa1HEB80pTvgwVgle5w==@vger.kernel.org, AJvYcCVTbyzrbBO6ap/09KMI6z1bJUa8azj98RZ42SOnWWzLKdl/4U2c3uLBdxvARMiEKaUFFtntPS6F6SS3FL2n@vger.kernel.org, AJvYcCXDqR9NfVoURuMWOozPdsge7T/3c08HMTRZ0XFOoEX4ceh85CBztrKvW1AWOwjx5dcdO4pg4DerjLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkGXCDaXjvBlec+PvHVWEhoSJIKmejbmxR2y0jZLQYxmO2PBe2
	5+yMS8168Y3n/HehNxPLr50azSOHPsFwRzGY8O8k0BSlQT6aDeov
X-Google-Smtp-Source: AGHT+IGvpSuZXrPK2QGqFXEaZfWJIaRCCUOqHpDu3T373+UbdA/a75udXVfPIvfOtlJ+UUPUydaRXA==
X-Received: by 2002:a05:6a20:e605:b0:1d9:1906:a68e with SMTP id adf61e73a8af0-1dba55ac470mr11836622637.34.1730608437868;
        Sat, 02 Nov 2024 21:33:57 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1b90e8sm5000851b3a.25.2024.11.02.21.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 21:33:56 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 194624207D11; Sun, 03 Nov 2024 11:33:52 +0700 (WIB)
Date: Sun, 3 Nov 2024 11:33:52 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	anish kumar <yesanishhere@gmail.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.orgi, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH V5] remoteproc: Documentation: update with details
Message-ID: <Zyb9MJ2H0bkRXk3X@archie.me>
References: <20241026212259.31950-1-yesanishhere@gmail.com>
 <ZyT2piU27MF28XcN@p14s>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="prVtwJ4O92547TcU"
Content-Disposition: inline
In-Reply-To: <ZyT2piU27MF28XcN@p14s>


--prVtwJ4O92547TcU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 01, 2024 at 09:41:26AM -0600, Mathieu Poirier wrote:
> Before spinning off another revision I encourage you to spend time lookin=
g at
> existing documentation.  Reading various mailing lists with a special
> focus on how people split their patches based on topics would also be
> beneficial.

That's why I'm more focused on formatting and wording to get my feet wet
on kernel docs...

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--prVtwJ4O92547TcU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZyb9MAAKCRD2uYlJVVFO
o+qSAP9IT/sQsL5VMH7lYSqm/08CIwNCqkaCZsEqkiGZSvYctgD/QEMbrX1r1uTw
3VWE4hMg+LvMX0mcRbWKCo0S8Acl4wA=
=CyG2
-----END PGP SIGNATURE-----

--prVtwJ4O92547TcU--
