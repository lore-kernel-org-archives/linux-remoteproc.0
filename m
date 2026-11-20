Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795215690;
	b=3yHzRp2nspCLwNf6STH56ASmyHt996KIMwMaBjAQyQvSSDZ2k7Ze1m3zYwdgezx46+kN
	 Vc684qKIGPQheXrVAap2QmPOqKPUTzU4jemwYOPNh68wy5QnzCoVH3PVqPj4Czf0EqtTZ
	 29zVvEXEZcI1vPuWUdX/tfa542ttN6ZdqR1vnmWF3A795c7XpC2ACe/qSAEKSVbnKUoEM
	 ZVVUGFfrFpQZfEzTdiwc0iHgU0VwXDlKhHp7ucRPdnS1NNXbr55cPmIYqb+qchdhxO36O
	 cCsOgnO451VOrSXZOYhAdixJDrDOOYDYDX4NwhaDZrBQAZ4RfcZbnl7jro8xP6eHTQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215690;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=+/q8UfMsulgfhunSD2SWHwqW8QN79mA6TFVEGjC3iw8=;
	b=BG0CWnVETx2/4InnvGa4CIAs8M78Pa64H28Tq2Fl9LD9LdmPU54l5gdM4Aj52U0CbcMl
	 n4W0Jda6Cm+q5XhB1wRJJRwb+S6KzpwlLkh2FOtrmC5cEGQl/EQZpd3HdLGlupssH5DgR
	 iI0WcuUsJrg3eKkdtG6Zzvf6BKYP4licrnzet+i96RxnTZghR5Rsx8D+E96f5g9QRqi2E
	 Qc/nr5p1ypNJyWfvbZw6cHjrWLIumn7x/JMoFJv0POKepjuj2FbzH4biih+QB+/8fFI5b
	 2x3yH8W8lGe+JeXGQQmDEkiVcdZLUEWxLx0K0DUbuWFCut86puyMMzEDC3iRW7Ch8eQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=bosde401;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=Nx6S2p6v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.10
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A86606A68C;
	Fri, 20 Nov 2026 23:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56A86606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=bosde401;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=Nx6S2p6v
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; s=arckey; t=1795215679;
	 b=PGn0yp6bvV0PxK3ss8u323wwJBQjfGth4JrLa0Wn5N8E+10tuomf95fsm3j7pb1exN/8pBjEmX
	  Ruiw2ES+eAmbPv6gRBGVF3EtCP/MLZgQt30tqx1HIsrTXsCPYlgN5hsdZeFaZ0QpWyp/jU9NtW
	  5FzFeXsp05Fz0hj3JpoGPSNYDE3t60tN5A+7+HqUUaqfg//TqSMkTYHziDDTrlFLolB0fJ7zaL
	  xb6gHvGZCJhcodnrpNYsVycu0RKRNKSYD2Ni5Nt79hdhYy2NrtFVDP6bsfpCiQeMB/0U6lZ4Ar
	  X89anX6W272T+ZtjP5Zej8ZyOrDe3lT27kKrYYN6WTKWlQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com; s=arckey; t=1795215679;
	bh=VNss+LZWiP/6qtAqGAFDcCcVAZcFen7nqgJ7Xcd1EuI=;
	h=Cc:To:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:
	  Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=Ph7gBCU86heUt+D5U0rNhN1j+flS5MuCVAH3Cbv7NFqDXyDMd4wlQC02pmUu11PbAvkeUBSiwW
	  g9jvkixeNVonpLn0TBfHgqf2RkqV+14Fn1VDTi/CBjwi3LKQKnWCMhszcZL2a706nsKgT18yRI
	  5j+Z1uAbEvERgrf0CnyimUkTwLfQGYtT+NnPlBNM1dBu9szFG+GNlz/yJj86Ag7tvqNvTStjXn
	  Xzkz7GiyBjL2HtrolA1qawAEgt/5DDmalMUBskX79ixeV+pX/IjavtZD6BdrcpvDL+2mXXM22T
	  x4gvCURR3gQCBq3XcVUK9dXSAZwsHpm1cRyv6mZkxGIcZQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=+/q8UfMsulgfhunSD2SWHwqW8QN79mA6TFVEGjC3iw8=; b=bosde401Szk/tHIkDHN15BV9G6
	SXmyj5VKkmUUEn9YIWzj+myJlEDobhXVxVuChsF8uqRhLJ7WWPFCcGo2Bvh6tbvH3QfDnGddsjyyx
	vMIyPEx5VVcKw22vttwkc9EsZTm9ZPS6Wb/XkXS4uZTq8x+owSMwLYEr7VJAqs2ITBdU=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xUXbT-0000000DF26-308X;
	Fri, 20 Nov 2026 23:01:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=+/q8UfMsulgfhunSD2SWHwqW8QN79mA6TFVEGjC3iw8=; b=Nx6S2p6vKR9ab4/Tqp3u3wnCn7
	KgIN1vrDDRkjQ3oH6vDGKGkioEcT0fBje5O6IrM89oGshIIjLOAEdb+GANju0LyVlcWHnysEPac1r
	WkK1VSGirflSbFLQLQtlWlxLqZyMMT1DX3lTFb82B6DUs/+2xVnT2Es8BIzCVwkBi6hw=;
