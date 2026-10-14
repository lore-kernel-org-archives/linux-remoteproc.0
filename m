Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011028.outbound.protection.outlook.com [52.101.57.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD24C44C659;
	Wed, 14 Oct 2026 21:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013678; cv=fail; b=Sb3xVwz/L9u20tDqzTVQTvYjia8KdIquWpX9cOq3IWJNC8I1L6n+MbZWnRBVTeRS2ofy93cnZBFIfMUDlQeXzOdQqDW+gz47Q/9mTtZta+JeSz3+YsLQhqhr1G+rHONe3C9RfoDwiVBetJVxB7VKo9K4HxzsiRDun+s8w9Q4mew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013678; c=relaxed/simple;
	bh=6uq8UX27bKfhj3KSLqrO72OVE970i62Fut9guiYTc9Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OJLQNKDAJW2QUR7qbLlsN80NsCCIh9IeJTwDgLdg3vQcP+xZEd7lp0Ayb44440pfydsZ/sr/iTwow7dODbz8pgMiNCYgEtcv3eKMLBN5vcBGPC6QpeNLBVvi3o/1qzyw6a73rfKtkAInzO3FX4Xk6V/h/vvMVQhz2n1P4dHMys8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BL2RnhdM; arc=fail smtp.client-ip=52.101.57.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BL2RnhdM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oz7qkNj3lCDqGWe+GOZOipKed2uCEicSjjNYBv0Lin+LtWL8NKn9idRCzlIE5Jt5iKXvNrXji6dJ3SrBGgPMNSOKcnp1UsMlw0EsjqsACKV5PJeIxh+SAt5mVDjo536FPDudprIM4PJYq6uFM/iBS3a/3NlkK4bXzlxdDN+f7Lf5YP+q2gAPLvLhRBv0qHWihOG/RYum0ZMGlYtctJQjCCLizunOLTl69W41robQeovsrNHBOn57xIaUnueLAyo7ivOWaepJK8vXnbwGoax+yoYK1cvu1SMeN2V2D/1mJGxZk2Ne5Kmh7ftSgrM7++riUJqNBeuBDjOb+XBKspXDog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzJZIfyBw3rCpIRAXFdDjjYQK/8trx9bNTIiD2yo2pI=;
 b=IShmD2h00aKp6L3sENxansyqCZRJiSglijqRBml6y+Wd6h0G3Y7W4l9rHeUeRFKRocsE3IROPo9uc8n6nEkB0sOnZGjDnYMG46t1Y6OapyGW2EdbDEqwZTqXhJq2lZ66DE27wdsJPnJ9754OeRfBRFpreAcCwo9YObD9SGjF2t6lZptMgrgFHX5tY6BUQH2FpAvtE3ATmAGCevf1MSqxRKKPgLP/wo31TnE0IkPgqYTS4uFtYPD6bfIVcVTj+JnvtaSSsditvtdNFCwoK5aR+4rOXhCy1ryLocnK4rnL/dycAINXu9NCbSHjfVtIjthVuE2vdBE5HcNRwHBuy0YEQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzJZIfyBw3rCpIRAXFdDjjYQK/8trx9bNTIiD2yo2pI=;
 b=BL2RnhdMVWfzePTrZsiOP81HF9pV1Nz/SLcChnFkYeOBT2cxkoTt/CqPntaYgxv7HVX35STJ4TYC6oM9dvmdvllmA6GsQc4xTKuAPq/sEkfyO8vjINYS/+ZRv787nYkIdGcNOyjTGOVWTfwJpLs+9n+0TkstdphO8ChMM5MIxFc=
Received: from BY3PR05CA0024.namprd05.prod.outlook.com (2603:10b6:a03:254::29)
 by DS0PR12MB9346.namprd12.prod.outlook.com (2603:10b6:8:1be::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Wed, 14 Oct
 2026 21:34:29 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:a03:254:cafe::3b) by BY3PR05CA0024.outlook.office365.com
 (2603:10b6:a03:254::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 21:34:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 21:34:28 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 16:34:21 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 16:34:21 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 14 Oct 2026 16:34:20 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <michal.simek@amd.com>, <linux-remoteproc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <ben.levinsky@amd.com>, <tanmay.shah@amd.com>
Subject: [PATCH 0/6] Add AMD PL Mailbox and RPMsg support for the AMD BRAM remoteproc
Date: Wed, 14 Oct 2026 14:34:20 -0700
Message-ID: <20261014213426.2957480-1-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C9:EE_|DS0PR12MB9346:EE_
X-MS-Office365-Filtering-Correlation-Id: 59f336e6-d12b-4ebd-48c3-08df2a3aed43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|7416014|82310400026|376014|23010399003|261009220027099003|56012099006|10067099003|11063799006|18002099003|261009223027099003|6133799003|261009223327099003|3023799007|261009221727099003|261009221227099003;
X-Microsoft-Antispam-Message-Info:
	u4XD0N7/HSVS3f++bGQxjiS09DgPD1tUKc/1AKNOJfFLcioVzHACPJt4cMb7TELE6O89Sr/5CLyYpuexHGNKeV9qFtiufOjPgmGFSnXc+UCIdLjdAWzSLz44v3Mk7YoVLOwhJC+saCBmvj8X1S3YP8UkwXKUUFPFO6D4UPEMXh+TXBFNBcW2Y0pFcSvUErVynxgYfxoFKShtalk3CElpD7/zCGtge8hpMk+H1PVNgm+MiOy/rHyUMeJUwJ36ZcylZYc8lS2UwCj2QiPuIGx7FeRA/r4AehRU8TpgmkObIw8T2qhdoCCUwVf0bdXaPd4pbdz6WBJD5/MYUYcQHwiRt6tQBHZf9Zm4U+735teTjZXVlE/VKKzMbP8f+piM2ZexVbMy5aaQf4cQu9LSiVc6NwusuAp1aE+GBguTdK7Ux9MMWuruc5qpLlMKp4EeOqOYPQ0J8JxLApSnJrsxalE9Bxlo62ywmMCHIc97AWCKHmZgrlfKuXdMzHX8il2HEk+It+cURAF59n4wawE/dw4tQyAon0Y8YVxXn2dcXRcdoPLqEhOBgrSAdp3QUvstx8+oAJS1ugzmppvo2f4nPMpgWm/+lfjYhHPw6XWmz2q1nKTyIuqT5MImbLsXjDCzEdJWyOYchVKPm9uOzPNL/U8Ef2KF3QxTU5K1boxWcGxCxHIIq1+3Z1T2CFpgRhcQMeO1Azz4cx5Phi+0aW6DTQ+OqA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(7416014)(82310400026)(376014)(23010399003)(261009220027099003)(56012099006)(10067099003)(11063799006)(18002099003)(261009223027099003)(6133799003)(261009223327099003)(3023799007)(261009221727099003)(261009221227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0YwAE+KpuL4OhYZWPYezIxy7AVM9f4EEa34jHUoLFXMnQa2Dr2+z1Nd1sop1FKGaLsAtP2XocCoLrXQHmJXxdxN36fjGbEqiUPxOp4sxqS4J9RDv717qIyzjngIaugytImlz2mB8SnNiq2ajXRNS+AAgTc+RE9PpMHLqtAvijJoLzmV5iRjArFJrRr8zs189UVj8f9gsaLgD4QU8N07zscFV//nAb3Rb3l6ClKgYPgOCavl2OSasMv33QjgsWmMCfDz4w/6QEHv8hjui0h8wjaZrF88HYfmEVtIg75dJxBTPbIu0FEZTuzx0sgpcsYbMZzC1LZAV7/PeKOlV+vLDXvEgwK4JFXVg8QREa98M5A8qEA3VqWZCi3WKCUq9QQNNqrAN4hwFY/bKFEwL+nNTDu0s/xPq7Ge1ptWubpp2QWsAMz8kAcCOrGiq8UrS2lzm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 21:34:28.5967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f336e6-d12b-4ebd-48c3-08df2a3aed43
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9346

This series adds a mailbox controller for the AMD programmable-logic (PL)
Mailbox soft IP and uses it to add RPMsg support to the AMD MicroBlaze/V
BRAM remoteproc driver, so that a soft processor in the PL can communicate
with Linux over virtio-rpmsg.

Patches 1-2 fix the existing BRAM remoteproc driver:
- Pass the device name to rproc_mem_entry_init() through a constant format
  string instead of using it as the format.
- Drive the reset GPIO with gpiod_direction_output() so a start still
  produces a reset pulse after the PL has been reconfigured, which restores
  the AXI GPIO to its default direction.

Patches 3-4 add the binding and the mailbox-framework controller for the
PL Mailbox IP. The controller exposes independent TX and RX channels. Its
interface clock is enabled only while a channel is started. RX uses the
receive-threshold interrupt and delivers up to one FIFO depth of words per
message, with the depth taken from the device tree. TX completion is
reported by mailbox-core polling of the send-threshold status bit.

Patches 5-6 extend the BRAM remoteproc binding and driver with optional
mailbox channels and named reserved-memory regions for the vrings and the
shared RPMsg buffer pool. The driver registers the carveouts, exposes the
loaded resource table, requests the mailbox channels only while the remote
processor clock is enabled, sends virtqueue notification IDs through the
mailbox framework, and defers received notifications to process context.
Without mailboxes the driver keeps supporting load, start and stop only.

The series applies to v7.3-rc7 and uses the remoteproc wc-ioremap and
optional resource-table helpers merged for v7.3-rc1.


Ben Levinsky (6):
  remoteproc: amd_mbv_bram: Bound device name formatting
  remoteproc: amd_mbv_bram: Restore reset GPIO direction after PL
    reconfig
  dt-bindings: mailbox: Add AMD PL Mailbox IP
  mailbox: Add AMD PL Mailbox soft IP controller
  dt-bindings: remoteproc: Add RPMsg resources to AMD BRAM rproc
  remoteproc: amd_mbv_bram: Add RPMsg support

 .../mailbox/amd,zynqmp-pl-mbox-2.1.yaml       |  74 ++++
 .../bindings/remoteproc/amd,bram-rproc.yaml   |  31 ++
 MAINTAINERS                                   |   7 +
 drivers/mailbox/Kconfig                       |  10 +
 drivers/mailbox/Makefile                      |   1 +
 drivers/mailbox/amd-pl-mailbox.c              | 369 ++++++++++++++++++
 drivers/remoteproc/Kconfig                    |   6 +-
 drivers/remoteproc/amd_mbv_bram_rproc.c       | 256 +++++++++++-
 8 files changed, 748 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/amd,zynqmp-pl-mbox-2.1.yaml
 create mode 100644 drivers/mailbox/amd-pl-mailbox.c


base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
-- 
2.34.1
