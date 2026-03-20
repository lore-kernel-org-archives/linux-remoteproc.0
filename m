Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBA3280CFC;
	Fri, 20 Mar 2026 03:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773976867; cv=none; b=UxlDh7NzPL2X7i+jLU03ZW12KfTVmGqsPmuoKi+Wnw9c5x6vSFUbQLIgthG7oYSWBXg+mVa8KFK2vFQTZhZjx0tPFxWewiqxtJrEPbdxrPoDM3Z1ISG4omZdd3g6pYK/CGDQ1gjQj/lZMDyePQH+TvLrzLawXPIO6dEAk9bRFBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773976867; c=relaxed/simple;
	bh=lYT7o1JBgTwBelKiM2eaFw+md6vclbJ/6in3UMPjpwo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uFhTclNq2ZUDLIjZYFcjD8wz5U+4h4GNyof+5jYdnf0dFyaMi8WskvWlr1VSfOv/nws6MXIKC4yePDOkMNY/G6+QFK1bWFOdn7VqxqKci02g/1X9SB2ZGuBjtXuaLu8+RJWZ9SKbz/0RBlgaTt1f/XVgCfOvPZL78ZgzkOVmLXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=T993Wtdu; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="T993Wtdu"
X-UUID: d02f8d5a240b11f1a39cd589f645bc18-20260320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=bfHyWawRl4vYE7iTZb8yAakfsESJYG+ItEreEJ/CV5E=;
	b=T993WtduQxD/y4wnOBGYiKaetg+aF9Hjq5Qy7ovxZzf7Pe3gs/f5rsDZ+p8vG5SWKJHoBeXTEi2nUwz3RlL5PSVVkofNReKQC5KYE//EAHusRn4tA+jynnHJsk7aU/9OgrEXnWGHJ2eKxRg6sHRGM5JDk9mSghFJrqanS0J7rkw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:79e55bb2-d12b-4849-acdb-0643351cc315,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:1e8fe916-aa6b-4b2e-be76-373ef1a42b04,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d02f8d5a240b11f1a39cd589f645bc18-20260320
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <xiangzhi.tang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1962490241; Fri, 20 Mar 2026 11:20:58 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 20 Mar 2026 11:20:56 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 20 Mar 2026 11:20:55 +0800
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
	<Hailong.Fan@mediatek.com>, Huayu Zong <huayu.Zong@mediatek.com>, "Xiangzhi
 Tang" <xiangzhi.tang@mediatek.com>
Subject: [PATCH v3 5/6] remoteproc: mediatek: Add VCP ipi communication sync mechanism
Date: Fri, 20 Mar 2026 11:18:07 +0800
Message-ID: <20260320032014.13608-6-xiangzhi.tang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260320032014.13608-1-xiangzhi.tang@mediatek.com>
References: <20260320032014.13608-1-xiangzhi.tang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

1.Add vcp ready ipi register driver.
2.Add vcp ready notify work mechanism.
3.Add vcp feature resgiter mechanism.

Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
---
 drivers/remoteproc/mtk_vcp_common.c       | 279 ++++++++++++++++++++++
 drivers/remoteproc/mtk_vcp_common.h       |  56 +++++
 drivers/remoteproc/mtk_vcp_rproc.c        |  62 ++++-
 drivers/remoteproc/mtk_vcp_rproc.h        |  18 ++
 include/linux/remoteproc/mtk_vcp_public.h |  12 +
 5 files changed, 425 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_vcp_common.c b/drivers/remoteproc/mtk_vcp_common.c
index 97ea8099912d..f3b506034e95 100644
--- a/drivers/remoteproc/mtk_vcp_common.c
+++ b/drivers/remoteproc/mtk_vcp_common.c
@@ -24,6 +24,9 @@
 #include "mtk_vcp_common.h"
 #include "mtk_vcp_rproc.h"
 
