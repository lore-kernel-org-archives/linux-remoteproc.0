Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C6BC64E7C
	for <linux-remoteproc@archiver.kernel.org>; Sat, 14 Nov 2020 16:49:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EFCA223C6
	for <linux-remoteproc@archiver.kernel.org>; Sat, 14 Nov 2020 16:49:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="EcnFC9bR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbgKNQte (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 14 Nov 2020 11:49:34 -0500
Received: from mail-bn8nam12on2072.outbound.protection.outlook.com ([40.107.237.72]:28096
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726265AbgKNQta (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 14 Nov 2020 11:49:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJTq3zzrRjW5v0GJqbie4Xc0W60oOl/2ffzcVhCLDiaPjJn1yqv5+ujWr0IYO7vj8Gbed+mVwvpf2mZHyae8+k9VEynZp56D+pTPsSj4sSxlHacUoxC2puuFNW+jWkMOjJjycRlVV5dY1wdkV72/qPVrBPvwJVBBRUnlIW0Rq+bdrA0a2EHqx+rnhHEnSwOCMAcwsk5oPcgLOsUPMwQt8TsOjE8DB4RBEEEYkPNzbie1+jl/dlL+nZQkrIHW+pkUSGf6UPCKbuufbsworpNer9rTsgW8fGfawPhvdqTSt5r8S4VRxk4dK3ly3qrt1nB2qy693/wGMV885pRe3BOiBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ce9/w2bXoElwuieRCqqQ+IGFwMfWB6qONKe4wxy0wyU=;
 b=I45gDryaRHbTxa3ktBy7nL046xQ3DnCb8IJlrt/pEDednhdmDYyauG7E3nLC/hvavWh5/6oyj1ICr+XfA6/JgOyikCmNU4VmYFCSE/WM7PxFwmA80G5xEB6xnJa85ErzsWNQSsECxwkQN3SDh57LVjnKslMyyCe0Y3/TxrfTbNJuIX/eYEXIrBkmoEfD9WfrkTt9+C9KGSGjVFDVhLvr4T1GczepWUcjOG93dOC7Y5zMAV59iMVotmAm7MwXytZ4FjaIrIk3HwaOvDGbP4Ou8ns7RleUQETBlRw3J7vH06V4QDHWKuahSxwT52pfNCHhZwrirVD+/5WpQB6Qfkm3bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ce9/w2bXoElwuieRCqqQ+IGFwMfWB6qONKe4wxy0wyU=;
 b=EcnFC9bROfejCOrUOe4I3MhWV177auCQtAV7UbHhQjioOmV1u7u80pfSDo94ek4HDnixS7oz3ibAS5hO/ZlIit651gj1r+ZuUcbOYS60xJbUynvY3DY4g1EnpoMxaGfh5YxfoGLXzG8C6PjRHE9UV0vu0p2aaVgidlNKw7sxmI4=
Received: from BL1PR13CA0205.namprd13.prod.outlook.com (2603:10b6:208:2be::30)
 by DM6PR02MB4939.namprd02.prod.outlook.com (2603:10b6:5:18::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Sat, 14 Nov
 2020 16:49:23 +0000
Received: from BL2NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:2be:cafe::69) by BL1PR13CA0205.outlook.office365.com
 (2603:10b6:208:2be::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.21 via Frontend
 Transport; Sat, 14 Nov 2020 16:49:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT007.mail.protection.outlook.com (10.152.77.46) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Sat, 14 Nov 2020 16:49:23 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sat, 14 Nov 2020 08:49:21 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sat, 14 Nov 2020 08:49:21 -0800
Envelope-to: mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.2.206] (port=38914 helo=xsjblevinsk50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kdyjp-0007Ai-K4; Sat, 14 Nov 2020 08:49:21 -0800
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v23 5/5] remoteproc: Add initial zynqmp R5 remoteproc driver
Date:   Sat, 14 Nov 2020 08:49:21 -0800
Message-ID: <20201114164921.14573-6-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201114164921.14573-1-ben.levinsky@xilinx.com>
References: <20201114164921.14573-1-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 040ee2d9-e9c1-4d59-c964-08d888bd3da7
X-MS-TrafficTypeDiagnostic: DM6PR02MB4939:
X-Microsoft-Antispam-PRVS: <DM6PR02MB49396615949C4264C92DBC20B5E50@DM6PR02MB4939.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:291;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JEtUk4erCStoRrOHrwKUeyQN5Gsd67QgHT+QeeI5g+h44PVybu7CKMia6P76lABJ6Pc731aaPSw+bU82YIiwA//yPkLhYrRE+znsU9brhvQrBUor/4j1Cy1N5pyXnn/HO/NGE68zE0ofpmuX9U/j3a40QmgpUILLJaWD5aZ8ATFXNixLnFEoHjmvTnO7g8JWejLLLMYVAJqMuUMhhXOsEWz/1lojYEuklOMlvLYNXAw7wHFZd6lmIIc62iK7k1h3Lkk3VaD7Vo5vIPIPcGr3SaP8PE9NJWJVAv6sksxZvVe1QS9DEtDZ9IRrOtqupgG/HLt0uBlpgDVXvj63WMTv5fFfBZZR7xfV6oCJj5JHig70UagZq3X6Le38dEzGPjcPwBbUPPO1iG5s5ydB1QGT5NTjQl6K3pKI92jgjqqHbVM=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(396003)(136003)(46966005)(2616005)(478600001)(83380400001)(4326008)(30864003)(8936002)(6916009)(336012)(8676002)(426003)(2906002)(44832011)(9786002)(356005)(186003)(82740400003)(5660300002)(7696005)(26005)(7636003)(36756003)(1076003)(70586007)(82310400003)(36906005)(316002)(54906003)(70206006)(47076004)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2020 16:49:23.6118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 040ee2d9-e9c1-4d59-c964-08d888bd3da7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT007.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4939
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

R5 is included in Xilinx Zynq UltraScale MPSoC so by adding this
remotproc driver, we can boot the R5 sub-system in two different
configurations -
	* Split
	* Lockstep

The Xilinx R5 Remoteproc Driver boots the R5's via calls to the Xilinx
Platform Management Unit that handles the R5 configuration, memory access
and R5 lifecycle management. The interface to this manager is done in this
driver via zynqmp_pm_* function calls.

Signed-off-by: Wendy Liang <wendy.liang@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Ed Mooring <ed.mooring@xilinx.com>
Signed-off-by: Jason Wu <j.wu@xilinx.com>
Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
---
- Rework R5 cluster configuration so alignment of
  of_property_read_bool(dev->of_node, "lockstep-mode") is non-issue
  (Note that property 'lockstep-mode' is now 'xilinx,cluster-mode'
  to align with TI R5 driver).
- Update grammatic and capitalization errors in driver and documentation
- Refactor var in zynqmp_r5_remoteproc_probe 'i' -> 'core_count'
  Remove the use of this near loop for instantiating each core.
- Refactor to more closely align with TI remoteproc R5 driver as follows:
  > Refactor 'meta-memory-regions' property -> 'sram'
  > Change Xilinx specific TCM nodes to generic mmio-sram nodes. Remove the
    power node ID from each of these TCM nodes and instead map the TCM
    addresses to respective Xilinx Platorm Node IDs via lookup table
    zynqmp_banks
  > Refactor 'pnode-id' -> 'power-domain' for R5 Xilix Platform Node ID.
---
 drivers/remoteproc/Kconfig                |   8 +
 drivers/remoteproc/Makefile               |   1 +
 drivers/remoteproc/zynqmp_r5_remoteproc.c | 872 ++++++++++++++++++++++
 3 files changed, 881 insertions(+)
 create mode 100644 drivers/remoteproc/zynqmp_r5_remoteproc.c

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index c6659dfea7c7..c2fe54b1d94f 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -275,6 +275,14 @@ config TI_K3_DSP_REMOTEPROC
 	  It's safe to say N here if you're not interested in utilizing
 	  the DSP slave processors.
 
+config ZYNQMP_R5_REMOTEPROC
+	tristate "ZynqMP R5 remoteproc support"
+	depends on PM && ARCH_ZYNQMP
+	select RPMSG_VIRTIO
+	select ZYNQMP_IPI_MBOX
+	help
+	  Say y or m here to support ZynqMP R5 remote processors via the remote
+	  processor framework.
 endif # REMOTEPROC
 
 endmenu
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 3dfa28e6c701..ef1abff654c2 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -33,3 +33,4 @@ obj-$(CONFIG_ST_REMOTEPROC)		+= st_remoteproc.o
 obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+= st_slim_rproc.o
 obj-$(CONFIG_STM32_RPROC)		+= stm32_rproc.o
 obj-$(CONFIG_TI_K3_DSP_REMOTEPROC)	+= ti_k3_dsp_remoteproc.o
+obj-$(CONFIG_ZYNQMP_R5_REMOTEPROC)	+= zynqmp_r5_remoteproc.o
diff --git a/drivers/remoteproc/zynqmp_r5_remoteproc.c b/drivers/remoteproc/zynqmp_r5_remoteproc.c
new file mode 100644
index 000000000000..6bffbc2d7e91
--- /dev/null
+++ b/drivers/remoteproc/zynqmp_r5_remoteproc.c
@@ -0,0 +1,872 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Zynq R5 Remote Processor driver
+ *
+ * Based on origin OMAP and Zynq Remote Processor driver
+ *
+ */
+
+#include <linux/firmware/xlnx-zynqmp.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/mailbox_client.h>
+#include <linux/mailbox/zynqmp-ipi-message.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/remoteproc.h>
+#include <linux/skbuff.h>
+#include <linux/sysfs.h>
+
+#include "remoteproc_internal.h"
+
+#define MAX_RPROCS	2 /* Support up to 2 RPU */
+#define MAX_MEM_PNODES	4 /* Max power nodes for one RPU memory instance */
+
+#define BANK_LIST_PROP	"sram"
+#define DDR_LIST_PROP	"memory-region"
+
+/* IPI buffer MAX length */
+#define IPI_BUF_LEN_MAX	32U
+/* RX mailbox client buffer max length */
+#define RX_MBOX_CLIENT_BUF_MAX	(IPI_BUF_LEN_MAX + \
+				 sizeof(struct zynqmp_ipi_message))
+
+/*
+ * Map each Xilinx on-chip SRAM  Bank address to their own respective
+ * pm_node_id.
+ */
+struct sram_addr_data {
+	phys_addr_t addr;
+	enum pm_node_id id;
+};
+
+#define NUM_SRAMS 4U
+static const struct sram_addr_data zynqmp_banks[NUM_SRAMS] = {
+	{0xffe00000UL, NODE_TCM_0_A},
+	{0xffe20000UL, NODE_TCM_0_B},
+	{0xffe90000UL, NODE_TCM_1_A},
+	{0xffeb0000UL, NODE_TCM_1_B},
+};
+
+/**
+ * struct zynqmp_r5_rproc - ZynqMP R5 core structure
+ *
+ * @rx_mc_buf: rx mailbox client buffer to save the rx message
+ * @tx_mc: tx mailbox client
+ * @rx_mc: rx mailbox client
+ * @mbox_work: mbox_work for the RPU remoteproc
+ * @tx_mc_skbs: socket buffers for tx mailbox client
+ * @dev: device of RPU instance
+ * @rproc: rproc handle
+ * @tx_chan: tx mailbox channel
+ * @rx_chan: rx mailbox channel
+ * @pnode_id: RPU CPU power domain id
+ * @elem: linked list item
+ */
+struct zynqmp_r5_rproc {
+	unsigned char rx_mc_buf[RX_MBOX_CLIENT_BUF_MAX];
+	struct mbox_client tx_mc;
+	struct mbox_client rx_mc;
+	struct work_struct mbox_work;
+	struct sk_buff_head tx_mc_skbs;
+	struct device *dev;
+	struct rproc *rproc;
+	struct mbox_chan *tx_chan;
+	struct mbox_chan *rx_chan;
+	u32 pnode_id;
+	struct list_head elem;
+};
+
+/*
+ * r5_set_mode - set RPU operation mode
+ * @z_rproc: Remote processor private data
+ * @rpu_mode: mode specified by device tree to configure the RPU to
+ *
+ * set RPU operation mode
+ *
+ * Return: 0 for success, negative value for failure
+ */
+static int r5_set_mode(struct zynqmp_r5_rproc *z_rproc,
+		       enum rpu_oper_mode rpu_mode)
+{
+	enum rpu_tcm_comb tcm_mode;
+	enum rpu_oper_mode cur_rpu_mode;
+	int ret;
+
+	ret = zynqmp_pm_get_rpu_mode(z_rproc->pnode_id, &cur_rpu_mode);
+	if (ret < 0)
+		return ret;
+
+	if (rpu_mode != cur_rpu_mode) {
+		ret = zynqmp_pm_set_rpu_mode(z_rproc->pnode_id,
+					     rpu_mode);
+		if (ret < 0)
+			return ret;
+	}
+
+	tcm_mode = (rpu_mode == PM_RPU_MODE_LOCKSTEP) ?
+		    PM_RPU_TCM_COMB : PM_RPU_TCM_SPLIT;
+	return zynqmp_pm_set_tcm_config(z_rproc->pnode_id, tcm_mode);
+}
+
+/*
+ * zynqmp_r5_rproc_mem_release
+ * @rproc: single R5 core's corresponding rproc instance
+ * @mem: mem entry to unmap
+ *
+ * Unmap TCM banks when powering down R5 core.
+ *
+ * return 0 on success, otherwise non-zero value on failure
+ */
+static int tcm_mem_release(struct rproc *rproc, struct rproc_mem_entry *mem)
+{
+	u32 pnode_id = (u64)mem->priv;
+
+	iounmap(mem->va);
+	return zynqmp_pm_release_node(pnode_id);
+}
+
+/*
+ * zynqmp_r5_rproc_start
+ * @rproc: single R5 core's corresponding rproc instance
+ *
+ * Start R5 Core from designated boot address.
+ *
+ * return 0 on success, otherwise non-zero value on failure
+ */
+static int zynqmp_r5_rproc_start(struct rproc *rproc)
+{
+	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
+	enum rpu_boot_mem bootmem;
+
+	bootmem = (rproc->bootaddr & 0xF0000000) == 0xF0000000 ?
+		  PM_RPU_BOOTMEM_HIVEC : PM_RPU_BOOTMEM_LOVEC;
+
+	dev_dbg(rproc->dev.parent, "RPU boot from %s.",
+		bootmem == PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
+
+	return zynqmp_pm_request_wake(z_rproc->pnode_id, 1,
+				     bootmem, ZYNQMP_PM_REQUEST_ACK_NO);
+}
+
+/*
+ * zynqmp_r5_rproc_stop
+ * @rproc: single R5 core's corresponding rproc instance
+ *
+ * Power down  R5 Core.
+ *
+ * return 0 on success, otherwise non-zero value on failure
+ */
+static int zynqmp_r5_rproc_stop(struct rproc *rproc)
+{
+	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
+
+	return zynqmp_pm_force_pwrdwn(z_rproc->pnode_id,
+				     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
+}
+
+/*
+ * zynqmp_r5_rproc_mem_alloc
+ * @rproc: single R5 core's corresponding rproc instance
+ * @mem: mem entry to map
+ *
+ * Callback to map va for memory-region's carveout.
+ *
+ * return 0 on success, otherwise non-zero value on failure
+ */
+static int zynqmp_r5_rproc_mem_alloc(struct rproc *rproc,
+				     struct rproc_mem_entry *mem)
+{
+	void *va;
+
+	va = ioremap_wc(mem->dma, mem->len);
+	if (IS_ERR_OR_NULL(va))
+		return -ENOMEM;
+
+	mem->va = va;
+
+	return 0;
+}
+
+/*
+ * zynqmp_r5_rproc_mem_release
+ * @rproc: single R5 core's corresponding rproc instance
+ * @mem: mem entry to unmap
+ *
+ * Unmap memory-region carveout
+ *
+ * return 0 on success, otherwise non-zero value on failure
+ */
+static int zynqmp_r5_rproc_mem_release(struct rproc *rproc,
+				       struct rproc_mem_entry *mem)
+{
+	iounmap(mem->va);
+	return 0;
+}
+
+/*
+ * parse_mem_regions
+ * @rproc: single R5 core's corresponding rproc instance
+ *
+ * Construct rproc mem carveouts from carveout provided in
+ * memory-region property
+ *
+ * return 0 on success, otherwise non-zero value on failure
+ */
+static int parse_mem_regions(struct rproc *rproc)
+{
+	int num_mems, i;
+	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
+	struct device *dev = &rproc->dev;
+	struct device_node *np = z_rproc->dev->of_node;
+	struct rproc_mem_entry *mem;
+
+	num_mems = of_count_phandle_with_args(np, DDR_LIST_PROP, NULL);
+	if (num_mems <= 0)
+		return 0;
+
+	for (i = 0; i < num_mems; i++) {
+		struct device_node *node;
+		struct reserved_mem *rmem;
+
+		node = of_parse_phandle(np, DDR_LIST_PROP, i);
+		if (!node)
+			return -EINVAL;
+
+		rmem = of_reserved_mem_lookup(node);
+		if (!rmem)
+			return -EINVAL;
+
+		if (strstr(node->name, "vdev0vring")) {
+			int vring_id;
+			char name[16];
+
+			/*
+			 * expecting form of "rpuXvdev0vringX as documented
+			 * in xilinx remoteproc device tree binding
+			 */
+			if (strlen(node->name) < 15) {
+				dev_err(dev, "%pOF is less than 14 chars",
+					node);
+				return -EINVAL;
+			}
+
+			/*
+			 * can be 1 of multiple vring IDs per IPC channel
+			 * e.g. 'vdev0vring0' and 'vdev0vring1'
+			 */
+			vring_id = node->name[14] - '0';
+			snprintf(name, sizeof(name), "vdev0vring%d", vring_id);
+			/* Register vring */
+			mem = rproc_mem_entry_init(dev, NULL,
+						   (dma_addr_t)rmem->base,
+						   rmem->size, rmem->base,
+						   zynqmp_r5_rproc_mem_alloc,
+						   zynqmp_r5_rproc_mem_release,
+						   name);
+		} else {
+			/* Register DMA region */
+			int (*alloc)(struct rproc *r,
+				     struct rproc_mem_entry *rme);
+			int (*release)(struct rproc *r,
+				       struct rproc_mem_entry *rme);
+			char name[20];
+
+			if (strstr(node->name, "vdev0buffer")) {
+				alloc = NULL;
+				release = NULL;
+				strcpy(name, "vdev0buffer");
+			} else {
+				alloc = zynqmp_r5_rproc_mem_alloc;
+				release = zynqmp_r5_rproc_mem_release;
+				strcpy(name, node->name);
+			}
+
+			mem = rproc_mem_entry_init(dev, NULL,
+						   (dma_addr_t)rmem->base,
+						   rmem->size, rmem->base,
+						   alloc, release, name);
+		}
+		if (!mem)
+			return -ENOMEM;
+
+		rproc_add_carveout(rproc, mem);
+	}
+
+	return 0;
+}
+
+/*
+ * zynqmp_r5_pm_request_tcm
+ * @addr: base address of mem provided in R5 core's sram property.
+ *
+ * Given sram base address, determine its corresponding Xilinx
+ * Platform Management ID and then request access to this node
+ * so that it can be power up.
+ *
+ * return 0 on success, otherwise non-zero value on failure
+ */
+static int zynqmp_r5_pm_request_sram(phys_addr_t addr)
+{
+	unsigned int i;
+
+	for (i = 0; i < NUM_SRAMS; i++) {
+		if (zynqmp_banks[i].addr == addr)
+			return zynqmp_pm_request_node(zynqmp_banks[i].id,
+						      ZYNQMP_PM_CAPABILITY_ACCESS,
+						      0,
+						      ZYNQMP_PM_REQUEST_ACK_BLOCKING);
+	}
+
+	return -EINVAL;
+}
+
+/*
+ * tcm_mem_alloc
+ * @rproc: single R5 core's corresponding rproc instance
+ * @mem: mem entry to initialize the va and da fields of
+ *
+ * Given TCM bank entry,
+ * this callback will set device address for R5 running on TCM
+ * and also setup virtual address for TCM bank remoteproc carveout
+ *
+ * return 0 on success, otherwise non-zero value on failure
+ */
+static int tcm_mem_alloc(struct rproc *rproc,
+			 struct rproc_mem_entry *mem)
+{
+	void *va;
+	struct device *dev = rproc->dev.parent;
+
+	va = ioremap_wc(mem->dma, mem->len);
+	if (IS_ERR_OR_NULL(va))
+		return -ENOMEM;
+
+	/* Update memory entry va */
+	mem->va = va;
+
+	va = devm_ioremap_wc(dev, mem->da, mem->len);
+	if (!va)
+		return -ENOMEM;
+	/* As R5 is 32 bit, wipe out extra high bits */
+	mem->da &= 0x000fffff;
+	/*
+	 * The R5s expect their TCM banks to be at address 0x0 and 0x2000,
+	 * while on the Linux side they are at 0xffexxxxx. Zero out the high
+	 * 12 bits of the address.
+	 */
+
+	/*
+	 * TCM Banks 1A and 1B (0xffe90000 and 0xffeb0000) still
+	 * need to be translated to 0x0 and 0x20000
+	 */
+	if (mem->da == 0x90000 || mem->da == 0xB0000)
+		mem->da -= 0x90000;
+
+	/* if translated TCM bank address is not valid report error */
+	if (mem->da != 0x0 && mem->da != 0x20000) {
+		dev_err(dev, "invalid TCM bank address: %x\n", mem->da);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/*
+ * parse_tcm_banks()
+ * @rproc: single R5 core's corresponding rproc instance
+ *
+ * Given R5 node in remoteproc instance
+ * allocate remoteproc carveout for TCM memory
+ * needed for firmware to be loaded
+ *
+ * return 0 on success, otherwise non-zero value on failure
+ */
+static int parse_tcm_banks(struct rproc *rproc)
+{
+	int i, num_banks;
+	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
+	struct device *dev = &rproc->dev;
+	struct device_node *r5_node = z_rproc->dev->of_node;
+
+	/* go through TCM banks for r5 node */
+	num_banks = of_count_phandle_with_args(r5_node, BANK_LIST_PROP, NULL);
+	if (num_banks <= 0) {
+		dev_err(dev, "need to specify TCM banks\n");
+		return -EINVAL;
+	}
+	for (i = 0; i < num_banks; i++) {
+		struct resource rsc;
+		resource_size_t size;
+		struct device_node *dt_node;
+		struct rproc_mem_entry *mem;
+		int ret;
+		u32 pnode_id; /* zynqmp_pm* fn's expect u32 */
+
+		dt_node = of_parse_phandle(r5_node, BANK_LIST_PROP, i);
+		if (!dt_node)
+			return -EINVAL;
+
+		if (of_device_is_available(dt_node)) {
+			ret = of_address_to_resource(dt_node, 0, &rsc);
+			if (ret < 0)
+				return ret;
+			ret = zynqmp_r5_pm_request_sram(rsc.start);
+			if (ret < 0)
+				return ret;
+
+			/* add carveout */
+			size = resource_size(&rsc);
+			mem = rproc_mem_entry_init(dev, NULL, rsc.start,
+						   (int)size, rsc.start,
+						   tcm_mem_alloc,
+						   tcm_mem_release,
+						   rsc.name);
+			if (!mem)
+				return -ENOMEM;
+
+			mem->priv = (void *)(u64)pnode_id;
+			rproc_add_carveout(rproc, mem);
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * zynqmp_r5_parse_fw()
+ * @rproc: single R5 core's corresponding rproc instance
+ * @fw: ptr to firmware to be loaded onto r5 core
+ *
+ * When loading firmware, ensure the necessary carveouts are in remoteproc
+ *
+ * return 0 on success, otherwise non-zero value on failure
+ */
+static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	int ret;
+
+	ret = parse_tcm_banks(rproc);
+	if (ret)
+		return ret;
+
+	ret = parse_mem_regions(rproc);
+	if (ret)
+		return ret;
+
+	ret = rproc_elf_load_rsc_table(rproc, fw);
+	if (ret == -EINVAL) {
+		/*
+		 * resource table only required for IPC.
+		 * if not present, this is not necessarily an error;
+		 * for example, loading r5 hello world application
+		 * so simply inform user and keep going.
+		 */
+		dev_info(&rproc->dev, "no resource table found.\n");
+		ret = 0;
+	}
+	return ret;
+}
+
+/*
+ * zynqmp_r5_rproc_kick() - kick a firmware if mbox is provided
+ * @rproc: r5 core's corresponding rproc structure
+ * @vqid: virtqueue ID
+ */
+static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
+{
+	struct sk_buff *skb;
+	unsigned int skb_len;
+	struct zynqmp_ipi_message *mb_msg;
+	int ret;
+
+	struct device *dev = rproc->dev.parent;
+	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
+
+	if (of_property_read_bool(dev->of_node, "mboxes")) {
+		skb_len = (unsigned int)(sizeof(vqid) + sizeof(mb_msg));
+		skb = alloc_skb(skb_len, GFP_ATOMIC);
+		if (!skb)
+			return;
+
+		mb_msg = (struct zynqmp_ipi_message *)skb_put(skb, skb_len);
+		mb_msg->len = sizeof(vqid);
+		memcpy(mb_msg->data, &vqid, sizeof(vqid));
+
+		skb_queue_tail(&z_rproc->tx_mc_skbs, skb);
+		ret = mbox_send_message(z_rproc->tx_chan, mb_msg);
+		if (ret < 0) {
+			dev_warn(dev, "Failed to kick remote.\n");
+			skb_dequeue_tail(&z_rproc->tx_mc_skbs);
+			kfree_skb(skb);
+		}
+	} else {
+		(void)skb;
+		(void)skb_len;
+		(void)mb_msg;
+		(void)ret;
+		(void)vqid;
+	}
+}
+
+static struct rproc_ops zynqmp_r5_rproc_ops = {
+	.start		= zynqmp_r5_rproc_start,
+	.stop		= zynqmp_r5_rproc_stop,
+	.load		= rproc_elf_load_segments,
+	.parse_fw	= zynqmp_r5_parse_fw,
+	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
+	.sanity_check	= rproc_elf_sanity_check,
+	.get_boot_addr	= rproc_elf_get_boot_addr,
+	.kick		= zynqmp_r5_rproc_kick,
+};
+
+/**
+ * event_notified_idr_cb() - event notified idr callback
+ * @id: idr id
+ * @ptr: pointer to idr private data
+ * @data: data passed to idr_for_each callback
+ *
+ * Pass notification to remoteproc virtio
+ *
+ * Return: 0. having return is to satisfy the idr_for_each() function
+ *          pointer input argument requirement.
+ **/
+static int event_notified_idr_cb(int id, void *ptr, void *data)
+{
+	struct rproc *rproc = data;
+
+	(void)rproc_vq_interrupt(rproc, id);
+	return 0;
+}
+
+/**
+ * handle_event_notified() - remoteproc notification work function
+ * @work: pointer to the work structure
+ *
+ * It checks each registered remoteproc notify IDs.
+ */
+static void handle_event_notified(struct work_struct *work)
+{
+	struct rproc *rproc;
+	struct zynqmp_r5_rproc *z_rproc;
+
+	z_rproc = container_of(work, struct zynqmp_r5_rproc, mbox_work);
+
+	(void)mbox_send_message(z_rproc->rx_chan, NULL);
+	rproc = z_rproc->rproc;
+	/*
+	 * We only use IPI for interrupt. The firmware side may or may
+	 * not write the notifyid when it trigger IPI.
+	 * And thus, we scan through all the registered notifyids.
+	 */
+	idr_for_each(&rproc->notifyids, event_notified_idr_cb, rproc);
+}
+
+/**
+ * zynqmp_r5_mb_rx_cb() - Receive channel mailbox callback
+ * @cl: mailbox client
+ * @msg: message pointer
+ *
+ * It will schedule the R5 notification work.
+ */
+static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
+{
+	struct zynqmp_r5_rproc *z_rproc;
+
+	z_rproc = container_of(cl, struct zynqmp_r5_rproc, rx_mc);
+	if (msg) {
+		struct zynqmp_ipi_message *ipi_msg, *buf_msg;
+		size_t len;
+
+		ipi_msg = (struct zynqmp_ipi_message *)msg;
+		buf_msg = (struct zynqmp_ipi_message *)z_rproc->rx_mc_buf;
+		len = (ipi_msg->len >= IPI_BUF_LEN_MAX) ?
+		      IPI_BUF_LEN_MAX : ipi_msg->len;
+		buf_msg->len = len;
+		memcpy(buf_msg->data, ipi_msg->data, len);
+	}
+	schedule_work(&z_rproc->mbox_work);
+}
+
+/**
+ * zynqmp_r5_mb_tx_done() - Request has been sent to the remote
+ * @cl: mailbox client
+ * @msg: pointer to the message which has been sent
+ * @r: status of last TX - OK or error
+ *
+ * It will be called by the mailbox framework when the last TX has done.
+ */
+static void zynqmp_r5_mb_tx_done(struct mbox_client *cl, void *msg, int r)
+{
+	struct zynqmp_r5_rproc *z_rproc;
+	struct sk_buff *skb;
+
+	if (!msg)
+		return;
+	z_rproc = container_of(cl, struct zynqmp_r5_rproc, tx_mc);
+	skb = skb_dequeue(&z_rproc->tx_mc_skbs);
+	kfree_skb(skb);
+}
+
+/**
+ * zynqmp_r5_setup_mbox() - Setup mailboxes
+ *			    this is used for each individual R5 core
+ *
+ * @z_rproc: pointer to the ZynqMP R5 processor platform data
+ * @node: pointer of the device node
+ *
+ * Function to setup mailboxes to talk to RPU.
+ *
+ * Return: 0 for success, negative value for failure.
+ */
+static int zynqmp_r5_setup_mbox(struct zynqmp_r5_rproc *z_rproc,
+				struct device_node *node)
+{
+	struct mbox_client *mclient;
+
+	/* Setup TX mailbox channel client */
+	mclient = &z_rproc->tx_mc;
+	mclient->rx_callback = NULL;
+	mclient->tx_block = false;
+	mclient->knows_txdone = false;
+	mclient->tx_done = zynqmp_r5_mb_tx_done;
+	mclient->dev = z_rproc->dev;
+
+	/* Setup TX mailbox channel client */
+	mclient = &z_rproc->rx_mc;
+	mclient->dev = z_rproc->dev;
+	mclient->rx_callback = zynqmp_r5_mb_rx_cb;
+	mclient->tx_block = false;
+	mclient->knows_txdone = false;
+
+	INIT_WORK(&z_rproc->mbox_work, handle_event_notified);
+
+	/* Request TX and RX channels */
+	z_rproc->tx_chan = mbox_request_channel_byname(&z_rproc->tx_mc, "tx");
+	if (IS_ERR(z_rproc->tx_chan)) {
+		dev_err(z_rproc->dev, "failed to request mbox tx channel.\n");
+		z_rproc->tx_chan = NULL;
+		return -EINVAL;
+	}
+
+	z_rproc->rx_chan = mbox_request_channel_byname(&z_rproc->rx_mc, "rx");
+	if (IS_ERR(z_rproc->rx_chan)) {
+		dev_err(z_rproc->dev, "failed to request mbox rx channel.\n");
+		z_rproc->rx_chan = NULL;
+		return -EINVAL;
+	}
+	skb_queue_head_init(&z_rproc->tx_mc_skbs);
+
+	return 0;
+}
+
+/**
+ * zynqmp_r5_probe() - Probes ZynqMP R5 processor device node
+ *		       this is called for each individual R5 core to
+ *		       set up mailbox, Xilinx platform manager unique ID,
+ *		       add to rproc core
+ *
+ * @pdev: domain platform device for current R5 core
+ * @node: pointer of the device node for current R5 core
+ * @rpu_mode: mode to configure RPU, split or lockstep
+ * @z_rproc: Xilinx specific remoteproc structure used later to link
+ *           in to cluster of cores
+ *
+ * Return: 0 for success, negative value for failure.
+ */
+static int zynqmp_r5_probe(struct platform_device *pdev,
+			   struct device_node *node,
+			   enum rpu_oper_mode rpu_mode,
+			   struct zynqmp_r5_rproc **z_rproc)
+{
+	int ret;
+	struct device *dev = &pdev->dev;
+	struct rproc *rproc_ptr;
+
+	/* Allocate remoteproc instance */
+	rproc_ptr = devm_rproc_alloc(dev, dev_name(dev), &zynqmp_r5_rproc_ops,
+				     NULL, sizeof(struct zynqmp_r5_rproc));
+	if (!rproc_ptr) {
+		ret = -ENOMEM;
+		goto error;
+	}
+
+	rproc_ptr->auto_boot = false;
+	*z_rproc = rproc_ptr->priv;
+	(*z_rproc)->rproc = rproc_ptr;
+	(*z_rproc)->dev = dev;
+	/* Set up DMA mask */
+	ret = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
+	if (ret)
+		goto error;
+
+	/* Get R5 power domain node */
+	ret = of_property_read_u32(node, "power-domain", &(*z_rproc)->pnode_id);
+	if (ret)
+		goto error;
+
+	ret = r5_set_mode(*z_rproc, rpu_mode);
+	if (ret)
+		goto error;
+
+	if (of_property_read_bool(node, "mboxes")) {
+		ret = zynqmp_r5_setup_mbox(*z_rproc, node);
+		if (ret)
+			goto error;
+	}
+
+	/* Add R5 remoteproc */
+	ret = devm_rproc_add(dev, rproc_ptr);
+	if (ret)
+		goto error;
+
+	return 0;
+error:
+	*z_rproc = NULL;
+	return ret;
+}
+
+/*
+ * zynqmp_r5_remoteproc_probe()
+ *
+ * @pdev: domain platform device for R5 cluster
+ *
+ * called when driver is probed, for each R5 core specified in DT,
+ * setup as needed to do remoteproc-related operations
+ *
+ * Return: 0 for success, negative value for failure.
+ */
+static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
+{
+	int ret, core_count;
+	struct device *dev = &pdev->dev;
+	struct device_node *nc;
+	enum rpu_oper_mode rpu_mode = PM_RPU_MODE_LOCKSTEP;
+	struct list_head *cluster; /* list to track each core's rproc */
+	struct zynqmp_r5_rproc *z_rproc;
+	struct platform_device *child_pdev;
+	struct list_head *pos;
+
+	ret = of_property_read_u32(dev->of_node, "xilinx,cluster-mode", &rpu_mode);
+	if (ret < 0 || (rpu_mode != PM_RPU_MODE_LOCKSTEP &&
+			rpu_mode != PM_RPU_MODE_SPLIT)) {
+		dev_err(dev, "invalid format cluster mode: ret %d mode %x\n",
+			ret, rpu_mode);
+		return ret;
+	}
+
+	dev_dbg(dev, "RPU configuration: %s\n",
+		rpu_mode == PM_RPU_MODE_LOCKSTEP ? "lockstep" : "split");
+
+	/*
+	 * if 2 RPUs provided but one is lockstep, then we have an
+	 * invalid configuration.
+	 */
+
+	core_count = of_get_available_child_count(dev->of_node);
+	if ((rpu_mode == PM_RPU_MODE_LOCKSTEP && core_count != 1) ||
+	    core_count > MAX_RPROCS)
+		return -EINVAL;
+
+	cluster = devm_kzalloc(dev, sizeof(*cluster), GFP_KERNEL);
+	if (!cluster)
+		return -ENOMEM;
+	INIT_LIST_HEAD(cluster);
+
+	ret = devm_of_platform_populate(dev);
+	if (ret) {
+		dev_err(dev, "devm_of_platform_populate failed, ret = %d\n",
+			ret);
+		return ret;
+	}
+
+	/* probe each individual r5 core's remoteproc-related info */
+	for_each_available_child_of_node(dev->of_node, nc) {
+		child_pdev = of_find_device_by_node(nc);
+		if (!child_pdev) {
+			dev_err(dev, "could not get R5 core platform device\n");
+			ret = -ENODEV;
+			goto out;
+		}
+
+		ret = zynqmp_r5_probe(child_pdev, nc, rpu_mode, &z_rproc);
+		dev_dbg(dev, "%s to probe rpu %pOF\n",
+			ret ? "Failed" : "Able",
+			nc);
+		if (!z_rproc)
+			ret = -EINVAL;
+		if (ret)
+			goto out;
+		list_add_tail(&z_rproc->elem, cluster);
+	}
+	/* wire in so each core can be cleaned up at driver remove */
+	platform_set_drvdata(pdev, cluster);
+	return 0;
+out:
+	/*
+	 * undo core0 upon any failures on core1 in split-mode
+	 *
+	 * in zynqmp_r5_probe z_rproc is set to null
+	 * and ret to non-zero value if error
+	 */
+	if (ret && !z_rproc && rpu_mode == PM_RPU_MODE_SPLIT &&
+	    !list_empty(cluster)) {
+		list_for_each(pos, cluster) {
+			z_rproc = list_entry(pos, struct zynqmp_r5_rproc, elem);
+			if (of_property_read_bool(z_rproc->dev->of_node, "mboxes")) {
+				mbox_free_channel(z_rproc->tx_chan);
+				mbox_free_channel(z_rproc->rx_chan);
+			}
+		}
+	}
+	return ret;
+}
+
+/*
+ * zynqmp_r5_remoteproc_remove()
+ *
+ * @pdev: domain platform device for R5 cluster
+ *
+ * When the driver is unloaded, clean up the mailboxes for each
+ * remoteproc that was initially probed.
+ */
+static int zynqmp_r5_remoteproc_remove(struct platform_device *pdev)
+{
+	struct list_head *pos, *temp, *cluster = (struct list_head *)
+						 platform_get_drvdata(pdev);
+	struct zynqmp_r5_rproc *z_rproc = NULL;
+
+	list_for_each_safe(pos, temp, cluster) {
+		z_rproc = list_entry(pos, struct zynqmp_r5_rproc, elem);
+		if (of_property_read_bool(z_rproc->dev->of_node, "mboxes")) {
+			mbox_free_channel(z_rproc->tx_chan);
+			mbox_free_channel(z_rproc->rx_chan);
+		}
+		list_del(pos);
+	}
+	return 0;
+}
+
+/* Match table for OF platform binding */
+static const struct of_device_id zynqmp_r5_remoteproc_match[] = {
+	{ .compatible = "xlnx,zynqmp-r5-remoteproc", },
+	{ /* end of list */ },
+};
+MODULE_DEVICE_TABLE(of, zynqmp_r5_remoteproc_match);
+
+static struct platform_driver zynqmp_r5_remoteproc_driver = {
+	.probe = zynqmp_r5_remoteproc_probe,
+	.remove = zynqmp_r5_remoteproc_remove,
+	.driver = {
+		.name = "zynqmp_r5_remoteproc",
+		.of_match_table = zynqmp_r5_remoteproc_match,
+	},
+};
+module_platform_driver(zynqmp_r5_remoteproc_driver);
+
+MODULE_AUTHOR("Ben Levinsky <ben.levinsky@xilinx.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

