Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 4/7] dt-bindings: remoteproc: qcom: Add power-domain bindings for Q6V5
Date: Mon, 17 Dec 2018 15:37:21 +0530
Message-Id: <20181217100724.4593-4-sibis@codeaurora.org>
In-Reply-To: <20181217100724.4593-1-sibis@codeaurora.org>
References: <20181217100724.4593-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org, dianders@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, evgreen@chromium.org, briannorris@chromium.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add power-domain bindings for Q6V5 MSS on MSM8996 and SDM845 SoCs.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

v2:
  * Add load_state power-domain
  * List cx and mx power-domains for MSM8996

 .../devicetree/bindings/remoteproc/qcom,q6v5.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 98894e6ad456..50695cd86397 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -80,6 +80,22 @@ on the Qualcomm Hexagon core.
 		    reference to the pll-supply regulator to be held on behalf
 		    of the booting of the Hexagon core on MSM8996 SoCs
 
+- power-domains:
+	Usage: required
+	Value type: <phandle>
+	Definition: reference to the list of 2 power-domains for the modem
+		    sub-system on MSM8996 SoCs
+		    reference to the list of 4 power-domains for the modem
+		    sub-system on SDM845 SoCs
+
+- power-domain-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be "cx", "mx" for the modem sub-system on MSM8996
+		    SoCs
+		    must be "cx", "mx", "mss", "load_state" for the modem
+		    sub-system on SDM845 SoCs
+
 - qcom,smem-states:
 	Usage: required
 	Value type: <phandle>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
