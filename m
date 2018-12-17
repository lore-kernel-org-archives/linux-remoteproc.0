Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 2/7] dt-bindings: remoteproc: qcom: Add clock bindings for Q6V5
Date: Mon, 17 Dec 2018 15:37:19 +0530
Message-Id: <20181217100724.4593-2-sibis@codeaurora.org>
In-Reply-To: <20181217100724.4593-1-sibis@codeaurora.org>
References: <20181217100724.4593-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org, dianders@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, evgreen@chromium.org, briannorris@chromium.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add missing clock bindings for Q6V5 MSS on SDM845 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt       | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 9ff5b0309417..780adc043b37 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -39,13 +39,17 @@ on the Qualcomm Hexagon core.
 - clocks:
 	Usage: required
 	Value type: <phandle>
-	Definition: reference to the iface, bus and mem clocks to be held on
-		    behalf of the booting of the Hexagon core
+	Definition: reference to the list of 4 clocks for the modem sub-system
+		    reference to the list of 8 clocks for the modem sub-system
+		    on SDM845 SoCs
 
 - clock-names:
 	Usage: required
 	Value type: <stringlist>
-	Definition: must be "iface", "bus", "mem"
+	Definition: must be "iface", "bus", "mem", "xo" for the modem sub-system
+		    must be "iface", "bus", "mem", "gpll0_mss", "snoc_axi",
+		    "mnoc_axi", "prng", "xo" for the modem sub-system on SDM845
+		    SoCs
 
 - resets:
 	Usage: required
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
