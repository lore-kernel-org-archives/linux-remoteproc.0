Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F043525FA34;
	Sun, 14 Sep 2025 12:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757853043; cv=none; b=uhlBW3Ia4GvOquMh5Eim/ebys6iCI/dMU6CcHqB4GIULqqpi/T6e1djUeLld8oFciRMQaky9yBfHWaURTv8+iDPtYjbCQR3kDVZVTsUoqi1u0zlPpRm1qqAeZVfbcVnjyKbkIVIhubErvjYni/iR8tFbDld5A3jULFKje4lHA1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757853043; c=relaxed/simple;
	bh=G79RiM9cQHNvw6IAEG+TdoM0kQVC7Qfn5vvq+qHgEH4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DjhLPhSpbMn7uSN1d3oBldKl6IL0HeTlp9W3pKmTitC52pd5uq2Ygg8fYf77fBd6Z7IA+SAJ15iC3ZzOatjfk5+btzdukgPgJ9i4oITSIydVCFhNk2N2goiZkfQjQKK6Zj5liCwqAljbB0qESz7Ih9Lu5Uuolmnc3ypqGHMK4XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=BHMmKagL; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BHMmKagL"
X-UUID: 987e8dbc916611f0b33aeb1e7f16c2b6-20250914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=HetiFWZ9ZAVvgB4OozI3melU/YG2JfU1pdzrWadRXqE=;
	b=BHMmKagLaX1JAdtu3/3xSjNZBivKeMwfWUuEP8a6jAMxLhsEyKFd4Lx40H/CtIoOLA2Vp1dzPB1nuo6bCV66VrMiLq7iLKG9xGLdy/2TlNtofm+VzrRIAg8+I9CxpiP8KsOsyNfvH8Xsk5DYbHmmU/CZ1/SL/RA529sFMrU2+sg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:bcb5d8ae-bb26-4d3a-abdb-f3819cb5014a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:ecbe46f8-ebfe-43c9-88c9-80cb93f22ca4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 987e8dbc916611f0b33aeb1e7f16c2b6-20250914
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <xiangzhi.tang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1088861652; Sun, 14 Sep 2025 20:30:27 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sun, 14 Sep 2025 20:30:24 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sun, 14 Sep 2025 20:30:23 +0800
From: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Xiangzhi Tang
	<Xiangzhi.Tang@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Jjian Zhou <Jjian.Zhou@mediatek.com>,
	Hailong Fan <Hailong.Fan@mediatek.com>, Xiangzhi Tang
	<xiangzhi.tang@mediatek.com>
Subject: [PATCH v2 3/4] remoterpoc: mediatek: vcp: Add ipi-mbox communication
Date: Sun, 14 Sep 2025 20:29:26 +0800
Message-ID: <20250914122943.10412-4-xiangzhi.tang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250914122943.10412-1-xiangzhi.tang@mediatek.com>
References: <20250914122943.10412-1-xiangzhi.tang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add VCP ipi-mbox communication mechanism between AP CPU with VCP mcu

1.Add VCP ipi-mbox init driver.
2.Add vcp ready ipi register driver.
3.Add vcp ready notify work mechanism.

Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
---
 drivers/remoteproc/Kconfig                |   2 +
 drivers/remoteproc/mtk_vcp_common.c       | 163 ++++++++++++++++++++++
 drivers/remoteproc/mtk_vcp_common.h       |  30 ++++
 drivers/remoteproc/mtk_vcp_rproc.c        | 154 +++++++++++++++++++-
 drivers/remoteproc/mtk_vcp_rproc.h        |  18 +++
 include/linux/remoteproc/mtk_vcp_public.h |  62 ++++++++
 6 files changed, 428 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 1a9bb49a8a28..90fdc632ff2f 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -68,6 +68,8 @@ config MTK_VCP_RPROC
 	tristate "MediaTek VCP support"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	depends on ARCH_DMA_ADDR_T_64BIT
+	select MTK_VCP_IPC
+	select MTK_VCP_MBOX
 	help
 	  Say y here to support MediaTek's Video Companion Processor (VCP) via
 	  the remote processor framework.
diff --git a/drivers/remoteproc/mtk_vcp_common.c b/drivers/remoteproc/mtk_vcp_common.c
index d53e311c4981..9767f5ff15a0 100644
--- a/drivers/remoteproc/mtk_vcp_common.c
+++ b/drivers/remoteproc/mtk_vcp_common.c
@@ -11,6 +11,7 @@
 #include <linux/fs.h>
 #include <linux/interrupt.h>
 #include <linux/iommu.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
