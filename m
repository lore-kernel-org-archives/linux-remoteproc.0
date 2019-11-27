Return-Path: <gokulsri@qualcomm.com>
From: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Subject: [PATCH V3 08/10] dt-bindings: firmware: qcom: Add compatible for IPQ8074 SoC
Date: Wed, 27 Nov 2019 20:42:52 +0530
Message-Id: <1574867574-2216-9-git-send-email-gokulsri@codeaurora.org>
In-Reply-To: <1574867574-2216-1-git-send-email-gokulsri@codeaurora.org>
References: <1574867574-2216-1-git-send-email-gokulsri@codeaurora.org>
To: gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org, david.brown@linaro.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com, robh+dt@kernel.org, sricharan@codeaurora.org, nprakash@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Add compatible for IPQ8074 support.
This does not need clocks for scm calls.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.txt b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
index 3f29ea0..3c5d37c 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.txt
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.txt
@@ -10,6 +10,7 @@ Required properties:
  * "qcom,scm-apq8064"
  * "qcom,scm-apq8084"
  * "qcom,scm-ipq4019"
+ * "qcom,scm-ipq8074"
  * "qcom,scm-msm8660"
  * "qcom,scm-msm8916"
  * "qcom,scm-msm8960"
-- 
1.9.1
