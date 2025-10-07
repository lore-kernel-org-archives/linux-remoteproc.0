Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011058.outbound.protection.outlook.com [52.101.52.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2660C8BEC;
	Tue,  7 Oct 2025 15:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759850348; cv=fail; b=uTAZClV4qmADYZPYClc/85lQY6pR8Ib4vCJJ5LBpKMiHe6TfmMY0IPjQOKZNpeMWM/OeMjUciPIigjm8Ab52Vq2d2vOQARsolZFmM5bmucJBGiNNGFlF+QQmW7jHrQB0MkMu89u9LwDicHwm5SF8Eu1cPO1Oyq5Zuq/7C/dAx+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759850348; c=relaxed/simple;
	bh=bFFjl9hAtmkQn5+3L2FgOQrWVYo4Guj10jx6uAMj3Qg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n2p5HBIMOYmA99+6xp8aHa2tnOSDu0UcLi24ptTBXknt2QT7MuLjLemmOpYGqYslxjwTAtXa/N8LV0DBx22K6I5Dtw58WUEItJiO1C4cZFgMj+LNuXCVu8MfPOSDf83ut9E3L6yehfGWedXWNaV7RwGQCuVXFQ/LA5KuZf+jj1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EJZzlg8a; arc=fail smtp.client-ip=52.101.52.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EJZzlg8a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TH76tcNK4pH5Yx1U2XZ6RPa5sqkJaeJYSeDu4QCR8LG7y9zE2EtMDSCBAivDDqsDDp0nHpJ//PHJE6V4Hug8FRjasNpUxaQa8WkxTyOv5qJrDuqsAIDujf3NieA1nRrw4ONuTw1Wt+N559HXlyUieopbausxyZWy4eyHhvadcADtNApsTXt7VjH+BSzNIV9UwKLhvFyV7guRi/7/OXS746KRPae3JB+C0kJ50B3fyub6O//v7fhrx7I4/uyNxHmHLMpULHUV1P5dhSL4zGDWVYVOoogO8Lpaqm/A9+gUuDAAc3ImQbeJPEgsVTfVu/DRfUCMO+Yl9StpjRUMaEMlnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWV/KRRs4L719LemVNN1eLPmdwlyiDsedJHSf4vyD7Y=;
 b=Qla4J4cOE+ivh6JSv4iGnj3Xrac9kGjSNRnLsnvnEcFLmmDuumX6pslCO5pAEpYPap3HXyRRFXf7b7depNNoHiNGcuSyka8szh/WUAIRuylHV5V1CKz3l8owuNQPcLO6bEpe85lKCFonGubEaJ7ImQTzRxvcBOczoPPK0JgK4IkA2rfJIkjHTgndDdGr8POMDcC4miosBHkFVF2FMwoObe6KRchFQMidV2+1n2CCk12GsoUfWr0XILJlRhMF1grmRvv/rWs18SXE8ka4Ht0Ikp5WOIvgOgsOXSpefLtzlhq6qdBWhNLnrnTpR1sskKjJ2zSZ9fQOyekhCSFmTHmQZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWV/KRRs4L719LemVNN1eLPmdwlyiDsedJHSf4vyD7Y=;
 b=EJZzlg8adjKFKHTc7VR4c0mJEkbOin1kIqqaoVbduXRY9qNiJYOQUgbTSA0l2VdoQIW5ujAMr+agiX4r6AQMWW2BB+HQ+MdaCXKr+W15Hm7Wo1uODonbCn1OgGh4ldVHzwhgdfIVaOWVBJ4hbCIyLAmw29LQJn2JWrsChGQ1h/g=
Received: from BYAPR08CA0015.namprd08.prod.outlook.com (2603:10b6:a03:100::28)
 by DM6PR12MB4300.namprd12.prod.outlook.com (2603:10b6:5:21a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 15:18:59 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:100:cafe::56) by BYAPR08CA0015.outlook.office365.com
 (2603:10b6:a03:100::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9 via Frontend Transport; Tue, 7
 Oct 2025 15:18:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Tue, 7 Oct 2025 15:18:59 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 7 Oct
 2025 08:18:58 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Oct
 2025 10:18:58 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 7 Oct 2025 08:18:57 -0700
From: Tanmay Shah <tanmay.shah@amd.com>
To: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH v2 1/2] mailbox: check mailbox queue is full or not
Date: Tue, 7 Oct 2025 08:18:27 -0700
Message-ID: <20251007151828.1527105-2-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007151828.1527105-1-tanmay.shah@amd.com>
References: <20251007151828.1527105-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|DM6PR12MB4300:EE_
X-MS-Office365-Filtering-Correlation-Id: c64933ab-456d-46a7-a44a-08de05b4d706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EKcIHWOSOTALXQC5GBBpNqoYYeUFtRtFGzpQ8XDuSPKC41I6V+LiYyhLZcZO?=
 =?us-ascii?Q?BpUSJM0n9ERmBG7KWotUKJtJgFZAzz4PoQQTyURF7kqYHBvZK7ueq7xB9+Ex?=
 =?us-ascii?Q?npBWlOAMRAxC6AaoFkUOYAZaiLJEWV+5eYHuWYdYRGZXfL5pE7sJSVR0ftfb?=
 =?us-ascii?Q?nUyjjXV1Xw2ZwKHaLAmkHm6G3c42cWXMo5+UQL83EvX0mdvtFcBWa/FqNQ34?=
 =?us-ascii?Q?FqJMMChJZhUPQVQmMfuOAoeDXYTsoFwSghQ7GTK4OWb6g6O1CjV915Eqi4lJ?=
 =?us-ascii?Q?Rr9IU96chdnOpNYfDf5L7XH+KxcfptFPO375626FLjSo9/xHdXF9tHcCJShr?=
 =?us-ascii?Q?d40HJOtx87dTLHlq+eu/2EchS2+eJxqC2C4DY+z8YaoylcSEhD55p2UIhGw8?=
 =?us-ascii?Q?/0Be9COQ/EhSH6leic6wW09ria/KsJZwj4ZUao1HoKOiXZGzwpXNH1+CvoMg?=
 =?us-ascii?Q?DxONZxXU/pp/KBM4xmXgrFiqcqwhZJq+JZVa0LxqCaBHzUr4tkeGdGfwllH/?=
 =?us-ascii?Q?+Fh3o6fjyBOav3hgpoFqMPV3e7nCWpEiR9FJJQJY1ZWIAhBre2c4bSeF3brE?=
 =?us-ascii?Q?fmvnerReq3mUTeVKRZtsg9M5r3jtXkQRz35Bqjclhn3ou9J+bUxi/y1YehjM?=
 =?us-ascii?Q?xzzLBaOdw26GrszcnPZkNMTGiihFjWEaTzMcrGyh7MA/S2ZgWxxlHaeKU0nG?=
 =?us-ascii?Q?Z6MQnLW5DSA4tTa0E9qU8AaGVpTOfiYyloviceUmDhxq/eyIK1JVJVUCYUKf?=
 =?us-ascii?Q?G9/U8j/gHTyDny4O0Zsw0z12JOgjFL7fXVyWestZ9tb8mgQ9wkbW7esFnhVM?=
 =?us-ascii?Q?7o847+KYF2yMoi8SN7BnTiy/L5l/DznBJxaimY13e6jBEUdRnhdxoawOw4V4?=
 =?us-ascii?Q?Q/C/+TxknPWCMvUvBxIpmsdHsDycwo+b0uGywB+zDOR1X/f8wudw+SE+K8I7?=
 =?us-ascii?Q?E2LMnZ8UKJMFXZCr2+MyZdT7RqonHiTK3f77UfomKVt/QchiWQ0C8S+4u48y?=
 =?us-ascii?Q?uk1SVp0syKLMPLw8GTepxE7RL/QeL0SM4cZjJ8CA2r7JNMXAzidKwJjMderz?=
 =?us-ascii?Q?RdJcMrZ3Cf3UMpEGNBR9/chFqPKqjLuzMfm28D5YhsVHWrdH4ycU0XHxMR5m?=
 =?us-ascii?Q?nHC7FRINQNpqPIFFEvB9GhmUzvDyyW9RYP2ov22q/HkyQ46p8lfKq2RCyKCp?=
 =?us-ascii?Q?8l4i/kIaEdNf2l88zj2NoJ8m7m2Z2lvs9ozYKUr3Bf1GNvm8wi8uv03gPex4?=
 =?us-ascii?Q?eFDsAB2Rr/HH4HagGg5C23lHqxB3YRvKSEhO0EvIncYdz4Y+o4kwB8Q0VaHv?=
 =?us-ascii?Q?5tcPK7AR8PdfrZ+X+0F9YUCQMnFRgB0oM+uJG2VsJ2GN6RfGxLTV6psxvwNW?=
 =?us-ascii?Q?S4D10EHvL91YwmK+Rp3pq27Dnx+a2aOHyNYtrWoGIbtFLImc/oZC2zk4SWnq?=
 =?us-ascii?Q?NvODy4UftHrvPIWawuDARbM69tuzEmFemoCIdu/M0vAVXTd/EMzatAJOm2vI?=
 =?us-ascii?Q?ugUJT4/kihKT6SX1GVR8BXu9PWwOjVyyLNZJeE6FCbnKvhHGCV+DuY7jiLtH?=
 =?us-ascii?Q?sJMaecXxfoHlQDunp8Q=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 15:18:59.1632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c64933ab-456d-46a7-a44a-08de05b4d706
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4300

Sometimes clients need to know if mailbox queue is full or not before
posting new message via mailbox. If mailbox queue is full clients can
choose not to post new message. This doesn't mean current queue length
should be increased, but clients may want to wait till previous Tx is
done. Introduce variable per channel to track available msg slots.
Clients can check this variable and decide not to send new message if
it is 0. This  can help avoid false positive warning from mailbox
framework "Try increasing MBOX_TX_QUEUE_LEN".

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

v2:
  - Separate patch for remoteproc subsystem.
  - Change design and introduce msg_slot_ro field for each channel
    instead of API. Clients can use this variable directly.
  - Remove mbox_queue_full API

 drivers/mailbox/mailbox.c          | 3 +++
 include/linux/mailbox_controller.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 5cd8ae222073..c2e187aa5d22 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -35,6 +35,7 @@ static int add_to_rbuf(struct mbox_chan *chan, void *mssg)
 	idx = chan->msg_free;
 	chan->msg_data[idx] = mssg;
 	chan->msg_count++;
+	chan->msg_slot_ro = (MBOX_TX_QUEUE_LEN - chan->msg_count);
 
 	if (idx == MBOX_TX_QUEUE_LEN - 1)
 		chan->msg_free = 0;
@@ -70,6 +71,7 @@ static void msg_submit(struct mbox_chan *chan)
 		if (!err) {
 			chan->active_req = data;
 			chan->msg_count--;
+			chan->msg_slot_ro = (MBOX_TX_QUEUE_LEN - chan->msg_count);
 		}
 	}
 
@@ -318,6 +320,7 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 	scoped_guard(spinlock_irqsave, &chan->lock) {
 		chan->msg_free = 0;
 		chan->msg_count = 0;
+		chan->msg_slot_ro = MBOX_TX_QUEUE_LEN;
 		chan->active_req = NULL;
 		chan->cl = cl;
 		init_completion(&chan->tx_complete);
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index ad01c4082358..514f10fbcd42 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -112,6 +112,7 @@ struct mbox_controller {
  * @msg_count:		No. of mssg currently queued
  * @msg_free:		Index of next available mssg slot
  * @msg_data:		Hook for data packet
+ * @msg_slot_ro:	remaining message slots in the queue.
  * @lock:		Serialise access to the channel
  * @con_priv:		Hook for controller driver to attach private data
  */
@@ -123,6 +124,7 @@ struct mbox_chan {
 	void *active_req;
 	unsigned msg_count, msg_free;
 	void *msg_data[MBOX_TX_QUEUE_LEN];
+	unsigned int msg_slot_ro;
 	spinlock_t lock; /* Serialise access to the channel */
 	void *con_priv;
 };
-- 
2.34.1

