Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794207568;
	b=QR9DQWvrjs/tz21HtUNSw+1P7vUcy7m+5Xgm3SatZpqATdfoAf/iZVeRcSJ6dPgIuUQN
	 MAGyfk78lrd7wGVILOAIXyI+5JSvBVLOna3D7YsnFaB+Deh9SWIlAgC7SbywRVMjM9KDj
	 yPKhLtNUY28lRMwPBSPNVpxSCoiQbU8UDwtyfLRl0SxDjYJuG5bNc7ScvVRucF34+HaWF
	 IuGs7kyAVChutQD/cVk5dIPAD7vjF1G0PecB7DTYdW6Z6ZoMs/L66qNeVRIoIOR/UG6Yt
	 TOU30ta8OXhK3XhXThZ9cCkGP4mrIxMmiy1AAEBJ1lEoa44xpXU28/2VVwtT+XCTNAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794207568;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:Date:
	 From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Correlation-ID:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:
	 X-Source-Args:X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:
	 AntiSpam-DLSP:AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:
	 CFBL-Feedback-ID;
	bh=b8cLnxhDiZYpmP/ADHVp7/WF+ZwYqLYBkjCWPt9JZuA=;
	b=4AyySxbjhOmU3docTjdisxxkqJGYG1uDn36Bo5RNpqzi/tWcK2kS/E9fuhEU2fJNDhZY
	 qJh3019SXkEPjoqfYZc9Tddk+63HZusea8Kmdz785+tl/ifwirAj9FRsQeCgwdbGobL1z
	 850wUxe2l2kOZnH5sPeIvZ07l2n9Uyq2Hn4n3Xlf6EOgb/ybuwSb+tsljp+jk324q1x7C
	 KvQDzpLreM8aiEtZfVtdZXCXN3EOmmTWrCg/Cdl5Nrsdgd/ZavGf+LjLKsxiwdf9mBbn3
	 WIC2sqYqopbiDy5mLJgBcWLEm8HJGrTUMVTcCblrDHbS7gLNhY7bQP4GCySuvoZ7CjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=IyAIgQvD;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=tDVrf0cF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.2
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535E0606A31C;
	Mon,  9 Nov 2026 06:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 535E0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=IyAIgQvD;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=tDVrf0cF
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; s=arckey; t=1794207567;
	 b=OXHUnkl+CZYuw6xfhFeuOyEZcg1Ai4rRxHeASg0bIZtnS/FYiIB119DPDEqpK7t9NoEUsmrmaI
	  gJZF/qPZVc5+WNG01oCUV0s40NBjAbQ7K8gvoQGEMxDLWmGqsTsQdweACdNiBg6u6gNYyps6eZ
	  CGb0S0fw9D/JuZgN5057/8mR2XCm36LgB5EcLHI29AOEBoQb3SUeIK9VdRrH9AQVVnkHqb0dwZ
	  fGDvYBFF/wJQT+LOEFhUZ4ilsxCRoa2lfduxK284yEyf4r11AZlEoKvUtHFTReicq6rfPrCWWE
	  LvBXGwLAbhrWs3bN8cvtCrDU8RtmpgtW/L0hdThZXkHMSA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; s=arckey; t=1794207567;
	bh=b8cLnxhDiZYpmP/ADHVp7/WF+ZwYqLYBkjCWPt9JZuA=;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	  In-Reply-To:Message-ID:Cc:To:From:Date:DKIM-Signature:DKIM-Signature;
	b=ICr3YTIEGMM+gGGcpTD48dHV2Z2u5A/dyHeIQ+yrQP1I1x0p/Ao5q6fl6Oj9KXu6hnFlHSCKZX
	  OzYXGU0aSl2er+i0NiHTJMKPetALQ3HFmvWlA1EUFw7HtJZaeD3HiafgUgh/Sx4iGgxLfKLVHg
	  w0R5MleMEv2X32ZrP3dyPD2+XBT8cwgyu1hr61FrzTx+c6g3EYfP9OYlIHs58OskXj7PGTREaS
	  i7arr4a50xhuWlzfVhBxsF2pKcgY9uvhnw6bMcJ6j5za6HvIMJrfSw22NxR7EZ5HOzBYkNAJ7H
	  iFiJ8SccUf9jPf6kIyP638I+JSxOESJB1j/FiaTilUVP/Q==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Message-ID:Cc:To
	:From:Date:Reply-To:List-Unsubscribe;
	bh=b8cLnxhDiZYpmP/ADHVp7/WF+ZwYqLYBkjCWPt9JZuA=; b=IyAIgQvD94Hv6WMibgaSudaFEp
	Jw6ZF25bAFS94k4Y4gkECpQUMJ7fIT/5alpMRjS5yaMFX+6HnNxMh080j2OOYEgdPHw7Zqcucxt14
	cVKCQgA01u53tIcf0qMeMAEGQGpHwF0quPfas3LIk3IeT3v1bp3AXUAZDq5AnNnom8Dg=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xQJLZ-0000000GhbZ-3tPu;
	Mon, 09 Nov 2026 06:59:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=b8cLnxhDiZYpmP/ADHVp7/WF+ZwYqLYBkjCWPt9JZuA=; b=tDVrf0cFeRfrPsEl7kp2pxKO2P
	Nd+g/ubmBLQ/CJK13Boh92yehjHtAYMKGPn6MLjDdHb23YPga1R2BqplGhFBOjcv1JYByGEkEuejj
	V1DSvfWbf46Yz7a1Q24er4+VY1fl3RnvLKN6nWmFn12BJXON6+9rsOFLqUFFo85oNDu4=;
