Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 1/8] dt-bindings: soc: qcom: Add remote-pid binding for GLINK SMEM
Date: Sat, 29 Dec 2018 00:23:00 +0530
Message-Id: <20181228185307.25645-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org, dianders@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, evgreen@chromium.org, briannorris@chromium.org, sricharan@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add missing qcom,remote-pid dt binding required for GLINK SMEM
which specifies the remote endpoint of the GLINK edge.

Fixes: 2b41d6c8e696 ("dt-bindings: soc: qcom: Extend GLINK to cover
SMEM")

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
Reviewed-by: Doug Anderson <dianders@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---

v3:
  * Fixed typo

 Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
index 0b8cc533ca83..587bb1ddc8cc 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
@@ -21,6 +21,11 @@ edge.
 	Definition: should specify the IRQ used by the remote processor to
 		    signal this processor about communication related events
 
+- qcom,remote-pid:
+	Usage: required for glink-smem
+	Value type: <u32>
+	Definition: specifies the identifier of the remote endpoint of this edge
+
 - qcom,rpm-msg-ram:
 	Usage: required for glink-rpm
 	Value type: <prop-encoded-array>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
