Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E05F334C1D;
	Mon, 26 Jan 2026 12:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769429341; cv=none; b=I8FWjHAjAUyqRrOpn3GS72uFf5TSrNE+WdGrW4q/q9crBY3XllM8xFHE6IMyoHIzpOEbqeATG67RAOFWCie+Q5UhVWLOHBmaOz/mXkwvEbiYPwnbBAuGQaKYifA3Aiw7Qca8/bUueMXXnnX1FB3VbfKEJnKLwytJxLY69uwVwiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769429341; c=relaxed/simple;
	bh=lEhw4DRJF4dLrVIA6aBSwKTHspM5qVNNgxDW02ka+70=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mac3r1g9zxR0F1WcMA68DRmkS6Q9ANCywvOVhMLjawvFMepUYtPsaBO3BOKNkKVj4CQIV0zj77mVVGcGLnUuOzHd5ceFy/e0SelCnc2Qv3xVas3ZXHM40YaNjSFJt8U2zfkfoarx6jtpGhcDqa2vAuanl/rgbmA9p7gKerEI0kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=13e/QUey; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="13e/QUey"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1769429338; x=1800965338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lEhw4DRJF4dLrVIA6aBSwKTHspM5qVNNgxDW02ka+70=;
  b=13e/QUeyE4FVJw2mBRuCwOiA69J/jlhyckTYVBHWAMMp6CcKJg5wHPUG
   XOvyPasONlMsyR/dsAycw9XglwAkvmbx8gj1OJziPabGOB9JjJfpj1wFb
   ghe9St867mN4nqflhaDwJHhz7bo2A26dH4nhZhCsEi4+KVD5pNXLckO3C
   kUNwaYY1KpcLNjpOvu1m9IuLj/s2xdMrG57B7aSIQTQHfnx4iA/Tdqd2c
   HGDF+2niXRu0Y8yMYKFeTAgTJaEp4DsUehvs8zpMxOFWE8AoFy0kTngrZ
   LwMTZvPNRQIYEoOR3JfBSILwSs9Fsq3Ut11Mge8rKp06yu/DcDEycF/Fh
   g==;
X-CSE-ConnectionGUID: YdKOwlMaRum+YCEcOjTQUQ==
X-CSE-MsgGUID: j0RKaWAYTBuIGAhfcB/k6w==
X-IronPort-AV: E=Sophos;i="6.21,255,1763449200"; 
   d="scan'208";a="59537389"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Jan 2026 05:08:51 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 26 Jan 2026 05:08:22 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 26 Jan 2026 05:08:20 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/2] remoteproc: add support for Microchip IPC remoteproc platform driver
Date: Mon, 26 Jan 2026 12:06:58 +0000
Message-ID: <20260126120658.1674253-3-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126120658.1674253-1-valentina.fernandezalanis@microchip.com>
References: <20260126120658.1674253-1-valentina.fernandezalanis@microchip.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Microchip family of RISC-V SoCs typically have one or more
clusters. These clusters can be configured to run in an Asymmetric
Multi Processing (AMP) mode where clusters are split in independent
software contexts.

Add a remoteproc platform driver to be able to load and boot firmware
to remote processors.

The driver uses SBI (RISC-V Supervisor Binary Interface) ecalls to
request software running in machine privilege mode (M-mode) to
start/stop the remote processor.

Inter-processor communication is supported through the
virtio rpmsg stack using shared memory and the Microchip IPC mailbox
driver.

Currently, the driver the following features are supported:
- Start/stop a remote software context
- Kick function implementation for RPMsg Communication
- Attach to a remote context loaded by another entity (bootloader)

Error Recovery and Power Management features are not currently supported.

Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
---
 drivers/remoteproc/Kconfig           |  12 +
 drivers/remoteproc/Makefile          |   1 +
 drivers/remoteproc/mchp_remoteproc.c | 613 +++++++++++++++++++++++++++
 3 files changed, 626 insertions(+)
 create mode 100644 drivers/remoteproc/mchp_remoteproc.c

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 48a0d3a69ed0..243e1c48c66b 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -54,6 +54,18 @@ config INGENIC_VPU_RPROC
 	  This can be either built-in or a loadable module.
 	  If unsure say N.
 
