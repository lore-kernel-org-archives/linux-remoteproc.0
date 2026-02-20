Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD4B3033EC
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Feb 2026 17:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771607133; cv=pass; b=OYL9/4KQGgB57DeGh6UZ5hAjx5VnxRwVUdXiirTofhopXGjjfmWegr+Oxyj8zAagzsC6m5vYsDg28+Ta9SHuCSg039fCsR7p4MBbAyHe8r1VmT2aPtaEW4rXVMMNLXNIzWVAarvtXT57ZLCNQVLe4M2MuOrUjdX4+8MrXlaecE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771607133; c=relaxed/simple;
	bh=Iuhm2sz+/edA/YCkqWD+Oqo2bsqrPtG109M/h7b9yjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X46P/PfPpxD7XHMVFTDOe/RUcheN4si7SovcB9Zv343nfyIBGYcWogcY6pzl8RLEb8nk0javUT/xa9DizpmBTQ0AC4fVzwk5Pkyvjvb4fGumMExQtZtXDImrbU/D/E0v+hGklN4v4czNY3/uraWUxyAwCyoDV0IwrlCGO5sY33c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=eQRUVUJM; arc=pass smtp.client-ip=209.85.216.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="eQRUVUJM"
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-354a7b089bbso1471893a91.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Feb 2026 09:05:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771607131; x=1772211931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMD3lvQfwL6gMUB5ZRn75K1BDVhtaN7JFvkEQNX/f8w=;
        b=eLb6xIbg87OA5ZiLNx5YtBazmott4mLoRCA0uI6cDMM0R+qaLfjA0PUw/C7dcRzGyf
         UrCsPf3OTwozZKeAEfl0rfmdx6tGf20rMhN/swVwrxDI+MU0VyYFs3vlmtKe0oVAq3tB
         1EKycsvYYVXOtYfQoBALazoO91dsLl5RYAy8zYLOxwm5ASwhgcItu+BiWxTPRG+NXKnC
         vIta3QzZwyLeaLwdRfYuZu8lyKcsXtlNRw1rD0tTfKT3q9FCZ0Gk4flY8hZzeKAwUs3m
         lH+pU9v3gk3+reMw8UIikG4WS7U3+KT2iH1WLr1GR89JK8Xbb/TjghrUZn5mb0In70K8
         PyWw==
X-Forwarded-Encrypted: i=2; AJvYcCU/+QIOE0mE0sBMJGz9rSQ9kjsOMqfpkMGdSg6GWLR11W0usWWN/87jgTDPu60hH6WX9v61Jg0TRD6i9BOW94s6@vger.kernel.org
X-Gm-Message-State: AOJu0YxeJnM+QUdyfr0XNBJ5z0y1epMunjFkTix1HcvGVuh4AU2QCjgp
	/adEMP5Kj7B80CgAVyclrUz5FD4WB605NZW69T39JS3fmwQ9uLGjlZGGzASOy10FcdO/j3TAquJ
	JOvIdb42tksBpm3RhIBwBreY2Qg6BiNwasvQw3bE8ddydHq3H4zCgN8oO2+aXOhwgr9M/4lRlXB
	NJlaUTGov2nuMYlKcACppjei3a7g/lXykI5Ho9UINCpqoM4SzFumyYnhmolwSDOObo54vKb+aba
	t/uYZLcS8hKNyjEM02hog==
X-Gm-Gg: AZuq6aJETlRyOaVJxRqwxcJNbVaC6aj1X06aKgBFqY5DF7iJyF1f6qTqNsH0wwDuCb7
	NuBSu2zgEzGGCjfJm6Eg2Re4Wu++tbIa8DwGk7I+hDF99+ElJ5P77wXiWJMpz+JYZf8LN25wWgQ
	aTVdgOLM5KxEOWknvL0G5S81MUi9ASOYIcuWAujg2zORfbCGm/Ea5iIXeoA7GhXA5PE0aaoleF7
	sXtmUR/pEWvGQ9eqB+bRHj3mfWTXWAmts78Rnds9NOMFrzQEmgBtoEvm1+WAVt8iAETK5LsL8Fz
	P8I4CoFYJeN9LzYQs3QAbCQaPGGMlhPpiIa0Af1bFy88IaHLyjXAfkS+iXs8nYnwjIc3n9/DUnJ
	5I4YW64Pzz2hTdl6Q1PorU3T4wtg71/xKK+RLxpcGGEvdpia8IA9hyyz+BV2Wn4+DZTT39YcWN9
	CAI8hGD02CfyTf/065bP6Jke3+RG8UD9rHU0r8/nx9El9PEfrKkHk=
