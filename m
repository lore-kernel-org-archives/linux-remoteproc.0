Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 4/7] remoteproc: qcom_q6v5_mss: Extract mba/mpss from memory-region
Date: Tue, 21 Apr 2020 20:02:25 +0530
Message-Id: <20200421143228.8981-5-sibis@codeaurora.org>
In-Reply-To: <20200421143228.8981-1-sibis@codeaurora.org>
References: <20200421143228.8981-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc: agross@kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, ohad@wizery.com, mka@chromium.org, dianders@chromium.org, devicetree@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

In the absence of mba and mpss sub-child extract the mba/mpss regions
from the memory-region property.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 3a7352776a319..5c8d04c51af71 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1503,8 +1503,17 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
 	struct resource r;
 	int ret;
 
+	/*
+	 * In the absence of mba/mpss sub-child, extract the mba and mpss
+	 * reserved memory regions from device's memory-region property.
+	 */
 	child = of_get_child_by_name(qproc->dev->of_node, "mba");
-	node = of_parse_phandle(child, "memory-region", 0);
+	if (!child)
+		node = of_parse_phandle(qproc->dev->of_node,
+					"memory-region", 0);
+	else
+		node = of_parse_phandle(child, "memory-region", 0);
+
 	ret = of_address_to_resource(node, 0, &r);
 	if (ret) {
 		dev_err(qproc->dev, "unable to resolve mba region\n");
@@ -1521,8 +1530,14 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
 		return -EBUSY;
 	}
 
-	child = of_get_child_by_name(qproc->dev->of_node, "mpss");
-	node = of_parse_phandle(child, "memory-region", 0);
+	if (!child) {
+		node = of_parse_phandle(qproc->dev->of_node,
+					"memory-region", 1);
+	} else {
+		child = of_get_child_by_name(qproc->dev->of_node, "mpss");
+		node = of_parse_phandle(child, "memory-region", 0);
+	}
+
 	ret = of_address_to_resource(node, 0, &r);
 	if (ret) {
 		dev_err(qproc->dev, "unable to resolve mpss region\n");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
