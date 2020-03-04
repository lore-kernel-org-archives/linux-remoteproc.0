Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 2/3] remoteproc: qcom_q6v5_mss: Validate each segment during loading
Date: Thu,  5 Mar 2020 01:17:28 +0530
Message-Id: <20200304194729.27979-3-sibis@codeaurora.org>
In-Reply-To: <20200304194729.27979-1-sibis@codeaurora.org>
References: <20200304194729.27979-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, mathieu.poirier@linaro.org, jeffrey.l.hugo@gmail.com, luca@z3ntu.xyz
Cc: agross@kernel.org, ohad@wizery.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Bjorn Andersson <bjorn.andersson@linaro.org>

The code used to sync with the MBA after each segment loaded and this is
still what's done downstream. So reduce the delta towards downstream by
switching to a model where the content is iteratively validated.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

V4:
 * Filter redundant hyp_assign requests to prevent errors/warnings
 * Dropping Jeff's and Luca's R-b/T-b due to minor changes
 * Fix misc check patch errors
 * Ignore two writel > 80 characters per line warnings as it affects
   readability

 drivers/remoteproc/qcom_q6v5_mss.c | 83 +++++++++++++++++++++---------
 1 file changed, 58 insertions(+), 25 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 9fed1b1c203d3..b8a922181de8a 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -379,23 +379,33 @@ static void q6v5_pds_disable(struct q6v5 *qproc, struct device **pds,
 }
 
 static int q6v5_xfer_mem_ownership(struct q6v5 *qproc, int *current_perm,
-				   bool remote_owner, phys_addr_t addr,
+				   bool local, bool remote, phys_addr_t addr,
 				   size_t size)
 {
-	struct qcom_scm_vmperm next;
+	struct qcom_scm_vmperm next[2];
+	int perms = 0;
 
 	if (!qproc->need_mem_protection)
 		return 0;
-	if (remote_owner && *current_perm == BIT(QCOM_SCM_VMID_MSS_MSA))
-		return 0;
-	if (!remote_owner && *current_perm == BIT(QCOM_SCM_VMID_HLOS))
+
+	if (local == !!(*current_perm & BIT(QCOM_SCM_VMID_HLOS)) &&
+	    remote == !!(*current_perm & BIT(QCOM_SCM_VMID_MSS_MSA)))
 		return 0;
 
-	next.vmid = remote_owner ? QCOM_SCM_VMID_MSS_MSA : QCOM_SCM_VMID_HLOS;
-	next.perm = remote_owner ? QCOM_SCM_PERM_RW : QCOM_SCM_PERM_RWX;
+	if (local) {
+		next[perms].vmid = QCOM_SCM_VMID_HLOS;
+		next[perms].perm = QCOM_SCM_PERM_RWX;
+		perms++;
+	}
+
+	if (remote) {
+		next[perms].vmid = QCOM_SCM_VMID_MSS_MSA;
+		next[perms].perm = QCOM_SCM_PERM_RW;
+		perms++;
+	}
 
 	return qcom_scm_assign_mem(addr, ALIGN(size, SZ_4K),
-				   current_perm, &next, 1);
+				   current_perm, next, perms);
 }
 
 static int q6v5_load(struct rproc *rproc, const struct firmware *fw)
@@ -801,7 +811,8 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
 
 	/* Hypervisor mapping to access metadata by modem */
 	mdata_perm = BIT(QCOM_SCM_VMID_HLOS);
-	ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, true, phys, size);
+	ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, false, true,
+				      phys, size);
 	if (ret) {
 		dev_err(qproc->dev,
 			"assigning Q6 access to metadata failed: %d\n", ret);
@@ -819,7 +830,8 @@ static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
 		dev_err(qproc->dev, "MPSS header authentication failed: %d\n", ret);
 
 	/* Metadata authentication done, remove modem access */
-	xferop_ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, false, phys, size);
+	xferop_ret = q6v5_xfer_mem_ownership(qproc, &mdata_perm, true, false,
+					     phys, size);
 	if (xferop_ret)
 		dev_warn(qproc->dev,
 			 "mdt buffer not reclaimed system may become unstable\n");
@@ -906,7 +918,7 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 	}
 
 	/* Assign MBA image access in DDR to q6 */
