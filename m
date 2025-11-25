Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010029.outbound.protection.outlook.com [40.93.198.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB81C2D7DD9;
	Tue, 25 Nov 2025 08:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764059885; cv=fail; b=VQ/1YPYpzC7EAmkcj9a2oyxJCbRMYhXlYaiIA+skQUFlR1srED7acpyfoFTZLktdlf7QCyuMOIMoZkKi4DKAOz+lvGwYZ/I6Rjg7a6YbYYV8slwfEytaV10XWskxSZQeU1AWfUdS2BzfbhLkDLLMOEp3LD3DcOu5Kcfw+d3nFv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764059885; c=relaxed/simple;
	bh=dO1hcQfWASwTH/gitHKyYeqR9rdvq++1dTyEshkDMn8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=to0LD36a5UAq/chMT1eQs14hmhpKzmJHru9lcjipOB1h2Pig9KInMRoXq3j0ySyl0tNc/wBySk77QORGx50aXotnrpXyplbx4vv+FWO1/xBi/SBsIwiXbqjJh22krlVwbQvPjc/nD7l9GniH5tbJwOnd/8KM8YndAqgb7lchO60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HJIUonvp; arc=fail smtp.client-ip=40.93.198.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HJIUonvp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vmAAyXRu6OFhHtCv8NdGs5p/lclh3h5CYcSwbHA71F8bb07NLFEpnY4/53KokoNYlZQjY5Qx5LwajzXVII4Rau3KYj7HiwhE7Hfsjn/lG1Nw5VPvu8IlKgQA4JJtqEDC4PrdhEr6EuJYG4h3+3LJgzvNKnx21LtCJ6n9ktZqqqkQQis0o4dPP7p2H83LP/PFedfxoKDjQ0e+ye7EPXaSDcZcFSJNyCDVEcdhUQzTbWLITkiORLCdzs4yyloa2tvgc3Iz/JL2D1JQDnZYMgHfrEmjDAHVK4m6JhWUr9jik6gV7kLARvsQAd/DQ7jpcdUk5M4k28qvOFiYyWL+PXtyKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqjARFKsV/Msh5mqb+fN832p9npTa+k24Y0SHNJ6mvU=;
 b=eKTp57V9x6EPPFwdk9hKAJYQBdpBIww+u1LKmgE7QzuxqBZJ6Gp2MBgrWf3Oay73xAgmNM0V3ziPZ6nZCMS21xv9lPVzfyGUBXSlYLXf0bSox7z8rggVYRKnCthL5PwlubWoJbrSGTC5BpPAihA2qXfI9i9Vm14BPtQvQlHnjLzkeA2TSiZGp66dy3ShF0Y32lNfwwovPJ0/Gn48szd4weryjqzXO2vYlx9A4N04qeaNcWQ9e/RmIKhR16PmToSzE+RGfrZWUVYzxTnoQE9e+AsT/0opEOrTUAC3ODRo5jzhodyIkN0r5Y6xqM95qFvM21eX6DLFJZ8o01BWXRQevw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqjARFKsV/Msh5mqb+fN832p9npTa+k24Y0SHNJ6mvU=;
 b=HJIUonvp/NAV2ym/cXpWVXLbKlQsyl0Dk/o6ycrq0QtneWxXK9r4z7EGwnVMGVT/s4QPkLFnOraVQduF+XB87v/H0p8wS7OniDTtFNJNc9vYcKftjdPZQzYyGm3cae+5EBBHlKmOJLaeL6lj2WbvChUOoDG4GHlwpZLo3wTts4c=
Received: from DM6PR07CA0113.namprd07.prod.outlook.com (2603:10b6:5:330::16)
 by DS0PR10MB6127.namprd10.prod.outlook.com (2603:10b6:8:c5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 08:37:57 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:5:330:cafe::ee) by DM6PR07CA0113.outlook.office365.com
 (2603:10b6:5:330::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Tue,
 25 Nov 2025 08:37:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Tue, 25 Nov 2025 08:37:56 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 25 Nov
 2025 02:37:50 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 25 Nov
 2025 02:37:50 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 25 Nov 2025 02:37:50 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AP8bkjK3370792;
	Tue, 25 Nov 2025 02:37:47 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <richard.genoud@bootlin.com>, <afd@ti.com>, <hnagalla@ti.com>,
	<jm@ti.com>, <u-kumar1@ti.com>, <jan.kiszka@siemens.com>,
	<christophe.jaillet@wanadoo.fr>, <b-padhi@ti.com>,
	<linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] remoteproc: k3: support for graceful shutdown of remote cores
Date: Tue, 25 Nov 2025 14:07:46 +0530
Message-ID: <20251125083746.2605721-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|DS0PR10MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: 5707325b-e4cb-4a1f-1ce2-08de2bfdee7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?piAzGuOAIsDEzzI4E3LFI9Umxmr2JfSsdd1oxHthgnTIDMZS2hicnUHafpwJ?=
 =?us-ascii?Q?NSouLKTGe0Wbt6xWV3dq84HUlJ73eE0ZQj53PgTISuRwjaMsI/XJ252Xj+1b?=
 =?us-ascii?Q?se2b7eJjgGpC7qZKGl+RMS9+zl5GO5Bsp0tmgTUuu8Beciwnla8JMDgXCVHr?=
 =?us-ascii?Q?LsNcHNxjWgcDl9fbS/By7XIEYOQfojtKZTdQcPV1agzB30lcatl36+0da0R4?=
 =?us-ascii?Q?m+zN0p8/a8rDsOXLemwvFrlaIYAjGRZJ+YW6hk1Wpos4bK4HjKUjFAGI7StQ?=
 =?us-ascii?Q?9jTDbW/oAVqIAZbI9FfB8IWcEfRDRSP78cRqevKFEpxtiP4j7qo5+yHu6WHr?=
 =?us-ascii?Q?AURuIA87lUHWiy0PX+gHecfSz7cgx33b3gJNQVFnyUykBbjQDo8RLHNiQOw7?=
 =?us-ascii?Q?/hNGqzGIh9jkWyzYGSFrajk8m6cMN7BlWHbI/Zilk27khUDrjR+8sNIWbgq4?=
 =?us-ascii?Q?d22Z7onqTRuvZKEfwu3Xo5lCbZf9PUVjM/pNGNWVqPEx/WkxQGztaw4rA8ht?=
 =?us-ascii?Q?bT+c1hp7jF+mA00bVL3Hw2VwbkUdLErOadn7wLaHUQEmHVzYkurcqM3FoHMr?=
 =?us-ascii?Q?jxr6DnJ5RjXZ7v2qr56oGuoMlWrtgDI/8BRuQNhHK7N0FQmv5e4iKQukEBh/?=
 =?us-ascii?Q?zvYXN83LszGlzYXlFcsFdwuGxhEz/5xN2Y9eDgZ/U/SpZIO/MBu4gt0/Al0u?=
 =?us-ascii?Q?xwVEZ3+mqyXpO5egqeIAUmSdT45yRxsw9EIK/J16PegYHKkhthyxBbE7Qjvg?=
 =?us-ascii?Q?0G9B7RygADwscGBRsCeA1rdaF9e4bYQjDKQAPw3WfLe6LHtXxDuDV22Smh/C?=
 =?us-ascii?Q?AhYsZdZXfRNJINs8VKI38niqkqRoHzLSVfkeAtfQ92o8M4KNJdztog+tZmZ9?=
 =?us-ascii?Q?Hc2ovIiSFMlNOLvpeKmJ9X+ny+EWYEhh6mRwT6+NW7nDxi2dslCkTjG4SjRL?=
 =?us-ascii?Q?ckx4SngjfbR1YStySs0PZxVKCzG9LDcv3XqvnUAv2eBWlCibkkisED1rtl4c?=
 =?us-ascii?Q?dijNxAdaua91+oQe0ALPzmX5vHwFVyeOdKUPeq+9QjuRFqjTp6amE+I5nFnf?=
 =?us-ascii?Q?ltkjptldktt2WbXFSWvqaRBxWDWrquhEX5Twz/zyWyQvCvPUAiNhNY1fgQxx?=
 =?us-ascii?Q?cx4Bqjl+IJrhwFvm3FpblI07TbfBrmcYwWCYENCiVV9XB6fnFWM1rQ6obu5K?=
 =?us-ascii?Q?z/Jf1d9bi913MVVEotPQbFbHZ6Ef63eJW0PzfnJxAIE0GsCoE5YUxit+8wFz?=
 =?us-ascii?Q?k+9oif95a9Tl3DejrCkdJDWkoOy7k0prqkmWB0Ty89+te1x/RcWomBX43acy?=
 =?us-ascii?Q?s541qk+ymLrUrcwbHwZ/JeSsAD9xAYy2dOS/4Y4A+mbx075Cy+ew247Ix5Xp?=
 =?us-ascii?Q?5oZmbzhiEDP8MszZLmEhTTSTVE6bOBnJ9w04YpfwPkomxSPQ+Fk/lQb7V8nR?=
 =?us-ascii?Q?K4Xmj2sNaZyztwo89gAn1/EMu5u8otrIqI1EmGZQ9yWzHwB68d2cLKwaf96q?=
 =?us-ascii?Q?cIM42deRzGxfNb8ch+zqFeOt0qEe4f+l43NGmjxYOG5rFLuyOywOqMLud5I0?=
 =?us-ascii?Q?6gQ8Dt6nNLgH5LO96Go=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 08:37:56.0195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5707325b-e4cb-4a1f-1ce2-08de2bfdee7b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6127

From: Richard Genoud <richard.genoud@bootlin.com>

Introduce software IPC handshake between the host running Linux and the
remote processors to gracefully stop/reset the remote core.

Upon a stop request, remoteproc driver sends a RP_MBOX_SHUTDOWN mailbox
message to the remotecore.
The remote core is expected to:
- relinquish all the resources acquired through Device Manager (DM)
- disable its interrupts
- send back a mailbox acknowledgment RP_MBOX_SHUDOWN_ACK
- enter WFI state.

Meanwhile, the K3 remoteproc driver does:
- wait for the RP_MBOX_SHUTDOWN_ACK from the remote core
- wait for the remoteproc to enter WFI state
- reset the remote core through device manager

Based on work from: Hari Nagalla <hnagalla@ti.com>

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
[b-padhi@ti.com: Extend support to all rprocs]
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. Extend graceful shutdown support for all rprocs (R5, DSP, M4)
2. Halt core only if SHUTDOWN_ACK is received from rproc and it has
entered WFI state.
3. Convert return type of is_core_in_wfi() to bool. Works better with
readx_poll_timeout() condition.
4. Cast RP_MBOX_SHUTDOWN to uintptr_t to suppress compiler warnings
when void* is 64 bit.
5. Wrapped Graceful shutdown code in the form of notify_shutdown_rproc
function.
6. Updated commit message to fix minor typos and such.

Link to v1:
https://lore.kernel.org/all/20240621150058.319524-5-richard.genoud@bootlin.com/

Testing done:
1. Tested Boot across all TI K3 EVM/SK boards.
2. Tested IPC on all TI K3 J7* EVM/SK boards (& AM62x SK).
4. Tested R5 rprocs can now be shutdown and powered back on
from userspace.
3. Tested that each patch in the series generates no new
warnings/errors.

 drivers/remoteproc/omap_remoteproc.h      |  9 ++-
 drivers/remoteproc/ti_k3_common.c         | 72 +++++++++++++++++++++++
 drivers/remoteproc/ti_k3_common.h         |  4 ++
 drivers/remoteproc/ti_k3_dsp_remoteproc.c |  2 +
 drivers/remoteproc/ti_k3_m4_remoteproc.c  |  2 +
 drivers/remoteproc/ti_k3_r5_remoteproc.c  |  5 ++
 6 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/omap_remoteproc.h b/drivers/remoteproc/omap_remoteproc.h
index 828e13256c023..c008f11fa2a43 100644
--- a/drivers/remoteproc/omap_remoteproc.h
+++ b/drivers/remoteproc/omap_remoteproc.h
@@ -42,6 +42,11 @@
  * @RP_MBOX_SUSPEND_CANCEL: a cancel suspend response from a remote processor
  * on a suspend request
  *
+ * @RP_MBOX_SHUTDOWN: shutdown request for the remote processor
+ *
+ * @RP_MBOX_SHUTDOWN_ACK: successful response from remote processor for a
+ * shutdown request. The remote processor should be in WFI state short after.
+ *
  * Introduce new message definitions if any here.
  *
  * @RP_MBOX_END_MSG: Indicates end of known/defined messages from remote core
@@ -59,7 +64,9 @@ enum omap_rp_mbox_messages {
 	RP_MBOX_SUSPEND_SYSTEM	= 0xFFFFFF11,
 	RP_MBOX_SUSPEND_ACK	= 0xFFFFFF12,
 	RP_MBOX_SUSPEND_CANCEL	= 0xFFFFFF13,
-	RP_MBOX_END_MSG		= 0xFFFFFF14,
+	RP_MBOX_SHUTDOWN	= 0xFFFFFF14,
+	RP_MBOX_SHUTDOWN_ACK	= 0xFFFFFF15,
+	RP_MBOX_END_MSG		= 0xFFFFFF16,
 };
 
 #endif /* _OMAP_RPMSG_H */
diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 56b71652e449f..5d469f65115c3 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -18,7 +18,9 @@
  *	Hari Nagalla <hnagalla@ti.com>
  */
 
+#include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/mailbox_client.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
@@ -69,6 +71,10 @@ void k3_rproc_mbox_callback(struct mbox_client *client, void *data)
 	case RP_MBOX_ECHO_REPLY:
 		dev_info(dev, "received echo reply from %s\n", rproc->name);
 		break;
+	case RP_MBOX_SHUTDOWN_ACK:
+		dev_dbg(dev, "received shutdown_ack from %s\n", rproc->name);
+		complete(&kproc->shutdown_complete);
+		break;
 	default:
 		/* silently handle all other valid messages */
 		if (msg >= RP_MBOX_READY && msg < RP_MBOX_END_MSG)
@@ -188,6 +194,67 @@ int k3_rproc_request_mbox(struct rproc *rproc)
 }
 EXPORT_SYMBOL_GPL(k3_rproc_request_mbox);
 
