Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31F61BF317;
	Thu, 12 Sep 2024 16:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726159713; cv=none; b=OEhZTqAwjsEN1Ik82PJ8h1xu0ZTLS06G9vKg3WTC7SsImVLSMhoceETg/V6Z1nilMxap2bHWa1qb6mNij2io2g9Lixn5+hqcri4U1LFi0tDF34OXpGpLHrPfX7M4oSPGUX02KAk1NaKce7Wn5AUhA2C6fFRDA6KC9pPL8V5fo3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726159713; c=relaxed/simple;
	bh=NJTyCpO+Y77tWGIpphUjAJTNx//eTMs3hE/+Nvi3nlE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=flRNVviC1Peu8Kod4lMqOxIPMfR05BbPVLOK3sP/L7JD5EgUXKHBNh99hiDdJ4N6tVAVArlJq5MWIoKAi4DeD51Wn8/6DvW6e8+W5aTIIaB9KJrlnIKQaqb30ywr645aKLEgOMfr5ML0/laGgLsLB3SVWPTjspA0WSUrXPxyYKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=AvFwD23p; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="AvFwD23p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726159710; x=1757695710;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NJTyCpO+Y77tWGIpphUjAJTNx//eTMs3hE/+Nvi3nlE=;
  b=AvFwD23pEwtGCJbn9WFReVstkhFs1ZkX9KA+0KMASZEOdKfJpvnlaP3t
   1u2vEM2XDvewkh8GideipgZKPqhMiCIEu75mbyQrGjzEJZ9+s4Jj8XKol
   FVhG2LDBmSPadQV1UY0YAvBsedoxFafjhTx8N8aodJx+inIkRFiJif81Q
   6XxEKTKh6Sb+SbWqZmP3heEo0nLJ2zPeXTN0EAAlhfMNeaFHnPQTDehP8
   aHlLZWP2WCn3MlZA3ygWaICcQ0MKpU84VGKKkOvw1c+lyATdqMExZe9W1
   IQM1H+0VsBw2coL3ELExiyKEbSVE389gFdp/GWb5FPlcggtB/OmHHpc7N
   g==;
X-CSE-ConnectionGUID: Ac9NytbARZ2zk5pQNIMJbg==
X-CSE-MsgGUID: 3Apw9UqhQwquUSB58z2Nvw==
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="31712183"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Sep 2024 09:48:29 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 12 Sep 2024 09:48:00 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 12 Sep 2024 09:47:57 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<peterlin@andestech.com>, <dminus@andestech.com>,
	<conor.dooley@microchip.com>, <conor+dt@kernel.org>, <ycliang@andestech.com>,
	<jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
Subject: [PATCH v1 5/5] remoteproc: add support for Microchip IPC remoteproc platform driver
Date: Thu, 12 Sep 2024 18:00:25 +0100
Message-ID: <20240912170025.455167-6-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The Microchip family of RISC-V SoCs typically has one or more clusters.
These clusters can be configured to run in Asymmetric Multi-Processing
(AMP) mode.

Add a remoteproc platform driver to be able to load and boot firmware
to the remote processor(s).

The driver uses SBI (RISC-V Supervisor Binary Interface) ecalls to
request software running in machine-privileged mode (M-mode) to
start/stop the remote processor(s).

Inter-processor communication is supported through the virtio rpmsg
stack using shared memory and the Microchip IPC mailbox driver.

Currently, the driver the following features are supported:
- Start/stop a remote software context
- Kick function implementation for RPMsg Communication
- Attach to a remote context loaded by another entity (bootloader)

Error Recovery and Power Management features are not currently supported

Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
---
 drivers/remoteproc/Kconfig               |  12 +
 drivers/remoteproc/Makefile              |   1 +
 drivers/remoteproc/mchp_ipc_remoteproc.c | 461 +++++++++++++++++++++++
 3 files changed, 474 insertions(+)
 create mode 100644 drivers/remoteproc/mchp_ipc_remoteproc.c

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index dda2ada215b7..f973ed1d0635 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -54,6 +54,18 @@ config INGENIC_VPU_RPROC
 	  This can be either built-in or a loadable module.
 	  If unsure say N.
 
