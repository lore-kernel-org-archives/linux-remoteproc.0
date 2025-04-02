Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A672233727;
	Wed,  2 Apr 2025 09:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743585763; cv=none; b=savbIthAcSeQDywbve8OhoR8oOQHkq11Tgehpxj7sbRDPua2h9Ktm0ZaU4R2k17iQp1r8TBYMhQgHlof6EnJ2zu03t44oHKWKWh+zWgrNbBC45iAUXmYAcCe5xPpMfmVcJvJZTZpRcON0vrsGoDkRuv+s5V0S3bALjcGP9aoeRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743585763; c=relaxed/simple;
	bh=Wq57YEPg+eZst+NU/NXH0WzWJghqJdHIadYva0b98LY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L3VZ5aM869+jwN14EhyWasixCYxi+J3qa8k+A+EhglaYsThxH7+hE6uaaECy7sCVNpyoupeTU+jw6S61eBMZ+HjMlEuJo86Mh9rqAUZxZmcPhjUdHYZ7X/CEkBVAdXYTRv0/vLeitWuVu0EuSVPGoPBoiex0lR4QYu9Dx68XW9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=FhkOdQR7; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FhkOdQR7"
X-UUID: 0081e4f80fa411f08eb9c36241bbb6fb-20250402
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=l1Fv4qzJtHM8NWH3l1+cj8OKqYAzqPQ/cbFnappI/Co=;
	b=FhkOdQR7a22p8L5CN9t7192le+wWXy8eRr0Z+giZite53nO/dW7X4X/F3pWLeSiQ0uwIg5eWbk/Se4vnAj3fLY1ci3w5RwdGCJ3XH/0BQpL0+O0ubLdCu1OCwd1UGQpkJHgm+tTm7vRz1U8ONYBTHBSRc27bhKa1WpqszohdC44=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:b03a2924-9d25-490d-b1c3-392ff9d722e3,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:76bc1bc7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:1,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,OSH
X-CID-BAS: 2,OSH,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0081e4f80fa411f08eb9c36241bbb6fb-20250402
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <xiangzhi.tang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 50816167; Wed, 02 Apr 2025 17:22:30 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 2 Apr 2025 17:22:28 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 2 Apr 2025 17:22:28 +0800
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
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jjian.zhou@mediatek.com>, <hailong.fan@mediatek.com>, Xiangzhi Tang
	<xiangzhi.tang@mediatek.com>
Subject: [PATCH 2/2] remoterpoc: mediatek: vcp: Add vcp remoteproc driver
Date: Wed, 2 Apr 2025 17:19:25 +0800
Message-ID: <20250402092134.12293-3-xiangzhi.tang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250402092134.12293-1-xiangzhi.tang@mediatek.com>
References: <20250402092134.12293-1-xiangzhi.tang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add host driver to control the mediatek Risc-V coprocessor

1.Support rproc mechanism to load vcm firmware from filesystem
2.Support SMC services to request ATF to setting vcp boot sequence
3.Host communicated with VCP depends on VCP IPC interfaces

Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
---
 drivers/remoteproc/Kconfig                |  12 +
 drivers/remoteproc/Makefile               |   4 +
 drivers/remoteproc/mtk_vcp_common.c       | 982 ++++++++++++++++++++++
 drivers/remoteproc/mtk_vcp_common.h       | 251 ++++++
 drivers/remoteproc/mtk_vcp_rproc.c        | 724 ++++++++++++++++
 drivers/remoteproc/mtk_vcp_rproc.h        | 107 +++
 include/linux/remoteproc/mtk_vcp_public.h | 138 +++
 include/linux/soc/mediatek/mtk_sip_svc.h  |   3 +
 8 files changed, 2221 insertions(+)
 create mode 100644 drivers/remoteproc/mtk_vcp_common.c
 create mode 100644 drivers/remoteproc/mtk_vcp_common.h
 create mode 100644 drivers/remoteproc/mtk_vcp_rproc.c
 create mode 100644 drivers/remoteproc/mtk_vcp_rproc.h
 create mode 100644 include/linux/remoteproc/mtk_vcp_public.h

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 83962a114dc9..28e71c6c6dd3 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -64,6 +64,18 @@ config MTK_SCP
 
 	  It's safe to say N here.
 
+config MTK_VCP_RPROC
+	tristate "MediaTek VCP support"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on ARCH_DMA_ADDR_T_64BIT
+	select MTK_VCP_IPC
+	select MTK_VCP_MBOX
+	help
+	  Say y here to support MediaTek's Video Companion Processor (VCP) via
+	  the remote processor framework.
+
+	  It's safe to say N here.
+
 config OMAP_REMOTEPROC
 	tristate "OMAP remoteproc support"
 	depends on ARCH_OMAP4 || SOC_OMAP5 || SOC_DRA7XX
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 5ff4e2fee4ab..327043b31b37 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -15,6 +15,10 @@ obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
 obj-$(CONFIG_IMX_DSP_REMOTEPROC)	+= imx_dsp_rproc.o
 obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
 obj-$(CONFIG_MTK_SCP)			+= mtk_scp.o mtk_scp_ipi.o
+obj-$(CONFIG_MTK_VCP_RPROC)		+= mtk_vcp.o
+mtk_vcp-$(CONFIG_MTK_VCP_RPROC)		+= mtk_vcp_rproc.o
+mtk_vcp-$(CONFIG_MTK_VCP_RPROC)		+= mtk_vcp_irq.o
+mtk_vcp-$(CONFIG_MTK_VCP_RPROC)		+= mtk_vcp_loader.o
 obj-$(CONFIG_OMAP_REMOTEPROC)		+= omap_remoteproc.o
 obj-$(CONFIG_WKUP_M3_RPROC)		+= wkup_m3_rproc.o
 obj-$(CONFIG_DA8XX_REMOTEPROC)		+= da8xx_remoteproc.o
