Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAAD182BD;
	Tue, 13 May 2025 05:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115137; cv=none; b=mafpTzfV8N3k31SnNb9cCSIVlmq3v1izaPFAgzpAMDP3YBtuDZ3EFPRsOLR7aU1tMyTD4JHKs4ILo0M+t/TbLG2cyafm+o2Oyt7x3vBTga7xkyxS+WErXlxT+TDqU0yRuOJx4aFfigl23GDVOM5UuY9W5XwVsNbIFTuBN+/kLz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115137; c=relaxed/simple;
	bh=0VLUGC3xxU1GS9NEAmRIuEXaIe9jwuWkyhZ/+DNxtf8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RKkY9hMqWqV0VLck2hxFkVjpS+kmTO6YWLyq0o4Hfp0ky5y5o9M1fdU6no5QgAwEkjP4/EHg62CW0yNUPam6Dk/nBpqsP7YzvhruZ9A5972z37+os2DOw+gTuDAnhg9QdVNkhj5Ybkx9yTXmw4mHR4oF49IR81eJV0M0os02qk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MJEKOloA; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MJEKOloA"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5jOpa2985476
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 00:45:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747115124;
	bh=QF+ZDfJgaCy5roaKN17rl9OjHc1UyQdPyLWD8tP6Vog=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=MJEKOloA9ZLIs/qXtf5usbjOS9oKysoFOClm/nmmaT7QjQJyxFLV6Qde6yrAckNNF
	 GxKn9615jRkX7zFjLJ4DcmkkXL0UFP3PyS7uKXHBcjZdAb3cJP4WElvq7f0FYeTlP9
	 MLx7/yHn05CEUpCH1h//CcS8hMqctXdIyFwIhXPk=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54D5jNdk027558
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 May 2025 00:45:24 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 00:45:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 00:45:23 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54D5jAqB131001;
	Tue, 13 May 2025 00:45:20 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 02/36] remoteproc: k3-dsp: Drop check performed in k3_dsp_rproc_{mbox_callback/kick}
Date: Tue, 13 May 2025 11:14:36 +0530
Message-ID: <20250513054510.3439842-3-b-padhi@ti.com>
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
Reviewed-by: Andrew Davis <afd@ti.com>
---
v12: Changelog:
1. Carried R/B tag.

Link to v11:
https://lore.kernel.org/all/20250425104135.830255-3-b-padhi@ti.com/

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

