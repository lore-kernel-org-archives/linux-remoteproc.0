Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011066.outbound.protection.outlook.com [40.93.194.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E98445106D;
	Tue, 28 Apr 2026 14:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777386422; cv=fail; b=e2AS2tbjWVH9WxJeStCQGTnHd55r1+cY/ehLjCDfmWE0/V8rvQiZoY0CqLUX2+2A3rHCs3gujCGQqVEn1v6gxvOijQwgEkDmJwiZhYitNg448HcsDnGIv4BEmQeFB/ktrQWS/iq1F9IcZ+B5F02G8CtOpVE+Il1MU4C3F29kpQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777386422; c=relaxed/simple;
	bh=05wVKD2Tawt8hAL4qGkQn1zm/0I5UTPgcMV6tQMdR0M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c4jB+9ISf6S4nLO4tAjNpqJpjsul4c+2x+FJqTw3k0S/UZejP0YW3oA0VotQDgFvxUBaLlwqw4yXn73pxDo9YmBnCe1+t89L04dpCMvyZXjecIg8kgj0p3vgGPxnd6z+K3RuV8kuaykjO2sdobudr91FpY3oOj2SiA/oI8cjktE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=I+rfeYpj; arc=fail smtp.client-ip=40.93.194.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="I+rfeYpj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m5khu7On5q5ANr+IC8FrLo5THSmRpCjR5SnfrsVE2Y5lSYjCne/vIFztUc1dJNOIjKMMpv87lYm/wVCH9cik6C56VZthk+tZ9+NYmX4xIzqqlM7pPh2xe0OLM1J0qYlpVFqVsSUJYZPF4rJC200EkQGmB8riww8O6OJiDvRpAqOvb8Mo2L/SkVJJZNqWCwfYXf2dbO5/W5FhZqvS79Xr6J3iPfG/9XHJQdBVXDxIRX/+jb2rpFdDr87eFar4m2mt0NfkwsK+mrnHgbQECdLkQaqJygfwyntDacaM94rMXVfB89dQB2wNTYBLa6Jmv4HegGyJsYUA1zKJbvUJAjjMsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xq1owTR0YIvt1lozGfP3lD+tOElweGclZJYuMUOkbdo=;
 b=BtyGGOJmnRv/NHddCC+wfGY0ZOFcCRJrjVJXyITNYWaJWqQMCOY2z0IQoa1lnIbMDigJ62bkng09YJVDPbO5GlMhJJKgAUTKvsqHJZBFFpajiZwfnIgwf0NjV/xF79gBRQjvlrd/X3TFvgyxl0X3ZgGmybePojmtmSrhWvWDssLRMR9aQtG+mG1ETZ1OBqkqcXbOj0LNP19TmjARQNJXGffSISad51VusgJVygRipbnF5lXh9fiW+jnzPOcOf43AckAEjDNglLdG/BW+7T1Op4/RdvQr/rJTLIWqqR0IlhFnCqZLPPnAU2Sc2EoIxn5BNurZZsnC+c967vTz+MHhLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xq1owTR0YIvt1lozGfP3lD+tOElweGclZJYuMUOkbdo=;
 b=I+rfeYpj9Cb8bURf8xB8FJ9yAQm0m7RO+Xwmg5dX3aRCftJHRXBBVp35A7mXIemip4c33k66Gs1oa/XObckVUKhQD8B2IYhVAsg1wAIKbyKSCtpPqfZQtZ40mmI+k4vr5zS9mlfP0peYQmb9qkVk4oG3Pw/XTzDXF4F1MXmeZh4=
Received: from BN0PR03CA0057.namprd03.prod.outlook.com (2603:10b6:408:e7::32)
 by DM4PR12MB6567.namprd12.prod.outlook.com (2603:10b6:8:8e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Tue, 28 Apr
 2026 14:26:37 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:408:e7:cafe::cd) by BN0PR03CA0057.outlook.office365.com
 (2603:10b6:408:e7::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.29 via Frontend Transport; Tue,
 28 Apr 2026 14:26:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 14:26:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 28 Apr
 2026 09:26:36 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Apr
 2026 09:26:36 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 28 Apr 2026 09:26:35 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <michal.simek@amd.com>,
	<tanmay.shah@amd.com>
Subject: [PATCH v3 2/2] remoteproc: add AMD BRAM-based remote processor driver
Date: Tue, 28 Apr 2026 07:26:33 -0700
Message-ID: <20260428142633.1854251-3-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260428142633.1854251-1-ben.levinsky@amd.com>
References: <20260428142633.1854251-1-ben.levinsky@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ben.levinsky@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|DM4PR12MB6567:EE_
X-MS-Office365-Filtering-Correlation-Id: c23fa878-4c6e-4f60-a315-08dea53227dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	L15QvD/5RRBJGI/pGasujW7pZ6MOU+qhIscSJROgPel4Js4xfZXqmVKGxC0HFe64i7wHZRVLihn2lXY5bInHH2TcGC7HmEyJP2Kx1F7SgEbNzkP/1N18kSCv4sVQtknP9Wn9uV5Ei0LDoc3qFTHQqdYiDGm3aJolZuwY1EcOjGxT+MnWPCLAezzCO/2T6YLfXpTOLbKzxbKySBIcDyz8fUcdKeSSAcgPpqWA0zvP1obaXrtPD67GMS6OiHSA3piKhoIlt4o3qGatTM8DNVIFUj0d/72GVe6PZAtuY4V2iv1mfDRGL1voRstIN22+D85vpqj/0CzV/RXDqo78GvvQqj0GyNbKxEkBZd0w2Bx+i2Wea05t7Vf8jo+Ze6y/lgjhz5kbXbBzTmnyWCLh1MaiQ9pfuQfB3SCKZzo1ajMIxAEjjOw+vxVeJ1m+2D5AQsoJVgLtuD++k1JKw3UG44CE/7GfoaZQY0Pg8hT5QzWkf53wWbcLv/lgJytW7/NvT8bvycIx3yk/7uiN1jDt97c17hO/RWGVHxLGbal48sglH7xda5sXVhBqfjBtRSaG4Oim1vybc1VlyAxzcvAMo9qMuT8sBwnOTpBOXEfqU/30GJHJMDKoRAcXrcFiJvnxT5UGop4fOtpX7HM2n9OiXyzU2G0Powa42TPiz8daxET8zWQMTdOFoZ0J+hI9yDWx0JRoPgvE06SRgy2tfzgu4fxip8CgsUgY+XyS1q8b+Mj50osinnhgNS4IAa4LmSj67bVcrs9cwx8999YMVLGhri+gxw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WSL2H/pQUXMADWKB3SBLzqoGvsY6DzYggHVv8ef6L00mF9LYI8unW23iU2rVf+ktHLqW3Cjg3mWtg2nXUwTcP/d8SaXimlADv6HdXgF3ZefMUzmeVKQ1TXvurf0svShHoNVNFguGwMhi6B0meJmKkb7tdLlWstyIdAluKv4Lzf2ZVMuRSGS9+7F0cAyyscc3LY2YcsbogSLHZzYoODGSzQ3AN2VFNvXcE56pRSwPS5lg7BWMfnqjZsGKnc50FrgNzUY/8WNH1CsPNI4QZ6RVNwlozhMkQChIyDorSmelneZ60Rx2JRt3XPvx44ECdIs0WowKzMu0m8s7IddnKYkKtN1UhLhWKkmWEwaxyub/ZAMaRAWVpKqiznWYzknJVl4LAVTWkpVf6cuKWncnx+AQlMKpsV0/JAB56cVCbLEnUOrlweWaLhldAqp7mkZFQ9dP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 14:26:36.8540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c23fa878-4c6e-4f60-a315-08dea53227dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6567

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
 MAINTAINERS                         |   7 +
 drivers/remoteproc/Kconfig          |  14 ++
 drivers/remoteproc/Makefile         |   1 +
 drivers/remoteproc/amd_bram_rproc.c | 243 ++++++++++++++++++++++++++++
 4 files changed, 265 insertions(+)
 create mode 100644 drivers/remoteproc/amd_bram_rproc.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c871acf2179c..172539971950 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1037,6 +1037,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/w1/amd,axi-1wire-host.yaml
 F:	drivers/w1/masters/amd_axi_w1.c
 
+AMD BRAM REMOTEPROC DRIVER
+M:	Ben Levinsky <ben.levinsky@amd.com>
+L:	linux-remoteproc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
+F:	drivers/remoteproc/amd_bram_rproc.c
+
 AMD CDX BUS DRIVER
 M:	Nipun Gupta <nipun.gupta@amd.com>
 M:	Nikhil Agarwal <nikhil.agarwal@amd.com>
diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index ee54436fea5a..9a2a887ede8a 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -23,6 +23,20 @@ config REMOTEPROC_CDEV
 
 	  It's safe to say N if you don't want to use this interface.
 
+config AMD_BRAM_REMOTEPROC
+	tristate "AMD BRAM-based remoteproc support"
+	depends on OF && COMMON_CLK && (GPIOLIB || COMPILE_TEST)
+	help
+	  Say y or m here to support a BRAM-based remote processor managed
+	  through the remoteproc framework.
+
+	  This driver matches designs where executable firmware memory is
+	  described in the BRAM-local address space and translated to
+	  the system physical address space with standard devicetree address
+	  translation.
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
index 000000000000..9383964b6046
--- /dev/null
+++ b/drivers/remoteproc/amd_bram_rproc.c
@@ -0,0 +1,243 @@
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
+#include <linux/io.h>
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
+static int amd_bram_rproc_mem_map(struct rproc *rproc,
+				  struct rproc_mem_entry *mem)
+{
+	void __iomem *va;
+
+	va = ioremap_wc(mem->dma, mem->len);
+	if (!va)
+		return -ENOMEM;
+
+	mem->va = (__force void *)va;
+	mem->is_iomem = true;
+
+	return 0;
+}
+
+static int amd_bram_rproc_mem_unmap(struct rproc *rproc,
+				    struct rproc_mem_entry *mem)
+{
+	iounmap((void __iomem *)mem->va);
+
+	return 0;
+}
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
+				   (size_t)size, da,
+				   amd_bram_rproc_mem_map,
+				   amd_bram_rproc_mem_unmap,
+				   dev_name(priv->dev));
+	if (!mem)
+		return -ENOMEM;
+
+	rproc_add_carveout(rproc, mem);
+	rproc_coredump_add_segment(rproc, da, (size_t)size);
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
+	int ret;
+
+	ret = rproc_elf_load_rsc_table(rproc, fw);
+	if (ret == -EINVAL) {
+		dev_dbg(&rproc->dev, "no resource table found\n");
+		return 0;
+	}
+
+	return ret;
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

