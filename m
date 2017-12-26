Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 4/4] remoteproc: qcom: Register segments for core dump
Date: Tue, 26 Dec 2017 12:38:32 -0800
Message-Id: <20171226203832.14928-5-bjorn.andersson@linaro.org>
In-Reply-To: <20171226203832.14928-1-bjorn.andersson@linaro.org>
References: <20171226203832.14928-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Suman Anna <s-anna@ti.com>, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Sarangdhar Joshi <spjoshi@codeaurora.org>

Register MDT segments with the remoteproc core dump functionality in
order to include them in a core dump, in case of a recovery of the remote
processor.

Signed-off-by: Sarangdhar Joshi <spjoshi@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_adsp_pil.c |  1 +
 drivers/remoteproc/qcom_common.c   | 44 ++++++++++++++++++++++++++++++++++++++
 drivers/remoteproc/qcom_common.h   |  2 ++
 drivers/remoteproc/qcom_wcnss.c    |  1 +
 4 files changed, 48 insertions(+)

diff --git a/drivers/remoteproc/qcom_adsp_pil.c b/drivers/remoteproc/qcom_adsp_pil.c
index 833763aa3f2a..af12cdd45b71 100644
--- a/drivers/remoteproc/qcom_adsp_pil.c
+++ b/drivers/remoteproc/qcom_adsp_pil.c
@@ -179,6 +179,7 @@ static const struct rproc_ops adsp_ops = {
 	.start = adsp_start,
 	.stop = adsp_stop,
 	.da_to_va = adsp_da_to_va,
+	.parse_fw = qcom_register_dump_segments,
 	.load = adsp_load,
 };
 
diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 6eb9161f80b3..f9a0701c94e7 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -22,6 +22,7 @@
 #include <linux/remoteproc.h>
 #include <linux/rpmsg/qcom_glink.h>
 #include <linux/rpmsg/qcom_smd.h>
+#include <linux/soc/qcom/mdt_loader.h>
 
 #include "remoteproc_internal.h"
 #include "qcom_common.h"
@@ -79,6 +80,49 @@ void qcom_remove_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glin
 }
 EXPORT_SYMBOL_GPL(qcom_remove_glink_subdev);
 
+/**
+ * qcom_register_dump_segments() - register segments for coredump
+ * @rproc:	remoteproc handle
+ * @fw:		firmware header
+ *
+ * Register all segments of the ELF in the remoteproc coredump segment list
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int qcom_register_dump_segments(struct rproc *rproc,
+				const struct firmware *fw)
+{
+	const struct elf32_phdr *phdrs;
+	const struct elf32_phdr *phdr;
+	const struct elf32_hdr *ehdr;
+	int ret;
+	int i;
+
+	ehdr = (struct elf32_hdr *)fw->data;
+	phdrs = (struct elf32_phdr *)(ehdr + 1);
+
+	for (i = 0; i < ehdr->e_phnum; i++) {
+		phdr = &phdrs[i];
+
+		if (phdr->p_type != PT_LOAD)
+			continue;
+
+		if ((phdr->p_flags & QCOM_MDT_TYPE_MASK) == QCOM_MDT_TYPE_HASH)
+			continue;
+
+		if (!phdr->p_memsz)
+			continue;
+
+		ret = rproc_coredump_add_segment(rproc, phdr->p_paddr,
+						 phdr->p_memsz);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_register_dump_segments);
+
 static int smd_subdev_probe(struct rproc_subdev *subdev)
 {
 	struct qcom_rproc_subdev *smd = to_smd_subdev(subdev);
diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
index 728be9834d8b..7e614520fb69 100644
--- a/drivers/remoteproc/qcom_common.h
+++ b/drivers/remoteproc/qcom_common.h
@@ -30,6 +30,8 @@ struct qcom_rproc_ssr {
 void qcom_add_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink);
 void qcom_remove_glink_subdev(struct rproc *rproc, struct qcom_rproc_glink *glink);
 
+int qcom_register_dump_segments(struct rproc *rproc, const struct firmware *fw);
+
 void qcom_add_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd);
 void qcom_remove_smd_subdev(struct rproc *rproc, struct qcom_rproc_subdev *smd);
 
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 599c1aa73b7f..e9f9ba4c584d 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -309,6 +309,7 @@ static const struct rproc_ops wcnss_ops = {
 	.start = wcnss_start,
 	.stop = wcnss_stop,
 	.da_to_va = wcnss_da_to_va,
+	.parse_fw = qcom_register_dump_segments,
 	.load = wcnss_load,
 };
 
-- 
2.15.0
