Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795816156;
	b=Gzok914UHJ0DGu0eCMPHFeZQsDk951/NO7kIxau0QH1OdfuyDiZzUvUFjWoQ5ieqy3FL
	 AiVi7Qsz/MgLZWwzQ8QifBvULrjQ6idWf4hxDt/SAif7dDQa/FKrlGtN0ygyrKHufFvmv
	 +ADZHEqMUmltlePL0gmwhUOoEV5UzPjrZzrI9HSqHSGAMA+wvIbzXJaXzU2Zd+5NTqgj/
	 Jztxtp3ZwOqSo7nOKSoeYfsHsp3h58u3jMpqcetBaR9R4QOll3PVSEbix//018fjFwjy0
	 wIke5cplCppePPcj7iv7MHe50S1vhnzQmJ6zAxolEG+/4u64ektRrBpeopgmOM8Sjyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795816156;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=CDgKCz7cdIyaGLNCFhLgay07bTTdAIlWU3NdUBFeBfQ=;
	b=HYr0mrI7GaBs1XjDCUmfI6nkDm52x07g535Dr5RP4ticdniwfldvUHYIZchu0MFZk02A
	 3uGwE72r6NLk67+GKd/sGlNgPqkx5bLL+pod9+IDhO4SnbvWTadf5/F8XIZ+VhKADjVxL
	 eVIRyLwMVBQoHJfoR+Jagsjm7SEosVfvQWMjNKDhptG5HEzIAhb4s0OFWLb7AkgxjaJc9
	 Gb/5CzqUJyCvJSJeYRtyWl9kH0ZcSdL5AGxgesmr7n6953DmeSvacbxVKGcZtg5EPqtjW
	 oghPutTG4fd1gcJDGZGF2dhMhc3Pm6t7IJjaSq4Z8uWuWUtuHKnRhRXkiPdm2nOMcBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=DO76snuK;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b="E/Uyxjg+";
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.13
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B8F606A31C;
	Fri, 27 Nov 2026 21:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2B8F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=DO76snuK;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=E/Uyxjg+
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com; s=arckey; t=1795816155;
	 b=Mr3IRnEGTwtSeNlbeBGuBfUksHoNTGXr+b25B9ntajVgqz6ENC2vFQEFe0XicvamrDo7Eg2Y3t
	  NLTNRZF3eAJEtSFUmT8Cgu+DnpXoviVzEzbbFlFNk4JERuu+NOvbcAWhsIqypQIbsh/G949tgE
	  YovfpLiL5sZs0gVHgnOxk45picHwZ8gSbE2V2myYHKAweemUy1Vp5ah8LOPh7YJXoJ/9HIJXEl
	  +Oh5KNai/A1rVPSNm0WRJtCp25Xkht8Xorfz7Khdd7REzllLq5ba4BfZZULyXMwZtE2a2qYOQY
	  FbcUX20+xidlPjjraYZWnP9+STyQC5USa2gRo8i0DFYqzA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com; s=arckey; t=1795816155;
	bh=fGPJesb/S+P76H3abpcayCvX+a6mKqgRWAiyZOPy8cQ=;
	h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	  Subject:From:DKIM-Signature:DKIM-Signature;
	b=06gf6yJDAGv6cLHl4TEHjjnP5gAJAN92fsTNzjcjuNhFGuE+wrSiMiYkyalZzDCYuTxgFDqO60
	  4RpwGYZB9kPTf3EeS42cVWDUjMWcPZxRwx0fWiXWOFvl/qt41wNffaAWz/42LNtnC5Psa/m2mY
	  jV4A9GzBDu5y3gEdCSD23KpPXu9W2IwarOq0K5f9iiiKv4laYQT5oExGizwMX6nH5m7afSOo5f
	  U4FPmgN4HteE7yA+BEHTUrN8T4wZem2qGAXfY0+AVyiOmddq80ZxwXP2GPWmvvdO07V3EBRytB
	  7++FeRMLDAo4fdThryhQdAemQsq7PlRzeYg5uv94HavN0Q==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:List-Unsubscribe;
	bh=CDgKCz7cdIyaGLNCFhLgay07bTTdAIlWU3NdUBFeBfQ=; b=DO76snuKEY+Y0hW+p/tjbtYybq
	izDBIM0MZbK2dSr6WWhoiobfUT7zf/+Ls5/6L26Xg6l8b6llNy3ZQYaARRT/08JV5/Bm2F5stJ3OS
	2WCgLFcJM2efZ6uZwnVyvzND3bJbZyjbM71EbpElMTJcp8F7nrouwb5WwKG25n17gyzU=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-h034.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.2)
	(envelope-from <francesco@valla.it>)
	id 1xX3oZ-00000006vNm-2nNs;
	Fri, 27 Nov 2026 21:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Date:Subject:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=CDgKCz7cdIyaGLNCFhLgay07bTTdAIlWU3NdUBFeBfQ=; b=E/Uyxjg+FZl5MmmXukToQIJ0vd
	adw4jgUqu6Z4/5bcOvPTotrOuRR6MKYEuKU6nDmku5LSgGbE1aWLIv1KEJu2GBtUAADIg+3ZgwFHf
	neeFGZXQsd2L/1TM65cTIxcLbrHTm+vapQG/qNZnTXTgEs3NYXaoVRa0t9HudoRvnscQ=;
