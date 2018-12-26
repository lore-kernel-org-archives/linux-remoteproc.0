Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 2/8] dt-bindings: remoteproc: qcom: Add missing clocks for SDM845
Date: Wed, 26 Dec 2018 18:22:23 +0530
Message-Id: <20181226125229.20149-2-sibis@codeaurora.org>
In-Reply-To: <20181226125229.20149-1-sibis@codeaurora.org>
References: <20181226125229.20149-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org, dianders@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, evgreen@chromium.org, briannorris@chromium.org, sricharan@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add missing clock bindings for Q6V5 MSS on SDM845 SoCs.

Fixes: fb22022ff63d ("dt-bindings: remoteproc: Add Q6v5 Modem PIL
binding for SDM845")

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

v3:
  * Fixup dt-binding documentation as suggested by Doug

 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 9ff5b0309417..20dd19f9ed99 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -39,13 +39,21 @@ on the Qualcomm Hexagon core.
 - clocks:
 	Usage: required
 	Value type: <phandle>
-	Definition: reference to the iface, bus and mem clocks to be held on
-		    behalf of the booting of the Hexagon core
+	Definition: reference to the clocks that match clock-names
 
 - clock-names:
 	Usage: required
 	Value type: <stringlist>
-	Definition: must be "iface", "bus", "mem"
+	Definition: The clocks needed depend on the compatible string:
+	qcom,ipq8074-wcss-pil:
+		    no clock names required
+	qcom,q6v5-pil:
+	qcom,msm8916-mss-pil:
+	qcom,msm8974-mss-pil:
+		    must be "iface", "bus", "mem", "xo"
+	qcom,sdm845-mss-pil:
+		    must be "xo", "prng", "iface", "bus", "mem", "gpll0_mss",
+		    "snoc_axi", "mnoc_axi"
 
 - resets:
 	Usage: required
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
