Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F156AC4332F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Nov 2021 05:39:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232422AbhKVFmY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Nov 2021 00:42:24 -0500
Received: from mail-dm3nam07on2065.outbound.protection.outlook.com ([40.107.95.65]:31681
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231945AbhKVFmS (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Nov 2021 00:42:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VO+0ReGiUYmhj3yyhcCvktvuQRHGTXRu9Y0/Ye2qwBxegH4PdJCSBLkF/8SDUFJbWCO0Ol20XtvQcoME4PLZ1yiDgtK0fs2i3rb+PWob4XlnUo8SLeqwTDtVZDonbvCYEnsA1lEeTIhJdRKFbvHlQzdY9b1os4tjH5k2eEyS1rhjNNSHRWnlSOoFN5uQaWw4hXw5qkicjl194zlOgj27Pss/PTuPFX/EPLran9gpx0idHnBIntnNqiPnhZ5+qoD7nCqZLidiesNrEKlenMTiyHftES+2h5kQqIH73wbADn6ZAMHxd4fwND3d3qZfORhdvP+sUeJKc3Ns9HNrHXmrzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhxnOi7c0NTM1CijhjrNMSrsooaRc0UpbXyaBbRHEdM=;
 b=gj6ipcSAaECGo4Jw/Ux0hhjOerlTpoUSOdBLHZssLKC0LTYLWOvEffSy+sXD4r7ZcPaE7v4EexesFNL19R+vOoEXVjyWet4USEotxzTKZ2Kbk7pNOpGi9X9mXmGYLfDo4VO4j8dvA9MLyAqrk8D/PFZHjWk8pVfZI2Z6uZmiX76YGk4X3E6c20R+8ELr5pa+443+XnrS3lEJIdtB0gbY98kL84K6ggstuecmEvQOPLlXYfIPAhSbsBT3jv1+hJBcQm6dNHLpdDv1BYrCLRh3+yB7/Za7a0BdSioz/b2L9iPUugzWKq+NMFkSwHONBXe/Jvu5LenlZSZr7HyiLgX/Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhxnOi7c0NTM1CijhjrNMSrsooaRc0UpbXyaBbRHEdM=;
 b=MMAxvvk3LWevFEO79rjXmdiD3J0Em8+vWYmsQ02CxBVI6lmMaUUTnwANsDQ6rYkDeyF6IIz1BbKkoMgvfnHb3uOfffUXDxVyDV4DOF+veKVGkCdLFgHwbo7oTw+XdRjbTIDKYKAmYBgp/GiT1kXZapvU5brad6b+aHIdrEIx5qI=
Received: from SN4PR0201CA0071.namprd02.prod.outlook.com
 (2603:10b6:803:20::33) by CY4PR02MB3254.namprd02.prod.outlook.com
 (2603:10b6:910:7d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Mon, 22 Nov
 2021 05:39:09 +0000
Received: from SN1NAM02FT0048.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:20:cafe::de) by SN4PR0201CA0071.outlook.office365.com
 (2603:10b6:803:20::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Mon, 22 Nov 2021 05:39:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0048.mail.protection.outlook.com (10.97.4.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 05:39:09 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 21 Nov 2021 21:39:03 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 21 Nov 2021 21:39:03 -0800
Envelope-to: bjorn.andersson@linaro.org,
 mathieu.poirier@linaro.org,
 robh+dt@kernel.org,
 laurent.pinchart@ideasonboard.com,
 bill.mills@linaro.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.3.14] (port=59046 helo=xsjtanmays50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <tanmay.shah@xilinx.com>)
        id 1mp22h-000BOC-BN; Sun, 21 Nov 2021 21:39:03 -0800
From:   Tanmay Shah <tanmay.shah@xilinx.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ben Levinsky <ben.levinsky@xilinx.com>,
        Bill Mills <bill.mills@linaro.org>,
        Sergei Korneichuk <sergei.korneichuk@xilinx.com>,
        Tanmay Shah <tanmay.shah@xilinx.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 6/6] drivers: remoteproc: Add Xilinx r5 remoteproc driver
Date:   Sun, 21 Nov 2021 21:38:56 -0800
Message-ID: <20211122053856.1342859-7-tanmay.shah@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122053856.1342859-1-tanmay.shah@xilinx.com>
References: <20211122053856.1342859-1-tanmay.shah@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7182bc1-e079-4f68-b5d7-08d9ad7a6860
X-MS-TrafficTypeDiagnostic: CY4PR02MB3254:
X-Microsoft-Antispam-PRVS: <CY4PR02MB3254C6A4C59E58BC5E704231CA9F9@CY4PR02MB3254.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:551;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tg/PKVg1cSaUVk+qcDPXp2Y1RUk79dFglT4quGm4rF1sAW0bV85/gjBvu2RkVczOxfn7YwBZJsXY8casIoZyMj1SHJShJ8I5G6ListNRt48Kq3Qb/UMSaTqDk11OdiwoAwd4RQ6LU5nVynKV1mT9azXHIqLvZcaMq27cBYCvQnv5l2eHc7WPTS6BCNXmMDcl2HW4Ps00k7/pSrpgE9b8BXdg3HBjDdreLFRs9kyg1KQCO7IPMTcsIDBkAdPPBVs2WHIDXaID+1Ee+You/GY5nww9HEypzm9WOmL4DFeGHdU+Wg4q7WYNaZ1xu5VO75wdKL9ghwZIUqneCY+9/Bpsn5pCFyWJ6H2w6azR1nJEU7017kixpuZwHbzqpJJAben9UTZ4+PFicAKGiitf3HmMFbs/O4FkgT4BY0vwmbn3gWnjuD23S7epMqfqf7X5Y4XaDGzQ/nqeTpkTt29iRvOykqU5HfJeV+970AX10NlxaUkIGVBIJQpMbfWS/vM3/9gzZ55qkNhmOFdCWDPB1D2/8DNHB2Tm+bcNLprcX+qvl9S0hYDWO1Tob+vXicZRyqGSRHcVyKW5H/ESDnE+yHGIo6opc46NYiERTONcJMU7vj7Nj/W3Ez9GPEsYWNmPtCaL/GaLQFZzC9cPnxZVcWRQvGpo/2BHy6zh9iqku7M5oM43ATdBi84Pf2VGL2DnIUdFB3oP6usx2oaaeUVT1QHZ4fjOA48hTWFbFK4ut/4J/0Y=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(36860700001)(2906002)(36756003)(44832011)(8676002)(83380400001)(356005)(7696005)(508600001)(4326008)(7636003)(8936002)(47076005)(6666004)(6636002)(2616005)(82310400003)(336012)(426003)(54906003)(9786002)(110136005)(5660300002)(30864003)(70586007)(70206006)(26005)(1076003)(36906005)(316002)(186003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 05:39:09.7610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7182bc1-e079-4f68-b5d7-08d9ad7a6860
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0048.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3254
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This driver enables r5f dual core Real time Processing Unit subsystem
available on Xilinx Zynq Ultrascale MPSoC Platform. RPU subsystem
(cluster) can be configured in different modes e.g. split mode in which
two r5f cores work independent of each other and lock-step mode in which
both r5f cores execute same code clock-for-clock and notify if the
result is different.

The Xilinx r5 Remoteproc Driver boots the RPU cores via calls to the Xilinx
Platform Management Unit that handles the R5 configuration, memory access
and R5 lifecycle management. The interface to this manager is done in this
driver via zynqmp_pm_* function calls.

Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
Signed-off-by: Tanmay Shah <tanmay.shah@xilinx.com>
---
 drivers/remoteproc/Kconfig              |  12 +
 drivers/remoteproc/Makefile             |   1 +
 drivers/remoteproc/xlnx_r5_remoteproc.c | 959 ++++++++++++++++++++++++
 3 files changed, 972 insertions(+)
 create mode 100644 drivers/remoteproc/xlnx_r5_remoteproc.c

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index f30d00a3aabe..27f66910d8d3 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -315,6 +315,18 @@ config TI_K3_R5_REMOTEPROC
          It's safe to say N here if you're not interested in utilizing
          a slave processor.

+config XLNX_R5_REMOTEPROC
+       tristate "Xilinx R5 remoteproc support"
+       depends on PM && ARCH_ZYNQMP
+       depends on ZYNQMP_FIRMWARE
+       select RPMSG_VIRTIO
+       select ZYNQMP_IPI_MBOX
+       help
+         Say y or m here to support Xilinx R5 remote processors via the re=
mote
+         processor framework.
+
+         It's safe to say N if not interested in using RPU r5f cores.
+
 endif # REMOTEPROC

 endmenu
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index bb26c9e4ef9c..334a8bed4c14 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -35,3 +35,4 @@ obj-$(CONFIG_ST_SLIM_REMOTEPROC)      +=3D st_slim_rproc.=
o
 obj-$(CONFIG_STM32_RPROC)              +=3D stm32_rproc.o
 obj-$(CONFIG_TI_K3_DSP_REMOTEPROC)     +=3D ti_k3_dsp_remoteproc.o
 obj-$(CONFIG_TI_K3_R5_REMOTEPROC)      +=3D ti_k3_r5_remoteproc.o
+obj-$(CONFIG_XLNX_R5_REMOTEPROC)       +=3D xlnx_r5_remoteproc.o
diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/x=
lnx_r5_remoteproc.c
new file mode 100644
index 000000000000..c2167fd3869d
--- /dev/null
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -0,0 +1,959 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ZynqMP R5 Remote Processor driver
+ *
+ */
+
+#include <dt-bindings/power/xlnx-zynqmp-power.h>
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
+/* settings for RPU cluster mode */
+enum zynqmp_r5_cluster_mode {
+       SPLIT_MODE =3D 0, // RPU cluster mode when cores run as separate pr=
ocessor
+       LOCKSTEP_MODE =3D 1, // cores execute same code in lockstep,clk-for=
-clk
+       SINGLE_CPU_MODE =3D 2, // core0 is held in reset and only core1 run=
s
+};
+
+/**
+ * struct mem_bank_data - Memory Bank description
+ *
+ * @addr: Start address of memory bank
+ * @size: Size of Memory bank
+ * @pm_domain_id: Power-domains id of memory bank for firmware to turn on/=
off
+ * @bank_name: name of the bank for remoteproc framework
+ */
+struct mem_bank_data {
+       phys_addr_t addr;
+       size_t size;
+       enum pm_node_id pm_domain_id;
+       char *bank_name;
+};
+
+static const struct mem_bank_data zynqmp_tcm_banks[] =3D {
+       {0xffe00000UL, 0x10000UL, PD_R5_0_ATCM, "atcm0"}, /* TCM 64KB each =
*/
+       {0xffe20000UL, 0x10000UL, PD_R5_0_BTCM, "btcm0"},
+       {0xffe90000UL, 0x10000UL, PD_R5_1_ATCM, "atcm1"},
+       {0xffeb0000UL, 0x10000UL, PD_R5_1_BTCM, "btcm1"},
+};
+
+/**
+ * struct zynqmp_r5_core - ZynqMP R5 core structure
+ *
+ * @dev: device of RPU instance
+ * @np: device node of RPU instance
+ * @tcm_bank_count: number TCM banks accessible to this RPU
+ * @tcm_banks: array of each TCM bank data
+ * @res_mem_count: number of Reserved Memory regions per core
+ * @res_mem: array of reserved memory regions
+ * @rproc: rproc handle
+ * @pm_domain_id: RPU CPU power domain id
+ */
+struct zynqmp_r5_core {
+       struct device *dev;
+       struct device_node *np;
+       int tcm_bank_count;
+       struct mem_bank_data *tcm_banks;
+       int res_mem_count;
+       struct reserved_mem *res_mem;
+       struct rproc *rproc;
+       enum pm_node_id pm_domain_id;
+};
+
+/**
+ * struct zynqmp_r5_cluster - ZynqMP R5 cluster structure
+ *
+ * @dev: r5f subsystem cluster device node
+ * @mode: cluster mode of type zynqmp_r5_cluster_mode
+ * @core_count: number of r5 cores used for this cluster mode
+ * @r5_cores: Array of r5 cores of type struct zynqmp_r5_core
+ */
+struct zynqmp_r5_cluster {
+       struct device *dev;
+       enum  zynqmp_r5_cluster_mode mode;
+       int core_count;
+       struct zynqmp_r5_core *r5_cores;
+};
+
+/*
+ * zynqmp_r5_set_mode - set RPU operation mode
+ *
+ * set RPU operation mode
+ *
+ * Return: 0 for success, negative value for failure
+ */
+static int zynqmp_r5_set_mode(struct zynqmp_r5_core *r5_core,
+                             enum zynqmp_r5_cluster_mode rpu_mode)
+{
+       enum rpu_tcm_comb tcm_mode;
+       int ret, reg_val;
+
+       reg_val =3D (rpu_mode =3D=3D LOCKSTEP_MODE ? 0 : 1);
+
+       ret =3D zynqmp_pm_set_rpu_mode(r5_core->pm_domain_id, reg_val);
+       if (ret < 0) {
+               pr_err("failed to set RPU mode\n");
+               return ret;
+       }
+
+       tcm_mode =3D (rpu_mode =3D=3D LOCKSTEP_MODE) ?
+                   PM_RPU_TCM_COMB : PM_RPU_TCM_SPLIT;
+       ret =3D zynqmp_pm_set_tcm_config(r5_core->pm_domain_id, tcm_mode);
+       if (ret < 0)
+               pr_err("failed to configure TCM\n");
+
+       return ret;
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
+       struct zynqmp_r5_core *r5_core =3D rproc->priv;
+       enum rpu_boot_mem bootmem;
+       int ret;
+
+       if (!r5_core) {
+               pr_err("can't get r5 core\n");
+               return -EINVAL;
+       }
+
+       bootmem =3D (rproc->bootaddr >=3D 0xFFFC0000) ?
+                  PM_RPU_BOOTMEM_HIVEC : PM_RPU_BOOTMEM_LOVEC;
+
+       dev_dbg(r5_core->dev, "RPU boot addr 0x%llx from %s.", rproc->boota=
ddr,
+               bootmem =3D=3D PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
+
+       ret =3D zynqmp_pm_request_wake(r5_core->pm_domain_id, 1,
+                                    bootmem, ZYNQMP_PM_REQUEST_ACK_NO);
+       if (ret)
+               pr_err("failed to start RPU =3D %d\n", r5_core->pm_domain_i=
d);
+       return ret;
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
+       struct zynqmp_r5_core *r5_core =3D rproc->priv;
+       int ret;
+
+       ret =3D zynqmp_pm_force_pwrdwn(r5_core->pm_domain_id,
+                                    ZYNQMP_PM_REQUEST_ACK_BLOCKING);
+       if (ret)
+               pr_err("failed to stop remoteproc RPU %d\n", ret);
+
+       return ret;
+}
+
+/*
+ * zynqmp_r5_rproc_mem_map
+ * @rproc: single R5 core's corresponding rproc instance
+ * @mem: mem entry to map
+ *
+ * Callback to map va for memory-region's carveout.
+ *
+ * return 0 on success, otherwise non-zero value on failure
+ */
+static int zynqmp_r5_rproc_mem_map(struct rproc *rproc,
+                                  struct rproc_mem_entry *mem)
+{
+       void __iomem *va;
+
+       va =3D ioremap_wc(mem->dma, mem->len);
+       if (IS_ERR_OR_NULL(va))
+               return -ENOMEM;
+
+       mem->va =3D (void *)va;
+
+       return 0;
+}
+
+/*
+ * zynqmp_r5_rproc_mem_unmap
+ * @rproc: single R5 core's corresponding rproc instance
+ * @mem: mem entry to unmap
+ *
+ * Unmap memory-region carveout
+ *
+ * return 0 on success, otherwise non-zero value on failure
+ */
+static int zynqmp_r5_rproc_mem_unmap(struct rproc *rproc,
+                                    struct rproc_mem_entry *mem)
+{
+       iounmap((void __iomem *)mem->va);
+       return 0;
+}
+
+/*
+ * add_mem_regions
+ * @rproc: single R5 core's corresponding rproc instance
+ *
+ * Construct rproc mem carveouts from carveout provided in
+ * memory-region property
+ *
+ * return 0 on success, otherwise non-zero value on failure
+ */
+static int add_mem_regions(struct rproc *rproc)
+{
+       struct device *dev;
+       struct rproc_mem_entry *mem;
+       struct reserved_mem *rmem;
+       struct zynqmp_r5_core *r5_core;
+       int i;
+
+       r5_core =3D rproc->priv;
+       dev =3D r5_core->dev;
+
+       /* Register associated reserved memory regions */
+       for (i =3D 0; i < r5_core->res_mem_count; i++) {
+               rmem =3D &r5_core->res_mem[i];
+               mem =3D rproc_mem_entry_init(dev, NULL,
+                                          (dma_addr_t)rmem->base,
+                                          rmem->size, rmem->base,
+                                          zynqmp_r5_rproc_mem_map,
+                                          zynqmp_r5_rproc_mem_unmap,
+                                          rmem->name);
+               if (IS_ERR_OR_NULL(mem))
+                       return -ENOMEM;
+
+               rproc_add_carveout(rproc, mem);
+       }
+
+       return 0;
+}
+
+/*
+ * zynqmp_r5_rproc_mem_unmap
+ * @rproc: single R5 core's corresponding rproc instance
+ * @mem: mem entry to unmap
+ *
+ * Unmap TCM banks when powering down R5 core.
+ *
+ * return 0 on success, otherwise non-zero value on failure
+ */
+static int tcm_mem_unmap(struct rproc *rproc, struct rproc_mem_entry *mem)
+{
+       struct zynqmp_r5_core *r5_core;
+       int i;
+       enum pm_node_id pm_domain_id;
+
+       r5_core =3D rproc->priv;
+       if (!r5_core) {
+               pr_err("r5 core is not available\n");
+               return -EINVAL;
+       }
+
+       iounmap((void __iomem *)mem->va);
+
+       for (i =3D 0; i < r5_core->tcm_bank_count; i++) {
+               pm_domain_id =3D r5_core->tcm_banks[i].pm_domain_id;
+               if (zynqmp_pm_release_node(pm_domain_id))
+                       pr_warn("can't turn off TCM bank %d", pm_domain_id)=
;
+       }
+
+       return 0;
+}
+
+/*
+ * tcm_mem_map
+ * @rproc: single R5 core's corresponding rproc instance
+ * @mem: mem entry to initialize the va and da fields of
+ *
+ * Given TCM bank entry, this callback will set device address for R5
+ * running on TCM and also setup virtual address for TCM bank
+ * remoteproc carveout.
+ *
+ * return 0 on success, otherwise non-zero value on failure
+ */
+static int tcm_mem_map(struct rproc *rproc,
+                        struct rproc_mem_entry *mem)
+{
+       void __iomem *va;
+
+       va =3D ioremap_wc(mem->dma, mem->len);
+       if (IS_ERR_OR_NULL(va))
+               return -ENOMEM;
+
+       /* Update memory entry va */
+       mem->va =3D (void *)va;
+
+       /* clear TCMs */
+       memset_io(va, 0, mem->len);
+
+       /*
+        * The R5s expect their TCM banks to be at address 0x0 and 0x2000,
+        * while on the Linux side they are at 0xffexxxxx.
+        *
+        * Zero out the high 12 bits of the address. This will give
+        * expected values for TCM Banks 0A and 0B (0x0 and 0x20000).
+        */
+       mem->da &=3D 0x000fffff;
+
+       /*
+        * TCM Banks 1A and 1B still have to be translated.
+        *
+        * Below handle these two banks' absolute addresses (0xffe90000 and
+        * 0xffeb0000) and convert to the expected relative addresses
+        * (0x0 and 0x20000).
+        */
+       if (mem->da =3D=3D 0x90000 || mem->da =3D=3D 0xB0000)
+               mem->da -=3D 0x90000;
+
+       /* if translated TCM bank address is not valid report error */
+       if (mem->da !=3D 0x0 && mem->da !=3D 0x20000) {
+               dev_err(&rproc->dev, "invalid TCM address: %x\n", mem->da);
+               return -EINVAL;
+       }
+       return 0;
+}
+
+static int add_tcm_carveout_split_mode(struct rproc *rproc)
+{
+       int i, num_banks, ret;
+       struct rproc_mem_entry *mem;
+       enum pm_node_id pm_domain_id;
+       u32 bank_addr;
+       size_t bank_size =3D 0;
+       char *bank_name;
+       struct device *dev;
+       struct zynqmp_r5_core *r5_core;
+
+       r5_core =3D (struct zynqmp_r5_core *)rproc->priv;
+       if (!r5_core)
+               return -EINVAL;
+
+       dev =3D r5_core->dev;
+
+       /* go through zynqmp banks for r5 node */
+       num_banks =3D r5_core->tcm_bank_count;
+       if (num_banks <=3D 0) {
+               dev_err(dev, "need to specify TCM banks\n");
+               return -EINVAL;
+       }
+
+       for (i =3D 0; i < num_banks; i++) {
+               bank_addr =3D (u32)r5_core->tcm_banks[i].addr;
+               bank_name =3D r5_core->tcm_banks[i].bank_name;
+               bank_size =3D r5_core->tcm_banks[i].size;
+               pm_domain_id =3D r5_core->tcm_banks[i].pm_domain_id;
+
+               ret =3D zynqmp_pm_request_node(pm_domain_id,
+                                            ZYNQMP_PM_CAPABILITY_ACCESS, 0=
,
+                                            ZYNQMP_PM_REQUEST_ACK_BLOCKING=
);
+               if (ret < 0) {
+                       dev_err(dev, "failed to turn on TCM %d", pm_domain_=
id);
+                       return ret;
+               }
+
+               dev_dbg(dev, "TCM carveout split mode %s addr=3D%x, size=3D=
0x%lx",
+                       bank_name, bank_addr, bank_size);
+
+               /* add carveout */
+               mem =3D rproc_mem_entry_init(dev, NULL, bank_addr,
+                                          bank_size, bank_addr,
+                                          tcm_mem_map, tcm_mem_unmap,
+                                          bank_name);
+               if (IS_ERR_OR_NULL(mem)) {
+                       /* Turn off all TCM banks turned on before */
+                       do {
+                               pm_domain_id =3D r5_core->tcm_banks[i].pm_d=
omain_id;
+                               ret =3D zynqmp_pm_release_node((u32)pm_doma=
in_id);
+                               if (ret)
+                                       dev_warn(dev,
+                                                "fail to release node: %x,=
 %x\n",
+                                                (u32)pm_domain_id, ret);
+                       } while (i--);
+                       return -ENOMEM;
+               }
+
+               rproc_add_carveout(rproc, mem);
+       }
+
+       return 0;
+}
+
+static int add_tcm_carveout_lockstep_mode(struct rproc *rproc)
+{
+       int i, num_banks, ret;
+       struct rproc_mem_entry *mem;
+       enum pm_node_id pm_domain_id;
+       u32 bank_addr;
+       size_t bank_size =3D 0;
+       char *bank_name;
+       struct device *dev;
+       struct platform_device *parent_pdev;
+       struct zynqmp_r5_cluster *cluster;
+       struct zynqmp_r5_core *r5_core;
+
+       r5_core =3D (struct zynqmp_r5_core *)rproc->priv;
+       if (!r5_core)
+               return -EINVAL;
+
+       dev =3D r5_core->dev;
+       if (!dev) {
+               pr_err("r5 core device unavailable\n");
+               return -ENODEV;
+       }
+
+       /* go through zynqmp banks for r5 node */
+       num_banks =3D r5_core->tcm_bank_count;
+       if (num_banks <=3D 0) {
+               dev_err(dev, "need to specify TCM banks\n");
+               return -EINVAL;
+       }
+
+       bank_addr =3D (u32)r5_core->tcm_banks[0].addr;
+       bank_name =3D r5_core->tcm_banks[0].bank_name;
+       for (i =3D 0; i < num_banks; i++) {
+               bank_size +=3D r5_core->tcm_banks[i].size;
+               pm_domain_id =3D r5_core->tcm_banks[i].pm_domain_id;
+
+               ret =3D zynqmp_pm_request_node(pm_domain_id,
+                                            ZYNQMP_PM_CAPABILITY_ACCESS, 0=
,
+                                            ZYNQMP_PM_REQUEST_ACK_BLOCKING=
);
+               if (ret < 0) {
+                       dev_err(dev, "failed to turn on TCM %d", pm_domain_=
id);
+                       return ret;
+               }
+       }
+
+       dev_dbg(dev, "TCM add carveout lockstep mode %s addr=3D0x%x, size=
=3D0x%lx",
+               bank_name, bank_addr, bank_size);
+
+       /* add carveout */
+       mem =3D rproc_mem_entry_init(dev, NULL, bank_addr,
+                                  bank_size, bank_addr,
+                                  tcm_mem_map, tcm_mem_unmap,
+                                  bank_name);
+       if (IS_ERR_OR_NULL(mem)) {
+               for (i =3D 0; i < num_banks; i++) {
+                       pm_domain_id =3D r5_core->tcm_banks[i].pm_domain_id=
;
+                       ret =3D zynqmp_pm_release_node((u32)pm_domain_id);
+                       if (ret)
+                               dev_warn(dev,
+                                        "fail to release node: %x ret: %x\=
n",
+                                        (u32)pm_domain_id, ret);
+               }
+               return -ENOMEM;
+       }
+
+       rproc_add_carveout(rproc, mem);
+
+       return 0;
+}
+
+/*
+ * add_tcm_banks()
+ * @rproc: single R5 core's corresponding rproc instance
+ *
+ * Given R5 node in remoteproc instance
+ * allocate remoteproc carveout for TCM memory
+ * needed for firmware to be loaded
+ *
+ * return 0 on success, otherwise non-zero value on failure
+ */
+static int add_tcm_banks(struct rproc *rproc)
+{
+       struct device *dev;
+       struct platform_device *parent_pdev;
+       struct zynqmp_r5_cluster *cluster;
+       struct zynqmp_r5_core *r5_core;
+
+       r5_core =3D (struct zynqmp_r5_core *)rproc->priv;
+       if (!r5_core)
+               return -EINVAL;
+
+       dev =3D r5_core->dev;
+       if (!dev) {
+               pr_err("r5 core device unavailable\n");
+               return -ENODEV;
+       }
+
+       parent_pdev =3D to_platform_device(dev->parent);
+       if (!parent_pdev) {
+               dev_err(dev, "parent platform dev unavailable\n");
+               return -ENODEV;
+       }
+
+       cluster =3D platform_get_drvdata(parent_pdev);
+       if (!cluster) {
+               dev_err(&parent_pdev->dev, "Invalid driver data\n");
+               return -EINVAL;
+       }
+
+       if (cluster->mode =3D=3D SPLIT_MODE)
+               return add_tcm_carveout_split_mode(rproc);
+       else if (cluster->mode =3D=3D LOCKSTEP_MODE)
+               return add_tcm_carveout_lockstep_mode(rproc);
+
+       dev_err(cluster->dev, "invalid cluster mode\n");
+       return -EINVAL;
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
+static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmware *=
fw)
+{
+       int ret;
+       struct zynqmp_r5_core *r5_core;
+       struct device *dev;
+
+       r5_core =3D rproc->priv;
+       if (!r5_core) {
+               dev_err(&rproc->dev, "r5 core not available\n");
+               return -EINVAL;
+       }
+
+       dev =3D r5_core->dev;
+
+       ret =3D add_tcm_banks(rproc);
+       if (ret) {
+               dev_err(dev, "failed to get TCM banks, err %d\n", ret);
+               return ret;
+       }
+
+       ret =3D add_mem_regions(rproc);
+       if (ret)
+               dev_warn(dev, "failed to get reserve mem regions %d\n", ret=
);
+
+       ret =3D rproc_elf_load_rsc_table(rproc, fw);
+       if (ret =3D=3D -EINVAL) {
+               /*
+                * resource table only required for IPC.
+                * if not present, this is not necessarily an error;
+                * for example, loading r5 hello world application
+                * so simply inform user and keep going.
+                */
+               dev_info(&rproc->dev, "no resource table found.\n");
+               ret =3D 0;
+       }
+       return ret;
+}
+
+static struct rproc_ops zynqmp_r5_rproc_ops =3D {
+       .start          =3D zynqmp_r5_rproc_start,
+       .stop           =3D zynqmp_r5_rproc_stop,
+       .load           =3D rproc_elf_load_segments,
+       .parse_fw       =3D zynqmp_r5_parse_fw,
+       .find_loaded_rsc_table =3D rproc_elf_find_loaded_rsc_table,
+       .sanity_check   =3D rproc_elf_sanity_check,
+       .get_boot_addr  =3D rproc_elf_get_boot_addr,
+};
+
+static void zynqmp_r5_print_dt_node_info(struct zynqmp_r5_cluster *cluster=
)
+{
+       int i, j, k;
+       struct zynqmp_r5_core *r5_core;
+
+       dev_dbg(cluster->dev, "Printing dt node info\n");
+
+       pr_debug("cluster mode =3D %d\n", cluster->mode);
+       pr_debug("r5f cluster in %s mode\n", (cluster->mode =3D=3D 0) ? "SP=
LIT" :
+                cluster->mode =3D=3D 1 ? "LOCKSTEP" : "SINGLE_CPU");
+       pr_debug("r5f num cores =3D %d\n", cluster->core_count);
+
+       for (i =3D 0; i < cluster->core_count; i++) {
+               r5_core =3D &cluster->r5_cores[i];
+               if (!r5_core) {
+                       pr_err("can't get r5_core\n");
+                       continue;
+               }
+
+               pr_debug("r5 core %d nodes\n", i);
+               pr_debug("TCM banks =3D %d\n", r5_core->tcm_bank_count);
+               for (k =3D 0; k < r5_core->tcm_bank_count; k++) {
+                       pr_debug("tcm %d addr=3D0x%llx size=3D0x%lx, pm_id=
=3D%d, %s\n",
+                                k, r5_core->tcm_banks[k].addr,
+                                r5_core->tcm_banks[k].size,
+                                r5_core->tcm_banks[k].pm_domain_id,
+                                r5_core->tcm_banks[k].bank_name);
+               }
+
+               pr_debug("reserve mem regions =3D %d\n", r5_core->res_mem_c=
ount);
+
+               for (j =3D 0; j < r5_core->res_mem_count; j++) {
+                       pr_debug("mem %d addr=3D0x%llx, size=3D0x%llx, name=
=3D%s\n",
+                                j, r5_core->res_mem[j].base,
+                                r5_core->res_mem[j].size,
+                                r5_core->res_mem[j].name);
+               }
+       }
+}
+
+/**
+ * zynqmp_r5_add_rproc_core() - Probes ZynqMP R5 processor device node
+ *                    this is called for each individual R5 core to
+ *                    set up mailbox, Xilinx platform manager unique ID,
+ *                    add to rproc core
+ *
+ * @r5_core: zynqmp_r5_core r5 core object to initialize
+ *
+ * Return: 0 for success, negative value for failure.
+ */
+static int zynqmp_r5_add_rproc_core(struct zynqmp_r5_core *r5_core)
+{
+       int ret;
+       struct rproc *r5_rproc;
+       struct device *dev;
+
+       dev =3D r5_core->dev;
+
+       /* Set up DMA mask */
+       ret =3D dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
+       if (ret)
+               return ret;
+
+       /* Allocate remoteproc instance */
+       r5_rproc =3D devm_rproc_alloc(dev, dev_name(dev), &zynqmp_r5_rproc_=
ops,
+                                   NULL, sizeof(struct zynqmp_r5_core));
+       if (IS_ERR_OR_NULL(r5_rproc))
+               return -ENOMEM;
+
+       r5_rproc->auto_boot =3D false;
+       r5_rproc->priv =3D r5_core;
+
+       /* Add R5 remoteproc */
+       ret =3D devm_rproc_add(dev, r5_rproc);
+       if (ret) {
+               pr_err("failed to add r5 remoteproc\n");
+               return ret;
+       }
+
+       return 0;
+}
+
+static int zynqmp_r5_get_tcm_node(struct zynqmp_r5_cluster *cluster)
+{
+       int tcm_bank_count, tcm_node;
+       int i =3D 0, j;
+       struct zynqmp_r5_core *r5_core;
+       const struct mem_bank_data *tcm =3D zynqmp_tcm_banks;
+       struct device *dev =3D cluster->dev;
+
+       /* ToDo: Use predefined TCM address space values from driver until
+        * system-dt spec is not final fot TCM
+        */
+       tcm_bank_count =3D ARRAY_SIZE(zynqmp_tcm_banks);
+
+       /* count per core tcm banks */
+       tcm_bank_count =3D tcm_bank_count / cluster->core_count;
+
+       /* r5 core 0 will use all of TCM banks in lockstep mode.
+        * In split mode, r5 core0 will use 128k and r5 core1 will use anot=
her
+        * 128k. Assign TCM banks to each core accordingly
+        */
+       tcm_node =3D 0;
+       for (j =3D 0; j < cluster->core_count; j++) {
+               r5_core =3D &cluster->r5_cores[j];
+               r5_core->tcm_banks =3D devm_kzalloc(dev, sizeof(struct mem_=
bank_data) *
+                                                 tcm_bank_count, GFP_KERNE=
L);
+               if (IS_ERR_OR_NULL(r5_core->tcm_banks))
+                       return -ENOMEM;
+
+               for (i =3D 0; i < tcm_bank_count; i++) {
+                       /* Use pre-defined TCM reg values.
+                        * Eventually this should be replaced by values
+                        * parsed from dts.
+                        */
+                       r5_core->tcm_banks[i].addr =3D tcm[tcm_node].addr;
+                       r5_core->tcm_banks[i].size =3D tcm[tcm_node].size;
+                       r5_core->tcm_banks[i].pm_domain_id =3D tcm[tcm_node=
].pm_domain_id;
+                       r5_core->tcm_banks[i].bank_name =3D tcm[tcm_node].b=
ank_name;
+                       tcm_node++;
+               }
+
+               r5_core->tcm_bank_count =3D tcm_bank_count;
+       }
+
+       return 0;
+}
+
+static int zynqmp_r5_get_mem_region_node(struct zynqmp_r5_core *r5_core)
+{
+       int res_mem_count, i;
+       struct device *dev;
+       struct device_node *np, *rmem_np;
+       struct reserved_mem *rmem;
+
+       dev =3D r5_core->dev;
+
+       np =3D r5_core->np;
+       if (IS_ERR_OR_NULL(np)) {
+               pr_err("invalid device node of r5 core\n");
+               return -EINVAL;
+       }
+
+       res_mem_count =3D of_property_count_elems_of_size(np, "memory-regio=
n",
+                                                       sizeof(phandle));
+       if (res_mem_count <=3D 0) {
+               dev_warn(dev, "failed to get memory-region property %d\n",
+                        res_mem_count);
+               return -EINVAL;
+       }
+
+       r5_core->res_mem =3D devm_kzalloc(dev,
+                                       res_mem_count * sizeof(struct reser=
ved_mem),
+                                       GFP_KERNEL);
+       if (!r5_core->res_mem) {
+               dev_err(dev, "failed to allocate mem region memory\n");
+               return -ENOMEM;
+       }
+
+       for (i =3D 0; i < res_mem_count; i++) {
+               rmem_np =3D of_parse_phandle(np, "memory-region", i);
+               if (!rmem_np)
+                       return -EINVAL;
+
+               rmem =3D of_reserved_mem_lookup(rmem_np);
+               if (!rmem) {
+                       of_node_put(rmem_np);
+                       return -EINVAL;
+               }
+
+               memcpy(&r5_core->res_mem[i], rmem,
+                      sizeof(struct reserved_mem));
+               of_node_put(rmem_np);
+       }
+
+       r5_core->res_mem_count =3D res_mem_count;
+
+       return 0;
+}
+
+static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster)
+{
+       int ret, i;
+       struct zynqmp_r5_core *r5_core;
+       struct device *dev =3D cluster->dev;
+
+       ret =3D zynqmp_r5_get_tcm_node(cluster);
+       if (ret < 0) {
+               dev_err(dev, "can't get tcm node, err %d\n", ret);
+               return ret;
+       }
+
+       for (i =3D 0; i < cluster->core_count; i++) {
+               r5_core =3D &cluster->r5_cores[i];
+               if (!r5_core) {
+                       pr_err("invalid r5 core\n");
+                       return -EINVAL;
+               }
+
+               ret =3D zynqmp_r5_get_mem_region_node(r5_core);
+               if (ret)
+                       dev_warn(dev, "memory-region prop failed %d\n", ret=
);
+
+               ret =3D of_property_read_u32_index(r5_core->np, "power-doma=
ins",
+                                                1, &r5_core->pm_domain_id)=
;
+               if (ret) {
+                       dev_err(dev, "failed to get power-domains property\=
n");
+                       return ret;
+               }
+
+               ret =3D zynqmp_r5_set_mode(r5_core, cluster->mode);
+               if (ret)
+                       return ret;
+
+               ret =3D zynqmp_r5_add_rproc_core(r5_core);
+               if (ret) {
+                       dev_err(dev, "failed to init r5 core %d\n", i);
+                       return ret;
+               }
+       }
+
+       return 0;
+}
+
+static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
+{
+       struct device *dev =3D cluster->dev;
+       struct device_node *dev_node =3D dev_of_node(dev);
+       struct device_node *child;
+       struct platform_device *child_pdev;
+       int core_count =3D 0, ret, i;
+       enum zynqmp_r5_cluster_mode cluster_mode =3D LOCKSTEP_MODE;
+       struct zynqmp_r5_core *r5_cores;
+
+       ret =3D of_property_read_u32(dev_node, "xlnx,cluster-mode", &cluste=
r_mode);
+
+       /* on success returns 0, if not defined then returns -EINVAL,
+        * In that case, default is LOCKSTEP mode
+        */
+       if (ret !=3D -EINVAL && ret !=3D 0) {
+               dev_err(dev, "Invalid xlnx,cluster-mode property\n");
+               return -EINVAL;
+       }
+
+       if (cluster_mode =3D=3D SINGLE_CPU_MODE) {
+               dev_err(dev, "driver does not support single cpu mode\n");
+               return -EINVAL;
+       } else if ((cluster_mode !=3D SPLIT_MODE &&
+                  cluster_mode !=3D LOCKSTEP_MODE)) {
+               dev_err(dev, "Invalid cluster mode\n");
+               return -EINVAL;
+       }
+
+       core_count =3D of_get_available_child_count(dev_node);
+       if (core_count <=3D 0) {
+               dev_err(dev, "Invalid number of r5 cores %d", core_count);
+               return -EINVAL;
+       } else if (cluster_mode =3D=3D SPLIT_MODE && core_count !=3D 2) {
+               dev_err(dev, "Invalid number of r5 cores for split mode\n")=
;
+               return -EINVAL;
+       } else if (cluster_mode =3D=3D LOCKSTEP_MODE && core_count =3D=3D 2=
) {
+               dev_warn(dev, "Only r5 core0 will be used\n");
+               core_count =3D 1;
+       }
+
+       r5_cores =3D devm_kzalloc(dev, sizeof(struct zynqmp_r5_core) *
+                                                core_count, GFP_KERNEL);
+       if (IS_ERR_OR_NULL(r5_cores)) {
+               dev_err(dev, "can't allocate memory for cores\n");
+               return -ENOMEM;
+       }
+
+       i =3D 0;
+       for_each_available_child_of_node(dev_node, child) {
+               child_pdev =3D of_find_device_by_node(child);
+               if (!child_pdev)
+                       return -ENODEV;
+
+               r5_cores[i].dev =3D &child_pdev->dev;
+               if (!r5_cores[i].dev) {
+                       pr_err("can't get device for r5 core %d\n", i);
+                       return -ENODEV;
+               }
+
+               r5_cores[i].np =3D dev_of_node(r5_cores[i].dev);
+               if (!r5_cores[i].np) {
+                       pr_err("can't get device node for r5 core %d\n", i)=
;
+                       return -ENODEV;
+               }
+
+               i++;
+               if (i =3D=3D core_count)
+                       break;
+       }
+
+       cluster->mode =3D cluster_mode;
+       cluster->core_count =3D core_count;
+       cluster->r5_cores =3D r5_cores;
+
+       ret =3D zynqmp_r5_core_init(cluster);
+       if (ret < 0) {
+               dev_err(dev, "failed to init r5 core err %d\n", ret);
+               return ret;
+       }
+
+       zynqmp_r5_print_dt_node_info(cluster);
+
+       return 0;
+}
+
+static void zynqmp_r5_cluster_exit(void *data)
+{
+       struct platform_device *pdev =3D (struct platform_device *)data;
+
+       platform_set_drvdata(pdev, NULL);
+
+       pr_info("Exit r5f subsystem driver\n");
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
+       int ret;
+       struct zynqmp_r5_cluster *cluster;
+       struct device *dev =3D &pdev->dev;
+
+       cluster =3D devm_kzalloc(dev, sizeof(*cluster), GFP_KERNEL);
+       if (IS_ERR_OR_NULL(cluster))
+               return -ENOMEM;
+
+       cluster->dev =3D dev;
+
+       ret =3D devm_of_platform_populate(dev);
+       if (ret) {
+               dev_err(dev, "failed to populate platform dev %d\n", ret);
+               return ret;
+       }
+
+       /* wire in so each core can be cleaned up at driver remove */
+       platform_set_drvdata(pdev, cluster);
+
+       ret =3D devm_add_action_or_reset(dev, zynqmp_r5_cluster_exit, pdev)=
;
+       if (ret)
+               return ret;
+
+       ret =3D zynqmp_r5_cluster_init(cluster);
+       if (ret) {
+               dev_err(dev, "Invalid r5f subsystem device tree\n");
+               return ret;
+       }
+
+       dev_info(dev, "Xilinx r5f remoteproc driver probe success\n");
+       return 0;
+}
+
+/* Match table for OF platform binding */
+static const struct of_device_id zynqmp_r5_remoteproc_match[] =3D {
+       { .compatible =3D "xlnx,zynqmp-r5fss", },
+       { /* end of list */ },
+};
+MODULE_DEVICE_TABLE(of, zynqmp_r5_remoteproc_match);
+
+static struct platform_driver zynqmp_r5_remoteproc_driver =3D {
+       .probe =3D zynqmp_r5_remoteproc_probe,
+       .driver =3D {
+               .name =3D "zynqmp_r5_remoteproc",
+               .of_match_table =3D zynqmp_r5_remoteproc_match,
+       },
+};
+module_platform_driver(zynqmp_r5_remoteproc_driver);
+
+MODULE_DESCRIPTION("Xilinx R5F remote processor driver");
+MODULE_AUTHOR("Xilinx Inc.");
+MODULE_LICENSE("GPL v2");
--
2.25.1

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