+static BLOCKING_NOTIFIER_HEAD(mmup_notifier_list);
+static BLOCKING_NOTIFIER_HEAD(vcp_notifier_list);
+
 phys_addr_t vcp_get_reserve_mem_phys(struct mtk_vcp_device *vcp,
 				     enum vcp_reserve_mem_id id)
 {
@@ -153,6 +156,40 @@ int vcp_reserve_memory_init(struct mtk_vcp_device *vcp)
 	return 0;
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
+	for (u32 i = 0; i < NUM_FEATURE_ID; i++) {
+		if (vcp->platdata->feature_tb[i].feature_id == id)
+			return vcp->platdata->feature_tb[i].core_id;
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
@@ -215,9 +252,120 @@ int wait_core_hart_shutdown(struct mtk_vcp_device *vcp,
 	return ret;
 }
 
+void vcp_A_register_notify(struct mtk_vcp_device *vcp,
+			   enum vcp_feature_id id,
+			   struct notifier_block *nb)
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
+		dev_err(vcp->dev, "%s(), No Support core id\n", __func__);
+		break;
+	}
+}
+
+void vcp_A_unregister_notify(struct mtk_vcp_device *vcp,
+			     enum vcp_feature_id id,
+			     struct notifier_block *nb)
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
+		dev_err(vcp->dev, "%s(), No Support core id\n", __func__);
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
+		dev_err(sws->dev, "%s wrong core id %u\n", __func__, core_id);
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
+		if (!vcp_is_core_ready(vcp, VCP_ID))
+			vcp_A_set_ready(vcp, VCP_ID);
+		break;
+	case IPI_IN_VCP_READY_1:
+		if (!vcp_is_core_ready(vcp, MMUP_ID))
+			vcp_A_set_ready(vcp, MMUP_ID);
+		break;
+	default:
+		dev_err(vcp->dev, "%s(), No Support ipi id\n", __func__);
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
@@ -228,6 +376,16 @@ int reset_vcp(struct mtk_vcp_device *vcp)
 		arm_smccc_smc(MTK_SIP_TINYSYS_VCP_CONTROL,
 			      MTK_TINYSYS_MMUP_KERNEL_OP_RESET_RELEASE,
 			      1, 0, 0, 0, 0, 0, &res);
+
+		ret = read_poll_timeout(vcp_is_core_ready,
+					mmup_status, mmup_status,
+					USEC_PER_MSEC,
+					VCP_READY_TIMEOUT_MS * USEC_PER_MSEC,
+					false, vcp, MMUP_ID);
+		if (ret) {
+			dev_err(vcp->dev, "MMUP_ID bootup timeout. Stop vcp booting\n");
+			return ret;
+		}
 	}
 
 	writel((u32)VCP_PACK_IOVA(vcp->vcp_cluster->share_mem_iova),
@@ -239,6 +397,127 @@ int reset_vcp(struct mtk_vcp_device *vcp)
 		      MTK_TINYSYS_VCP_KERNEL_OP_RESET_RELEASE,
 		      1, 0, 0, 0, 0, 0, &res);
 
