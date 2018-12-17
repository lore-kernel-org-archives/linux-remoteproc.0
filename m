Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 3/7] dt-bindings: remoteproc: qcom: Fixup regulator dependencies
Date: Mon, 17 Dec 2018 15:37:20 +0530
Message-Id: <20181217100724.4593-3-sibis@codeaurora.org>
In-Reply-To: <20181217100724.4593-1-sibis@codeaurora.org>
References: <20181217100724.4593-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org, dianders@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, evgreen@chromium.org, briannorris@chromium.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Fixup regulator supply dependencies for Q6V5 MSS on MSM996 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 780adc043b37..98894e6ad456 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -76,7 +76,9 @@ on the Qualcomm Hexagon core.
 	Usage: required
 	Value type: <phandle>
 	Definition: reference to the regulators to be held on behalf of the
-		    booting of the Hexagon core
+		    booting of the Hexagon core on MSM8916 SoCs
+		    reference to the pll-supply regulator to be held on behalf
+		    of the booting of the Hexagon core on MSM8996 SoCs
 
 - qcom,smem-states:
 	Usage: required
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
