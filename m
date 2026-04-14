Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011032.outbound.protection.outlook.com [52.101.62.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15063E63AD;
	Tue, 14 Apr 2026 16:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776183373; cv=fail; b=qfyTZ7CJhooIN8CxxbyPZH3RP/UkBX45WEMurAIN2S6kfO+UJ2DGKp4PYglqY1IGxkYGrX+sAzI0MyMbhMA4dvIJjbV/BNRQS9RzsuNeQcBfroQX7clHjFIqyJTDv6vLq/Ygsyl37UHUGCGJKEMqI94YVA0sJ3YLF3eQzsht1jM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776183373; c=relaxed/simple;
	bh=PRXSk+kJXiHrCec4j8C1buZ4X2gvycnQ4pEbPsw3ApQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ON2YLvPhZ/VuqfWMS1j69xjThKyml3AB7Xw47zV9PCU79Tk/PIJyRFej22ft7j7ZWG5lLO6931O6479N9nLn+AkM/qxrzFPEEK3tkpKH3+kwYP4OMVOWMtLhkAZ2Ske84Sedgn6UV6F9jOaexAfFsXeNY3turKTutup9F5G4ZJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mqgfvFzO; arc=fail smtp.client-ip=52.101.62.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mqgfvFzO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gsevyQfe6OAZLUD9fHbK0K6HQAvz3lRLbT6JBYXag84OQqPZ9q36cKFxc5uXYcT1eKJEYdQG8ZuG1Gy/D+HnSnI6qmfzPKs79ZdVbYofwHWDP2XNPky69MLZc8KBJLY2OQWUBx/4pSOR+62akFRhzZ/R/2J+1Mga5XqRYX8DuBQnJ0mv8rOVEsVvMUcfaZSjhN1CF7dZil5rPcy0PMBwyQxi4YU9ucYYNbf33NySvXijUJDsiEny0Chg0RDMnA8Fhr2U0Q295oy+1WG6ftUYYB//vTO9pCcDuaOMdTbReqYfIKR1FtuyAME7MJyqp3DO76/ASCEssz7zdAA/fKrG3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QER+hKTxe1dKMXg5T5Xsh14JHCDrXEMPdySKEMTp7Zw=;
 b=vtn4r32GEpe1AYa/X5J3oEYqPxZz4Kts4B/POPf3hM2dgM5Coa1ORZ3uyZud5RtUpj90bqcmEyVmZzi97tHUeCeY9cHv6764BteWaIxn7LcHt1kjfy21CGbnkOPvWKX0+/H6IoN4UVPhN62fGr0gOyVzsWmvM16rxelLwHt0xQgqmy5TgFAIjUcuqxBG1BmX8j3TAiFGzoKyhJ1tmxuvfktEXnBD6BA6M4XG92FDfDm4tYANn03vAC8XBiG9HDBOmG0vx6xRYjs/01YAl2aXipr1XY6NWYoxad1Fi7gF39ZgCbJ2PMqf1cFndb9HpUdE6YbAPDcuZz30tuau8qybdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QER+hKTxe1dKMXg5T5Xsh14JHCDrXEMPdySKEMTp7Zw=;
 b=mqgfvFzOnZvrimYXS2Dm3bNKErwCouo+JjPhgfUnq3/yZm3qA7JYatOInIHJco+pl3I+BWmlONtBfFbTtu63blA6ZJqUtlWpQC4siOO7N2VfxHrAJhn76XKaQxWYGXIRsz+esbEbCOxXNFmiZOB4ukFjovAKo09ovYwqpyFU6co=
Received: from BLAPR03CA0087.namprd03.prod.outlook.com (2603:10b6:208:329::32)
 by LV3PR12MB9214.namprd12.prod.outlook.com (2603:10b6:408:1a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 16:16:07 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:208:329:cafe::49) by BLAPR03CA0087.outlook.office365.com
 (2603:10b6:208:329::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 16:16:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 16:16:07 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 14 Apr
 2026 11:16:01 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 14 Apr 2026 11:16:00 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <ben.levinsky@amd.com>,
	<tanmay.shah@amd.com>, <michal.simek@amd.com>
Subject: [PATCH 2/2] remoteproc: add AMD MicroBlaze driver
Date: Tue, 14 Apr 2026 09:15:58 -0700
Message-ID: <20260414161558.2579920-3-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260414161558.2579920-1-ben.levinsky@amd.com>
References: <20260414161558.2579920-1-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|LV3PR12MB9214:EE_
X-MS-Office365-Filtering-Correlation-Id: 39623a9f-7826-42d0-a6bb-08de9a412273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	LKgTK9A65k7U8tIbrd308R5phntylQhJZDg73rLGST3WFisFA0bkbrY4irHWrDRud2ocbHZRq04QeQ/xVISKZbjDxvyibaiLJT8WGsVpVpHYGaVrjbO27J3biLkRiGZf8OOFPSk7zVJ4zJahcMYQlYJwyKZ64tUgs+qXEmNNeUzTYbbLwBcuEiCgKMkKQTvwV7qiLm6vVDeQiw/PI2FnXi0kkLGl0dBePAgGOl10yzL1oG2Lg6A9aZiPl+5w8RUhSg2Qpoql0898hM/DoWX3YqTeVufie5/Rwigr1EvG5fjI2GNHIIrOjjcHe3ZHqjUIjQJ+QdvcFdt4iflACrqq2pIlZKM0jrO76PSL3Uc4kTrBD/BlB2kIwou/mf4TOmBDC0Te/8CYHZ1s/z+Aah32v1kLrOCEPdoaNs59XwubV/BhinjuDC6AfL8z6mq9fV0gMYIybOFX3riYdK5tnkUmrmqfrkEEpwF0++A2ng/ZhTHOW+b0yqFaIHcZxkNn0Ow7Q6GR4q01KyAVml8Evbm9sh9OEubxPywdZH8HoMjJQX4dlDQ6dVMYSKQHqWxQyweeyUVkoy7upZm5QGSVb36H+6pXGW7ikvshcPZWJk9Q8l8+2IQfJSKcWUMyee2cOB4x9A63epnoapbi1A3yeKJzt1lhrUjVoCqy7Rm2UPczK7s+o3S5qKnEOkkoWmZFddgf+3U3zopnepZFYsRAjL3n/xKbfv6UCvP8YvsVzKFklKfx/axzxWG9vmmnOpc+YmnYwmanwLAY4fwLYEZF/YHcCQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xAOsiV7EmhXrHjuAPnM8xQTDdNC09XCySRUSwtfXW3oEzNL2t3J9mddh3fo2CGpRdovZJhQNsjSWmRbBKSaQdXUMWdRGk8rsqeJnISEFjKMUAqY8jqxk1CaPckKe0+gtJ8E/BsNuJmKQQbzLKxDCSvSDts6/dOfqYKQbXsEpi8hxMWtG4mGNIarFlwaZbOHkmr+UoyFefzI8i5FvgHiPEeN9u2YKGp/rrquVLq9XJ/PhtsqXC2SlxKUYE7AD923grWMFuJs9Ufzu9gt1xDtXb1lKtUTwHb7+OJj70k4HkamRoqSsWBUdExXcgkFrwAaExOzQsNlNbLwwdqoyLEHyryOhc3byz7LYioE7tsYICWVZwbSWkGkfar6giyH2HtlOzujWI46nc/M3jYjI52hqcTMaGKgC+pr36O1Uaiir8gCcacRM+XfbrgbJ6zYpQVlM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 16:16:07.4287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39623a9f-7826-42d0-a6bb-08de9a412273
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9214

 Add an AMD MicroBlaze remoteproc driver.

 The driver parses the executable firmware memory window from
 the remoteproc device node's reg property, interprets that
 address and size in the MicroBlaze-local address space, and
 then uses standard devicetree address translation through the
 parent bus ranges property to obtain the corresponding
 Linux-visible system physical address.

 The resulting translated region is registered as the executable
 remoteproc carveout and coredump segment.

 The MicroBlaze is controlled through an active-low reset GPIO and kept in
 reset until firmware loading completes.

 The firmware-name property is optional, allowing firmware to be
 assigned later through the remoteproc framework.

Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 MAINTAINERS                               |   7 +
 drivers/remoteproc/Kconfig                |  15 ++
 drivers/remoteproc/Makefile               |   1 +
 drivers/remoteproc/amd_microblaze_rproc.c | 202 ++++++++++++++++++++++
 4 files changed, 225 insertions(+)
 create mode 100644 drivers/remoteproc/amd_microblaze_rproc.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a7e30df8ba5d..a70397b9ca71 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1172,6 +1172,13 @@ F:	drivers/gpu/drm/amd/include/vi_structs.h
 F:	include/uapi/linux/kfd_ioctl.h
 F:	include/uapi/linux/kfd_sysfs.h
 
+AMD MICROBLAZE REMOTEPROC DRIVER
+M:	Ben Levinsky <ben.levinsky@amd.com>
+L:	linux-remoteproc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/remoteproc/amd,microblaze.yaml
+F:	drivers/remoteproc/amd_microblaze_rproc.c
+
 AMD MP2 I2C DRIVER
 M:	Elie Morisse <syniurge@gmail.com>
 M:	Shyam Sundar S K <shyam-sundar.s-k@amd.com>
diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index ee54436fea5a..76de743241a7 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -23,6 +23,21 @@ config REMOTEPROC_CDEV
 
 	  It's safe to say N if you don't want to use this interface.
 
+config AMD_MICROBLAZE_REMOTEPROC
+	tristate "AMD MicroBlaze remoteproc support"
+	depends on OF
+	depends on GPIOLIB || COMPILE_TEST
+	help
+	  Say y or m here to support a MicroBlaze remote processor controlled
+	  by Linux through the remoteproc framework.
+
+	  This driver matches designs where executable firmware memory is
+	  described in the MicroBlaze-local address space and translated to
+	  the system physical address space with standard devicetree address
+	  translation.
+
+	  If unsure, say N.
+
 config IMX_REMOTEPROC
 	tristate "i.MX remoteproc support"
 	depends on ARCH_MXC
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 1c7598b8475d..8717a0aec2e6 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -11,6 +11,7 @@ remoteproc-y				+= remoteproc_sysfs.o
 remoteproc-y				+= remoteproc_virtio.o
 remoteproc-y				+= remoteproc_elf_loader.o
 obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
+obj-$(CONFIG_AMD_MICROBLAZE_REMOTEPROC)	+= amd_microblaze_rproc.o
 obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
 obj-$(CONFIG_IMX_DSP_REMOTEPROC)	+= imx_dsp_rproc.o
 obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
diff --git a/drivers/remoteproc/amd_microblaze_rproc.c b/drivers/remoteproc/amd_microblaze_rproc.c
new file mode 100644
index 000000000000..c664a70d246b
--- /dev/null
+++ b/drivers/remoteproc/amd_microblaze_rproc.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD MicroBlaze Remote Processor driver
+ *
+ * Copyright (C) 2026 Advanced Micro Devices, Inc.
+ *
+ * This driver supports a MicroBlaze remote processor managed by Linux
+ * through the remoteproc framework.
+ *
+ * The executable firmware memory is described in the MicroBlaze-local
+ * address space and translated to the Linux-visible system physical
+ * address with standard devicetree address translation.
+ *
+ */
+
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
+struct mb_rproc {
+	struct device *dev;
+	struct gpio_desc *reset;
+};
+
+static int mb_rproc_mem_region_map(struct rproc *rproc,
+				   struct rproc_mem_entry *mem)
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
+static int mb_rproc_mem_region_unmap(struct rproc *rproc,
+				     struct rproc_mem_entry *mem)
+{
+	iounmap((void __iomem *)mem->va);
+
+	return 0;
+}
+
+static int mb_rproc_prepare(struct rproc *rproc)
+{
+	struct mb_rproc *mb = rproc->priv;
+	struct rproc_mem_entry *mem;
+	struct resource res;
+	u64 da, size;
+	int ret;
+
+	ret = of_property_read_reg(mb->dev->of_node, 0, &da, &size);
+	if (ret) {
+		dev_err(mb->dev, "failed to parse executable memory reg\n");
+		return ret;
+	}
+
+	if (!size || size > U32_MAX) {
+		dev_err(mb->dev, "invalid executable memory size\n");
+		return -EINVAL;
+	}
+
+	ret = of_address_to_resource(mb->dev->of_node, 0, &res);
+	if (ret) {
+		dev_err(mb->dev, "failed to translate executable memory reg\n");
+		return ret;
+	}
+
+	mem = rproc_mem_entry_init(mb->dev, NULL, (dma_addr_t)res.start,
+				   (size_t)size, da,
+				   mb_rproc_mem_region_map,
+				   mb_rproc_mem_region_unmap,
+				   dev_name(mb->dev));
+	if (!mem)
+		return -ENOMEM;
+
+	rproc_add_carveout(rproc, mem);
+	rproc_coredump_add_segment(rproc, da, (size_t)size);
+
+	return 0;
+}
+
+static int mb_rproc_start(struct rproc *rproc)
+{
+	struct mb_rproc *mb = rproc->priv;
+
+	/* reset-gpios is declared active-low, so logical 0 releases reset */
+	gpiod_set_value_cansleep(mb->reset, 0);
+
+	return 0;
+}
+
+static int mb_rproc_stop(struct rproc *rproc)
+{
+	struct mb_rproc *mb = rproc->priv;
+
+	/* reset-gpios is declared active-low, so logical 1 asserts reset */
+	gpiod_set_value_cansleep(mb->reset, 1);
+
+	return 0;
+}
+
+static int mb_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
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
+static const struct rproc_ops mb_rproc_ops = {
+	.prepare	= mb_rproc_prepare,
+	.start		= mb_rproc_start,
+	.stop		= mb_rproc_stop,
+	.load		= rproc_elf_load_segments,
+	.sanity_check	= rproc_elf_sanity_check,
+	.get_boot_addr	= rproc_elf_get_boot_addr,
+	.parse_fw	= mb_rproc_parse_fw,
+};
+
+static int mb_rproc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mb_rproc *mb;
+	struct rproc *rproc;
+	const char *fw_name = NULL;
+	int ret;
+
+	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
+	if (ret < 0 && ret != -EINVAL)
+		return dev_err_probe(dev, ret,
+				     "failed to parse firmware-name property\n");
+
+	rproc = devm_rproc_alloc(dev, dev_name(dev), &mb_rproc_ops, fw_name,
+				 sizeof(*mb));
+	if (!rproc)
+		return -ENOMEM;
+
+	mb = rproc->priv;
+	mb->dev = dev;
+
+	/*
+	 * Keep the MicroBlaze in reset until remoteproc has finished loading
+	 * firmware into the executable memory window described by reg and
+	 * translated through the parent bus ranges property.
+	 */
+	mb->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(mb->reset))
+		return dev_err_probe(dev, PTR_ERR(mb->reset),
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
+	dev_dbg(dev, "MicroBlaze remoteproc registered\n");
+
+	return 0;
+}
+
+static const struct of_device_id mb_rproc_of_match[] = {
+	{ .compatible = "amd,microblaze" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, mb_rproc_of_match);
+
+static struct platform_driver mb_rproc_driver = {
+	.probe = mb_rproc_probe,
+	.driver = {
+		.name = "amd-microblaze-rproc",
+		.of_match_table = mb_rproc_of_match,
+	},
+};
+module_platform_driver(mb_rproc_driver);
+
+MODULE_DESCRIPTION("AMD MicroBlaze Remote Processor driver");
+MODULE_AUTHOR("Ben Levinsky");
+MODULE_LICENSE("GPL");
-- 
2.34.1

