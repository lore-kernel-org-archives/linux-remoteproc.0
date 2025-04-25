Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2520241668;
	Fri, 25 Apr 2025 10:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577730; cv=none; b=UrKh2vuOpWQiy4L5201Q3keLD7T5LHasHfsCiBbkyoeOTvY7LuhSMcmLSrdY5XHm7HsxDkGKNDOD11qtB1x3+VKQGUaHzufNkiTZZYJrCQXp7Yd+DczNd1Zpg9YQ7RDyjAE48XhRV20MikxjBOSn6y91keuop1s/IPS0UrKqBxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577730; c=relaxed/simple;
	bh=scJoYQYC6D8D1WIvtHdBL7hg3SsJpHO2swHGS7P6KDY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=liN1/RzY9BusX8mu5dPOYUiLHRVOVHvtm9rmr6qFAEf3UFx2WgC20ye10uLyNl/obnIl0hQzqLnEKR6eDxUnjrl9X2yr/u35m2pKATkuvo5lch7YTK3wyB37ePc6vhf2r4tuEAE7451sTdXRG5x0Tbhxx/52j6qknDEHtyuBVWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OZkBdRPt; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OZkBdRPt"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAfmLv2152198
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 05:41:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745577708;
	bh=tZVdg1NEuZIRKFuasNTFa8MgL+XjWDhZtcUUJlBDd4k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=OZkBdRPtNl0rFf92PaRqJV8roxj716ezQ7AgG8hofX7/M0sAgGWHVuG/eKud6qJSh
	 ciIyL3zqu2CfArhCAqaL3/GP027JH2qwI9OAIBJ28NxTFLL906sB6Ugvmn24XCNkjc
	 xw74vpF6JFYImo4yj7v68gIeihn5p4C8ihY2NLEI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAfm8R027777
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 05:41:48 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 05:41:47 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 05:41:47 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PAfaZN038329;
	Fri, 25 Apr 2025 05:41:44 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 02/35] remoteproc: k3-dsp: Drop check performed in k3_dsp_rproc_{mbox_callback/kick}
Date: Fri, 25 Apr 2025 16:11:02 +0530
Message-ID: <20250425104135.830255-3-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425104135.830255-1-b-padhi@ti.com>
References: <20250425104135.830255-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Siddharth Vadapalli <s-vadapalli@ti.com>

Commit ea1d6fb5b571 ("remoteproc: k3-dsp: Acquire mailbox handle during
probe routine") introduced a check in the "k3_dsp_rproc_mbox_callback()"
and "k3_dsp_rproc_kick()" callbacks, causing them to exit if the remote
core's state is "RPROC_DETACHED". However, the "__rproc_attach()"
function that is responsible for attaching to a remote core, updates the
state of the remote core to "RPROC_ATTACHED" only after invoking
"rproc_start_subdevices()".

The "rproc_start_subdevices()" function triggers the probe of the Virtio
RPMsg devices associated with the remote core, which require that the
"k3_dsp_rproc_kick()" and "k3_dsp_rproc_mbox_callback()" callbacks are
functional. Hence, drop the check in the callbacks.

Fixes: ea1d6fb5b571 ("remoteproc: k3-dsp: Acquire mailbox handle during probe routine")
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
---
v11: Changelog:
1. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-3-b-padhi@ti.com/

v10: Changelog:
1. Re-ordered this patch from [v9 07/26] to [v10 02/33].

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-8-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index a695890254ff7..35e8c3cc313c3 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -115,10 +115,6 @@ static void k3_dsp_rproc_mbox_callback(struct mbox_client *client, void *data)
 	const char *name = kproc->rproc->name;
 	u32 msg = omap_mbox_message(data);
 
-	/* Do not forward messages from a detached core */
-	if (kproc->rproc->state == RPROC_DETACHED)
-		return;
-
 	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
 
 	switch (msg) {
@@ -159,10 +155,6 @@ static void k3_dsp_rproc_kick(struct rproc *rproc, int vqid)
 	mbox_msg_t msg = (mbox_msg_t)vqid;
 	int ret;
 
-	/* Do not forward messages to a detached core */
-	if (kproc->rproc->state == RPROC_DETACHED)
-		return;
-
 	/* send the index of the triggered virtqueue in the mailbox payload */
 	ret = mbox_send_message(kproc->mbox, (void *)msg);
 	if (ret < 0)
-- 
2.34.1

