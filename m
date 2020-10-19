Return-Path: <SRS0=uUKq=D2=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A961C433DF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 22:40:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08510223FD
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 22:40:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="emMd/NqH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388530AbgJSWkY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 19 Oct 2020 18:40:24 -0400
Received: from mail-co1nam11on2077.outbound.protection.outlook.com ([40.107.220.77]:32737
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388482AbgJSWkX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 19 Oct 2020 18:40:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHqe4+ZPsXcYm0jKeSNnl8OAPqIrS0Oybu65OzuAaSKcjRK7A6YJjlu5QQIk5aCLmcjxneh7dZhByCaskcqV7aV2Jm9bl1z9R2DIXSaz4p4KkdkkV7FOsBTg1rOV9QwLyUpY3C4BiQMYl9D9x5NPJDbE5XP6/Ed3avVwDLD8YsMMuHBjPDZ7BLf1XXnmZ/3J9qL0adegsHsxXoMNuwuiVnhkHyF3WcyFAWdextjd6BXkUC/VGWDF3rubNSlpRrkI4xkqv3zh4WrIqYX7CHuMt2HOMPV1CAeWO3rXUGGq6eo5zAV+Q/uJn4rJ2ShtCRQxPIO31WlgiTRlU7VWH0vjww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tos1l/PJYQkOKN+XpoKBTR4z6CXr83JLlSMPld8rEYM=;
 b=f/63Aj6ehCXJi0BpVG9RLdaLeMWgfvKvYdrBFT7Gl3n9vrVOT9/QamMklNDdrhVSeD0QDQ1d2+N3JOvVzdVrUi9LqZZmsKL+fN5hkzirr5/lxj5x06ByCADOYPjz2BxkYzTNmSUR+Rt3ocKyxHNARsRJWE3I8G783DRmWB0otnYEG/o85qfv7lb/RT0MExQzU6kSqJcGq26g9zUwr+EFfluNut44Rh8Hm0uNcMFtLNqxYNoKZnkh57gYN4yvHLRmd8NC5Rtoftc6OERXQWs1gma+xlGcdstD+E2l9sAd1LWs9pVCws7irIBeqlstmTPY5rnBlD6ux4b3+nrjyigPPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tos1l/PJYQkOKN+XpoKBTR4z6CXr83JLlSMPld8rEYM=;
 b=emMd/NqHdbzseGi9GR3duZdDtOPf9L9ZXzh+x5xXqMf4NtUrBwhm282dvWK8mZqaLzspu8+6Xg5l4nUGZ9kURYlRfy8dUM5l9Bai/EDsVAg9+Vnas9DAaHR84jWEi9ty+fPsaRNoW0yNY9hfJWqDS+wNbJ3OtZuZLUgi45ZsUAw=
Received: from SN2PR01CA0066.prod.exchangelabs.com (2603:10b6:800::34) by
 BN7PR02MB5172.namprd02.prod.outlook.com (2603:10b6:408:24::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.25; Mon, 19 Oct 2020 22:40:15 +0000
Received: from SN1NAM02FT011.eop-nam02.prod.protection.outlook.com
 (2603:10b6:800:0:cafe::48) by SN2PR01CA0066.outlook.office365.com
 (2603:10b6:800::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.23 via Frontend
 Transport; Mon, 19 Oct 2020 22:40:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT011.mail.protection.outlook.com (10.152.72.82) with Microsoft SMTP
 Server id 15.20.3477.21 via Frontend Transport; Mon, 19 Oct 2020 22:40:15
 +0000
Received: from [149.199.38.66] (port=34022 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kUdoG-0004rK-DX; Mon, 19 Oct 2020 15:39:20 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kUdp8-0007Tv-PC; Mon, 19 Oct 2020 15:40:14 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 09JMe82Q026644;
        Mon, 19 Oct 2020 15:40:08 -0700
Received: from [172.19.2.206] (helo=xsjblevinsk50.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kUdp1-0007R9-Um; Mon, 19 Oct 2020 15:40:08 -0700
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     sunnyliangjy@gmail.com, punit1.agrawal@toshiba.co.jp,
        stefanos@xilinx.com, michals@xilinx.com, michael.auchter@ni.com
Cc:     devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v19 5/5] remoteproc: Add initial zynqmp R5 remoteproc driver
Date:   Mon, 19 Oct 2020 15:40:07 -0700
Message-Id: <20201019224007.16846-6-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019224007.16846-1-ben.levinsky@xilinx.com>
References: <20201019224007.16846-1-ben.levinsky@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 64f54e8b-cb4e-47dd-2fd6-08d8747ff282
X-MS-TrafficTypeDiagnostic: BN7PR02MB5172:
X-Microsoft-Antispam-PRVS: <BN7PR02MB51728AC5F952EFADE4214732B51E0@BN7PR02MB5172.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:155;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z+0tV2Jcjtb01wQe9ador/RC/dhDWyiwmBmirTMg0Bbp4pwYi4OHUGBNmvLcbjyvhxNNBV3+7ehDlrBYOXrCjr6c0XKmnD4BGJmVOK0Tvl2mwZxkrnUldvmlaXMhoGyisx7EaTn1WZ8ZH517Y5r2wufJLEfBPtgLLvvOutZTaxvtaGWHewrDFdWB752i6exdU5ThuMDr9fT3caQnsm/HhYr+vJyyCQK625m9H3tTQenNuxWMPf7A2rraf07R3pOnXzL1cPNhEiShD1dKi+GUKu0SjwK6gPK+IodCc0p8m1gWRF9oOOQe7z/j9qbD/MhEcKf9EZQfI8Gz5JPCE6F3BDMMtsk3Rjob1DY0B+9U8722ep5+NaYtKlEVXNhveTCVtme1nF0jDqvIlwHapTN49g==
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(136003)(346002)(376002)(39860400002)(396003)(46966005)(30864003)(2616005)(83380400001)(7696005)(70206006)(47076004)(426003)(82740400003)(26005)(186003)(70586007)(81166007)(478600001)(5660300002)(8936002)(82310400003)(8676002)(36756003)(316002)(2906002)(4326008)(44832011)(9786002)(356005)(1076003)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 22:40:15.1092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64f54e8b-cb4e-47dd-2fd6-08d8747ff282
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT011.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5172
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

R5 is included in Xilinx Zynq UltraScale MPSoC so by adding this
remotproc driver, we can boot the R5 sub-system in different 2
configurations -
	* split
	* lock-step

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
v2:
 - remove domain struct as per review from Mathieu
v3:
 - add xilinx-related platform mgmt fn's instead of wrapping around
   function pointer in xilinx eemi ops struct
v4:
 - add default values for enums
 - fix formatting as per checkpatch.pl --strict. Note that 1 warning and 1 check
   are still raised as each is due to fixing the warning results in that
 particular line going over 80 characters.
v5:
 - parse_fw change from use of rproc_of_resm_mem_entry_init to
 rproc_mem_entry_init and use of alloc/release
 - var's of type zynqmp_r5_pdata all have same local variable name
 - use dev_dbg instead of dev_info
v6:
 - adding memory carveouts is handled much more similarly. All mem
 carveouts are
   now described in reserved memory as needed. That is, TCM nodes are not
   coupled to remoteproc anymore. This is reflected in the remoteproc R5
 driver
   and the device tree binding.
 - remove mailbox from device tree binding as it is not necessary for elf
   loading
 - use lockstep-mode property for configuring RPU
v7:
 - remove unused headers
 - change  u32 *lockstep_mode ->  u32 lockstep_mode;
 - change device-tree binding "lockstep-mode"  to xlnx,cluster-mode
 - remove zynqmp_r5_mem_probe and loop to Probe R5 memory devices at
   remoteproc-probe time
 - remove is_r5_mode_set from  zynqmp rpu remote processor private data
 - do not error out if no mailbox is provided
 - remove zynqmp_r5_remoteproc_probe call of platform_set_drvdata as
 pdata is
   handled in zynqmp_r5_remoteproc_remove
v8:
 - remove old acks, reviewed-by's in commit message
v9:
- as mboxes are now optional, if pdata->tx_mc_skbs not initialized then
  do not call skb_queue_empty
- update usage for zynqmp_pm_set_rpu_mode, zynqmp_pm_set_tcm_config and
  zynqmp_pm_get_rpu_mode
- update 5/5 patch commit message to document supported configurations
  and how they are booted by the driver.
- remove copyrights other than SPDX from zynqmp_r5_remoteproc.c
- compilation warnings no longer raised
- remove unused includes from zynqmp_r5_remoteproc.c
- remove unused  var autoboot from zynqmp_r5_remoteproc.c
- reorder zynqmp_r5_pdata fpr small mem savings due to alignment
- use of zynqmp_pm_set_tcm_config now does not have
  output arg
- in tcm handling, unconditionally use &= 0x000fffff mask since all nodes
  in this fn are for tcm
- update comments for translating dma field in tcm handling to device
  address
- update calls to rproc_mem_entry_init in parse_mem_regions so that there
  are only 2 cases for types of carveouts instead of 3
- in parse_mem_regions, check if device tree node is null before using it
- add example device tree nodes used in parse_mem_regions and tcm parsing
- add comment for vring id node length
- add check for string length so that vring id is at least min length
- move tcm nodes from reserved mem to instead own device tree nodes
   and only use them if enabled in device tree
- add comment for explaining handling of rproc_elf_load_rsc_table
- remove obsolete check for "if (vqid < 0)" in zynqmp_r5_rproc_kick
- remove unused field mems in struct zynqmp_r5_pdata
- remove call to zynqmp_r5_mem_probe and the fn itself as tcm handling
  is done by zyqmp_r5_pm_request_tcm
- remove obsolete setting of dma_ops and parent device dma_mask
- remove obsolete use of of_dma_configure
- add comment for call to r5_set_mode fn
- make mbox usage optional and gracefully inform user via dev_dbg if not
  present
- change var lockstep_mode from u32* to u32
v11:
- use enums instead of u32 where possible in zynqmp_r5_remoteproc
- update usage of zynqmp_pm_set/get_rpu_mode and zynqmp_pm_set_tcm_config
- update prints to not use carriage return, just newline
- look up tcm banks via property in r5 node instead of string name
- print device tree nodes with %pOF instead of %s with node name field
- update tcm release to unmap VA
- handle r5-1 use case
v12:
- update signed off by so that latest developer name is last
- do not cast enums to u32s for zynqmp_pm* functions
v14:
- change zynqmp_r5_remoteproc::rpus and rpu_mode to static
- fix typo
- zynqmp_r5_remoteproc::r5_set_mode set rpu mode from
  property specified in device tree
- use u32 instead of u32* to store in remoteproc memory entry private data
  for pnode_id information
- always call r5_set_mode on probe
- remove alloc of zynqmp_r5_pdata in
  zynqmp_r5_remoteproc::zynqmp_r5_remoteproc_probe as there is static
  allocation already
- error at probe time if lockstep-mode property not present in device tree
- update commit message as per review
- remove dependency on MAILBOX in makefile as ZYNQMP_IPI_MBOX is present
- remove unused macros
- update comment ordering of zynqmp_r5_pdata to match struct definition
- zynqmp_r5_remoteproc::tcm_mem_release error if pnode id is invalid
- remove obsolete TODOs
- only call zynqmp_r5_remoteproc::zynqmp_r5_probe if the index is valid
- remove uneven dev_dbg/dev_err fn calls
v15:
- if lockstep mode prop is present, then RPU cluster is in lockstep mode.
  if not present, cluster is in split mode.
- if 2 RPUs provided but one is lockstep then error out as this is invalid
  configuration
v16:
- replace of_get_property(dev->of_node, "lockstep-mode" with
  of_property_read_bool
- propagate rpu mode specified in device tree through functions instead
  of holding a global, static var
- check child remoteproc nodes via of_get_available_child_count before
  looping through children
- replace check of "pdata->pnode_id == 0" instead by checking rpu's
  zynqmp_r5_pdata* if NULL
- remove old, obsolete checks for dma_pools in zynqmp_r5_remoteproc_remove
- change rpus from zynqmp_r5_pdata[] to zynqmp_r5_pdata*[] so that
  check for pdata->pnode_id == 0 is not needed
v17:
- fix style as per kernel test bot
v18:
- to more closely mimic other remoteproc drivers, change zynqmp r5 rproc
  data from zynqmp_r5_pdata to zynqmp_r5_rproc and pdata local var to
  zproc
- remove global vars rpus and rpu_mode
- instantiate device for zynqmp r5 rproc from device set by rproc_alloc
- fix typos
- update to call zynqmp_r5_release from the rproc_alloc-related device and
  remove the instantiated device from zynqmp_r5_probe
- remove unneeded call to platform_set_drvdata
- remove driver remove function, as the clean up is handled in release
- remove while (!skb_queue_empty loop and mbox_free_channel calls in 
  zynqmp_r5_release, and mbox_free_channel
- remove device_unregister call in zynqmp_r5_release
- remove kzalloc for pdata (what is now called z_rproc)
- update conditional in loop to calls of zynqmp_r5_probe
v19:
- add comments for start, stop, rproc-related setup functions, remove, probe
- in z_rproc structure add linked list elem that is later used to
  keep track of house cleaning in driver remove and device tree node for
  mailbox client setup
- change z_rproc dev from struct device to struct device* so dont have to
  make a new device
- in zynqmp_r5_probe store in dt_node and dev pointer for later usage
  in mailbox client setup
- remove release, handle rproc and mbox cleanup in driver remove that
  is re-introduced
- tcm_mem_release() remove unneeded check for
  negative value on a u32
- prevent possible off-by-one error in bound checking for
  parse_mem_regions strlen
- fix checkpatch strict warnings for comments
- update tcm_mem_alloc bound check for TCM bank
  addresses


---
 drivers/remoteproc/Kconfig                |   8 +
 drivers/remoteproc/Makefile               |   1 +
 drivers/remoteproc/zynqmp_r5_remoteproc.c | 762 ++++++++++++++++++++++
 3 files changed, 771 insertions(+)
 create mode 100644 drivers/remoteproc/zynqmp_r5_remoteproc.c

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index c6659dfea7c7..68e567c5375c 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -275,6 +275,14 @@ config TI_K3_DSP_REMOTEPROC
 	  It's safe to say N here if you're not interested in utilizing
 	  the DSP slave processors.
 
+config ZYNQMP_R5_REMOTEPROC
+	tristate "ZynqMP_R5 remoteproc support"
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
index 000000000000..5586dec1fa9a
--- /dev/null
+++ b/drivers/remoteproc/zynqmp_r5_remoteproc.c
@@ -0,0 +1,762 @@
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
+#define BANK_LIST_PROP	"meta-memory-regions"
+#define DDR_LIST_PROP	"memory-regions"
+
+/* IPI buffer MAX length */
+#define IPI_BUF_LEN_MAX	32U
+/* RX mailbox client buffer max length */
+#define RX_MBOX_CLIENT_BUF_MAX	(IPI_BUF_LEN_MAX + \
+				 sizeof(struct zynqmp_ipi_message))
+
+/**
+ * struct zynqmp_r5_mem - zynqmp rpu memory data
+ * @pnode_id: TCM power domain ids
+ * @res: memory resource
+ * @node: list node
+ */
+struct zynqmp_r5_mem {
+	u32 pnode_id[MAX_MEM_PNODES];
+	struct resource res;
+	struct list_head node;
+};
+
+/**
+ * struct zynqmp_r5_rproc - zynqmp rpu remote processor state
+ *			    this is for each individual R5 core's state
+ *
+ * @rx_mc_buf: rx mailbox client buffer to save the rx message
+ * @tx_mc: tx mailbox client
+ * @rx_mc: rx mailbox client * @dev: device of RPU instance
+ * @mbox_work: mbox_work for the RPU remoteproc
+ * @tx_mc_skbs: socket buffers for tx mailbox client
+ * @dev: device of RPU instance
+ * @rproc: rproc handle
+ * @tx_chan: tx mailbox channel
+ * @rx_chan: rx mailbox channel
+ * @pnode_id: RPU CPU power domain id
+ * @elem: linked list item
+ * @dt_node: device tree node that holds information for 1 R5 core.
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
+	struct device_node *dt_node;
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
+ * release TCM banks when powering down R5 core
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
+ * given ID corresponding to R5 core in Xilinx Platform management (xpm) API,
+ * try to use xpm wake call to wake R5 core
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
+ * given ID corresponding to R5 core in Xilinx Platform management (xpm) API,
+ * try to use xpm power down call to power off R5 core
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
+ * map in physical addr for  DDR mem carveout in rproc
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
+	/* Update memory entry va */
+	mem->va = va;
+
+	return 0;
+}
+
+/* unmap rproc_mem_entry virtual addr */
+static int zynqmp_r5_rproc_mem_release(struct rproc *rproc,
+				       struct rproc_mem_entry *mem)
+{
+	iounmap(mem->va);
+	return 0;
+}
+
+/* construct rproc mem carveouts for DDR regions specified in device tree */
+static int parse_mem_regions(struct rproc *rproc)
+{
+	int num_mems, i;
+	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
+	struct device *dev = &rproc->dev;
+	struct device_node *np = z_rproc->dt_node;
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
+/* call Xilinx Platform manager to request access to TCM bank */
+static int zynqmp_r5_pm_request_tcm(struct device_node *tcm_node,
+				    struct device *dev, u32 *pnode_id)
+{
+	int ret;
+
+	ret = of_property_read_u32(tcm_node, "pnode-id", pnode_id);
+	if (ret)
+		return ret;
+
+	return zynqmp_pm_request_node(*pnode_id, ZYNQMP_PM_CAPABILITY_ACCESS, 0,
+				     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
+}
+
+/*
+ * Given TCM bank entry,
+ * this callback will set device address for R5 running on TCM
+ * and also setup virtual address for TCM bank remoteproc carveout
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
+	 * TCM Banks 0A and 0B (0xffe00000 and 0xffe20000)
+	 * are handled with the above line of code so do nothing
+	 * for this 2 banks
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
+ * Given R5 node in remoteproc instance
+ * allocate remoteproc carveout for TCM memory
+ * needed for firmware to be loaded
+ */
+static int parse_tcm_banks(struct rproc *rproc)
+{
+	int i, num_banks;
+	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
+	struct device *dev = &rproc->dev;
+	struct device_node *r5_node = z_rproc->dt_node;
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
+
+			ret = zynqmp_r5_pm_request_tcm(dt_node, dev, &pnode_id);
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
+ * when loading firmware, load in needed DDR, TCM memory regions and wire
+ * these into remoteproc core's carveouts
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
+/* kick a firmware */
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
+	skb_len = (unsigned int)(sizeof(vqid) + sizeof(mb_msg));
+	skb = alloc_skb(skb_len, GFP_ATOMIC);
+	if (!skb)
+		return;
+
+	mb_msg = (struct zynqmp_ipi_message *)skb_put(skb, skb_len);
+	mb_msg->len = sizeof(vqid);
+	memcpy(mb_msg->data, &vqid, sizeof(vqid));
+	skb_queue_tail(&z_rproc->tx_mc_skbs, skb);
+	ret = mbox_send_message(z_rproc->tx_chan, mb_msg);
+	if (ret < 0) {
+		dev_warn(dev, "Failed to kick remote.\n");
+		skb_dequeue_tail(&z_rproc->tx_mc_skbs);
+		kfree_skb(skb);
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
+ * handle_event_notified() - remoteproc notification work funciton
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
+ * @mssg: message pointer
+ *
+ * It will schedule the R5 notification work.
+ */
+static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *mssg)
+{
+	struct zynqmp_r5_rproc *z_rproc;
+
+	z_rproc = container_of(cl, struct zynqmp_r5_rproc, rx_mc);
+	if (mssg) {
+		struct zynqmp_ipi_message *ipi_msg, *buf_msg;
+		size_t len;
+
+		ipi_msg = (struct zynqmp_ipi_message *)mssg;
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
+ * @mssg: pointer to the message which has been sent
+ * @r: status of last TX - OK or error
+ *
+ * It will be called by the mailbox framework when the last TX has done.
+ */
+static void zynqmp_r5_mb_tx_done(struct mbox_client *cl, void *mssg, int r)
+{
+	struct zynqmp_r5_rproc *z_rproc;
+	struct sk_buff *skb;
+
+	if (!mssg)
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
+ * @z_rproc: pointer to the ZynqMP R5 processor platform data
+ * @pdev: parent RPU domain platform device
+ * @node: pointer of the device node
+ * @rpu_mode: mode to configure RPU, split or lockstep
+ * @z_rproc: Xilinx specific remoteproc structure used later to link
+ *           in to cluster of cores
+ *
+ * Function to retrieve the information of the ZynqMP R5 device node.
+ *
+ * Return: 0 for success, negative value for failure.
+ */
+static int zynqmp_r5_probe(struct platform_device *pdev,
+			   struct device_node *node,
+			   enum rpu_oper_mode rpu_mode,
+			   struct zynqmp_r5_rproc **core)
+{
+	int ret;
+	struct device *dev = &pdev->dev;
+	struct rproc *rproc_ptr;
+	struct zynqmp_r5_rproc *z_rproc;
+
+	/* Allocate remoteproc instance */
+	/* dev here is parent device of the allocated rproc's dev field */
+	rproc_ptr = rproc_alloc(dev, dev_name(dev), &zynqmp_r5_rproc_ops,
+				NULL, sizeof(struct zynqmp_r5_rproc));
+	if (!rproc_ptr)
+		return -ENOMEM;
+	z_rproc = rproc_ptr->priv;
+	z_rproc->dt_node = node;
+	z_rproc->rproc = rproc_ptr;
+	z_rproc->dev = &rproc_ptr->dev;
+	z_rproc->dev->of_node = node;
+
+	/* Set up DMA mask */
+	ret = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
+	if (ret)
+		goto error;
+	/* Get R5 power domain node */
+	ret = of_property_read_u32(node, "pnode-id", &z_rproc->pnode_id);
+	if (ret)
+		goto error;
+
+	ret = r5_set_mode(z_rproc, rpu_mode);
+	if (ret)
+		return ret;
+
+	if (of_property_read_bool(node, "mboxes")) {
+		ret = zynqmp_r5_setup_mbox(z_rproc, node);
+		if (ret)
+			goto error;
+	}
+	/* Add R5 remoteproc */
+	ret = rproc_add(rproc_ptr);
+	if (ret)
+		goto error;
+	*core = z_rproc;
+
+	return 0;
+error:
+	if (z_rproc->rproc)
+		rproc_free(z_rproc->rproc);
+	z_rproc->rproc = NULL;
+	return ret;
+}
+
+/*
+ * called when driver is probed, for each R5 core specified in DT,
+ * setup as needed to do remoteproc-related operations
+ */
+static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
+{
+	int ret, i;
+	struct device *dev = &pdev->dev;
+	struct device_node *nc;
+	enum rpu_oper_mode rpu_mode;
+	struct list_head *cluster; /* list to track each core's rproc */
+	struct zynqmp_r5_rproc *core;
+
+	rpu_mode = of_property_read_bool(dev->of_node, "lockstep-mode") ?
+		    PM_RPU_MODE_LOCKSTEP : PM_RPU_MODE_SPLIT;
+	dev_dbg(dev, "RPU configuration: %s\n",
+		rpu_mode == PM_RPU_MODE_LOCKSTEP ? "lockstep" : "split");
+
+	/*
+	 * if 2 RPUs provided but one is lockstep, then we have an
+	 * invalid configuration.
+	 */
+	i = of_get_available_child_count(dev->of_node);
+	if ((rpu_mode == PM_RPU_MODE_LOCKSTEP && i != 1) || i > MAX_RPROCS)
+		return -EINVAL;
+
+	cluster = devm_kzalloc(dev, sizeof(cluster), GFP_KERNEL);
+	INIT_LIST_HEAD(cluster);
+	i = 0;
+	for_each_available_child_of_node(dev->of_node, nc) {
+		ret = zynqmp_r5_probe(pdev, nc, rpu_mode, &core);
+		dev_dbg(dev, "%s to probe rpu %pOF\n",
+			ret ? "Failed" : "Able",
+			nc);
+		if (ret)
+			return ret;
+		if (!core)
+			return -EINVAL;
+		list_add_tail(&core->elem, cluster);
+		i++;
+	}
+	/* wire in so each core can be cleaned up at drive remove */
+	platform_set_drvdata(pdev, cluster);
+
+	return 0;
+}
+
+/*
+ * for each core, clean up the following:
+ *	single rproc entry
+ *	mailbox tx, rx
+ */
+static int zynqmp_r5_remoteproc_remove(struct platform_device *pdev)
+{
+	struct list_head *pos, *cluster = (struct list_head *)
+					 platform_get_drvdata(pdev);
+	struct zynqmp_r5_rproc *core = NULL;
+	struct rproc *rproc = NULL;
+
+	list_for_each(pos, cluster) {
+		core = list_entry(pos, struct zynqmp_r5_rproc, elem);
+		if (!core)
+			return -EINVAL;
+		rproc = core->rproc;
+		if (rproc) {
+			rproc_del(rproc);
+			rproc_free(rproc);
+			core->rproc = NULL;
+		}
+
+		if (core->tx_chan) {
+			mbox_free_channel(core->tx_chan);
+			core->tx_chan = NULL;
+		}
+		if (core->rx_chan) {
+			mbox_free_channel(core->rx_chan);
+			core->rx_chan = NULL;
+		}
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

