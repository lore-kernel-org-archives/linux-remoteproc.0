Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203358;
	b=zeIsgBM/cvqerjlAKGpuucS7ikM17dxbl6XAaAq9SrxytyO5n8VHN9nGW4DWGxP0t3dM
	 KJ4KWb3v2ARnJRxZlkYLFmkDNvvdPyxbTgZ5MeJj89qh28XtxaLa9j63hvGCFu7RixNm5
	 7bEFKZCL8BnuiBxn9QIRohq6DgfP1KXYMoOOSNIFqh5eeUWmoHi0HIWLf+j7UEsoYf/xK
	 ZmjJDyF5BZ4F2jwCZuBxuFqNyN2sZlCQscWut8uk/UYFv8fE0v2eHzlozDf1ujdLpgbl4
	 r8n2LYc5k7RCIxT9c+sv/VVUYNYZBqSeclVWn99l+Lwfa7XlKcSV3WLwb2dK4QKypZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203358;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=a4y9k64X3ripBhNIvMZWY+s0weNkhwdUrJaAz4Av5CY=;
	b=Nl9r072QWyqPIYuiDdxx8W4utTA2cqM6wSHFSI++DSR25ThN0qNzruTMleFQQ/Wo0Nkc
	 Nj4vvyvynVRbD1bnrH5khGIrUyhfvsE853fnj4B8Tj+1KlqLEbTEfl/Kn3J+OGqErefFI
	 jLsgTYZFAFgrPQ3XwnKtfvQh2kAa0WyV/PxA9T9I6QMciQKwwye+sKsFQMJ7zsqqZYSxg
	 BGT9PnSK2DiCRS8IHDXz7kMIGNDWfk30cmM/4ehFkHllcvYF1GDh3uaRO2DGuK4FKSRZm
	 RGUw/oa1EGiaFv5EGulhFOcR98dLu2RCYCT/aPDtBaGA96gsXCySf2VAEuMh5zle2bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=fcp+R9wc;
	arc=none smtp.remote-ip=198.54.127.133
Received: from out-2z4y-a133.jellyfish.systems (out-2z4y-a133.jellyfish.systems [198.54.127.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE13606A323
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Nov 2026 05:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AE13606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=fcp+R9wc
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jNJkL1L84z8sWP;
	Mon, 09 Nov 2026 05:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1794203341;
	bh=a4y9k64X3ripBhNIvMZWY+s0weNkhwdUrJaAz4Av5CY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fcp+R9wcC8no4+xve8HyKaNXALhyUPRhYxY25aWBrZAyknY2orDL+bFL3DhBSQtuP
	 AImZ3M4mXVKUcziwuS99HXAQWZY/MPWZrFFWI5XjVSmtZ0Y88QKs1GgegR2hq8U2cm
	 UpuqnLOKdwafXFXyWiTYf8SOF1tZYRFyaL1UvOCHNPk7MF5gyOwenzfWkD4dM9wSo6
	 vr0NwEo7XxtCvF9GYQ+VkG5X3dFTQaiemVEuJnFEMsTLb9c5AbyM1yql2aC29HzdUq
	 tHez1CyuqdHwLNsCcZEMuvcdMYt29Tb89rwdAvIpeMEsVm3y7ALUNm+O7k4KmhLOag
	 x5KPE9CGP3eGQ==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chrispine Tinega <dev@chrispinetinega.com>
Subject: [PATCH 1/2] remoteproc: k3: Report a remote crash to the remoteproc core
Date: Mon,  9 Nov 2026 08:48:29 +0300
Message-ID: <20261109054830.42715-2-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109054830.42715-1-dev@chrispinetinega.com>
References: <20261109054830.42715-1-dev@chrispinetinega.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: dev@chrispinetinega.com

A K3 remote core that faults can send RP_MBOX_CRASH over the mailbox,
but k3_rproc_mbox_callback() only logs it. The remoteproc core never
learns of the crash, so its recovery never runs, the crash is not
counted, and the core stays halted with every rpmsg channel to it dead.

Call rproc_report_crash(), which may be called from atomic context. The
core then moves to RPROC_CRASHED and the crash is counted. Where the
driver leaves recovery enabled, recovery stops the core and boots it
again. Where recovery is disabled, the core can still be stopped and
started again through sysfs.

Signed-off-by: Chrispine Tinega <dev@chrispinetinega.com>
---
 drivers/remoteproc/ti_k3_common.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 4b6da3363..d799f377b 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -60,11 +60,8 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data)
 
 	switch (msg) {
 	case RP_MBOX_CRASH:
-		/*
-		 * remoteproc detected an exception, but error recovery is not
-		 * supported. So, just log this for now
-		 */
 		dev_err(dev, "K3 rproc %s crashed\n", rproc->name);
+		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
 		break;
 	case RP_MBOX_ECHO_REPLY:
 		dev_info(dev, "received echo reply from %s\n", rproc->name);
-- 
2.53.0

