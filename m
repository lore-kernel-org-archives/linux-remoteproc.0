Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47F31F4625;
	Tue, 13 May 2025 05:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115211; cv=none; b=IGmc+52/Fn+VvetlO+JyOb6UqXnPNYeSl7j/+1fXaxl10xGJbgBDY2AECu/SoW1cM+GYRHtHAwGVl2n8Gb9v4sqox3OvLPCBI+9IWVu8ogKHVGEX7ZifJKbKf7YYi0mWYcBkQHm+8dB5GJm2+ujslbUSImebBd0qTZrnfrJJj/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115211; c=relaxed/simple;
	bh=fGe9s3NDUx6wFV5nWsBkDlsnv7XN6e/n3ZReyTb76ss=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NBDPw/Y3pM1C4KIH89xCE/qP7nh0jUMopip61OMWep89kth8zyK9NefcFau6UScbY0Gn4n8r5qnBeozPKHBXdoCT6nDuWIF839AyHhc4IVLwEcOcfFT8UXbCjJAEAbzXNlVttDtYoDhgHVR/A5InQJvkIHYk9LWqY9xLLKVyzO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JXa9J2/Q; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JXa9J2/Q"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5kgaN2764348
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 00:46:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747115202;
	bh=XF9RyQ6Pcikze3L4r9TAbi4mF2d3RrAh3IUNhHe50hw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=JXa9J2/Qesj1ut7SsPs/k0dwXTTYiPACER8w3PRmg7h5sxhlSVIprrXWVqC3MzTU+
	 n1oBHaWjrTFXFnuib8OMoP1e/ebXjX3ZGpStweMIKKR7fOKezx3GyhVmHAoeex6eli
	 OpByR+dRzEJsKsF1tjzi+iES66O1b5s013XWLWtQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5kg8V028152
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 May 2025 00:46:42 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 00:46:42 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 00:46:42 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54D5jAqU131001;
	Tue, 13 May 2025 00:46:38 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 21/36] remoteproc: k3-m4: Ping the mbox while acquiring the channel
Date: Tue, 13 May 2025 11:14:55 +0530
Message-ID: <20250513054510.3439842-22-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513054510.3439842-1-b-padhi@ti.com>
References: <20250513054510.3439842-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

The TI K3 M4 remoteproc driver acquires the mailbox channel in probe but
sends a message through the acquired channel later in .attach()/.start()
callbacks.

Put both the things together in the form of 'k3_m4_rproc_request_mbox()'
function and invoke that in the probe routine. This is done to align the
rproc_request_mbox() implementation with R5 and DSP drivers which can be
factored out at a later stage.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
---
v12: Changelog:
1. Carried R/B tag.

Link to v11:
https://lore.kernel.org/all/20250425104135.830255-21-b-padhi@ti.com/

v11: Changelog:
1. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-19-b-padhi@ti.com/

v10: Changelog:
1. Split [v9 14/26] into [v10 18/33] and [v10 19/33] patches. 

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-15-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_m4_remoteproc.c | 44 ++++++++++--------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 3a21ff95046fd..182ac71e22da3 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -21,11 +21,24 @@
 #include "ti_sci_proc.h"
 #include "ti_k3_common.h"
 
-static int k3_m4_rproc_ping_mbox(struct k3_rproc *kproc)
+static int k3_m4_rproc_request_mbox(struct rproc *rproc)
 {
+	struct k3_rproc *kproc = rproc->priv;
+	struct mbox_client *client = &kproc->client;
 	struct device *dev = kproc->dev;
 	int ret;
 
+	client->dev = dev;
+	client->tx_done = NULL;
+	client->rx_callback = k3_rproc_mbox_callback;
+	client->tx_block = false;
+	client->knows_txdone = false;
+
+	kproc->mbox = mbox_request_channel(client, 0);
+	if (IS_ERR(kproc->mbox))
+		return dev_err_probe(dev, PTR_ERR(kproc->mbox),
+				     "mbox_request_channel failed\n");
+
 	/*
 	 * Ping the remote processor, this is only for sanity-sake for now;
 	 * there is no functional effect whatsoever.
@@ -36,6 +49,7 @@ static int k3_m4_rproc_ping_mbox(struct k3_rproc *kproc)
 	ret = mbox_send_message(kproc->mbox, (void *)RP_MBOX_ECHO_REQUEST);
 	if (ret < 0) {
 		dev_err(dev, "mbox_send_message failed: %d\n", ret);
+		mbox_free_channel(kproc->mbox);
 		return ret;
 	}
 
@@ -347,15 +361,8 @@ static void k3_m4_release_tsp(void *data)
 static int k3_m4_rproc_start(struct rproc *rproc)
 {
 	struct k3_rproc *kproc = rproc->priv;
-	int ret;
-
-	ret = k3_m4_rproc_ping_mbox(kproc);
-	if (ret)
-		return ret;
-
-	ret = k3_rproc_release(kproc);
 
-	return ret;
+	return k3_rproc_release(kproc);
 }
 
 /*
@@ -380,13 +387,6 @@ static int k3_m4_rproc_stop(struct rproc *rproc)
  */
 static int k3_m4_rproc_attach(struct rproc *rproc)
 {
-	struct k3_rproc *kproc = rproc->priv;
-	int ret;
-
-	ret = k3_m4_rproc_ping_mbox(kproc);
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
@@ -493,15 +493,9 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 		dev_info(dev, "configured M4F for remoteproc mode\n");
 	}
 
-	kproc->client.dev = dev;
-	kproc->client.tx_done = NULL;
-	kproc->client.rx_callback = k3_rproc_mbox_callback;
-	kproc->client.tx_block = false;
-	kproc->client.knows_txdone = false;
-	kproc->mbox = mbox_request_channel(&kproc->client, 0);
-	if (IS_ERR(kproc->mbox))
-		return dev_err_probe(dev, PTR_ERR(kproc->mbox),
-				     "mbox_request_channel failed\n");
+	ret = k3_m4_rproc_request_mbox(rproc);
+	if (ret)
+		return ret;
 
 	ret = devm_rproc_add(dev, rproc);
 	if (ret)
-- 
2.34.1

