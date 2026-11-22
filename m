Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=104.207.68.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795385922;
	b=GKkYxO536KMkFwc79siu5/haq25rcN0uHDAlrxF4j3bM40iUL5VT95df9PUoyM4pRCU/
	 5G2JXocWoLOBVv62aUia/7TmxH8xSWiDS0Mc2mRowwrrx9Qv63+BqRQvRYzy3qrUJCtBn
	 lUv71BsxCKet7p1Lnm+jHyy1X8Jo5qptNzSc3kEmxc1QF60tCPkKjxWWnIwRmj0YQy5Se
	 gY0dAx7/xMESBWumswDlY1Ch1Y0UU0CxFMSDaeVNofPNgW55IxsgOPQFSEEhkD5CY9e5Z
	 86XXWzYFha/DVWEa+NKFNAU6VdtK2sDEHG6QunzzGRmhJ8GdIX0P0g+QmdkILS5GBCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795385922;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=p3q0sdxZScVzPT5Vw53EcAXgBqUf1uVRAaFg6PnqX7c=;
	b=1vICkesw8Ra4OJ1Th/ULR7kbzaLvvMAhNckfuIR1kq5LK1ARxaKA0WwQwJvSdfqxy9SJ
	 OvJMAN9iCtihzAvqh9yll9p12bY66cZapQw3AXIFSIeW+PaUQCASDCawXV/+100c2lkEt
	 fcmdI+/qOryzknMs63eMjP+TUokLBBbVPZhm1frivk5FY3rTO0MF0bJTOmPo1Hsn0W61J
	 cKmFKCGWf+M/1f8ZMTxjjP2EomVEMAZXC8dVZPsUwXpD9gQYiBqI5nC521ZYAsQiYVgdo
	 yMFJD/GBflfjZJOqedlRrQT3rquzf4EnOo+Bje1fF7Om294hUna2VxZemjhtcZa9kzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=EN8JIzyh;
	arc=none smtp.remote-ip=104.207.68.34
Received: from out-93wp-a34.jellyfish.systems (out-93wp-a34.jellyfish.systems [104.207.68.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721B6606A31D
	for <linux-remoteproc@vger.kernel.org>; Sun, 22 Nov 2026 22:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 721B6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=EN8JIzyh
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jXk406yWYz2x9D;
	Sun, 22 Nov 2026 22:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1795385909;
	bh=p3q0sdxZScVzPT5Vw53EcAXgBqUf1uVRAaFg6PnqX7c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EN8JIzyhDUkEepzXyqoGxurZsV4ANxDQ8exo1z+j5Ul4l8ND4e0r9BeneT0D7Zcte
	 R8XiJPoRvu/CWf3nOdGRK/5/yq3WWh9siZGONHNUypkuLr9w7K1Wr3bVOxxqkGAdae
	 aTUB+0BAA2eGScveHZK1LCgP2d5bxZGxudAHP5pfIfzzUnnmauemOOFBqH1s5Jw+lG
	 FvlHPx1JDX7D3oyW6dWTG+bSJG6EsUJ8hJPWfQRwySkrOsLtJkF0dSnJlNvdymdIU1
	 BmtV/XM01115ooDGd5AQ1+yRXYMrM7E4PNmnJtL/nb+TLbeRNurQYdHXxcFz/6a2Zj
	 Ra4nLlWTfiYQA==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francesco Valla <francesco@valla.it>,
	Chrispine Tinega <dev@chrispinetinega.com>
Subject: [PATCH v3 2/2] remoteproc: k3-m4: Enable crash recovery for a core Linux booted
Date: Mon, 23 Nov 2026 01:17:54 +0300
Message-ID: <20261122221755.88160-3-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122221755.88160-1-dev@chrispinetinega.com>
References: <20261122221755.88160-1-dev@chrispinetinega.com>
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

The M4 driver disables recovery, but nothing reported a crash to the
remoteproc core, so there was nothing to recover from. Now that
RP_MBOX_CRASH reaches rproc_report_crash(), recovery resets the M4F and
boots its firmware again, while Linux keeps running. The stop is a
plain reset, so it does not need the crashed core's cooperation.

Enable recovery by default when Linux booted the M4F. Keep it disabled
in IPC-only mode, where Linux only attached: recovery boots
rproc->firmware from Linux, which need not be the firmware started
before Linux, and nothing would tell the user it was replaced.

Userspace can still change it through
/sys/class/remoteproc/remoteprocN/recovery.

Signed-off-by: Chrispine Tinega <dev@chrispinetinega.com>
---
Changes in v3:
- No changes.

Changes in v2:
- Keep recovery disabled in IPC-only mode, where Linux only attached
  and recovery could boot a different firmware unnoticed. (Francesco)
- Retitled from "remoteproc: k3-m4: Leave crash recovery enabled".

 drivers/remoteproc/ti_k3_m4_remoteproc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 4c46f4a25..b2a187ea4 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -56,7 +56,6 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	rproc->has_iommu = false;
-	rproc->recovery_disabled = true;
 	kproc = rproc->priv;
 	kproc->dev = dev;
 	kproc->rproc = rproc;
@@ -105,6 +104,11 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 	/* configure devices for either remoteproc or IPC-only mode */
 	if (p_state) {
 		rproc->state = RPROC_DETACHED;
+		/*
+		 * Recovery boots rproc->firmware, which is not necessarily what
+		 * was started before Linux attached.
+		 */
+		rproc->recovery_disabled = true;
 		dev_info(dev, "configured M4F for IPC-only mode\n");
 	} else {
 		dev_info(dev, "configured M4F for remoteproc mode\n");
-- 
2.53.0

