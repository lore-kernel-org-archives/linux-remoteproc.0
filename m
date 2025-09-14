Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1442A25FA34;
	Sun, 14 Sep 2025 12:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757853055; cv=none; b=o3dzEWEtQ3SN5Vl/7uitAfV3LyVeZV6wXasUNPfM2B/0spW7FrPs3M7gQleV3P3tHMSevh7AsLe87FC9Zci6EHvaZkX8cpkcRoKGIUbijPODDHDZtU8WPIvyyRKQ4pNMatMyPdSBo11B2Dj/A70FRtrqDH0pzikTkuizSdyKDkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757853055; c=relaxed/simple;
	bh=+eyaWRZwnJ/LVXTl6E2ao/7V6h9VuFubdUcN+SBNyoc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EGLPbtSZZyhSrbYFKpEdFP3drNE0/Ibjm8vPRdA2UPvIeDkkhL4lNqcEji3VA3tIGwm77DVGEcD4nYFi1avx4LaMXLbCWFQECoiWXq6p9tbdrRhEwpa7EwobRHhaUO3a2vRKSgTYzD/iWUUCUKVxNoLeuWKdfnfh1Q2pmOs8nW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=DlZ5DIbe; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DlZ5DIbe"
X-UUID: a2a7a9ae916611f0bd5779446731db89-20250914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Kn7FPyCoQ97bS+YMe8FzRImsW3BTm2Hf2FJ79qnWQGQ=;
	b=DlZ5DIbeOeNXCdRcp3/6YgMs4moTadQrdMLs6rwQANK2MKIJM8+8T+731Rr2JMlaEg/x0ZXou5/Dt/4qjRLGC6gmHyiPdTsZQPRwBaM2FwQnOhj5aVGPViMG9Z90yovQbpLx66mHEILqWpVzJGEhKmSHK0sHyT4CPoQT0I1M2a4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:9b6e5afa-a045-488a-9465-19c90b4c0c60,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:c31b886c-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a2a7a9ae916611f0bd5779446731db89-20250914
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <xiangzhi.tang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 13609182; Sun, 14 Sep 2025 20:30:45 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sun, 14 Sep 2025 20:30:38 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sun, 14 Sep 2025 20:30:37 +0800
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
Subject: [PATCH v2 4/4] remoterpoc: mediatek: vcp: Add vcp suspned and resume feature
Date: Sun, 14 Sep 2025 20:29:27 +0800
Message-ID: <20250914122943.10412-5-xiangzhi.tang@mediatek.com>
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

1.Add vcp suspend and resume callback
2.Add sleep lock ipi cmd flow for lock vcp status while
  feature using VCP

Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
---
 drivers/remoteproc/mtk_vcp_common.c       | 175 ++++++++++++++++++++++
 drivers/remoteproc/mtk_vcp_common.h       |  29 ++++
 drivers/remoteproc/mtk_vcp_rproc.c        |  66 ++++++++
 drivers/remoteproc/mtk_vcp_rproc.h        |   4 +
 include/linux/remoteproc/mtk_vcp_public.h |   1 +
 5 files changed, 275 insertions(+)

diff --git a/drivers/remoteproc/mtk_vcp_common.c b/drivers/remoteproc/mtk_vcp_common.c
index 9767f5ff15a0..0bd071f73b23 100644
--- a/drivers/remoteproc/mtk_vcp_common.c
+++ b/drivers/remoteproc/mtk_vcp_common.c
@@ -364,6 +364,127 @@ u32 wait_core_hart_shutdown(struct mtk_vcp_device *vcp,
 	return retry;
 }
 