+	ret = read_poll_timeout(vcp_is_core_ready,
+				vcp_status, vcp_status,
+				USEC_PER_MSEC,
+				VCP_READY_TIMEOUT_MS * USEC_PER_MSEC,
+				false, vcp, VCP_ID);
+	if (ret) {
+		dev_err(vcp->dev, "VCP_ID bootup timeout. Stop vcp booting\n");
+		return ret;
+	}
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
+int vcp_A_register_feature(struct mtk_vcp_device *vcp, enum vcp_feature_id id)
+{
+	int ret;
+
+	if (id >= NUM_FEATURE_ID) {
+		dev_err(vcp->dev, "%s unsupported feature id %d\n",
+			__func__, id);
+		return -EINVAL;
+	}
+
+	mutex_lock(&vcp->vcp_cluster->vcp_feature_mutex);
+	ret = vcp_enable_pm_clk(vcp, id);
+	if (ret)
+		dev_err(vcp->dev, "%s feature(id=%d) register failed\n",
+			__func__, id);
+	else
+		vcp->vcp_cluster->feature_enable[id] = true;
+	mutex_unlock(&vcp->vcp_cluster->vcp_feature_mutex);
+
+	return ret;
+}
+
+int vcp_A_deregister_feature(struct mtk_vcp_device *vcp, enum vcp_feature_id id)
+{
+	int ret;
+
+	if (id >= NUM_FEATURE_ID) {
+		dev_err(vcp->dev, "%s unsupported feature id %d\n", __func__, id);
+		return -EINVAL;
+	}
+
+	mutex_lock(&vcp->vcp_cluster->vcp_feature_mutex);
+	ret = vcp_disable_pm_clk(vcp, id);
+	if (ret)
+		dev_err(vcp->dev, "%s feature(id=%d) deregister failed\n",
+			__func__, id);
+	else
+		vcp->vcp_cluster->feature_enable[id] = false;
+	mutex_unlock(&vcp->vcp_cluster->vcp_feature_mutex);
+
+	return ret;
+}
+
+int vcp_notify_work_init(struct mtk_vcp_device *vcp)
+{
+	vcp->vcp_cluster->vcp_workqueue = create_singlethread_workqueue("VCP_WQ");
+	if (!vcp->vcp_cluster->vcp_workqueue)
+		return dev_err_probe(vcp->dev, -EINVAL, "vcp_workqueue create fail\n");
+
+	for (u32 core_id = 0; core_id < VCP_CORE_TOTAL; core_id++) {
+		vcp->vcp_cluster->vcp_ready_notify_wk[core_id].dev = vcp->dev;
+		INIT_WORK(&vcp->vcp_cluster->vcp_ready_notify_wk[core_id].work, vcp_A_notify_ws);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/remoteproc/mtk_vcp_common.h b/drivers/remoteproc/mtk_vcp_common.h
index d048757c955a..8b19fcb78a79 100644
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
@@ -201,6 +238,20 @@ struct vcp_region_info_st {
 	u32 coredump_dram_offset;
 };
 
+int vcp_A_ready_ipi_handler(u32 id, void *prdata,
+			    void *data, u32 len);
+bool is_vcp_ready(struct mtk_vcp_device *vcp,
+		  enum vcp_feature_id id);
+int vcp_notify_work_init(struct mtk_vcp_device *vcp);
+void vcp_extern_notify(enum vcp_core_id core_id,
+		       enum vcp_notify_event notify_status);
+void vcp_A_register_notify(struct mtk_vcp_device *vcp,
+			   enum vcp_feature_id id,
+			   struct notifier_block *nb);
+void vcp_A_unregister_notify(struct mtk_vcp_device *vcp,
+			     enum vcp_feature_id id,
+			     struct notifier_block *nb);
+
 int vcp_reserve_memory_init(struct mtk_vcp_device *vcp);
 phys_addr_t vcp_get_reserve_mem_phys(struct mtk_vcp_device *vcp, enum vcp_reserve_mem_id id);
 dma_addr_t vcp_get_reserve_mem_iova(struct mtk_vcp_device *vcp, enum vcp_reserve_mem_id id);
@@ -213,5 +264,10 @@ int mtk_vcp_load(struct rproc *rproc, const struct firmware *fw);
 
 int vcp_wdt_irq_init(struct mtk_vcp_device *vcp);
 
+int vcp_A_register_feature(struct mtk_vcp_device *vcp,
+			   enum vcp_feature_id id);
+int vcp_A_deregister_feature(struct mtk_vcp_device *vcp,
+			     enum vcp_feature_id id);
+
 int wait_core_hart_shutdown(struct mtk_vcp_device *vcp, enum vcp_core_id core_id);
 #endif
diff --git a/drivers/remoteproc/mtk_vcp_rproc.c b/drivers/remoteproc/mtk_vcp_rproc.c
index 6e0fecef72ce..833a0dc69d9c 100644
--- a/drivers/remoteproc/mtk_vcp_rproc.c
+++ b/drivers/remoteproc/mtk_vcp_rproc.c
@@ -71,6 +71,30 @@ static int mtk_vcp_start(struct rproc *rproc)
 {
 	struct mtk_vcp_device *vcp = (struct mtk_vcp_device *)rproc->priv;
 	struct arm_smccc_res res;
+	int ret;
+
+	ret = vcp->ipi_ops->ipi_register(vcp->ipi_dev, IPI_OUT_C_SLEEP_0,
+					 NULL, NULL, &vcp->vcp_cluster->slp_ipi_ack_data);
+	if (ret) {
+		dev_err(vcp->dev, "Failed to register IPI_OUT_C_SLEEP_0\n");
+		goto slp_ipi_unregister;
+	}
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
@@ -83,10 +107,22 @@ static int mtk_vcp_start(struct rproc *rproc)
 		      1, 0, 0, 0, 0, 0, &res);
 
 	ret = reset_vcp(vcp);
-	if (ret)
+	if (ret) {
 		dev_err(vcp->dev, "bootup fail\n");
-	else
+	} else {
 		dev_info(vcp->dev, "bootup successfully\n");
+		if (vcp_A_register_feature(vcp, RTOS_FEATURE_ID) < 0)
+			vcp_A_deregister_feature(vcp, RTOS_FEATURE_ID);
+	}
+
+	return ret;
+
+vcp1_ready_ipi_unregister:
+	vcp->ipi_ops->ipi_unregister(vcp->ipi_dev, IPI_IN_VCP_READY_1);
+vcp0_ready_ipi_unregister:
+	vcp->ipi_ops->ipi_unregister(vcp->ipi_dev, IPI_IN_VCP_READY_0);
+slp_ipi_unregister:
+	vcp->ipi_ops->ipi_unregister(vcp->ipi_dev, IPI_OUT_C_SLEEP_0);
 
 	return ret;
 }
@@ -97,6 +133,9 @@ static int mtk_vcp_stop(struct rproc *rproc)
 
 	vcp_A_deregister_feature(vcp, RTOS_FEATURE_ID);
 
+	vcp_extern_notify(VCP_ID, VCP_EVENT_STOP);
+	vcp_extern_notify(MMUP_ID, VCP_EVENT_STOP);
+
 	return 0;
 }
 
