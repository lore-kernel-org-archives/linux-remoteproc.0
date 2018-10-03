Return-Path: <aneela@codeaurora.org>
From: Arun Kumar Neelakantam <aneela@codeaurora.org>
Subject: [PATCH] rpmsg: glink: smem: Support rx peak for size less than 4 bytes
Date: Wed,  3 Oct 2018 17:08:20 +0530
Message-Id: <1538566700-29469-1-git-send-email-aneela@codeaurora.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org, sricharan@codeaurora.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Arun Kumar Neelakantam <aneela@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

The current rx peak function fails to read the data if size is
less than 4bytes.

Use memcpy_fromio to support data reads of size less than 4 bytes.

Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
---
 drivers/rpmsg/qcom_glink_smem.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 2b5cf27..7b65443 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -89,15 +89,11 @@ static void glink_smem_rx_peak(struct qcom_glink_pipe *np,
 		tail -= pipe->native.length;
 
 	len = min_t(size_t, count, pipe->native.length - tail);
-	if (len) {
-		__ioread32_copy(data, pipe->fifo + tail,
-				len / sizeof(u32));
-	}
+	if (len)
+		memcpy_fromio(data, pipe->fifo + tail, len);
 
-	if (len != count) {
-		__ioread32_copy(data + len, pipe->fifo,
-				(count - len) / sizeof(u32));
-	}
+	if (len != count)
+		memcpy_fromio(data + len, pipe->fifo, (count - len));
 }
 
 static void glink_smem_rx_advance(struct qcom_glink_pipe *np,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
