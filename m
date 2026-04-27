Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431A13B7B9E;
	Mon, 27 Apr 2026 11:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777288517; cv=none; b=DCw69FvE8TWbxJ5iWybWQiR4wS6A9tEpLYzE2hFgSq6xjYXgY6sTuE0YGvl8X40j8UyuAQVlh2jNSpR+cSaF3B0dOIYMOM0ocOZDXdn1TWBgU937k26RTCVT/4aCzzcNbHTR/9kqI6S9/DlPYVZzgv619dfTEqOeCNB3dy6rgcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777288517; c=relaxed/simple;
	bh=+anf/IuoXPqgGne/vlqBH14S951HO9Kht7dyjXmyENw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ce8Ctk1yXpf7jR1elZgbiGlW/3f/rbf35TMiCw2MRqTpliPq8hIoEHxzci/SFfgpBL521avRJbxI3WVSLBc4e4BO/NikPTcXBoIkQ33XQ28rI29UFfumuB4xOdn2MOz7mf2H78sG/YSF29Wy1V09hEr9AOtIKrh3U5g7svicnOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=nxm6XjKW; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nxm6XjKW"
X-UUID: 5a645168422a11f19781c1a04af40193-20260427
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OIValaQeGImV/ACyBi7fRKCEV0y0/J7XNfUs0SEO87M=;
	b=nxm6XjKW7nlCXZ8ihn0ubl5Vyv9Fd7t65QofH8WLa9C+6ZlvgLBo/o0p+b13mTRnENodJSBX/VirOZq2ExSGjEarY59Qte8BTq5QcQXPcc9yuhhgeFqFIY+utRqZLaGekDWkpBjOcvjQWK4A/KlTQMgtQSdo5nrxDAIocln3XYo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:c7f1c78e-e2f1-466a-b883-fa4e2a95ad4b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:dc56f88f-6df4-4a3d-a7a4-fbdc42d669ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5a645168422a11f19781c1a04af40193-20260427
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <xiangzhi.tang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 792478311; Mon, 27 Apr 2026 19:15:09 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 27 Apr 2026 19:15:08 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 27 Apr 2026 19:15:07 +0800
From: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"Matthias Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Xiangzhi Tang
	<Xiangzhi.Tang@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hailong Fan
	<Hailong.Fan@mediatek.com>, Huayu Zong <Huayu.Zong@mediatek.com>, Jarried Lin
	<Jarried.Lin@mediatek.com>, Justin Yeh <Justin.Yeh@mediatek.com>, "Vince-WL
 Liu" <Vince-WL.Liu@mediatek.com>, Xiangzhi Tang <xiangzhi.tang@mediatek.com>
Subject: [PATCH v4 5/7] remoteproc: mediatek: Add VCP ipi communication sync mechanism
Date: Mon, 27 Apr 2026 19:04:44 +0800
Message-ID: <20260427111446.22955-6-xiangzhi.tang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260427111446.22955-1-xiangzhi.tang@mediatek.com>
References: <20260427111446.22955-1-xiangzhi.tang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add the inter-processor interrupt (IPI) communication synchronization
mechanism for the VCP remoteproc driver:

- Implement VCP ready IPI registration to receive notifications when
  VCP firmware is initialized and ready for communication
- Add VCP ready notification work queue mechanism to handle firmware
  ready events asynchronously
- Implement VCP feature registration mechanism to allow different
  subsystems to register their capabilities and dependencies with VCP

This synchronization mechanism ensures proper coordination between
the host CPU and VCP firmware during boot and runtime operations.

Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
---
 drivers/remoteproc/mtk_vcp_common.c       | 277 ++++++++++++++++++++++
 drivers/remoteproc/mtk_vcp_common.h       |  55 +++++
 drivers/remoteproc/mtk_vcp_rproc.c        |  65 +++++
 drivers/remoteproc/mtk_vcp_rproc.h        |  18 ++
 include/linux/remoteproc/mtk_vcp_public.h |  13 +
 5 files changed, 428 insertions(+)

diff --git a/drivers/remoteproc/mtk_vcp_common.c b/drivers/remoteproc/mtk_vcp_common.c
index 9872d0caf331..039c0a469631 100644
--- a/drivers/remoteproc/mtk_vcp_common.c
+++ b/drivers/remoteproc/mtk_vcp_common.c
@@ -24,6 +24,9 @@
 #include "mtk_vcp_common.h"
 #include "mtk_vcp_rproc.h"
 