@@ -185,6 +224,8 @@ static struct mtk_vcp_device *vcp_rproc_init(struct platform_device *pdev,
 
 	rproc->auto_boot = vcp_of_data->platdata.auto_boot;
 	rproc->sysfs_read_only = vcp_of_data->platdata.sysfs_read_only;
+	mutex_init(&vcp->vcp_cluster->vcp_feature_mutex);
+	mutex_init(&vcp->vcp_cluster->vcp_ready_mutex);
 	platform_set_drvdata(pdev, vcp);
 
 	ret = vcp_reserve_memory_init(vcp);
@@ -213,6 +254,10 @@ static struct mtk_vcp_device *vcp_rproc_init(struct platform_device *pdev,
 	if (ret)
 		return ERR_PTR(dev_err_probe(dev, ret, "vcp_ipi_mbox_init failed\n"));
 
+	ret = vcp_notify_work_init(vcp);
+	if (ret)
+		return ERR_PTR(dev_err_probe(dev, ret, "vcp_notify_work_init failed\n"));
+
 	pm_runtime_get_sync(dev);
 
 	return vcp;
@@ -287,6 +332,8 @@ static void vcp_device_remove(struct platform_device *pdev)
 {
 	struct mtk_vcp_device *vcp = platform_get_drvdata(pdev);
 
+	flush_workqueue(vcp->vcp_cluster->vcp_workqueue);
+	destroy_workqueue(vcp->vcp_cluster->vcp_workqueue);
 	pm_runtime_disable(&pdev->dev);
 
 	rproc_del(vcp->rproc);
@@ -297,6 +344,12 @@ static void vcp_device_shutdown(struct platform_device *pdev)
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
@@ -382,6 +435,11 @@ static struct mtk_vcp_ipi_ops mt8196_vcp_ipi_ops = {
 
 static const struct mtk_vcp_of_data mt8196_of_data = {
 	.ops = {
+		.vcp_is_ready = is_vcp_ready,
+		.vcp_register_feature = vcp_A_register_feature,
+		.vcp_deregister_feature = vcp_A_deregister_feature,
+		.vcp_register_notify = vcp_A_register_notify,
+		.vcp_unregister_notify = vcp_A_unregister_notify,
 		.vcp_get_mem_phys = vcp_get_reserve_mem_phys,
 		.vcp_get_mem_iova = vcp_get_reserve_mem_iova,
 		.vcp_get_mem_virt = vcp_get_reserve_mem_virt,
diff --git a/drivers/remoteproc/mtk_vcp_rproc.h b/drivers/remoteproc/mtk_vcp_rproc.h
index ff3e67fc2611..600715b77124 100644
--- a/drivers/remoteproc/mtk_vcp_rproc.h
+++ b/drivers/remoteproc/mtk_vcp_rproc.h
@@ -19,10 +19,19 @@
  * @core_nums: total core numbers get from dtb
  * @twohart: core weo hart support flag
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
 	u32 twohart[VCP_CORE_TOTAL];
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
index 58ba4b8bb023..b9e1d86685fd 100644
--- a/include/linux/remoteproc/mtk_vcp_public.h
+++ b/include/linux/remoteproc/mtk_vcp_public.h
@@ -100,6 +100,18 @@ struct mtk_vcp_ipi_ops {
 };
 
 struct mtk_vcp_ops {
+	bool (*vcp_is_ready)(struct mtk_vcp_device *vcp,
+			     enum vcp_feature_id id);
+	int (*vcp_register_feature)(struct mtk_vcp_device *vcp,
+				    enum vcp_feature_id id);
+	int (*vcp_deregister_feature)(struct mtk_vcp_device *vcp,
+				      enum vcp_feature_id id);
+	void (*vcp_register_notify)(struct mtk_vcp_device *vcp,
+				    enum vcp_feature_id id,
+				    struct notifier_block *nb);
+	void (*vcp_unregister_notify)(struct mtk_vcp_device *vcp,
+				      enum vcp_feature_id id,
+				      struct notifier_block *nb);
 	phys_addr_t (*vcp_get_mem_phys)(struct mtk_vcp_device *vcp,
 					enum vcp_reserve_mem_id id);
 	dma_addr_t (*vcp_get_mem_iova)(struct mtk_vcp_device *vcp,
-- 
2.46.0