Received: from [109.54.113.250] (port=16152 helo=dummy.faircode.eu)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xQJLV-00000000CVI-0K1l;
	Mon, 09 Nov 2026 06:59:13 +0000
Date: Mon, 9 Nov 2026 07:59:11 +0100
From: Francesco Valla <francesco@valla.it>
To: Chrispine Tinega <dev@chrispinetinega.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <d22a1ffd-cfbc-4122-b11a-7b680985defd@valla.it>
In-Reply-To: <20261109054830.42715-1-dev@chrispinetinega.com>
References: <20261109054830.42715-1-dev@chrispinetinega.com>
Subject: Re: [PATCH 0/2] remoteproc: k3: Recover a crashed remote core
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <d22a1ffd-cfbc-4122-b11a-7b680985defd@valla.it>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 5a0ae1900ddef715660ced805af6af67
X-AntiAbuse: ID - 5a0ae1900ddef715660ced805af6af67
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xQJLZ-0000000GhbZ-3tPu-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hello Chrispine,

9 Nov 2026 06:49:26 Chrispine Tinega <dev@chrispinetinega.com>:

> A K3 remote core can tell Linux it has crashed by sending RP_MBOX_CRASH,
> but the K3 drivers only log it. Nothing reaches the remoteproc core, so
> the crash is not counted and recovery never runs. The core stays halted
> until the next boot, with its rpmsg channels dead.
>
> Patch 1 reports the crash with rproc_report_crash(). This applies to
> every K3 remote that uses the common mailbox callback.
>
> Patch 2 leaves recovery enabled on the M4F. Its stop is a plain reset,
> so recovery does not need the crashed core to answer. The R5F and DSP
> drivers keep recovery disabled. A crashed core there moves to
> RPROC_CRASHED, and can be stopped and started again through sysfs.
>
> Tested on an AM625 board (BLIIoT BL350) running TI's 6.12 kernel with
> the equivalent change. The M4F runs Zephyr, whose fatal-error handler
> sends RP_MBOX_CRASH. After a forced fault, recovery reset and rebooted
> the M4F in 71 ms, and Linux kept running. Mainline's M4F stop is the
> same plain reset that this test used for a crashed core.
>

If you share details on the Zephyr side of things, I can test this against =
rproc-next on a AM67A (BeagleY-AI).

Regards,
Francesco

> Chrispine Tinega (2):
> =C2=A0 remoteproc: k3: Report a remote crash to the remoteproc core
> =C2=A0 remoteproc: k3-m4: Leave crash recovery enabled
>
> drivers/remoteproc/ti_k3_common.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 5 +----
> drivers/remoteproc/ti_k3_m4_remoteproc.c | 1 -
> 2 files changed, 1 insertion(+), 5 deletions(-)
>
>
> base-commit: ec1f9ba57b02fe12a6fa5f141206d439ba3d044e
> --
> 2.53.0

