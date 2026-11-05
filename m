Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793855988;
	b=hGthec/Xh6ijQpauReBC/hJEbYy9o1/pTL8eYgsB+93KtPIBH5zy9VZ1QmVnCexghmFo
	 6TZv/t1nG4WPjWOv3jIT0z3ISHWheo0jjPdZR3WmY2wmGNvTeVE4fCZp4r5c6PdrY5wr5
	 53+HeJY/LOsO0HtIAEMaIV2Wm8FrRm+diWUzbL729gBs4OBECqu51ex36BY4UlSt7qhef
	 hzNXP3Cerge0pu7DggUUOkVtRpUYFlP0xJJgLSIGsZL/o+O720SymeOlO6ia4c1xkHL2f
	 trzmPp9qexZPCEGA5PWYuBtsJAn5MDkrbCsF9gGfU+HyTmWEmA8IanikxtauzzO43aA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855988;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=VvULQKRGWWSTz4RGjL/HJm7buuBZ4wCw7WuGNsMaKtU=;
	b=Se9hlvgcjZHC3x/QRsOuBlB+l4jjxqfTuKlLY4bMImZ7qTDn9+stpKZYBqU+pb8NhmDy
	 RZj9Rcxa1njoQIoT4p0V1vSSSYvcpK5nlNegEl3+HWJLOVfF7AyIMNXL6Phapsi9C+sDg
	 YaPC0EkUCb2QnLy0YjfLUjhEENqSrBp4YYZiSxcSWP3MwBKDjnWsH437NJ3wnkK7fB0Aa
	 g8+vfYfwxPNhmSMvX8Qcg8NkNOF4ytlqlfbRh8sytrjwn8imjvNZp0BMUEvRBNuOXE71E
	 dxT6JitWxvXNOKbFnk2KR3WyJCkrkhXoHCeYFaOJlfjbVFDn9+gQtVmXGYKk1I7YaCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=O1sU3VVw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.15
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010015.outbound.protection.outlook.com [52.101.56.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D322606A32F;
	Thu,  5 Nov 2026 05:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D322606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=O1sU3VVw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VK/0J7CpZa9pJ7MF7Sx70tCgOUdowMNe1HxWDkbuN0wayiduQe9UINreQTkDLuQwym3kQt9KMshrJL9Aa7sk5hbUgDYEoFG3ZV6UJLKSoGNy6V3EJB428/ttFmXRhFmWUGL6Y/Kll5nbDorb64m4XCHPFUqsuUyWrq4QSvdpfHFuyG+EjEzBcxS8TqSAqWLjFAwRRf6wSk33AyCUiKOEHj3TYGksP05CroMnWF4wOQwGa9dVj7Ry4ty4sUFNWSPzIQVgObay/5mYRZQq/A4zx+8RmuMWMBQ4OuCCh+PHaruKuL+EwSGcgUVPxzJtU7WHH+tcZupVRMuVCg/J76K+Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvULQKRGWWSTz4RGjL/HJm7buuBZ4wCw7WuGNsMaKtU=;
 b=s99CJzmDeMFDuIE5rQbE1bNNmvq7DzvbokapWNZglqGyUhe9RWaGV9SrceCeF9gfD9dp3VSP2uM+6Gbk382wtfn9zb3UT4BYBFIsDg4gAKyxOHedsqrdbcY3UrP7D41c8cOOmlfXEtxCawv/VbCerOoyuJs+ulygGU1nn1jUGr0sscJIxJTyVQgI4HOJBCEyHSdNbI0A1Z/OYd5pAy8QAomya8W4AGNPcZ3YteaooQ7KH4xQmvsXkwFMntXL0LXlzrocTcDV3LAgOfTSNVKzYArmliR7uwAWMzSrnzdDqF9HxlnerJPocRIeAIUyMifrh+AztZoXKMd97A86UKZRgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvULQKRGWWSTz4RGjL/HJm7buuBZ4wCw7WuGNsMaKtU=;
 b=O1sU3VVwPagneDe5wzJjTmG4bKoFM73oKjaIOeSQiQ+ZIuCBpzblEgnypBN4JpF9CC9feK95dVm98f7p2ExipafG5E/gihvK0cB2H49pZjfkGd68mh3ljonlJc9JoWaXN0DQn2wBOTKwgszVM78GDJ8o5b8pJbw7zhpp8zOkFlE=
Received: from BN0PR07CA0002.namprd07.prod.outlook.com (2603:10b6:408:141::17)
 by LV8PR12MB9230.namprd12.prod.outlook.com (2603:10b6:408:186::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 05:19:39 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:408:141:cafe::35) by BN0PR07CA0002.outlook.office365.com
 (2603:10b6:408:141::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 05:19:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 05:19:39 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 23:19:08 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 23:19:07 -0600
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 4 Nov 2026 23:19:07 -0600
From: Ben Levinsky <ben.levinsky@amd.com>
To: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <michal.simek@amd.com>, <tanmay.shah@amd.com>, <ben.levinsky@amd.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 4/6] mailbox: Add AMD PL Mailbox soft IP controller
Date: Wed, 4 Nov 2026 21:19:00 -0800
Message-ID: <20261105051902.1646651-5-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105051902.1646651-1-ben.levinsky@amd.com>
References: <20261105051902.1646651-1-ben.levinsky@amd.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|LV8PR12MB9230:EE_
X-MS-Office365-Filtering-Correlation-Id: 880f79c3-7ef6-4c73-ac6f-08df3afc6436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|82310400026|36860700016|11063799006|56012099006|261022105027099003|261021121427099003|261021123027099003|261021135927099003|261021130227099003|261021133027099003|261022075727099003|261022113327099003|261009223027099003|261102123227099003|261026140227099003|261026121527099003|261026135527099003|261026130827099003|261022115727099003|261028144727099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	UaUWCSgeCkkQc/oFQ+i52ezj2OwMnEpEPz+YJe/CS8kdh5Iyol5baMtHlF2SWKr1nXqHvGuhdBDkMLMs0QUMgqSrKrAaZbDKzzexn6+8RMkJyJERoZ6ULnAlHJdwhdI3k9/DEMH9ZaewocaA6giBGH7/c7Zvm0RcDBj8rmWbChBInQp6Ie7Eacq2jXW8qhNA/nAMWis5Tl+V+UE8MVloDDn2n7XwgVExYMrSgbpGs1DePsqGK05YDo41hXj34oxGRCsjzwpkTg4RouoGOXpyOspo7FRqzKjAlwBc55ZOXC5shTz0dTSSFcySuhuTSamQ9CGL1JPpiKc/ZsuMxn/gab89GbvGurQB70D4RvbE4o70E/wWL4K0qEuthyV0k8TVedWiu8smOR+S88IDba8r/3pCECD+nVEpJ1RB5IrKbqV3YpT0y3UbACPgcw2lZe1aXBzN+14TrVejx+jUOhUKZ0GfLd7loBYx+T0+f0V5fvLdWv2KRuaPufKsm9Dy9vHGSB92gQTA/oNXBXWTk1tTOcmMO8PSEIJJTX9iCPlz3rxn6frIyAT7VycRy4uUB2MU1yWoj4OexTlHa4sJIQ8OmFqKKSQI9bzN/RLBeSTfaZxgFUAstxH6bZjaxLdgBahIa3WQSAmYXGQ6OJ5JgymYvWsX6y3bZhRHJbXme0Tcih4YyAfQw7nKcyDNAOs49lfCDXjF5SRFCjdBsKBY2B30ug==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261022105027099003)(261021121427099003)(261021123027099003)(261021135927099003)(261021130227099003)(261021133027099003)(261022075727099003)(261022113327099003)(261009223027099003)(261102123227099003)(261026140227099003)(261026121527099003)(261026135527099003)(261026130827099003)(261022115727099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HhyC2K4pE3mNeaSGaYZlvVZMYiKagqwKvkVzG9v/MZP8BRGTUmICtovRZMhlJG6Rd9SMrz4PZgjNRCFPQQ81aMYAw8T5TFPHsxSgiBBHThhRRPcp9WU69jpSiMFZGIfQzfhp9t8NkOBClZW7M1MRb3cweA9p+2w2ZHPen8KEjC0lNtzKHc2YSCgP1BCFrQR93d4+lAg1uu57VxxSsr/PrwQpCCZKce+KyDtB/77pZB9WWqZ0TjKVCnnFn4q+VLx+XtibtOBvT9DnM5lUVU5+LhcdFCu+FfwNjJHXryyC5szH8pszwO4vePgDgV94TcRcLIIcPij1lb4AKHRPTPe55RSgMgNWaLYyUN2XyxrgxiBwR5JGwdStSTghyLJrvhzT+C7kj3j6zAosEUkwIzVuUS5cIIpEfwp0uIdjSbcfYdHsGHqocHXlfBa7ZNwStl37
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 05:19:39.6935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 880f79c3-7ef6-4c73-ac6f-08df3afc6436
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9230

Add a mailbox-framework controller for the AMD programmable-logic
Mailbox soft IP. Expose separate transmit and receive FIFO channels,
and match the amd,pl-mailbox-2.1 compatible.

Enable the interface clock only while a channel is started, before any
register access, and disable it last when the channel shuts down. Keep
provider probe free of register accesses and leave the IRQ disabled until
a client starts the receive channel. Initialize each FIFO when its channel
starts, use receive-threshold interrupts for incoming words, and poll the
send-threshold status for transmit completion. Once the transmit channel
begins to shut down, stop both the completion polling and the submission
of queued messages from accessing registers.

Carry mailbox payloads in struct zynqmp_ipi_message, limited to the FIFO
depth given by the device tree. The FIFO transfers 32-bit words and the
hardware conveys neither a byte count nor the FIFO occupancy, so a
transmit length that is not a multiple of four is zero-padded to a whole
word.

Handle the receive interrupt in a threaded handler. Acknowledge the
receive-threshold event first, then read the FIFO until it is empty and
deliver the words as messages of at most one FIFO depth each. The event
latches when the FIFO goes from empty to nonempty, so a word that arrives
after the drain has emptied the FIFO raises a new interrupt, and a full
FIFO is always drained.

Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 MAINTAINERS                      |   1 +
 drivers/mailbox/Kconfig          |  11 +
 drivers/mailbox/Makefile         |   1 +
 drivers/mailbox/amd-pl-mailbox.c | 378 +++++++++++++++++++++++++++++++
 4 files changed, 391 insertions(+)
 create mode 100644 drivers/mailbox/amd-pl-mailbox.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3722a66b9960..e7d93dcb60e6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1311,6 +1311,7 @@ M:	Ben Levinsky <ben.levinsky@amd.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/mailbox/amd,pl-mailbox-2.1.yaml
+F:	drivers/mailbox/amd-pl-mailbox.c
 
 AMD PSTATE DRIVER
 M:	Huang Rui <ray.huang@amd.com>
diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index ab869769e278..ea6bbc5bd2d2 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -8,6 +8,17 @@ menuconfig MAILBOX
 
 if MAILBOX
 
+config AMD_PL_MAILBOX
+	tristate "AMD PL Mailbox soft IP controller"
+	depends on ARCH_ZYNQMP || COMPILE_TEST
+	depends on HAS_IOMEM
+	depends on OF
+	help
+	  Mailbox controller for the AMD Programmable Logic Mailbox soft IP.
+	  The controller exposes transmit and receive FIFO channels to mailbox
+	  clients. It supports interrupt-driven receive notification and
+	  polling-based transmit completion through the common mailbox framework.
+
 config ARM_MHU
 	tristate "ARM MHU Mailbox"
 	depends on ARM_AMBA
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 45dc59bb3e7f..5614d7e1e2f8 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -4,6 +4,7 @@
 obj-$(CONFIG_MAILBOX)		+= mailbox.o
 
 obj-$(CONFIG_MAILBOX_TEST)	+= mailbox-test.o
+obj-$(CONFIG_AMD_PL_MAILBOX)	+= amd-pl-mailbox.o
 
 obj-$(CONFIG_ARM_MHU)	+= arm_mhu.o arm_mhu_db.o
 
diff --git a/drivers/mailbox/amd-pl-mailbox.c b/drivers/mailbox/amd-pl-mailbox.c
new file mode 100644
index 000000000000..dc95fe4eff9b
--- /dev/null
+++ b/drivers/mailbox/amd-pl-mailbox.c
@@ -0,0 +1,378 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD Programmable Logic Mailbox soft IP controller driver
+ *
+ * Copyright (C) 2026 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mailbox/zynqmp-ipi-message.h>
+#include <linux/mailbox_controller.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+#define AMD_PL_MBOX_WRDATA		0x00
+#define AMD_PL_MBOX_RDDATA		0x08
+#define AMD_PL_MBOX_STATUS		0x10
+#define AMD_PL_MBOX_ERROR		0x14
+#define AMD_PL_MBOX_SEND_THRESHOLD	0x18
+#define AMD_PL_MBOX_RECV_THRESHOLD	0x1c
+#define AMD_PL_MBOX_IRQ_STATUS		0x20
+#define AMD_PL_MBOX_IRQ_ENABLE		0x24
+#define AMD_PL_MBOX_CTRL		0x2c
+
+#define AMD_PL_MBOX_STS_RX_EMPTY	BIT(0)
+#define AMD_PL_MBOX_STS_TX_FULL		BIT(1)
+#define AMD_PL_MBOX_STS_TX_THRESHOLD	BIT(2)
+#define AMD_PL_MBOX_IRQ_RX_THRESHOLD	BIT(1)
+#define AMD_PL_MBOX_IRQ_ERROR		BIT(2)
+#define AMD_PL_MBOX_CTRL_TX_RESET	BIT(0)
+#define AMD_PL_MBOX_CTRL_RX_RESET	BIT(1)
+
+/* FIFO depth range of the IP, in 32-bit words. */
+#define AMD_PL_MBOX_FIFO_LEN_MIN	16
+#define AMD_PL_MBOX_FIFO_LEN_MAX	8192
+
+/*
+ * The send threshold is active while send FIFO occupancy is less than or
+ * equal to the programmed value. The receive threshold is active while
+ * receive FIFO occupancy is greater than the programmed value. The related
+ * interrupt status bits latch when a threshold condition becomes active,
+ * and a new event takes priority over a simultaneous status clear.
+ *
+ * A send threshold of zero makes the status bit indicate an empty TX FIFO.
+ * A receive threshold of zero raises an interrupt for the first received
+ * word after the RX FIFO becomes empty.
+ */
+
+enum {
+	AMD_PL_MBOX_CHAN_TX = 0,
+	AMD_PL_MBOX_CHAN_RX = 1,
+	AMD_PL_MBOX_NUM_CHANS = 2,
+};
+
+/**
+ * struct amd_pl_mbox - AMD PL Mailbox controller state
+ * @regs: mapped register aperture
+ * @clk: interface clock, enabled while a channel is started
+ * @irq: receive interrupt
+ * @fifo_len: FIFO depth in 32-bit words
+ * @tx_lock: serializes TX register access against TX shutdown
+ * @tx_active: TX channel is started and its registers may be accessed
+ * @controller: common mailbox controller
+ * @chans: transmit and receive mailbox channels
+ * @rx_msg: receive buffer passed to mailbox clients
+ */
+struct amd_pl_mbox {
+	void __iomem *regs;
+	struct clk *clk;
+	int irq;
+	u32 fifo_len;
+	spinlock_t tx_lock; /* protects tx_active */
+	bool tx_active;
+	struct mbox_controller controller;
+	struct mbox_chan chans[AMD_PL_MBOX_NUM_CHANS];
+	struct zynqmp_ipi_message *rx_msg;
+};
+
+static int amd_pl_mbox_send_data(struct mbox_chan *chan, void *data)
+{
+	struct amd_pl_mbox *mb = chan->con_priv;
+	struct zynqmp_ipi_message *msg = data;
+	unsigned long flags;
+	size_t offset;
+	int ret = 0;
+
+	if (chan != &mb->chans[AMD_PL_MBOX_CHAN_TX])
+		return -EINVAL;
+
+	/* The TX FIFO is empty here, since TX completion waits for it. */
+	if (!msg || !msg->len || msg->len > mb->fifo_len * sizeof(u32))
+		return -EINVAL;
+
+	/*
+	 * The mailbox core can submit a queued message after shutdown() has
+	 * started, while the interface clock is being disabled. Do not access
+	 * registers then.
+	 */
+	spin_lock_irqsave(&mb->tx_lock, flags);
+	if (!mb->tx_active) {
+		ret = -ENODEV;
+		goto unlock;
+	}
+
+	for (offset = 0; offset < msg->len; offset += sizeof(u32)) {
+		size_t count = min(sizeof(u32), msg->len - offset);
+		u32 word = 0;
+
+		if (readl(mb->regs + AMD_PL_MBOX_STATUS) &
+		    AMD_PL_MBOX_STS_TX_FULL) {
+			ret = -EBUSY;
+			goto unlock;
+		}
+
+		memcpy(&word, &msg->data[offset], count);
+		writel(word, mb->regs + AMD_PL_MBOX_WRDATA);
+	}
+
+unlock:
+	spin_unlock_irqrestore(&mb->tx_lock, flags);
+	return ret;
+}
+
+static bool amd_pl_mbox_last_tx_done(struct mbox_chan *chan)
+{
+	struct amd_pl_mbox *mb = chan->con_priv;
+	unsigned long flags;
+	bool done = true;
+
+	/*
+	 * The mailbox core can poll after shutdown() has started, while the
+	 * interface clock is being disabled. Do not access registers then.
+	 */
+	spin_lock_irqsave(&mb->tx_lock, flags);
+	if (mb->tx_active)
+		/* SIT is zero, so the threshold status means TX FIFO empty. */
+		done = readl(mb->regs + AMD_PL_MBOX_STATUS) &
+		       AMD_PL_MBOX_STS_TX_THRESHOLD;
+	spin_unlock_irqrestore(&mb->tx_lock, flags);
+
+	return done;
+}
+
+static int amd_pl_mbox_startup(struct mbox_chan *chan)
+{
+	struct amd_pl_mbox *mb = chan->con_priv;
+	unsigned long flags;
+	u32 irq_enable;
+	int ret;
+
+	if (chan != &mb->chans[AMD_PL_MBOX_CHAN_TX] &&
+	    chan != &mb->chans[AMD_PL_MBOX_CHAN_RX])
+		return -EINVAL;
+
+	ret = clk_prepare_enable(mb->clk);
+	if (ret)
+		return ret;
+
+	if (chan == &mb->chans[AMD_PL_MBOX_CHAN_TX]) {
+		writel(AMD_PL_MBOX_CTRL_TX_RESET, mb->regs + AMD_PL_MBOX_CTRL);
+		writel(0, mb->regs + AMD_PL_MBOX_SEND_THRESHOLD);
+
+		spin_lock_irqsave(&mb->tx_lock, flags);
+		mb->tx_active = true;
+		spin_unlock_irqrestore(&mb->tx_lock, flags);
+
+		return 0;
+	}
+
+	writel(AMD_PL_MBOX_CTRL_RX_RESET, mb->regs + AMD_PL_MBOX_CTRL);
+	/* Interrupt when the RX FIFO changes from empty to nonempty. */
+	writel(0, mb->regs + AMD_PL_MBOX_RECV_THRESHOLD);
+	writel(AMD_PL_MBOX_IRQ_RX_THRESHOLD | AMD_PL_MBOX_IRQ_ERROR,
+	       mb->regs + AMD_PL_MBOX_IRQ_STATUS);
+	irq_enable = readl(mb->regs + AMD_PL_MBOX_IRQ_ENABLE);
+	irq_enable |= AMD_PL_MBOX_IRQ_RX_THRESHOLD | AMD_PL_MBOX_IRQ_ERROR;
+	writel(irq_enable, mb->regs + AMD_PL_MBOX_IRQ_ENABLE);
+	enable_irq(mb->irq);
+
+	return 0;
+}
+
+static void amd_pl_mbox_shutdown(struct mbox_chan *chan)
+{
+	struct amd_pl_mbox *mb = chan->con_priv;
+	unsigned long flags;
+	u32 irq_enable;
+
+	if (chan == &mb->chans[AMD_PL_MBOX_CHAN_TX]) {
+		spin_lock_irqsave(&mb->tx_lock, flags);
+		mb->tx_active = false;
+		spin_unlock_irqrestore(&mb->tx_lock, flags);
+
+		writel(AMD_PL_MBOX_CTRL_TX_RESET, mb->regs + AMD_PL_MBOX_CTRL);
+		clk_disable_unprepare(mb->clk);
+		return;
+	}
+
+	if (chan != &mb->chans[AMD_PL_MBOX_CHAN_RX])
+		return;
+
+	disable_irq(mb->irq);
+	irq_enable = readl(mb->regs + AMD_PL_MBOX_IRQ_ENABLE);
+	irq_enable &= ~(AMD_PL_MBOX_IRQ_RX_THRESHOLD | AMD_PL_MBOX_IRQ_ERROR);
+	writel(irq_enable, mb->regs + AMD_PL_MBOX_IRQ_ENABLE);
+	writel(AMD_PL_MBOX_IRQ_RX_THRESHOLD | AMD_PL_MBOX_IRQ_ERROR,
+	       mb->regs + AMD_PL_MBOX_IRQ_STATUS);
+	writel(AMD_PL_MBOX_CTRL_RX_RESET, mb->regs + AMD_PL_MBOX_CTRL);
+	clk_disable_unprepare(mb->clk);
+}
+
+static const struct mbox_chan_ops amd_pl_mbox_ops = {
+	.send_data = amd_pl_mbox_send_data,
+	.last_tx_done = amd_pl_mbox_last_tx_done,
+	.startup = amd_pl_mbox_startup,
+	.shutdown = amd_pl_mbox_shutdown,
+};
+
+static void amd_pl_mbox_rx(struct amd_pl_mbox *mb)
+{
+	/* data[] follows a size_t in a kzalloc() buffer: u32 aligned. */
+	u32 *rx_words = (u32 *)mb->rx_msg->data;
+	u32 words;
+
+	/*
+	 * The hardware reports neither the peer's message length nor the FIFO
+	 * occupancy. Read until the FIFO is empty and deliver the words as
+	 * messages of at most one FIFO depth each.
+	 */
+	do {
+		for (words = 0; words < mb->fifo_len; words++) {
+			if (readl(mb->regs + AMD_PL_MBOX_STATUS) &
+			    AMD_PL_MBOX_STS_RX_EMPTY)
+				break;
+
+			rx_words[words] = readl(mb->regs + AMD_PL_MBOX_RDDATA);
+		}
+
+		if (!words)
+			break;
+
+		mb->rx_msg->len = words * sizeof(u32);
+		mbox_chan_received_data(&mb->chans[AMD_PL_MBOX_CHAN_RX],
+					mb->rx_msg);
+	} while (words == mb->fifo_len);
+}
+
+static irqreturn_t amd_pl_mbox_irq_thread(int irq, void *data)
+{
+	struct amd_pl_mbox *mb = data;
+	u32 pending_intr;
+	u32 irq_enable;
+	u32 irq_status;
+
+	irq_status = readl(mb->regs + AMD_PL_MBOX_IRQ_STATUS);
+	irq_enable = readl(mb->regs + AMD_PL_MBOX_IRQ_ENABLE);
+	pending_intr = irq_status & irq_enable;
+
+	if (!pending_intr) {
+		dev_warn_ratelimited(mb->controller.dev,
+				     "unexpected interrupt: status %#x enable %#x\n",
+				     irq_status, irq_enable);
+		return IRQ_NONE;
+	}
+
+	/*
+	 * Acknowledge before draining. The receive event latches when the RX
+	 * FIFO goes from empty to nonempty, so a word that arrives after the
+	 * drain has emptied the FIFO raises a new event.
+	 */
+	writel(pending_intr, mb->regs + AMD_PL_MBOX_IRQ_STATUS);
+
+	if (pending_intr & AMD_PL_MBOX_IRQ_ERROR)
+		dev_warn_ratelimited(mb->controller.dev,
+				     "mailbox FIFO error: %#x\n",
+				     readl(mb->regs + AMD_PL_MBOX_ERROR));
+
+	if (pending_intr & AMD_PL_MBOX_IRQ_RX_THRESHOLD)
+		amd_pl_mbox_rx(mb);
+
+	return IRQ_HANDLED;
+}
+
+static struct mbox_chan *amd_pl_mbox_xlate(struct mbox_controller *ctlr,
+					   const struct of_phandle_args *sp)
+{
+	if (sp->args_count != 1 || sp->args[0] >= AMD_PL_MBOX_NUM_CHANS)
+		return ERR_PTR(-EINVAL);
+
+	return &ctlr->chans[sp->args[0]];
+}
+
+static int amd_pl_mbox_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct amd_pl_mbox *mb;
+	int ret;
+	int i;
+
+	mb = devm_kzalloc(dev, sizeof(*mb), GFP_KERNEL);
+	if (!mb)
+		return -ENOMEM;
+
+	spin_lock_init(&mb->tx_lock);
+
+	mb->fifo_len = AMD_PL_MBOX_FIFO_LEN_MIN;
+	ret = of_property_read_u32(dev->of_node, "amd,pl-mailbox-depth",
+				   &mb->fifo_len);
+	if (ret && ret != -EINVAL)
+		return dev_err_probe(dev, ret, "failed to read FIFO length\n");
+
+	if (mb->fifo_len < AMD_PL_MBOX_FIFO_LEN_MIN ||
+	    mb->fifo_len > AMD_PL_MBOX_FIFO_LEN_MAX)
+		return dev_err_probe(dev, -EINVAL, "invalid FIFO length %u\n",
+				     mb->fifo_len);
+
+	mb->rx_msg = devm_kzalloc(dev, struct_size(mb->rx_msg, data,
+						   mb->fifo_len * sizeof(u32)),
+				  GFP_KERNEL);
+	if (!mb->rx_msg)
+		return -ENOMEM;
+
+	mb->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(mb->regs))
+		return PTR_ERR(mb->regs);
+
+	mb->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(mb->clk))
+		return dev_err_probe(dev, PTR_ERR(mb->clk), "failed to get clock\n");
+
+	mb->irq = platform_get_irq(pdev, 0);
+	if (mb->irq < 0)
+		return mb->irq;
+
+	for (i = 0; i < AMD_PL_MBOX_NUM_CHANS; i++)
+		mb->chans[i].con_priv = mb;
+
+	mb->controller.dev = dev;
+	mb->controller.ops = &amd_pl_mbox_ops;
+	mb->controller.chans = mb->chans;
+	mb->controller.num_chans = AMD_PL_MBOX_NUM_CHANS;
+	mb->controller.txdone_poll = true;
+	mb->controller.txpoll_period = 1;
+	mb->controller.of_xlate = amd_pl_mbox_xlate;
+
+	/* Draining up to one FIFO depth of words is done in process context. */
+	ret = devm_request_threaded_irq(dev, mb->irq, NULL,
+					amd_pl_mbox_irq_thread,
+					IRQF_ONESHOT | IRQF_NO_AUTOEN,
+					dev_name(dev), mb);
+	if (ret)
+		return ret;
+
+	return devm_mbox_controller_register(dev, &mb->controller);
+}
+
+static const struct of_device_id amd_pl_mbox_of_match[] = {
+	{ .compatible = "amd,pl-mailbox-2.1" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, amd_pl_mbox_of_match);
+
+static struct platform_driver amd_pl_mbox_driver = {
+	.probe = amd_pl_mbox_probe,
+	.driver = {
+		.name = "amd-pl-mailbox",
+		.of_match_table = amd_pl_mbox_of_match,
+	},
+};
+module_platform_driver(amd_pl_mbox_driver);
+
+MODULE_DESCRIPTION("AMD PL Mailbox soft IP controller");
+MODULE_LICENSE("GPL");
-- 
2.34.1

