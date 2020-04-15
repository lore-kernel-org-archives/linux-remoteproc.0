Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 1/2] remoteproc: qcom_q6v5_mss: map/unmap mpss segments before/after use
Date: Wed, 15 Apr 2020 12:46:18 +0530
Message-Id: <20200415071619.6052-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org
Cc: agross@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, ohad@wizery.com, evgreen@chromium.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

The application processor accessing the mpss region when the Q6 modem is
running will lead to an XPU violation. Fix this by un-mapping the mpss
segments post copy during mpss authentication and coredumps.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

V2:
 * use ioremap_wc/iounmap instead of the devm_ variants
 * with mpss_region no longer relevant leave rproc_da_to_va unused

 drivers/remoteproc/qcom_q6v5_mss.c | 31 +++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index ce49c3236ff7c..b781fc8de3597 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1156,7 +1156,13 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 			goto release_firmware;
 		}
 
-		ptr = qproc->mpss_region + offset;
+		ptr = ioremap_wc(qproc->mpss_phys + offset, phdr->p_memsz);
+		if (!ptr) {
+			dev_err(qproc->dev,
+				"unable to map memory region: %pa+%zx-%x\n",
+				&qproc->mpss_phys, offset, phdr->p_memsz);
+			goto release_firmware;
+		}
 
 		if (phdr->p_filesz && phdr->p_offset < fw->size) {
 			/* Firmware is large enough to be non-split */
@@ -1165,6 +1171,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 					"failed to load segment %d from truncated file %s\n",
 					i, fw_name);
 				ret = -EINVAL;
+				iounmap(ptr);
 				goto release_firmware;
 			}
 
@@ -1175,6 +1182,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 			ret = request_firmware(&seg_fw, fw_name, qproc->dev);
 			if (ret) {
 				dev_err(qproc->dev, "failed to load %s\n", fw_name);
+				iounmap(ptr);
 				goto release_firmware;
 			}
 
@@ -1187,6 +1195,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 			memset(ptr + phdr->p_filesz, 0,
 			       phdr->p_memsz - phdr->p_filesz);
 		}
+		iounmap(ptr);
 		size += phdr->p_memsz;
 
 		code_length = readl(qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
@@ -1236,7 +1245,8 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
 	int ret = 0;
 	struct q6v5 *qproc = rproc->priv;
 	unsigned long mask = BIT((unsigned long)segment->priv);
-	void *ptr = rproc_da_to_va(rproc, segment->da, segment->size);
+	int offset = segment->da - qproc->mpss_reloc;
+	void *ptr = NULL;
 
 	/* Unlock mba before copying segments */
 	if (!qproc->dump_mba_loaded) {
@@ -1250,10 +1260,15 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
 		}
 	}
 
-	if (!ptr || ret)
-		memset(dest, 0xff, segment->size);
-	else
+	if (!ret)
+		ptr = ioremap_wc(qproc->mpss_phys + offset, segment->size);
+
+	if (ptr) {
 		memcpy(dest, ptr, segment->size);
+		iounmap(ptr);
+	} else {
+		memset(dest, 0xff, segment->size);
+	}
 
 	qproc->dump_segment_mask |= mask;
 
@@ -1595,12 +1610,6 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
 
 	qproc->mpss_phys = qproc->mpss_reloc = r.start;
 	qproc->mpss_size = resource_size(&r);
-	qproc->mpss_region = devm_ioremap_wc(qproc->dev, qproc->mpss_phys, qproc->mpss_size);
-	if (!qproc->mpss_region) {
-		dev_err(qproc->dev, "unable to map memory region: %pa+%zx\n",
-			&r.start, qproc->mpss_size);
-		return -EBUSY;
-	}
 
 	return 0;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
