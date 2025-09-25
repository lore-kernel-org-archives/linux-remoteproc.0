Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010060.outbound.protection.outlook.com [52.101.61.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5311D2F2601;
	Thu, 25 Sep 2025 18:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758826287; cv=fail; b=pRLVb22WFUeqpDiNkPOO3N8zeyGXe77NAIJlHrCb/52Xo1MTmOQI2kJThe2J3D3EVQBcVH1FDdZmmruzklW7dFAETTdpPxqFoRgrs64sLgxpmj6yxXkN+zsyjzsWErctuYz90xmidErW5csCyY2t7yqjXV8SEGQrAhpoc9IglxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758826287; c=relaxed/simple;
	bh=kzNG6VJt5arn1jIQ3E8u+iaEEFEzqFCKl5kXsMsSWz8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mRDr/B4v3WLG/rkIKd7XDTR0e/r1XvVP33YyiY6HSVMOGPwwZ6xTXx6YOgHI+Q4ccFt+v6SIOh67yzYGRXcBnlnEsBQ+hUwtXBEzUcWAnFO7Kis67i7nFhQFV3G+XG8GIrCyf8dr2XSwFYNCXHHl73JyaxwhTuMuyyA1ct3rdrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GGuq2NkN; arc=fail smtp.client-ip=52.101.61.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GGuq2NkN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2b7EQ4IeEoPWvIgz4+tJZjczEofLD5C5W5SK96LABFW7RAzyf15NKc5iU52eYxINJiTPusZmecV6opquQL75B0568m6QwjtnWIfRe+2F6VJVnvucJ2vtHCYILNBGQsDsvARXbTA76KdXKTAf8UYKgbJhkkwTcSvgrMyIgBN00AztQ4KoMMZgeovUlfKzBUFzELsPCXjGXcmdLrNJ84gdOwKfgsK/cSYX9cWi76+lFid3jX2seJB1B+FErVi7In2Qy1uCqGlBCqldBaIOcEbO6us/v1b7Zk3nfGFle/hY8aTWlisEZyvKRgnkac/QVxIpk1OyCu0IDwEPpdL+lq2Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0L074OFUENNVrp5nE3+MG5ndfmvT7gttmSZT47I6Fk=;
 b=pvWuAYJjUs5iWlXwdHIKJGL0KHvrZVKUMQiPtRB7OLC0JTwoJwBUaOebY//rukVwbwdsXTDV12iTUwzP8im5nJ5L8DVyUY6t75KPFmew/90aQe9RJ38lsvco6Ws+H8BhN8LTuy1Hy4hmkaa1+RIBSnFZwS9/OzMnJDlfFlvjQtHi0qEglZMauf7nhx868TebbY9OhbQY1cYR7O5/UKQ4a0Ty5mAOBaXCPygGx0OGPAh1ZdmzCObeuw9aN7IEx7ka8B78bCEBifdoMLj4TbS7q2UkSnEp4p/eDCDq7RHVJqIs7vtbEK404vyw66dCd2JRsrKm4Rpc0rTtL7RMSCM/MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0L074OFUENNVrp5nE3+MG5ndfmvT7gttmSZT47I6Fk=;
 b=GGuq2NkN8yW8r6rUqyeZJrmeo5ZQonRiLceqeX8fmNN7GU4V/LcJ7WFE92NiGSviip6FbBHT5QvDr50g6/MCOxe2nvlPgZYPmh6mPmAm7UkUny4+LhT+6y9ntIViht6u0KOjA81d49HvUjbfGkdOHIHHmkZF+sQVKXTN2HmUYjs=
Received: from SJ0PR03CA0126.namprd03.prod.outlook.com (2603:10b6:a03:33c::11)
 by MW3PR12MB4458.namprd12.prod.outlook.com (2603:10b6:303:5d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Thu, 25 Sep
 2025 18:51:22 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:a03:33c:cafe::ac) by SJ0PR03CA0126.outlook.office365.com
 (2603:10b6:a03:33c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.10 via Frontend Transport; Thu,
 25 Sep 2025 18:51:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Thu, 25 Sep 2025 18:51:21 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 25 Sep
 2025 11:51:18 -0700
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 25 Sep 2025 11:51:18 -0700
From: Tanmay Shah <tanmay.shah@amd.com>
To: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH] mailbox: check mailbox queue is full or not
Date: Thu, 25 Sep 2025 11:50:44 -0700
Message-ID: <20250925185043.3013388-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|MW3PR12MB4458:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eaaad04-c824-49ec-52bf-08ddfc648546
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fn3kYqxGp6bPqYqQRCVNwz/s7FnnKVnjH920znjDyHtxkLECB45XmJyCVSdo?=
 =?us-ascii?Q?3AB1pkOf3W82sSTAEjFe63dGdjRvJY1VM9D6cb+iOyhgEf3UsLms4nZTZKbl?=
 =?us-ascii?Q?kh8ND4xARF64bGqW6OLNzTMMYIteGsQ4/ie+R9Ay5i6T+frO/xtp3Qfx6/TA?=
 =?us-ascii?Q?afx3cuG69xi/c2NMRLp8VKV3fYSbkCkHlYkhiY8QJXsCOHCbg8o1URkF8QeG?=
 =?us-ascii?Q?qVsdsim8E2cDvIxEiOg4df4RDh2EnnwafDghag7VojjkezctnMOuuiLhexIK?=
 =?us-ascii?Q?X+wrWg6IzyQ/lJTu71UUliFFzMeQOx+9uZprh1hz5+OhKedmntXeGjPqn36r?=
 =?us-ascii?Q?33HHuIrN8g9LUMZgD0OqAwZmmfvm8bSUOxYn81TGhT49ix9Lyxdyx8zKsYrL?=
 =?us-ascii?Q?ktR5fzW4+ZHgR31I/k6QGJH/jukjxKhOw/yC1F6YRVFILyfoZe85KeH6HM8C?=
 =?us-ascii?Q?0e5gPPfLG8maZT+QRMH1CGFtiiIqTIDW+OcfyTfPGnptz2KPt7rakSW5NdL5?=
 =?us-ascii?Q?2LtvVCTWWg3hYtasWE8/Vkr41IiB2KZGIbLWhbcWRT5pN/KsiqQQEH6MGgUR?=
 =?us-ascii?Q?j4Ers40+GnC/vHt97GgFgWcRboDdgcwaZD/o0hqJvLSMlRxl75FWywfcP0lX?=
 =?us-ascii?Q?L90yeUU1eZO8WKHIL40F1n3t35j3LnxeXhDUpfJZxS+Iep6uEpbQOD8RLuhU?=
 =?us-ascii?Q?dm92i56PWm+SwAmLS6DqL+bS9IfrdXi+cpMwA4I89So/90/d0wVECcb67L53?=
 =?us-ascii?Q?+x3sOPujmTRscI8SfBPt94hq7TDORaWlHRIUzBTrz5xqwInN+fIzGVEXULK3?=
 =?us-ascii?Q?pDr4mGQJFYA0m+25lR3tPG31XJDIPw7Azo2uXULGynfPi3vJf0RyciJ6CXSP?=
 =?us-ascii?Q?IYvLGWWaUW8VVvGKqsFgQTVGX9tjsG5jGodTTQOsU6DGJsICzu7AfqQfv3rF?=
 =?us-ascii?Q?KwUtX4f803xnGVdmIknra6jz0I8B2qtpzKXBMGIXmR8nygDChnxiOj/QLPFD?=
 =?us-ascii?Q?1ZlG3nx8W0vvWkfMr8HnTPbjG21+FobVM3mxXEU+lyAmOZhGExOansqcH8iN?=
 =?us-ascii?Q?P8uBq1Xr6WwOhEG6RBlxBhdTcn6cCVxB0cOHH7Ex3V5WTCppNMbM3R+EST+t?=
 =?us-ascii?Q?X6tjdUrqOjsd3PbF1iLj7Vbg0DTUU5vpuJYEQDfEl5/VLv72fTI1JkoA1YtP?=
 =?us-ascii?Q?3PB5pDKE6zFnjruPuYVddpwdpu0NFleba8MjAFVaYGT816Nv9tGzwqhLSGr3?=
 =?us-ascii?Q?5RxpzoOT6JJBu2Cgnv3s3QHE+Q39A1/QXjlcQbnObKl8Z4dPll/C/AmRWnl6?=
 =?us-ascii?Q?acCzT6UJlXVhdLhhS1NVXM+NdSfvqP9ryeypYSdhJGutG5nMVdvbJX1SUqkq?=
 =?us-ascii?Q?QtAzb3x+E4qBUilrS5FAT5Tig63ss2FOW5FivNWr3wzpJR4pdwLmCFNL8VKJ?=
 =?us-ascii?Q?CHU4u5YZ5/XPDMpb2x3VC8cqnAXUMXisAgP+IpRY+7F6ELMgbjABcXKdCJgB?=
 =?us-ascii?Q?cYZMrtS7QavQ0FMY377MKALQhJMFU7to704C?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 18:51:21.8039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eaaad04-c824-49ec-52bf-08ddfc648546
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4458

Sometimes clients need to know if mailbox queue is full or not before
posting new message via mailbox. If mailbox queue is full clients can
choose not to post new message. This doesn't mean current queue length
should be increased, but clients may want to wait till previous Tx is
done. This API can help avoid false positive warning from mailbox
framework "Try increasing MBOX_TX_QUEUE_LEN".

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/mailbox/mailbox.c               | 24 ++++++++++++++++++++++++
 drivers/remoteproc/xlnx_r5_remoteproc.c |  4 ++++
 include/linux/mailbox_client.h          |  1 +
 3 files changed, 29 insertions(+)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 5cd8ae222073..7afdb2c9006d 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -217,6 +217,30 @@ bool mbox_client_peek_data(struct mbox_chan *chan)
 }
 EXPORT_SYMBOL_GPL(mbox_client_peek_data);
 
