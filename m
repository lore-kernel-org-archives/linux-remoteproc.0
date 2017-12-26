Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 2/4] remoteproc: Rename "load_rsc_table" to "parse_fw"
Date: Tue, 26 Dec 2017 12:38:30 -0800
Message-Id: <20171226203832.14928-3-bjorn.andersson@linaro.org>
In-Reply-To: <20171226203832.14928-1-bjorn.andersson@linaro.org>
References: <20171226203832.14928-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Suman Anna <s-anna@ti.com>, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

The resource table is just one possible source of information that can
be extracted from the firmware file. Generalize this interface to allow
drivers to override this with parsers of other types of information.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- New patch

 drivers/remoteproc/remoteproc_core.c     | 6 +++---
 drivers/remoteproc/remoteproc_internal.h | 7 +++----
 include/linux/remoteproc.h               | 2 +-
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 5af7547b9d8d..6a72daa94673 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -944,8 +944,8 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 
 	rproc->bootaddr = rproc_get_boot_addr(rproc, fw);
 
-	/* load resource table */
-	ret = rproc_load_rsc_table(rproc, fw);
+	/* parse firmware resources */
+	ret = rproc_parse_fw(rproc, fw);
 	if (ret)
 		goto disable_iommu;
 
@@ -1555,7 +1555,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	/* Default to ELF loader if no load function is specified */
 	if (!rproc->ops->load) {
 		rproc->ops->load = rproc_elf_load_segments;
-		rproc->ops->load_rsc_table = rproc_elf_load_rsc_table;
+		rproc->ops->parse_fw = rproc_elf_load_rsc_table;
 		rproc->ops->find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table;
 		rproc->ops->sanity_check = rproc_elf_sanity_check;
 		rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 55a2950c5cb7..7570beb035b5 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -88,11 +88,10 @@ int rproc_load_segments(struct rproc *rproc, const struct firmware *fw)
 	return -EINVAL;
 }
 
-static inline int rproc_load_rsc_table(struct rproc *rproc,
-				       const struct firmware *fw)
+static inline int rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 {
-	if (rproc->ops->load_rsc_table)
-		return rproc->ops->load_rsc_table(rproc, fw);
+	if (rproc->ops->parse_fw)
+		return rproc->ops->parse_fw(rproc, fw);
 
 	return 0;
 }
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index de6e20a3f061..dc93ac3d1692 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -343,7 +343,7 @@ struct rproc_ops {
 	int (*stop)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
 	void * (*da_to_va)(struct rproc *rproc, u64 da, int len);
-	int (*load_rsc_table)(struct rproc *rproc, const struct firmware *fw);
+	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
 	struct resource_table *(*find_loaded_rsc_table)(
 				struct rproc *rproc, const struct firmware *fw);
 	int (*load)(struct rproc *rproc, const struct firmware *fw);
-- 
2.15.0
