Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 3/7] dt-bindings: remoteproc: qcom: Use memory-region to reference memory
Date: Tue, 21 Apr 2020 20:02:24 +0530
Message-Id: <20200421143228.8981-4-sibis@codeaurora.org>
In-Reply-To: <20200421143228.8981-1-sibis@codeaurora.org>
References: <20200421143228.8981-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc: agross@kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, ohad@wizery.com, mka@chromium.org, dianders@chromium.org, devicetree@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Use memory-region property to reference mba and mpss memory regions.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index bffddd15eb910..1f9a62e13ebe0 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -102,6 +102,14 @@ on the Qualcomm Hexagon core.
 		    must be "mss_restart", "pdc_reset" for the modem
 		    sub-system on SC7180, SDM845 SoCs
 
+For devices where the mba and mpss sub-nodes are not specified, mba/mpss region
+should be referenced as follows:
+- memory-region:
+	Usage: required
+	Value type: <phandle>
+	Definition: reference to the reserved-memory for the mba region followed
+		    by the mpss region
+
 For the compatible strings below the following supplies are required:
   "qcom,q6v5-pil"
   "qcom,msm8916-mss-pil",
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
