Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795125861;
	b=TscmSe3RxG6KwaAx6ANBOyJDmXp1M9tW8a7j7EyWV7j7Gv24pjeF2gL9PdD93d2ck48F
	 sJYAQnpMDwmUjeKENOwwgxxSIcejukE9zepPIcSiBnDNUW+IFiTXDhsyZ7Di6YC9+bkPU
	 Yjf2mI7iVE0NOrf0YOlaKApZMnBW+laZSqCmrMpp1nKevH+N7YLcKFf+maDg2xGgQmOW1
	 wwCLc/NkhxDjFLM7dPCTHPJQN0kYzUkjOAkSiw0EGKDu9kQnARKsyrZ/ks2fi28TKWKW7
	 pprYSSNUaoDDJQlB2oX2b+jLIDitvFSKNxOfCABITpm6FBvMz1KWB0gwI4OiFBjbklA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125861;
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
	bh=XSGlbqnmDPbHeM2BCBc6QkkkwKL5dDxg/GT0U9XGt5g=;
	b=ulrtGw5PEnDGvHBtGhgB0EINJvyveKhR/tnccK4IZZD0DCvNOxEF4+PBb/zdBGI2cW1U
	 Wew83Hem0a1rGnrC5SRWM96YKqHlZ8Cjfqd742ImP/FVCLniDRtd4YK8dlnW7I4UWThc+
	 OWTc7OQ72rbiUuUtXZb9WWYkkojRKqWxWHfOS7pzdeYdsxTf9o1WhVzGNc4dsiCOwdNux
	 EGyKUiBR3RbC9CVx2M7DMqzUvT9ClIk/VhuDDNZ5CaTS0IA/BsEJEZaJSyqmZe9SvpoVM
	 EGlv8W4+xeaEU+HKx3A1QfU5FXg9b10Y73o+MhyqICSsZphDo7+e9nSqi09vzLw8Mww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="lSH4wLF/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.44
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010044.outbound.protection.outlook.com [40.93.198.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4C860A2606;
	Thu, 19 Nov 2026 22:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD4C860A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lSH4wLF/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vXXqFYgwEOHrkgnotR9LKCfdueAuKkOIjZaPqFJCEKzticFH6SmW0DOVlvsjXWxbtKeCvfFa7i7CBCYHvb+s3GmbaIM2dms0+j2/IRHSgBNf/EOsKerTgldE5f3NukmIRHB/V2ITWj+248DkAKoLp0pUzmKeIH2S3YcGq6znWAKoMtOvQAh3lzOFoYI3Oe4um5eIvRvyu6poq1OQ+xEfjwxzZzOkUVlh7IHRaKkhoUgfhV3H9h/zYFG8M+pWwIRh87sD1mjZ5/DDODmijcHPxREHi8SDOjeNlP2gWnRqC9lCi3S4HTATCFka++RllFydl3cBudUERjF8zowAzKgjRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSGlbqnmDPbHeM2BCBc6QkkkwKL5dDxg/GT0U9XGt5g=;
 b=Rt9/UtqChUCzsN/xQIgSHJCNlI4UFswJjKRF+vq/mcezM7EvwEGSPiDIl+OoroOIfumUq9n/6Bz2IRcMqGKzraaFT36MW9KRo6pxhD0Ml2H7KYSapINBddW8QD/sJfiLOtsHDWYApcDOm3MR56h3DzK++K2jYQM05fdgb2ij4iERRDJ82mrWDWd9AUJ4Okx9x+GtrCECrL44kVSEdNnId1zawqpHitsYHI4kOF1VazBSkrLvZqEbyS+mecCJ9XglUF29MfEZLsbpA517FC3+dmV+UPUmFTzYFxLQWG5SudDNoVeiY+ffUNdfgo+1r/W1fjkMCT0ZILIuKgQK4uiN0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSGlbqnmDPbHeM2BCBc6QkkkwKL5dDxg/GT0U9XGt5g=;
 b=lSH4wLF/d4MsfFLOwKvGxWkOIXSxAw6mAvjjbBoSwElUxzA+kUaJ7hT2LWJTZ83HOxpjPH6iK5Z3j9m8q6L0G/QQUk7/EN+i93pwOVbleKAbjEGQBy8RcABkGKZB9GCsvM9DsJeyp6dFFB7mHfGZkQlVZ5jlKfPq+ObG/4OmH1w=
Received: from CH2PR14CA0058.namprd14.prod.outlook.com (2603:10b6:610:56::38)
 by IA1PR12MB9063.namprd12.prod.outlook.com (2603:10b6:208:3a9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 22:04:11 +0000
Received: from CH2PEPF000166BB.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::65) by CH2PR14CA0058.outlook.office365.com
 (2603:10b6:610:56::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 22:04:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF000166BB.mail.protection.outlook.com (10.167.252.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 22:04:09 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 16:04:08 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 16:04:08 -0600
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 16:04:07 -0600
From: Ben Levinsky <ben.levinsky@amd.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson
	<andersson@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <michal.simek@amd.com>, <tanmay.shah@amd.com>, <ben.levinsky@amd.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/4] mailbox: Add AMD PL Mailbox soft IP controller
Date: Thu, 19 Nov 2026 14:04:03 -0800
Message-ID: <20261119220405.2838553-3-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119220405.2838553-1-ben.levinsky@amd.com>
References: <20261119220405.2838553-1-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF000166BB:EE_|IA1PR12MB9063:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c1770d2-3b0c-43fa-7d58-08df46890962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|7416014|1800799024|376014|18002099003|22082099003|6133799003|261009223027099003|56012099006|261022115727099003|261102123227099003|261026135527099003|261026121527099003|261021133027099003|261021135927099003|261026140227099003|261021130227099003|261022075727099003|261022105027099003|261021121427099003|261022113327099003|261026130827099003|261021123027099003|261028144727099003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	AnLn6Ff+1BkMucTgl/RgpGq3wpSj4vncEVgRnsjjUISIZzmD/qpp+66fnK1SIiEKyqM3Mmw4A0f9no4IvX+u1JObRkX/LGWCoCxpto+TUvA5qzw2c/1CDmygA6+b3+ESkcocGSILnHYm2uBO1WIh8d7u2KyhePOe8f+R7pcdSoi4StO2yuds9pyq1r135MgpDUbYzae824TXPxunYaToqp2uM5ypL+3re2zkSUcg8PRVy9KgckIdlmVAaE94BZPgNvf0/xbQ/Lu60MpW5lUgE3xks0Z+OBL5KOlsrcKVNysr/ZC9ipP9P0Bx26vmRyU6PyJQRsrTkw9H+hg8uxjPCRGPla2Ys01JfFfLgpb+/s+4etYBqroB3xpaXbEMMZQKXzi3QmIe9HBpoSjKwQriM31kNvwOCZuKltF6eRkJI2EMSr4DjUTRmZEEfI7chxlSIhwCcJT0Z8JGYlGkdAbCFzxQvOvV0rklG5lFArfegUPXoKEdFaurIIFvxOyIPiGBxtFkChnQ2Bj7l71KpkDD4UbN264UeFykxA1nsEPhMoH/JL9Y/hhiN8oxwJKbQIz40CNSiYpU4+2xlO+q2vMhXIOFACO7fsYiv5SmQO9QHqeUQ1xeER4WKoQxRnEjWKNtCmdddbs4TEzmZlainfxtWTyeLAbjZhVE7VaXDXALhAARjubuiOdBRShsu7hk1U5TmeSQxGcKyrXr1El+v2C6rA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(7416014)(1800799024)(376014)(18002099003)(22082099003)(6133799003)(261009223027099003)(56012099006)(261022115727099003)(261102123227099003)(261026135527099003)(261026121527099003)(261021133027099003)(261021135927099003)(261026140227099003)(261021130227099003)(261022075727099003)(261022105027099003)(261021121427099003)(261022113327099003)(261026130827099003)(261021123027099003)(261028144727099003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SdKxjQH9jTEqoQKx4oPQJlHS7OMFIdvjIJ2Qoq52AdLetIZbPMio4X4s6Zz/S3DOwOn6KT+kUG1hx20AS6zY5K2lqXsvvVZ66KcO14SNbycCQlpWc7gSWM6TI/i0v2YGp3KmTgcXGUQ2HdbcDlwNdxGpug8vyA9+iRB5yNd1R2XYimWWoAxM/Two3QnOcL7UZiSTlpxezDoplbQ1yERrDnlgdnp+oX9TXdx9H7WkD4m8CFiiV2CjDS3nflh9bDhOZu8sO2SpGsZugMIlAMnOj8WvU4rMZrToNJGNk4gtLRtda8bOtWDvXxiAZKUlh5StXap+UH9lGrfeCsh7hoPvpke6UHto/4orEEjRsTUwOwAlJC9FX6xeHrcenLfnyO8hm1VRSSVYzEV1J89tdfLAH4+CjAtgETpNHvk3ktvvqFSoW29u498iS6hjDCKPO8+o
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 22:04:09.1473
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c1770d2-3b0c-43fa-7d58-08df46890962
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000166BB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9063

Add a driver for the AMD PL Mailbox IP.  Each instance provides a TX and
an RX channel.  Transmit completion is detected by polling the TX FIFO
empty status, while received words are read from a threaded interrupt
handler until the RX FIFO is empty.

Since the hardware doesn't provide a message length, received data is
passed to clients in chunks of at most one FIFO depth.

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
index dc6a835f7bbc..60f195c53aad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1320,6 +1320,7 @@ M:	Ben Levinsky <ben.levinsky@amd.com>
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
index 000000000000..d1fe0f381dce
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
+ * @regs: mapped registers
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