-	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true,
+	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false, true,
 				      qproc->mba_phys, qproc->mba_size);
 	if (ret) {
 		dev_err(qproc->dev,
@@ -943,8 +955,8 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
 
 reclaim_mba:
-	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false,
-						qproc->mba_phys,
+	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true,
+						false, qproc->mba_phys,
 						qproc->mba_size);
 	if (xfermemop_ret) {
 		dev_err(qproc->dev,
@@ -1014,7 +1026,7 @@ static void q6v5_mba_reclaim(struct q6v5 *qproc)
 	/* In case of failure or coredump scenario where reclaiming MBA memory
 	 * could not happen reclaim it here.
 	 */
-	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false,
+	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true, false,
 				      qproc->mba_phys,
 				      qproc->mba_size);
 	WARN_ON(ret);
@@ -1041,6 +1053,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 	phys_addr_t boot_addr;
 	phys_addr_t min_addr = PHYS_ADDR_MAX;
 	phys_addr_t max_addr = 0;
+	u32 code_length;
 	bool relocate = false;
 	char *fw_name;
 	size_t fw_name_len;
@@ -1095,9 +1108,19 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 	 * memory can be reclaimed only after MBA is loaded. For modem cold
 	 * boot this will be a nop
 	 */
-	q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, false,
+	q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, true, false,
 				qproc->mpss_phys, qproc->mpss_size);
 
+	/* Share ownership between Linux and MSS, during segment loading */
+	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, true, true,
+				      qproc->mpss_phys, qproc->mpss_size);
+	if (ret) {
+		dev_err(qproc->dev,
+			"assigning Q6 access to mpss memory failed: %d\n", ret);
+		ret = -EAGAIN;
+		goto release_firmware;
+	}
+
 	mpss_reloc = relocate ? min_addr : qproc->mpss_phys;
 	qproc->mpss_reloc = mpss_reloc;
 	/* Load firmware segments */
@@ -1146,10 +1169,25 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 			       phdr->p_memsz - phdr->p_filesz);
 		}
 		size += phdr->p_memsz;
+
+		code_length = readl(qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
+		if (!code_length) {
+			boot_addr = relocate ? qproc->mpss_phys : min_addr;
+			writel(boot_addr, qproc->rmb_base + RMB_PMI_CODE_START_REG);
+			writel(RMB_CMD_LOAD_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
+		}
+		writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
+
+		ret = readl(qproc->rmb_base + RMB_MBA_STATUS_REG);
+		if (ret < 0) {
+			dev_err(qproc->dev, "MPSS authentication failed: %d\n",
+				ret);
+			goto release_firmware;
+		}
 	}
 
 	/* Transfer ownership of modem ddr region to q6 */
-	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, true,
+	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, false, true,
 				      qproc->mpss_phys, qproc->mpss_size);
 	if (ret) {
 		dev_err(qproc->dev,
@@ -1158,11 +1196,6 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 		goto release_firmware;
 	}
 
-	boot_addr = relocate ? qproc->mpss_phys : min_addr;
-	writel(boot_addr, qproc->rmb_base + RMB_PMI_CODE_START_REG);
-	writel(RMB_CMD_LOAD_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
-	writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
-
 	ret = q6v5_rmb_mba_wait(qproc, RMB_MBA_AUTH_COMPLETE, 10000);
 	if (ret == -ETIMEDOUT)
 		dev_err(qproc->dev, "MPSS authentication timed out\n");
@@ -1192,7 +1225,7 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
 		if (!ret) {
 			/* Reset ownership back to Linux to copy segments */
 			ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm,
-						      false,
+						      true, false,
 						      qproc->mpss_phys,
 						      qproc->mpss_size);
 		}
@@ -1210,7 +1243,7 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
 		if (qproc->dump_mba_loaded) {
 			/* Try to reset ownership back to Q6 */
 			q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm,
-						true,
+						false, true,
 						qproc->mpss_phys,
 						qproc->mpss_size);
 			q6v5_mba_reclaim(qproc);
@@ -1240,8 +1273,8 @@ static int q6v5_start(struct rproc *rproc)
 		goto reclaim_mpss;
 	}
 
-	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false,
-						qproc->mba_phys,
+	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true,
+						false, qproc->mba_phys,
 						qproc->mba_size);
 	if (xfermemop_ret)
 		dev_err(qproc->dev,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
