Received: from mail-pf1-f226.google.com (mail-pf1-f226.google.com [209.85.210.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691BB2FDC2C
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Mar 2026 19:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.226
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772738294; cv=pass; b=hHzHAPMm/MFElLVo8qbfRwtEce0FvyGSuB5ph0k9vOWhj/BED6szd0QZE60UDQNKnPEgl7QHNCp6Ehk8bdoCO6hdhRAFLppps+rwu2zbip5aKBSL3Ali9CgOZD2yKKlWvIBTOR6NjoLJXLu289CFeSR2YA1LLjk1+16hKdfXoLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772738294; c=relaxed/simple;
	bh=ZzU1D2zW1bRQfpy3iqgZ96tyEuyKvE0YUmD1pcv0YdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vEPPyThUHyDPXjnH6838X2LIvnXm8UNBIANS+uM/bj6dcFvRD5QUPhF/LAslJgIFGbZEyWKOiGMWt/HAsNARR2PWsCvz4igxT/OjznDjHt8mTEQomTuEWkHUQglI71xz0y+X7hT2TJBep8s7/G7i1D3vpaJtFwosK/9XXAokrwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=VRFKTkSW; arc=pass smtp.client-ip=209.85.210.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="VRFKTkSW"
Received: by mail-pf1-f226.google.com with SMTP id d2e1a72fcca58-823c56765fdso4413819b3a.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Mar 2026 11:18:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772738293; x=1773343093;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igTuEP53tkgE4uAwjjqnfODG97fhqp1CIBxxftb/Las=;
        b=fx35Q1SRX5KQOr76CYQ/j01g6gIS/Em+ZDj9qk8Hj1/2B/dIsnDWnVKe9VRVYypszi
         AzLLxhL4tvkhYaBkJ0UTHHbtuD3FL5kFUxH0a5JFZv2KkfRdFEIi9k5u72GBloScmiOQ
         gXp4dKHv4pQOzShzW2BJzJvHuD4oTexPxPd3hV/L8bnlN/OwcYuVtEoQUQYV4i8P9sJ7
         MgURhbLEfqBm0o8mxpRbeYj73unHckhevOyD3sN9nPlcnaZjnwyGy+c2Iyu7EzjDiFQ9
         b7l1nDynQh+147uPtiudvcQbrJOtC15dBqUGLIHpbdTnOQsuRMDSUEjsSsZVljgx41rF
         I0Ug==
X-Forwarded-Encrypted: i=2; AJvYcCU/AstOqoRTLEAzEhJLwpdNaZ4ShidG9M7RUawW22s7tqlxBNKTYCUWIpbW2eYtL+crnLYHAnDWbiL5hvSTh090@vger.kernel.org
X-Gm-Message-State: AOJu0YyzDw5fyoXjCgN30Sdi0zjiO/7BXpunjpFj+Lk5b4MAiC6JHh61
	hZCfcFcpei6G3QmMkECCZo/1/IoM1LGgCAssLRaYNt41ONUYkjulylA0ICHTy2ullBFGst9NV2h
	D2p5i0CKeEN4BD4u6StJ520KXcGykCRxQQaeVHW1vfqTpMY70T5dkkC+Uw0GVYwb/a+VSQmont/
	Hq3hA3PUCtDEsyab8ddp/nDWfGnQdkQyYfUhVvyK4hHBfstvwZ/9SUCfK9nJRU1I/Tf5sbU4v0W
	Vzmxky6GYO7ODv7UdoIkw==
X-Gm-Gg: ATEYQzzTAV9nedLf2tloS5BCy4wtHJHZcVaxkty38jrw24Z6yUZDuN/TsT6colfmpvS
	0+RziK8gTSxvED4/9utd3Rpg/yd4K5kZS2s6leVHPw5ylRKoo7cbs8g6kRogBBmdP92MS8tm80a
	I09LTczUnIenvkKklONEf6y74ng30fXLwexddn238l7mTdsr7H8EVYbyYkobGFVN9lpJ8ABvXkk
	zYbacQIL7zzifZR56HqJJU9mrljZ9qn90lSJkjmoHGlH3t5PLLP/wojGKOnZbg8ktfnNmC4UOpT
	oQEUeCQpexB/1JrEbVnEKtf/AIosRvGFkwHgxAZ7xuObRQC2VFaMKS9rk+Y/Y8yUyC7s5z/6dWg
	CU61Pl7jEx1xSVGHSsaxh0TdnvyVV802hMndi1kESwluh/5qEKxhSWBNsgbK747DV7hzKLI0ni1
	/QuDOhzJKlI3cQrKmPbP4sh2lWRmTp3pIBCUgPtIexSQtfkRzldJCMAuN8
X-Received: by 2002:a05:6a21:398c:b0:366:14af:9bd1 with SMTP id adf61e73a8af0-39854aca343mr554074637.71.1772738292514;
        Thu, 05 Mar 2026 11:18:12 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-c73978d76ffsm91729a12.8.2026.03.05.11.18.12
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2026 11:18:12 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1279caef718so9338300c88.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Mar 2026 11:18:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772738290; cv=none;
        d=google.com; s=arc-20240605;
        b=X/hsGbNK4P+jTFTqTvbCo/qoGQqCIA1C/cnU6kofoRyiT1k9ALzMLGmk2F2tD95bLL
         xAHcADHSLtK5T7LtgOEwyg4IPyGqQUDYmL9K95cokmwJ/SIJXPt2WrQLPHHh8OBR1CGf
         qK2376eCqLF8QmBsrMTAHpAOLlJ7lSuV+msPDk8XpXI+oj+Yz08gG1FEhOF6gX/MBkkd
         0l4UwT8C2uslMiGrpX1Og3/VRKfsM+xxP3E3fio6CIGkpOc1KC9MmUknwPNtzkjNjMD9
         V3HhvKA5uua2LWBfStXHWbT3cGVosWvjxn+k1YMUyfNbKXtkZ6GYRbcf9/lKXpnf6PXJ
         jkbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=igTuEP53tkgE4uAwjjqnfODG97fhqp1CIBxxftb/Las=;
        fh=qRHttVULaBCUl6uyaWWHvGTPpl+YKxKIrou0lTQom6o=;
        b=PY7iuyZdLJ5QkozciT3o6NPRyiffErWVGyByxVa19PmpkcCfVI6cu67aZ3+R3Za1V3
         EXsf9hxhxMO4+wgeDnax601D/If0kgRlZ5fzBQkrMmC7lnHCVqvotU5V0/HsAnXN+UC2
         +VrSjrQCE5hMg/t42nOPgH4YFQUExysj1tF9tw2UXRbm2ZGN/jtXeUIn8qklkz0TNfS6
         dOgCwIeAG0JzodxOG5Qb/X/nOwzt8gXhb+FhgORsn1HjBuCZ4Br6ayA7elkyHzZ7opfG
         x4z+etM+i3uWkwoAjLf2S09OoHcHZq2obT9YcmQdj/80+n5ucQjQpy3zPmIu+nJAynVt
         6n2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1772738290; x=1773343090; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=igTuEP53tkgE4uAwjjqnfODG97fhqp1CIBxxftb/Las=;
        b=VRFKTkSWL6bOXC/r0ZiS1ytlNUfyiIgiRsevLaiNCwCJuLQL7bBO2yYAZyGrJpFZ1E
         ABXL8lpi9zgo1ws5ZImvtoqzmI86vChYgxxLUT/HakaJ/HJPLxJ6bEJTodIQus1noY07
         yFsZ6Aq134AMXFv+q0xtMh45QsHfhrxSbEw9g=
X-Forwarded-Encrypted: i=1; AJvYcCWeW5fAUdPF8DTd9rsbQzY0pO6kgjpKFI02x1trSrW0Xk3NI/P0UT4p5jK8AsHA3PsxTOucmdfzAK6yvtbFyxTV@vger.kernel.org
X-Received: by 2002:a05:7022:eacd:b0:119:e55a:9c04 with SMTP id a92af1059eb24-128c112d499mr451540c88.32.1772738290608;
        Thu, 05 Mar 2026 11:18:10 -0800 (PST)
X-Received: by 2002:a05:7022:eacd:b0:119:e55a:9c04 with SMTP id
 a92af1059eb24-128c112d499mr451521c88.32.1772738289981; Thu, 05 Mar 2026
 11:18:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224220407.2351692-1-kamal.dasu@broadcom.com>
In-Reply-To: <20260224220407.2351692-1-kamal.dasu@broadcom.com>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Thu, 5 Mar 2026 14:17:32 -0500
X-Gm-Features: AaiRm536QDB2rICv_Un4lGUCb33AgOKdF-jto1AIVIu78d96cSbF2iwIKJyPXZU
Message-ID: <CAKekbevZQBdvH5CCGyCDhs7ND6y65C=S3k1Aop8eh4CV5r_4aQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Adding brcmstb-hwspinlock support
To: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Cc: baolin.wang@linux.alibaba.com, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000001d478e064c4bcc05"

--0000000000001d478e064c4bcc05
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 5:04=E2=80=AFPM Kamal Dasu <kamal.dasu@broadcom.com=
> wrote:
>
> This is a standalone patch for the hardware semaphore feature for
> all brcmstb SoCs that have the same hardware semaphore registers.
>
> The semaphore registers belong to the sundry hardware block. The
> node describes only the semaphore register range carved out of the
> larger sundry block address space.
>
> The compatible string uses "brcm,bcm7038-sun-top-ctrl-semaphore"
> based on the BCM7038 SoC where the semaphore registers were first
> introduced in settop chips.
>
> The patch has been tested to work as builtin as well as a module.
>
> v6 changes:
> Addressed review comments from Krzysztof Kozlowski:
>  - Renamed DT binding YAML file from "brcm,brcmstb-hwspinlock.yaml"
>    to "brcm,bcm7038-sun-top-ctrl-semaphore.yaml" to match the
>    compatible string
>  - Updated $id in the YAML to match the new filename
>  - Updated MAINTAINERS F: entry to match the new filename
>
> v5 changes:
> Addressed review comments from Krzysztof Kozlowski:
>  - Changed compatible to "brcm,bcm7038-sun-top-ctrl-semaphore"
>    using the SoC where the semaphore hardware was first introduced,
>    following the brcm,bcm7038-l1-intc convention
>
> v4 changes:
> Addressed review comments from Krzysztof Kozlowski and Rob Herring:
>  - Renamed compatible from "brcm,brcmstb-hwspinlock" to
>    "brcm,brcmstb-sun-top-ctrl-semaphore" to use the hardware name
>  - Added description block to the DT binding YAML explaining what
>    the semaphore registers are and their relationship to the sundry
>    block
>  - Fixed typo in Kconfig "Setttop" -> "Settop"
>  - Fixed email typo in MODULE_AUTHOR
>
> v3 changes:
> Added detailed explanation in the all commit messages as per review
> comments
>  - Added description of 'sundry' ip block that the hardware semaphore
>    belongs to
>  - Added reasoning for using common compatible string
>
> v2 changes:
> Addressed following review comments:
>  - fixed ordering of obj brcmstb_hwspinlock.o in Makefile
>  - fixed ordering of 'config HWSPINLOCK_BRCMSTB' block in Kconfig
>  - Renamed BRCMSTB_MAX_SEMAPHORES to BRCMSTB_NUM_SEMAPHORES
>  - Removed unnecessary platform_set_drvdata(pdev, bank);
>
> Also addressing duplicate PATCH 1/3 sent in error as part of v1 change.
>
> v1 changes:
> based on fixes made to Initial patch:
> Link: https://github.com/intel-lab-lkp/linux/commits/
>   Kamal-Dasu/dt-bindings-brcmstb-hwspinlock-support-
>   for-hwspinlock/20250712-034624
> Link: https://lore.kernel.org/r/20250711154221.928164-
>   4-kamal.dasu%40broadcom.com
>   [PATCH 2/4] hwspinlock: brcmstb hardware semaphore support
>
> All the review comments and build warning have been fixed.
>
> Kamal Dasu (3):
>   dt-bindings: hwlock: Adding brcmstb-hwspinlock support
>   hwspinlock: brcmstb hardware semaphore support
>   MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver
>
>  .../brcm,bcm7038-sun-top-ctrl-semaphore.yaml  | 45 +++++++++
>  MAINTAINERS                                   |  8 ++
>  drivers/hwspinlock/Kconfig                    | 11 ++-
>  drivers/hwspinlock/Makefile                   |  1 +
>  drivers/hwspinlock/brcmstb_hwspinlock.c       | 96 +++++++++++++++++++
>  5 files changed, 160 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,bcm7038=
-sun-top-ctrl-semaphore.yaml
>  create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c
>
> --
> 2.34.1
>

Hi Baolin, Rob,

Gentle ping on this series. Patch 1/3 (dt-bindings) has been reviewed
by Krzysztof and all previous review comments have been addressed.

[PATCH v6 2/3]  hwspinlock: brcmstb hardware semaphore support
[PATCH v6 3/3] MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver

Haven't received any feedback yet. Could you please take a look when
you get a chance?

Link: https://lore.kernel.org/linux-remoteproc/20260224220407.2351692-1-kam=
al.dasu@broadcom.com/


Thanks,
Kamal

--0000000000001d478e064c4bcc05
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
ZUGCu6d0oT1M+zANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQg0jF7kkCJeO6HCfzy
seYILafFajwCB9QmfD3bu/6RT/EwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMjYwMzA1MTkxODEwWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgB
ZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEw
DQYJKoZIhvcNAQEBBQAEggEApFvoot9Hot1ygCnuvhJLJHo2ce7HN5lhWpa4coQ+s/7iGzbAMxin
uqnsDVTJvgulzlEKrHjRGM4XHUwzA5XCofQoFyb2QauuBQfm3tZ4sUukxLnGmDtcK+bdjAcbuA3f
Dnbk1CvjwRItSKp7VaKOWmxQ75kOgjqCwnPrRLpzoq4rC8U0/CjNx5JzuQGVwusxWJbvzQly8jgF
+dk6gIUZmlWbYs03ZI0yW3VpX1IH+qjszwdQraUHwi2W1UIQL66GS/VTfYsy+VCsL3fr83H6ACy7
PmiJWrP8mtKN100MHe1LU/Tx+k2DHkDMH43K2rPxhKBvDw1G3UnwMlOGRkaXFA==
--0000000000001d478e064c4bcc05--
