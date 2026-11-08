Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794177178;
	b=r3P4mCbnsxppRPjG+dFXRqrpH3Fja5XNTammv4iRr1mLjZLGVEXBQfafI+EBI4Q6BIhs
	 xi8Er0Xafx641VTq/YviY+ytgDM0F0bJj26LUPH2TXc0Row1DtuZFbgxh3g6x9xcOTcBn
	 RppdcZZI4xEpI6fZWuqLdGFElm9MI2FpyWs/qdX8FNbp0+lIhOK8GoSIgCUmk6qcqC+al
	 2vryc+4RUSwttiQjS7zeU/91GceJ92496vsy4Kkc+7/NzZdCqw2lNi6Jp5dKLdMXeQP24
	 h9spntREwl0V+E9D5uiM3seuAPEA6piDutKALGKi9uxOMhECVK2XKOV92AuZKsYUrXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177178;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=aXVyoiqEpaNTMlwRHez5VdDgVFbibsjLjBT9cHLdlCI=;
	b=4/gVl1dI2O9ch67lqZiq7Yiun5W+G2CKWYVFnfkl2jRZE+yZYLLDV+PRodIPUW/9nW/z
	 m5p+VRFztXlwuLe5hccXRNZ3+eEY4XXsCO4n3L85iwe01hBmawfbhHOtqnq/dIYxuLyCL
	 dYiNIhHGf4gKnyJ0R31k9LGsjjrolnxLGvNPs//h5qxsIes/G7rJaoNug04+TLAVK1g0D
	 fiDg8wfl5w3GUrDPG6kkVGRNJdtNK3Y3N3gHXKZf1BoCn5XPkcfKQEARi1xEl8ik5Z1TT
	 1Yqjqf2N70nmAYjgglQPBPspJROJXxM+Xh9vzkluiHiN7jwN+907usgD8yhPkY+A8nQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=WcqtD1nc;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=kwQduhJs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.5
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4393606A320;
	Sun,  8 Nov 2026 22:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4393606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=WcqtD1nc;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=kwQduhJs
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com; s=arckey; t=1794177176;
	 b=yAykkhFdy3v3mTr5O/I++gp7jlfB2zEJ24rr9s4Cf6ByqunW8Mxxyf6ZZhcDTvfO/sggEztYff
	  wRnKHr//ph8qDwBPE/1URdXFfFyNDMWG5ZbEsq67yDR2xuCXEWM/m2DKsNx1ZtjFgSqgQ5OMXm
	  OD4udL3+bT8N4gsoJY5ntzEFzyFownD+9HDNojSWhHTVsswgdcngTbnxcw0O1lCAoGjm/TX1Xm
	  ZqKYqV1Y7iEPcLsD1pynTsjdiqnljApJ1n1J4zSYlvOpGlWsDFONRpDTjsIcNLYD83z6H9PXPf
	  UHxZXG9Yudu6ofCv6rYd9nhozzkCDYY4UzbU9bIHY+Lr4A==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com; s=arckey; t=1794177176;
	bh=010V8IGaZ6Y8fPqruXV73V407p+sdABk1/LYEKBJdWo=;
	h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	  Subject:From:DKIM-Signature:DKIM-Signature;
	b=JN17J1pmvKmwlc7W5IKl3oMyvIEudbsYzXuWsBkv0/0YskaYhi1NQZ9hkjx+VZY08RI77AJqJs
	  Zurb8SXnL/O9O+xz1EKn708duU3AWUoN5fJE7arH1YX7kngsWv/BNASQfLo2r8hAwFz/f3zEUD
	  JXFG/nb6eLBdeZQUAJpIBzoZ/OTNe2OXH+PtqIQd7OgSDbOOQWWQrAeoc9EaT5TQluka7+urDH
	  z11c3nw6EKvNLBEek4YXf+pAPI4ErQ197RWxO/RY6LCV1DOwa2kndXacOulvEhKOBu7HkCRbKi
	  h4Xgj85VuH6581xR8vTQfU2dp5RURSph9PyukCZu3QQfvQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:List-Unsubscribe;
	bh=aXVyoiqEpaNTMlwRHez5VdDgVFbibsjLjBT9cHLdlCI=; b=WcqtD1ncItlO31l8Q0iISpPYbN
	/GZdsTMKLXLkRs5gHOUyuWMtohNaE/PrWYvm+d2BeNHMOAR7n+VldDRhgBuWt4mdWR/ZyKhiBEcMU
	qtxzQnjORL3jAjcGURW3HIJ9cqnxeQXs8MTsGqjB5vHVLDpDmfa1M3UMhYZD7Wfykhqc=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xQBRW-00000008Tg3-1qq1;
	Sun, 08 Nov 2026 22:32:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Date:Subject:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=aXVyoiqEpaNTMlwRHez5VdDgVFbibsjLjBT9cHLdlCI=; b=kwQduhJsKvvHpdFAkJEjOFIcQk
	Yg8p2dcsNiiioekjsRKKgNjQqHaZXbBliDzVDI0DbRIlBso4jhUKWJkorVQnaAmPwaqYs1ttMNA4F
	3ExAfmNaCupM3au3/cdRH9VmJnFE2KTCanXVaNrdGpqJqK4QS1l2uitODTN7UfhlB8Xw=;
