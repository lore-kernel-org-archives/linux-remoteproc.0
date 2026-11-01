Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793541273;
	b=YatnqjfkohdZXPcxCjpEZxWq0f5bFLtXdXZShllXnj1BPD28n5q7KSEn+kpFLkl7n3N6
	 jkbfDee9hoNofELBlPImoGStepso8jFbYLJOevcaR0LOw80K1vGJaTeey9+rHsLckl+oO
	 Rukgb6zR+gUOriyw61n21OUItvqLZ/7m29lBc9EHI6obnodCC9/tOlGBNV+BpJbicxhRq
	 0Fv5WguBvrDS5pPsPNnsmU9HQyfpKQmwqvbfV+bqr+Oiyi7dW0e/A6cKo4qYlKygDcItN
	 9ZqKFe+bg7+t/wcQMtIRLheQXf8qj9KjQAqtG0MZcYC4NFmUnYwCyLRcby5hCNpx46g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793541273;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=A4VJE1g09mtLm8iEXcawjLLE46p5rLTg9r9vmt2AnF4=;
	b=uGS5iWGP5M01KlqVADRFjs7hBRa4eBSq1cJehGoVWYl/XM9+CPSBtJT54jYQA/2O/3Oe
	 Rbd+3xtNhmuEF0NOG3Ivyi8QJxpupzm99/WCZzjnIHqIN/sBBz6wOTaMn6rOqnF5LRsJo
	 cZl3tAuFS6gCp8+MLjiI60uBqQ7zTslo/vkyfMEgZFECY1BQkO4hjNpts5tr1utvLA7r6
	 ++4FDS6yzZ90c28c/MJkY4e3jCL/U4fII4ms/kdZwpdI8RU9RIVGWv7ERjB6Mi7sH4HwR
	 fP3pzsTHOFG1jOIb55La472TFEATsztEY9aTDA6D74Rv8tQX1V05M3AuB8WFMl4VjGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=Gpf7iG1y;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=YXsfU9os;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.11
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD52A606A324;
	Sun,  1 Nov 2026 13:54:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD52A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=Gpf7iG1y;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=YXsfU9os
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; s=arckey; t=1793541271;
	 b=rlROe/BAihgGiBWgwoqd0xzXfHX5hqh1s6HxI1x/+/xd9rwtPcjuWBp+1yIFPcd01ZXe9oNctz
	  1mFyTHQsjzi7WtoFwi5J1AnZb9wa2PBlEhS5dCcQFFQ9jSsLe5Et+37v84yLENmMkvD7nTzT4A
	  W/Ea9pkn49a8TW8rxLz02mydtRgVBuU/C+PzcHZMCS2smsmjxHqtwSP3FvKlXqpq5HSA9S54ok
	  BuFDx40u9MpK1QN3nRYJRzE7cKcPo+Ydwsiwc3NBQg5F0q3goLrqKg9EwdxgcLXtaUkyRIBY2s
	  s9MqutK1HKT2NWWbZvatpdwBH+IacnxgYyBilF0oAinPTA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; s=arckey; t=1793541271;
	bh=MFL/wyEnlt6iCjlrDkJnaKF6azPO+bGHbae6nuTsZdg=;
	h=Cc:To:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:
	  Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=bL6iGRfMfOzpxDFSQZmTvtlF3GSybKKSfArvS4CrpWTObnlhCV8YYCjxiDg345Usv8byqszhGo
	  /fIFbZ/PLrKzftv43NYRxO8ztffooze9W+kwrnhJAMjYvCNJoO6odeVDGk6jijfFLP4ePkI7C1
	  HkDNF58G++yTX4GVT8Hzw+yFkuQukHAm7mTCpmxU7iYe0ilBFEqUY4gLhqathmsRDkrkxA/4vr
	  aDLZ/5fz3ddpnDKqK7YNnX9ojJs9bKzdvzWNVp5tsnmLZk5GRfXdssobTmjcNlCnMbrf0I7uwk
	  W2fsFxr8+6px5QNqBm2j5O8myogAtTqzouycdMd8CBjmeQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=A4VJE1g09mtLm8iEXcawjLLE46p5rLTg9r9vmt2AnF4=; b=Gpf7iG1yQayXrMsfO/u21HWCW3
	YyQ4m3YKzu7GZ1VZqAkCKOdhpmbm9TwYWe2lRpCjGqC4zl4soLX27hkfYlgn2ugREU25lyov03Quc
	XvaHDP9Rd5YFMDTqR04gFpagx2CT7JiBGaQvn64pGQbaLZGdkfdYQBpP3KNyC2uLIstc=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNW0s-00000000hw5-3vxB;
	Sun, 01 Nov 2026 13:54:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=A4VJE1g09mtLm8iEXcawjLLE46p5rLTg9r9vmt2AnF4=; b=YXsfU9osMrIIpFRWWNmtOAVdA6
	FvIad6P+5mKk13DlMGaHEbAgK+3WiuY4QE+mKylBjg4v5sZIIPa40WbuWbIQp/GPDGe5izxtiBhSB
	ABgPtaKK2pZwOK83eqN4pR/NO7FeyL4aA4Af0XRXF7Uq9cpagoldaY5YZejmHQ+FPfdY=;
