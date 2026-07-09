Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010035.outbound.protection.outlook.com [52.101.193.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43DB23AB9D;
	Thu,  9 Jul 2026 14:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783609154; cv=fail; b=SsVBp7o0v1lw5GZx/PSNrgVkIpjv8eWGg6H6U/TQdts2mb6idB2A38fdk/XL/7WCv/rWYhLCiSv7Ov/G6WQSqNzwGQE21gqR5mhx03/jp4ig/zN3FVIWDluv8UdUWYeQ+o0H4WtlckXYsFmTwud3y24x1W6+4Ib1a3zrjgdteac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783609154; c=relaxed/simple;
	bh=3FuqLdrUpxJP1jNJ1rU2Oln1DtUL9xK0n/2EPT5kzIA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E8+PfbSoOc0wB0T2LTEOdw/OBWIxrnMPyWnU3EwMIy5snP0aWtsL5iv/cjq06ZdnyU7VtS5TOQ78yx04q2H2Kl5HTWvAioq5aTcTNnIfGcxqLgnk+dO5XY7lt9iqruetQe3c3G/V8OVxfy8daHUMgTHMt3o4XaBN8sNnuExnL1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dYlL8mZH; arc=fail smtp.client-ip=52.101.193.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dYlL8mZH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q35OHjriGRMPUzp7tjokgbdNSHf9WAVlujoi2KHl/WoylL8XDVe6Ji5YkMuc0vRC0f0N3Ea7zkocloMMlKpmfAYRHsgyGCK27r1GTSrNjJ2UsceZYjBn8QAG4wiXjoYcMDz/6N/aDhtiJu2i/DE+wcYE1N5WwNBCVv/nnz1NZErmg37GLZA1j5YOoWHk3IMkuZO0teKBG0WYknnNVKjq2/UDiI5EEGYIO99g0fRnLzNOchyeVpI6FMVpLL8XZFcGnoKI2qeNP8C7Lsmd/9JDYWTzQvPCb+2h9jTp/7ydYyW6v9CceTtpEniH7hYPQpBuOsq0vsBLyk0lDhZ1paCliw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X16Pi2X37t/+R7awfu1L4NF/BvVEAbKmLuy9ZZyrgc8=;
 b=CWYubv5t2NHuMo1qKGuT2y7PiJd7AGImugiwt3UQb19m4hjuWl4rgC4bHCVtIJy/2Ca6LHLQ7FcntRKRHBY1Oqayqd27cMZHG/v9J86VoPS9dkCmhU7WJ21vkRsIS5RrLYecn7u8hUyQ2yKeOf6Skfid4TKi7CMeMMgK1XxujA/efbKBFSidneji/PuF1tByfhvpJMuUC3ELxfcnWllHa3C4tQND8kyUamNUZbYS4HG7R13IvxSX83EK1xExNz6Ix5i+YN/TCWIGqUF9oJwP1h8+DWPnzr5q//0Cfk37guoaubWMloxrcsAvxSywYoQW+YU5oz2huKk/8sqMoyTUXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X16Pi2X37t/+R7awfu1L4NF/BvVEAbKmLuy9ZZyrgc8=;
 b=dYlL8mZHtdTASG4nuX4lD8icg4ftL1iixJ58I23JTFNZiTQquwjBvR+PiQy80aec1yVOuc1w6NzBxpmi6jnBbxNv2/DCSk28lUXDrGXh4Qg0dDpy8PjWG0sqwL+lYqND3LSBIQOLmso4CkZWfw/uuPszq7bmTOXoEUmzVDvtYyQ=
Received: from SJ0PR05CA0189.namprd05.prod.outlook.com (2603:10b6:a03:330::14)
 by LV0PR12MB999094.namprd12.prod.outlook.com (2603:10b6:408:32e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 14:59:06 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::9e) by SJ0PR05CA0189.outlook.office365.com
 (2603:10b6:a03:330::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.3 via Frontend Transport; Thu, 9
 Jul 2026 14:59:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 14:59:05 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 09:58:50 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 09:57:15 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 09:57:14 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ben.levinsky@amd.com>, <tanmay.shah@amd.com>, <michal.simek@amd.com>
Subject: [PATCH v5 2/2] remoteproc: add AMD MicroBlaze/V BRAM-based remote processor driver
Date: Thu, 9 Jul 2026 07:57:12 -0700
Message-ID: <20260709145712.951146-3-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709145712.951146-1-ben.levinsky@amd.com>
References: <20260709145712.951146-1-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|LV0PR12MB999094:EE_
X-MS-Office365-Filtering-Correlation-Id: f6e77fe7-6feb-48b9-b56f-08deddca9f50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|30052699003|23010399003|376014|1800799024|82310400026|18002099003|22082099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	1q9CBjriYSYZU4uQMrPFF7kk/wl2GhnNz5TTlsji6YM3zxnEOlwj/AW3Yb8NySXnGA1xiA4iqiRbcoBmKLatn/uUi+Zjo5FHYRM/dpYa4ji2ntKuaPt1qOsH/WKwTfmzczc54ExsW0fRaQfRtKkIlDcHdof+ZjDHdOshetBUhshVQENTNtarr6vAir79j+lnDOgq84QMU0exBvcfVIMoILBw2aC7rMQJpq2M6oGSCbxE8nWbCeGE7NWa+pHNe148IFHLrXD+VwGAd6/Aw2vfqaj2U9GCwC54uw+dvqfBZlWV9XentN0FNAGhwEMtsrub/e9Oaro5R1xRUapd1igb8ZwoagvbQ7gWWverXkTcj7m+vmacjjvVqUILusQHG1EoJrQSm503tzA2Bry4OcoYm2rryf8QtrHPtlZlYSfEdTsIM61f37baZY/kBpUiwL9nw4REo5cz7uoaORUklYsYNkFMltOVVbrnyXBVzCCl8djLFUV9y3KNDWf9lyAaqR1OMX9eQDpG3JSbiIQhG76/SbL13u+hda2xGYpCO4sJQq/WTi0F0f+1OsuZzUYsFCuNv+8fX7M0oWYK/rCM02A40f1z1rOjiGD+6na0z7jaRqs4A8Ip8oOGOe3GCi5PX2tMnbltCD6mmwDp4L9vsMcvyQ9rP001acnykekcHZr8gC9/URAertOynHbTUsA9s7NUj++5cFAEKSQxl3nGcjOW9w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(30052699003)(23010399003)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OkIFIyDEBUH/J7FlVdAAi9pRR7ykpq4aUr1xeThir7w0HvTQqWRs91j6K22jYU4upkT9iNubKn5rrtK3HEm6RfvEmDfnwR3xB+b8lJYRo48Os9FGx2+w97C2YCfxKKjqqUWw8HayGFuF0bV+WgYrPzznl7acIxkNP4wtwb3BtKreRAZMz82YWOwkX1REIFEyQKnBAbeFSOTkTCGnpPIP+wP/57FaNuHg/rSdVjBQe8Ico/luYhA5c4Lv9ld82WS2WPojWPgs+2Y7UuLxLxuJY7n7/pJUrpeW5SWl3vNA6VdiR/vW+Z6ABHUQsHNzzs/miknxUQ+WDN4P480TmEi9Smq47jadkTFXW16bG+PZdw48tb9TUeuIRECLdO+jir0gTAhrINoPoFkpUwDQ9kysr5R3MQKUX1EU72sMPPn2U1LQopSO/VTGzEwSUVIImBHe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 14:59:05.7902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e77fe7-6feb-48b9-b56f-08deddca9f50
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999094

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
 drivers/remoteproc/Kconfig          |   9 ++
 drivers/remoteproc/Makefile         |   1 +
 drivers/remoteproc/amd_bram_rproc.c | 213 ++++++++++++++++++++++++++++
 3 files changed, 223 insertions(+)
 create mode 100644 drivers/remoteproc/amd_bram_rproc.c

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
index 1c7598b8475d..9af895fff06e 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -11,6 +11,7 @@ remoteproc-y				+= remoteproc_sysfs.o
 remoteproc-y				+= remoteproc_virtio.o
 remoteproc-y				+= remoteproc_elf_loader.o
 obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
+obj-$(CONFIG_AMD_MBV_BRAM_REMOTEPROC)	+= amd_bram_rproc.o
 obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
 obj-$(CONFIG_IMX_DSP_REMOTEPROC)	+= imx_dsp_rproc.o
 obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
diff --git a/drivers/remoteproc/amd_bram_rproc.c b/drivers/remoteproc/amd_bram_rproc.c
new file mode 100644
index 000000000000..e4a103cf8455
--- /dev/null
+++ b/drivers/remoteproc/amd_bram_rproc.c
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