+bool is_vcp_suspending(struct mtk_vcp_device *vcp)
+{
+	return vcp->vcp_cluster->is_suspending ? true : false;
+}
+
+void vcp_wait_core_stop(struct mtk_vcp_device *vcp, enum vcp_core_id core_id)
+{
+	u32 core_halt;
+	u32 core_axi;
+	u32 core_status;
+	u32 status;
+
+	/* make sure vcp is in idle state */
+	int timeout = SUSPEND_WAIT_TIMEOUT_MS;
+
+	while (--timeout) {
+		switch (core_id) {
+		case VCP_ID:
+			core_status = readl(vcp->vcp_cluster->cfg + R_CORE0_STATUS);
+			status = (vcp->vcp_cluster->twohart[VCP_ID] ?
+				 (B_CORE_GATED | B_HART0_HALT | B_HART1_HALT) :
+				 (B_CORE_GATED | B_HART0_HALT));
+			break;
+		case MMUP_ID:
+			core_status = readl(vcp->vcp_cluster->cfg + R_CORE1_STATUS);
+			status = (vcp->vcp_cluster->twohart[MMUP_ID] ?
+				 (B_CORE_GATED | B_HART0_HALT | B_HART1_HALT) :
+				 (B_CORE_GATED | B_HART0_HALT));
+			break;
+		case VCP_CORE_TOTAL:
+		default:
+			break;
+		}
+
+		core_halt = ((core_status & status) == status);
+		core_axi = core_status & (B_CORE_AXIS_BUSY);
+
+		if (core_halt && !core_axi) {
+			dev_err(vcp->dev, "[%s] core status 0x%x, GPIC 0x%x flag 0x%x\n",
+				core_id ? "MMUP_ID" : "VCP_ID", core_status,
+				readl(vcp->vcp_cluster->cfg_core + R_GIPC_IN_SET),
+				readl(vcp->vcp_cluster->cfg_sec + R_GPR3_SEC));
+			break;
+		}
+		usleep_range(USDELAY_RANGE_MIN, USDELAY_RANGE_MAX);
+	}
+
+	if (timeout == 0) {
+		dev_err(vcp->dev, "wait [%s] core stop timeout, current status 0x%x\n",
+			core_id ? "MMUP_ID" : "VCP_ID", core_status);
+	}
+}
+
+void vcp_wait_rdy_signal(struct mtk_vcp_device *vcp, bool rdy)
+{
+	u32 rdy_signal;
+	int ret;
+
+	if (!IS_ERR((void const *)vcp->vcp_cluster->vcp_rdy)) {
+		if (rdy)
+			ret = read_poll_timeout_atomic(readl, rdy_signal, rdy_signal & READY_BIT,
+						       USEC_PER_MSEC,
+						       VCP_SYNC_TIMEOUT_MS * USEC_PER_MSEC,
+						       false,
+						       vcp->vcp_cluster->vcp_rdy + VLP_AO_RSVD7);
+		else
+			ret = read_poll_timeout_atomic(readl, rdy_signal, !(rdy_signal & READY_BIT),
+						       USEC_PER_MSEC,
+						       VCP_SYNC_TIMEOUT_MS * USEC_PER_MSEC,
+						       false,
+						       vcp->vcp_cluster->vcp_rdy + VLP_AO_RSVD7);
+		if (ret < 0)
+			dev_err(vcp->dev, "wait vcp %s timeout 0x%x\n",
+				rdy ? "set rdy bit" : "clr rdy bit",
+				readl(vcp->vcp_cluster->vcp_rdy + VLP_AO_RSVD7));
+	} else {
+		dev_err(vcp->dev, "illegal vcp rdy signal\n");
+	}
+}
+
+void vcp_wait_suspend_resume(struct mtk_vcp_device *vcp, bool suspend)
+{
+	int timeout = SUSPEND_WAIT_TIMEOUT_MS;
+
+	if (suspend) {
+		writel(B_CORE0_SUSPEND, vcp->vcp_cluster->cfg_core + AP_R_GPR2);
+		writel(B_CORE1_SUSPEND, vcp->vcp_cluster->cfg_core + AP_R_GPR3);
+		writel(SUSPEND_IPI_MAGIC, vcp->vcp_cluster->cfg + VCP_C0_GPR0_SUSPEND_RESUME_FLAG);
+		writel(SUSPEND_IPI_MAGIC, vcp->vcp_cluster->cfg + VCP_C1_GPR0_SUSPEND_RESUME_FLAG);
+		writel(B_GIPC4_SETCLR_3, vcp->vcp_cluster->cfg_core + R_GIPC_IN_SET);
+	} else {
+		writel(B_CORE0_RESUME, vcp->vcp_cluster->cfg_core + AP_R_GPR2);
+		writel(B_CORE1_RESUME, vcp->vcp_cluster->cfg_core + AP_R_GPR3);
+		writel(RESUME_IPI_MAGIC, vcp->vcp_cluster->cfg + VCP_C0_GPR0_SUSPEND_RESUME_FLAG);
+		writel(RESUME_IPI_MAGIC, vcp->vcp_cluster->cfg + VCP_C1_GPR0_SUSPEND_RESUME_FLAG);
+		writel(B_GIPC4_SETCLR_3, vcp->vcp_cluster->cfg_core + R_GIPC_IN_SET);
+	}
+
+	while (--timeout) {
+		if (suspend &&
+		    (readl(vcp->vcp_cluster->cfg_sec + R_GPR3_SEC) & (VCP_AP_SUSPEND)) &&
+		    (readl(vcp->vcp_cluster->cfg_sec + R_GPR2_SEC) & (MMUP_AP_SUSPEND)))
+			break;
+		else if (!suspend &&
+			 !(readl(vcp->vcp_cluster->cfg_sec + R_GPR3_SEC) & (VCP_AP_SUSPEND)) &&
+			 !(readl(vcp->vcp_cluster->cfg_sec + R_GPR2_SEC) & (MMUP_AP_SUSPEND)))
+			break;
+		usleep_range(USDELAY_RANGE_MIN, USDELAY_RANGE_MAX);
+	}
+	if (timeout <= 0) {
+		dev_err(vcp->dev, "vcp %s timeout GPIC 0x%x 0x%x 0x%x 0x%x flag 0x%x 0x%x\n",
+			suspend ? "suspend" : "resume",
+			readl(vcp->vcp_cluster->cfg_core + R_GIPC_IN_SET),
+			readl(vcp->vcp_cluster->cfg_core + R_GIPC_IN_CLR),
+			readl(vcp->vcp_cluster->cfg_core + AP_R_GPR2),
+			readl(vcp->vcp_cluster->cfg_core + AP_R_GPR3),
+			readl(vcp->vcp_cluster->cfg_sec + R_GPR2_SEC),
+			readl(vcp->vcp_cluster->cfg_sec + R_GPR3_SEC));
+	}
+}
+
 void vcp_A_register_notify(enum feature_id id,
 			   struct notifier_block *nb)
 {
@@ -524,7 +645,23 @@ static int reset_vcp(struct mtk_vcp_device *vcp)
 
 static int vcp_enable_pm_clk(struct mtk_vcp_device *vcp, enum feature_id id)
 {
+	int ret;
+	bool suspend_status;
+	struct slp_ctrl_data ipi_data;
+
 	mutex_lock(&vcp->vcp_cluster->vcp_pw_clk_mutex);
+	read_poll_timeout_atomic(is_vcp_suspending,
+				 suspend_status, !suspend_status,
+				 USEC_PER_MSEC,
+				 SUSPEND_WAIT_TIMEOUT_MS * USEC_PER_MSEC,
+				 false, vcp);
+	if (suspend_status) {
+		dev_warn(vcp->dev, "%s blocked by vcp suspend, pwclkcnt(%d)\n",
+			 __func__,
+			 vcp->vcp_cluster->pwclkcnt);
+		return -ETIMEDOUT;
+	}
+
 	if (vcp->vcp_cluster->pwclkcnt == 0) {
 		if (!is_vcp_ready_by_coreid(VCP_CORE_TOTAL)) {
 			if (reset_vcp(vcp)) {
@@ -534,6 +671,17 @@ static int vcp_enable_pm_clk(struct mtk_vcp_device *vcp, enum feature_id id)
 		}
 	}
 	vcp->vcp_cluster->pwclkcnt++;
+	if (id != RTOS_FEATURE_ID) {
+		ipi_data.cmd = SLP_WAKE_LOCK;
+		ipi_data.feature = id;
+		ret = vcp->ipi_ops->ipi_send_compl(vcp->ipi_dev, IPI_OUT_C_SLEEP_0,
+					     &ipi_data, PIN_OUT_C_SIZE_SLEEP_0, 500);
+		if (ret < 0) {
+			dev_warn(vcp->dev, "%s ipc_send_compl failed. ret %d\n",
+				 __func__, ret);
+			return ret;
+		}
+	}
 	mutex_unlock(&vcp->vcp_cluster->vcp_pw_clk_mutex);
 
 	return 0;
@@ -541,7 +689,34 @@ static int vcp_enable_pm_clk(struct mtk_vcp_device *vcp, enum feature_id id)
 
 static int vcp_disable_pm_clk(struct mtk_vcp_device *vcp, enum feature_id id)
 {
+	int ret;
+	bool suspend_status;
+	struct slp_ctrl_data ipi_data;
+
 	mutex_lock(&vcp->vcp_cluster->vcp_pw_clk_mutex);
+	read_poll_timeout_atomic(is_vcp_suspending,
+				 suspend_status, !suspend_status,
+				 USEC_PER_MSEC,
+				 SUSPEND_WAIT_TIMEOUT_MS * USEC_PER_MSEC,
+				 false, vcp);
+	if (suspend_status) {
+		dev_warn(vcp->dev, "%s blocked by vcp suspend, pwclkcnt(%d)\n",
+			 __func__,
+			 vcp->vcp_cluster->pwclkcnt);
+		return -ETIMEDOUT;
+	}
+
+	if (id != RTOS_FEATURE_ID) {
+		ipi_data.cmd = SLP_WAKE_UNLOCK;
+		ipi_data.feature = id;
+		ret = vcp->ipi_ops->ipi_send_compl(vcp->ipi_dev, IPI_OUT_C_SLEEP_0,
+					 &ipi_data, PIN_OUT_C_SIZE_SLEEP_0, 500);
+		if (ret < 0) {
+			dev_err(vcp->dev, "%s ipc_send_compl failed. ret %d\n",
+				__func__, ret);
+			return ret;
+		}
+	}
 	vcp->vcp_cluster->pwclkcnt--;
 	if (vcp->vcp_cluster->pwclkcnt < 0) {
 		for (u32 i = 0; i < NUM_FEATURE_ID; i++)
diff --git a/drivers/remoteproc/mtk_vcp_common.h b/drivers/remoteproc/mtk_vcp_common.h
index 4a4393b2ae1f..42deda362b6c 100644
--- a/drivers/remoteproc/mtk_vcp_common.h
+++ b/drivers/remoteproc/mtk_vcp_common.h
@@ -18,9 +18,13 @@
 #define VCP_IPI_DEV_READY_TIMEOUT 1000
 #define USDELAY_RANGE_MIN 1000
 #define USDELAY_RANGE_MAX 2000
+#define SUSPEND_WAIT_TIMEOUT_MS 100
 
 /* vcp platform define */
 #define DMA_MAX_MASK_BIT 33
+#define RESUME_IPI_MAGIC 0x12345678
+#define SUSPEND_IPI_MAGIC 0x87654321
+#define PIN_OUT_C_SIZE_SLEEP_0 2
 
 /* vcp load image define */
 #define VCM_IMAGE_MAGIC             (0x58881688)
@@ -98,6 +102,15 @@ enum vcp_core_id {
 	VCP_CORE_TOTAL  = 2,
 };
 
+/* vcp sleep cmd flag sync with VCP FW */
+enum {
+	SLP_WAKE_LOCK = 0,
+	SLP_WAKE_UNLOCK,
+	SLP_STATUS_DBG,
+	SLP_SUSPEND,
+	SLP_RESUME,
+};
+
 /* vcp kernel smc server id */
 enum mtk_tinysys_vcp_kernel_op {
 	MTK_TINYSYS_VCP_KERNEL_OP_RESET_SET = 0,
@@ -155,6 +168,17 @@ struct vcp_reserve_mblock {
 	size_t size;
 };
 
+/**
+ * struct slp_ctrl_data - sleep ctrl data sync with AP and VCP
+ *
+ * @feature: Feature id
+ * @cmd: sleep cmd flag.
+ */
+struct slp_ctrl_data {
+	u32 feature;
+	u32 cmd;
+};
+
 /**
  * struct vcp_work_struct - vcp notify work structure.
  *
@@ -230,6 +254,8 @@ void vcp_A_register_notify(enum feature_id id,
 			   struct notifier_block *nb);
 void vcp_A_unregister_notify(enum feature_id id,
 			     struct notifier_block *nb);
+bool is_vcp_suspending(struct mtk_vcp_device *vcp);
+
 /* vcp common reserved memory APIs */
 int vcp_reserve_memory_ioremap(struct mtk_vcp_device *vcp);
 phys_addr_t vcp_get_reserve_mem_phys(enum vcp_reserve_mem_id_t id);
@@ -252,4 +278,7 @@ int vcp_A_deregister_feature(struct mtk_vcp_device *vcp,
 
 /* vcp common core hart shutdown API */
 u32 wait_core_hart_shutdown(struct mtk_vcp_device *vcp, enum vcp_core_id core_id);
+void vcp_wait_core_stop(struct mtk_vcp_device *vcp, enum vcp_core_id core_id);
+void vcp_wait_rdy_signal(struct mtk_vcp_device *vcp, bool rdy);
+void vcp_wait_suspend_resume(struct mtk_vcp_device *vcp, bool suspend);
 #endif
diff --git a/drivers/remoteproc/mtk_vcp_rproc.c b/drivers/remoteproc/mtk_vcp_rproc.c
index 4aa0ed47abd7..133518bedd76 100644
--- a/drivers/remoteproc/mtk_vcp_rproc.c
+++ b/drivers/remoteproc/mtk_vcp_rproc.c
@@ -11,6 +11,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/suspend.h>
 #include <linux/remoteproc.h>
 
 #include "mtk_vcp_common.h"
@@ -73,12 +74,68 @@ struct mtk_ipi_device *vcp_get_ipidev(struct mtk_vcp_device *vcp)
 }
 EXPORT_SYMBOL_GPL(vcp_get_ipidev);
 
+static int mtk_vcp_suspend(struct device *dev)
+{
+	struct mtk_vcp_device *vcp = platform_get_drvdata(to_platform_device(dev));
+
+	vcp_extern_notify(VCP_ID, VCP_EVENT_SUSPEND);
+	vcp_extern_notify(MMUP_ID, VCP_EVENT_SUSPEND);
+
+	if (!vcp->vcp_cluster->is_suspending &&
+	    vcp->vcp_cluster->pwclkcnt) {
+		vcp->vcp_cluster->is_suspending = true;
+		vcp->vcp_cluster->vcp_ready[VCP_ID] = false;
+		vcp->vcp_cluster->vcp_ready[MMUP_ID] = false;
+
+		flush_workqueue(vcp->vcp_cluster->vcp_workqueue);
+
+		vcp_wait_suspend_resume(vcp, true);
+		vcp_wait_core_stop(vcp, VCP_ID);
+		vcp_wait_core_stop(vcp, MMUP_ID);
+
+		pm_runtime_put_sync(dev);
+
+		/* wait vcp clr rdy bit */
+		vcp_wait_rdy_signal(vcp, false);
+	}
+	vcp->vcp_cluster->is_suspending = true;
+
+	return 0;
+}
+
+static int mtk_vcp_resume(struct device *dev)
+{
+	struct mtk_vcp_device *vcp = platform_get_drvdata(to_platform_device(dev));
+
+	if (vcp->vcp_cluster->is_suspending &&
+	    vcp->vcp_cluster->pwclkcnt) {
+		pm_runtime_get_sync(dev);
+
+		/* wait vcp set rdy bit */
+		vcp_wait_rdy_signal(vcp, true);
+		vcp_wait_suspend_resume(vcp, false);
+	}
+	vcp->vcp_cluster->is_suspending = false;
+
+	vcp_extern_notify(MMUP_ID, VCP_EVENT_RESUME);
+	vcp_extern_notify(VCP_ID, VCP_EVENT_RESUME);
+
+	return 0;
+}
+
 static int mtk_vcp_start(struct rproc *rproc)
 {
 	struct mtk_vcp_device *vcp = (struct mtk_vcp_device *)rproc->priv;
 	struct arm_smccc_res res;
 	int ret;
 
+	ret = vcp->ipi_ops->ipi_register(vcp->ipi_dev, IPI_OUT_C_SLEEP_0,
+					 NULL, NULL, &vcp->vcp_cluster->slp_ipi_ack_data);
+	if (ret) {
+		dev_err(vcp->dev, "Failed to register IPI_OUT_C_SLEEP_0\n");
+		goto slp_ipi_unregister;
+	}
+
 	ret = vcp->ipi_ops->ipi_register(vcp->ipi_dev, IPI_IN_VCP_READY_0,
 					 (void *)vcp_A_ready_ipi_handler,
 					 vcp, &vcp->vcp_cluster->msg_vcp_ready0);
@@ -118,6 +175,8 @@ static int mtk_vcp_start(struct rproc *rproc)
 	vcp->ipi_ops->ipi_unregister(vcp->ipi_dev, IPI_IN_VCP_READY_1);
 vcp0_ready_ipi_unregister:
 	vcp->ipi_ops->ipi_unregister(vcp->ipi_dev, IPI_IN_VCP_READY_0);
+slp_ipi_unregister:
+	vcp->ipi_ops->ipi_unregister(vcp->ipi_dev, IPI_OUT_C_SLEEP_0);
 
 	return ret;
 }
@@ -435,6 +494,7 @@ static struct mtk_vcp_ipi_ops mt8196_vcp_ipi_ops = {
 static const struct mtk_vcp_of_data mt8196_of_data = {
 	.ops = {
 		.vcp_is_ready = is_vcp_ready,
+		.vcp_is_suspending = is_vcp_suspending,
 		.vcp_register_notify = vcp_A_register_notify,
 		.vcp_unregister_notify = vcp_A_unregister_notify,
 		.vcp_register_feature = vcp_A_register_feature,
@@ -455,6 +515,11 @@ static const struct mtk_vcp_of_data mt8196_of_data = {
 	},
 };
 
+static const struct dev_pm_ops mtk_vcp_rproc_pm_ops = {
+	.suspend_noirq = mtk_vcp_suspend,
+	.resume_noirq = mtk_vcp_resume,
+};
+
 static const struct of_device_id mtk_vcp_of_match[] = {
 	{ .compatible = "mediatek,mt8196-vcp", .data = &mt8196_of_data},
 	{}
@@ -468,6 +533,7 @@ static struct platform_driver mtk_vcp_device = {
 	.driver = {
 		.name = "mtk-vcp",
 		.of_match_table = mtk_vcp_of_match,
+		.pm = pm_ptr(&mtk_vcp_rproc_pm_ops),
 	},
 };
 
diff --git a/drivers/remoteproc/mtk_vcp_rproc.h b/drivers/remoteproc/mtk_vcp_rproc.h
index e36612256b63..3713977e4171 100644
--- a/drivers/remoteproc/mtk_vcp_rproc.h
+++ b/drivers/remoteproc/mtk_vcp_rproc.h
@@ -22,7 +22,9 @@
  * @sram_offset: core sram memory layout
  * @msg_vcp_ready0: core0 ready ipi msg data
  * @msg_vcp_ready1: core1 ready ipi msg data
+ * @slp_ipi_ack_data: sleep ipi msg data
  * @pwclkcnt: power and clock config count data
+ * @is_suspending: suspend status flag
  * @vcp_ready: vcp core status flag
  * @share_mem_iova: shared memory iova base
  * @share_mem_size: shared memory size
@@ -45,7 +47,9 @@ struct mtk_vcp_of_cluster {
 	u32 sram_offset[VCP_CORE_TOTAL];
 	u32 msg_vcp_ready0;
 	u32 msg_vcp_ready1;
+	u32 slp_ipi_ack_data;
 	int pwclkcnt;
+	bool is_suspending;
 	bool vcp_ready[VCP_CORE_TOTAL];
 	dma_addr_t share_mem_iova;
 	size_t share_mem_size;
diff --git a/include/linux/remoteproc/mtk_vcp_public.h b/include/linux/remoteproc/mtk_vcp_public.h
index 5bd562d1ae62..5a859a3bc1eb 100644
--- a/include/linux/remoteproc/mtk_vcp_public.h
+++ b/include/linux/remoteproc/mtk_vcp_public.h
@@ -107,6 +107,7 @@ struct mtk_vcp_ipi_ops {
 
 struct mtk_vcp_ops {
 	bool (*vcp_is_ready)(enum feature_id id);
+	bool (*vcp_is_suspending)(struct mtk_vcp_device *vcp);
 	void (*vcp_register_notify)(enum feature_id id, struct notifier_block *nb);
 	void (*vcp_unregister_notify)(enum feature_id id, struct notifier_block *nb);
 	int (*vcp_register_feature)(struct mtk_vcp_device *vcp, enum feature_id id);
-- 
2.46.0

