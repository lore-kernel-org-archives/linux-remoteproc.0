Return-Path: <pihsun@chromium.org>
Return-Path: <pihsun@chromium.org>
From: Pi-Hsun Shih <pihsun@chromium.org>
Subject: [PATCH v11 3/5] remoteproc: mt8183: add reserved memory manager API
Date: Thu, 13 Jun 2019 12:06:50 +0800
Message-Id: <20190613040708.97488-4-pihsun@chromium.org>
In-Reply-To: <20190613040708.97488-1-pihsun@chromium.org>
References: <20190613040708.97488-1-pihsun@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pi-Hsun Shih <pihsun@chromium.org>, Erin Lo <erin.lo@mediatek.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "open list:REMOTE PROCESSOR REMOTEPROC SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Erin Lo <erin.lo@mediatek.com>

Add memory table mapping API for other driver to lookup
reserved physical and virtual memory

Signed-off-by: Erin Lo <erin.lo@mediatek.com>
Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
---
Changes from v10:
 - Fix some type mismatch warnings when printing debug messages.

Changes from v9:
 - No change.

Changes from v8:
 - Add more reserved regions for camera ISP.

Changes from v7, v6, v5:
 - No change.

Changes from v4:
 - New patch.
---
 drivers/remoteproc/mtk_scp.c          | 136 ++++++++++++++++++++++++++
 include/linux/platform_data/mtk_scp.h |  24 +++++
 2 files changed, 160 insertions(+)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index d98cf385b055..fd56c32da29a 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -352,6 +352,138 @@ void *scp_mapping_dm_addr(struct platform_device *pdev, u32 mem_addr)
 }
 EXPORT_SYMBOL_GPL(scp_mapping_dm_addr);
 
+#if SCP_RESERVED_MEM
+phys_addr_t scp_mem_base_phys;
+phys_addr_t scp_mem_base_virt;
+phys_addr_t scp_mem_size;
+
+static struct scp_reserve_mblock scp_reserve_mblock[] = {
+	{
+		.num = SCP_ISP_MEM_ID,
+		.start_phys = 0x0,
+		.start_virt = 0x0,
+		.size = 0x200000, /*2MB*/
+	},
+	{
+		.num = SCP_ISP_MEM2_ID,
+		.start_phys = 0x0,
+		.start_virt = 0x0,
+		.size = 0x800000, /*8MB*/
+	},
+	{
+		.num = SCP_DIP_MEM_ID,
+		.start_phys = 0x0,
+		.start_virt = 0x0,
+		.size = 0x900000, /*9MB*/
+	},
+	{
+		.num = SCP_MDP_MEM_ID,
+		.start_phys = 0x0,
+		.start_virt = 0x0,
+		.size = 0x600000, /*6MB*/
+	},
+	{
+		.num = SCP_FD_MEM_ID,
+		.start_phys = 0x0,
+		.start_virt = 0x0,
+		.size = 0x100000, /*1MB*/
+	},
+};
+
+static int scp_reserve_mem_init(struct mtk_scp *scp)
+{
+	enum scp_reserve_mem_id_t id;
+	phys_addr_t accumlate_memory_size = 0;
+
+	scp_mem_base_phys = (phys_addr_t) (scp->phys_addr + MAX_CODE_SIZE);
+	scp_mem_size = (phys_addr_t) (scp->dram_size - MAX_CODE_SIZE);
+
+	dev_info(scp->dev,
+		 "phys:0x%llx - 0x%llx (0x%llx)\n",
+		 (unsigned long long)scp_mem_base_phys,
+		 (unsigned long long)(scp_mem_base_phys + scp_mem_size),
+		 (unsigned long long)scp_mem_size);
+	accumlate_memory_size = 0;
+	for (id = 0; id < SCP_NUMS_MEM_ID; id++) {
+		scp_reserve_mblock[id].start_phys =
+			scp_mem_base_phys + accumlate_memory_size;
+		accumlate_memory_size += scp_reserve_mblock[id].size;
+		dev_info(scp->dev,
+			 "[reserve_mem:%d]: phys:0x%llx - 0x%llx (0x%llx)\n",
+			 id,
+			 (unsigned long long)scp_reserve_mblock[id].start_phys,
+			 (unsigned long long)(scp_reserve_mblock[id].start_phys +
+				 scp_reserve_mblock[id].size),
+			 (unsigned long long)scp_reserve_mblock[id].size);
+	}
+	return 0;
+}
+
+static int scp_reserve_memory_ioremap(struct mtk_scp *scp)
+{
+	enum scp_reserve_mem_id_t id;
+	phys_addr_t accumlate_memory_size = 0;
+
+	scp_mem_base_virt = (phys_addr_t)(size_t)ioremap_wc(scp_mem_base_phys,
+							    scp_mem_size);
+
+	dev_info(scp->dev,
+		 "virt:0x%llx - 0x%llx (0x%llx)\n",
+		(unsigned long long)scp_mem_base_virt,
+		(unsigned long long)(scp_mem_base_virt + scp_mem_size),
+		(unsigned long long)scp_mem_size);
+	for (id = 0; id < SCP_NUMS_MEM_ID; id++) {
+		scp_reserve_mblock[id].start_virt =
+			scp_mem_base_virt + accumlate_memory_size;
+		accumlate_memory_size += scp_reserve_mblock[id].size;
+	}
+	/* the reserved memory should be larger then expected memory
+	 * or scp_reserve_mblock does not match dts
+	 */
+	WARN_ON(accumlate_memory_size > scp_mem_size);
+#ifdef DEBUG
+	for (id = 0; id < NUMS_MEM_ID; id++) {
+		dev_info(scp->dev,
+			 "[mem_reserve-%d] phys:0x%llx,virt:0x%llx,size:0x%llx\n",
+			 id,
+			 scp_get_reserve_mem_phys(id),
+			 scp_get_reserve_mem_virt(id),
+			 scp_get_reserve_mem_size(id));
+	}
+#endif
+	return 0;
+}
+phys_addr_t scp_get_reserve_mem_phys(enum scp_reserve_mem_id_t id)
+{
+	if (id >= SCP_NUMS_MEM_ID) {
+		pr_err("[SCP] no reserve memory for %d", id);
+		return 0;
+	} else
+		return scp_reserve_mblock[id].start_phys;
+}
+EXPORT_SYMBOL_GPL(scp_get_reserve_mem_phys);
+
+phys_addr_t scp_get_reserve_mem_virt(enum scp_reserve_mem_id_t id)
+{
+	if (id >= SCP_NUMS_MEM_ID) {
+		pr_err("[SCP] no reserve memory for %d", id);
+		return 0;
+	} else
+		return scp_reserve_mblock[id].start_virt;
+}
+EXPORT_SYMBOL_GPL(scp_get_reserve_mem_virt);
+
+phys_addr_t scp_get_reserve_mem_size(enum scp_reserve_mem_id_t id)
+{
+	if (id >= SCP_NUMS_MEM_ID) {
+		pr_err("[SCP] no reserve memory for %d", id);
+		return 0;
+	} else
+		return scp_reserve_mblock[id].size;
+}
+EXPORT_SYMBOL_GPL(scp_get_reserve_mem_size);
+#endif
+
 static int scp_map_memory_region(struct mtk_scp *scp)
 {
 	struct device_node *node;
@@ -379,6 +511,10 @@ static int scp_map_memory_region(struct mtk_scp *scp)
 		return -EBUSY;
 	}
 