X-Received: by 2002:a17:90b:56cb:b0:353:4f7:cc3a with SMTP id 98e67ed59e1d1-358ae6a20c3mr324232a91.0.1771607130957;
        Fri, 20 Feb 2026 09:05:30 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-2.dlp.protect.broadcom.com. [144.49.247.2])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3589d837bfbsm537041a91.6.2026.02.20.09.05.30
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Feb 2026 09:05:30 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-124a95d580cso23964543c88.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Feb 2026 09:05:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771607129; cv=none;
        d=google.com; s=arc-20240605;
        b=TOsY6cOr0npOw4+VK3uXVDrbSW9E6WPvwXHzhy+GbI8VhMyTvVlhzWM2d5uFxhS31a
         fUbhj/fFKaqp2tD+tnU6ofs0Kvyar5MI6kzdWFrZUXJFtyFN4ErLJnm0d6fm1G+wMtaE
         pHahJsFWfFMAgN9XX7TMe8HxBprSPgVjIiQhpgDH7NcqLipONTOOyCnj9ss0PTSYcuTA
         7AK2QsrE6ZL3tVkdFlPz2TzqorMGMN4x3ty+nudW4B01zsx4LXzT+defJyf+HPblk2QW
         xLfediq2RJzQG1Or3HDNCCzSnDnIYMPUHI4rvXb78UmlqMtztg0NbvKeqx3Mm5YtVGIb
         JmpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iMD3lvQfwL6gMUB5ZRn75K1BDVhtaN7JFvkEQNX/f8w=;
        fh=eCD2KMzj9Yqb/eoLwFSJSGumKcTpuOosEK5GRBzUbG4=;
        b=KW5fjhhJ2wkDV5bbiabCwRRjJib/jkvCrDLImcmAo7rqjRBxcZBO/LVPOnQVM6QQWD
         gU8uBpc568Ig7C589kNVyMKLkI3t4ALq0Gv5btFohscM2UbFuHVv0tg2voaLwB0HtNsD
         gYP7HC3Q4pg5emJzs+lqBo5uGcf6J7c484TM8Vlwli1mq0U0XTMAUTnDef3p2cfvzfoL
         g+XOir0qhbBxMIlY0haiBISfCjolLd1CWLHwB/YeWc1RY9pFsexa6cDAoLilCAhFpfpS
         a/qnZNnr0VfSKWDBSls4DxqxvN20gJKd+X+AZGxQGy4vl5sA0V1Kw/tuEDcgt4tpJkhf
         waMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771607129; x=1772211929; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iMD3lvQfwL6gMUB5ZRn75K1BDVhtaN7JFvkEQNX/f8w=;
        b=eQRUVUJM5J7phThtEG8m9m8YL3L+l05KN/ScoNk+jiXs4cilKShJFN76Xv0AnVMfDv
         mCllz6czF9dBEn8FQs7u6YA1MXYQz4fhRC1c/OCpq8Z8CTDKJ8n2B9Iu5FaQa3jv29PS
         kLHa5d6K/SUOhTuI6xgyarzGOB2cGGpJ6uGkE=
X-Forwarded-Encrypted: i=1; AJvYcCVu9qRUr3Qc3+d/HQ9V8E8RE95SnHwOlIkMMcclwynvGyeKi4HbTV1VAuG6Yx00HIc+DWVaNauUPIBrHLJ1Kjmb@vger.kernel.org
X-Received: by 2002:a05:7022:6607:b0:11b:89f3:aaf8 with SMTP id a92af1059eb24-1276acdaa4fmr103623c88.4.1771607129066;
        Fri, 20 Feb 2026 09:05:29 -0800 (PST)
X-Received: by 2002:a05:7022:6607:b0:11b:89f3:aaf8 with SMTP id
 a92af1059eb24-1276acdaa4fmr103604c88.4.1771607128549; Fri, 20 Feb 2026
 09:05:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219215702.63321-1-kamal.dasu@broadcom.com>
 <20260219215702.63321-2-kamal.dasu@broadcom.com> <20260220-agate-okapi-of-recreation-3cb930@quoll>
 <3e4a18c4-7d31-4fba-80a9-5eddda7aee68@kernel.org>
In-Reply-To: <3e4a18c4-7d31-4fba-80a9-5eddda7aee68@kernel.org>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Fri, 20 Feb 2026 12:04:51 -0500
X-Gm-Features: AaiRm50jssNl2QlYgPF9o8fJNaSvEuLUs8-heVLdJolLvKmZHuSRtYZl_ZuI-CM
Message-ID: <CAKekbesh7whKVLeczN2dfz=HD7eM5XBrq6BHJWKEVpGCyVVDkw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: hwlock: Adding brcmstb-hwspinlock support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, baolin.wang@linux.alibaba.com, 
	florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000a29bb2064b446d4e"

--000000000000a29bb2064b446d4e
Content-Type: multipart/alternative; boundary="000000000000944391064b446db3"