+config MCHP_IPC_REMOTEPROC
+	tristate "Microchip IPC remoteproc support"
+	depends on MCHP_SBI_IPC_MBOX || COMPILE_TEST
+	depends on RISCV_SBI
+	help
+	  Say y here to support booting and loading firmware to remote
+	  processors on various Microchip family of RISC-V SoCs via the
+	  remote processor framework.
+	  This can be either built-in or a loadable module.
+	  If compiled as module, the module will be called mchp_ipc_remoteproc.
+	  If unsure say N.
+
 config MTK_SCP
 	tristate "Mediatek SCP support"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 91314a9b43ce..3e3a27d2e848 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
 obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
 obj-$(CONFIG_IMX_DSP_REMOTEPROC)	+= imx_dsp_rproc.o
 obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
+obj-$(CONFIG_MCHP_IPC_REMOTEPROC)	+= mchp_ipc_remoteproc.o
 obj-$(CONFIG_MTK_SCP)			+= mtk_scp.o mtk_scp_ipi.o
 obj-$(CONFIG_OMAP_REMOTEPROC)		+= omap_remoteproc.o
 obj-$(CONFIG_WKUP_M3_RPROC)		+= wkup_m3_rproc.o
diff --git a/drivers/remoteproc/mchp_ipc_remoteproc.c b/drivers/remoteproc/mchp_ipc_remoteproc.c
new file mode 100644
index 000000000000..95446dbc7993
--- /dev/null
+++ b/drivers/remoteproc/mchp_ipc_remoteproc.c
@@ -0,0 +1,461 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Microchip IPC Remoteproc driver
+ *
+ * Copyright (c) 2021 - 2024 Microchip Technology Inc. All rights reserved.
+ *
+ * Author: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
+ *
+ * Derived from the imx_rproc implementation:
+ * Copyright (c) 2017 Pengutronix, Oleksij Rempel <kernel@pengutronix.de>
+ */
+
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
+#define MIV_RPROC_MEM_MAX		2
+
+enum {
+	SBI_EXT_RPROC_STATE = 0x3,
+	SBI_EXT_RPROC_START,
+	SBI_EXT_RPROC_STOP,
+};
+
+/**
+ * enum mchp_ipc_rproc_mbox_messages - predefined mailbox messages
+ *
+ * @MCHP_IPC_RPROC_MBOX_READY: a ready message response from a remote context indicating
+ * that the remote context is up and running.
+ *
+ * @MIV_RP_MBOX_PENDING_MSG: Not currently in use, but reserved for future use
+ * to inform the receiver that there is a message awaiting in its receive-side
+ * vring. At the moment, one can explicitly send the index of the triggered
+ * virtqueue as a payload.
+ *
+ * @MIV_RP_MBOX_STOP: a stop request for the remote context
+ *
+ * @MIV_RP_MBOX_END_MSG: Indicates end of known/defined messages.
+ * This should be the last definition.
+ *
+ */
+enum mchp_ipc_rproc_mbox_messages {
+	MCHP_IPC_RPROC_MBOX_READY = 0xFFFFFF00,
+	MCHP_IPC_RPROC_MBOX_PENDING_MSG = 0xFFFFFF01,
+	MCHP_IPC_RPROC_MBOX_STOP = 0xFFFFFF02,
+	MCHP_IPC_RPROC_MBOX_END_MSG = 0xFFFFFF03,
+};
+
+struct mchp_ipc_rproc {
+	struct device *dev;
+	struct rproc *rproc;
+	struct mbox_chan *mbox_channel;
+	struct workqueue_struct *workqueue;
+	struct mbox_client mbox_client;
+	struct completion start_done;
+	struct work_struct rproc_work;
+	struct mchp_ipc_msg message;
+	void __iomem *rsc_table;
+	bool initialized;
+	u32 chan_id;
+};
+
+static int mchp_ipc_rproc_start(struct rproc *rproc)
+{
+	struct mchp_ipc_rproc *priv = rproc->priv;
+	struct device_node *np = priv->dev->of_node;
+	struct sbiret ret;
+	int result;
+
+	ret = sbi_ecall(SBI_EXT_MICROCHIP_TECHNOLOGY, SBI_EXT_RPROC_START,
+			priv->chan_id, rproc->bootaddr, 0, 0, 0, 0);
+
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	result = wait_for_completion_timeout(&priv->start_done,
+					     msecs_to_jiffies(5000));
+
+	if (!of_property_present(np, "microchip,skip-start-wait") && result == 0) {
+		dev_err(priv->dev, "timeout waiting for ready notification\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int mchp_ipc_rproc_stop(struct rproc *rproc)
+{
+	struct mchp_ipc_rproc *priv = rproc->priv;
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_MICROCHIP_TECHNOLOGY, SBI_EXT_RPROC_STOP,
+			priv->chan_id, MCHP_IPC_RPROC_MBOX_STOP, 0, 0, 0, 0);
+
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return ret.value;
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
+	struct reserved_mem *rmem;
+	struct of_phandle_iterator it;
+	u64 device_address;
+
+	reinit_completion(&priv->start_done);
+
+	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
+	while (of_phandle_iterator_next(&it) == 0) {
+		/*
+		 * Ignore the first memory region which will be used vdev
+		 * buffer. No need to do extra handlings, rproc_add_virtio_dev
+		 * will handle it.
+		 */
+		if (!strcmp(it.node->name, "vdev0buffer"))
+			continue;
+
+		if (!strcmp(it.node->name, "rsc-table"))
+			continue;
+
+		rmem = of_reserved_mem_lookup(it.node);
+		if (!rmem) {
+			of_node_put(it.node);
+			dev_err(priv->dev, "unable to acquire memory-region\n");
+			return -EINVAL;
+		}
+
+		device_address = rmem->base;
+
+		mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)rmem->base,
+					   rmem->size, device_address, mchp_ipc_rproc_mem_alloc,
+					   mchp_ipc_rproc_mem_release, it.node->name);
+
+		if (!mem) {
+			of_node_put(it.node);
+			return -ENOMEM;
+		}
+
+		rproc_add_carveout(rproc, mem);
+	}
+
+	return 0;
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
+	msg.buf = (void *)&vqid;
+	msg.size = sizeof(vqid);
+
+	ret = mbox_send_message(priv->mbox_channel, (void *)&msg);
+	if (ret < 0)
+		dev_err(priv->dev,
+			"failed to send mbox message, status = %d\n", ret);
+}
+
+static int mchp_ipc_rproc_attach(struct rproc *rproc)
+{
+	return 0;
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
+	*table_sz = SZ_1K;
+	return (struct resource_table *)priv->rsc_table;
+}
+
+static const struct rproc_ops mchp_ipc_rproc_ops = {
+	.prepare = mchp_ipc_rproc_prepare,
+	.start = mchp_ipc_rproc_start,
+	.get_loaded_rsc_table = mchp_ipc_rproc_get_loaded_rsc_table,
+	.attach = mchp_ipc_rproc_attach,
+	.stop = mchp_ipc_rproc_stop,
+	.kick = mchp_ipc_rproc_kick,
+	.load = rproc_elf_load_segments,
+	.parse_fw = mchp_ipc_rproc_parse_fw,
+	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
+	.sanity_check = rproc_elf_sanity_check,
+	.get_boot_addr = rproc_elf_get_boot_addr,
+};
+
+static int mchp_ipc_rproc_addr_init(struct mchp_ipc_rproc *priv,
+				    struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	int i, err, rmem_np;
+
+	rmem_np = of_count_phandle_with_args(np, "memory-region", NULL);
+	if (rmem_np <= 0)
+		return 0;
+
+	for (i = 0; i < rmem_np; i++) {
+		struct device_node *node;
+		struct resource res;
+
+		node = of_parse_phandle(np, "memory-region", i);
+		if (!node)
+			continue;
+
+		if (!strncmp(node->name, "vdev", strlen("vdev"))) {
+			of_node_put(node);
+			continue;
+		}
+
+		if (!strcmp(node->name, "rsc-table")) {
+			err = of_address_to_resource(node, 0, &res);
+			if (err) {
+				of_node_put(node);
+				return dev_err_probe(dev, err,
+						     "unable to resolve memory region\n");
+			}
+			priv->rsc_table = devm_ioremap(&pdev->dev,
+						       res.start, resource_size(&res));
+			of_node_put(node);
+		}
+	}
+
+	return 0;
+}
+
+static void mchp_ipc_rproc_vq_work(struct work_struct *work)
+{
+	struct mchp_ipc_rproc *priv = container_of(work, struct mchp_ipc_rproc, rproc_work);
+	struct device *dev = priv->rproc->dev.parent;
+
+	u32 msg = priv->message.buf[0];
+
+	/*
+	 * Currently, we are expected to receive the following messages
+	 * from the remote cluster: a ready message or receive the index
+	 * of the triggered virtqueue as a payload.
+	 * We can silently ignore any other type of mailbox messages since
+	 * they are not meant for us and are meant to be received by the
+	 * remote cluster only.
+	 */
+	switch (msg) {
+	case MCHP_IPC_RPROC_MBOX_READY:
+		complete(&priv->start_done);
+		break;
+	default:
+		if (msg >= MCHP_IPC_RPROC_MBOX_READY && msg < MCHP_IPC_RPROC_MBOX_END_MSG)
+			return;
+		if (msg > priv->rproc->max_notifyid) {
+			dev_info(dev, "dropping unknown message 0x%x", msg);
+			return;
+		}
+		/* msg contains the index of the triggered vring */
+		if (rproc_vq_interrupt(priv->rproc, msg) == IRQ_NONE)
+			dev_dbg(dev, "no message was found in vqid %d\n", msg);
+	}
+}
+
+static void mchp_ipc_rproc_rx_callback(struct mbox_client *mbox_client, void *msg)
+{
+	struct rproc *rproc = dev_get_drvdata(mbox_client->dev);
+	struct mchp_ipc_rproc *priv = rproc->priv;
+
+	priv->message = *(struct mchp_ipc_msg *)msg;
+	queue_work(priv->workqueue, &priv->rproc_work);
+}
+
+static int mchp_ipc_rproc_mbox_init(struct rproc *rproc)
+{
+	struct mchp_ipc_rproc *priv = rproc->priv;
+	struct device *dev = priv->dev;
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
+	priv->chan_id = mchp_ipc_get_chan_id(priv->mbox_channel);
+
+	return 0;
+}
+
+static int mchp_ipc_rproc_get_state(u32 chan)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_MICROCHIP_TECHNOLOGY, SBI_EXT_RPROC_STATE,
+			chan, 0, 0, 0, 0, 0);
+
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return ret.value;
+}
+
+static int mchp_ipc_rproc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct mchp_ipc_rproc *priv;
+	struct rproc *rproc;
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
+	priv->workqueue = create_workqueue(dev_name(dev));
+	if (!priv->workqueue)
+		return dev_err_probe(dev, -ENOMEM, "cannot create workqueue\n");
+
+	INIT_WORK(&priv->rproc_work, mchp_ipc_rproc_vq_work);
+	init_completion(&priv->start_done);
+
+	ret = mchp_ipc_rproc_mbox_init(rproc);
+	if (ret)
+		goto err_put_wkq;
+
+	ret = mchp_ipc_rproc_addr_init(priv, pdev);
+	if (ret)
+		goto err_put_mbox;
+
+	/*
+	 * Check if the remote cluster has been booted by another entity
+	 * (i.e. bootloader) and set rproc state accordingly
+	 */
+	rproc->state = mchp_ipc_rproc_get_state(priv->chan_id);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "Couldn't get cluster boot mode\n");
+		goto err_put_mbox;
+	}
+
+	if (rproc->state != RPROC_DETACHED)
+		rproc->auto_boot = of_property_present(np, "microchip,auto-boot");
+
+	/* error recovery is not supported at present */
+	rproc->recovery_disabled = true;
+
+	dev_set_drvdata(dev, rproc);
+
+	ret = devm_rproc_add(dev, rproc);
+	if (ret) {
+		dev_err_probe(dev, ret, "rproc_add failed\n");
+		goto err_put_mbox;
+	}
+
+	return 0;
+
+err_put_mbox:
+	mbox_free_channel(priv->mbox_channel);
+err_put_wkq:
+	destroy_workqueue(priv->workqueue);
+
+	return ret;
+}
+
+static void mchp_ipc_rproc_remove(struct platform_device *pdev)
+{
+	struct rproc *rproc = platform_get_drvdata(pdev);
+	struct mchp_ipc_rproc *priv = rproc->priv;
+
+	mbox_free_channel(priv->mbox_channel);
+	destroy_workqueue(priv->workqueue);
+}
+
+static const struct of_device_id mchp_ipc_rproc_of_match[] __maybe_unused = {
+	{ .compatible = "microchip,ipc-remoteproc", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mchp_ipc_rproc_of_match);
+
+static struct platform_driver mchp_ipc_rproc_driver = {
+	.probe = mchp_ipc_rproc_probe,
+	.remove_new = mchp_ipc_rproc_remove,
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