+#if SCP_RESERVED_MEM
+	scp_reserve_mem_init(scp);
+	scp_reserve_memory_ioremap(scp);
+#endif
 	return 0;
 }
 
diff --git a/include/linux/platform_data/mtk_scp.h b/include/linux/platform_data/mtk_scp.h
index b81ac5c7d320..96e56fdd0917 100644
--- a/include/linux/platform_data/mtk_scp.h
+++ b/include/linux/platform_data/mtk_scp.h
@@ -138,4 +138,28 @@ unsigned int scp_get_venc_hw_capa(struct platform_device *pdev);
 void *scp_mapping_dm_addr(struct platform_device *pdev,
 			  u32 mem_addr);
 
+#define SCP_RESERVED_MEM	(1)
+#if SCP_RESERVED_MEM
+/* scp reserve memory ID definition*/
+enum scp_reserve_mem_id_t {
+	SCP_ISP_MEM_ID,
+	SCP_ISP_MEM2_ID,
+	SCP_MDP_MEM_ID,
+	SCP_DIP_MEM_ID,
+	SCP_FD_MEM_ID,
+	SCP_NUMS_MEM_ID,
+};
+
+struct scp_reserve_mblock {
+	enum scp_reserve_mem_id_t num;
+	u64 start_phys;
+	u64 start_virt;
+	u64 size;
+};
+
+extern phys_addr_t scp_get_reserve_mem_phys(enum scp_reserve_mem_id_t id);
+extern phys_addr_t scp_get_reserve_mem_virt(enum scp_reserve_mem_id_t id);
+extern phys_addr_t scp_get_reserve_mem_size(enum scp_reserve_mem_id_t id);
+#endif
+
 #endif /* _MTK_SCP_H */
-- 
2.22.0.rc2.383.gf4fbbf30c2-goog
