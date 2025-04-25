Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC4F219305;
	Fri, 25 Apr 2025 10:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577714; cv=none; b=GVY+VhsnERZfNnCmRlGow2VaC40RHI1ltavGflbm/TOZAQ4TvLOi/UKOP4tBE3bZmOFUZ2hBJWI3sYte9Fxp9PSW3lnLsxaBsljCK4BBzH3vSia1X8bsfp30la8KfmwOlsR9lqaWFBu4AIRH+A738GjEaxzEVpCUyKLvytK7xXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577714; c=relaxed/simple;
	bh=bGHZJR9nuiPTf0BX+FFOrGumZ9tfd/I6Eeo2PBKKoew=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tctBu+dYGWXqtfOUdxBjYbHcaxVwlgyqCAxkguC0r/A7bQu1gkDNfx9Sy13lDlHdHSBcLGyx1rsx1tpH0Y0FYwKi/PPiTykp1vuooPTKd9YbZ6Bc4ivWrTR/1y+0IJvloUlJER2FlTaA0kacFN7lBzuIPCb2YPrMOTBgVv997SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uEL3Xog/; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uEL3Xog/"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAfiTn2767590
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 05:41:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745577704;
	bh=qACSKB90BcULWMIKQAGFIv9E8gIxXb28f68g5v9lb7c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uEL3Xog/c3DhF5YC8sCB54hQij7dTB5Eo9UdKKuJuAt0Olx0Uuav9HNt8KA9R7vRE
	 zUmlIjU4znP65/IgRGnckv8OzdpUN/euTCuRSqxgWonh8u0hpZeacNeFw4FXOqtSzQ
	 pEtuaWYYHutbmBnRPtGatolEw/lAA6x88CgKOgG8=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PAfiDh087099
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 05:41:44 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 05:41:44 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 05:41:43 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PAfaZM038329;
	Fri, 25 Apr 2025 05:41:40 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 01/35] remoteproc: k3-r5: Drop check performed in k3_r5_rproc_{mbox_callback/kick}
Date: Fri, 25 Apr 2025 16:11:01 +0530
Message-ID: <20250425104135.830255-2-b-padhi@ti.com>
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

Commit f3f11cfe8907 ("remoteproc: k3-r5: Acquire mailbox handle during
probe routine") introduced a check in the "k3_r5_rproc_mbox_callback()"
and "k3_r5_rproc_kick()" callbacks, causing them to exit if the remote
core's state is "RPROC_DETACHED". However, the "__rproc_attach()"
function that is responsible for attaching to a remote core, updates
the state of the remote core to "RPROC_ATTACHED" only after invoking
"rproc_start_subdevices()".

The "rproc_start_subdevices()" function triggers the probe of the Virtio
RPMsg devices associated with the remote core, which require that the
"k3_r5_rproc_kick()" and "k3_r5_rproc_mbox_callback()" callbacks are
functional. Hence, drop the check in the callbacks.

Fixes: f3f11cfe8907 ("remoteproc: k3-r5: Acquire mailbox handle during probe routine")
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
---
v11: Changelog:
1. Carried T/B tag.

Link to v10:
https://lore.kernel.org/all/20250417182001.3903905-2-b-padhi@ti.com/

v10: Changelog:
1. Re-ordered this patch to come at the start of the series.

Link to v9:
https://lore.kernel.org/all/20250317120622.1746415-7-b-padhi@ti.com/

 drivers/remoteproc/ti_k3_r5_remoteproc.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index dbc513c5569cb..3fc0b97dec600 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -194,10 +194,6 @@ static void k3_r5_rproc_mbox_callback(struct mbox_client *client, void *data)
 	const char *name = kproc->rproc->name;
 	u32 msg = omap_mbox_message(data);
 
-	/* Do not forward message from a detached core */
-	if (kproc->rproc->state == RPROC_DETACHED)
-		return;
-
 	dev_dbg(dev, "mbox msg: 0x%x\n", msg);
 
 	switch (msg) {
@@ -233,10 +229,6 @@ static void k3_r5_rproc_kick(struct rproc *rproc, int vqid)
 	mbox_msg_t msg = (mbox_msg_t)vqid;
 	int ret;
 
-	/* Do not forward message to a detached core */
-	if (kproc->rproc->state == RPROC_DETACHED)
-		return;
-
 	/* send the index of the triggered virtqueue in the mailbox payload */
 	ret = mbox_send_message(kproc->mbox, (void *)msg);
 	if (ret < 0)
-- 
2.34.1