Received: from [79.17.15.196] (port=64784 helo=[192.168.178.158])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xQBRR-000000006ZR-2cEW;
	Sun, 08 Nov 2026 22:32:49 +0000
From: Francesco Valla <francesco@valla.it>
Subject: [PATCH 0/4] remoteproc: virtio: Fixes and cleanups in the
 vdev<->pdev relationship
Date: Sun, 08 Nov 2026 23:32:36 +0100
Message-Id: <20261108-remoteproc_pdev_decouple-v1-0-3dc2fad4951d@valla.it>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWdOE0qjUqxBCoP2VMUqbKRATw
 t2tuvwW7+2UIIxE12InwcaJw5yhy4LcNMx3KPbZVFf1WevqogSvsCBKcH302HoPF9b4hLLWGIx
 mOFnbUM6j4Mbv37rt/k7r+IBbvj86jg/X3S6cfAAAAA==
X-Change-ID: 20261107-remoteproc_pdev_decouple-9933eb3a5998
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Joakim Zhang <joakim.zhang@cixtech.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012; i=francesco@valla.it;
 h=from:subject:message-id; bh=010V8IGaZ6Y8fPqruXV73V407p+sdABk1/LYEKBJdWo=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFkffnQLbmeNYLpfwX2TfdHbZLngFv476564OqVW7uKuD
 W25sntDRykLgxgXg6yYIkvIuhv39sw1/5a2gfERzBxWJpAhDFycAjARjihGhv+1F4P/OCSxHhHf
 3aCd1CXz8EHjo7LQ+Fbe7bdLunJ/XWVkOL4if953l/p0e9MVSqb7yzeXb3LVDf878d4v16qvaX2
 PGQE=
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
X-SGantispam-id: 19cc6a6b0abfb7b146ef4ab38f0d48c9
X-AntiAbuse: ID - 19cc6a6b0abfb7b146ef4ab38f0d48c9
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xQBRW-00000008Tg3-1qq1-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hello,

while proceeding on [1] I noticed a possible simplification on the
rproc-virtio registration and tracking path, which led to the discovery
of a couple of bugs. This series is the result of the work that followed
and thus contains both (proposed) fixes for the bugs and the
aforementioned simplification, which consists in less poking the backing
pdev from the vdev side.

Patches 1 and 2 can be collapsed into one, but I preferred to leave them
separate to show the reasoning behind (and to allow cherry-picking, if
that's the case).

If anyone is reviewing [1], or plans to: please consider this series
first. I'm in no rush to have that accepted, and some (critical, in the
case of iommu) details need to be squared out, while this series fixes
what I think to be real bugs. I would have preferred to spot them
before, but...

AI disclosure: an LLM was used to review the work, but all code is my
own, as well as the commit messages (I'll be happy to fix the english,
don't hesitate to correct me also on that).

Thank you!

Regards,
Francesco

[1] https://lore.kernel.org/linux-remoteproc/20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it/

Signed-off-by: Francesco Valla <francesco@valla.it>
---
Francesco Valla (4):
      remoteproc: virtio: Decouple vdev from the parent pdev
      remoteproc: virtio: Rework memory release
      remoteproc: virtio: Drop rvdevs list and associated functions
      remoteproc: virtio: Stop de-referencing pdev from its children

 drivers/remoteproc/remoteproc_core.c     | 34 ++++++++++----------
 drivers/remoteproc/remoteproc_internal.h |  4 +--
 drivers/remoteproc/remoteproc_virtio.c   | 53 +++++++++++++-------------------
 include/linux/remoteproc.h               | 10 ++----
 4 files changed, 43 insertions(+), 58 deletions(-)
---
base-commit: ec1f9ba57b02fe12a6fa5f141206d439ba3d044e
change-id: 20261107-remoteproc_pdev_decouple-9933eb3a5998

Best regards,
--  
Francesco Valla <francesco@valla.it>

