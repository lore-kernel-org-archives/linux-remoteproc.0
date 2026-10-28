Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793174650;
	b=Vy2hqI5othvSxroQA0f0JBzK2DRNKGZcvN5Ry1vqhkx9TMZb9v0Uc08RTHWZr82RkEGH
	 xpO7n8QWgRTFKOFMQLpefHWw+C5wHQsiAFyyLYJqQch6cfHNPyMWV8XWhIrsAbpehfIbs
	 DsKEoryZiGrscon41GrlI6htEP448rgnZsSgCjEfJ+Cqx76hGvvnlJvmc5hOdsYlxmsR5
	 H//dTKWGM20XkLBs9oIYOFVcr3Mka3tCkMohoopsGMDmsSrG5F7Km/7hppoA59XTj/x3w
	 RAzPczr3LlIBa1MqmSSKo1WZ0fe9oFtGuEP5eFoybQ5+0uwYAUq46q8KUeFRXY22oGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793174650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=cmUygOtzVQYGYmoDrp60NTGZ/egBDRJwiYY9TeXBYAA=;
	b=qUixZvGOPfiA6U+6mAnDMriPeggX0LVjkVcPACtktBVRFINXsM4VWRGF1j1R19YHnVIy
	 UgRWOWIa7iWnAhUvS1HBiV8nSCYSNVA7pXs3AlB3Gz01s/adFj9jdk8fwNAXkF2wWjR+S
	 N86FMIgsqPSG9r5aOJ0KIxJh/088Ro2Dna2MuH03MZV9l3gR93b4f19jjXZRX3Fx7PGgD
	 QvF3eeFO+L5b4N6GJEFCgP6bnsQ4Cef5y6BjXI3iyJ38r6FJAusdwkE/10vvgWFXLrOWR
	 QJdwLAvTLuJGYf52gYAf2RmGS85Ft07hWdakDHXwjE0skwPv5apCmhD/8nPUnYAxysg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F115606A325
	for <linux-remoteproc@vger.kernel.org>; Wed, 28 Oct 2026 08:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F115606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so5942175e9.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 28 Oct 2026 01:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793174637; x=1793779437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cmUygOtzVQYGYmoDrp60NTGZ/egBDRJwiYY9TeXBYAA=;
        b=VeacjZeXZ2H13/shN5QKdF0Sxcnm9lpHBcpJfpiq/VZZCzVqilfmiMnO6yd9HPmtP8
         TlP7YPN/+pGErIJoG9jZhviV59zAjTP3slB4ZYlffC2y4ybUKnDtr8VDEBowp1/236dz
         41VKts/axq7MozBdQ1YY2hKuPYsWiXs8pAQof3scRBNPlVaD+qoHb8JXzNRQjfvCr75b
         eBgkGWDxzyyYqgqqf32SsbL+4S69QKep2J7ckixHRyauW04C4j2WRVVeZugAz2hZXeqh
         j/n/IfrenSmA+1cUAixL8t72OKzbOqwY1WpyqJttvkxGfBv2p0MVLHQftbPotHpD4HrN
         s3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793174637; x=1793779437;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cmUygOtzVQYGYmoDrp60NTGZ/egBDRJwiYY9TeXBYAA=;
        b=TmyF8wWcae1Su+TdjBjq0yylf9dl+/HhWiO3eYUX7ApMWsIPRb9tdvwv5mLSsMlmcP
         qH2oQQ0vnwIKyNK4qX76baHczy/s8K7wtayhVIda4D79nB5QayG57IWVwJFJyD2I6jTc
         8LGPNXuKCIylzqKXmhHfWD29YPh4s0K6EUHtzTMq3By6kjvoLTz3RIWUZtwKEjHZ97p2
         yAyJEgn/hEKBNZT6endvhlCWb2rrP7Gt1zKcK2ylHHzSun6EjK4dmQoUt53wxQtb+h/P
         tcC4DP51qrjhrv9JTurOnEC93k7ejX413QD9M677mwBr0JA6ettNPGYeH18q3Vws6FX8
         FzKg==
X-Forwarded-Encrypted: i=1; AKwUvBz57iYkbXTUDmbXB7YTTLHAY52U3Cd7Yt396VAkzCmVc+wfdlw68B1xoCQT87mAVCmRXWSAE6iUOvQz2TebuTgQ@vger.kernel.org
X-Gm-Message-State: AFq9FYKp8MtKW/cF2dH9Tp55AL33oyYnU+HHN4euaEx3UXMF/wf0+pK5
	eQNZnHiqzOzC/uWvgmlseXVmX5pixFw7VRFDtjHifYKN0IUekkKba85OFVDTeA8lqfg=
