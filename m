Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010035.outbound.protection.outlook.com [52.101.56.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C704126ED59;
	Thu, 18 Dec 2025 02:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766023601; cv=fail; b=c3QOvgRZX6taVKxs7SFP7qMv26cceAYD1KrmSbs0wYX1Ib87wkxzM9mVw542TkwZyZasmC0aFWaEbsM/kBjSh+tgtPdPyBKKR3Zuymhd71VJON+/3Pc5ahwILKrbHHggX/HP+XIQuRzUUlueHgAmSKSs1y/kd0KCDwNS8BXVRgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766023601; c=relaxed/simple;
	bh=4Mop8vs18ySnig/ra1Jp2iBsp74VY94XcxGW0zI+aY8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LYThZo0dboz4JgtQ4hrAXES0yZJDEI4cFQuR9oGrchQhZaV3enNKEtX6NGPxdHo0dik9/5FpHpDwXGLp5iYYRTe14zoJjnb66QJcCwq7S24R/Qfuds5EBOdMEb9Ywz4RqYhH5WcbHBBBXjBea/Te69Mgjjbz+pZniMO8CIqIeEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=q3Hmq4d+; arc=fail smtp.client-ip=52.101.56.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="q3Hmq4d+"
Received: from DS7PR12MB8232.namprd12.prod.outlook.com (2603:10b6:8:e3::12) by
 SJ2PR12MB7799.namprd12.prod.outlook.com (2603:10b6:a03:4d3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 23:32:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pg6Kw119cS1BDSmMZcJ1g3PYHr+1g4WQDJLnBP5crXRMht3XpUnIS4xR0+RHIGK38SXlbqaF9rj5sAa4U/abv9Ct9uxFeD29paVH2ZW8REXdMulQhfsQYMRDxUXcM95wkGN27M5Njp0vI+ASPJLcdHYqX/kanpIrJqh8bVOozYelxjQKPDoWv3GpPPIH78k9K4u0Gms3zJHNJd50dGv4kQsq59pHCkQthTOLzJjZkg4IJL60+8cbmaC8027CnS7AzNlqveSvWhX+YoH8LcDsQPkovcnHaGt797VxHVHwaqm46Hw0oGEN5WoPIwpPusjfignFIwAVPRYNrI6iSq/xFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AkK17Y7IHLYeTYvmr1GvWF9hPVk9yEzpHFYehd6ogbU=;
 b=nE8Obly3M7aXSzc5WGLJHvnHEtpt7Go1Or8kd8vIy9TJwPndsykgXrAuPKM9dV23JaC8Po5vQvVMh6kHP+6OQsZ95CcWYRjrrRprkojCQBaQ8rsw+AAlBv7n1RAuEajNP6wMyzMgj8lOYjBT9im6NrxU5+HsHUXaqKKoJsH7IwLN1hwWcUlnOW2rF541Z+g9qPU4mQNQGg7XXiv1OZHwPFblHoPBcSZtm5W7Rp/wgXKv1BR3Nymm1El8sm4aSE4ztwbeVGNk+OONw5bhCruueqDZM6yBcGGMxKvoGLhgS8+ZZAjLgzXIAcATNIaxSHW0hVphnGW/KcvynHQpG0YKQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkK17Y7IHLYeTYvmr1GvWF9hPVk9yEzpHFYehd6ogbU=;
 b=q3Hmq4d+IByc3Lva6xnLQBGB4nTCQPxvT1PcfbDMjCG9z5Jr61wnW7GyD+EZVDoa7e5B+ra5AUd9YJSBMmxWubNCBcUMtlUsRzqHWC3pOGiPIt9ypE/thTbA0ALg8iiuEvDVhKKUaDlLUrlDoMb3H3GthQY/xU0rJ/pYqvPBadk=
Received: from BN9P222CA0020.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::25)
 by DS7PR12MB8232.namprd12.prod.outlook.com (2603:10b6:8:e3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 21:27:47 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:408:10c:cafe::f0) by BN9P222CA0020.outlook.office365.com
 (2603:10b6:408:10c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Wed,
 17 Dec 2025 21:27:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.0 via Frontend Transport; Wed, 17 Dec 2025 21:27:45 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 17 Dec
 2025 15:27:45 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 17 Dec
 2025 15:27:45 -0600
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 17 Dec 2025 15:27:44 -0600
From: Tanmay Shah <tanmay.shah@amd.com>
To: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH v3 2/2] remoteproc: xlnx: do not kick if mbox queue is full
Date: Wed, 17 Dec 2025 13:27:28 -0800
Message-ID: <20251217212728.1540043-3-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217212728.1540043-1-tanmay.shah@amd.com>
References: <20251217212728.1540043-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: tanmay.shah@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic:
 BN3PEPF0000B06C:EE_|DS7PR12MB8232:EE_|SJ2PR12MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cc31a5b-ce45-49f1-31b4-08de3db31eca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?p0O0tMPC0MP6SLkv7llYEXrDhwvLJ7vPKeQp0XBw5rDFP0Y4E5brW6Bdltzv?=
 =?us-ascii?Q?6ml/37StEKA6eZ0+sokyp1aXjUhiXkkcPZ4AE1zqYvHxR5/2Hibd3pbIgyy6?=
 =?us-ascii?Q?qzruwILukmqSRwgmj05gAX0jyjKXxxsgQbEk8nYqiScd6zXaxkeWAC67+bkR?=
 =?us-ascii?Q?os3B+5uTG1zBdu9y0HjT85Ns+2+a7vfHCoidheWYJnzrWgPF0MFw6SwpAd9p?=
 =?us-ascii?Q?NeT8FByZddbfB6TRQROruEv0wr0BV3WUK7BW1vQQMjBixafBRVwEzubcycrt?=
 =?us-ascii?Q?1Ps7/Z5wu7xnijhJ9E99xCNyY7Y/XW7SiP7gqh/txXatq0Zmok1QB6ozl8Of?=
 =?us-ascii?Q?RCh1YGHEIhwG43K/zWfKUjGre/3sDyfJ6I2b0lq+0okASFi9IROywZouTzIf?=
 =?us-ascii?Q?Vw5aXPuze0U0DR7sbIRHsxqYyqG2njTA6CuHYHkD2yPs15VYu0fJlfGLI1d5?=
 =?us-ascii?Q?uvjGadAdJXFh5kmzi6zGltpQiVoujfbV6sheppQifYEGnmNj2kGOJe/CnPyW?=
 =?us-ascii?Q?v7y+z9Zf3+X/0i+cUFwaPb8W5H8i7Fe+Tp43RhgTLlXcHqWA4egT5M0w7q1z?=
 =?us-ascii?Q?NTxV3syEg7bc3gcQixjeFgi1uw57KsMSj1rTz7t4JCJ5R7iYox77RHrBTwah?=
 =?us-ascii?Q?Ta8zpZtzo5Q9mpu2+k+XsCLH7i8HvqAxASdOr3EXBuNBgOfSkvRtPTul+D5h?=
 =?us-ascii?Q?vU/SqudeU45opSuGHgOV/KQ2l2Rkb8W//ZaMtXJsf7pISRS8Eyx13po9D3N/?=
 =?us-ascii?Q?cRjvVq9I3GmwteCYRwMUBJm9PmXEOmlinyyBf9STieHlXm3l0BM5GFLqO8ZE?=
 =?us-ascii?Q?Hx7eTz3qdYwVK/j5udiMo4pV5QEPtyFZoGN7i8x1+/CQu0YiWXM5lsU+dWMr?=
 =?us-ascii?Q?8775bxg3H/bE9XOlt5z/FJOiyXXatidsN2bfrcR8JKv5dNNj1gwD7gOOIo8x?=
 =?us-ascii?Q?nvBQcsuXf3PM2X2u7gxh41NhChif3tlCfysH2Yv44sxKcoV8QN3w30CIVHJ0?=
 =?us-ascii?Q?qM5RXWj4Mukl2u9+gi8ZSHz17wRe7A2+nkQ22Z9wfoJ4bO6lWMzKogXtdhU0?=
 =?us-ascii?Q?IIFsQdo9GQPsihWhUPbejN0nf+3BvMl2HZgL526iUJR0Vg90F70jB29LXOyJ?=
 =?us-ascii?Q?CLMZYUZcJXuMYxVL2GI/RHH0knMmx0MNPDw4OQEMRpF02S5rWHFv850b11LW?=
 =?us-ascii?Q?zi3m/IoPKKsvpGo4hM3Z5CujsTAy4zeJtvDqLv2YNLddjZAzoETmkdfG7XNi?=
 =?us-ascii?Q?STe4EPvuMieHfTxd9wc+foGks0KSWfOVeBGK5PeoakqFz2fCVZSmfG7YpyoH?=
 =?us-ascii?Q?vg8fk8DcXZ3POogW5oCBjDZWVDIk2J8sopJ5zbRWw8hkv7LUkHfS/wmsOl4w?=
 =?us-ascii?Q?hvHkcnGtN3/5n5hsVY5p6s1NgErSlZ0jvv8UEMU3bHgL2albLOTyfOEdAmuG?=
 =?us-ascii?Q?zJ9jNcnkHvm9+AQ9FK3aeVG6qKUUm4FBa21NLR215D2vvNCK40+arCZRr6tl?=
 =?us-ascii?Q?YfjV/VdhQG3nbttox3v1xnOPWKnypBxfTtlNw8vH5inTSDepzS1tIq/Cgeck?=
 =?us-ascii?Q?DzqGR2ktgqDGd6XEoGk=3D?=
X-Forefront-Antispam-Report:
 CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 21:27:45.7755
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc31a5b-ce45-49f1-31b4-08de3db31eca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
 BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8232
X-OriginatorOrg: amd.com

If MBOX_TX_QUEUE_LEN number of kicks are pending, then no need to keep
doing more kicks because it will fail anyway. Preventing further kicks
is needed because it avoids printing false positive warning messages
from mailbox framework. Functionally nothing changes from RPMsg or
remoteproc point of view.

Also, allocate different mbox client data structure for tx channel, as
it's a requirement from the mailbox framework.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index a7b75235f53e..2db158c189be 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -9,6 +9,7 @@
 #include <linux/firmware/xlnx-zynqmp.h>
 #include <linux/kernel.h>
 #include <linux/mailbox_client.h>
+#include <linux/mailbox_controller.h>
 #include <linux/mailbox/zynqmp-ipi-message.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
@@ -74,7 +75,8 @@ struct zynqmp_sram_bank {
  * @tx_mc_buf: to copy data to mailbox tx channel
  * @r5_core: this mailbox's corresponding r5_core pointer
  * @mbox_work: schedule work after receiving data from mailbox
- * @mbox_cl: mailbox client
+ * @mbox_tx_cl: tx channel mailbox client
+ * @mbox_rx_cl: rx channel mailbox client
  * @tx_chan: mailbox tx channel
  * @rx_chan: mailbox rx channel
  */
@@ -83,7 +85,8 @@ struct mbox_info {
 	unsigned char tx_mc_buf[MBOX_CLIENT_BUF_MAX];
 	struct zynqmp_r5_core *r5_core;
 	struct work_struct mbox_work;
-	struct mbox_client mbox_cl;
+	struct mbox_client mbox_tx_cl;
+	struct mbox_client mbox_rx_cl;
 	struct mbox_chan *tx_chan;
 	struct mbox_chan *rx_chan;
 };
@@ -230,7 +233,7 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
 	struct mbox_info *ipi;
 	size_t len;
 
-	ipi = container_of(cl, struct mbox_info, mbox_cl);
+	ipi = container_of(cl, struct mbox_info, mbox_rx_cl);
 
 	/* copy data from ipi buffer to r5_core */
 	ipi_msg = (struct zynqmp_ipi_message *)msg;
@@ -269,8 +272,8 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
 	if (!ipi)
 		return NULL;
 
-	mbox_cl = &ipi->mbox_cl;
-	mbox_cl->rx_callback = zynqmp_r5_mb_rx_cb;
+	mbox_cl = &ipi->mbox_tx_cl;
+	mbox_cl->rx_callback = NULL;
 	mbox_cl->tx_block = false;
 	mbox_cl->knows_txdone = false;
 	mbox_cl->tx_done = NULL;
@@ -285,6 +288,13 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
 		return NULL;
 	}
 
+	mbox_cl = &ipi->mbox_rx_cl;
+	mbox_cl->rx_callback = zynqmp_r5_mb_rx_cb;
+	mbox_cl->tx_block = false;
+	mbox_cl->knows_txdone = false;
+	mbox_cl->tx_done = NULL;
+	mbox_cl->dev = cdev;
+
 	ipi->rx_chan = mbox_request_channel_byname(mbox_cl, "rx");
 	if (IS_ERR(ipi->rx_chan)) {
 		mbox_free_channel(ipi->tx_chan);
@@ -335,6 +345,10 @@ static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
 	if (!ipi)
 		return;
 
+	/* Do not need new kick as already many kicks are pending. */
+	if (ipi->tx_chan->cl->msg_slot_ro == 0)
+		return;
+
 	mb_msg = (struct zynqmp_ipi_message *)ipi->tx_mc_buf;
 	memcpy(mb_msg->data, &vqid, sizeof(vqid));
 	mb_msg->len = sizeof(vqid);
-- 
2.34.1

