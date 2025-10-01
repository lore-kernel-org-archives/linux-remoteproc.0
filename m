Received: from mail-vs1-f97.google.com (mail-vs1-f97.google.com [209.85.217.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B071727877F
	for <linux-remoteproc@vger.kernel.org>; Wed,  1 Oct 2025 15:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759331893; cv=none; b=Ur4z/WEsa1Gyo7JdepvX3CdMCiLhz8vhi6vX0jNBBkS98Jvf8FjqUHnoxorajtkZEYgTvQjH1DNxWEsX7V7ae2e9tMo39rb0ecA0SJIl65pH+sh0FM7nt15f53VDGFDWp1CM/oypGGUVeZqK3pxY7AgPoRkzdFwq6dtwMoM+heM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759331893; c=relaxed/simple;
	bh=DsFdARJT8QJgmt7pFIJcJoR+kJE85ZKThorHzwuAuS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oS8N4sllBKg3AukYF6jsRYC5PcC/p1J/pZ1VNNz0pLoPWW005UWVJiHW4I9MNvNfUDAhuYARd4eufDTGy3o6ylLK1Q6Dntz86a+il8bBVpPKWFab96YRrhyaDoM3AU9ZIxHNg+muScT+/1yJCC+xqJl1aBWTRalEwb9c6tpiEvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=YFObIvAr; arc=none smtp.client-ip=209.85.217.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="YFObIvAr"
Received: by mail-vs1-f97.google.com with SMTP id ada2fe7eead31-5b658b006e2so439137.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Oct 2025 08:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759331890; x=1759936690;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K6nFJeyHTKtj/a+Uk8GmrBoIiC6eio5bB+u+kQ0Rm/k=;
        b=etwASflR7eVhpjeiqZ6X26W+aEacWkHL3Iiz244EJKd6GQiaGkWdADX9nmzXJGd17t
         oWz5a9oWnAwHLpenv2fvmnpvgx5D2D/w0/eYRggBCQ1WsZ81ABnTo7a7ezQMPawtStYr
         +l5gOV8BWSPoDWGH1ASToaXna+aaFZ57g4koOEFYhaLl9pOcq3ok9LrixJHJnMl5+Hq6
         lMEmft4p/sYPDHHMJABocnvybkCcN81gWEaFq+nIejyFQpIM1jDsicXLEHKY1ZHSAcAC
         jS8OBTNySVq9MApxDO+6L1Ir8TB8oTTcqx6OF90mp8etJTAEq8e6JXXrilj5fBkJRsux
         5ixQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1+ihjtqYed960C8m2Zu7eCzNOU25QCNcMwyCNOG7tkVrxjgC0NKUeEZWQ4q6HHOcHeJG+BDLQlM5xgGvt2HxD@vger.kernel.org
X-Gm-Message-State: AOJu0YwuthCjHhZbE+d+v2BjrMXrdBaqRV0utEC9J/X2KMsKPIpzeoVM
	g+y4PyJba+OcHfLqKC8OxzusHg8lJ6meT2prCWVbrO31CTbBAjqKDBSP0EBjx06WCkaGhtcGK9X
	lhn/KYex1knxTG+v4VxOj4RXyeg9xUB6ye0X2GXb60JBn97P3Br4oR59wS4scDM6rPShAYea1MV
	qjKmbjquiWerFZ4rW0BRpe5SSWhZ1Ffk7P1pticUGx9xd9qqsZyTXKP0HebtVN4A0lIgX9kmjJ6
	73NWF4NJMj75QAVoOP8og==
X-Gm-Gg: ASbGncsPu8uM3oBbDrCA42eaWNi+YYPyYrFcPDMqbkTvo6kseopRp5S8nRJ2GC/4gS4
	fiRB84oUM/C4w9wUnQNU++3j0nmmLixklaJ9745+xnwDXIccluEq+dQDS3MpJ1HT4GWPWB2Qbtb
	DzFC/D93xeqHIBqwxg6e+fxleW1O9LEh9WmJ99W9zzUBHHEp9YAIO+JZSmAxa0I1ucf7dvf613L
	QhqmXtn+sKdC4qLnW2+LtfegrjrcyeVz4tmIkvj0ViJ2pTOspnibIF2wZHLaOvDMn7v0y8wmAXq
	enmVYWWuUjEY4NS1Xdlp91yNkyhxrUHHejGNyIXulWbVKVf9sX8LoEf2V19jBSKl5+LekKfWezd
	KmyT6oWOiU3vzLzV3lQiOdYSaIGxeElzVCjE4/1VmhWvRvpxFfQ6SNOFav3CH80medn7zmU/b3e
	KQkbX1
X-Google-Smtp-Source: AGHT+IFeU2rmlqo9MV4Go02XQ2bvuNPov9XVKsyl24LguA7sCgfzdjgV5bzjpbwM4EEIgc9SxWh7Z+45DEN1
X-Received: by 2002:a05:6102:942:b0:59d:c33d:2ffa with SMTP id ada2fe7eead31-5d3fe73a5d1mr1748824137.35.1759331890240;
        Wed, 01 Oct 2025 08:18:10 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-8016193c3basm12095456d6.23.2025.10.01.08.18.09
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Oct 2025 08:18:10 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-28a5b8b12bbso88233055ad.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Oct 2025 08:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759331889; x=1759936689; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K6nFJeyHTKtj/a+Uk8GmrBoIiC6eio5bB+u+kQ0Rm/k=;
        b=YFObIvAr74LNpAJZP+wO5jQSeBVaqKhdjqmBOdp5V6N0ekRnECCR306oqVyyatrLu5
         rc03JQq7Sj1o8uvL1wh533hndVcP/s478y7obuf1ZtWqhXc1yQq0GXZhVjCHgMJy8J80
         AeG0RBbMtfBgBo0Msw8azjY2K7GKBtgcbhVdo=
X-Forwarded-Encrypted: i=1; AJvYcCVKfU0jUzkjpuE+96SM6mAOjDOPC9CoE2vw2wFN553GUhC/0gjIXtoJA/PDeuIgFrDqIAItyJJTq2wlWyc0MfWi@vger.kernel.org
X-Received: by 2002:a17:902:e94d:b0:269:8f2e:e38 with SMTP id d9443c01a7336-28e7f28e295mr49661665ad.6.1759331888827;
        Wed, 01 Oct 2025 08:18:08 -0700 (PDT)
X-Received: by 2002:a17:902:e94d:b0:269:8f2e:e38 with SMTP id
 d9443c01a7336-28e7f28e295mr49660895ad.6.1759331888320; Wed, 01 Oct 2025
 08:18:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
 <20250929200628.3699525-2-kamal.dasu@broadcom.com> <20251001025817.GB23170@nxa18884-linux.ap.freescale.net>
In-Reply-To: <20251001025817.GB23170@nxa18884-linux.ap.freescale.net>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Wed, 1 Oct 2025 11:17:30 -0400
X-Gm-Features: AS18NWCcq3eN4FdOzM5f0FjjotdjmkJWoAveQBfXl1y26_xl4LO9iIVGS88_QGQ
Message-ID: <CAKekbetBJ3T+Kv29DktT1rHkw1aOq1C1C4gdF9uabUoiA2LWGg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock support
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: bcm-kernel-feedback-list@broadcom.com, andersson@kernel.org, 
	baolin.wang@linux.alibaba.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, florian.fainelli@broadcom.com, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000004d96f106401a6066"

--0000000000004d96f106401a6066
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 9:46=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
>
> On Mon, Sep 29, 2025 at 04:06:24PM -0400, Kamal Dasu wrote:
> >Adding brcmstb-hwspinlock bindings.
> >
> >Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> >---
> > .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 36 +++++++++++++++++++
> > 1 file changed, 36 insertions(+)
> > create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmst=
b-hwspinlock.yaml
> >
> >+  - |
> >+    hwlock@8404038 {
> >+        compatible =3D "brcm,brcmstb-hwspinlock";
> >+        reg =3D <0x8404038 0x40>;
>
> Just have a question:
> the base is not 64KB aligned, so just want to know is this module part of
> the other ip block?
>
Yes this part of other ip block.


> Thanks,
> Peng
>
> >+        #hwlock-cells =3D <1>;
> >+    };
> >+
> >--
> >2.34.1
> >

--0000000000004d96f106401a6066
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
ZUGCu6d0oT1M+zANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgz5QRTOnbj4RmeIeB
dJv4tCvWvQUojjcv8cai/01EVIUwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMjUxMDAxMTUxODA5WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgB
ZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEw
DQYJKoZIhvcNAQEBBQAEggEAgg/MH/S6NM5PbuL84BlJQ6MZJCW/mtMWiP8IytIDqYuwM4C9tti9
XQ5cU542uREmCwHdepJLpn7OR4yoFAI09fkw38/c5uSEt+Ef/9cUch8+VYH5JAKNjGzc4GyV6jdM
HssFn+7at/VWfQVrcqgTPY32VLvERuZQokguh4rOTcxVNP+qBGXaGOZkOxqzMarExdsUrJkQ6kZL
Yj0d2TbQnoHPF7Y4igiW5vjtxDDxiL2E8DPB5XCQSOqeG6+/pddVCUGEtrCfh2trtbqzh434pEhj
79Swj42iAQ8PkI0in2uTnCkD90z6h/l6IALy/seFqQ5hc9oyikswrBaVNVOhdg==
--0000000000004d96f106401a6066--