Received: from [79.17.15.196] (port=63534 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNW0n-00000000Ck5-2eJ0;
	Sun, 01 Nov 2026 13:54:17 +0000
From: Francesco Valla <francesco@valla.it>
Date: Sun, 01 Nov 2026 14:54:03 +0100
Subject: [PATCH] virtio_rpmsg: fix config space alignment
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
Message-Id: <20261101-rpmsg-config-size-v1-1-65686b445b22@valla.it>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBG4avIrB1ILAT0KqULTX7TEYyS0VIq3
 r2pXX6L9w5SZIFSVx2U8RKVJRXYuiL/7FMESyimxjTOWmM5r7NG9ksaJbLKB2zCgBa9u3kXqHR
 rxijv63l//K37MMFvvxGd5xeSp+XidQAAAA==
X-Change-ID: 20261101-rpmsg-config-size-0dbe9ea63c6d
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Tanmay Shah <tanmay.shah@amd.com>, 
 Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2151; i=francesco@valla.it;
 h=from:subject:message-id; bh=MFL/wyEnlt6iCjlrDkJnaKF6azPO+bGHbae6nuTsZdg=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnPXVqWfH/bcyJT83VJu1BEResWhyj3fAaHANN++7BUg
 4boar6OUhYGMS4GWTFFlpB1N+7tmWv+LW0D4yOYOaxMIEMYuDgFYCIZpowMW7x1tnsdXyqyXfLV
 zIVnq6QWHW+2+1f5e+Opv8+VxItiXzL8D3ghGNzBX8idplFztO0jh/vaEq7L57iCo8N+5XTe0n3
 BDgA=
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
X-SGantispam-id: d7b4a7363bd6fbc6c894f8021c5b5394
X-AntiAbuse: ID - d7b4a7363bd6fbc6c894f8021c5b5394
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xNW0s-00000000hw5-3vxB-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

The comment for virtio_rpmsg_config says that this structure is
naturally aligned to 32 bits, and this is desirable by some
architectures that don't get along with unaligned accesses.
The content of the structure itself however isn't aligned, and the
__packed attribute prevent the compiler to add this alignment.

Fix this by adding a padding byte.

Fixes: ca96ea25e51a ("rpmsg: virtio_rpmsg_bus: Get buffer size from config space")
Signed-off-by: Francesco Valla <francesco@valla.it>
---
Hello,

unfortunately I missed this when the original patch set was sent, but I
think it's worth fixing (or at least discussing) this now before it
enters a stable kernel.

The same support in open-amp has already been merged [1], but maybe it
can be fixed before the next release there too?

Another, lower-impact solution would be to fix the comment, but that can
then led to issues on architectures that does not support unaligned
accesses (e.g.: AMR Cortex-M0).

Thank you

Francesco

[1] https://github.com/OpenAMP/open-amp/commit/744376f566c3ec7e06a7d093d785295b78aa486f
---
 include/linux/rpmsg/virtio_rpmsg.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
index 0872cbca4593..d24fedb63023 100644
--- a/include/linux/rpmsg/virtio_rpmsg.h
+++ b/include/linux/rpmsg/virtio_rpmsg.h
@@ -23,6 +23,7 @@
  *
  * @version:	version of this structure, currently %RPMSG_VDEV_CONFIG_V1.
  * @size:	size of this structure in bytes.
+ * @reserved:	padding, reserved for future usage.
  * @txbuf_size:	Tx buf size from remote's view. For Linux this is rx buf size.
  * @rxbuf_size:	Rx buf size from remote's view. For Linux this is tx buf size.
  *
@@ -33,6 +34,7 @@
 struct virtio_rpmsg_config {
 	u8 version;
 	__virtio16 size;
+	u8 reserved;
 	/* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
 	__virtio32 txbuf_size;
 	__virtio32 rxbuf_size;

---
base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
change-id: 20261101-rpmsg-config-size-0dbe9ea63c6d

Best regards,
--  
Francesco Valla <francesco@valla.it>

