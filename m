Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012005.outbound.protection.outlook.com [52.101.43.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5494719E7F7;
	Tue,  7 Oct 2025 15:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759850348; cv=fail; b=Vv7N8io3zaO7N13oI8jdYcYiGLZrmOMT7GgRzC17ID/6jDN0Gef7pQbv4lcuW247mp+v3NobrMN6Py02R1eIO7ZeG5nR6TpT9eKzw3cWizMUbaFj7UplRnMdbFbHzHOQ/MrtDs3tw5nmMJ+VFV140gC0m/e8OsZXkjfT5JBeU3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759850348; c=relaxed/simple;
	bh=uUQTyBQzILmkOkgjKovtgd2rQwhfRHvUF0EFhiup61g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t28Mx+TS4qkc3PLsz9Q+WzaVLe+GH4/9OFpMSEdE6iQH4gvdDIYk/P4oLg5RCQZDcGst/GHOUPYPO+k2MfaVOzwgwxfPQEsIt6XE1fYWQrDLLDx2uqPyrnogPpTQO6wXtGzC/keBMDG6Qhf3NOei/5XNeTe23RKVC1VkQs8lKpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JKDAkA4Z; arc=fail smtp.client-ip=52.101.43.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JKDAkA4Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FD2C2IboyoT4LDIe1yl/OuDdgsfPZVea1Bf3DyWrcNj49zwZtyVIT4JVtq+ImxuMOz9slbIhM/2ZZfqJqki32iAuyo3Jp6bu3Job62Nc8jCHxfpOFQnTXMAwsv8mNp2Eo1pJbtniSNgUGRdUxPP2jMP+ApxIqVgTMyzKxP2NVPTfVEYdXMxlRkyB/OSNlREDSyI/Ps8JdNGRpbFSb/dTucabwXm7+MBNnKck7yg1auDDG6T09LPWb3JsntkHRgqHwA/P2ANGTFwtaVPZjPiZI0B0Qn+G+PRVKMaClR/1cejmR8xfhLgHri/D6vzyRDfIIEde+KsXkQzDmoakXLyO4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFgMVQ5M0wvpIgP3YpGNi/7cjAbXkaEkdwpLMWIow20=;
 b=vHwWu66gkdGTgnL9cAwxU5I36L97jrp+wAtnb/IDJGp0v3FI5qLa3PjsK6+8FDV4NNyYuHw8s/8LrYMWp7IAMPpjepSVtk8JDIXVaM9m6v8YASP+WMJqBcppG2CZn8sVG0HBmnjDBXF+Zu/scfeIIdYXYPovlVInevwDcYl8Fh1IA0brxLxZ+wyogWKU5qAZrmUK0RyqGz7faA7h9u/arXw6is5pLk41fTMpR3rC9WxIvVfpyqM2L6N+WxkB69wWubFMAwqzDHQK65i4k5wyVW96NVKNeow/d5e8ZOl/uch6MVCV0u7jo2UQ9j1Jtu8T/J/VqdS831p7/Tm00Ej7jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFgMVQ5M0wvpIgP3YpGNi/7cjAbXkaEkdwpLMWIow20=;
 b=JKDAkA4ZJ032xsMbcdPjrdr0INPv7jXZ/1uybDFM0c4aiPI59Mo6xRIXvB4U69MrkqjFk+vNa/mCSjVqVoyGoVjadhydC2JMCgZnFCJFk4Gece/1S3RENLN3W9CvSi+TvIqTayRLrAYB8wPr0Ukez2myYFq2Q03AxZ/W19k2knY=
Received: from CH2PR20CA0027.namprd20.prod.outlook.com (2603:10b6:610:58::37)
 by DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 15:18:58 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:58:cafe::32) by CH2PR20CA0027.outlook.office365.com
 (2603:10b6:610:58::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Tue,
 7 Oct 2025 15:18:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Tue, 7 Oct 2025 15:18:58 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 7 Oct
 2025 08:18:57 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 7 Oct
 2025 08:18:57 -0700
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 7 Oct 2025 08:18:57 -0700
From: Tanmay Shah <tanmay.shah@amd.com>
To: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH v2 0/2] mailbox queue length check 
Date: Tue, 7 Oct 2025 08:18:26 -0700
Message-ID: <20251007151828.1527105-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|DS0PR12MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: 26a2ee56-fc22-4e58-03f2-08de05b4d696
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+Xo3l466a2H6epp73QHI8N3zzrskB2S86PJGqshyMdl/Q/aue2lB8N6+i7DT?=
 =?us-ascii?Q?jgSnU7oo3ke4OEHX1IYFM06nDAX/3odikvI/kleAKR9I36b0HJ5bGPSah2EU?=
 =?us-ascii?Q?sRmx83Lkk29wWTg/GJhXDo3lb7f7Fl7wOzxBlaKr3uivW7yofNwuyb9Uh9si?=
 =?us-ascii?Q?gzeqmhG90gWHu9+a4z6Xl6UaG3HILelN6eIg69+TzO42BX7COL8yGvvaRdxO?=
 =?us-ascii?Q?1aNno1sIQthi7zgQD9eIn18JmguP6VZdXhKoIZ4/+fzf9CBQ7nAQUvksJKdR?=
 =?us-ascii?Q?mBrTpRKe1AyII7tKhWpcogaSwBXZsBgYA3O2D8B8VV/C4Qr6gq7wABfdxIBg?=
 =?us-ascii?Q?1HEOiJvy7HG5GNBMh+sBELx4gA1DQLWV7YKKaNmHCGOuFU4vadHrWLB5JF7i?=
 =?us-ascii?Q?FUu4QSWkNCZP4JTb4jpyhfCmopyWzEHuqRnMDVF9m8y871Z7bLY6T0Q47VzD?=
 =?us-ascii?Q?kan60Lz++3e1xYiWHdA4GS8lv0sitX7yq3oYKWOTJMa+B06yE+2hM9cri7Xl?=
 =?us-ascii?Q?GWbL6xsaGtbkZlB6LfdRbybgC73nNtRYpLLv43Kam2UFRTXqP7+kUvc8pb67?=
 =?us-ascii?Q?y37RfYFUkiDvvA3R4WF/RQZh+IiX4f0KQ1BpBJRh92HHD/OBwKFJBYuQAe/3?=
 =?us-ascii?Q?u4hlIVkvhwYpM6O7vdv47czZKUy14Oz/ReUJomx4t0YiYKZkGaqlZq3MzLnN?=
 =?us-ascii?Q?MXT4LTBq38d/havxO+xJj0QA4bXFuxJo0NqAmsRR56XoG7S8Z5HovhEi24vw?=
 =?us-ascii?Q?K8iZBCayGKZPnBnO5YiObgzvqvdMCg9g9S7/iWuIlUHGF00odSNe35WD1Xp9?=
 =?us-ascii?Q?krRtVDb1JIqAsXjc6JOsD0w+dRakMHBT8Au/2GcU/CNm6wFb675Dbq2JkWAe?=
 =?us-ascii?Q?+jnD2FXczgEBeIxerzqnccba+LMZOqaCcMy9rSkWU7GmBJSDLcuvJcEN+zVP?=
 =?us-ascii?Q?+jdDvASQiEaeQ7IOeAb6Z/omh5HloFpY7PVLqIyN+P++oY0vQzMBdt6T5FKv?=
 =?us-ascii?Q?boSUwWyZ/Ts2c51eyn43kglcQ9PBEDY8icunhk807BKOid+5FOI40G8O6lrX?=
 =?us-ascii?Q?dxfbD1UIqcd1fa6IBc9K1ASnB/IPnwyuyb6czWMf7rPiWrLOqK/5HzLqEO6I?=
 =?us-ascii?Q?2KIdsQqtUJza1QFgFfVnytbFdhU1+61UMJMwVNEN35hk4fsskwgYvr2+I9zb?=
 =?us-ascii?Q?lKnMA4meU0hzB+uT7hlASaf7c3oTP3ycTm5PHeiMBDO1OoC/l+smZIzDqH2Q?=
 =?us-ascii?Q?I+kU6jPc2FjIFd5kWeyMf2GIgRYc8WFWTXGidO6r1+tAEw3hnGHiYsNs1FTO?=
 =?us-ascii?Q?hHrFgIxF71Ec+tj0kqCha5Wd8u6zWNG5oCgtFRa3mhaW99eAZxRF8MD5cbPr?=
 =?us-ascii?Q?rOnqP+u8O2qBLlK4bnGmx9HxM6jY4/qzW2tLzOmffVN+xzFBjJ7UxFwNEavD?=
 =?us-ascii?Q?vBELZNyTe/1sgvCSSVbjNfEFbTN4LOy66FlasHzMfOtY+b9A6XWl3kMSOsCU?=
 =?us-ascii?Q?a3U2kEbKYKI3yL5m/pdbrPJaAnFGqiQXeUO+2LEQzkIp0VXFaNFZfVqU0mcj?=
 =?us-ascii?Q?r8uoj1aOMn6SFYxa3VI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 15:18:58.5060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a2ee56-fc22-4e58-03f2-08de05b4d696
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7726

Provide mechanism to check mailbox queue length before posting new
message to mailbox queue.

Changes in v2:
  - Split patchset in two patches for two different subsystems.
  - Change design and introduce new field per channel to track mbox
    queue length.
  - use this new field in xlnx remoteproc driver to prevent sending new
    messages if no slots available in the mbox tx channel queue.

Tanmay Shah (2):
  mailbox: check mailbox queue is full or not
  remoteproc: xlnx: do not kick if mbox queue is full

 drivers/mailbox/mailbox.c               | 3 +++
 drivers/remoteproc/xlnx_r5_remoteproc.c | 5 +++++
 include/linux/mailbox_controller.h      | 2 ++
 3 files changed, 10 insertions(+)


base-commit: 56d030ea3330ab737fe6c05f89d52f56208b07ac
-- 
2.34.1

