Return-Path: <akdwived@codeaurora.org>
From: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH v8 2/4] remoteproc: qcom: refactor mss fw image loading sequence
Date: Tue, 24 Oct 2017 21:22:25 +0530
Message-Id: <1508860347-25181-3-git-send-email-akdwived@codeaurora.org>
In-Reply-To: <1508860347-25181-1-git-send-email-akdwived@codeaurora.org>
References: <1508860347-25181-1-git-send-email-akdwived@codeaurora.org>
To: bjorn.andersson@linaro.org
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch refactor code to first load all firmware blobs
and then update modem proc to authenticate and boot fw.

Tested-and-acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 2d3d5ac..39b9ee4 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -504,7 +504,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 	bool relocate = false;
 	char seg_name[10];
 	ssize_t offset;
-	size_t size;
+	size_t size = 0;
 	void *ptr;
 	int ret;
 	int i;
@@ -542,7 +542,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 	}
 
 	mpss_reloc = relocate ? min_addr : qproc->mpss_phys;
-
+	/* Load firmware segments */
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
 
@@ -575,18 +575,15 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 			memset(ptr + phdr->p_filesz, 0,
 			       phdr->p_memsz - phdr->p_filesz);
 		}
-
-		size = readl(qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
-		if (!size) {
-			boot_addr = relocate ? qproc->mpss_phys : min_addr;
-			writel(boot_addr, qproc->rmb_base + RMB_PMI_CODE_START_REG);
-			writel(RMB_CMD_LOAD_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
-		}
-
 		size += phdr->p_memsz;
-		writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
 	}
 
+	/* Transfer ownership of modem ddr region with q6*/
+	boot_addr = relocate ? qproc->mpss_phys : min_addr;
+	writel(boot_addr, qproc->rmb_base + RMB_PMI_CODE_START_REG);
+	writel(RMB_CMD_LOAD_READY, qproc->rmb_base + RMB_MBA_COMMAND_REG);
+	writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
+
 	ret = q6v5_rmb_mba_wait(qproc, RMB_MBA_AUTH_COMPLETE, 10000);
 	if (ret == -ETIMEDOUT)
 		dev_err(qproc->dev, "MPSS authentication timed out\n");
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