+/**
+ * mbox_queue_full - check if mailbox queue is full or not
+ * @chan: Mailbox channel assigned to this client.
+ *
+ * Clients can choose not to send new msg if mbox queue is full.
+ *
+ * Return: true if queue is full else false. < 0 for error
+ */
+int mbox_queue_full(struct mbox_chan *chan)
+{
+	unsigned long flags;
+	int res;
+
+	if (!chan)
+		return -EINVAL;
+
+	spin_lock_irqsave(&chan->lock, flags);
+	res = (chan->msg_count == (MBOX_TX_QUEUE_LEN - 1));
+	spin_unlock_irqrestore(&chan->lock, flags);
+
+	return res;
+}
+EXPORT_SYMBOL_GPL(mbox_queue_full);
+
 /**
  * mbox_send_message -	For client to submit a message to be
  *				sent to the remote.
diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 0b7b173d0d26..b3262de8a3ac 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -335,6 +335,10 @@ static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
 	if (!ipi)
 		return;
 
+	/* Do not need new kick as already many kick interrupts are pending. */
+	if (mbox_queue_full(ipi->tx_chan) == true)
+		return;
+
 	mb_msg = (struct zynqmp_ipi_message *)ipi->tx_mc_buf;
 	memcpy(mb_msg->data, &vqid, sizeof(vqid));
 	mb_msg->len = sizeof(vqid);
diff --git a/include/linux/mailbox_client.h b/include/linux/mailbox_client.h
index c6eea9afb943..4a19800af96f 100644
--- a/include/linux/mailbox_client.h
+++ b/include/linux/mailbox_client.h
@@ -46,5 +46,6 @@ int mbox_flush(struct mbox_chan *chan, unsigned long timeout);
 void mbox_client_txdone(struct mbox_chan *chan, int r); /* atomic */
 bool mbox_client_peek_data(struct mbox_chan *chan); /* atomic */
 void mbox_free_channel(struct mbox_chan *chan); /* may sleep */
+int mbox_queue_full(struct mbox_chan *chan);
 
 #endif /* __MAILBOX_CLIENT_H */

base-commit: 56d030ea3330ab737fe6c05f89d52f56208b07ac
-- 
2.34.1