+/**
+ * is_core_in_wfi - Utility function to check core status
+ * @kproc: remote core pointer used for checking core status
+ *
+ * This utility function is invoked by the shutdown sequence to ensure
+ * the remote core is in wfi, before asserting a reset.
+ */
+bool is_core_in_wfi(struct k3_rproc *kproc)
+{
+	int ret;
+	u64 boot_vec;
+	u32 cfg, ctrl, stat;
+
+	ret = ti_sci_proc_get_status(kproc->tsp, &boot_vec, &cfg, &ctrl, &stat);
+	if (ret)
+		return false;
+
+	return (bool)(stat & PROC_BOOT_STATUS_FLAG_CPU_WFI);
+}
+EXPORT_SYMBOL_GPL(is_core_in_wfi);
+
+/**
+ * notify_shutdown_rproc - Prepare the remoteproc for a shutdown
+ * @kproc: remote core pointer used for sending mbox msg
+ *
+ * This function sends the shutdown prepare message to remote processor and
+ * waits for an ACK. Further, it checks if the remote processor has entered
+ * into WFI mode. It is invoked in shutdown sequence to ensure the rproc
+ * has relinquished its resources before asserting a reset, so the shutdown
+ * happens cleanly.
+ */
+int notify_shutdown_rproc(struct k3_rproc *kproc)
+{
+	bool wfi_status = false;
+	int ret;
+
+	reinit_completion(&kproc->shutdown_complete);
+
+	ret = mbox_send_message(kproc->mbox, (void *)(uintptr_t)RP_MBOX_SHUTDOWN);
+	if (ret < 0) {
+		dev_err(kproc->dev, "PM mbox_send_message failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = wait_for_completion_timeout(&kproc->shutdown_complete,
+					  msecs_to_jiffies(5000));
+	if (ret == 0) {
+		dev_err(kproc->dev, "%s: timeout waiting for rproc completion event\n",
+			__func__);
+		return -EBUSY;
+	}
+
+	ret = readx_poll_timeout(is_core_in_wfi, kproc, wfi_status, wfi_status,
+				 200, 2000);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(notify_shutdown_rproc);
+
 /*
  * The K3 DSP and M4 cores have a local reset that affects only the CPU, and a
  * generic module reset that powers on the device and allows the internal
@@ -288,6 +355,11 @@ EXPORT_SYMBOL_GPL(k3_rproc_start);
 int k3_rproc_stop(struct rproc *rproc)
 {
 	struct k3_rproc *kproc = rproc->priv;
+	int ret;
+
+	ret = notify_shutdown_rproc(kproc);
+	if (ret)
+		return ret;
 
 	return k3_rproc_reset(kproc);
 }
diff --git a/drivers/remoteproc/ti_k3_common.h b/drivers/remoteproc/ti_k3_common.h
index aee3c28dbe510..2a025f4894b82 100644
--- a/drivers/remoteproc/ti_k3_common.h
+++ b/drivers/remoteproc/ti_k3_common.h
@@ -22,6 +22,7 @@
 #define REMOTEPROC_TI_K3_COMMON_H
 
 #define KEYSTONE_RPROC_LOCAL_ADDRESS_MASK	(SZ_16M - 1)
+#define PROC_BOOT_STATUS_FLAG_CPU_WFI		0x00000002
 
 /**
  * struct k3_rproc_mem - internal memory structure
@@ -92,6 +93,7 @@ struct k3_rproc {
 	u32 ti_sci_id;
 	struct mbox_chan *mbox;
 	struct mbox_client client;
+	struct completion shutdown_complete;
 	void *priv;
 };
 
@@ -115,4 +117,6 @@ int k3_rproc_of_get_memories(struct platform_device *pdev,
 void k3_mem_release(void *data);
 int k3_reserved_mem_init(struct k3_rproc *kproc);
 void k3_release_tsp(void *data);
+bool is_core_in_wfi(struct k3_rproc *kproc);
+int notify_shutdown_rproc(struct k3_rproc *kproc);
 #endif /* REMOTEPROC_TI_K3_COMMON_H */
diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index d6ceea6dc920e..156ae09d8ee25 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -133,6 +133,8 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	init_completion(&kproc->shutdown_complete);
+
 	ret = k3_rproc_of_get_memories(pdev, kproc);
 	if (ret)
 		return ret;
diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 3a11fd24eb52b..64d99071279b0 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -90,6 +90,8 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	init_completion(&kproc->shutdown_complete);
+
 	ret = k3_rproc_of_get_memories(pdev, kproc);
 	if (ret)
 		return ret;
diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 04f23295ffc10..8748dc6089cc2 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -533,6 +533,10 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
 	struct k3_r5_cluster *cluster = core->cluster;
 	int ret;
 
+	ret = notify_shutdown_rproc(kproc);
+	if (ret)
+		return ret;
+
 	/* halt all applicable cores */
 	if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
 		list_for_each_entry(core, &cluster->cores, elem) {
@@ -1129,6 +1133,7 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 			goto out;
 		}
 
+		init_completion(&kproc->shutdown_complete);
 init_rmem:
 		k3_r5_adjust_tcm_sizes(kproc);
 
-- 
2.34.1

