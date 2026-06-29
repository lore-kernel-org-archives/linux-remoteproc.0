Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010005.outbound.protection.outlook.com [52.101.85.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28404390CBF;
	Mon, 29 Jun 2026 16:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782751224; cv=fail; b=dapyl3GsuZa9OfYvvU2eO+elbB/ngW9JPYAI9obAkOFD9NBeiKgV1l3CSaYthQEbj4slXbEcH+NDWvHhpii8JNNV6fqta4BtAY9hmRJ3smIWynw9hpnSSSAtlgnqmfqd7Jm81HeKqmdqyKGHGARhMvHjgb3B7Rs2sYZWdZOpCps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782751224; c=relaxed/simple;
	bh=fq1lMJyjvGDa55Kp5eUB4tRd4vcBGpHs7/nLAm1rKR8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iIgG7bLkyDpSZ5JBFun/uyHrYkiT9gVdxV5DWuzPvfStX+8leVuSXZKuZAQ1fj+u5OBbeRHM5VP72eGgnvBCAvePBTEECQDsCdG8RpaplgUAFSDn88apE8aP9Jxzzt2TN/sW4Y8om83fY5ock6g+A12MPf57UwyaylFalirmNrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rEv5EANU; arc=fail smtp.client-ip=52.101.85.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rEv5EANU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZLPL7AE+bHGt10/OdOG0SqndK2pzUkU3GtBGFNMtMYOOWg4f6F/itCaBF4+qpMjoRGAW7/2zf+W77akc0helNOsQhn00oarBBPoEcWrmd1olkz1K41Fu+h7G2NKrlhUk9J8xVgORUdvo2IFZ1916XMfIEYWQDSDUuxeHRSOq9XguFrdmvDC/6GCAXz9AFgeYMne+Cq7hd6PE+QTfsKbfpjncFSoddMbuRtfWyyx4P9gJ6dnVt9+kgYcpUJdzT6JmMgWA0G6FVdqKcQ/f6UnOvTn0B3e2nyI68FlUbs4tzwoZs8f9fACsJulwZuqd3zDJ4e8GBwYS/nEqXSp00azSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZJyVdL/IW4s/7PpaNQRnnSnrqA+CA3sBTX5K8rTjPQ=;
 b=XNBDsXk+Rkca1AtDC9qiBBriw2/UA4wJuN2O3hPLRrkSg2anZD1CEzfT/vphgm18rZFGjot7RY7topX0Vp3GmG1EGXqk1AoUtwZcLB13hk9DIJ+ga5BODel8CA8i4DWEZuR5RwbWav1BaS2ukU5oJpKSEbTH0URah3qSUsf4gTxc2tJfKWo5dJZzxvuNDQ9P1PHtqPyIxUaPla381Fn45ZkgmZueunUqpXzWi7xeAcMyqM/gg+emIL/AsF14lM8D5JqhjKXMW5rq8AVdn4gjCDCb8WdvZlHICk6hcE3lcXyofOFkmDSsys2fgGN42kt8LKyyerG5no0oghHugRrpQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZJyVdL/IW4s/7PpaNQRnnSnrqA+CA3sBTX5K8rTjPQ=;
 b=rEv5EANUzWxj3yVqbs0tMqJEW9b3ggJ0Tb2mUD+Z+ytM/tGP3ZJR6jkB16WL+GIWR7FQmVJILVGFkIC1jLv78+nRgOhtO3U1nxdvE///hULT6BEkfIITuwmYcKyLsITGTS4UE8ml5DWICtz+tYp3+YDSg1QPo6cHFxzFrx85KC8=
Received: from BN9PR03CA0038.namprd03.prod.outlook.com (2603:10b6:408:fb::13)
 by LV3PR12MB9403.namprd12.prod.outlook.com (2603:10b6:408:217::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 16:40:10 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:fb:cafe::22) by BN9PR03CA0038.outlook.office365.com
 (2603:10b6:408:fb::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 16:40:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.202.0 via Frontend Transport; Mon, 29 Jun 2026 16:40:10 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 11:40:05 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 29 Jun 2026 11:40:05 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ben.levinsky@amd.com>, <tanmay.shah@amd.com>, <michal.simek@amd.com>
Subject: [PATCH v4 2/2] remoteproc: add AMD BRAM-based remote processor driver
Date: Mon, 29 Jun 2026 09:40:03 -0700
Message-ID: <20260629164003.3940208-3-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629164003.3940208-1-ben.levinsky@amd.com>
References: <20260629164003.3940208-1-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|LV3PR12MB9403:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f81257d-a216-4c13-f0b4-08ded5fd15c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|30052699003|56012099006|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	NwKWHVHBlwjy9/gd9Q/H0sRMcoZ38ahLjodZA/1oqQpSzGyompTUo6y9gcmLn3XMBhv4JESvWNOFWbKI60N2reEIm9fsqtfYN3qTiFMLeMGGq4YTCCvvwPdHPIGCmMm1vBrzAoDOEE5CGREmnqwtpcex1AYgdd2gz3B4qWN1/wfEr5XM+ELBU7e6dXAfboWeE3e5n1N6lZ4lXLP15qdFxsjQU66+CXFAN5Tgyr7Eacl2Q0A+uV6WvRwVkOFgejirLGz/rzo64KqJV3TBU+ZqiYYArh6cEG0PebMKkD51rhcnJMuTLz3vFSAbEJW3GX2n9ov+Zyvl96dBw7XidLCdmKIJ3I51nvkUISbJdPV5bJVd8jZ3ctDsL3tWcTOnMytX4aGjQ4vktGiacloyt5DEotXxLGPHH6Rv0fB8d5z4uzpGJm4itlN22kMhIVe2icl+Xa5eyPlHqSZik3BVQNg5dz+o0vKiAP8PCyQ0yk0rn33+SEOHWKNLPee7JyB5glXylR4OhbuCefUd9SHpBmi7uf0rygOuxUwRP6aIeB1vQTAxHAw3Nn6LIey1S4gFxiFCorcMSxPjRYx34B+X8HGgkzUSMGzNDzdb0Cx7DvQ4ji4mdSaL3P1x8MpkZ+Z5micLKIvb29FailUJTMvqEuhoeaCMasKs+PoKSQQdzjLBLNJwxLM9Mft8zjFM7Bnbc0iOkU6aYNRlLYT/8VF/T+vciw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(30052699003)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cplAaFruLH3CfdqvOSBl4/uIkNbvpZZcPLT/v+RXyVexrqDt57/Y7C5/B+NEAAvvw7otvDfNe5L9a3YVpHxGnpPqdlKw88w8wyVRa3+vM8UICrfDspNqXd2MmZDtzuVOSx0x5uRxFbyWu5YLcswmJ0m+yHqzfI/x+aniki3QdoGZD8wzgUVxnnrpZd2nIvjd+2GN8XHP6jAONaOIKg4oUA/2nKtUJLbLJobYO3vjUBkqAt4ychQkXF8geUM8u6qPYbYzY37A/UTe7zpR8507gAFnOGmkJFw7QJtbgtlYFStS5RL7YMppR7JObeEpgi63Yz99Tl1GpJQsa38Q417EwbvFkiANw5A6moFP/8KkUUGAi50SQUeTDcaSx3p8+eTDN7eMDSLvsyazaeZFoUNhxf4/c2buKQCdU7iDzO6jkVGMPFfWl1eHM8fwHJSo5Wfg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 16:40:10.1497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f81257d-a216-4c13-f0b4-08ded5fd15c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9403

Add a remoteproc driver for AMD soft-core processor subsystems
instantiated in programmable logic and using dual-port BRAM for
firmware storage and execution.

The driver parses the firmware memory window from the remoteproc device
node's reg property, interprets that address and size in the
processor-local address space, and then uses standard devicetree
address translation through the parent bus ranges property to obtain
the corresponding Linux-visible system physical address.

The resulting translated region is registered as the executable
remoteproc carveout and coredump segment.

The processor is controlled through an active-low reset GPIO and a
subsystem clock. The clock is enabled before reset is released, and the
processor is kept in reset until firmware loading completes.

The firmware-name property is optional, allowing firmware to be
assigned later through the remoteproc framework. Firmware images
without a resource table are also accepted.

Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 drivers/remoteproc/Kconfig          |  11 ++
 drivers/remoteproc/Makefile         |   1 +
 drivers/remoteproc/amd_bram_rproc.c | 213 ++++++++++++++++++++++++++++
 3 files changed, 225 insertions(+)
 create mode 100644 drivers/remoteproc/amd_bram_rproc.c

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index c521c744e7db..58fa566b609f 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -23,6 +23,17 @@ config REMOTEPROC_CDEV
 
 	  It's safe to say N if you don't want to use this interface.
 
+config AMD_BRAM_REMOTEPROC
+	tristate "AMD BRAM-based remoteproc support"
+	depends on OF && COMMON_CLK && (GPIOLIB || COMPILE_TEST)
+	help
+	  Say y or m here to support a BRAM-based remote processor managed
+	  through the remoteproc framework.
+
+	  The processor is controlled through a reset GPIO and clock.
+
+	  If unsure, say N.
+
 config IMX_REMOTEPROC
 	tristate "i.MX remoteproc support"
 	depends on ARCH_MXC
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 1c7598b8475d..5c39664b50c3 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -11,6 +11,7 @@ remoteproc-y				+= remoteproc_sysfs.o
 remoteproc-y				+= remoteproc_virtio.o
 remoteproc-y				+= remoteproc_elf_loader.o
 obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
+obj-$(CONFIG_AMD_BRAM_REMOTEPROC)	+= amd_bram_rproc.o
 obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
 obj-$(CONFIG_IMX_DSP_REMOTEPROC)	+= imx_dsp_rproc.o
 obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
diff --git a/drivers/remoteproc/amd_bram_rproc.c b/drivers/remoteproc/amd_bram_rproc.c
new file mode 100644
index 000000000000..a595875f9ce8
--- /dev/null
+++ b/drivers/remoteproc/amd_bram_rproc.c
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD BRAM-based Remote Processor driver
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
+ * struct amd_bram_rproc - AMD BRAM-based remoteproc private data
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
+MODULE_DESCRIPTION("AMD BRAM-based Remote Processor driver");
+MODULE_AUTHOR("Ben Levinsky <ben.levinsky@amd.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1