Received: from [79.28.115.6] (port=64199 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.2)
	(envelope-from <francesco@valla.it>)
	id 1xX3oU-0000000056N-2gyq;
	Fri, 27 Nov 2026 21:49:02 +0000
From: Francesco Valla <francesco@valla.it>
Subject: [PATCH v3 0/4] remoteproc: virtio: Fixes and cleanups in the
 vdev<->pdev relationship
Date: Fri, 27 Nov 2026 22:48:49 +0100
Message-Id: <20261127-remoteproc_pdev_decouple-v3-0-28f245622129@valla.it>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32N0Q6CIBhGX6VxHU1ATLrqPVpzCL9JM3GgrOZ89
 8DW5k1dnu37zpmRB2fAo9NuRg6C8cb2Edh+h1Qr+xtgoyMjmtGCkOyIHTzsCIOzqho0hEqDstP
 QARaCMaiZ5EKUKN4HB415rurL9cN+qu+gxuRLi9b40brX2g4k7b6Z8ncmEJxhphVtpM4FJ/ocZ
 NfJgxlRqgS68ZD8j4dGj+CUca0zXki58SzL8gZqcLrHGQEAAA==
X-Change-ID: 20261107-remoteproc_pdev_decouple-9933eb3a5998
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Joakim Zhang <joakim.zhang@cixtech.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1432; i=francesco@valla.it;
 h=from:subject:message-id; bh=fGPJesb/S+P76H3abpcayCvX+a6mKqgRWAiyZOPy8cQ=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDNmcv456KLHt5jiwMeztC+szJ80lTCdMv7STz8R9VsG17
 NVGsd5mHaUsDGJcDLJiiiwh627c2zPX/FvaBsZHMHNYmUCGMHBxCsBE9okz/I+0YzqUGMoe/OyJ
 6Zya83KxIteYGnRv84t+XhsXu/X3xs8M/9P2LzLy/v3+Rf5RiXhzhp0HFXX9HfxlJhzeVZe2fca
 WGUwA
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 3f12ecc735bcabda710fd0ed8debf165
X-AntiAbuse: ID - 3f12ecc735bcabda710fd0ed8debf165
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xX3oZ-00000006vNm-2nNs-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hello,

third revision of the series that introduces fixes and cleanups in the
relationship between a remoteproc-provided virtio device and its backing
platform device.

Thank you!

Regards,
Francesco

Signed-off-by: Francesco Valla <francesco@valla.it>
---
Changes in v3:
- Added comments and expanded commit message on pdev de-registration.
- Rebased on rproc-next.
- Link to v2: https://patch.msgid.link/20261114-remoteproc_pdev_decouple-v2-0-95235dd056aa@valla.it

Changes in v2:
- Rebased on rproc-next, solving conflicts.
- Link to v1: https://patch.msgid.link/20261108-remoteproc_pdev_decouple-v1-0-3dc2fad4951d@valla.it

---
Francesco Valla (4):
      remoteproc: virtio: Decouple vdev from the parent pdev
      remoteproc: virtio: Rework memory release
      remoteproc: virtio: Drop rvdevs list and associated functions
      remoteproc: virtio: Stop de-referencing pdev from its children

 drivers/remoteproc/remoteproc_core.c     | 48 ++++++++++++++++++++-----------
 drivers/remoteproc/remoteproc_internal.h |  4 +--
 drivers/remoteproc/remoteproc_virtio.c   | 49 ++++++++++++++------------------
 include/linux/remoteproc.h               | 10 ++-----
 4 files changed, 57 insertions(+), 54 deletions(-)
---
base-commit: baa1eef26d2378e403e113f3217114704e5d621e
change-id: 20261107-remoteproc_pdev_decouple-9933eb3a5998

Best regards,
--  
Francesco Valla <francesco@valla.it>

