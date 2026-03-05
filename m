Received: from mail-dy1-f228.google.com (mail-dy1-f228.google.com [74.125.82.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13CD26E706
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Mar 2026 20:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.228
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772741341; cv=pass; b=PXkN/sTlr0VuPMeUlq4DGY/i8UuEzwSz6L/TD6cSj2xFiddByZI3BC7z1yv5UBuAZWIG4OtCMAA6ZaqIrqju3IZHMM/2/xMF2dh80Q/+IdFrg6tf5IacEVUoz/fndeckDcAyBAI/zPgsMUrOe51EXKAfwWJwD8HqN5JWT3tZWhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772741341; c=relaxed/simple;
	bh=3wvD3AYRrS6yOZj8ucy0Nvn/NjuBZwLfb2tfc3dtUI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XVH0+EDh1tlxKKzKT0RXhvrBl9oWsXXmadqCCagXRT2jh7xkLnrUgN7twda6N51WBlswiBi5DKQmM405d14D8Vub3y8aibDFro1cOLJcmWMItBOwFzfi5ld/eF2Q/32t32dwA04V9npS7MzH1axrmOKP65fJPjT2EbgLg4/6sK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=TIYaqsN0; arc=pass smtp.client-ip=74.125.82.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="TIYaqsN0"
Received: by mail-dy1-f228.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so710546eec.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Mar 2026 12:09:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772741340; x=1773346140;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjPSvxE1gswMWUEBaOpatt9LbY/aSYjG/agfDYho1/w=;
        b=QQWML5diV45lcbVgYPcf/3AKbu2k1uDrGwmhxG13teTmiA67FOhGS/PLCOWHyLIweu
         jqBM8cvqkUOPP0FtCJFcnYrXXuPGRFnrI2JRZGizfNPy2HciEbbe2Sdnl7o34qDkhr94
         PGFnwy/yXFZYHZDo3zyU1wcxB0jQ+hJyascd1UNBGBWYF8Ryz6HJhzQk2mXwHIdVsN6A
         2w3K+kCfOQvNp0jtCY18XodAPORTG2z8Ajz/NntEGX9jAI2ALn46L5dKfUDI6qUPjmjf
         WZmlqjWCvwsldAvG/zdd7TR4+PoxDexJ1Ew3rfvIDo5gwjOEbvlAbMJarqBEHQvADS1f
         F3oQ==
X-Forwarded-Encrypted: i=2; AJvYcCXzh7VQyChoBOT06Rdm8CQ/v7FAGjB/ilgNH/j7+p+cc2+hDOwIaBAQjbuDXoxOY6JF6sfTJZNb+zj6tMvWu/hK@vger.kernel.org
X-Gm-Message-State: AOJu0YzZKRDF9JnJsb//b2mFbOobJL61HHVt94h297+bCNdV+oXj709m
	KkBP2Rk0KhWs50jCfmAgyfwnycEDhTCGJiVVN/dNRi5AIlOBpPyikrF7ENwSxsDVbCX++9G7be1
	6MVJG9cJFkSPwkYz73bYufD9ORw31ywKuToZYNA1CwarlL/SpKMb/qGCi+f6gUgTKmJ32tkCHel
	51jdBDuzh22xMYCT1CRBi8nD4Vyc0IO1XZdVdYYiNh7oczWTeCHxerIyMpil91ve/8hsMVKWXNT
	soJ/bHIi2U07NfiBioC2Q==
X-Gm-Gg: ATEYQzz5LkDI44ktugz3NZQ2G5vGkC+Cv09QrrwZM+wiDF4U9dANuPE0ErVutzBgXgt
	xcPUW89e63t9hcnagvS4tFEfs/4HBbAA4QPQm9EtR/VwRtTvbEJQ2zlX7CrbwrwbJGyxXIfdiLU
	dxMdMHTfrllMHXfD5H+CUN/JaQzBLEEhNBYAIGgE/RotJQwz9CzW7WLpTM4kXtPZDprabgXGFCF
	P78ZwleUtq7fqgQnwOitzul8sj2Sz3Y1tKL2jsXaGkSFM6gOIX1j5eDK9Q54MxisqcJyA/3XvbV
	7f2k27rCakkea8FzpckySgH8flj4BBQL36UbfDYK2mBt0l+ucUmC8TYcKSJUinVpsm/sOjcOkbG
	bsW/4NKcMIUDe6UIpfCZIhVzRwtVsm8VCJct7r4MdVyRGk+nOZDAs6r8Fl42b2yvIdCRghNmpS+
	rI0wGY1MOsyULSiqPccqqMRcFHCYO8joU9Pgvn18DhMEdJ6lNq7RxzXqWT
X-Received: by 2002:a05:7300:cb17:b0:2be:2f58:2ef5 with SMTP id 5a478bee46e88-2be4a9cee85mr506113eec.1.1772741339604;
        Thu, 05 Mar 2026 12:08:59 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-102.dlp.protect.broadcom.com. [144.49.247.102])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-2be231917bdsm1062189eec.4.2026.03.05.12.08.59
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2026 12:08:59 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12721cd1a2aso125745505c88.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Mar 2026 12:08:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772741338; cv=none;
        d=google.com; s=arc-20240605;
        b=NtoRdP567kK1pY5MP8mGcw6bMaHQAm7YvX8rs+gF4rFvpbsjJXSVsK0/C9kYPKkn3P
         PwOOzZLeI+PVWeJ3E5RSUZz4WPRN/FaPmhB271QVNEkWw8dim+stq3zxi6aQRHb1U+3E
         Q3fyTOdurYQBoCF9NydoII8wqH4lxGHwgKr/yHCafTprfhF9bUtl79s0dG847HbrYZeZ
         pCglI0WB84dFYwV22gsOcClu61hPPmAZIUi396aUU9H09Wd13UmrBNj2rtCJKbMttUCH
         uxrhO8U+TzpOfDoU9bdJFR8CKYcO1dWpJgGCR/4u+ES+ONr1hqpCM/D32qgl8YflZnIw
         yn8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OjPSvxE1gswMWUEBaOpatt9LbY/aSYjG/agfDYho1/w=;
        fh=JRnD6eFR9zYPoBnZKOq5h0ODwj7GmFQGIJhT9SgpoiY=;
        b=M8XxH3p/TdOETWj4VnRT/b9eRYJoCYjskaexydZmBoMuea/IB1gAkbKmT+rJprIsIB
         QBdpyz153Lo4IMh4cZDN+oX37fxHML2Vf+wvrAOw1CENsotIEb3DBwmwuxDVpgpMtrsr
         G3vwUJd8o2NPozkK02t8SR29sU13gTvVGVMZI/aJ1RIlQCU3U+nJu8YSZTTzPqhned1Y
         sNu8W9j13Mc7NrCGj1fbbP7ilrJPYuzItMHIzYvQDbsNPovD/cETDz+ukvMSWSIhaKJ8
         hMxxpn50zlXpYcT2BUkD6g+7W6jj3VtEvoob5RCRMP9i+Q6JA4nq3YR7iB7P1JeAz73q
         ox9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1772741338; x=1773346138; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OjPSvxE1gswMWUEBaOpatt9LbY/aSYjG/agfDYho1/w=;
        b=TIYaqsN0kOGsNDk9kTbEck1bI0VVtsGD1t8IW2kdRLtozIrZ6dJ3bohbycojPuwPlx
         w+AgIWm2OMzldlL75Z8PLAUtuXIYUWmh5z5iHy8zRtxPSVsuhssozov8Ujw++JrOWKIx
         +eVQioiCi+nAXSCdHQNtycvcJjvPX+4R9Nfag=
X-Forwarded-Encrypted: i=1; AJvYcCXeyLPIZNm7n/+LSQEQ5gjzVwCBLJqLpLK3+SRXds1PHRP77gDN4ffZyXq4cK4C6a9G3kp7zYwf+iftU7hHt44f@vger.kernel.org
X-Received: by 2002:a05:7022:b8c:b0:11b:88a7:e1ac with SMTP id a92af1059eb24-128c10c9716mr546674c88.19.1772741337909;
        Thu, 05 Mar 2026 12:08:57 -0800 (PST)
X-Received: by 2002:a05:7022:b8c:b0:11b:88a7:e1ac with SMTP id
 a92af1059eb24-128c10c9716mr546651c88.19.1772741337353; Thu, 05 Mar 2026
 12:08:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224220407.2351692-1-kamal.dasu@broadcom.com>
 <CAKekbevZQBdvH5CCGyCDhs7ND6y65C=S3k1Aop8eh4CV5r_4aQ@mail.gmail.com> <38c0a23e-88cc-4f26-9648-fdeb9e99160f@kernel.org>
In-Reply-To: <38c0a23e-88cc-4f26-9648-fdeb9e99160f@kernel.org>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Thu, 5 Mar 2026 15:08:20 -0500
X-Gm-Features: AaiRm53XZhNPPi96Ac0somFmO4m3j6WMSccVLybwlqQcDsC_RIXA2i9TzPTQmH4
Message-ID: <CAKekbesOEL5kTYEq=ibsiuDoY2MGxJ6oxAkGrR6v3yQLUsLcUA@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Adding brcmstb-hwspinlock support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, baolin.wang@linux.alibaba.com, 
	florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000be33a8064c4c8111"

--000000000000be33a8064c4c8111
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 2:59=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 05/03/2026 20:17, Kamal Dasu wrote:
> >>
> >>  .../brcm,bcm7038-sun-top-ctrl-semaphore.yaml  | 45 +++++++++
> >>  MAINTAINERS                                   |  8 ++
> >>  drivers/hwspinlock/Kconfig                    | 11 ++-
> >>  drivers/hwspinlock/Makefile                   |  1 +
> >>  drivers/hwspinlock/brcmstb_hwspinlock.c       | 96 ++++++++++++++++++=
+
> >>  5 files changed, 160 insertions(+), 1 deletion(-)
> >>  create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,bcm7=
038-sun-top-ctrl-semaphore.yaml
> >>  create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c
> >>
> >> --
> >> 2.34.1
> >>
> >
> > Hi Baolin, Rob,
> >
> > Gentle ping on this series. Patch 1/3 (dt-bindings) has been reviewed
> > by Krzysztof and all previous review comments have been addressed.
>
> Why pinging Rob? You got DT review. Or one review is not enough and you
> need multiple maintainers engaged?
>

I am good with the DT review. Rob commented on previous patches so I
added him. I just need the hwspinlock maintainer to review the other
two patches.

> Best regards,
> Krzysztof

Thanks,
Kamal

--000000000000be33a8064c4c8111
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
H0K0rs+X8O45xZIUJlxzf5UZex3BLi1f/H+08rSQULWEtO/ECwkFod2DIzSX7fZdz5RQ1PpziEOp
goo/JZPYIeCmgt3rIyvMuupj8Ymb0J/velhpXfQuYUM52viw2nmqVcxCwBqyM3Iq7eI4xtEOFRmR
wxSizd3MSQMf6GCHA4/B/6ttnxhGAr3utaOU+x/RnzG0gPLTW1XRAQ0+GVc/tGFdI864OG1cyrRl
GvBnHJQSAFOIKwYrUk2oFpgMbafQ6osCAwEAAaOCAdswggHXMA4GA1UdDwEB/wQEAwIFoDAMBgNV
HRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcwAYYt
aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIAReMFww
CQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZodHRw
czovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwIgYDVR0RBBswGYEX
a2FtYWwuZGFzdUBicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQwHwYDVR0jBBgwFoAU
ACk2nlx6ug+vLVAt26AjhRiwoJIwHQYDVR0OBBYEFOV9h+N/T9ZsJ40qRxh7NYYD+N6MMA0GCSqG
SIb3DQEBCwUAA4ICAQAKtKh30wv1/30230mCimgUjMWQE/LImRmyfDgrp2IhBVS6mDun+wH8thEB
WhBHQMz3gsGixU4ZBJG72eWi39IzQ7CGnisJwA0+hsGaGg03AVtFtqo1rXYRZ81MEDOb6BPYLigJ
RsHbNmrUGR+LsGeUwOWUeRXqBrYaYFrkgHKvVK1NEewv+vUY08n4tsezO3jq0HKhVDY46bMbf8vL
oQqqhtcQvu2+5FK2jpUayeubpzPwobjEG61RIhBvM0KivY4CB2s9A7qgjL1XBycAybIvG03BbFoT
t282FqXwk9JU6YihLlt+hpzO9UF7E8GZYlQlVIZOLOvytqilhua+2h77Yy8Jz/FJyIXKuaLPtvb2
SC2shL7jF28kQbP3QUKwAig+cxwbpngnUkd9D9cXSHVq9PPwYm0A4eAO0YQ/80Uq20+gXF++g0sy
NKrrV3i0T1dbCd86miGDKvarGzjh7pdsdwNY15liGP6Orib1tnWkJcbtP1rJty4r/mbbxcK8ILO4
IvTGFG6BfjJ+La0aRt69i1fQmjUWHLwzkLNpw9cJH8/MONZcEJeDkq9WELSyy29bagStk5KHu7NO
TH65sZg+i/4qmj3DEeEGTr/Shzp4YWSNn4W7NEelr0VgDlwa7xqlwZjXxG4MIJqy0SsQlAwEXtqd
nH2FpJfzgAetkuyU6DGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2Jh
bFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1FIENBIDIwMjMCDEca
ZUGCu6d0oT1M+zANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgLSmWdQjIvYNUlNCQ
ggtvQWGDlj6QlPv+Nz0l57iApFcwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMjYwMzA1MjAwODU4WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgB
ZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEw
DQYJKoZIhvcNAQEBBQAEggEAWT0BrV5ljR7YdMHVKFUuX1zj+/luVKAc9MoEGj+28b4gmwiRUb6w
Hqu2PhOL+vAmOrHv6vpedAQY63IvX67WsuilJz+5D5qAAedRBuLDqps6FVFzb385cibdhpRxAvfH
VEuleE5s3dTNwD1zBU6dSkLjXDv0Or+v/m3Yn1iTa16P6nMZ/RmKZ5NBmU9Uemg96n0RYQ+2CrwO
k5eEZDk2THrxIXCb/s9XV9bg5l/6goxIomXiaFZ6zr6INIFyYsVAA5vwPIusWAQCarbPLl75PklV
UJ251kG4CwU8YSxl99LQtS6Yv+ymr/mMP+RTwQmo+Vnboboc2Iya8xIBfwvyhg==
--000000000000be33a8064c4c8111--
