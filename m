Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF1513959D;
	Fri, 20 Mar 2026 03:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773976868; cv=none; b=QgG6peadzuMNeOaLuiI8zibEOf+EI+iUFr2NzlCPZ1vXztOfEOulSv42p4AWYI9f/L0Zl2QxmllDHLmryIb4i2By6kRyBcK+rkOfR2b1Ip6Ofc8pj4CANf28KFO0wFNKuUFvQbMXUIJ4+JmjkTmwR/DOfR6WzoiFJwH9dLrn54o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773976868; c=relaxed/simple;
	bh=QWOcooYasNMwDAjywY9jRXm2iK0qZzp8rfIkeW06C+w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cw4ricr+qEzQazCkfLbJdqyNNtleNCr6phM5RYQM0+neV0njZEnGkimr6FqEHOPERDsY6XcC/FWJ+lpxuVHPd62IgIjkSFTWccpVfrpwDrJwygV1OnSJsXt3J3iEMDk2A1MXpe+52Igx1kDDZP2fPr4Q2+7uoRVYs8YaOJrJfWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=gXcUR/1+; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gXcUR/1+"
X-UUID: cfa565f8240b11f1a39cd589f645bc18-20260320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vmgQjpi/wNR8vyPtSzI1GJMpPUcUdQy/qqk6xGPKFFE=;
	b=gXcUR/1+5lS76oySxPkgX7hmrOBwLQp5sQ80hvlY7euT1q6AeqiGmCROw9tKhVdtZTaN6J9T8XmRpMa9HLLbGq9wHHfoXhx/smqmmYrHMIQYDxDiCXeuAjebiFlQRNoXupftu86AFoM8u59Xzek4T6oz7B0vLiKkxCeAa8faArk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:cb142db5-e248-4fa5-b2b1-6e47f2d47695,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:1c8fe916-aa6b-4b2e-be76-373ef1a42b04,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cfa565f8240b11f1a39cd589f645bc18-20260320
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <xiangzhi.tang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 163218207; Fri, 20 Mar 2026 11:20:57 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 20 Mar 2026 11:20:55 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 20 Mar 2026 11:20:54 +0800
From: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Xiangzhi Tang
	<Xiangzhi.Tang@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hailong Fan
	<Hailong.Fan@mediatek.com>, Huayu Zong <huayu.Zong@mediatek.com>, Xiangzhi
 Tang <xiangzhi.tang@mediatek.com>
Subject: [PATCH v3 4/6] remoteproc: mediatek: Add VCP ipi-mbox init driver
Date: Fri, 20 Mar 2026 11:18:06 +0800
Message-ID: <20260320032014.13608-5-xiangzhi.tang@mediatek.com>
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

Add VCP ipi-mbox init driver.

Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
---
 drivers/remoteproc/Kconfig                |  2 +
 drivers/remoteproc/mtk_vcp_rproc.c        | 98 +++++++++++++++++++++++
 drivers/remoteproc/mtk_vcp_rproc.h        |  6 ++
 include/linux/remoteproc/mtk_vcp_public.h | 55 +++++++++++++
 4 files changed, 161 insertions(+)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 93827f6fd3c5..54b416db0c0b 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -70,6 +70,8 @@ config MTK_VCP_RPROC
 	tristate "MediaTek VCP support"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	depends on ARCH_DMA_ADDR_T_64BIT
+	select MTK_VCP_IPC
+	select MTK_VCP_MBOX
 	help
 	  Say y here to support MediaTek's Video Companion Processor (VCP) via
 	  the remote processor framework.
diff --git a/drivers/remoteproc/mtk_vcp_rproc.c b/drivers/remoteproc/mtk_vcp_rproc.c
index bcb5f3786cf7..6e0fecef72ce 100644
--- a/drivers/remoteproc/mtk_vcp_rproc.c
+++ b/drivers/remoteproc/mtk_vcp_rproc.c
@@ -5,6 +5,7 @@
 
 #include <linux/device.h>
 #include <linux/module.h>
+#include <linux/iopoll.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
@@ -54,6 +55,18 @@ void vcp_put(struct mtk_vcp_device *vcp)
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
@@ -93,6 +106,34 @@ static const struct rproc_ops mtk_vcp_ops = {
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
+	if (IS_ERR(pdev))
+		return dev_err_probe(vcp->dev, PTR_ERR(pdev), "ipc_data register failed\n");
+
+	ret = read_poll_timeout_atomic(dev_get_drvdata,
+				       vcp_ipc, vcp_ipc,
+				       USEC_PER_MSEC,
+				       VCP_IPI_DEV_READY_TIMEOUT * USEC_PER_MSEC,
+				       false, &pdev->dev);
+	if (ret)
+		return dev_err_probe(vcp->dev, -EPROBE_DEFER, "get vcp_ipc drvdata failed\n");
+
+	ret = mtk_vcp_ipc_device_register(vcp->ipi_dev, VCP_IPI_COUNT, vcp_ipc);
+	if (ret)
+		dev_err_probe(vcp->dev, ret, "ipi_dev register failed, ret %d\n", ret);
+
+	return ret;
+}
+
 static int vcp_multi_core_init(struct platform_device *pdev,
 			       struct mtk_vcp_of_cluster *vcp_cluster,
 			       enum vcp_core_id core_id)