Received: from [95.251.96.187] (port=60817 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xUXbP-000000003jY-13Q0;
	Fri, 20 Nov 2026 23:01:07 +0000
From: Francesco Valla <francesco@valla.it>
Date: Sat, 21 Nov 2026 00:01:02 +0100
Subject: [PATCH v2] virtio_rpmsg: Fix config space alignment
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
Message-Id: <20261121-rpmsg-config-size-v2-1-d2fd698b6f76@valla.it>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0Jm7RhaoVFX3MOwaMsAYxBIBxuVc
 HcB9y5f8v77MwgFJoFrMkOgyMJDv4I+JOBb2zeEXK0MOtVGqVRhGB/SoB/6mhsU/hCmlaMLWXP
 ypoJ1Nwaq+bU3b+WP5enu5KcttBktyzSE934a1eb960eFCk1uzsZlWe60LqLtOnvkCcplWb63x
 9QIwwAAAA==
X-Change-ID: 20261101-rpmsg-config-size-0dbe9ea63c6d
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Tanmay Shah <tanmay.shah@amd.com>, 
 Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
 openamp-rp@lists.openampproject.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1982; i=francesco@valla.it;
 h=from:subject:message-id; bh=VNss+LZWiP/6qtAqGAFDcCcVAZcFen7nqgJ7Xcd1EuI=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDNkMF40O6L9lEQ4yz9FK5OOI8ytdfKqG770s09Y93YsyG
 p9Kc8zvKGVhEONikBVTZAlZd+Penrnm39I2MD6CmcPKBDKEgYtTACaybAnD/6zA9MpjiyfdYJ56
 yTFF3U7oSem5zsNS03k0WfucD3x8FsHwV+xc2DrjuxaeE39kr3gyI+/N/E9qX7Q4rn8Lbinkvtg
 8nxsA
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
X-SGantispam-id: d7e5a4f9ddf471e0170fd048635fcb83
X-AntiAbuse: ID - d7e5a4f9ddf471e0170fd048635fcb83
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xUXbT-0000000DF26-308X-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4zq2.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

The comment for virtio_rpmsg_config says that this structure is
naturally aligned to 32 bits, and this is desirable by some
architectures that don't get along with unaligned accesses.
The content of the structure itself however isn't aligned, and the
__packed attribute prevent the compiler to add this alignment.

Fix this by extending the version field to 16 bits.

Fixes: ca96ea25e51a ("rpmsg: virtio_rpmsg_bus: Get buffer size from config space")
Signed-off-by: Francesco Valla <francesco@valla.it>
---
Changes in v2:
- version field extended to 16 bits instead of adding a reserved byte.
- Rebased on current master.
- Link to v1: https://patch.msgid.link/20261101-rpmsg-config-size-v1-1-65686b445b22@valla.it
---
 drivers/rpmsg/virtio_rpmsg_bus.c   | 2 +-
 include/linux/rpmsg/virtio_rpmsg.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 23ff6c8b7a20..27282475a732 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -815,7 +815,7 @@ static void rpmsg_virtio_del_ctrl_dev(struct rpmsg_device *rpdev_ctrl)
 static int rpmsg_virtio_get_buf_size(struct virtproc_info *vrp)
 {
 	struct virtio_device *vdev;
-	u8 version;
+	u16 version;
 	u16 size;
 
 	vdev = vrp->vdev;
diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
index 0872cbca4593..57f48d537de9 100644
--- a/include/linux/rpmsg/virtio_rpmsg.h
+++ b/include/linux/rpmsg/virtio_rpmsg.h
@@ -31,7 +31,7 @@
  * the structure is naturally 32-bit aligned.
  */
 struct virtio_rpmsg_config {
-	u8 version;
+	__virtio16 version;
 	__virtio16 size;
 	/* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
 	__virtio32 txbuf_size;

---
base-commit: 5f22fb20497f4983094131f00a734362300d22d2
change-id: 20261101-rpmsg-config-size-0dbe9ea63c6d

Best regards,
--  
Francesco Valla <francesco@valla.it>

