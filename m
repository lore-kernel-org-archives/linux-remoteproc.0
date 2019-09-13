Return-Path: <gokulsri@qualcomm.com>
From: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Subject: [PATCH V2 10/12] dt-bindings: firmware: qcom: Add compatible for IPQ8074 SoC
Date: Fri, 13 Sep 2019 17:26:09 +0530
Message-Id: <1568375771-22933-11-git-send-email-gokulsri@codeaurora.org>
In-Reply-To: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org>
References: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org>
To: gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org, david.brown@linaro.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com, robh+dt@kernel.org, sricharan@codeaurora.org, nprakash@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Add compatible for IPQ8074 support.
This does not need clocks for scm calls.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
index 41f133a..3b153c1 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
@@ -17,6 +17,7 @@ Required properties:
  * "qcom,scm-msm8998"
  * "qcom,scm-ipq4019"
  * "qcom,scm-sdm845"
+ * "qcom,scm-ipq8074"
  and:
  * "qcom,scm"
 - clocks: Specifies clocks needed by the SCM interface, if any:
-- 
1.9.1