+config MCHP_REMOTEPROC
+	tristate "Microchip remoteproc support"
+	depends on MCHP_SBI_IPC_MBOX || COMPILE_TEST
+	depends on ARCH_MICROCHIP
+	help
+	  Say y here to support booting and loading firmware to remote
+	  processors on various Microchip family of RISC-V SoCs via the
+	  remote processor framework.
+	  This can be either built-in or a loadable module. If compiled
+	  as module, the module will be called mchp_remoteproc.
+	  If unsure say N.
+
 config MTK_SCP
 	tristate "Mediatek SCP support"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 1c7598b8475d..600cd15d9823 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
 obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
 obj-$(CONFIG_IMX_DSP_REMOTEPROC)	+= imx_dsp_rproc.o
 obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
+obj-$(CONFIG_MCHP_REMOTEPROC)	+= mchp_remoteproc.o
 obj-$(CONFIG_MTK_SCP)			+= mtk_scp.o mtk_scp_ipi.o
 obj-$(CONFIG_OMAP_REMOTEPROC)		+= omap_remoteproc.o
 obj-$(CONFIG_WKUP_M3_RPROC)		+= wkup_m3_rproc.o
diff --git a/drivers/remoteproc/mchp_remoteproc.c b/drivers/remoteproc/mchp_remoteproc.c
new file mode 100644
index 000000000000..fcc2c3f64bf4
--- /dev/null
+++ b/drivers/remoteproc/mchp_remoteproc.c
@@ -0,0 +1,613 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Microchip IPC Remoteproc driver
+ *
+ * Copyright (c) 2026 Microchip Technology Inc. All rights reserved.
+ *
+ * Author: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
+ *
+ */
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/mailbox_client.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/remoteproc.h>
+#include <linux/workqueue.h>
+
+#include <asm/sbi.h>
+#include <asm/vendorid_list.h>
+#include <linux/mailbox/mchp-ipc.h>
+
+#include "remoteproc_internal.h"
+
+#define SBI_EXT_MICROCHIP_TECHNOLOGY	(SBI_EXT_VENDOR_START | \
+					 MICROCHIP_VENDOR_ID)
+
+#define ACK_TIMEOUT			3000
+#define MCHP_SBI_TARGET_TYPE_CPU	BIT(31)
+#define MCHP_SBI_TARGET_ID_MASK		GENMASK(30, 0)
+#define MCHP_IPC_READY_MSG		0xFFFFFF00
+
+/*
+ * Remote cluster boot modes:
+ * - Early boot firmware is started directly by the bootloader.
+ * - Late boot firmware is started by Linux via remoteproc.
+ */
+enum {
+	MCHP_LATE_BOOT_MODE = 0x0,
+	MCHP_EARLY_BOOT_MODE = 0x6,
+};
+
+/*
+ * SBI RPROC extension function IDs
+ */
+enum {
+	SBI_EXT_RPROC_STATE = 0x3,
+	SBI_EXT_RPROC_START = 0x4,
+	SBI_EXT_RPROC_STOP  = 0x5,
+	SBI_EXT_RPROC_READY = 0x6,
+};
+
+/*
+ * Reserved memory region indexes
+ */
+enum {
+	MCHP_IPC_RPROC_RSC_TABLE_REGION,
+	MCHP_IPC_RPROC_FW_REGION,
+	MCHP_IPC_RPROC_BUFF_REGION,
+	MCHP_IPC_RPROC_VRING0_REGION,
+	MCHP_IPC_RPROC_VRING1_REGION,
+	MCHP_IPC_RPROC_REGION_MAX,
+};
+
+/**
+ * struct mchp_ipc_rproc_mem_region - Reserved memory region descriptor
+ * @name:   the name used to match memory-region-names in the device tree
+ * @prefix: optional prefix for the carveout name
+ */
+struct mchp_ipc_rproc_mem_region {
+	const char *name;
+	const char *prefix;
+};
+
+/**
+ * struct mchp_ipc_rproc - Microchip IPC remoteproc private structure
+ * @dev:		pointer to the device
+ * @rproc:		rproc handle
+ * @mbox_channel:	mailbox channel handle
+ * @workqueue:		workqueue for processing incoming notifications
+ * @rsc_table:		the resource table address
+ * @rsc_table_size:     size of the resource table region
+ * @mbox_client:	mailbox client to request the mailbox channel
+ * @start_done:		completion for remote processor ready notification
+ * @rproc_work:		pointer to the work struture
+ * @message:		buffer for the last received message
+ * @target_id:		hardware identifier for the remote cluster
+ * @has_cpu_target:	flag selecting SBI target type as CPU or mbox ID
+ */
+struct mchp_ipc_rproc {
+	struct device *dev;
+	struct rproc *rproc;
+	struct mbox_chan *mbox_channel;
+	struct workqueue_struct *workqueue;
+	void __iomem *rsc_table;
+	size_t rsc_table_size;
+	struct mbox_client mbox_client;
+	struct completion start_done;
+	struct work_struct rproc_work;
+	struct mchp_ipc_msg message;
+	u32 target_id;
+	bool has_cpu_target;
+};
+
+static const struct mchp_ipc_rproc_mem_region mchp_rproc_mem_regions[] = {
+	[MCHP_IPC_RPROC_RSC_TABLE_REGION] = {
+		.name = "rsc-table",
+		.prefix = NULL,
+	},
+	[MCHP_IPC_RPROC_FW_REGION] = {
+		.name = "firmware",
+		.prefix = NULL,
+	},
+	[MCHP_IPC_RPROC_BUFF_REGION] = {
+		.name = "buffer",
+		.prefix = "vdev0",
+	},
+	[MCHP_IPC_RPROC_VRING0_REGION] = {
+		.name = "vring0",
+		.prefix = "vdev0",
+	},
+	[MCHP_IPC_RPROC_VRING1_REGION] = {
+		.name = "vring1",
+		.prefix = "vdev0",
+	},
+};
+
+/**
+ * mchp_rproc_sbi_call() - Invoke a Microchip-specific SBI extension ecall
+ * @rproc:    pointer to the remoteproc instance
+ * @sbi_func: the SBI function ID
+ * @target:   the hardware ID of the target remote cluster
+ *
+ * This function performs a Supervisor Binary Interface (SBI) call to the
+ * Machine Mode (M-Mode) firmware. It encodes the @target ID and type into a
+ * single 32-bit register argument using MSB encoding:
+ * [31]    : target Type Flag (1 = CPU/Cluster)
+ * [30:0]  : target Cluster ID
+ *
+ * Return: The value returned by the SBI call on success, or a
+ * negative errno on error.
+ */
+static int mchp_rproc_sbi_call(struct rproc *rproc, u32 sbi_func, u32 target)
+{
+	struct mchp_ipc_rproc *priv = rproc->priv;
+	struct sbiret ret;
+
+	target &= MCHP_SBI_TARGET_ID_MASK;
+
+	if (priv->has_cpu_target)
+		target |= MCHP_SBI_TARGET_TYPE_CPU;
+
+	ret = sbi_ecall(SBI_EXT_MICROCHIP_TECHNOLOGY, sbi_func,
+			target, 0, 0, 0, 0, 0);
+
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return ret.value;
+}
+
+/**
+ * mchp_ipc_rproc_vq_work() - Remoteproc notification work function
+ * @work: Pointer to the work structure
+ *
+ * Handles incoming IPC messages from the remote cluster, either
+ * processing control messages or passing notifications to the
+ * remoteproc virtqueue framework.
+ */
+static void mchp_ipc_rproc_vq_work(struct work_struct *work)
+{
+	struct mchp_ipc_rproc *priv = container_of(work, struct mchp_ipc_rproc, rproc_work);
+	struct device *dev = priv->rproc->dev.parent;
+	struct mchp_ipc_msg *msg = &priv->message;
+	u32 message;
+
+	if (!msg->buf || msg->size < sizeof(u32))
+		return;
+
+	message = *msg->buf;
+
+	if (message == MCHP_IPC_READY_MSG) {
+		complete(&priv->start_done);
+		return;
+	}
+
+	if (message > priv->rproc->max_notifyid) {
+		dev_info(dev, "dropping unknown vqid 0x%x\n", message);
+		return;
+	}
+
+	if (rproc_vq_interrupt(priv->rproc, message) == IRQ_NONE)
+		dev_dbg(dev, "no message found in vqid %d\n", message);
+}
+
+/**
+ * mchp_ipc_rproc_rx_callback() - Callback for incoming mailbox messages
+ * @mbox_client: Mailbox client
+ * @data: message pointer
+ *
+ * Receives data from the IPC mailbox and schedules the notification
+ * work function to process the message.
+ */
+static void mchp_ipc_rproc_rx_callback(struct mbox_client *mbox_client, void *data)
+{
+	struct rproc *rproc = dev_get_drvdata(mbox_client->dev);
+	struct mchp_ipc_rproc *priv = rproc->priv;
+
+	priv->message = *(struct mchp_ipc_msg *)data;
+	queue_work(priv->workqueue, &priv->rproc_work);
+}
+
+static int mchp_ipc_rproc_mem_alloc(struct rproc *rproc, struct rproc_mem_entry *mem)
+{
+	struct device *dev = rproc->dev.parent;
+	void *va;
+
+	dev_dbg(dev, "map memory: %pad+%zx\n", &mem->dma, mem->len);
+	va = ioremap_wc(mem->dma, mem->len);
+	if (IS_ERR_OR_NULL(va)) {
+		dev_err(dev, "Unable to map memory region: %p+%zx\n",
+			&mem->dma, mem->len);
+		return -ENOMEM;
+	}
+
+	mem->va = va;
+
+	return 0;
+}
+
+static int mchp_ipc_rproc_mem_release(struct rproc *rproc,
+				      struct rproc_mem_entry *mem)
+{
+	dev_dbg(rproc->dev.parent, "unmap memory: %pad\n", &mem->dma);
+	iounmap(mem->va);
+
+	return 0;
+}
+
+static int mchp_ipc_rproc_prepare(struct rproc *rproc)
+{
+	struct mchp_ipc_rproc *priv = rproc->priv;
+	struct device_node *np = priv->dev->of_node;
+	struct rproc_mem_entry *mem;
+	struct resource res;
+	const char *mem_region_name;
+	const char *carveout_name;
+	int i, index, ret;
+
+	reinit_completion(&priv->start_done);
+
+	for (i = 0; i < ARRAY_SIZE(mchp_rproc_mem_regions); i++) {
+		mem_region_name = mchp_rproc_mem_regions[i].name;
+		index = of_property_match_string(np, "memory-region-names", mem_region_name);
+
+		if (index < 0)
+			continue;
+
+		ret = of_reserved_mem_region_to_resource_byname(np, mem_region_name, &res);
+		if (ret)
+			return ret;
+
+		if (mchp_rproc_mem_regions[i].prefix) {
+			carveout_name = devm_kasprintf(priv->dev, GFP_KERNEL, "%s%s",
+						       mchp_rproc_mem_regions[i].prefix,
+						       mem_region_name);
+			if (!carveout_name)
+				return -ENOMEM;
+		} else {
+			carveout_name = mem_region_name;
+		}
+
+		if (i == MCHP_IPC_RPROC_BUFF_REGION) {
+			mem = rproc_of_resm_mem_entry_init(priv->dev, index, resource_size(&res),
+							   res.start, carveout_name);
+		} else {
+			mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
+						   resource_size(&res), res.start,
+						   mchp_ipc_rproc_mem_alloc,
+						   mchp_ipc_rproc_mem_release, carveout_name);
+		}
+
+		if (!mem)
+			return -ENOMEM;
+
+		rproc_add_carveout(rproc, mem);
+	}
+
+	return 0;
+}
+
+static int mchp_ipc_rproc_start(struct rproc *rproc)
+{
+	struct mchp_ipc_rproc *priv = rproc->priv;
+	struct device *dev = rproc->dev.parent;
+	unsigned long timeout;
+	int ready_ack;
+	int ret;
+
+	ret = mchp_rproc_sbi_call(rproc, SBI_EXT_RPROC_START, priv->target_id);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * If the firmware supports the SBI_EXT_RPROC_READY function ID,
+	 * query the firmware to check if the remote cluster has booted
+	 * successfully; otherwise, wait for an asynchronous ready
+	 * notification delivered via the mailbox.
+	 */
+	if (priv->has_cpu_target) {
+		timeout = jiffies + msecs_to_jiffies(ACK_TIMEOUT);
+		do {
+			ready_ack = mchp_rproc_sbi_call(rproc,
+							SBI_EXT_RPROC_READY,
+							priv->target_id);
+			if (ready_ack > 0)
+				return 0;
+			if (ready_ack < 0)
+				return ready_ack;
+
+			usleep_range(1000, 1100);
+		} while (time_before(jiffies, timeout));
+
+		dev_err(dev, "timeout waiting for SBI ready ack\n");
+		return -ETIMEDOUT;
+	}
+
+	if (!wait_for_completion_timeout(&priv->start_done, msecs_to_jiffies(ACK_TIMEOUT))) {
+		dev_err(dev, "timeout waiting for ready notification\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int mchp_ipc_rproc_stop(struct rproc *rproc)
+{
+	struct mchp_ipc_rproc *priv = rproc->priv;
+	int ret = 0;
+
+	ret = mchp_rproc_sbi_call(rproc, SBI_EXT_RPROC_STOP, priv->target_id);
+	if (ret < 0)
+		return ret;
+
+	return ret;
+}
+
+static int mchp_ipc_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	int ret;
+
+	ret = rproc_elf_load_rsc_table(rproc, fw);
+	if (ret)
+		dev_info(&rproc->dev, "No resource table in elf\n");
+
+	return 0;
+}
+
+static void mchp_ipc_rproc_kick(struct rproc *rproc, int vqid)
+{
+	struct mchp_ipc_rproc *priv = (struct mchp_ipc_rproc *)rproc->priv;
+	struct mchp_ipc_msg msg;
+	int ret;
+
+	if (!priv->mbox_channel) {
+		dev_err(priv->dev, "No initialized mbox channel\n");
+		return;
+	}
+
+	msg.buf = (void *)&vqid;
+	msg.size = sizeof(vqid);
+
+	ret = mbox_send_message(priv->mbox_channel, (void *)&msg);
+	if (ret < 0)
+		dev_err(priv->dev,
+			"failed to send mbox message, status = %d\n", ret);
+}
+
+static struct resource_table
+*mchp_ipc_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
+{
+	struct mchp_ipc_rproc *priv = rproc->priv;
+
+	if (!priv->rsc_table)
+		return NULL;
+
+	*table_sz = priv->rsc_table_size;
+
+	return (struct resource_table *)priv->rsc_table;
+}
+
+static int mchp_ipc_rproc_attach(struct rproc *rproc)
+{
+	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
+
+	return 0;
+}
+
+static const struct rproc_ops mchp_ipc_rproc_ops = {
+	.prepare = mchp_ipc_rproc_prepare,
+	.start = mchp_ipc_rproc_start,
+	.stop = mchp_ipc_rproc_stop,
+	.load = rproc_elf_load_segments,
+	.parse_fw = mchp_ipc_rproc_parse_fw,
+	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
+	.sanity_check = rproc_elf_sanity_check,
+	.get_boot_addr = rproc_elf_get_boot_addr,
+	.kick = mchp_ipc_rproc_kick,
+	.get_loaded_rsc_table = mchp_ipc_rproc_get_loaded_rsc_table,
+	.attach = mchp_ipc_rproc_attach,
+};
+
+static int mchp_ipc_rproc_mbox_init(struct rproc *rproc)
+{
+	struct mchp_ipc_rproc *priv = rproc->priv;
+	struct device *dev = priv->dev;
+	struct mchp_ipc_sbi_chan *chan_priv;
+	struct mbox_client *mbox_client;
+
+	mbox_client = &priv->mbox_client;
+	mbox_client->dev = dev;
+	mbox_client->tx_block = true;
+	mbox_client->tx_tout = 100;
+	mbox_client->knows_txdone = false;
+	mbox_client->rx_callback = mchp_ipc_rproc_rx_callback;
+
+	priv->mbox_channel = mbox_request_channel(mbox_client, 0);
+	if (IS_ERR(priv->mbox_channel))
+		return dev_err_probe(mbox_client->dev,
+				     PTR_ERR(priv->mbox_channel),
+				     "failed to request mailbox channel\n");
+
+	/* Retrieve the mbox channel private data to get the mailbox ID */
+	if (!priv->has_cpu_target) {
+		chan_priv = (struct mchp_ipc_sbi_chan *)priv->mbox_channel->con_priv;
+		priv->target_id = chan_priv->id;
+	}
+
+	return 0;
+}
+
+static int mchp_ipc_rproc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *cpu_node;
+	struct mchp_ipc_rproc *priv;
+	struct rproc *rproc;
+	struct resource res;
+	int ret;
+
+	rproc = devm_rproc_alloc(dev, np->name, &mchp_ipc_rproc_ops,
+				 NULL, sizeof(*priv));
+	if (!rproc)
+		return -ENOMEM;
+
+	priv = rproc->priv;
+	priv->rproc = rproc;
+	priv->dev = dev;
+
+	/*
+	 * Determine if the firmware supports SBI_EXT_RPROC_READY function ID.
+	 * If not supported (firmware versions prior to HSS v2026.04), the
+	 * mailbox channel ID is required to pass to the firmware. Otherwise,
+	 * the CPU ID can be used to identify the target cluster instead.
+	 */
+	ret = mchp_rproc_sbi_call(rproc, SBI_EXT_RPROC_READY, 0);
+	if (ret == -ENOTSUPP) {
+		priv->has_cpu_target = false;
+		if (!of_property_present(np, "mboxes"))
+			return dev_err_probe(dev, -ENOENT,
+					"mboxes property required for HSS versions prior to 2026.04\n");
+	} else {
+		cpu_node = of_parse_phandle(np, "cpu", 0);
+		if (cpu_node) {
+			priv->target_id = of_get_cpu_hwid(cpu_node, 0);
+			of_node_put(cpu_node);
+			priv->has_cpu_target = true;
+		} else {
+			priv->has_cpu_target = false;
+			if (!of_property_present(np, "mboxes"))
+				return dev_err_probe(dev, -ENOENT,
+						"at least cpu or mboxes must be present\n");
+		}
+	}
+
+	if (of_property_present(np, "mboxes")) {
+		ret = mchp_ipc_rproc_mbox_init(rproc);
+		if (ret)
+			return ret;
+
+		priv->workqueue = create_workqueue(dev_name(dev));
+		if (!priv->workqueue) {
+			ret = -ENOMEM;
+			dev_err_probe(dev, ret, "cannot create workqueue\n");
+			goto err_put_mbox;
+		}
+
+		INIT_WORK(&priv->rproc_work, mchp_ipc_rproc_vq_work);
+	}
+
+	/*
+	 * Retrieve the current boot state of the remote cluster to determine how its
+	 * firmware was started.
+	 * MCHP_EARLY_BOOT_MODE: firmware was started directly by the bootloader.
+	 * MCHP_LATE_BOOT_MODE: firmware will be started by Linux via remoteproc.
+	 */
+	ret = mchp_rproc_sbi_call(rproc, SBI_EXT_RPROC_STATE, priv->target_id);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "cannot get boot mode\n");
+		goto err_put_wkq;
+	}
+
+	/* Set the rproc state based on the cluster boot mode */
+	if (ret == MCHP_EARLY_BOOT_MODE) {
+		/*
+		 * If the cluster was already started by another entity (early boot mode),
+		 * check if the resource table is provided as a memory-region. It is
+		 * expected that the remote processor firmware provides a copy of the
+		 * resource table at a dedicated memory address.
+		 *
+		 * However, the absence of a resource table entry in early boot mode is
+		 * considered valid since some firmware might not use rpmsg. The
+		 * lifecycle can still be controlled by Linux once the cluster is
+		 * attached.
+		 */
+		ret = of_reserved_mem_region_to_resource_byname(np, "rsc-table", &res);
+		if (!ret) {
+			priv->rsc_table = devm_ioremap_resource(dev, &res);
+			if (IS_ERR(priv->rsc_table)) {
+				ret = PTR_ERR(priv->rsc_table);
+				dev_err_probe(dev, ret, "failed to map resource table\n");
+				goto err_put_wkq;
+			}
+			priv->rsc_table_size = resource_size(&res);
+		}
+		rproc->state = RPROC_DETACHED;
+	} else {
+		/*
+		 * If the cluster is to be started by Linux (late boot mode), the
+		 * firmware memory region must be provided in the device tree.
+		 * This region is used to load the remote processor ELF image
+		 * to shared DDR memory.
+		 */
+		ret = of_reserved_mem_region_to_resource_byname(np, "firmware", &res);
+		if (ret) {
+			dev_err_probe(dev, ret, "missing firmware memory region\n");
+			goto err_put_wkq;
+		}
+		rproc->auto_boot = false;
+	}
+
+	init_completion(&priv->start_done);
+
+	/* error recovery is not supported at present */
+	rproc->recovery_disabled = true;
+
+	dev_set_drvdata(dev, rproc);
+
+	ret = devm_rproc_add(dev, rproc);
+	if (ret) {
+		dev_err_probe(dev, ret, "rproc_add failed\n");
+		goto err_put_wkq;
+	}
+
+	return 0;
+
+err_put_wkq:
+	if (priv->workqueue)
+		destroy_workqueue(priv->workqueue);
+err_put_mbox:
+	if (priv->mbox_channel)
+		mbox_free_channel(priv->mbox_channel);
+
+	return ret;
+}
+
+static void mchp_ipc_rproc_remove(struct platform_device *pdev)
+{
+	struct rproc *rproc = platform_get_drvdata(pdev);
+	struct mchp_ipc_rproc *priv = rproc->priv;
+
+	if (priv->workqueue)
+		destroy_workqueue(priv->workqueue);
+
+	if (priv->mbox_channel)
+		mbox_free_channel(priv->mbox_channel);
+}
+
+static const struct of_device_id mchp_ipc_rproc_of_match[] __maybe_unused = {
+	{ .compatible = "microchip,ipc-sbi-remoteproc", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mchp_ipc_rproc_of_match);
+
+static struct platform_driver mchp_ipc_rproc_driver = {
+	.probe = mchp_ipc_rproc_probe,
+	.remove = mchp_ipc_rproc_remove,
+	.driver = {
+		.name = "microchip-ipc-rproc",
+		.of_match_table = of_match_ptr(mchp_ipc_rproc_of_match),
+	},
+};
+
+module_platform_driver(mchp_ipc_rproc_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Valentina Fernandez <valentina.fernandezalanis@microchip.com>");
+MODULE_DESCRIPTION("Microchip IPC Remote Processor control driver");
-- 
2.34.1