@@ -23,6 +24,9 @@
 #include "mtk_vcp_common.h"
 #include "mtk_vcp_rproc.h"
 
+static BLOCKING_NOTIFIER_HEAD(mmup_notifier_list);
+static BLOCKING_NOTIFIER_HEAD(vcp_notifier_list);
+
 struct vcp_feature_tb feature_table[NUM_FEATURE_ID] = {
 	{
 		.feature    = RTOS_FEATURE_ID,
@@ -302,6 +306,23 @@ static bool is_vcp_ready_by_coreid(enum vcp_core_id core_id)
 	}
 }
 
+static enum vcp_core_id get_core_by_feature(enum feature_id id)
+{
+	for (u32 i = 0; i < NUM_FEATURE_ID; i++) {
+		if (feature_table[i].feature == id)
+			return feature_table[i].core_id;
+	}
+
+	return 0;
+}
+
+bool is_vcp_ready(enum feature_id id)
+{
+	enum vcp_core_id core_id = get_core_by_feature(id);
+
+	return is_vcp_ready_by_coreid(core_id);
+}
+
 u32 wait_core_hart_shutdown(struct mtk_vcp_device *vcp,
 			    enum vcp_core_id core_id)
 {
@@ -343,9 +364,114 @@ u32 wait_core_hart_shutdown(struct mtk_vcp_device *vcp,
 	return retry;
 }
 
+void vcp_A_register_notify(enum feature_id id,
+			   struct notifier_block *nb)
+{
+	enum vcp_core_id core_id = get_core_by_feature(id);
+
+	switch (core_id) {
+	case VCP_ID:
+		blocking_notifier_chain_register(&vcp_notifier_list, nb);
+		if (is_vcp_ready_by_coreid(VCP_ID))
+			nb->notifier_call(nb, VCP_EVENT_READY, NULL);
+		break;
+	case MMUP_ID:
+		blocking_notifier_chain_register(&mmup_notifier_list, nb);
+		if (is_vcp_ready_by_coreid(MMUP_ID))
+			nb->notifier_call(nb, VCP_EVENT_READY, NULL);
+		break;
+	default:
+		break;
+	}
+}
+
+void vcp_A_unregister_notify(enum feature_id id,
+			     struct notifier_block *nb)
+{
+	enum vcp_core_id core_id = get_core_by_feature(id);
+
+	switch (core_id) {
+	case VCP_ID:
+		blocking_notifier_chain_unregister(&vcp_notifier_list, nb);
+		break;
+	case MMUP_ID:
+		blocking_notifier_chain_unregister(&mmup_notifier_list, nb);
+		break;
+	default:
+		break;
+	}
+}
+
+void vcp_extern_notify(enum vcp_core_id core_id,
+		       enum VCP_NOTIFY_EVENT notify_status)
+{
+	switch (core_id) {
+	case VCP_ID:
+		blocking_notifier_call_chain(&vcp_notifier_list, notify_status, NULL);
+		break;
+	case MMUP_ID:
+		blocking_notifier_call_chain(&mmup_notifier_list, notify_status, NULL);
+		break;
+	default:
+		break;
+	}
+}
+
+static void vcp_A_notify_ws(struct work_struct *ws)
+{
+	struct vcp_work_struct *sws =
+		container_of(ws, struct vcp_work_struct, work);
+	struct mtk_vcp_device *vcp = platform_get_drvdata(to_platform_device(sws->dev));
+	enum vcp_core_id core_id = sws->flags;
+
+	if (core_id < VCP_CORE_TOTAL) {
+		mutex_lock(&vcp->vcp_cluster->vcp_ready_mutex);
+		vcp->vcp_cluster->vcp_ready[core_id] = true;
+		mutex_unlock(&vcp->vcp_cluster->vcp_ready_mutex);
+
+		vcp_extern_notify(core_id, VCP_EVENT_READY);
+
+		/*clear reset status and unlock wake lock*/
+		dev_info(sws->dev, "%s core id %u ready\n", __func__, core_id);
+	} else {
+		dev_warn(sws->dev, "%s wrong core id %u\n", __func__, core_id);
+	}
+}
+
+static void vcp_A_set_ready(struct mtk_vcp_device *vcp,
+			    enum vcp_core_id core_id)
+{
+	if (core_id < VCP_CORE_TOTAL) {
+		vcp->vcp_cluster->vcp_ready_notify_wk[core_id].flags = core_id;
+		queue_work(vcp->vcp_cluster->vcp_workqueue,
+			   &vcp->vcp_cluster->vcp_ready_notify_wk[core_id].work);
+	}
+}
+
+int vcp_A_ready_ipi_handler(u32 id, void *prdata, void *data, u32 len)
+{
+	struct mtk_vcp_device *vcp = (struct mtk_vcp_device *)prdata;
+
+	switch (id) {
+	case IPI_IN_VCP_READY_0:
+		if (!is_vcp_ready_by_coreid(VCP_ID))
+			vcp_A_set_ready(vcp, VCP_ID);
+		break;
+	case IPI_IN_VCP_READY_1:
+		if (!is_vcp_ready_by_coreid(MMUP_ID))
+			vcp_A_set_ready(vcp, MMUP_ID);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static int reset_vcp(struct mtk_vcp_device *vcp)
 {
 	struct arm_smccc_res res;
+	bool mmup_status, vcp_status;
 
 	if (vcp->vcp_cluster->core_nums >= MMUP_ID) {
 		/* write vcp reserved memory address/size to GRP1/GRP2
@@ -359,6 +485,16 @@ static int reset_vcp(struct mtk_vcp_device *vcp)
 		arm_smccc_smc(MTK_SIP_TINYSYS_VCP_CONTROL,
 			      MTK_TINYSYS_MMUP_KERNEL_OP_RESET_RELEASE,
 			      1, 0, 0, 0, 0, 0, &res);
+
+		read_poll_timeout_atomic(is_vcp_ready_by_coreid,
+					 mmup_status, mmup_status,
+					 USEC_PER_MSEC,
+					 VCP_READY_TIMEOUT_MS * USEC_PER_MSEC,
+					 false, MMUP_ID);
+		if (!mmup_status) {
+			dev_err(vcp->dev, "MMUP_ID bootup timeout. Stop vcp booting\n");
+			return -EINVAL;
+		}
 	}
 
 	/* write vcp reserved memory address/size to GRP1/GRP2
@@ -372,6 +508,17 @@ static int reset_vcp(struct mtk_vcp_device *vcp)
 	arm_smccc_smc(MTK_SIP_TINYSYS_VCP_CONTROL,
 		      MTK_TINYSYS_VCP_KERNEL_OP_RESET_RELEASE,
 		      1, 0, 0, 0, 0, 0, &res);
+
+	read_poll_timeout_atomic(is_vcp_ready_by_coreid,
+				 vcp_status, vcp_status,
+				 USEC_PER_MSEC,
+				 VCP_READY_TIMEOUT_MS * USEC_PER_MSEC,
+				 false, VCP_ID);
+	if (!vcp_status) {
+		dev_err(vcp->dev, "VCP_ID bootup timeout. Stop vcp booting\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -458,6 +605,22 @@ int vcp_A_deregister_feature(struct mtk_vcp_device *vcp, enum feature_id id)
 	return ret;
 }
 
+int vcp_notify_work_init(struct mtk_vcp_device *vcp)
+{
+	vcp->vcp_cluster->vcp_workqueue = create_singlethread_workqueue("VCP_WQ");
+	if (!vcp->vcp_cluster->vcp_workqueue) {
+		dev_err(vcp->dev, "vcp_workqueue create fail\n");
+		return -EINVAL;
+	}
+
+	for (u32 core_id = 0; core_id < VCP_CORE_TOTAL; core_id++) {
+		vcp->vcp_cluster->vcp_ready_notify_wk[core_id].dev = vcp->dev;
+		INIT_WORK(&vcp->vcp_cluster->vcp_ready_notify_wk[core_id].work, vcp_A_notify_ws);
+	}
+
+	return 0;
+}
+
 static size_t load_part_binary(void __iomem *image_buf,
 			       const u8 *fw_src,
 			       size_t size,
diff --git a/drivers/remoteproc/mtk_vcp_common.h b/drivers/remoteproc/mtk_vcp_common.h
index 8340f0bd4fdc..4a4393b2ae1f 100644
--- a/drivers/remoteproc/mtk_vcp_common.h
+++ b/drivers/remoteproc/mtk_vcp_common.h
@@ -14,6 +14,8 @@
 
 /* vcp timeout definition */
 #define VCP_AWAKE_TIMEOUT 1000
+#define VCP_READY_TIMEOUT_MS 3000
+#define VCP_IPI_DEV_READY_TIMEOUT 1000
 #define USDELAY_RANGE_MIN 1000
 #define USDELAY_RANGE_MAX 2000
 
@@ -153,6 +155,21 @@ struct vcp_reserve_mblock {
 	size_t size;
 };
 
+/**
+ * struct vcp_work_struct - vcp notify work structure.
+ *
+ * @work: struct work_struct member
+ * @dev: struct device member
+ * @u32 flags: vcp notify work flag
+ * @id: vcp core id
+ */
+struct vcp_work_struct {
+	struct work_struct work;
+	struct device *dev;
+	u32 flags;
+	u32 id;
+};
+
 /**
  * struct vcp_region_info_st - config vcp image info sync to vcp bootloader.
  *
@@ -200,6 +217,19 @@ struct vcp_region_info_st {
 	u32 coredump_dram_offset;
 };
 
+/* vcp common ready signale APIs */
+int vcp_A_ready_ipi_handler(u32 id, void *prdata,
+			    void *data, u32 len);
+bool is_vcp_ready(enum feature_id id);
+
+/* vcp common notify extern APIs */
+int vcp_notify_work_init(struct mtk_vcp_device *vcp);
+void vcp_extern_notify(enum vcp_core_id core_id,
+		       enum VCP_NOTIFY_EVENT notify_status);
+void vcp_A_register_notify(enum feature_id id,
+			   struct notifier_block *nb);
+void vcp_A_unregister_notify(enum feature_id id,
+			     struct notifier_block *nb);
 /* vcp common reserved memory APIs */
 int vcp_reserve_memory_ioremap(struct mtk_vcp_device *vcp);
 phys_addr_t vcp_get_reserve_mem_phys(enum vcp_reserve_mem_id_t id);
diff --git a/drivers/remoteproc/mtk_vcp_rproc.c b/drivers/remoteproc/mtk_vcp_rproc.c
index bf4736ce6795..4aa0ed47abd7 100644
--- a/drivers/remoteproc/mtk_vcp_rproc.c
+++ b/drivers/remoteproc/mtk_vcp_rproc.c
@@ -5,6 +5,7 @@
 
 #include <linux/device.h>
 #include <linux/module.h>
+#include <linux/iopoll.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
@@ -60,10 +61,39 @@ void vcp_put(struct mtk_vcp_device *vcp)
 }
 EXPORT_SYMBOL_GPL(vcp_put);
 
+/**
+ * vcp_get_ipidev() - get a vcp ipi device struct to reference vcp ipi.
+ *
+ * @vcp: mtk_vcp_device structure from vcp_get().
+ *
+ **/
+struct mtk_ipi_device *vcp_get_ipidev(struct mtk_vcp_device *vcp)
+{
+	return vcp->ipi_dev;
+}
+EXPORT_SYMBOL_GPL(vcp_get_ipidev);
+
 static int mtk_vcp_start(struct rproc *rproc)
 {
 	struct mtk_vcp_device *vcp = (struct mtk_vcp_device *)rproc->priv;
 	struct arm_smccc_res res;
+	int ret;
+
+	ret = vcp->ipi_ops->ipi_register(vcp->ipi_dev, IPI_IN_VCP_READY_0,
+					 (void *)vcp_A_ready_ipi_handler,
+					 vcp, &vcp->vcp_cluster->msg_vcp_ready0);
+	if (ret) {
+		dev_err(vcp->dev, "Failed to register IPI_IN_VCP_READY_0\n");
+		goto vcp0_ready_ipi_unregister;
+	}
+
+	ret = vcp->ipi_ops->ipi_register(vcp->ipi_dev, IPI_IN_VCP_READY_1,
+					 (void *)vcp_A_ready_ipi_handler,
+					 vcp, &vcp->vcp_cluster->msg_vcp_ready1);
+	if (ret) {
+		dev_err(vcp->dev, "Failed to register IPI_IN_VCP_READY_1\n");
+		goto vcp1_ready_ipi_unregister;
+	}
 
 	/* core 0 */
 	arm_smccc_smc(MTK_SIP_TINYSYS_VCP_CONTROL,
@@ -82,7 +112,14 @@ static int mtk_vcp_start(struct rproc *rproc)
 		dev_info(vcp->dev, "bootup successfully\n");
 	}
 
-	return 0;
+	return ret;
+
+vcp1_ready_ipi_unregister:
+	vcp->ipi_ops->ipi_unregister(vcp->ipi_dev, IPI_IN_VCP_READY_1);
+vcp0_ready_ipi_unregister:
+	vcp->ipi_ops->ipi_unregister(vcp->ipi_dev, IPI_IN_VCP_READY_0);
+
+	return ret;
 }
 
 static int mtk_vcp_stop(struct rproc *rproc)
@@ -91,6 +128,9 @@ static int mtk_vcp_stop(struct rproc *rproc)
 
 	vcp_A_deregister_feature(vcp, RTOS_FEATURE_ID);
 
+	vcp_extern_notify(VCP_ID, VCP_EVENT_STOP);
+	vcp_extern_notify(MMUP_ID, VCP_EVENT_STOP);
+
 	return 0;
 }
 
@@ -100,6 +140,43 @@ static const struct rproc_ops mtk_vcp_ops = {
 	.stop		= mtk_vcp_stop,
 };
 
+static int vcp_ipi_mbox_init(struct mtk_vcp_device *vcp)
+{
+	struct mtk_vcp_ipc *vcp_ipc;
+	struct platform_device *pdev;
+	int ret;
+
+	pdev = platform_device_register_data(vcp->dev, "mtk-vcp-ipc",
+					     PLATFORM_DEVID_NONE,
+					     vcp->platdata->ipc_data,
+					     sizeof(struct mtk_mbox_table));
+	if (IS_ERR(pdev)) {
+		ret = PTR_ERR(pdev);
+		dev_err(vcp->dev, "failed to create mtk-vcp-ipc device\n");
+		return ret;
+	}
+
+	ret = read_poll_timeout_atomic(dev_get_drvdata,
+				       vcp_ipc, vcp_ipc,
+				       USEC_PER_MSEC,
+				       VCP_IPI_DEV_READY_TIMEOUT * USEC_PER_MSEC,
+				       false,
+				       &pdev->dev);
+	if (ret) {
+		ret = -EPROBE_DEFER;
+		dev_err(vcp->dev, "failed to get drvdata\n");
+		return ret;
+	}
+
+	ret = mtk_vcp_ipc_device_register(vcp->ipi_dev, VCP_IPI_COUNT, vcp_ipc);
+	if (ret) {
+		dev_err(vcp->dev, "ipi_dev_register failed, ret %d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
 static int vcp_multi_core_init(struct platform_device *pdev,
 			       struct mtk_vcp_of_cluster *vcp_cluster,
 			       enum vcp_core_id core_id)
@@ -150,12 +227,15 @@ static struct mtk_vcp_device *vcp_rproc_init(struct platform_device *pdev,
 	vcp->dev = dev;
 	vcp->ops = &vcp_of_data->ops;
 	vcp->platdata = &vcp_of_data->platdata;
+	vcp->ipi_ops = vcp_of_data->platdata.ipi_ops;
 	vcp->vcp_cluster = vcp_cluster;
+	vcp->ipi_dev = &vcp_cluster->vcp_ipidev;
 
 	rproc->auto_boot = vcp_of_data->platdata.auto_boot;
 	rproc->sysfs_read_only = vcp_of_data->platdata.sysfs_read_only;
 	mutex_init(&vcp->vcp_cluster->vcp_feature_mutex);
 	mutex_init(&vcp->vcp_cluster->vcp_pw_clk_mutex);
+	mutex_init(&vcp->vcp_cluster->vcp_ready_mutex);
 	platform_set_drvdata(pdev, vcp);
 
 	ret = vcp_reserve_memory_ioremap(vcp);
@@ -185,6 +265,16 @@ static struct mtk_vcp_device *vcp_rproc_init(struct platform_device *pdev,
 		return ERR_PTR(ret);
 	}
 
+	ret = vcp_ipi_mbox_init(vcp);
+	if (ret) {
+		dev_err(dev, "Failed to init vcp ipi-mbox\n");
+		return ERR_PTR(ret);
+	}
+
+	ret = vcp_notify_work_init(vcp);
+	if (ret)
+		dev_err(dev, "vcp_notify_work_init failed\n");
+
 	pm_runtime_get_sync(dev);
 
 	return vcp;
@@ -264,6 +354,8 @@ static void vcp_device_remove(struct platform_device *pdev)
 {
 	struct mtk_vcp_device *vcp = platform_get_drvdata(pdev);
 
+	flush_workqueue(vcp->vcp_cluster->vcp_workqueue);
+	destroy_workqueue(vcp->vcp_cluster->vcp_workqueue);
 	pm_runtime_disable(&pdev->dev);
 
 	rproc_del(vcp->rproc);
@@ -274,6 +366,12 @@ static void vcp_device_shutdown(struct platform_device *pdev)
 	struct mtk_vcp_device *vcp = platform_get_drvdata(pdev);
 	u32 ret;
 
+	vcp->vcp_cluster->vcp_ready[VCP_ID] = false;
+	vcp->vcp_cluster->vcp_ready[MMUP_ID] = false;
+
+	vcp_extern_notify(VCP_ID, VCP_EVENT_STOP);
+	vcp_extern_notify(MMUP_ID, VCP_EVENT_STOP);
+
 	writel(GIPC_VCP_HART0_SHUT, vcp->vcp_cluster->cfg_core + R_GIPC_IN_SET);
 	if (vcp->vcp_cluster->core_nums > VCP_ID) {
 		ret = wait_core_hart_shutdown(vcp, VCP_ID);
@@ -285,8 +383,60 @@ static void vcp_device_shutdown(struct platform_device *pdev)
 	}
 }
 
+static struct mtk_mbox_table ipc_table = {
+	.send_table = {
+		{ .msg_size = 18, .ipi_id =  0, .mbox_id = 0 },
+
+		{ .msg_size =  8, .ipi_id = 15, .mbox_id = 1 },
+		{ .msg_size = 18, .ipi_id = 16, .mbox_id = 1 },
+		{ .msg_size =  2, .ipi_id =  9, .mbox_id = 1 },
+
+		{ .msg_size = 18, .ipi_id = 11, .mbox_id = 2 },
+		{ .msg_size =  2, .ipi_id =  2, .mbox_id = 2 },
+		{ .msg_size =  3, .ipi_id =  3, .mbox_id = 2 },
+		{ .msg_size =  2, .ipi_id = 32, .mbox_id = 2 },
+
+		{ .msg_size =  2, .ipi_id = 33, .mbox_id = 3 },
+		{ .msg_size =  2, .ipi_id = 13, .mbox_id = 3 },
+		{ .msg_size =  2, .ipi_id = 35, .mbox_id = 3 },
+
+		{ .msg_size =  2, .ipi_id = 20, .mbox_id = 4 },
+		{ .msg_size =  3, .ipi_id = 21, .mbox_id = 4 },
+		{ .msg_size =  2, .ipi_id = 23, .mbox_id = 4 }
+	},
+	.recv_table = {
+		{ .recv_opt = 0, .msg_size = 18, .ipi_id =  1, .mbox_id = 0 },
+
+		{ .recv_opt = 1, .msg_size =  8, .ipi_id = 15, .mbox_id = 1 },
+		{ .recv_opt = 0, .msg_size = 18, .ipi_id = 17, .mbox_id = 1 },
+		{ .recv_opt = 0, .msg_size =  2, .ipi_id = 10, .mbox_id = 1 },
+
+		{ .recv_opt = 0, .msg_size = 18, .ipi_id = 12, .mbox_id = 2 },
+		{ .recv_opt = 0, .msg_size =  1, .ipi_id =  5, .mbox_id = 2 },
+		{ .recv_opt = 1, .msg_size =  1, .ipi_id =  2, .mbox_id = 2 },
+
+		{ .recv_opt = 0, .msg_size =  2, .ipi_id = 34, .mbox_id = 3 },
+		{ .recv_opt = 0, .msg_size =  2, .ipi_id = 14, .mbox_id = 3 },
+
+		{ .recv_opt = 0, .msg_size =  1, .ipi_id = 26, .mbox_id = 4 },
+		{ .recv_opt = 1, .msg_size =  1, .ipi_id = 20, .mbox_id = 4 }
+	},
+	.recv_count = 11,
+	.send_count = 14,
+};
+
+static struct mtk_vcp_ipi_ops mt8196_vcp_ipi_ops = {
+	.ipi_send = mtk_vcp_ipc_send,
+	.ipi_send_compl = mtk_vcp_ipc_send_compl,
+	.ipi_register = mtk_vcp_mbox_ipc_register,
+	.ipi_unregister = mtk_vcp_mbox_ipc_unregister,
+};
+
 static const struct mtk_vcp_of_data mt8196_of_data = {
 	.ops = {
+		.vcp_is_ready = is_vcp_ready,
+		.vcp_register_notify = vcp_A_register_notify,
+		.vcp_unregister_notify = vcp_A_unregister_notify,
 		.vcp_register_feature = vcp_A_register_feature,
 		.vcp_deregister_feature = vcp_A_deregister_feature,
 		.vcp_get_mem_phys = vcp_get_reserve_mem_phys,
@@ -299,6 +449,8 @@ static const struct mtk_vcp_of_data mt8196_of_data = {
 		.auto_boot = true,
 		.sysfs_read_only = true,
 		.rtos_static_iova = 0x180600000,
+		.ipc_data = &ipc_table,
+		.ipi_ops = &mt8196_vcp_ipi_ops,
 		.fw_name = "mediatek/mt8196/vcp.img",
 	},
 };
diff --git a/drivers/remoteproc/mtk_vcp_rproc.h b/drivers/remoteproc/mtk_vcp_rproc.h
index 6c7a99bf919b..e36612256b63 100644
--- a/drivers/remoteproc/mtk_vcp_rproc.h
+++ b/drivers/remoteproc/mtk_vcp_rproc.h
@@ -20,11 +20,18 @@
  * @core_nums: total core numbers get from dtb
  * @twohart: core weo hart support flag
  * @sram_offset: core sram memory layout
+ * @msg_vcp_ready0: core0 ready ipi msg data
+ * @msg_vcp_ready1: core1 ready ipi msg data
  * @pwclkcnt: power and clock config count data
+ * @vcp_ready: vcp core status flag
  * @share_mem_iova: shared memory iova base
  * @share_mem_size: shared memory size
  * @vcp_feature_mutex: vcp feature register mutex structure
  * @vcp_pw_clk_mutex: vcp feature lock pw_clk mutex structure
+ * @vcp_ready_mutex: vcp core ready mutex structure
+ * @vcp_ipidev: struct mtk_ipi_device
+ * @vcp_workqueue: ready workqueue_struct
+ * @vcp_ready_notify_wk: vcp_work_struct structure
  */
 struct mtk_vcp_of_cluster {
 	void __iomem *sram_base;
@@ -36,11 +43,18 @@ struct mtk_vcp_of_cluster {
 	u32 core_nums;
 	u32 twohart[VCP_CORE_TOTAL];
 	u32 sram_offset[VCP_CORE_TOTAL];
+	u32 msg_vcp_ready0;
+	u32 msg_vcp_ready1;
 	int pwclkcnt;
+	bool vcp_ready[VCP_CORE_TOTAL];
 	dma_addr_t share_mem_iova;
 	size_t share_mem_size;
 	struct mutex vcp_feature_mutex;
 	struct mutex vcp_pw_clk_mutex;
+	struct mutex vcp_ready_mutex;
+	struct mtk_ipi_device vcp_ipidev;
+	struct workqueue_struct *vcp_workqueue;
+	struct vcp_work_struct vcp_ready_notify_wk[VCP_CORE_TOTAL];
 };
 
 /**
@@ -49,12 +63,16 @@ struct mtk_vcp_of_cluster {
  * @auto_boot: rproc auto_boot flag
  * @sysfs_read_only: rproc sysfs_read_only flag
  * @rtos_static_iova: vcp dram binary static map iova
+ * @mtk_mbox_table: mtk_mbox_table structure
+ * @mtk_vcp_ipi_ops: vcp ipi api ops structure
  * @fw_name: vcp image name and path
  */
 struct mtk_vcp_platdata {
 	bool auto_boot;
 	bool sysfs_read_only;
 	dma_addr_t rtos_static_iova;
+	struct mtk_mbox_table *ipc_data;
+	struct mtk_vcp_ipi_ops *ipi_ops;
 	char *fw_name;
 };
 
diff --git a/include/linux/remoteproc/mtk_vcp_public.h b/include/linux/remoteproc/mtk_vcp_public.h
index b4de5e5d63d8..5bd562d1ae62 100644
--- a/include/linux/remoteproc/mtk_vcp_public.h
+++ b/include/linux/remoteproc/mtk_vcp_public.h
@@ -7,8 +7,19 @@
 #define __MTK_VCP_PUBLIC_H__
 
 #include <linux/platform_device.h>
+#include <linux/firmware/mediatek/mtk-vcp-ipc.h>
 #include <linux/remoteproc.h>
 
+#define VCP_SYNC_TIMEOUT_MS             (50)
+
+/* vcp notify event */
+enum VCP_NOTIFY_EVENT {
+	VCP_EVENT_READY = 0,
+	VCP_EVENT_STOP,
+	VCP_EVENT_SUSPEND,
+	VCP_EVENT_RESUME,
+};
+
 /* vcp reserve memory ID definition */
 enum vcp_reserve_mem_id_t {
 	VCP_RTOS_MEM_ID,
@@ -38,16 +49,66 @@ enum feature_id {
 	NUM_FEATURE_ID,
 };
 
+/* vcp ipi ID list */
+enum {
+	IPI_OUT_VDEC_1                 =  0,
+	IPI_IN_VDEC_1                  =  1,
+	IPI_OUT_C_SLEEP_0              =  2,
+	IPI_OUT_TEST_0                 =  3,
+	IPI_IN_VCP_READY_0             =  5,
+	IPI_OUT_MMDVFS_VCP             =  9,
+	IPI_IN_MMDVFS_VCP              = 10,
+	IPI_OUT_MMQOS                  = 11,
+	IPI_IN_MMQOS                   = 12,
+	IPI_OUT_MMDEBUG                = 13,
+	IPI_IN_MMDEBUG                 = 14,
+	IPI_OUT_C_VCP_HWVOTER_DEBUG    = 15,
+	IPI_OUT_VENC_0                 = 16,
+	IPI_IN_VENC_0                  = 17,
+	IPI_OUT_C_SLEEP_1              = 20,
+	IPI_OUT_TEST_1                 = 21,
+	IPI_OUT_LOGGER_CTRL_0          = 22,
+	IPI_OUT_VCPCTL_1               = 23,
+	IPI_IN_LOGGER_CTRL_0           = 25,
+	IPI_IN_VCP_READY_1             = 26,
+	IPI_OUT_LOGGER_CTRL_1          = 30,
+	IPI_IN_LOGGER_CTRL_1           = 31,
+	IPI_OUT_VCPCTL_0               = 32,
+	IPI_OUT_MMDVFS_MMUP            = 33,
+	IPI_IN_MMDVFS_MMUP             = 34,
+	IPI_OUT_VDISP                  = 35,
+	VCP_IPI_COUNT,
+	VCP_IPI_NS_SERVICE             = 0xff,
+	VCP_IPI_NS_SERVICE_COUNT       = 0x100,
+};
+
 struct mtk_vcp_device {
 	struct platform_device *pdev;
 	struct device *dev;
 	struct rproc *rproc;
+	struct mtk_ipi_device *ipi_dev;
+	struct rproc_subdev *rpmsg_subdev;
+	struct mtk_rpmsg_channel_info_mbox *mtk_rpchan;
 	struct mtk_vcp_of_cluster *vcp_cluster;
+	const struct mtk_vcp_ipi_ops *ipi_ops;
 	const struct mtk_vcp_ops *ops;
 	const struct mtk_vcp_platdata *platdata;
 };
 
+struct mtk_vcp_ipi_ops {
+	int (*ipi_send)(struct mtk_ipi_device *ipidev, u32 ipi_id,
+			void *data, u32 len);
+	int (*ipi_send_compl)(struct mtk_ipi_device *ipidev, u32 ipi_id,
+			      void *data, u32 len, u32 timeout_ms);
+	int (*ipi_register)(struct mtk_ipi_device *ipidev, int ipi_id,
+			    mbox_pin_cb_t cb, void *prdata, void *msg);
+	int (*ipi_unregister)(struct mtk_ipi_device *ipidev, int ipi_id);
+};
+
 struct mtk_vcp_ops {
+	bool (*vcp_is_ready)(enum feature_id id);
+	void (*vcp_register_notify)(enum feature_id id, struct notifier_block *nb);
+	void (*vcp_unregister_notify)(enum feature_id id, struct notifier_block *nb);
 	int (*vcp_register_feature)(struct mtk_vcp_device *vcp, enum feature_id id);
 	int (*vcp_deregister_feature)(struct mtk_vcp_device *vcp, enum feature_id id);
 	phys_addr_t (*vcp_get_mem_phys)(enum vcp_reserve_mem_id_t id);
@@ -59,6 +120,7 @@ struct mtk_vcp_ops {
 
 struct mtk_vcp_device *vcp_get(struct platform_device *pdev);
 void vcp_put(struct mtk_vcp_device *vcp);
+struct mtk_ipi_device *vcp_get_ipidev(struct mtk_vcp_device *vcp);
 
 /*
  * These inline functions are intended for user drivers that are loaded
-- 
2.46.0

