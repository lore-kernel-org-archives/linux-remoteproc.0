Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010002.outbound.protection.outlook.com [40.93.198.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E1C2EDD6B;
	Tue, 14 Jul 2026 20:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784060692; cv=fail; b=R3unmYfjPD88HW9IivMqswGh3lIiyInkKsAxUUSQIOl2z/gcEoNCKHlpACdRv1oZ2p6Ij9VhBTK7aJrWbcJL8ReNMC5JbR0Ub+vWpminIkIWRLO3YoIe/8aAtSb0r8PxR6mHhbBVoCapF7CkcZk1zW0Xrj+P8kXd5eF2UnzB8UM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784060692; c=relaxed/simple;
	bh=F5PaxiH34QnSilwnXEU0D/sQQaKR66iU+5YH6xBeS80=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KQgVJLuxqSXa4Auk9ZbnuqgNSjFASYUI3dYR19ihoYxdJNLYk3e74RtlmTOUt/ODaifrfCIFz2vt1m/TIXBmzesyaIklhOcgP/9b23PXY5vGDvVGNE4t8RDOYhTurPTBaFhUzNRbyW5pCzlDXKQ6nGHG24ibit15IJws9SEWQww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JS0mzCYU; arc=fail smtp.client-ip=40.93.198.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JS0mzCYU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJlpshVYkMD9fIUWrLZu2YAujklgXr+iItPSXQyXW1zHigPaZL+uXh7MDs6WzSaQZuqQeskY/2FSVeUrfGcmGz5Fs1ZqJeZsBj30YpPrm4YdBdW7QwI0AaQbzE8vGzB8uMCJ5kUF7OulwyNYbTH+vkBS4JtMGNu5fozKLRPH7NkIMfteTSLyg9/xS1qFY3J3k4HPcVPNYgPZACmsefnItTRNX3Kt7AQU6UZoAeu4uJ4xa72/PJRqxlCCYU8Qll02I5BgO4Q0b4o+l8rme+tHMsRGCJs/v8v/buHFfkLPG3acmqS+nDEnqim9zaGVu0hHVnDQcOfnKkJXkX+GSAJ9WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjnO9fQC/7gOhVWEZ0BWt78ZKQ8rsreXAI2A/xyN7BI=;
 b=I2PD32ZUlQ2N+xg1011a5Xgn2Shs6O/QZKf5l4BO2mq6NSZOzjdPLzHB7RltjhJj2JmaHtQEgxrkIrm/qTldLXIPEsB+Hy32X87aRG8R9tu7x5AcV58TxxceS3dRQS4+nIGTjrEr3gZsehvtkeHuJ/ofsGd9lWeP8QlnN+gXR5ymwGHL7x+wchHWFl/tDb3809ritr0+Sfn/oDOpTeTU1QS4GzO+K4T1R2VbXLsLE+x+S8ZElCMnnoQsN7I9GS0oyr8NJaoK8bWMZtoSbm8ljbNDEsqiDrPhnNAZ+hBw2+T0w4yXFQfA3NskiRizS3cIse18Nc7ITPKF0Z7OE9IN1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjnO9fQC/7gOhVWEZ0BWt78ZKQ8rsreXAI2A/xyN7BI=;
 b=JS0mzCYUnrU4n9vJRhWwil/Sita05W8toQ8zLXBW8jUryefE0PWZro54nhv70/EEjfdw4gBIi5lRc+Vi0hzlS3kPPo5iTpgerGL0rx3W8zOsvn/FhzL1vDNYrKQlyimB1+0NWJm/QN0WjNh3jsZulcXbrH5whlW6GrFROyk6Ryg=
Received: from MN2PR03CA0006.namprd03.prod.outlook.com (2603:10b6:208:23a::11)
 by MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Tue, 14 Jul
 2026 20:24:46 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:208:23a:cafe::8a) by MN2PR03CA0006.outlook.office365.com
 (2603:10b6:208:23a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Tue,
 14 Jul 2026 20:24:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 20:24:45 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 14 Jul
 2026 15:24:44 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 14 Jul 2026 15:24:43 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>, "Michal
 Simek" <michal.simek@amd.com>, <ben.levinsky@amd.com>
Subject: [PATCH v6 2/2] remoteproc: add AMD MicroBlaze/V BRAM-based remote processor driver
Date: Tue, 14 Jul 2026 13:24:41 -0700
Message-ID: <20260714202441.554065-3-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260714202441.554065-1-ben.levinsky@amd.com>
References: <20260714202441.554065-1-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|MW3PR12MB4379:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b19a8d6-cdfc-4d93-aac6-08dee1e5f22a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|6133799003|22082099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	wLy0wnpPMG28k11JoVUZsfhZfq3NL72jyFHEqzAcviTy/drfWP92ZV46UiBQoXw3aWk8JfqlSkMDGOHxE67RBgE8gi7f6UpVCmp2TVLWbG3nXb448xupEKACExou0UqUG8Kl+x3LRduWK2hWWfjERK1BlMImZmkuuDplFitBwH/ZxYWKDG82Vf5CAhI809PWp/3LfOyOWwz+tY5pZQ9EoxLxtz9cc9nxGSClOUEA5yC2FUd2pJ1uKGGkuio5jAYI9x79Ob8LQFMPqoKnlHGjReuQC3PSEhbM/jUxgt76ryl2TztIgk4Saz/ByGJ0+my7GLoRiUXtDb2aAN18Y1y3l2GQAnZ+3G+Nwqvtz+zaF1LCwxq+IJBQ98/XDjGwy1WIwttdSCV/648Gdb4TiZhJ2AwnFUq21QnYo35HceK+M3KWXJ04T4jG+vNdZCI304gENDr1ojW/vnpTPDwXVDIwYDO+fQY1JLXuvFFz9ncgFmBe9Ib/C/hGPIKm62XZKNz1Tbqbobhv55DH7VgLApvNPWMNQJqoNGG+0fS1/vTw7NuOpdGO/mYArJvkRyIV5uQWcWcOhd/sxYpq+J7cYSBdQ3zANr8O3KS/berN0bmZbCoAlylQ7oWIhc1KzKkRJMtMqeBe8os/FmvWSTL4vDQpGb8geyvS90/LvvRjkmS4LeLZh7DfY0kgN+88iUDsZoR2RUZmzYaf4iuQdZ+N3QnE9A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(6133799003)(22082099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0kw4Zdvw6FxhbS9uac1ZVK69raq85W0jWBBxC0F05JEtdiUxmcQ/t5BenDz4Hz2JBQIJMnB+JOi1SUp0RH7LZrSqYz+FpqCF4TSmOmcPABOvAlFEt6b6AedbuI3WCuXk+BnhcGnfw53DEqXVO8YS3/MKOOnNxq4YKg2jLR+MU7QvuhNHp382DtqVY0gR/5ioy45+O3NJ6qmUWnhLs85OrpxJXOebAk8F3/dNrhN6lCqYlS5ocYRJ63+6O42fFP++FwfbXpXpZg41LKXFt2iMURLO5/dKq/EUnDm1voI/phZi1f7lXn8SxuTsm4wsufUhNP85MQ5WmxlRWEK+g8tfpZdjOYDDKfqtaYfA2w7sGWhPZX0mKQ77WJGUzknxFDfkswxNSXaKoe/4KMmcXoTQvkCDbUMA5Cy8U9WA72JNJeXJXUhvS3xs3usVU6S/kwIh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 20:24:45.9401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b19a8d6-cdfc-4d93-aac6-08dee1e5f22a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4379

Add a remoteproc driver for AMD MicroBlaze/V soft-core processor
subsystems instantiated in programmable logic and using dual-port BRAM
for firmware storage and execution.

The driver parses the firmware memory window from the remoteproc device
node's reg property, interprets that address and size in the
processor-local address space, and then uses standard devicetree address
translation through the parent bus ranges property to obtain the
corresponding Linux-visible system physical address.

The resulting translated region is registered as the executable
remoteproc carveout and coredump segment.

The processor is controlled through an active-low reset GPIO and a
subsystem clock. The clock is enabled before reset is released, and the
processor is kept in reset until firmware loading completes.

The firmware-name property is optional, allowing firmware to be assigned
later through the remoteproc framework. Firmware images without a
resource table are also accepted.

Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 drivers/remoteproc/Kconfig              |   9 +
 drivers/remoteproc/Makefile             |   1 +
 drivers/remoteproc/amd_mbv_bram_rproc.c | 213 ++++++++++++++++++++++++
 3 files changed, 223 insertions(+)
 create mode 100644 drivers/remoteproc/amd_mbv_bram_rproc.c

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index c521c744e7db..b25252acbfb9 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -23,6 +23,15 @@ config REMOTEPROC_CDEV
 
 	  It's safe to say N if you don't want to use this interface.
 
+config AMD_MBV_BRAM_REMOTEPROC
+	tristate "AMD MicroBlaze/V BRAM-based remoteproc support"
+	depends on OF && COMMON_CLK && (GPIOLIB || COMPILE_TEST)
+	help
+	  Say y or m here to support a MicroBlaze/V BRAM-based remote
+	  processor managed through the remoteproc framework.
+
+	  If unsure, say N.
+
 config IMX_REMOTEPROC
 	tristate "i.MX remoteproc support"
 	depends on ARCH_MXC
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 1c7598b8475d..689686de0d41 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -11,6 +11,7 @@ remoteproc-y				+= remoteproc_sysfs.o
 remoteproc-y				+= remoteproc_virtio.o
 remoteproc-y				+= remoteproc_elf_loader.o
 obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
+obj-$(CONFIG_AMD_MBV_BRAM_REMOTEPROC)	+= amd_mbv_bram_rproc.o
 obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
 obj-$(CONFIG_IMX_DSP_REMOTEPROC)	+= imx_dsp_rproc.o
 obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
diff --git a/drivers/remoteproc/amd_mbv_bram_rproc.c b/drivers/remoteproc/amd_mbv_bram_rproc.c
new file mode 100644
index 000000000000..e4a103cf8455
--- /dev/null
+++ b/drivers/remoteproc/amd_mbv_bram_rproc.c
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD MicroBlaze/V BRAM-based Remote Processor driver
+ *
+ * Copyright (C) 2026 Advanced Micro Devices, Inc.
+ *
+ * This driver supports soft-core processors (MicroBlaze, MicroBlaze-V, or
+ * similar) instantiated in AMD programmable logic, using dual-port BRAM
+ * for firmware storage and execution.
+ *
+ * The firmware memory (BRAM) is described in the processor-local address
+ * space and translated to the Linux-visible system physical address with
+ * standard devicetree address translation.
+ *
+ * Reset is controlled via GPIO connected to Processor System Reset IP.
+ */
+
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/remoteproc.h>
+
+#include "remoteproc_internal.h"
+
+/**
+ * struct amd_bram_rproc - AMD MicroBlaze/V BRAM-based remoteproc private data
+ * @dev: device pointer
+ * @reset: GPIO descriptor for reset control (active-low)
+ * @clk: processor clock
+ */
+struct amd_bram_rproc {
+	struct device *dev;
+	struct gpio_desc *reset;
+	struct clk *clk;
+};
+
+static int amd_bram_rproc_prepare(struct rproc *rproc)
+{
+	struct amd_bram_rproc *priv = rproc->priv;
+	struct rproc_mem_entry *mem;
+	struct resource res;
+	u64 da, size;
+	int ret;
+
+	ret = of_property_read_reg(priv->dev->of_node, 0, &da, &size);
+	if (ret) {
+		dev_err(priv->dev, "failed to parse executable memory reg\n");
+		return ret;
+	}
+
+	if (!size || size > U32_MAX) {
+		dev_err(priv->dev, "invalid executable memory size\n");
+		return -EINVAL;
+	}
+
+	if (da > U32_MAX) {
+		dev_err(priv->dev, "invalid executable memory address\n");
+		return -EINVAL;
+	}
+
+	ret = of_address_to_resource(priv->dev->of_node, 0, &res);
+	if (ret) {
+		dev_err(priv->dev, "failed to translate executable memory reg\n");
+		return ret;
+	}
+
+	mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
+				   resource_size(&res), da,
+				   rproc_mem_entry_ioremap_wc,
+				   rproc_mem_entry_iounmap,
+				   dev_name(priv->dev));
+	if (!mem)
+		return -ENOMEM;
+
+	rproc_add_carveout(rproc, mem);
+	rproc_coredump_add_segment(rproc, da, resource_size(&res));
+
+	return 0;
+}
+
+static int amd_bram_rproc_start(struct rproc *rproc)
+{
+	struct amd_bram_rproc *priv = rproc->priv;
+	int ret;
+
+	/* Enable clock before releasing reset */
+	ret = clk_prepare_enable(priv->clk);
+	if (ret) {
+		dev_err(priv->dev, "failed to enable clock: %d\n", ret);
+		return ret;
+	}
+
+	/* Deassert reset and let the processor run. */
+	ret = gpiod_set_value_cansleep(priv->reset, 0);
+	if (ret) {
+		dev_err(priv->dev, "failed to deassert reset: %d\n", ret);
+		clk_disable_unprepare(priv->clk);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int amd_bram_rproc_stop(struct rproc *rproc)
+{
+	struct amd_bram_rproc *priv = rproc->priv;
+	int ret;
+
+	/* Assert reset before disabling the processor clock. */
+	ret = gpiod_set_value_cansleep(priv->reset, 1);
+	if (ret) {
+		dev_err(priv->dev, "failed to assert reset: %d\n", ret);
+		return ret;
+	}
+
+	/* Disable clock after asserting reset */
+	clk_disable_unprepare(priv->clk);
+
+	return 0;
+}
+
+static int amd_bram_rproc_parse_fw(struct rproc *rproc,
+				   const struct firmware *fw)
+{
+	rproc_elf_load_rsc_table_optional(rproc, fw, dev_dbg,
+					  "no resource table found\n");
+	return 0;
+}
+
+static const struct rproc_ops amd_bram_rproc_ops = {
+	.prepare	= amd_bram_rproc_prepare,
+	.start		= amd_bram_rproc_start,
+	.stop		= amd_bram_rproc_stop,
+	.load		= rproc_elf_load_segments,
+	.sanity_check	= rproc_elf_sanity_check,
+	.get_boot_addr	= rproc_elf_get_boot_addr,
+	.parse_fw	= amd_bram_rproc_parse_fw,
+};
+
+static int amd_bram_rproc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct amd_bram_rproc *priv;
+	const char *fw_name = NULL;
+	struct rproc *rproc;
+	int ret;
+
+	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
+	if (ret < 0 && ret != -EINVAL)
+		return dev_err_probe(dev, ret,
+				     "failed to parse firmware-name property\n");
+
+	rproc = devm_rproc_alloc(dev, dev_name(dev), &amd_bram_rproc_ops,
+				 fw_name, sizeof(*priv));
+	if (!rproc)
+		return -ENOMEM;
+
+	priv = rproc->priv;
+	priv->dev = dev;
+
+	/* Get the processor clock */
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(dev, PTR_ERR(priv->clk),
+				     "failed to get clock\n");
+
+	/*
+	 * Keep the processor in reset until remoteproc has finished loading
+	 * firmware into the executable memory window described by reg and
+	 * translated through the parent bus ranges property.
+	 */
+	priv->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->reset))
+		return dev_err_probe(dev, PTR_ERR(priv->reset),
+				     "failed to get reset gpio\n");
+
+	rproc->auto_boot = false;
+
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set DMA mask\n");
+
+	platform_set_drvdata(pdev, rproc);
+
+	ret = devm_rproc_add(dev, rproc);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register rproc\n");
+
+	return 0;
+}
+
+static const struct of_device_id amd_bram_rproc_of_match[] = {
+	{ .compatible = "xlnx,zynqmp-bram-rproc" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, amd_bram_rproc_of_match);
+
+static struct platform_driver amd_bram_rproc_driver = {
+	.probe = amd_bram_rproc_probe,
+	.driver = {
+		.name = "amd-bram-rproc",
+		.of_match_table = amd_bram_rproc_of_match,
+	},
+};
+module_platform_driver(amd_bram_rproc_driver);
+
+MODULE_DESCRIPTION("AMD MicroBlaze/V BRAM-based Remote Processor driver");
+MODULE_AUTHOR("Ben Levinsky <ben.levinsky@amd.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1