@@ -138,7 +179,9 @@ static struct mtk_vcp_device *vcp_rproc_init(struct platform_device *pdev,
 	vcp->dev = dev;
 	vcp->ops = &vcp_of_data->ops;
 	vcp->platdata = &vcp_of_data->platdata;
+	vcp->ipi_ops = vcp_of_data->platdata.ipi_ops;
 	vcp->vcp_cluster = vcp_cluster;
+	vcp->ipi_dev = &vcp_cluster->vcp_ipidev;
 
 	rproc->auto_boot = vcp_of_data->platdata.auto_boot;
 	rproc->sysfs_read_only = vcp_of_data->platdata.sysfs_read_only;
@@ -166,6 +209,10 @@ static struct mtk_vcp_device *vcp_rproc_init(struct platform_device *pdev,
 	if (ret)
 		return ERR_PTR(dev_err_probe(dev, ret, "vcp_wdt_irq_init failed\n"));
 
+	ret = vcp_ipi_mbox_init(vcp);
+	if (ret)
+		return ERR_PTR(dev_err_probe(dev, ret, "vcp_ipi_mbox_init failed\n"));
+
 	pm_runtime_get_sync(dev);
 
 	return vcp;
@@ -284,6 +331,55 @@ static struct mtk_vcp_reserved_mem_table mt8196_memory_tb[NUMS_MEM_ID] = {
 	{ .memory_id = MMQOS_MEM_ID,        .size = 0x1000 },
 };
 
+static struct mtk_mbox_table mt8196_ipc_tb = {
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
 		.vcp_get_mem_phys = vcp_get_reserve_mem_phys,
@@ -296,6 +392,8 @@ static const struct mtk_vcp_of_data mt8196_of_data = {
 		.auto_boot = true,
 		.sysfs_read_only = true,
 		.rtos_static_iova = 0x180600000,
+		.ipc_data = &mt8196_ipc_tb,
+		.ipi_ops = &mt8196_vcp_ipi_ops,
 		.feature_tb = mt8196_feature_tb,
 		.memory_tb = mt8196_memory_tb,
 		.fw_name = "mediatek/mt8196/vcp.img",
diff --git a/drivers/remoteproc/mtk_vcp_rproc.h b/drivers/remoteproc/mtk_vcp_rproc.h
index 11ce0f6d562b..ff3e67fc2611 100644
--- a/drivers/remoteproc/mtk_vcp_rproc.h
+++ b/drivers/remoteproc/mtk_vcp_rproc.h
@@ -21,6 +21,7 @@
  * @sram_offset: core sram memory layout
  * @share_mem_iova: shared memory iova base
  * @share_mem_size: shared memory size
+ * @vcp_ipidev: struct mtk_ipi_device
  * @vcp_memory_tb: vcp memory allocated table
  */
 struct mtk_vcp_of_cluster {
@@ -34,6 +35,7 @@ struct mtk_vcp_of_cluster {
 	u32 sram_offset[VCP_CORE_TOTAL];
 	dma_addr_t share_mem_iova;
 	size_t share_mem_size;
+	struct mtk_ipi_device vcp_ipidev;
 	struct vcp_reserve_mblock vcp_memory_tb[NUMS_MEM_ID];
 };
 
@@ -43,6 +45,8 @@ struct mtk_vcp_of_cluster {
  * @auto_boot: rproc auto_boot flag
  * @sysfs_read_only: rproc sysfs_read_only flag
  * @rtos_static_iova: vcp dram binary static map iova
+ * @mtk_mbox_table: mtk_mbox_table structure
+ * @mtk_vcp_ipi_ops: vcp ipi api ops structure
  * @feature_tb: vcp feature table structure
  * @memory_tb: vcp memory table structure
  * @fw_name: vcp image name and path
@@ -51,6 +55,8 @@ struct mtk_vcp_platdata {
 	bool auto_boot;
 	bool sysfs_read_only;
 	dma_addr_t rtos_static_iova;
+	struct mtk_mbox_table *ipc_data;
+	struct mtk_vcp_ipi_ops *ipi_ops;
 	struct mtk_vcp_feature_table *feature_tb;
 	struct mtk_vcp_reserved_mem_table *memory_tb;
 	char *fw_name;
diff --git a/include/linux/remoteproc/mtk_vcp_public.h b/include/linux/remoteproc/mtk_vcp_public.h
index 3bbc2055f9f8..58ba4b8bb023 100644
--- a/include/linux/remoteproc/mtk_vcp_public.h
+++ b/include/linux/remoteproc/mtk_vcp_public.h
@@ -7,8 +7,18 @@
 #define __MTK_VCP_PUBLIC_H__
 
 #include <linux/platform_device.h>
+#include <linux/firmware/mediatek/mtk-vcp-ipc.h>
 #include <linux/remoteproc.h>
 
+#define VCP_SYNC_TIMEOUT_MS             (50)
+
+enum vcp_notify_event {
+	VCP_EVENT_READY = 0,
+	VCP_EVENT_STOP,
+	VCP_EVENT_SUSPEND,
+	VCP_EVENT_RESUME,
+};
+
 enum vcp_reserve_mem_id {
 	VCP_RTOS_MEM_ID,
 	VDEC_MEM_ID,
@@ -36,15 +46,59 @@ enum vcp_feature_id {
 	NUM_FEATURE_ID,
 };
 
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
 	phys_addr_t (*vcp_get_mem_phys)(struct mtk_vcp_device *vcp,
 					enum vcp_reserve_mem_id id);
@@ -59,6 +113,7 @@ struct mtk_vcp_ops {
 
 struct mtk_vcp_device *vcp_get(struct platform_device *pdev);
 void vcp_put(struct mtk_vcp_device *vcp);
+struct mtk_ipi_device *vcp_get_ipidev(struct mtk_vcp_device *vcp);
 
 /*
  * These inline functions are intended for user drivers that are loaded
-- 
2.46.0