+static BLOCKING_NOTIFIER_HEAD(vcp_notifier_list);
+static BLOCKING_NOTIFIER_HEAD(mmup_notifier_list);
+
 phys_addr_t vcp_get_reserve_mem_phys(struct mtk_vcp_device *vcp,
 				     enum vcp_reserve_mem_id id)
 {
@@ -168,6 +171,42 @@ int vcp_reserve_memory_init(struct mtk_vcp_device *vcp)
 	return ret;
 }
 
+static bool vcp_is_core_ready(struct mtk_vcp_device *vcp,
+			      enum vcp_core_id core_id)
+{
+	switch (core_id) {
+	case VCP_ID:
+		return vcp->vcp_cluster->vcp_ready[VCP_ID];
+	case MMUP_ID:
+		return vcp->vcp_cluster->vcp_ready[MMUP_ID];
+	case VCP_CORE_TOTAL:
+	default:
+		return vcp->vcp_cluster->vcp_ready[VCP_ID] &
+		       vcp->vcp_cluster->vcp_ready[MMUP_ID];
+	}
+}
+
+static enum vcp_core_id get_core_by_feature(struct mtk_vcp_device *vcp,
+					    enum vcp_feature_id id)
+{
+	u32 f_id;
+
+	for (f_id = 0; f_id < NUM_FEATURE_ID; f_id++) {
+		if (vcp->platdata->feature_tb[f_id].feature_id == id)
+			return vcp->platdata->feature_tb[f_id].core_id;
+	}
+
+	return 0;
+}
+
+bool is_vcp_ready(struct mtk_vcp_device *vcp,
+		  enum vcp_feature_id id)
+{
+	enum vcp_core_id core_id = get_core_by_feature(vcp, id);
+
+	return vcp_is_core_ready(vcp, core_id);
+}
+
 int wait_core_hart_shutdown(struct mtk_vcp_device *vcp,
 			    enum vcp_core_id core_id)
 {
@@ -230,9 +269,119 @@ int wait_core_hart_shutdown(struct mtk_vcp_device *vcp,
 	return 0;
 }
 
+void vcp_register_notify(struct mtk_vcp_device *vcp,
+			 enum vcp_feature_id id,
+			 struct notifier_block *nb)
+{
+	enum vcp_core_id core_id = get_core_by_feature(vcp, id);
+
+	switch (core_id) {
+	case VCP_ID:
+		blocking_notifier_chain_register(&vcp_notifier_list, nb);
+		if (vcp_is_core_ready(vcp, VCP_ID))
+			nb->notifier_call(nb, VCP_EVENT_READY, NULL);
+		break;
+	case MMUP_ID:
+		blocking_notifier_chain_register(&mmup_notifier_list, nb);
+		if (vcp_is_core_ready(vcp, MMUP_ID))
+			nb->notifier_call(nb, VCP_EVENT_READY, NULL);
+		break;
+	default:
+		dev_err(vcp->dev, "%s, Unsupported core id\n", __func__);
+		break;
+	}
+}
+
+void vcp_unregister_notify(struct mtk_vcp_device *vcp,
+			   enum vcp_feature_id id,
+			   struct notifier_block *nb)
+{
+	enum vcp_core_id core_id = get_core_by_feature(vcp, id);
+
+	switch (core_id) {
+	case VCP_ID:
+		blocking_notifier_chain_unregister(&vcp_notifier_list, nb);
+		break;
+	case MMUP_ID:
+		blocking_notifier_chain_unregister(&mmup_notifier_list, nb);
+		break;
+	default:
+		dev_err(vcp->dev, "%s, Unsupported core id\n", __func__);
+		break;
+	}
+}
+
+void vcp_extern_notify(enum vcp_core_id core_id,
+		       enum vcp_notify_event notify_status)
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
+static void vcp_notify_ws(struct work_struct *ws)
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
+		dev_info(sws->dev, "%s, VCP core %u ready\n", __func__, core_id);
+	} else {
+		dev_err(sws->dev, "%s, Invalid core id %u\n", __func__, core_id);
+	}
+}
+
+static void vcp_set_ready(struct mtk_vcp_device *vcp,
+			  enum vcp_core_id core_id)
+{
+	if (core_id < VCP_CORE_TOTAL) {
+		vcp->vcp_cluster->vcp_ready_notify_wk[core_id].flags = core_id;
+		queue_work(vcp->vcp_cluster->vcp_workqueue,
+			   &vcp->vcp_cluster->vcp_ready_notify_wk[core_id].work);
+	}
+}
+
+int vcp_ready_ipi_handler(u32 id, void *prdata, void *data, u32 len)
+{
+	struct mtk_vcp_device *vcp = prdata;
+
+	switch (id) {
+	case IPI_IN_VCP_READY_0:
+		if (!vcp_is_core_ready(vcp, VCP_ID))
+			vcp_set_ready(vcp, VCP_ID);
+		break;
+	case IPI_IN_VCP_READY_1:
+		if (!vcp_is_core_ready(vcp, MMUP_ID))
+			vcp_set_ready(vcp, MMUP_ID);
+		break;
+	default:
+		dev_err(vcp->dev, "%s, Unsupported IPI id\n", __func__);
+		break;
+	}
+
+	return 0;
+}
+
 int reset_vcp(struct mtk_vcp_device *vcp)
 {
 	struct arm_smccc_res res;
+	bool mmup_status, vcp_status;
+	int ret;
 
 	if (vcp->vcp_cluster->core_nums > MMUP_ID) {
 		writel((u32)VCP_PACK_IOVA(vcp->vcp_cluster->share_mem_iova),
@@ -247,6 +396,16 @@ int reset_vcp(struct mtk_vcp_device *vcp)
 			dev_err(vcp->dev, "MMUP reset release SMC failed: %ld\n", res.a0);
 			return -EIO;
 		}
+
+		ret = read_poll_timeout(vcp_is_core_ready,
+					mmup_status, mmup_status,
+					USEC_PER_MSEC,
+					VCP_READY_TIMEOUT_MS * USEC_PER_MSEC,
+					false, vcp, MMUP_ID);
+		if (ret) {
+			dev_err(vcp->dev, "MMUP bootup timeout\n");
+			return ret;
+		}
 	}
 
 	writel((u32)VCP_PACK_IOVA(vcp->vcp_cluster->share_mem_iova),
@@ -262,6 +421,124 @@ int reset_vcp(struct mtk_vcp_device *vcp)
 		return -EIO;
 	}
 
+	ret = read_poll_timeout(vcp_is_core_ready,
+				vcp_status, vcp_status,
+				USEC_PER_MSEC,
+				VCP_READY_TIMEOUT_MS * USEC_PER_MSEC,
+				false, vcp, VCP_ID);
+	if (ret)
+		dev_err(vcp->dev, "VCP bootup timeout\n");
+
+	return ret;
+}
+
+static int vcp_enable_pm_clk(struct mtk_vcp_device *vcp, enum vcp_feature_id id)
+{
+	struct vcp_slp_ctrl slp_data;
+	bool suspend_status;
+	int ret;
+
+	if (vcp->vcp_cluster->feature_enable[id]) {
+		dev_err(vcp->dev, "%s feature(id=%d) already enabled\n",
+			__func__, id);
+		return -EINVAL;
+	}
+
+	if (id != RTOS_FEATURE_ID) {
+		slp_data.cmd = SLP_WAKE_LOCK;
+		slp_data.feature = id;
+		ret = vcp->ipi_ops->ipi_send_compl(vcp->ipi_dev, IPI_OUT_C_SLEEP_0,
+					     &slp_data, PIN_OUT_C_SIZE_SLEEP_0, 500);
+		if (ret < 0) {
+			dev_err(vcp->dev, "%s ipc_send_compl failed. ret %d\n",
+				__func__, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int vcp_disable_pm_clk(struct mtk_vcp_device *vcp, enum vcp_feature_id id)
+{
+	struct vcp_slp_ctrl slp_data;
+	bool suspend_status;
+	int ret;
+
+	if (!vcp->vcp_cluster->feature_enable[id]) {
+		dev_err(vcp->dev, "%s feature(id=%d) already disabled\n",
+			__func__, id);
+		return -EINVAL;
+	}
+
+	if (id != RTOS_FEATURE_ID) {
+		slp_data.cmd = SLP_WAKE_UNLOCK;
+		slp_data.feature = id;
+		ret = vcp->ipi_ops->ipi_send_compl(vcp->ipi_dev, IPI_OUT_C_SLEEP_0,
+					 &slp_data, PIN_OUT_C_SIZE_SLEEP_0, 500);
+		if (ret < 0) {
+			dev_err(vcp->dev, "%s ipc_send_compl failed. ret %d\n",
+				__func__, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+int vcp_register_feature(struct mtk_vcp_device *vcp, enum vcp_feature_id id)
+{
+	int ret;
+
+	if (id >= NUM_FEATURE_ID) {
+		dev_err(vcp->dev, "%s, Unsupported feature id %d\n", __func__, id);
+		return -EINVAL;
+	}
+
+	mutex_lock(&vcp->vcp_cluster->vcp_feature_mutex);
+	ret = vcp_enable_pm_clk(vcp, id);
+	if (ret)
+		dev_err(vcp->dev, "%s, Feature %d register failed\n", __func__, id);
+	else
+		vcp->vcp_cluster->feature_enable[id] = true;
+	mutex_unlock(&vcp->vcp_cluster->vcp_feature_mutex);
+
+	return ret;
+}
+
+int vcp_deregister_feature(struct mtk_vcp_device *vcp, enum vcp_feature_id id)
+{
+	int ret;
+
+	if (id >= NUM_FEATURE_ID) {
+		dev_err(vcp->dev, "%s, Unsupported feature id %d\n", __func__, id);
+		return -EINVAL;
+	}
+
+	mutex_lock(&vcp->vcp_cluster->vcp_feature_mutex);
+	ret = vcp_disable_pm_clk(vcp, id);
+	if (ret)
+		dev_err(vcp->dev, "%s, Feature %d deregister failed\n", __func__, id);
+	else
+		vcp->vcp_cluster->feature_enable[id] = false;
+	mutex_unlock(&vcp->vcp_cluster->vcp_feature_mutex);
+
+	return ret;
+}
+
+int vcp_notify_work_init(struct mtk_vcp_device *vcp)
+{
+	u32 c_id;
+
+	vcp->vcp_cluster->vcp_workqueue = create_singlethread_workqueue("VCP_WQ");
+	if (!vcp->vcp_cluster->vcp_workqueue)
+		return dev_err_probe(vcp->dev, -ENOMEM, "Failed to create workqueue\n");
+
+	for (c_id = 0; c_id < VCP_CORE_TOTAL; c_id++) {
+		vcp->vcp_cluster->vcp_ready_notify_wk[c_id].dev = vcp->dev;
+		INIT_WORK(&vcp->vcp_cluster->vcp_ready_notify_wk[c_id].work, vcp_notify_ws);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/remoteproc/mtk_vcp_common.h b/drivers/remoteproc/mtk_vcp_common.h
index 96eaed1b8f02..1238a165cac4 100644
--- a/drivers/remoteproc/mtk_vcp_common.h
+++ b/drivers/remoteproc/mtk_vcp_common.h
@@ -13,10 +13,13 @@
 #include <linux/remoteproc/mtk_vcp_public.h>
 
 /* VCP timeout definition */
+#define VCP_READY_TIMEOUT_MS 3000
+#define VCP_IPI_DEV_READY_TIMEOUT 1000
 #define CORE_HART_SHUTDOWN_TIMEOUT_MS 10
 
 /* VCP platform definition */
 #define DMA_MAX_MASK_BIT 33
+#define PIN_OUT_C_SIZE_SLEEP_0 2
 
 /* VCP load image definition */
 #define VCM_IMAGE_MAGIC             (0x58881688)
@@ -90,6 +93,14 @@ enum vcp_core_id {
 	VCP_CORE_TOTAL,
 };
 
+enum vcp_slp_cmd {
+	SLP_WAKE_LOCK = 0,
+	SLP_WAKE_UNLOCK,
+	SLP_STATUS_DBG,
+	SLP_SUSPEND,
+	SLP_RESUME,
+};
+
 enum mtk_tinysys_vcp_kernel_op {
 	MTK_TINYSYS_VCP_KERNEL_OP_RESET_SET = 0,
 	MTK_TINYSYS_VCP_KERNEL_OP_RESET_RELEASE,
@@ -154,6 +165,32 @@ struct vcp_reserve_mblock {
 	size_t size;
 };
 
+/**
+ * struct vcp_slp_ctrl - sleep ctrl data sync with AP and VCP
+ *
+ * @feature: Feature id
+ * @cmd: sleep cmd flag.
+ */
+struct vcp_slp_ctrl {
+	u32 feature;
+	u32 cmd;
+};
+
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
@@ -203,6 +240,19 @@ struct vcp_region_info_st {
 	u32 coredump_dram_offset;
 } __packed;
 
+int vcp_ready_ipi_handler(u32 id, void *prdata,
+			  void *data, u32 len);
+bool is_vcp_ready(struct mtk_vcp_device *vcp,
+		  enum vcp_feature_id id);
+int vcp_notify_work_init(struct mtk_vcp_device *vcp);
+void vcp_extern_notify(enum vcp_core_id core_id,
+		       enum vcp_notify_event notify_status);
+void vcp_register_notify(struct mtk_vcp_device *vcp,
+			 enum vcp_feature_id id,
+			 struct notifier_block *nb);
+void vcp_unregister_notify(struct mtk_vcp_device *vcp,
+			   enum vcp_feature_id id,
+			   struct notifier_block *nb);
 
 int vcp_reserve_memory_init(struct mtk_vcp_device *vcp);
 phys_addr_t vcp_get_reserve_mem_phys(struct mtk_vcp_device *vcp, enum vcp_reserve_mem_id id);
@@ -216,5 +266,10 @@ int mtk_vcp_load(struct rproc *rproc, const struct firmware *fw);
 
 int vcp_wdt_irq_init(struct mtk_vcp_device *vcp);
 
+int vcp_register_feature(struct mtk_vcp_device *vcp,
+			 enum vcp_feature_id id);
+int vcp_deregister_feature(struct mtk_vcp_device *vcp,
+			   enum vcp_feature_id id);
+
 int wait_core_hart_shutdown(struct mtk_vcp_device *vcp, enum vcp_core_id core_id);
 #endif
diff --git a/drivers/remoteproc/mtk_vcp_rproc.c b/drivers/remoteproc/mtk_vcp_rproc.c
index f3b2646f79f6..2f320849fe15 100644
--- a/drivers/remoteproc/mtk_vcp_rproc.c
+++ b/drivers/remoteproc/mtk_vcp_rproc.c
@@ -75,6 +75,30 @@ static int mtk_vcp_start(struct rproc *rproc)
 {
 	struct mtk_vcp_device *vcp = rproc->priv;
 	struct arm_smccc_res res;
+	int ret;
+
+	ret = vcp->ipi_ops->ipi_register(vcp->ipi_dev, IPI_OUT_C_SLEEP_0,
+					 NULL, NULL, &vcp->vcp_cluster->slp_ipi_ack_data);
+	if (ret) {
+		dev_err(vcp->dev, "Failed to register IPI_OUT_C_SLEEP_0\n");
+		return ret;
+	}
+
+	ret = vcp->ipi_ops->ipi_register(vcp->ipi_dev, IPI_IN_VCP_READY_0,
+					 (void *)vcp_ready_ipi_handler,
+					 vcp, &vcp->vcp_cluster->msg_vcp_ready0);
+	if (ret) {
+		dev_err(vcp->dev, "Failed to register IPI_IN_VCP_READY_0\n");
+		goto vcp0_ready_ipi_unregister;
+	}
+
+	ret = vcp->ipi_ops->ipi_register(vcp->ipi_dev, IPI_IN_VCP_READY_1,
+					 (void *)vcp_ready_ipi_handler,
+					 vcp, &vcp->vcp_cluster->msg_vcp_ready1);
+	if (ret) {
+		dev_err(vcp->dev, "Failed to register IPI_IN_VCP_READY_1\n");
+		goto vcp1_ready_ipi_unregister;
+	}
 
 	/* core 0 */
 	arm_smccc_smc(MTK_SIP_TINYSYS_VCP_CONTROL,
@@ -103,16 +127,37 @@ static int mtk_vcp_start(struct rproc *rproc)
 	}
 
 	dev_info(vcp->dev, "VCP bootup successfully\n");
+	ret = vcp_register_feature(vcp, RTOS_FEATURE_ID);
+	if (ret) {
+		dev_err(vcp->dev, "Failed to register RTOS feature\n");
+		goto reset_failed;
+	}
 
 	return 0;
 
 reset_failed:
+	vcp->ipi_ops->ipi_unregister(vcp->ipi_dev, IPI_IN_VCP_READY_1);
+vcp1_ready_ipi_unregister:
+	vcp->ipi_ops->ipi_unregister(vcp->ipi_dev, IPI_IN_VCP_READY_0);
+vcp0_ready_ipi_unregister:
+	vcp->ipi_ops->ipi_unregister(vcp->ipi_dev, IPI_OUT_C_SLEEP_0);
 
 	return ret;
 }
 
 static int mtk_vcp_stop(struct rproc *rproc)
 {
+	struct mtk_vcp_device *vcp = rproc->priv;
+
+	vcp_deregister_feature(vcp, RTOS_FEATURE_ID);
+
+	vcp_extern_notify(VCP_ID, VCP_EVENT_STOP);
+	vcp_extern_notify(MMUP_ID, VCP_EVENT_STOP);
+
+	vcp->ipi_ops->ipi_unregister(vcp->ipi_dev, IPI_IN_VCP_READY_1);
+	vcp->ipi_ops->ipi_unregister(vcp->ipi_dev, IPI_IN_VCP_READY_0);
+	vcp->ipi_ops->ipi_unregister(vcp->ipi_dev, IPI_OUT_C_SLEEP_0);
+
 	return 0;
 }
 
@@ -204,6 +249,8 @@ static struct mtk_vcp_device *vcp_rproc_init(struct platform_device *pdev,
 
 	rproc->auto_boot = vcp_of_data->platdata.auto_boot;
 	rproc->sysfs_read_only = vcp_of_data->platdata.sysfs_read_only;
+	mutex_init(&vcp->vcp_cluster->vcp_feature_mutex);
+	mutex_init(&vcp->vcp_cluster->vcp_ready_mutex);
 	platform_set_drvdata(pdev, vcp);
 
 	ret = vcp_reserve_memory_init(vcp);
@@ -237,6 +284,10 @@ static struct mtk_vcp_device *vcp_rproc_init(struct platform_device *pdev,
 	if (ret)
 		return ERR_PTR(dev_err_probe(dev, ret, "vcp_ipi_mbox_init failed\n"));
 
+	ret = vcp_notify_work_init(vcp);
+	if (ret)
+		return ERR_PTR(dev_err_probe(dev, ret, "vcp_notify_work_init failed\n"));
+
 	ret = pm_runtime_get_sync(dev);
 	if (ret < 0) {
 		pm_runtime_put_noidle(dev);
@@ -313,6 +364,8 @@ static void vcp_device_remove(struct platform_device *pdev)
 {
 	struct mtk_vcp_device *vcp = platform_get_drvdata(pdev);
 
+	flush_workqueue(vcp->vcp_cluster->vcp_workqueue);
+	destroy_workqueue(vcp->vcp_cluster->vcp_workqueue);
 	pm_runtime_disable(&pdev->dev);
 
 	rproc_del(vcp->rproc);
@@ -323,6 +376,12 @@ static void vcp_device_shutdown(struct platform_device *pdev)
 	struct mtk_vcp_device *vcp = platform_get_drvdata(pdev);
 	int ret;
 
+	vcp->vcp_cluster->vcp_ready[VCP_ID] = false;
+	vcp->vcp_cluster->vcp_ready[MMUP_ID] = false;
+
+	vcp_extern_notify(VCP_ID, VCP_EVENT_STOP);
+	vcp_extern_notify(MMUP_ID, VCP_EVENT_STOP);
+
 	writel(GIPC_VCP_HART0_SHUT, vcp->vcp_cluster->cfg_core + R_GIPC_IN_SET);
 	ret = wait_core_hart_shutdown(vcp, VCP_ID);
 	if (ret)
@@ -408,6 +467,12 @@ static struct mtk_vcp_ipi_ops mt8196_vcp_ipi_ops = {
 
 static const struct mtk_vcp_of_data mt8196_of_data = {
 	.ops = {
+		.vcp_is_ready = is_vcp_ready,
+		.vcp_is_suspending = is_vcp_suspending,
+		.register_feature = vcp_register_feature,
+		.deregister_feature = vcp_deregister_feature,
+		.register_notify = vcp_register_notify,
+		.unregister_notify = vcp_unregister_notify,
 		.get_mem_phys = vcp_get_reserve_mem_phys,
 		.get_mem_iova = vcp_get_reserve_mem_iova,
 		.get_mem_virt = vcp_get_reserve_mem_virt,
diff --git a/drivers/remoteproc/mtk_vcp_rproc.h b/drivers/remoteproc/mtk_vcp_rproc.h
index c34d3a2757a9..64a25287dc5c 100644
--- a/drivers/remoteproc/mtk_vcp_rproc.h
+++ b/drivers/remoteproc/mtk_vcp_rproc.h
@@ -19,10 +19,19 @@
  * @core_nums: total core numbers get from dtb
  * @hart_count: number of hardware threads (harts) per core
  * @sram_offset: core sram memory layout
+ * @msg_vcp_ready0: core0 ready ipi msg data
+ * @msg_vcp_ready1: core1 ready ipi msg data
+ * @slp_ipi_ack_data: sleep ipi msg data
+ * @feature_enable: feature status count data
+ * @vcp_ready: vcp core status flag
  * @share_mem_iova: shared memory iova base
  * @share_mem_size: shared memory size
+ * @vcp_feature_mutex: vcp feature register mutex structure
+ * @vcp_ready_mutex: vcp core ready mutex structure
  * @vcp_ipidev: struct mtk_ipi_device
+ * @vcp_workqueue: ready workqueue_struct
  * @vcp_memory_tb: vcp memory allocated table
+ * @vcp_ready_notify_wk: vcp_work_struct structure
  */
 struct mtk_vcp_of_cluster {
 	void __iomem *sram_base;
@@ -33,10 +42,19 @@ struct mtk_vcp_of_cluster {
 	u32 core_nums;
 	u32 hart_count[VCP_CORE_TOTAL];
 	u32 sram_offset[VCP_CORE_TOTAL];
+	u32 msg_vcp_ready0;
+	u32 msg_vcp_ready1;
+	u32 slp_ipi_ack_data;
+	bool feature_enable[NUM_FEATURE_ID];
+	bool vcp_ready[VCP_CORE_TOTAL];
 	dma_addr_t share_mem_iova;
 	size_t share_mem_size;
+	struct mutex vcp_feature_mutex;
+	struct mutex vcp_ready_mutex;
 	struct mtk_ipi_device vcp_ipidev;
+	struct workqueue_struct *vcp_workqueue;
 	struct vcp_reserve_mblock vcp_memory_tb[NUMS_MEM_ID];
+	struct vcp_work_struct vcp_ready_notify_wk[VCP_CORE_TOTAL];
 };
 
 /**
diff --git a/include/linux/remoteproc/mtk_vcp_public.h b/include/linux/remoteproc/mtk_vcp_public.h
index fda3cf5061e3..91634e807543 100644
--- a/include/linux/remoteproc/mtk_vcp_public.h
+++ b/include/linux/remoteproc/mtk_vcp_public.h
@@ -100,6 +100,19 @@ struct mtk_vcp_ipi_ops {
 };
 
 struct mtk_vcp_ops {
+	bool (*vcp_is_suspending)(struct mtk_vcp_device *vcp);
+	bool (*vcp_is_ready)(struct mtk_vcp_device *vcp,
+			     enum vcp_feature_id id);
+	int (*register_feature)(struct mtk_vcp_device *vcp,
+				enum vcp_feature_id id);
+	int (*deregister_feature)(struct mtk_vcp_device *vcp,
+				  enum vcp_feature_id id);
+	void (*register_notify)(struct mtk_vcp_device *vcp,
+				enum vcp_feature_id id,
+				struct notifier_block *nb);
+	void (*unregister_notify)(struct mtk_vcp_device *vcp,
+				  enum vcp_feature_id id,
+				  struct notifier_block *nb);
 	phys_addr_t (*get_mem_phys)(struct mtk_vcp_device *vcp,
 				    enum vcp_reserve_mem_id id);
 	dma_addr_t (*get_mem_iova)(struct mtk_vcp_device *vcp,
-- 
2.46.0

