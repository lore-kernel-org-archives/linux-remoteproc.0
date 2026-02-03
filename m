Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013010.outbound.protection.outlook.com [40.93.201.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC3436B044;
	Tue,  3 Feb 2026 22:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770159557; cv=fail; b=Zu4MSioUoo9ReMuqkvtIq5eiGTKt0LO3/lW8xXEBUMUsKQ/XrTLzs6QbbyDJyN9w7OSHJ4wJYWMROIww3SbV/87wKHkhgWf2QjYgs41SCmOaLSo7EDAjgKwnwhkvwhHlJB9lGecx7zHr958ySPnO21xm8gVSywz+EcJHfKLKndc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770159557; c=relaxed/simple;
	bh=cCC2x3aFm6Qsg6lKxC34fNDCWY7IaC6OZlbe1tk0QQo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZcjBneU/fWIr1zsA7g4idzaMvVIvGpOTn5Bbz2i+EcGHJacLrL4sXLDThrRNvyIxxmeRfWJ5eo2ADyylKH8mfievI2BN6s1JT+gOma8rW1XlWKUA5ZZfJBwRY1IGl6exPlS6QVe+QzRnevjN+LUOHNKPG3b4pdx98Wm+qPYARL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=e0CN4et4; arc=fail smtp.client-ip=40.93.201.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="e0CN4et4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EwQJQ9b7ylYRPQV7un6RahIeJiWTZd3uTppfZxqRmRup0DhRMv1zrKxneTcutQ4F5qbpqo9gtFlnIZKvbnv8lvxepALi6DuMdIJI4E7gm1cnCwBwnuJy1L5BYXod6KSM622AKlgQyJ5IgmDCeA8w234b4/xQC5rDFMAAHkN7eDDJLzjm2DhhfNr60XCJciMhwRoP3YpJDPRAqNTLXZdD0qpLc5UWq18zRZcLABt29X7G0wA5NOan/TLT++csz7tM8oos9lvxg+OZv9Qt1jexYfNTOXnw/2e1iBgq02jtZ7RJ40yy8LdqhLuD6LAX2nyV3LPmxZqUyLcmTJjaYEYoUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmdVA78i2M5KDImjCXyYFX8pSjnWphQXroxASALXjtk=;
 b=Mx4wIOfyuANkEftBljOqUr21aViKaVDIaM4HB+tcYRIe2Z1AurL1dBKpTZMxn/8kpmhpbEkYdMKJeqSPVGtMw2lecK7iBgdoGzVH/hHXDD1Nma7xuul6ry0FKMPGvvga/fgWa1/BY432v7CDuIjlecaei1slyX4VlBqVyu+IJGITgNTO5E61KUM6uTOk7c2ieFovn9Ayy+ts0SuqEouskFrpHTMcoghfm9fhZOKiF+4k5ZXCA4qDW3EFvdlVc+D0YR5wiGEBikJi6Ra+TFeijnc/c/P9WX9oJomgLMyGcFlAzd85Ll+laORW3WG+8UvrQV+Z8sGXk+HVV976jGkhuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmdVA78i2M5KDImjCXyYFX8pSjnWphQXroxASALXjtk=;
 b=e0CN4et4PwMSE1vFYb+aeJUvHcQqjj0rwbAyTSmLV2sWQ21Ru2pgQpSAb3bpftvpHBYKwugjfXwHjIgvbSiV/DNir5z8GXpWq+kb93LvIu5rD83zPozq7Ylc3K4hUjHuoxE01dq6hpvSHeoJildG6l19dWMeYBI07X2f8ZxaCWA=
Received: from MN2PR15CA0042.namprd15.prod.outlook.com (2603:10b6:208:237::11)
 by SJ1PR12MB6361.namprd12.prod.outlook.com (2603:10b6:a03:455::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 22:59:10 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:237:cafe::fc) by MN2PR15CA0042.outlook.office365.com
 (2603:10b6:208:237::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 22:59:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 22:59:09 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Feb
 2026 16:59:05 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Feb
 2026 14:59:05 -0800
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 3 Feb 2026 14:59:05 -0800
From: Tanmay Shah <tanmay.shah@amd.com>
To: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH v4 2/3] remoteproc: xlnx: assign mbox client per mbox channel
Date: Tue, 3 Feb 2026 14:58:21 -0800
Message-ID: <20260203225821.3293475-3-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260203225821.3293475-1-tanmay.shah@amd.com>
References: <20260203225821.3293475-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|SJ1PR12MB6361:EE_
X-MS-Office365-Filtering-Correlation-Id: d186f985-7f50-4aea-692f-08de6377d6e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FZouz3AhDkCdjE9fmcDSK2EVCfdy/mRpMa1A9GA6ASN/KxHi9A6z45V54gUu?=
 =?us-ascii?Q?iDrOlrAA0EXuGyKcy0In5Q69d5rc/+G0/H32OeAfbXLVmaRsTsstD7n5Wf46?=
 =?us-ascii?Q?wCk7kDuukpnCDAx+rmcLf0dgQNp9nOy4zN9L3LrNaMz16f6YinbDy3y2kuj7?=
 =?us-ascii?Q?SNUVCiS4ZFU6RIUYbsQ10Epiv7Vs4hZMJgaJmpfNHt55CRSEekTVJI4BITz0?=
 =?us-ascii?Q?PDm+6ea4N+2nqnkEyDTRRR8L7BQTyKqYTvdPNtpD9hPyJdSDOvK5gBaf+0sJ?=
 =?us-ascii?Q?ouUneCy2qMhl3U02xIGh1bSX9TXIB9ahbu2i8cRe1gQCPgOjZ/WXSQ1cVCvU?=
 =?us-ascii?Q?70G3e2C/XXoQZIKpsSbdzVcmJLI1q66MnHCYpjrrpwvJsL8f0b70vkHIrOPU?=
 =?us-ascii?Q?arlmGy7ZSQzhuAiG+5F7UJjDM8LxpD7LGrTwXPN5ImVVZoTlfw5lIb7EBW0M?=
 =?us-ascii?Q?xgVhOM88yJBXJc4NoWrTwgji5y+w2epmbGXMSoSvGT1bbl/RAvCrqpPvoXsr?=
 =?us-ascii?Q?OUwiZDZlqbuDl522+aDBY+YSoFIQ5+jRW3xbW3mDK34DjJObVM/N7lG/WzI7?=
 =?us-ascii?Q?J91I482D3Pr8nK6t9E5Vl8SLVjv5iBdFqELC0j/zBhJ32Vb9CgBiq767Ep7Q?=
 =?us-ascii?Q?i0QJxzmedCqNtMUQ+naaytTCV4BLUW3Cm0tS5U5Oi3UFzUWi92FNI0CSUJ/W?=
 =?us-ascii?Q?Ln4lQAnSsO8QWLKfuskR3/0SUGa24yfYem3znCpqB/YT0ugK7MkRCK82D5zk?=
 =?us-ascii?Q?CtTHAnSczyRbd018+G9olQj1kz3exG8egzEgrNO8AVshp3nQpLikDKgPAbRe?=
 =?us-ascii?Q?9HEP1jd3URnTIESHMQXWAhBdFjPptZfthJyr2a5i7WgsDQ8ooxZIav9bYs3o?=
 =?us-ascii?Q?DtfoMFLG1ckS0DOc1eErzPV5mtZvmSkPDbkRXuF1ESN5n6c2WkVnAOgSgSj6?=
 =?us-ascii?Q?d1Xx/cnU9WY4SIWBWqPhc76trmfTHgQpG1X4pLLVYawpVYgSWFj2qmrQetrC?=
 =?us-ascii?Q?xDknkvGramwl5dYu6/Hwb2Jhf8CEQ7bcIuT0FgyA/AbxnM3751yMMtPJXKu6?=
 =?us-ascii?Q?O1OcGFQt4+nMNbZAOB2XA5HNBwUha8jVU7vmzPOQW2QJzTxh+aP0aq5S3ZS8?=
 =?us-ascii?Q?nleJ6wPRWyVIlMzsXocN/aLEgBAAKVbuFg22dzO7xZp7MW/Esjak36EQGKew?=
 =?us-ascii?Q?KexSu277V/f2O8P5cXLE1AIJ++PScvSW99R70LlRtqc1KBXyh5GMRCj0zdsg?=
 =?us-ascii?Q?wbkWep1fR0nwuR1XvFGZRjPzrIHw847Jr5wkZetY7cyP9YIJYmCsVf2wCLDG?=
 =?us-ascii?Q?qIZ5rzjCAQ5GEL2ZGewlmTP/jw6Rf6fhP3pFgPPbV3P/wQ043fnYslBoHI/u?=
 =?us-ascii?Q?aZ2XVRdIC7IfjRErZkAEKQRYinV7Bs0ucDa23vaqWiIX/2NsJN6jMYb79VnH?=
 =?us-ascii?Q?lHdbrdXi8WFFkArm/CESICEXyTz16co9XpZ8L7Pv+BilGS54yxx0pFxzkaUe?=
 =?us-ascii?Q?1Zpzfx5RL81+19dRhYYgR7J+8WuK9KF1YWu+UWgCr6ii/WU3xUvlmMul3A4Y?=
 =?us-ascii?Q?XJjkMQNwa1unpb8LJroKGwSfvZrndXkbtgDszuC0etTcxW7q8jz5LARW2cin?=
 =?us-ascii?Q?C//vpnqeyTF7kPEGQ21O/aOKG3Re16PvqlxWXE/bvo/cx+avl8eyj+U3JosE?=
 =?us-ascii?Q?eZkX5A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rTiFMOKIhxMWbuNNUETRbMFT5xYGyjj/3oyHYXmmw2LLgMo4LCdJKx+jinnP5IJowfHoYles+yK4RqMKRpr25N78E6nt0EMBIzuQw6w75lelhlkHeQ7hpw3zGI/qgoOXPwLzrJ+vKXUFOlWkm92zO48O+59yJ0p8MyDOs7ppnnbxdnPQvFAPTw4aFFQbVBs4Vt/HC5B8MdDU2ARedJ4t1FVvhUNoKSH9nr9pPBK5fQT8+myS3eUkvsQTYpHxCfXtj+cE32op+90rnqY2m0I9I1LRD0Y09wki0AhOc9ChIAxJUBE57vpw0ItV3pTpehQoswSCCSpFfTqbb7uMPXfaokLIbH0FnqfpYkfo+TJRbEynnVqdtxy+Wtgrxm1O8WzOFpKnP1jyefujUMtChDwjfH8agtnGaDuBxXt5kODaO7ad9P76jfR77Qq7rQXg0DfQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 22:59:09.0527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d186f985-7f50-4aea-692f-08de6377d6e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6361

Sharing mbox client data structure between "tx" and "rx" channels
can lead to data corruption. Instead each channel should have its own
mbox client data structure.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

changes in v4:
  - separate remoteproc driver patch in to two patches

 drivers/remoteproc/xlnx_r5_remoteproc.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index bd619a6c42aa..109831c5815c 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -74,7 +74,8 @@ struct zynqmp_sram_bank {
  * @tx_mc_buf: to copy data to mailbox tx channel
  * @r5_core: this mailbox's corresponding r5_core pointer
  * @mbox_work: schedule work after receiving data from mailbox
- * @mbox_cl: mailbox client
+ * @mbox_tx_cl: tx channel mailbox client
+ * @mbox_rx_cl: rx channel mailbox client
  * @tx_chan: mailbox tx channel
  * @rx_chan: mailbox rx channel
  */
@@ -83,7 +84,8 @@ struct mbox_info {
 	unsigned char tx_mc_buf[MBOX_CLIENT_BUF_MAX];
 	struct zynqmp_r5_core *r5_core;
 	struct work_struct mbox_work;
-	struct mbox_client mbox_cl;
+	struct mbox_client mbox_tx_cl;
+	struct mbox_client mbox_rx_cl;
 	struct mbox_chan *tx_chan;
 	struct mbox_chan *rx_chan;
 };
@@ -230,7 +232,7 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
 	struct mbox_info *ipi;
 	size_t len;
 
-	ipi = container_of(cl, struct mbox_info, mbox_cl);
+	ipi = container_of(cl, struct mbox_info, mbox_rx_cl);
 
 	/* copy data from ipi buffer to r5_core */
 	ipi_msg = (struct zynqmp_ipi_message *)msg;
@@ -269,8 +271,8 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
 	if (!ipi)
 		return NULL;
 
-	mbox_cl = &ipi->mbox_cl;
-	mbox_cl->rx_callback = zynqmp_r5_mb_rx_cb;
+	mbox_cl = &ipi->mbox_tx_cl;
+	mbox_cl->rx_callback = NULL;
 	mbox_cl->tx_block = false;
 	mbox_cl->knows_txdone = false;
 	mbox_cl->tx_done = NULL;
@@ -285,6 +287,13 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
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
-- 
2.34.1