diff --git a/drivers/remoteproc/mtk_vcp_common.c b/drivers/remoteproc/mtk_vcp_common.c
new file mode 100644
index 000000000000..e02c6e61b990
--- /dev/null
+++ b/drivers/remoteproc/mtk_vcp_common.c
@@ -0,0 +1,982 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 MediaTek Corporation. All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-heap.h>
+#include <linux/dma-mapping.h>
+#include <linux/fs.h>
+#include <linux/interrupt.h>
+#include <linux/iommu.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/poll.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/timer.h>
+#include <uapi/linux/dma-heap.h>
+
+#include "mtk_vcp_common.h"
+#include "mtk_vcp_rproc.h"
+
+static bool vcp_ready[VCP_CORE_TOTAL];
+/* vcp ready status for notify */
+static DEFINE_MUTEX(vcp_ready_mutex);
+static DEFINE_MUTEX(vcp_pw_clk_mutex);
+static DEFINE_MUTEX(vcp_A_notify_mutex);
+static DEFINE_MUTEX(vcp_feature_mutex);
+
+static struct workqueue_struct *vcp_workqueue;
+static BLOCKING_NOTIFIER_HEAD(mmup_notifier_list);
+static BLOCKING_NOTIFIER_HEAD(vcp_notifier_list);
+
+struct vcp_feature_tb feature_table[NUM_FEATURE_ID] = {
+	{
+		.feature    = RTOS_FEATURE_ID,
+		.core_id    = VCP_CORE_TOTAL,
+	},
+	{
+		.feature    = VDEC_FEATURE_ID,
+		.core_id    = VCP_ID,
+	},
+	{
+		.feature    = VENC_FEATURE_ID,
+		.core_id    = VCP_ID,
+	},
+	{
+		.feature    = MMDVFS_MMUP_FEATURE_ID,
+		.core_id    = MMUP_ID,
+	},
+	{
+		.feature    = MMDVFS_VCP_FEATURE_ID,
+		.core_id    = VCP_ID,
+	},
+	{
+		.feature    = MMDEBUG_FEATURE_ID,
+		.core_id    = MMUP_ID,
+	},
+	{
+		.feature    = VMM_FEATURE_ID,
+		.core_id    = MMUP_ID,
+	},
+	{
+		.feature    = VDISP_FEATURE_ID,
+		.core_id    = MMUP_ID,
+	},
+	{
+		.feature    = MMQOS_FEATURE_ID,
+		.core_id    = VCP_ID,
+	},
+};
+
+static struct vcp_reserve_mblock vcp_reserve_mblock[] = {
+	{
+		.num = VCP_RTOS_MEM_ID,
+		.start_phys = 0x0,
+		.start_iova = 0x0,
+		.start_virt = 0x0,
+		.size = 0x0,
+	},
+	{
+		.num = VDEC_MEM_ID,
+		.start_phys = 0x0,
+		.start_iova = 0x0,
+		.start_virt = 0x0,
+		.size = 0x0,
+	},
+	{
+		.num = VENC_MEM_ID,
+		.start_phys = 0x0,
+		.start_iova = 0x0,
+		.start_virt = 0x0,
+		.size = 0x0,
+	},
+	{
+		.num = MMDVFS_VCP_MEM_ID,
+		.start_phys = 0x0,
+		.start_iova = 0x0,
+		.start_virt = 0x0,
+		.size = 0x0,
+	},
+	{
+		.num = MMDVFS_MMUP_MEM_ID,
+		.start_phys = 0x0,
+		.start_iova = 0x0,
+		.start_virt = 0x0,
+		.size = 0x0,
+	},
+	{
+		.num = MMQOS_MEM_ID,
+		.start_phys = 0x0,
+		.start_iova = 0x0,
+		.start_virt = 0x0,
+		.size = 0x0,
+	},
+};
+
+phys_addr_t vcp_get_reserve_mem_phys(enum vcp_reserve_mem_id_t id)
+{
+	if (id >= 0 && id < NUMS_MEM_ID)
+		return vcp_reserve_mblock[id].start_phys;
+
+	return 0;
+}
+
+dma_addr_t vcp_get_reserve_mem_iova(enum vcp_reserve_mem_id_t id)
+{
+	if (id >= 0 && id < NUMS_MEM_ID)
+		return vcp_reserve_mblock[id].start_iova;
+
+	return 0;
+}
+
+void __iomem *vcp_get_reserve_mem_virt(enum vcp_reserve_mem_id_t id)
+{
+	if (id >= 0 && id < NUMS_MEM_ID)
+		return vcp_reserve_mblock[id].start_virt;
+
+	return NULL;
+}
+
+u32 vcp_get_reserve_mem_size(enum vcp_reserve_mem_id_t id)
+{
+	if (id >= 0 && id < NUMS_MEM_ID)
+		return vcp_reserve_mblock[id].size;
+
+	return 0;
+}
+void __iomem *vcp_get_internal_sram_virt(struct mtk_vcp_device *vcp)
+{
+	return vcp->vcp_cluster->sram_base;
+}
+
+int vcp_reserve_memory_ioremap(struct mtk_vcp_device *vcp)
+{
+#define MEMORY_TBL_ELEM_NUM (2)
+	u32 num = (u32)(sizeof(vcp_reserve_mblock)
+			/ sizeof(vcp_reserve_mblock[0]));
+	enum vcp_reserve_mem_id_t id;
+	u32 vcp_mem_num;
+	u32 i, m_idx, m_size;
+	u32 offset;
+	struct device_node *rmem_node;
+	struct resource res;
+	struct iommu_domain *domain;
+	void __iomem *share_memory_virt;
+	phys_addr_t mblock_start_phys;
+	dma_addr_t share_memory_iova;
+	size_t share_memory_size;
+	int ret;
+
+	if (num != NUMS_MEM_ID) {
+		dev_err(vcp->dev, "actual memory num(%u) is not match mem ID table (%u)\n",
+			num, NUMS_MEM_ID);
+		WARN_ON(1);
+		return -EINVAL;
+	}
+
+	rmem_node = of_parse_phandle(vcp->dev->of_node, "memory-region", 0);
+	if (!rmem_node) {
+		dev_err(vcp->dev, "No reserved memory region found.\n");
+		return -EINVAL;
+	}
+
+	ret = of_address_to_resource(rmem_node, 0, &res);
+	if (ret) {
+		dev_err(vcp->dev, "failed to parse reserved memory: %d\n", ret);
+		return ret;
+	}
+
+	mblock_start_phys = (phys_addr_t)res.start;
+
+	/* Set reserved memory table */
+	vcp_mem_num = of_property_count_u32_elems(vcp->dev->of_node, "vcp-mem-tbl")
+		      / MEMORY_TBL_ELEM_NUM;
+	if (vcp_mem_num <= 0) {
+		dev_warn(vcp->dev, "vcp-mem-tbl not found\n");
+		vcp_mem_num = 0;
+	}
+
+	for (i = 0; i < vcp_mem_num; i++) {
+		ret = of_property_read_u32_index(vcp->dev->of_node, "vcp-mem-tbl",
+						 i * MEMORY_TBL_ELEM_NUM, &m_idx);
+		if (ret) {
+			dev_err(vcp->dev, "cannot get memory index(%d)\n", i);
+			return -EINVAL;
+		}
+
+		ret = of_property_read_u32_index(vcp->dev->of_node, "vcp-mem-tbl",
+						 (i * MEMORY_TBL_ELEM_NUM) + 1, &m_size);
+		if (ret) {
+			dev_err(vcp->dev, "Cannot get memory size(%d)(%d)\n", i, m_idx);
+			return -EINVAL;
+		}
+
+		if (m_idx >= NUMS_MEM_ID) {
+			dev_warn(vcp->dev, "skip unexpected index, %d\n", m_idx);
+			continue;
+		}
+
+		vcp_reserve_mblock[m_idx].size = m_size;
+	}
+
+	vcp_reserve_mblock[VCP_RTOS_MEM_ID].start_phys = mblock_start_phys;
+	vcp_reserve_mblock[VCP_RTOS_MEM_ID].start_virt = devm_ioremap(vcp->dev,
+				vcp_reserve_mblock[VCP_RTOS_MEM_ID].start_phys,
+				vcp_reserve_mblock[VCP_RTOS_MEM_ID].size);
+	domain = iommu_get_domain_for_dev(vcp->dev);
+	ret = iommu_map(domain, vcp->platdata->rtos_static_iova,
+			vcp_reserve_mblock[VCP_RTOS_MEM_ID].start_phys,
+			vcp_reserve_mblock[VCP_RTOS_MEM_ID].size,
+			IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);
+	if (ret) {
+		dev_err(vcp->dev, "%s iommu map fail, ret:%d.\n", __func__, ret);
+		return ret;
+	}
+	vcp_reserve_mblock[VCP_RTOS_MEM_ID].start_iova = vcp->platdata->rtos_static_iova;
+
+	share_memory_size = 0;
+	for (id = VDEC_MEM_ID; id < NUMS_MEM_ID; id++) {
+		if (vcp_reserve_mblock[id].size == 0)
+			continue;
+		share_memory_size += vcp_reserve_mblock[id].size;
+	}
+
+	ret = dma_set_mask_and_coherent(vcp->dev, DMA_BIT_MASK(DMA_MAX_MASK_BIT));
+	if (ret) {
+		dev_err(vcp->dev, "64-bit DMA enable failed\n");
+		return ret;
+	}
+
+	if (!vcp->dev->dma_parms) {
+		vcp->dev->dma_parms = devm_kzalloc(vcp->dev,
+						   sizeof(*vcp->dev->dma_parms),
+						   GFP_KERNEL);
+		if (vcp->dev->dma_parms) {
+			ret = dma_set_max_seg_size(vcp->dev, (u32)DMA_BIT_MASK(33));
+			if (ret) {
+				dev_err(vcp->dev, "Failed to set DMA segment size\n");
+				return ret;
+			}
+		} else {
+			dev_err(vcp->dev, "Failed to set DMA parms\n");
+			return -EINVAL;
+		}
+	}
+	share_memory_virt = dma_alloc_coherent(vcp->dev,
+					       share_memory_size,
+					       &share_memory_iova,
+					       GFP_KERNEL);
+	if (!share_memory_virt)
+		return -ENOMEM;
+	offset = 0;
+	for (id = VDEC_MEM_ID; id < NUMS_MEM_ID; id++)  {
+		if (vcp_reserve_mblock[id].size == 0)
+			continue;
+
+		vcp_reserve_mblock[id].start_phys = vcp_reserve_mblock[VCP_RTOS_MEM_ID].start_phys +
+						    vcp_reserve_mblock[VCP_RTOS_MEM_ID].size +
+						    offset;
+		vcp_reserve_mblock[id].start_iova = share_memory_iova + offset;
+		vcp_reserve_mblock[id].start_virt = share_memory_virt + offset;
+		offset += (u32)vcp_reserve_mblock[id].size;
+	}
+
+	vcp->vcp_cluster->share_mem_iova = share_memory_iova;
+	vcp->vcp_cluster->share_mem_size = share_memory_size;
+
+	return 0;
+}
+
+bool is_vcp_suspending(struct mtk_vcp_device *vcp)
+{
+	return vcp->vcp_cluster->is_suspending ? true : false;
+}
+
+bool is_vcp_ready_by_coreid(enum vcp_core_id core_id)
+{
+	switch (core_id) {
+	case VCP_ID:
+		return vcp_ready[VCP_ID];
+	case MMUP_ID:
+		return vcp_ready[MMUP_ID];
+	case VCP_CORE_TOTAL:
+	default:
+		return vcp_ready[VCP_ID] == true &&
+		       vcp_ready[MMUP_ID] == true;
+	}
+}
+
+static enum vcp_core_id get_core_by_feature(enum feature_id id)
+{
+	for (u32 i = 0; i < NUM_FEATURE_ID; i++) {
+		if (feature_table[i].feature == id)
+			return feature_table[i].core_id;
+	}
+
+	return VCP_ID;
+}
+
+bool is_vcp_ready(enum feature_id id)
+{
+	enum vcp_core_id core_id = get_core_by_feature(id);
+
+	return is_vcp_ready_by_coreid(core_id);
+}
+
+u32 wait_core_hart_shutdown(struct mtk_vcp_device *vcp,
+			    enum vcp_core_id core_id)
+{
+	u32 retry;
+	bool twohart_support;
+	u32 core_hart0;
+	u32 core_hart1;
+
+	twohart_support = vcp->vcp_cluster->twohart[core_id];
+
+	for (retry = VCP_AWAKE_TIMEOUT; retry > 0; retry--) {
+		switch (core_id) {
+		case VCP_ID:
+			core_hart0 = readl(vcp->vcp_cluster->cfg + VCP_C0_GPR5_H0_REBOOT);
+			if (twohart_support)
+				core_hart1 = readl(vcp->vcp_cluster->cfg + VCP_C0_GPR6_H1_REBOOT);
+			break;
+		case MMUP_ID:
+			core_hart0 = readl(vcp->vcp_cluster->cfg + VCP_C1_GPR5_H0_REBOOT);
+			if (twohart_support)
+				core_hart1 = readl(vcp->vcp_cluster->cfg + VCP_C1_GPR6_H1_REBOOT);
+			break;
+		case VCP_CORE_TOTAL:
+		default:
+			break;
+		}
+
+		if (twohart_support) {
+			if ((core_hart0 == CORE_RDY_TO_REBOOT)
+			     && (core_hart1 == CORE_RDY_TO_REBOOT))
+				break;
+		} else {
+			if (core_hart0 == CORE_RDY_TO_REBOOT)
+				break;
+		}
+		usleep_range(USDELAY_RANGE_MIN, USDELAY_RANGE_MAX);
+	}
+
+	return retry;
+}
+
+void vcp_A_register_notify(enum feature_id id,
+			   struct notifier_block *nb)
+{
+	enum vcp_core_id core_id = get_core_by_feature(id);
+
+	mutex_lock(&vcp_A_notify_mutex);
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
+	mutex_unlock(&vcp_A_notify_mutex);
+}
+
+void vcp_A_unregister_notify(enum feature_id id,
+			     struct notifier_block *nb)
+{
+	enum vcp_core_id core_id = get_core_by_feature(id);
+
+	mutex_lock(&vcp_A_notify_mutex);
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
+	mutex_unlock(&vcp_A_notify_mutex);
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
+/*
+ * callback function for work struct
+ * notify apps to start their tasks
+ * @param ws:   work struct
+ */
+static void vcp_A_notify_ws(struct work_struct *ws)
+{
+	struct vcp_work_struct *sws =
+		container_of(ws, struct vcp_work_struct, work);
+	enum vcp_core_id core_id = sws->flags;
+
+	if (core_id < VCP_CORE_TOTAL) {
+		mutex_lock(&vcp_ready_mutex);
+		vcp_ready[core_id] = 1;
+		mutex_unlock(&vcp_ready_mutex);
+
+		mutex_lock(&vcp_A_notify_mutex);
+
+		vcp_extern_notify(core_id, VCP_EVENT_READY);
+		mutex_unlock(&vcp_A_notify_mutex);
+
+		/*clear reset status and unlock wake lock*/
+		dev_info(sws->dev, "%s core id %u ready\n", __func__, core_id);
+	} else
+		dev_warn(sws->dev, "%s wrong core id %u\n", __func__, core_id);
+}
+
+static void vcp_schedule_work(struct vcp_work_struct *vcp_ws)
+{
+	if (!vcp_workqueue)
+		dev_err(vcp_ws->dev, "vcp_workqueue is NULL\n");
+	else
+		queue_work(vcp_workqueue, &vcp_ws->work);
+}
+
+static void vcp_A_set_ready(struct mtk_vcp_device *vcp,
+			    enum vcp_core_id core_id)
+{
+	if (core_id < VCP_CORE_TOTAL) {
+		vcp->vcp_cluster->vcp_ready_notify_wk[core_id].flags = core_id;
+		vcp_schedule_work(&vcp->vcp_cluster->vcp_ready_notify_wk[core_id]);
+	}
+}
+
+void vcp_reset_ready_flag(void)
+{
+	for (u32 i = 0; i < VCP_CORE_TOTAL; i++)
+		vcp_ready[i] = 0;
+}
+/*
+ * handle notification from vcp
+ * mark vcp is ready for running tasks
+ * It is important to call vcp_ram_dump_init() in this IPI handler. This
+ * timing is necessary to ensure that the region_info has been initialized.
+ * @param id:   ipi id
+ * @param prdata: ipi handler parameter
+ * @param data: ipi data
+ * @param len:  length of ipi data
+ */
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
+static int vcp_enable_pm_clk(struct mtk_vcp_device *vcp, enum feature_id id)
+{
+	int ret;
+	bool suspend_status;
+	struct slp_ctrl_data ipi_data;
+
+	mutex_lock(&vcp_pw_clk_mutex);
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
+	if (vcp->vcp_cluster->pwclkcnt == 0) {
+		if (!is_vcp_ready_by_coreid(VCP_CORE_TOTAL)) {
+			if (reset_vcp(vcp)) {
+				mutex_unlock(&vcp_pw_clk_mutex);
+				return -EINVAL;
+			}
+		}
+	}
+	vcp->vcp_cluster->pwclkcnt++;
+	if (id != RTOS_FEATURE_ID) {
+		ipi_data.cmd = SLP_WAKE_LOCK;
+		ipi_data.feature = id;
+		ret = mtk_vcp_ipc_send_compl(vcp->ipi_dev, IPI_OUT_C_SLEEP_0,
+					     &ipi_data, PIN_OUT_C_SIZE_SLEEP_0, 500);
+		if (ret < 0) {
+			dev_warn(vcp->dev, "%s mtk_vcp_ipc_send_compl failed. ret %d\n",
+				 __func__, ret);
+			return ret;
+		}
+	}
+	mutex_unlock(&vcp_pw_clk_mutex);
+
+	return 0;
+}
+
+static int vcp_disable_pm_clk(struct mtk_vcp_device *vcp, enum feature_id id)
+{
+	int ret;
+	bool suspend_status;
+	struct slp_ctrl_data ipi_data;
+
+	mutex_lock(&vcp_pw_clk_mutex);
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
+		ret = mtk_vcp_ipc_send_compl(vcp->ipi_dev, IPI_OUT_C_SLEEP_0,
+					 &ipi_data, PIN_OUT_C_SIZE_SLEEP_0, 500);
+		if (ret < 0) {
+			dev_err(vcp->dev, "%s mtk_vcp_ipc_send_compl failed. ret %d\n",
+				__func__, ret);
+			return ret;
+		}
+	}
+	vcp->vcp_cluster->pwclkcnt--;
+
+	if (vcp->vcp_cluster->pwclkcnt <= 0) {
+		for (u32 i = 0; i < NUM_FEATURE_ID; i++)
+			dev_warn(vcp->dev, "%s Check feature id %d enable cnt %d\n",
+				 __func__, feature_table[i].feature, feature_table[i].enable);
+		vcp->vcp_cluster->pwclkcnt = 0;
+	}
+	mutex_unlock(&vcp_pw_clk_mutex);
+
+	return 0;
+}
+
+int vcp_A_register_feature(struct mtk_vcp_device *vcp, enum feature_id id)
+{
+	int ret;
+
+	if (id >= NUM_FEATURE_ID) {
+		dev_warn(vcp->dev, "%s unsupported feature id %d\n",
+			 __func__, id);
+		return -EINVAL;
+	}
+	mutex_lock(&vcp_feature_mutex);
+	for (u32 i = 0; i < NUM_FEATURE_ID; i++) {
+		if (feature_table[i].feature == id)
+			feature_table[i].enable++;
+	}
+	ret = vcp_enable_pm_clk(vcp, id);
+	mutex_unlock(&vcp_feature_mutex);
+
+	return ret;
+}
+
+int vcp_A_deregister_feature(struct mtk_vcp_device *vcp, enum feature_id id)
+{
+	int ret;
+
+	if (id >= NUM_FEATURE_ID) {
+		dev_warn(vcp->dev, "%s unsupported feature id %d\n",
+			 __func__, id);
+		return -EINVAL;
+	}
+	mutex_lock(&vcp_feature_mutex);
+	for (u32 i = 0; i < NUM_FEATURE_ID; i++) {
+		if (feature_table[i].feature == id) {
+			if (feature_table[i].enable == 0) {
+				dev_warn(vcp->dev, "%s unbalanced feature id %d enable cnt %d\n",
+					 __func__, id, feature_table[i].enable);
+				mutex_unlock(&vcp_feature_mutex);
+				return -EINVAL;
+			}
+			feature_table[i].enable--;
+		}
+	}
+	ret = vcp_disable_pm_clk(vcp, id);
+	mutex_unlock(&vcp_feature_mutex);
+
+	return ret;
+}
+
+int vcp_notify_work_init(struct mtk_vcp_device *vcp)
+{
+	vcp_workqueue = create_singlethread_workqueue("VCP_WQ");
+	if (!vcp_workqueue) {
+		dev_err(vcp->dev, "vcp_workqueue create fail\n");
+		return -EINVAL;
+	}
+	vcp->vcp_cluster->vcp_workqueue = vcp_workqueue;
+	for (u32 core_id = 0; core_id < VCP_CORE_TOTAL; core_id++) {
+		vcp->vcp_cluster->vcp_ready_notify_wk[core_id].dev = vcp->dev;
+		INIT_WORK(&vcp->vcp_cluster->vcp_ready_notify_wk[core_id].work, vcp_A_notify_ws);
+	}
+
+	return 0;
+}
+
+int reset_vcp(struct mtk_vcp_device *vcp)
+{
+	struct arm_smccc_res res;
+	bool mmup_status;
+	bool vcp_status;
+
+	if (vcp->vcp_cluster->core_nums >= MMUP_ID) {
+		/* write vcp reserved memory address/size to GRP1/GRP2
+		 * to let vcp setup MPU
+		 */
+		writel((u32)VCP_PACK_IOVA(vcp->vcp_cluster->share_mem_iova),
+			vcp->vcp_cluster->cfg + VCP_C1_GPR1_DRAM_RESV_ADDR);
+		writel((u32)vcp->vcp_cluster->share_mem_size,
+			vcp->vcp_cluster->cfg + VCP_C1_GPR2_DRAM_RESV_SIZE);
+
+		arm_smccc_smc(MTK_SIP_TINYSYS_VCP_CONTROL,
+			      MTK_TINYSYS_MMUP_KERNEL_OP_RESET_RELEASE,
+			      1, 0, 0, 0, 0, 0, &res);
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
+	}
+
+	/* write vcp reserved memory address/size to GRP1/GRP2
+	 * to let vcp setup MPU
+	 */
+	writel((u32)VCP_PACK_IOVA(vcp->vcp_cluster->share_mem_iova),
+		vcp->vcp_cluster->cfg + VCP_C0_GPR1_DRAM_RESV_ADDR);
+	writel((u32)vcp->vcp_cluster->share_mem_size,
+		vcp->vcp_cluster->cfg + VCP_C0_GPR2_DRAM_RESV_SIZE);
+
+	arm_smccc_smc(MTK_SIP_TINYSYS_VCP_CONTROL,
+		      MTK_TINYSYS_VCP_KERNEL_OP_RESET_RELEASE,
+		      1, 0, 0, 0, 0, 0, &res);
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
+	return 0;
+}
+
+static size_t loader_partition(void __iomem *image_buf,
+			       const u8 *fw_src,
+			       size_t size,
+			       const char *section_name)
+{
+	const u8 *fw_ptr = fw_src;
+	u32 offset;
+	u32 align_size;
+	const struct mkimg_hdr *img_hdr_info;
+
+	if (!fw_src || !image_buf || size < VCP_IMAGE_HEADER_SIZE)
+		return 0;
+
+	offset = 0;
+	while (offset < size) {
+		img_hdr_info = (const struct mkimg_hdr *)(fw_ptr + offset);
+		align_size = round_up(img_hdr_info->dsz, ALIGN_16);
+		offset += VCP_IMAGE_HEADER_SIZE;
+		if (img_hdr_info->magic != VCM_IMAGE_MAGIC ||
+			strncmp(img_hdr_info->name,
+				section_name, VCM_IMAGE_NAME_MAXSZ - 1) != 0)
+			offset += align_size;
+		else {
+			memcpy_toio(image_buf, fw_ptr + offset, img_hdr_info->dsz);
+			offset += align_size;
+			return img_hdr_info->dsz;
+		}
+	}
+
+	return 0;
+}
+
+static int load_vcp_bin(const u8 *fw_src,
+			size_t size,
+			void __iomem *img_buf_va,
+			phys_addr_t img_buf_pa,
+			dma_addr_t img_buf_iova,
+			struct mtk_vcp_device *vcp)
+{
+	u32 fw_size;
+	u32 dram_img_size;
+	u32 dram_backup_img_offset;
+	struct vcp_region_info_st vcp_region_info = {};
+	struct arm_smccc_res res;
+
+	/* step 2: load/verify firmware */
+	fw_size = loader_partition(vcp->vcp_cluster->sram_base +
+				   vcp->vcp_cluster->sram_offset[VCP_ID],
+				   fw_src, size, VCP_HFRP_SECTION_NAME);
+	if (!fw_size) {
+		dev_err(vcp->dev, "load %s failed\n", VCP_HFRP_SECTION_NAME);
+		return -EINVAL;
+	}
+
+	/* step 3: load/verify vcp dram section binary */
+	dram_img_size = loader_partition(img_buf_va + VCP_DRAM_IMG_OFFSET,
+					 fw_src, size, VCP_HFRP_DRAM_SECTION_NAME);
+	if (!dram_img_size) {
+		dev_err(vcp->dev, "load %s failed\n", VCP_HFRP_DRAM_SECTION_NAME);
+		return -EINVAL;
+	}
+
+	/* Let vcp check if the struct matches the one in tinysys */
+	vcp_region_info.struct_size = sizeof(struct vcp_region_info_st);
+
+	/* optional: setting vcp mcu loader code to copy firmware to sram */
+	vcp_region_info.ap_loader_start_pa = 0;
+	vcp_region_info.ap_loader_start   = 0;
+	vcp_region_info.ap_firmware_start = 0;
+
+	/* optional: set size to 0 to prevent vcp loader load fw */
+	vcp_region_info.ap_loader_size = 0;
+	vcp_region_info.ap_firmware_size = 0;
+
+	dram_backup_img_offset = VCP_DRAM_IMG_OFFSET + round_up(dram_img_size, ALIGN_1024);
+
+	vcp_region_info.ap_dram_start = VCP_PACK_IOVA(img_buf_iova + VCP_DRAM_IMG_OFFSET);
+	vcp_region_info.ap_dram_backup_start = VCP_PACK_IOVA(img_buf_iova + dram_backup_img_offset);
+	vcp_region_info.ap_dram_size  = (u32)dram_img_size;
+
+	vcp_region_info.l2tcm_offset = (u32)vcp->vcp_cluster->sram_offset[MMUP_ID];
+
+	memcpy_toio(vcp->vcp_cluster->sram_base +
+		    vcp->vcp_cluster->sram_offset[VCP_ID] + REGION_OFFSET,
+		    &vcp_region_info, sizeof(vcp_region_info));
+
+	arm_smccc_smc(MTK_SIP_TINYSYS_VCP_CONTROL,
+		      MTK_TINYSYS_MMUP_KERNEL_OP_SET_L2TCM_OFFSET,
+		      vcp->vcp_cluster->sram_offset[MMUP_ID],
+		      0, 0, 0, 0, 0, &res);
+
+	return 0;
+}
+
+static int load_mmup_bin(const u8 *fw_src,
+			 size_t size,
+			 void __iomem *img_buf_va,
+			 phys_addr_t img_buf_pa,
+			 dma_addr_t img_buf_iova,
+			 struct mtk_vcp_device *vcp)
+{
+	u32 fw_size;
+	u32 dram_img_size;
+	u32 dram_backup_img_offset;
+	struct vcp_region_info_st vcp_region_info = {};
+	struct arm_smccc_res res;
+
+	/* step 2: load/verify firmware */
+	fw_size = loader_partition(vcp->vcp_cluster->sram_base +
+				   vcp->vcp_cluster->sram_offset[MMUP_ID],
+				   fw_src, size, VCP_MMUP_SECTION_NAME);
+	if (!fw_size) {
+		dev_err(vcp->dev, "load %s failed\n", VCP_MMUP_SECTION_NAME);
+		return -EINVAL;
+	}
+
+	/* step 3: load/verify vcp dram section binary */
+	dram_img_size = loader_partition(img_buf_va + MMUP_DRAM_IMG_OFFSET, fw_src, size,
+					 VCP_MMUP_DRAM_SECTION_NAME);
+	if (!dram_img_size) {
+		dev_err(vcp->dev, "load %s failed\n", VCP_MMUP_DRAM_SECTION_NAME);
+		return -EINVAL;
+	}
+
+	/* Let vcp check if the struct matches the one in tinysys */
+	vcp_region_info.struct_size = sizeof(struct vcp_region_info_st);
+	/* optional: config vcp bootloader to copy firmware to sram */
+	vcp_region_info.ap_loader_start_pa = 0;
+	vcp_region_info.ap_loader_start   = 0;
+	vcp_region_info.ap_firmware_start = 0;
+
+	/* optional: set size to 0 to prevent vcp loader load fw */
+	vcp_region_info.ap_loader_size = 0;
+	vcp_region_info.ap_firmware_size = 0;
+
+	dram_backup_img_offset = MMUP_DRAM_IMG_OFFSET + round_up(dram_img_size, ALIGN_1024);
+	vcp_region_info.ap_dram_start = VCP_PACK_IOVA(img_buf_iova + MMUP_DRAM_IMG_OFFSET);
+	vcp_region_info.ap_dram_backup_start = VCP_PACK_IOVA(img_buf_iova + dram_backup_img_offset);
+	vcp_region_info.ap_dram_size  = (u32)dram_img_size;
+
+	memcpy_toio(vcp->vcp_cluster->sram_base +
+		    vcp->vcp_cluster->sram_offset[MMUP_ID] + REGION_OFFSET,
+		    &vcp_region_info, sizeof(vcp_region_info));
+
+	arm_smccc_smc(MTK_SIP_TINYSYS_VCP_CONTROL,
+		      MTK_TINYSYS_MMUP_KERNEL_OP_SET_FW_SIZE,
+		      fw_size, 0, 0, 0, 0, 0, &res);
+
+	return 0;
+}
+
+int mtk_vcp_load(struct rproc *rproc, const struct firmware *fw)
+{
+	struct arm_smccc_res res;
+	struct mtk_vcp_device *vcp = (struct mtk_vcp_device *)rproc->priv;
+	dma_addr_t img_buf_iova;
+	phys_addr_t img_buf_phys;
+	void __iomem *img_buf_va;
+	int ret;
+
+	if (!vcp) {
+		dev_err(vcp->dev, "vcp device is no exist!\n");
+		return -EINVAL;
+	}
+
+	if (fw->size < VCP_IMAGE_HEADER_SIZE ||
+	    fw->size > vcp->ops->vcp_get_mem_size(VCP_RTOS_MEM_ID)) {
+		dev_err(vcp->dev, "firmware is oversize/undersize\n");
+		return -EINVAL;
+	}
+
+	/* step 0: set core0/1 RSTN */
+	writel(0x1, vcp->vcp_cluster->cfg_core + VCP_R_CORE0_SW_RSTN_SET);
+	writel(0x1, vcp->vcp_cluster->cfg_core + VCP_R_CORE1_SW_RSTN_SET);
+
+	/* step 1: enable sram, enable 1 block per time */
+	/* Clean SRAM. */
+	memset_io(vcp->vcp_cluster->sram_base, 0, vcp->vcp_cluster->sram_size);
+
+	img_buf_iova = vcp->ops->vcp_get_mem_iova(VCP_RTOS_MEM_ID);
+	img_buf_phys = vcp->ops->vcp_get_mem_phys(VCP_RTOS_MEM_ID);
+	img_buf_va = vcp->ops->vcp_get_mem_virt(VCP_RTOS_MEM_ID);
+
+	arm_smccc_smc(MTK_SIP_TINYSYS_VCP_CONTROL,
+		      MTK_TINYSYS_VCP_KERNEL_OP_COLD_BOOT_VCP,
+		      0, 0, 0, 0, 0, 0, &res);
+
+	ret = load_vcp_bin(fw->data, fw->size,
+			   img_buf_va, img_buf_phys,
+			   img_buf_iova, vcp);
+	if (ret) {
+		dev_err(vcp->dev, "load vcp bin failed\n");
+		return -EINVAL;
+	}
+
+	ret = load_mmup_bin(fw->data, fw->size,
+			    img_buf_va, img_buf_phys,
+			    img_buf_iova, vcp);
+	if (ret) {
+		dev_err(vcp->dev, "load mmup bin failed\n");
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+static inline void vcp_wdt_clear(struct mtk_vcp_device *vcp,
+				 enum vcp_core_id core_id)
+{
+	core_id == VCP_ID ?
+		   writel(B_WDT_IRQ, vcp->vcp_cluster->cfg_core + R_CORE0_WDT_IRQ) :
+		   writel(B_WDT_IRQ, vcp->vcp_cluster->cfg_core + R_CORE1_WDT_IRQ);
+}
+
+/*
+ * handler for wdt irq for vcp
+ */
+static irqreturn_t vcp_wdt_handler(struct mtk_vcp_device *vcp)
+{
+	u32 reg0;
+	u32 reg1;
+
+	reg0 = readl(vcp->vcp_cluster->cfg_core + R_CORE0_WDT_IRQ);
+	reg1 = vcp->vcp_cluster->core_nums > VCP_ID ?
+	       readl(vcp->vcp_cluster->cfg_core + R_CORE1_WDT_IRQ) : 0;
+
+	if (reg0)
+		vcp_wdt_clear(vcp, VCP_ID);
+	if (reg1)
+		vcp_wdt_clear(vcp, MMUP_ID);
+
+	if (reg0 || reg1)
+		return IRQ_HANDLED;
+	return IRQ_NONE;
+}
+
+/*
+ * dispatch vcp irq
+ * reset vcp and generate exception if needed
+ * @param irq:   irq id
+ * @param pri:   struct mtk_vcp_device
+ */
+static irqreturn_t vcp_irq_handler(int irq, void *priv)
+{
+	struct mtk_vcp_device *vcp = priv;
+
+	disable_irq_nosync(irq);
+	return vcp_wdt_handler(vcp);
+}
+
+int vcp_wdt_irq_init(struct mtk_vcp_device *vcp)
+{
+	int ret;
+
+	ret = devm_request_irq(vcp->dev, platform_get_irq(vcp->pdev, 0),
+			       vcp_irq_handler, IRQF_ONESHOT,
+			       vcp->pdev->name, vcp);
+	if (ret)
+		dev_err(vcp->dev, "failed to request wdt irq\n");
+
+	return ret;
+}
+
+MODULE_AUTHOR("Xiangzhi Tang <xiangzhi.tang@mediatek.com>");
+MODULE_DESCRIPTION("MTK VCP Controller");
+MODULE_LICENSE("GPL");
diff --git a/drivers/remoteproc/mtk_vcp_common.h b/drivers/remoteproc/mtk_vcp_common.h
new file mode 100644
index 000000000000..181bd497bf57
--- /dev/null
+++ b/drivers/remoteproc/mtk_vcp_common.h
@@ -0,0 +1,251 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ */
+
+#ifndef __MTK_VCP_COMMON_H
+#define __MTK_VCP_COMMON_H
+
+#include <linux/arm-smccc.h>
+#include <linux/firmware.h>
+#include <linux/soc/mediatek/mtk_sip_svc.h>
+#include <linux/remoteproc/mtk_vcp_public.h>
+
+/* vcp timeout definition */
+#define VCP_READY_TIMEOUT_MS 3000
+#define VCP_AWAKE_TIMEOUT 1000
+#define WAKE_POLL_TIMES 100
+#define USDELAY_RANGE_MIN 1000
+#define USDELAY_RANGE_MAX 2000
+#define SUSPEND_WAIT_TIMEOUT_MS 100
+
+/* vcp platform define */
+#define SUSPEND_IPI_MAGIC 0x87654321
+#define RESUME_IPI_MAGIC 0x12345678
+#define DMA_MAX_MASK_BIT 33
+#define PIN_OUT_C_SIZE_SLEEP_0           2
+#define PIN_OUT_SIZE_TEST_0              3
+#define PIN_OUT_C_SIZE_SLEEP_1           2
+#define PIN_OUT_SIZE_TEST_1              3
+
+/* vcp load image define */
+#define VCM_IMAGE_MAGIC             (0x58881688)
+#define VCM_IMAGE_NAME_MAXSZ        (32)
+#define VCP_IMAGE_HEADER_SIZE       (0x200)
+
+#define VCP_DRAM_IMG_OFFSET         (0x200000)
+#define MMUP_DRAM_IMG_OFFSET        (0x1200000)
+
+#define REGION_OFFSET               (0x4)
+#define ALIGN_1024                  (1024)
+#define ALIGN_16                    (16)
+#define VCP_HFRP_SECTION_NAME       "tinysys-vcp-RV55_A"
+#define VCP_MMUP_SECTION_NAME       "tinysys-mmup-RV33_A"
+#define VCP_HFRP_DRAM_SECTION_NAME  "tinysys-vcp-RV55_A_dram"
+#define VCP_MMUP_DRAM_SECTION_NAME  "tinysys-mmup-RV33_A_dram"
+
+/* vcp memory iove pack convert define */
+#define VCP_PACK_IOVA(addr)     ((uint32_t)((addr) | (((uint64_t)(addr) >> 32) & 0xF)))
+#define VCP_UNPACK_IOVA(addr)   \
+	((uint64_t)(addr & 0xFFFFFFF0) | (((uint64_t)(addr) & 0xF) << 32))
+
+/* vcp register define */
+#define VCP_R_CORE0_SW_RSTN_SET         (0x0004)
+#define VCP_R_CORE1_SW_RSTN_SET         (0x000C)
+#define R_GIPC_IN_SET                   (0x0028)
+#define R_GIPC_IN_CLR                   (0x002C)
+#define GIPC_MMUP_SHUT                  (1 << 10)
+#define GIPC_VCP_HART0_SHUT             (1 << 14)
+#define B_GIPC4_SETCLR_3                (1 << 19)
+#define R_CORE0_WDT_IRQ                 (0x0050)
+#define R_CORE1_WDT_IRQ                 (0x0054)
+#define B_WDT_IRQ                       (1 << 0)
+#define AP_R_GPR2                       (0x0068)
+#define B_CORE0_SUSPEND                 (1 << 0)
+#define B_CORE0_RESUME                  (1 << 1)
+#define AP_R_GPR3                       (0x006C)
+#define B_CORE1_SUSPEND                 (1 << 0)
+#define B_CORE1_RESUME                  (1 << 1)
+
+#define R_CORE0_STATUS                  (0x6070)
+#define B_CORE_GATED                    (1 << 0)
+#define B_HART0_HALT                    (1 << 1)
+#define B_HART1_HALT                    (1 << 2)
+#define B_CORE_AXIS_BUSY                (1 << 4)
+#define R_CORE1_STATUS                  (0x9070)
+#define VCP_C0_GPR0_SUSPEND_RESUME_FLAG (0x6040)
+#define VCP_C0_GPR1_DRAM_RESV_ADDR      (0x6044)
+#define VCP_C0_GPR2_DRAM_RESV_SIZE      (0x6048)
+#define VCP_C0_GPR3_DRAM_RESV_LOGGER    (0x604C)
+#define VCP_C0_GPR5_H0_REBOOT           (0x6054)
+#define CORE_RDY_TO_REBOOT              (0x0034)
+#define VCP_C0_GPR6_H1_REBOOT           (0x6058)
+#define VCP_C1_GPR0_SUSPEND_RESUME_FLAG (0x9040)
+#define VCP_C1_GPR1_DRAM_RESV_ADDR      (0x9044)
+#define VCP_C1_GPR2_DRAM_RESV_SIZE      (0x9048)
+#define VCP_C1_GPR3_DRAM_RESV_LOGGER    (0x904C)
+#define VCP_C1_GPR5_H0_REBOOT           (0x9054)
+#define VCP_C1_GPR6_H1_REBOOT           (0x9058)
+
+/* sec GPR */
+#define R_GPR2_SEC                      (0x0028)
+#define MMUP_AP_SUSPEND                 (1U << 0)
+#define R_GPR3_SEC                      (0x002C)
+#define VCP_AP_SUSPEND                  (1U << 0)
+
+/* vcp rdy */
+#define VLP_AO_RSVD7                    (0x0000)
+#define READY_BIT                       (1U << 1)
+
+/* vcp Core ID definition */
+enum vcp_core_id {
+	VCP_ID          = 0,
+	MMUP_ID         = 1,
+	VCP_CORE_TOTAL  = 2,
+};
+
+/* vcp kernel smc server id */
+enum mtk_tinysys_vcp_kernel_op {
+	MTK_TINYSYS_VCP_KERNEL_OP_RESET_SET = 0,
+	MTK_TINYSYS_VCP_KERNEL_OP_RESET_RELEASE,
+	MTK_TINYSYS_VCP_KERNEL_OP_COLD_BOOT_VCP,
+	MTK_TINYSYS_MMUP_KERNEL_OP_RESET_SET,
+	MTK_TINYSYS_MMUP_KERNEL_OP_RESET_RELEASE,
+	MTK_TINYSYS_MMUP_KERNEL_OP_SET_L2TCM_OFFSET,
+	MTK_TINYSYS_MMUP_KERNEL_OP_SET_FW_SIZE,
+	MTK_TINYSYS_MMUP_KERNEL_OP_COLD_BOOT_MMUP,
+	MTK_TINYSYS_VCP_KERNEL_OP_NUM,
+};
+
+/**
+ * struct mkimg_hdr - mtk image header format.
+ *
+ * @magic: mtk vcp image magic id
+ * @dsz: mtk vcp image part binary size
+ * @name: mtk vcp image part binary parttion name
+ */
+struct mkimg_hdr {
+	u32 magic;
+	u32 dsz;
+	char name[VCM_IMAGE_NAME_MAXSZ];
+};
+
+/**
+ * struct vcp_feature_tb - feature table structure definition.
+ *
+ * @feature: feature id
+ * @core_id: feature using vcp core id
+ * @enable: whether the feature is enabled or not
+ */
+struct vcp_feature_tb {
+	u32 feature;
+	enum vcp_core_id core_id;
+	u32 enable;
+};
+
+/**
+ * struct vcp_reserve_mblock - vcp reserved memory structure.
+ *
+ * @vcp_reserve_mem_id_t: reserved memory id
+ * @start_phys: reserved memory phy addr
+ * @start_iova: reserved memory dma map addr
+ * @start_virt: reserved memory CPU virt addr
+ * @size: reserved memory size
+ */
+struct vcp_reserve_mblock {
+	enum vcp_reserve_mem_id_t num;
+	phys_addr_t start_phys;
+	dma_addr_t start_iova;
+	void __iomem *start_virt;
+	size_t size;
+};
+
+/**
+ * struct vcp_region_info_st - config vcp image info sync to vcp bootloader.
+ *
+ * @ap_loader_start: (optional) - config vcp bootloader to copy loader start addr
+ * @ap_loader_size: (optional) - config vcp bootloader to copy loader size
+ * @ap_firmware_start: (optional) - config vcp bootloader to copy firmware start addr
+ * @ap_firmware_size: (optional) - config vcp bootloader to copy firmware size
+ * @ap_dram_start: config vcp run dram binary start addr
+ * @ap_dram_size: config vcp run dram binary size
+ * @ap_dram_backup_start: config vcp backup dram binary start addr
+ * @struct_size: vcp image region info structure size
+ * @l2tcm_offset: vcp two core using l2sram layout
+ * @TaskContext_ptr: (optional) - vcp task context ptr for debug
+ * @vcpctl:  (optional) - vcp control info
+ * @regdump_start: (optional) - regdump start addr for debug
+ * @regdump_size: (optional) - regdump size for debug
+ * @ap_params_start: (optional) - params start addr
+ * @sramlog_buf_offset: (optional) - sramlog_buf_offset for debug
+ * @sramlog_end_idx_offset: (optional) - sramlog_end_idx_offset for debug
+ * @sramlog_buf_maxlen: (optional) - sramlog_buf_maxlen for debug
+ * @ap_loader_start_pa: (optional) - config vcp bootloader for loader start pa
+ * @coredump_offset: (optional) - coredump_offset offset for debug
+ * @coredump_dram_offset: (optional) - coredump_dram_offset offset for debug
+ */
+struct vcp_region_info_st {
+	u32 ap_loader_start;
+	u32 ap_loader_size;
+	u32 ap_firmware_start;
+	u32 ap_firmware_size;
+	u32 ap_dram_start;
+	u32 ap_dram_size;
+	u32 ap_dram_backup_start;
+	u32 struct_size;
+	u32 l2tcm_offset;
+	u32 TaskContext_ptr;
+	u32 vcpctl;
+	u32 regdump_start;
+	u32 regdump_size;
+	u32 ap_params_start;
+	u32 sramlog_buf_offset;
+	u32 sramlog_end_idx_offset;
+	u32 sramlog_buf_maxlen;
+	u32 ap_loader_start_pa;
+	u32 coredump_offset;
+	u32 coredump_dram_offset;
+};
+
+/* vcp common ready signale APIs */
+int vcp_A_ready_ipi_handler(u32 id, void *prdata,
+			    void *data, u32 len);
+void vcp_reset_ready_flag(void);
+bool is_vcp_ready_by_coreid(enum vcp_core_id core_id);
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
+bool is_vcp_suspending(struct mtk_vcp_device *vcp);
+
+/* vcp common reserved memory APIs */
+int vcp_reserve_memory_ioremap(struct mtk_vcp_device *vcp);
+phys_addr_t vcp_get_reserve_mem_phys(enum vcp_reserve_mem_id_t id);
+dma_addr_t vcp_get_reserve_mem_iova(enum vcp_reserve_mem_id_t id);
+void __iomem *vcp_get_reserve_mem_virt(enum vcp_reserve_mem_id_t id);
+void __iomem *vcp_get_internal_sram_virt(struct mtk_vcp_device *vcp);
+u32 vcp_get_reserve_mem_size(enum vcp_reserve_mem_id_t id);
+
+/* vcp common load image API */
+int mtk_vcp_load(struct rproc *rproc, const struct firmware *fw);
+
+/* vcp common wdt irq init API */
+int vcp_wdt_irq_init(struct mtk_vcp_device *vcp);
+
+/* vcp common feature register/deregister APIs */
+int vcp_A_register_feature(struct mtk_vcp_device *vcp,
+			   enum feature_id id);
+int vcp_A_deregister_feature(struct mtk_vcp_device *vcp,
+			     enum feature_id id);
+/* vcp common reset boot API */
+int reset_vcp(struct mtk_vcp_device *vcp);
+
+/* vcp common core hart shutdown API */
+u32 wait_core_hart_shutdown(struct mtk_vcp_device *vcp, enum vcp_core_id core_id);
+#endif
diff --git a/drivers/remoteproc/mtk_vcp_rproc.c b/drivers/remoteproc/mtk_vcp_rproc.c
new file mode 100644
index 000000000000..2159e575b36e
--- /dev/null
+++ b/drivers/remoteproc/mtk_vcp_rproc.c
@@ -0,0 +1,724 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 MediaTek Corporation. All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/init.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_fdt.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/poll.h>
+#include <linux/sched.h>
+#include <linux/suspend.h>
+#include <linux/slab.h>
+#include <linux/timer.h>
+#include <linux/vmalloc.h>
+#include <linux/remoteproc.h>
+#include <linux/firmware/mediatek/mtk-vcp-ipc.h>
+
+#include "mtk_vcp_common.h"
+#include "mtk_vcp_rproc.h"
+#include "remoteproc_internal.h"
+
+struct mtk_ipi_device vcp_ipidev = {
+	.name = "vcp_ipidev",
+	.prdata = 0,
+};
+
+struct mtk_vcp_ipi_ops mt8196_vcp_ipi_ops = {
+	.ipi_send = mtk_vcp_ipc_send,
+	.ipi_send_compl = mtk_vcp_ipc_send_compl,
+	.ipi_register = mtk_vcp_mbox_ipc_register,
+	.ipi_unregister = mtk_vcp_mbox_ipc_unregister,
+};
+
+
+/**
+ * vcp_get() - get a reference to VCP.
+ *
+ * @pdev: the platform device of the module requesting VCP platform
+ *        device for using VCP API.
+ *
+ * Return: Return NULL if failed.  otherwise reference to VCP.
+ **/
+struct mtk_vcp_device *vcp_get(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *vcp_node;
+	struct platform_device *vcp_pdev;
+
+	vcp_node = of_parse_phandle(dev->of_node, "mediatek,vcp", 0);
+	if (!vcp_node) {
+		dev_err(dev, "can't get VCP node\n");
+		return NULL;
+	}
+
+	vcp_pdev = of_find_device_by_node(vcp_node);
+	of_node_put(vcp_node);
+
+	if (WARN_ON(!vcp_pdev)) {
+		dev_err(dev, "VCP pdev failed\n");
+		return NULL;
+	}
+
+	return platform_get_drvdata(vcp_pdev);
+}
+EXPORT_SYMBOL_GPL(vcp_get);
+
+/**
+ * vcp_put() - "free" the VCP
+ *
+ * @vcp: mtk_vcp_device structure from vcp_get().
+ *
+ **/
+void vcp_put(struct mtk_vcp_device *vcp)
+{
+	put_device(vcp->dev);
+}
+EXPORT_SYMBOL_GPL(vcp_put);
+
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
+static void vcp_wait_core_stop(struct mtk_vcp_device *vcp, enum vcp_core_id core_id)
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
+		if (core_halt && (!core_axi)) {
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
+static void vcp_wait_rdy_signal(struct mtk_vcp_device *vcp, bool rdy)
+{
+	u32 rdy_signal;
+	int ret;
+
+	if (!IS_ERR((void const *) vcp->vcp_cluster->vcp_rdy)) {
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
+static void vcp_wait_suspend_resume(struct mtk_vcp_device *vcp, bool suspend)
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
+		if (suspend
+		    && (readl(vcp->vcp_cluster->cfg_sec + R_GPR3_SEC) & (VCP_AP_SUSPEND))
+		    && (readl(vcp->vcp_cluster->cfg_sec + R_GPR2_SEC) & (MMUP_AP_SUSPEND)))
+			break;
+		else if (!suspend
+			 && !(readl(vcp->vcp_cluster->cfg_sec + R_GPR3_SEC) & (VCP_AP_SUSPEND))
+			 && !(readl(vcp->vcp_cluster->cfg_sec + R_GPR2_SEC) & (MMUP_AP_SUSPEND)))
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
+static int mtk_vcp_suspend(struct device *dev)
+{
+	struct mtk_vcp_device *vcp = platform_get_drvdata(to_platform_device(dev));
+
+	vcp_extern_notify(VCP_ID, VCP_EVENT_SUSPEND);
+	vcp_extern_notify(MMUP_ID, VCP_EVENT_SUSPEND);
+
+	if ((!vcp->vcp_cluster->is_suspending) &&
+	     vcp->vcp_cluster->pwclkcnt) {
+		vcp->vcp_cluster->is_suspending = true;
+
+		flush_workqueue(vcp->vcp_cluster->vcp_workqueue);
+
+		vcp_reset_ready_flag();
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
+static int mtk_vcp_start(struct rproc *rproc)
+{
+	struct mtk_vcp_device *vcp = (struct mtk_vcp_device *)rproc->priv;
+	struct arm_smccc_res res;
+
+	/* core 0 */
+	arm_smccc_smc(MTK_SIP_TINYSYS_VCP_CONTROL,
+		      MTK_TINYSYS_VCP_KERNEL_OP_RESET_SET,
+		      1, 0, 0, 0, 0, 0, &res);
+
+	/* core 1 */
+	arm_smccc_smc(MTK_SIP_TINYSYS_VCP_CONTROL,
+		      MTK_TINYSYS_MMUP_KERNEL_OP_RESET_SET,
+		      1, 0, 0, 0, 0, 0, &res);
+
+	if (vcp_A_register_feature(vcp, RTOS_FEATURE_ID) < 0) {
+		dev_err(vcp->dev, "bootup fail\n");
+		vcp_A_deregister_feature(vcp, RTOS_FEATURE_ID);
+	} else
+		dev_info(vcp->dev, "bootup successfully\n");
+
+	return 0;
+}
+
+static int mtk_vcp_stop(struct rproc *rproc)
+{
+	struct mtk_vcp_device *vcp = (struct mtk_vcp_device *)rproc->priv;
+
+	vcp_A_deregister_feature(vcp, RTOS_FEATURE_ID);
+
+	vcp_extern_notify(VCP_ID, VCP_EVENT_STOP);
+	vcp_extern_notify(MMUP_ID, VCP_EVENT_STOP);
+
+	return 0;
+}
+static const struct rproc_ops mtk_vcp_ops = {
+	.load		= mtk_vcp_load,
+	.start		= mtk_vcp_start,
+	.stop		= mtk_vcp_stop,
+};
+
+
+struct mtk_mbox_send_table send_data[] = {
+	{ .msg_size = 18, .ipi_id =  0, .mbox_id = 0 },
+
+	{ .msg_size =  8, .ipi_id = 15, .mbox_id = 1 },
+	{ .msg_size = 18, .ipi_id = 16, .mbox_id = 1 },
+	{ .msg_size =  2, .ipi_id =  9, .mbox_id = 1 },
+
+	{ .msg_size = 18, .ipi_id = 11, .mbox_id = 2 },
+	{ .msg_size =  2, .ipi_id =  2, .mbox_id = 2 },
+	{ .msg_size =  3, .ipi_id =  3, .mbox_id = 2 },
+	{ .msg_size =  2, .ipi_id = 32, .mbox_id = 2 },
+
+	{ .msg_size =  2, .ipi_id = 33, .mbox_id = 3 },
+	{ .msg_size =  2, .ipi_id = 13, .mbox_id = 3 },
+	{ .msg_size =  2, .ipi_id = 35, .mbox_id = 3 },
+
+	{ .msg_size =  2, .ipi_id = 20, .mbox_id = 4 },
+	{ .msg_size =  3, .ipi_id = 21, .mbox_id = 4 },
+	{ .msg_size =  2, .ipi_id = 23, .mbox_id = 4 }
+};
+
+struct mtk_mbox_recv_table recv_data[] = {
+	{ .recv_opt = 0, .msg_size = 18, .ipi_id =  1, .mbox_id = 0 },
+
+	{ .recv_opt = 1, .msg_size =  8, .ipi_id = 15, .mbox_id = 1 },
+	{ .recv_opt = 0, .msg_size = 18, .ipi_id = 17, .mbox_id = 1 },
+	{ .recv_opt = 0, .msg_size =  2, .ipi_id = 10, .mbox_id = 1 },
+
+	{ .recv_opt = 0, .msg_size = 18, .ipi_id = 12, .mbox_id = 2 },
+	{ .recv_opt = 0, .msg_size =  1, .ipi_id =  5, .mbox_id = 2 },
+	{ .recv_opt = 1, .msg_size =  1, .ipi_id =  2, .mbox_id = 2 },
+
+	{ .recv_opt = 0, .msg_size =  2, .ipi_id = 34, .mbox_id = 3 },
+	{ .recv_opt = 0, .msg_size =  2, .ipi_id = 14, .mbox_id = 3 },
+
+	{ .recv_opt = 0, .msg_size =  1, .ipi_id = 26, .mbox_id = 4 },
+	{ .recv_opt = 1, .msg_size =  1, .ipi_id = 20, .mbox_id = 4 }
+};
+
+struct mtk_mbox_table ipc_table = {
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
+	.recv_count = ARRAY_SIZE(recv_data),
+	.send_count = ARRAY_SIZE(send_data),
+};
+
+static int vcp_ipi_mbox_init(struct mtk_vcp_device *vcp)
+{
+	struct mtk_vcp_ipc *vcp_ipc;
+	struct platform_device *pdev;
+	int ret;
+
+	pdev = platform_device_register_data(vcp->dev, "mtk-vcp-ipc",
+					     PLATFORM_DEVID_NONE, &ipc_table,
+					     sizeof(ipc_table));
+	if (IS_ERR(pdev)) {
+		ret = PTR_ERR(pdev);
+		dev_err(vcp->dev, "failed to create mtk-vcp-ipc device\n");
+		return ret;
+	}
+
+	vcp_ipc = dev_get_drvdata(&pdev->dev);
+	if (!vcp_ipc) {
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
+static int vcp_multi_core_init(struct platform_device *pdev,
+			       struct mtk_vcp_of_cluster *vcp_cluster,
+			       enum vcp_core_id core_id)
+{
+	int ret;
+
+	ret = of_property_read_u32(pdev->dev.of_node, "twohart",
+				   &vcp_cluster->twohart[core_id]);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to twohart property\n");
+		return ret;
+	}
+	ret = of_property_read_u32(pdev->dev.of_node, "sram-offset",
+				   &vcp_cluster->sram_offset[core_id]);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to sram-offset property\n");
+		return ret;
+	}
+
+	return ret;
+}
+
+static bool vcp_is_single_core(struct platform_device *pdev,
+			       struct mtk_vcp_of_cluster *vcp_cluster)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev_of_node(dev);
+	struct device_node *child;
+	u32 num_cores = 0;
+
+	for_each_available_child_of_node(np, child)
+		num_cores++;
+	vcp_cluster->core_nums = num_cores;
+
+	return num_cores < VCP_CORE_TOTAL ? true : false;
+}
+
+static int vcp_add_single_core(struct platform_device *pdev,
+			       struct mtk_vcp_of_cluster *vcp_cluster)
+{
+	return 0;
+}
+
+static int vcp_add_multi_core(struct platform_device *pdev,
+			      struct mtk_vcp_of_cluster *vcp_cluster)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev_of_node(dev);
+	struct device_node *child;
+	struct platform_device *cpdev;
+	struct mtk_vcp_device *vcp;
+	struct rproc *rproc;
+	const struct mtk_vcp_of_data *vcp_of_data;
+	int ret = 0;
+
+	vcp_of_data = of_device_get_match_data(dev);
+	rproc = devm_rproc_alloc(dev, np->name, &mtk_vcp_ops,
+				 vcp_of_data->platdata.fw_name,
+				 sizeof(struct mtk_vcp_device));
+	if (!rproc)
+		return dev_err_probe(dev, -ENOMEM, "unable to allocate remoteproc\n");
+
+	vcp  = rproc->priv;
+	vcp->rproc = rproc;
+	vcp->pdev = pdev;
+	vcp->dev = dev;
+	vcp->ops = &vcp_of_data->ops;
+	vcp->platdata = &vcp_of_data->platdata;
+	vcp->ipi_dev = &vcp_ipidev;
+	vcp->ipi_ops = vcp_of_data->platdata.ipi_ops;
+	vcp->vcp_cluster = vcp_cluster;
+
+	rproc->auto_boot = vcp_of_data->platdata.auto_boot;
+	rproc->sysfs_read_only = vcp_of_data->platdata.sysfs_read_only;
+	platform_set_drvdata(pdev, vcp);
+
+	ret = vcp_reserve_memory_ioremap(vcp);
+	if (ret) {
+		dev_err(dev, "vcp_reserve_memory_ioremap failed ret = %d\n", ret);
+		goto remove_subdev;
+	}
+
+	for_each_available_child_of_node(np, child) {
+		if (of_device_is_compatible(child, "mediatek,vcp-core")) {
+			cpdev = of_find_device_by_node(child);
+			if (!cpdev) {
+				ret = -ENODEV;
+				dev_err(dev, "Not found platform device for core\n");
+				return ret;
+			}
+			ret = vcp_multi_core_init(cpdev, vcp_cluster, VCP_ID);
+		} else if (of_device_is_compatible(child, "mediatek,mmup-core")) {
+			cpdev = of_find_device_by_node(child);
+			if (!cpdev) {
+				ret = -ENODEV;
+				dev_err(dev, "Not found platform device for core\n");
+				return ret;
+			}
+			ret = vcp_multi_core_init(cpdev, vcp_cluster, MMUP_ID);
+		}
+	}
+
+	ret = vcp_ipi_mbox_init(vcp);
+	if (ret) {
+		dev_err(dev, "Failed to init vcp ipi-mbox\n");
+		goto remove_subdev;
+	}
+
+	ret = vcp->ipi_ops->ipi_register(vcp->ipi_dev, IPI_OUT_C_SLEEP_0,
+					 NULL, NULL, &vcp->vcp_cluster->slp_ipi_ack_data);
+	if (ret) {
+		dev_err(dev, "Failed to register IPI_OUT_C_SLEEP_0\n");
+		goto slp_ipi_unregister;
+	}
+
+	ret = vcp->ipi_ops->ipi_register(vcp->ipi_dev, IPI_IN_VCP_READY_0,
+					 (void *)vcp_A_ready_ipi_handler,
+					 vcp, &vcp->vcp_cluster->msg_vcp_ready0);
+	if (ret) {
+		dev_err(dev, "Failed to register IPI_IN_VCP_READY_0\n");
+		goto vcp0_ready_ipi_unregister;
+	}
+
+	ret = vcp->ipi_ops->ipi_register(vcp->ipi_dev, IPI_IN_VCP_READY_1,
+					 (void *)vcp_A_ready_ipi_handler,
+					 vcp, &vcp->vcp_cluster->msg_vcp_ready1);
+	if (ret) {
+		dev_err(dev, "Failed to register IPI_IN_VCP_READY_1\n");
+		goto vcp1_ready_ipi_unregister;
+	}
+
+	ret = vcp_notify_work_init(vcp);
+	if (ret)
+		dev_err(dev, "vcp_notify_work_init failed\n");
+
+	ret = vcp_wdt_irq_init(vcp);
+	if (ret)
+		dev_err(dev, "vcp_wdt_irq_init failed\n");
+
+	pm_runtime_get_sync(dev);
+
+	ret = rproc_add(rproc);
+	if (ret)
+		goto rproc_err;
+	return ret;
+
+rproc_err:
+vcp1_ready_ipi_unregister:
+	mtk_vcp_mbox_ipc_unregister(vcp->ipi_dev, IPI_IN_VCP_READY_1);
+vcp0_ready_ipi_unregister:
+	mtk_vcp_mbox_ipc_unregister(vcp->ipi_dev, IPI_IN_VCP_READY_0);
+slp_ipi_unregister:
+	mtk_vcp_mbox_ipc_unregister(vcp->ipi_dev, IPI_OUT_C_SLEEP_0);
+remove_subdev:
+	return ret;
+}
+
+static int vcp_cluster_init(struct platform_device *pdev,
+			    struct mtk_vcp_of_cluster *vcp_cluster)
+{
+	int ret;
+
+	if (vcp_is_single_core(pdev, vcp_cluster))
+		ret = vcp_add_single_core(pdev, vcp_cluster);
+	else
+		ret = vcp_add_multi_core(pdev, vcp_cluster);
+
+	return ret;
+}
+
+static int vcp_device_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	struct device *dev = &pdev->dev;
+	struct mtk_vcp_of_cluster *vcp_cluster;
+	int ret;
+
+	pm_runtime_enable(dev);
+
+	vcp_cluster = devm_kzalloc(dev, sizeof(*vcp_cluster), GFP_KERNEL);
+	if (!vcp_cluster)
+		return -ENOMEM;
+
+	vcp_cluster->cfg = devm_platform_ioremap_resource_byname(pdev, "cfg");
+	if (IS_ERR(vcp_cluster->cfg))
+		return dev_err_probe(dev, PTR_ERR(vcp_cluster->cfg),
+				     "Failed to parse and map cfg memory\n");
+
+	vcp_cluster->cfg_sec = devm_platform_ioremap_resource_byname(pdev, "cfg_sec");
+	if (IS_ERR(vcp_cluster->cfg_sec))
+		return dev_err_probe(dev, PTR_ERR(vcp_cluster->cfg_sec),
+				     "Failed to parse and map cfg_sec memory\n");
+
+	vcp_cluster->cfg_core = devm_platform_ioremap_resource_byname(pdev, "cfg_core");
+	if (IS_ERR(vcp_cluster->cfg_core))
+		return dev_err_probe(dev, PTR_ERR(vcp_cluster->cfg_core),
+				     "Failed to parse and map cfg_core memory\n");
+
+	vcp_cluster->vcp_rdy = devm_platform_ioremap_resource_byname(pdev, "vcp_vlp_ao_rsvd7");
+	if (IS_ERR(vcp_cluster->vcp_rdy))
+		return dev_err_probe(dev, PTR_ERR(vcp_cluster->vcp_rdy),
+				     "Failed to parse and map vcp_rdy memory\n");
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
+	vcp_cluster->sram_base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(vcp_cluster->sram_base))
+		return dev_err_probe(dev, PTR_ERR(vcp_cluster->sram_base),
+				     "Failed to parse and map sram memory\n");
+	vcp_cluster->sram_size = (u32)resource_size(res);
+
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to populate platform devices\n");
+
+	ret = vcp_cluster_init(pdev, vcp_cluster);
+	if (ret)
+		return ret;
+
+
+	return 0;
+}
+
+static void vcp_device_remove(struct platform_device *pdev)
+{
+	struct mtk_vcp_device *vcp = platform_get_drvdata(pdev);
+
+	flush_workqueue(vcp_workqueue);
+	destroy_workqueue(vcp_workqueue);
+	pm_runtime_disable(&pdev->dev);
+
+	rproc_del(vcp->rproc);
+}
+
+static void vcp_device_shutdown(struct platform_device *pdev)
+{
+	struct mtk_vcp_device *vcp = platform_get_drvdata(pdev);
+	u32 ret;
+
+	vcp_reset_ready_flag();
+
+	vcp_extern_notify(VCP_ID, VCP_EVENT_STOP);
+	vcp_extern_notify(MMUP_ID, VCP_EVENT_STOP);
+
+	writel(GIPC_VCP_HART0_SHUT, vcp->vcp_cluster->cfg_core + R_GIPC_IN_SET);
+	if (vcp->vcp_cluster->core_nums > VCP_ID) {
+		ret = wait_core_hart_shutdown(vcp, VCP_ID);
+		if (!ret) {
+			dev_err(&pdev->dev,
+				"wait VCP_ID core hart shutdown timeout\n");
+		} else {
+			writel(GIPC_MMUP_SHUT, vcp->vcp_cluster->cfg_core + R_GIPC_IN_SET);
+		}
+	}
+}
+
+static const struct mtk_vcp_of_data mt8196_of_data = {
+	.ops = {
+		.vcp_is_ready = is_vcp_ready,
+		.vcp_is_suspending = is_vcp_suspending,
+		.vcp_register_notify = vcp_A_register_notify,
+		.vcp_unregister_notify = vcp_A_unregister_notify,
+		.vcp_register_feature = vcp_A_register_feature,
+		.vcp_deregister_feature = vcp_A_deregister_feature,
+		.vcp_get_mem_phys = vcp_get_reserve_mem_phys,
+		.vcp_get_mem_iova = vcp_get_reserve_mem_iova,
+		.vcp_get_mem_virt = vcp_get_reserve_mem_virt,
+		.vcp_get_mem_size = vcp_get_reserve_mem_size,
+		.vcp_get_sram_virt = vcp_get_internal_sram_virt,
+	},
+	.platdata = {
+		.auto_boot = true,
+		.sysfs_read_only = true,
+		.rtos_static_iova = 0x180600000,
+		.ipc_data = &ipc_table,
+		.ipi_ops = &mt8196_vcp_ipi_ops,
+		.fw_name = "mediatek/mt8196/vcp.img",
+	},
+};
+
+static const struct dev_pm_ops mtk_vcp_rproc_pm_ops = {
+	.suspend_noirq = mtk_vcp_suspend,
+	.resume_noirq = mtk_vcp_resume,
+};
+
+static const struct of_device_id vcp_of_ids[] = {
+	{ .compatible = "mediatek,mt8196-vcp", .data = &mt8196_of_data},
+	{}
+};
+MODULE_DEVICE_TABLE(of, vcp_of_ids);
+
+static struct platform_driver mtk_vcp_device = {
+	.probe = vcp_device_probe,
+	.remove = vcp_device_remove,
+	.shutdown = vcp_device_shutdown,
+	.driver = {
+		.name = "mtk-vcp",
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(vcp_of_ids),
+		.pm = pm_ptr(&mtk_vcp_rproc_pm_ops),
+	},
+};
+
+module_platform_driver(mtk_vcp_device);
+
+MODULE_AUTHOR("Xiangzhi Tang <xiangzhi.tang@mediatek.com>");
+MODULE_DESCRIPTION("MTK VCP Controller");
+MODULE_LICENSE("GPL");
diff --git a/drivers/remoteproc/mtk_vcp_rproc.h b/drivers/remoteproc/mtk_vcp_rproc.h
new file mode 100644
index 000000000000..76fefb99c82f
--- /dev/null
+++ b/drivers/remoteproc/mtk_vcp_rproc.h
@@ -0,0 +1,107 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ */
+
+#ifndef __MTK_VCP_RPROC_H__
+#define __MTK_VCP_RPROC_H__
+
+#include <linux/remoteproc/mtk_vcp_public.h>
+
+/* vcp sleep cmd flag sync with VCP FW */
+enum {
+	SLP_WAKE_LOCK = 0,
+	SLP_WAKE_UNLOCK,
+	SLP_STATUS_DBG,
+	SLP_SUSPEND,
+	SLP_RESUME,
+};
+
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
+/* vcp work struct definition */
+struct vcp_work_struct {
+	struct work_struct work;
+	struct device *dev;
+	u32 flags;
+	u32 id;
+};
+
+/**
+ * struct mtk_vcp_of_cluster - vcp cluster priv data.
+ *
+ * @sram_base: sram_base get from dtb
+ * @cfg: cfg register get from dtb
+ * @cfg_sec: cfg_sec register get from dtb
+ * @cfg_core: cfg_core register get from dtb
+ * @vcp_rdy: vlp vcp_rdy register get from dtb
+ * @sram_size: total sram size get from dtb
+ * @core_nums: total core numbers get from dtb
+ * @twohart: core weo hart support flag
+ * @msg_vcp_ready0: core0 ready ipi msg data
+ * @msg_vcp_ready1: core1 ready ipi msg data
+ * @slp_ipi_ack_data: sleep ipi msg data
+ * @pwclkcnt: power and clock config count data
+ * @is_suspending: suspend status flag
+ * @share_mem_iova: shared memory iova base
+ * @share_mem_iova: shared memory size
+ * @vcp_ready_notify_wk: vcp_work_struct structure
+ */
+struct mtk_vcp_of_cluster {
+	void __iomem *sram_base;
+	void __iomem *cfg;
+	void __iomem *cfg_sec;
+	void __iomem *cfg_core;
+	void __iomem *vcp_rdy;
+	u32 sram_size;
+	u32 core_nums;
+	u32 twohart[VCP_CORE_TOTAL];
+	u32 sram_offset[VCP_CORE_TOTAL];
+	u32 msg_vcp_ready0;
+	u32 msg_vcp_ready1;
+	u32 slp_ipi_ack_data;
+	int pwclkcnt;
+	bool is_suspending;
+	dma_addr_t share_mem_iova;
+	size_t share_mem_size;
+	struct workqueue_struct *vcp_workqueue;
+	struct vcp_work_struct vcp_ready_notify_wk[VCP_CORE_TOTAL];
+};
+
+/**
+ * struct mtk_vcp_platdata - vcp platform priv data.
+ *
+ * @auto_boot: rproc auto_boot flag
+ * @sysfs_read_only: rproc sysfs_read_only flag
+ * @rtos_static_iova: vcp dram binary static map iova
+ * @mtk_mbox_table: mtk_mbox_table structure
+ */
+struct mtk_vcp_platdata {
+	bool auto_boot;
+	bool sysfs_read_only;
+	dma_addr_t rtos_static_iova;
+	struct mtk_mbox_table *ipc_data;
+	struct mtk_vcp_ipi_ops *ipi_ops;
+	char *fw_name;
+};
+
+/**
+ * struct mtk_vcp_of_data - const vcp device data.
+ *
+ * @mtk_vcp_ops: mtk_vcp_ops structure
+ * @mtk_vcp_platdata: mtk_vcp_platdata structure
+ */
+struct mtk_vcp_of_data {
+	const struct mtk_vcp_ops ops;
+	const struct mtk_vcp_platdata platdata;
+};
+#endif
diff --git a/include/linux/remoteproc/mtk_vcp_public.h b/include/linux/remoteproc/mtk_vcp_public.h
new file mode 100644
index 000000000000..07b0b30ea964
--- /dev/null
+++ b/include/linux/remoteproc/mtk_vcp_public.h
@@ -0,0 +1,138 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ */
+
+#ifndef __MTK_VCP_PUBLIC_H__
+#define __MTK_VCP_PUBLIC_H__
+
+#include <linux/platform_device.h>
+#include <linux/firmware/mediatek/mtk-vcp-ipc.h>
+#include <linux/remoteproc.h>
+
+#define VCP_SYNC_TIMEOUT_MS             (999)
+
+/* vcp notify event */
+enum VCP_NOTIFY_EVENT {
+	VCP_EVENT_READY = 0,
+	VCP_EVENT_STOP,
+	VCP_EVENT_SUSPEND,
+	VCP_EVENT_RESUME,
+};
+
+/* vcp reserve memory ID definition */
+enum vcp_reserve_mem_id_t {
+	VCP_RTOS_MEM_ID,
+	VDEC_MEM_ID,
+	VENC_MEM_ID,
+	MMDVFS_VCP_MEM_ID,
+	MMDVFS_MMUP_MEM_ID,
+	MMQOS_MEM_ID,
+	NUMS_MEM_ID,
+};
+
+/* vcp feature ID list */
+enum feature_id {
+	RTOS_FEATURE_ID,
+	VDEC_FEATURE_ID,
+	VENC_FEATURE_ID,
+	GCE_FEATURE_ID,
+	MMDVFS_MMUP_FEATURE_ID,
+	MMDVFS_VCP_FEATURE_ID,
+	MMDEBUG_FEATURE_ID,
+	VMM_FEATURE_ID,
+	VDISP_FEATURE_ID,
+	MMQOS_FEATURE_ID,
+	NUM_FEATURE_ID,
+};
+
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
+struct mtk_vcp_device {
+	struct platform_device *pdev;
+	struct device *dev;
+	struct rproc *rproc;
+	struct mtk_ipi_device *ipi_dev;
+	struct rproc_subdev *rpmsg_subdev;
+	struct mtk_rpmsg_channel_info_mbox *mtk_rpchan;
+	struct mtk_vcp_of_cluster *vcp_cluster;
+	const struct mtk_vcp_ipi_ops *ipi_ops;
+	const struct mtk_vcp_ops *ops;
+	const struct mtk_vcp_platdata *platdata;
+};
+
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
+struct mtk_vcp_ops {
+	bool (*vcp_is_ready)(enum feature_id id);
+	bool (*vcp_is_suspending)(struct mtk_vcp_device *vcp);
+	void (*vcp_register_notify)(enum feature_id id, struct notifier_block *nb);
+	void (*vcp_unregister_notify)(enum feature_id id, struct notifier_block *nb);
+	int (*vcp_register_feature)(struct mtk_vcp_device *vcp, enum feature_id id);
+	int (*vcp_deregister_feature)(struct mtk_vcp_device *vcp, enum feature_id id);
+	phys_addr_t (*vcp_get_mem_phys)(enum vcp_reserve_mem_id_t id);
+	dma_addr_t (*vcp_get_mem_iova)(enum vcp_reserve_mem_id_t id);
+	void __iomem *(*vcp_get_mem_virt)(enum vcp_reserve_mem_id_t id);
+	uint32_t (*vcp_get_mem_size)(enum vcp_reserve_mem_id_t id);
+	void __iomem *(*vcp_get_sram_virt)(struct mtk_vcp_device *vcp);
+};
+
+struct mtk_vcp_device *vcp_get(struct platform_device *pdev);
+void vcp_put(struct mtk_vcp_device *vcp);
+struct mtk_ipi_device *vcp_get_ipidev(struct mtk_vcp_device *vcp);
+
+/*
+ * These inline functions are intended for user drivers that are loaded
+ * earlier than the VCP driver, or for built-in drivers that cannot access
+ * the symbols of VCP module.
+ */
+static inline struct mtk_vcp_device *mtk_vcp_get_by_phandle(phandle phandle)
+{
+	struct rproc *rproc = NULL;
+
+	rproc = rproc_get_by_phandle(phandle);
+	if (IS_ERR_OR_NULL(rproc))
+		return NULL;
+
+	return rproc->priv;
+}
+#endif
diff --git a/include/linux/soc/mediatek/mtk_sip_svc.h b/include/linux/soc/mediatek/mtk_sip_svc.h
index abe24a73ee19..d65a59752979 100644
--- a/include/linux/soc/mediatek/mtk_sip_svc.h
+++ b/include/linux/soc/mediatek/mtk_sip_svc.h
@@ -28,4 +28,7 @@
 /* IOMMU related SMC call */
 #define MTK_SIP_KERNEL_IOMMU_CONTROL	MTK_SIP_SMC_CMD(0x514)
 
+/* VCP */
+#define MTK_SIP_TINYSYS_VCP_CONTROL	MTK_SIP_SMC_CMD(0x52C)
+
 #endif
-- 
2.45.2

