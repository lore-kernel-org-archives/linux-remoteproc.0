Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] remoteproc: qcom: mdt_loader: Use signed type for offset
Date: Wed, 15 Feb 2017 14:00:41 -0800
Message-Id: <20170215220041.3077-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, Stanimir Varbanov <stanimir.varbanov@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

In the transition from using rproc_da_to_va(), the type of the load
offset became unsigned. This causes the subsequent check to let negative
values less than p_memsz + mem_size through and we write outside of the
buffer.

Change the type back to a signed value to catch this.

Fixes: 7f0dd07a9b29 ("remoteproc: qcom: mdt_loader: Refactor MDT loader")
Fixes: e7fd25226295 ("remoteproc: qcom: q6v5: Decouple driver from MDT loader")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Reported-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 2 +-
 drivers/soc/qcom/mdt_loader.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 26446eb08bd8..8fd697a3cf8f 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -502,7 +502,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 	phys_addr_t max_addr = 0;
 	bool relocate = false;
 	char seg_name[10];
-	size_t offset;
+	ssize_t offset;
 	size_t size;
 	void *ptr;
 	int ret;
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 98b2373c3a97..bd63df0d14e0 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -98,7 +98,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	phys_addr_t min_addr = (phys_addr_t)ULLONG_MAX;
 	phys_addr_t max_addr = 0;
 	size_t fw_name_len;
-	size_t offset;
+	ssize_t offset;
 	char *fw_name;
 	bool relocate = false;
 	void *ptr;
-- 
2.11.0
