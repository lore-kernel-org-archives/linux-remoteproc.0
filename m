Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DC318E20;
	Mon, 16 Sep 2024 08:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726475506; cv=none; b=fbCXmuE+aJCKOFKSFWujW3jPZS/4Cu5IOdElV30qYzRzlY3jLFixFS8OPFjnMciqmW7lyQs5DpplaAEconcmE4xXogI660PrywC39YjECfwYzhFHSvgrjLHcqhJE3xUbLaKMa/ad8Tydwg5VXNhi3j3RTgB2dgeZk/lGdD5tb4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726475506; c=relaxed/simple;
	bh=PKHH9D64CXq/zyOm4jPgaREUQZpbbIPb9DMemnC21cI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N3jZacieHNkgKLTb1N/+sO060ALzol/VWDcBGY3x+F/FpICD1cUHVth5AC62DJUxvVQmYwTPXnXEnHqZQB6lGJxniKzAD/FESR3/zrppvQiTClIXX7YsH5JS/NdgU1m5m/fpfqEBnRTJSOoSQwHwDuBaarYpYinLAFo2qHnAlEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VJ5FOUik; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VJ5FOUik"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48G8VZf4091194;
	Mon, 16 Sep 2024 03:31:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1726475495;
	bh=/eM/nruLJj13XK64aqEhRoety3jeURb4qoteHTnCjLY=;
	h=From:To:CC:Subject:Date;
	b=VJ5FOUik7BSrRW/WCbWlYBEL+6v1B/dY9veP8tDcQuWxugJwG5QIWsPPYQPTy3pNX
	 Ce7MS87lC5aIdxZi2EXC/TP+dV/S/JW2DgE7bsjlVwMP5DcN50FP+W49ZvHK8k4sxI
	 YbKoVPULG5tfDZIjn9REHRptxrfIm+jalN6xiqw4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48G8VZAY099231
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Sep 2024 03:31:35 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 16
 Sep 2024 03:31:34 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 16 Sep 2024 03:31:34 -0500
Received: from uda0492258.dhcp.ti.com (dhcp-10-24-72-81.dhcp.ti.com [10.24.72.81])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48G8VVTP122947;
	Mon, 16 Sep 2024 03:31:32 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <b-padhi@ti.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <u-kumar1@ti.com>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [RFC PATCH] remoteproc: k3-r5: Fix check performed in k3_r5_rproc_{mbox_callback/kick}
Date: Mon, 16 Sep 2024 14:01:31 +0530
Message-ID: <20240916083131.2801755-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Commit f3f11cfe8907 ("remoteproc: k3-r5: Acquire mailbox handle during
probe routine") introduced a check in the "k3_r5_rproc_mbox_callback()" and
"k3_r5_rproc_kick()" callbacks, causing them to exit if the remote core's
state is "RPROC_DETACHED". However, the "__rproc_attach()" function that is
responsible for attaching to a remote core, updates the state of the remote
core to "RPROC_ATTACHED" only after invoking "rproc_start_subdevices()".

The "rproc_start_subdevices()" function triggers the probe of the Virtio
RPMsg devices associated with the remote core, which require that the
"k3_r5_rproc_kick()" and "k3_r5_rproc_mbox_callback()" callbacks are
functional. Hence, drop the check in the callbacks.

Fixes: f3f11cfe8907 ("remoteproc: k3-r5: Acquire mailbox handle during probe routine")
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello,

Since the commit being fixed is not yet a part of Mainline Linux, this
patch is based on linux-next tagged next-20240913.

An alternative to this patch will be a change to the "__rproc_attach()"
function in the "remoteproc_core.c" driver with
rproc->state = RPROC_ATTACHED;
being set after "rproc_attach_device()" is invoked, but __before__
invoking "rproc_start_subdevices()". Since this change will be performed
in the common Remoteproc Core, it appeared to me that fixing it in the
TI remoteproc driver is the correct approach.

The equivalent of this patch for ti_k3_dsp_remoteproc.c might also be
required, which I shall post if the current patch is acceptable.

Kindly review and share your feedback on this patch.

Regards,
Siddharth.

 drivers/remoteproc/ti_k3_r5_remoteproc.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 747ee467da88..4894461aa65f 100644
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
2.40.1