X-Gm-Gg: AYBFou1gEhmYMgEryecXh51jbmc0mHYpFn0V5BYBTqNvG4zk7YP2iPSthshhscBFe4M
	lOXNVwCPtTyFhUb7u8HljbQuL6iWxsPGmlGUhfEfmIHYD2MNdkWvzqm22pIO/dFk27jBszBtPNp
	sCXpyahE8gjzviAbNA5Ifz/trQKzwDXd3qLi+ChxRNySk5rkHwZfDImSxwIqylITJdypjObgJ4b
	hwJcWfbMKhDngzWvm1biX46xG4lCuq/Hzo+ag9biyxvluo2XPNnjdE0j8VS2LXXQt5/nj9Dd4V0
	Wgjm2eHg273xTeOJCE4eLpnVamecvesUnTMXKt8fPsVx45hGhoyURftOOerLh+HDtbYmYTyfCGu
	jpZ3H8bFXYVSlSuoTcKPSBTMxG3QioPu3VMmDk9E+jhHzVAprAStXa/tGKitBJxB2fvecDcRAGM
	qv2//Mm3Cr0raZN8sUN69s3Rla8wIQH18POQerkE0rD++Wh+y2wf9YlBB1gJEnH8DDJeoYVccl5
	CpMF9F5GILe3HLznfhFploQzbAiUoqWmI6cUmldChxI0da1ZXdagBYH6XwMEsElgJZHzxd3CTmv
	YxZ/m2xHV+OniYo8kUHKsfXOQ2F2vfCO82oodIil/enSZ8XxpqqnK/g5qQFLJL9wx1nhpVZnH0m
	nwaGCEgWwloD2KC0=
X-Received: by 2002:a05:600c:c117:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4a9672030cbmr23350005e9.22.1793174637584;
        Wed, 28 Oct 2026 01:03:57 -0700 (PDT)
Received: from localhost (p200300f65f19a904c16506b94501b867.dip0.t-ipconnect.de. [2003:f6:5f19:a904:c165:6b9:4501:b867])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a97bf5d6besm25792835e9.4.2026.10.28.01.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:03:56 -0700 (PDT)
Date: Wed, 28 Oct 2026 09:03:55 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, Dominik Brodowski <linux@dominikbrodowski.net>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Danilo Krummrich <dakr@kernel.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-pci@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3] Documentation: Update after split of
 <linux/mod_devicetable.h>
Message-ID: <auGsNgw50hDIdm3R@monoceros>
References: <20260908070031.32833-1-kmehltretter@gmail.com>
 <87h5jq8gia.fsf@trenco.lwn.net>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oh5zvfs3ycvvg6bf"
Content-Disposition: inline
In-Reply-To: <87h5jq8gia.fsf@trenco.lwn.net>


--oh5zvfs3ycvvg6bf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] Documentation: Update after split of
 <linux/mod_devicetable.h>
MIME-Version: 1.0

Hello Karl,

On Tue, Sep 15, 2026 at 01:24:29PM -0600, Jonathan Corbet wrote:
> Karl Mehltretter <kmehltretter@gmail.com> writes:
> > Most structs that were defined in <linux/mod_devicetable.h> before were
> > moved to a bus specific header. Follow the movement to get the struct's
> > documentation back.
> >
> > For the list of device ids in basics.rst use an explicit list of all the
> > headers that have kernel-doc annotations and that are not described
> > elsewhere (i.e. pci and mei_cl). <linux/device-id/acpi.h> is left out on
> > purpose, ACPI_DEVICE_CLASS() is not a device id struct.
> >
> > Also repair the referencing in the zh_CN translation of pci.rst and
> > don't duplicate `struct mei_cl_device_id`.
>=20
> This one adds some new build warnings:
>=20
>   Documentation/translations/zh_CN/PCI/pci:98: ./include/linux/pci.h:3: W=
ARNING: Duplicate C declaration, also defined at PCI/pci:3.
>   Declaration is '.. c:struct:: pci_driver'. [duplicate_declaration.c]
>   kernel/Documentation/translations/zh_CN/PCI/pci:106: ./include/linux/de=
vice-id/pci.h:3: WARNING: Duplicate C declaration, also defined at PCI/pci:=
3.
>   Declaration is '.. c:struct:: pci_device_id'. [duplicate_declaration.c]

Do you intend to address this?

Best regards
Uwe

--oh5zvfs3ycvvg6bf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrhrGcACgkQj4D7WH0S
/k77+AgAlbsTSlbn2W+qPf7ANkGol57boWPL2S0I72TOezIPXND8DYud1c7YRtKB
PhpKb65OvxBNMec8fqyAFR6akXoak+b0LjgivWXWCOLrQOVwd96tYscMz9T9Zo5a
iRhWUg++SffuMe29/9xFDsjM8JgReW0CUhMfsySfbQm/TSFEl5H+4cCJJsGGtfL3
D1yiIWAQh24ef4OCHJjVjXkWufmtZitqRhecerzr0XU23WE5HyloUqa5j9rMKkiL
0zhPpQMkyPgmas+RNzxq8PVExFJdmjzr8D2BSNitOhQYuzUl762KznuCur+bCurI
6r+fdfpC0jZ68DsEx6a7fNVLvdalZg==
=tz1o
-----END PGP SIGNATURE-----

--oh5zvfs3ycvvg6bf--