--000000000000944391064b446db3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 2:31=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> On 20/02/2026 08:30, Krzysztof Kozlowski wrote:
> >> +title: Broadcom Settop Sundry Block Hardware Semaphore
> >> +
> >> +description:
> >> +  Broadcom settop SoCs contain 16 hardware semaphore registers
> >> +  (SEMAPHORE_0 through SEMAPHORE_15) that provide hardware-arbitrated
> >> +  mutual exclusion between drivers running on the SoC.
> >> +
> >> +  The semaphore registers belong to the sundry hardware block. The
> >> +  node describes the semaphore register range carved out of the large=
r
> >> +  sundry block address space.
> >> +
> >> +maintainers:
> >> +  - Kamal Dasu <kamal.dasu@broadcom.com>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: brcm,brcmstb-sun-top-ctrl-semaphore
> >
> > That's still not SoC specific.
>
> Heh, and I already asked for this at v2!
>
> Do you need to see SoC series in there, or you are looking for specific
structure in device tree, I have looked all the preceding hwlock drivers
and its inline with what they have in there.
e.g. +    const: brcm,brcmstb-7445-sun-top-ctrl-semaphore


> That's wasting my time, read again v2 feedback.
>
> Can you please point me to an example?


> NAK
>
>
> Best regards,
> Krzysztof
>

--000000000000944391064b446db3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 20,=
 2026 at 2:31=E2=80=AFAM Krzysztof Kozlowski &lt;<a href=3D"mailto:krzk@ker=
nel.org">krzk@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On 20/02/2026 08:30, Krzysztof Kozlowski wrote:<br>
&gt;&gt; +title: Broadcom Settop Sundry Block Hardware Semaphore<br>
&gt;&gt; +<br>
&gt;&gt; +description:<br>
&gt;&gt; +=C2=A0 Broadcom settop SoCs contain 16 hardware semaphore registe=
rs<br>
&gt;&gt; +=C2=A0 (SEMAPHORE_0 through SEMAPHORE_15) that provide hardware-a=
rbitrated<br>
&gt;&gt; +=C2=A0 mutual exclusion between drivers running on the SoC.<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 The semaphore registers belong to the sundry hardware bloc=
k. The<br>
&gt;&gt; +=C2=A0 node describes the semaphore register range carved out of =
the larger<br>
&gt;&gt; +=C2=A0 sundry block address space.<br>
&gt;&gt; +<br>
&gt;&gt; +maintainers:<br>
&gt;&gt; +=C2=A0 - Kamal Dasu &lt;<a href=3D"mailto:kamal.dasu@broadcom.com=
" target=3D"_blank">kamal.dasu@broadcom.com</a>&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +properties:<br>
&gt;&gt; +=C2=A0 compatible:<br>
&gt;&gt; +=C2=A0 =C2=A0 const: brcm,brcmstb-sun-top-ctrl-semaphore<br>
&gt; <br>
&gt; That&#39;s still not SoC specific.<br>
<br>
Heh, and I already asked for this at v2!<br>
<br></blockquote><div>Do you need to see SoC series in there, or you are lo=
oking for specific structure in device tree, I have looked all the precedin=
g=C2=A0hwlock drivers and its inline with what they have in there.</div><di=
v>e.g. +=C2=A0 =C2=A0 const: brcm,brcmstb-7445-sun-top-ctrl-semaphore</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
That&#39;s wasting my time, read again v2 feedback.<br>
<br></blockquote><div>Can you please point me to an example?=C2=A0</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
NAK<br>
<br>
<br>
Best regards,<br>
Krzysztof<br>
</blockquote></div></div>

--000000000000944391064b446db3--

--000000000000a29bb2064b446d4e
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
ZUGCu6d0oT1M+zANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgBg/So9ai/HtZZdOZ
Sb7r8n64JNeVDUXOmS1NUPGfy28wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMjYwMjIwMTcwNTI5WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgB
ZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEw
DQYJKoZIhvcNAQEBBQAEggEATjnw2gW8+66knMugg8WG2RIaSGSHMKCIX0peV7qSesYCR7sPdZ7e
7sBCj+Dg1TK6DofzCwwNTEay/2ddTON28I+5FoT3HZYMIkOwdNIIu85pJXvq1FNWbRw5zaZ/fkz9
yHUDSA4B8aaR7L9KzX248GkoSkRD8FsxHZs3SSdmoyxVdArLhhYO44bY3uhFkA7r74+uXvaoDdxp
LpLBFOd14ZWwHSvbHxUd6fYNOIFbPyh8aWDxm+5aoqIBHyEM4cGSDVNqgqx4s7qHPdpCWcpIZ02q
X+AMac8l9bDOB2NGL4bUAmAkTogrt/fl5BQL5BC64Cfu+ZIS/gb/zQaXybg9kw==
--000000000000a29bb2064b446d4e--
