Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010061.outbound.protection.outlook.com [52.101.201.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C86C3A75BB;
	Mon, 27 Apr 2026 16:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777307249; cv=fail; b=Szw309JMeU/RcL+PM24eUP7VV+/oiRRPSbrq5DbI3ts+WT/LIKS1EK6O3pU+ya3Z2qYOWfBQvavZ7hgb2zeoRYoHLciKVKxkAxmbS7m25UXHmjE0e7P4S1HKCr/RMcXn4BQM+fc5iz1WXJ4uerjkEHDzAr/MlUPgIxOdtdGnjuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777307249; c=relaxed/simple;
	bh=cfyVsswlRl2w+9lNQDO7oN7NUC3yTVDhXVyAEI4kfQw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gjD5xr+y32OMzaFXEZRIC6y1w1jejfKLYzxJeIRI+k6Ew/CDhhhkjgmboKSnYsL1ETo7tis+nIdG72Z40HOZvZsVeBfnkhvI5YUPef6G7cJadDaxke+eKu0+kOadAG4xxtFoN9l1bnegH6R56Fc7yNdH9X3GfdSSwPAgGBgOCJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3QFwlV+b; arc=fail smtp.client-ip=52.101.201.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3QFwlV+b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LpzX+GZkF5Ptdaz9wIXsa3Cioh0ho9JAo1kPG8/jwlOZ7Wl9KZS6mlSMG9UQ1aua+yehk1NkAlI7cmE3BvXk/tnhNyWfPdJ78PviNInX8+bn3nRBI4jmrR9ssWRrMnuHfzcZIIT5SZIaBZHeTd5IHcT8457WZku5En+achbk4i7k/25BvNEh93oHG+cQL8VI3ItXJh6A8SAwyFmuFeDXgt6b77rJCNgmzcH/ZvRhJeeBY6vwrNa2e/1IQvUZncqf+6WoCSdFQwbVeozVwlqdoxEkJG8kx+f+WHYJ8Ybjt47TYNqvRzzj9tbwi+lcTsB8t6j/ttxjfIMapt6Q/FKZmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVnL8hFNETBRO2zgn3n1hUXK1AMH68s77ynzaZoOt+4=;
 b=IHbwvevzQHsZCCaVSr3+SJRetX0v8ZSy2ruCf89GikhKEt9/33jLp7MXwb0FU4vi3rOvJOIfBaiL1fe7dddxnvsq+DY0S/0d+vM/XviUs3CJMsly6/FiLmQxUhL6BSojSrlpWTW0GT5oX5qs3CBy9paB4N33MUsjCUURe4WP1eFJD9jKNF1uD2npkCjEvf3CHCX4wnjieCmLK3J5Vhnm7s/DbwPKdRTxguHXyTEpwyoyFfIK2LbOAdkhDfqw/cMOlJFubyclAaT1wB89WSBrCNa5esjOiFZaEAqV2VG7hu7RohkcGt85jD/DqnkVlP1MlAk/+W7zf7Y0r6SVSfs3qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVnL8hFNETBRO2zgn3n1hUXK1AMH68s77ynzaZoOt+4=;
 b=3QFwlV+bhQVw4bEwA4CDothvtX1WdV/t/S7RCgKILFTkcA6bdFrfvgmnRYUtwf/g+awTNu7q6OSKV/9RP5W1Q6nu+VyEFx5+4Yc/h13RlkLr8nWKCv5AUwPCCuwlynO+36mSOCXbZLM7NbNRqWLlhgYuhQGH1YUJdyGCk0BMu0E=
Received: from BL1PR13CA0155.namprd13.prod.outlook.com (2603:10b6:208:2bd::10)
 by DS0PR12MB8813.namprd12.prod.outlook.com (2603:10b6:8:14e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 16:27:11 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:208:2bd:cafe::7a) by BL1PR13CA0155.outlook.office365.com
 (2603:10b6:208:2bd::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 16:27:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 16:27:11 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 27 Apr
 2026 11:27:10 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 27 Apr 2026 11:27:09 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <michal.simek@amd.com>, <tanmay.shah@amd.com>, <ben.levinsky@amd.com>
Subject: [PATCH v2 2/2] remoteproc: add AMD BRAM-based remote processor driver
Date: Mon, 27 Apr 2026 09:27:03 -0700
Message-ID: <20260427162703.1644103-3-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427162703.1644103-1-ben.levinsky@amd.com>
References: <20260427162703.1644103-1-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|DS0PR12MB8813:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ce62062-6101-4d0a-0928-08dea479d576
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1TUvTDtsiM7tlLXiGq+HRElmKEX0rYq63oOWSiNbo0VoRF9vnSnOjxKFVT2dG2LAE1UiEHubXifJWOD94+sUIA97PKGY1bzjp3hPr3JuAbywvxX63ENFhE/YJMkk/drEVLayXJmEdrqvtkAumX+jsuVAsfLUEMlZpyL1IobuvB8bVH4ufcyKLsuDzvJXmS1uPZ6uoiJFkTaY547E4sd+4MVczvrPZ5p8QYLtCa+uXrtUAuY+Cvh7gIzt/txissse5by23P6GQifKIyfI3AOXo1PHzRQbNK4s0IUhDlBi5vdlOkdCb4Drd5mL0zBVtWjOFVUBrCn4W5dOodvgohZUtczmowpv1ILv3ohMouJN8wvg/U69LsBjQ2BrMIqyJ5guThoB6KewdHHR31Is4Bgo8dFGtJ/FChDnCoro/el1BYzRDkL47KFFUpaw0x1wyV8tR7YryGeZmQH+lcHY2kZ9CSo/FhYboA12wfO/yD+N3ZHYhkJ5VEK2+LTFdFWpfi7d1qlPEL2JURmxx8WLwZdlovbgkSfArUwWt1fgw57YiS1e3ySDk6cyzPXnit2NyVOcVnxmQ77AXWhicCdo6LQCeJTy4Ie3RnZYj7RIl9LtLMBS1XJPE5GNgTgTHZshZw1heWcS19FiUYtGdo1V7yYq8lJjvu8CXMYHd0C7hE5+nAK0IgG3PL46xaS9gl3Ypf18Fl8ZeC9hGpZJyxYHs1uYFsi9s2CKZaAfTRYNG2QYzkK+Vm/PHMcBembz2F8zUv4Ptf8ln0k/fRp396+qFkbT8g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1nOc+W/q2MqWxk00pUPBGHvF+fNW9xJJDG8r+W4YrBhwFKy/ezczxQ4s59ZnVf9xOPX19j26RyTLIeUQDt0/4iUnb4QTUYMNwz7cT4mF61tJye7/8/yEgvsQ74TRnmnUc7OdL6ye78ew0Cn1J/MOGlcS/NUnSb96en5Aj/0kwB3v5zeX0S/A/We9vV0sbkfLz5shh1cdQCdVHP6E8MlUx3fYYPn7lzUmoCaYmm+eAS9eVitTT3CxmYjo/gEuusPOJmznz5ua05Pp99nmsPW/DTdB2mpn07UvV/nTgyByrssaZoL7UaOm15YqP9V9wOum6Ss7/bmpAoCHj6sN5D6iBTjaiLg6oDH5OYASR4WWaXVrPDIQ4oL9lKnAO7m8egS7mqfqbrBm1eRRznbcQN6Bw2T1IWZSoxRK4eedc+kjERDnL5v5NH4z38aZ4DMrss3g
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 16:27:11.2041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce62062-6101-4d0a-0928-08dea479d576
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8813

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

The firmware-name property is optional, allowing the firmware image to
be assigned later. Firmware images without a resource table are also
accepted.

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
index 000000000000..aa346b80e84c
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
+	{ .compatible = "amd,bram-rproc" },
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
