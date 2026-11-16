Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.177.127.205
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854550;
	b=lJuxo5xM/N0zb3eh792HHSuvtTRdIzqEsVlVvBIMPFOGKpTzqs7UUaf7EQ/dSWJjjeVR
	 NEEkAiR8HOaAfGmVZnr+GVw9SmPNsIEcN/CynjGugXx8ftRhMvXLbi3jcXfmY6tLBrk90
	 aXJ/9ecx0mhTzt65MDCPLBML/WkVqugHF5Upo+k1wrY+WJyt2yz7VepmRUQeNueU8XpOG
	 kmS6ANt2oVVerCmo3dsqX+RdesTnUUzuKV9E6cierdXKFwOexThccUcwVPVm/BFHzfjrm
	 FGaaCojse8Kdczr+R8mODtCkvGVDf4obs1LUZZwPNVih7IeyYSfJYr5przcPgZdv5jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854550;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=46iaTwH0JBiEX1Bu+TkRJey1CZt0Qpd5SlJUPBhFISw=;
	b=MxLXdfrDp9hYN/V3/QcGkCaFUEeKFFxnx8dNv2Tfdly/1Q0pqV0eo1R8qqW8sqTuoRd6
	 sHXl/gABsnp9Pl5ookWUi9nICptv+D0DDu3P9rWZsTsHrTirMzyOI1WQ8IDay1f9crXHu
	 Q7N+mcn0jDSBX0nowualcg4Hz1Kwm6dwJn01UC1Q44pq45RFcF8ih/FX6X62ejLJXEVQm
	 87c1Xcfdnd8SJPCYOYn0KCbqrfkyWupGn+t/MyonutL/D7eDzr1sXsi1d+VZ4Cw1Eq9w2
	 YIsY6ese+Q5DXG0Aku+iRzojnear4aFxAhLGU0GzaYuD87Bva7TkPFzb4gmF5Xid1jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=qae3QguH;
	arc=none smtp.remote-ip=198.177.127.205
Received: from out-utut-a205.jellyfish.systems (out-utut-a205.jellyfish.systems [198.177.127.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD86E606A32A
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 18:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD86E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=qae3QguH
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jSxYC46STz2x98;
	Mon, 16 Nov 2026 18:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1794854531;
	bh=46iaTwH0JBiEX1Bu+TkRJey1CZt0Qpd5SlJUPBhFISw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qae3QguHfvo8Iex2TVI5/EGBrSyyHa4oHG5TKNhYNwh+yg+zlL/Wt9NrDgeGpSlKx
	 f6GjoB5+OpmQALz/wkawBgEKjjM1VRk8mRg9WGT9n6YDe51cYKgKrE44PjEpNBvPFi
	 itY7EHzwi7mBe9lcjKF853nZ244crPdpABS+w5Oja9yuY/udH+BDP7X1pLjx0eR4ds
	 B19s3nk+UjRYIVeOsMOU9TXIfBplJoP6r9ERdsdKHwWC2q9AtqPk8vPyq1JBitENgl
	 Gc1KvCbSd+p4dOq64byRqBHY6BqZofqQ9in0jwk76qETn47/4ka+i2HR0Z8z27hMkQ
	 h8nRReb1DRXNw==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	francesco@valla.it,
	Chrispine Tinega <dev@chrispinetinega.com>
Subject: [PATCH v2 2/2] remoteproc: k3-m4: Enable crash recovery for a core Linux booted
Date: Mon, 16 Nov 2026 21:41:45 +0300
Message-ID: <20261116184146.1897281-3-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116184146.1897281-1-dev@chrispinetinega.com>
References: <20261116184146.1897281-1-dev@chrispinetinega.com>
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

