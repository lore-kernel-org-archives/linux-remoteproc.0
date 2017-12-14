Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] rpmsg: glink: smem: Ensure ordering during tx
Date: Thu, 14 Dec 2017 12:15:46 -0800
Message-Id: <20171214201546.21942-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Arun Kumar Neelakantam <aneela@codeaurora.org>, Chris Lew <clew@codeaurora.org>, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Ensure the ordering of the fifo write and the update of the write index,
so that the index is not updated before the data has landed in the fifo.

Reported-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/qcom_glink_smem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 057528e23d3a..892f2b92a4d8 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -183,6 +183,9 @@ static void glink_smem_tx_write(struct qcom_glink_pipe *glink_pipe,
 	if (head >= pipe->native.length)
 		head -= pipe->native.length;
 
+	/* Ensure ordering of fifo and head update */
+	wmb();
+
 	*pipe->head = cpu_to_le32(head);
 }
 
-- 
2.15.0
