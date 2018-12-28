Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 3/8] dt-bindings: remoteproc: qcom: Add missing clocks for MSM8996
Date: Sat, 29 Dec 2018 00:23:02 +0530
Message-Id: <20181228185307.25645-3-sibis@codeaurora.org>
In-Reply-To: <20181228185307.25645-1-sibis@codeaurora.org>
References: <20181228185307.25645-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org, dianders@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, evgreen@chromium.org, briannorris@chromium.org, sricharan@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add missing clock bindings for Q6V5 MSS on MSM8996 SoCs.

Fixes: 9f058fa2efb1 ("remoteproc: qcom: Add support for mss remoteproc
on msm8996")

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

v4:
  * Re-order clocks for consistency as suggested by Rob

v3:
  * Fixup dt-binding documentation as suggested by Doug

 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index d645c8db29fd..bba3d6be71c0 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -51,6 +51,9 @@ on the Qualcomm Hexagon core.
 	qcom,msm8916-mss-pil:
 	qcom,msm8974-mss-pil:
 		    must be "iface", "bus", "mem", "xo"
+	qcom,msm8996-mss-pil:
+		    must be "iface", "bus", "mem", "xo", "gpll0_mss",
+		    "snoc_axi", "mnoc_axi", "pnoc", "qdss"
 	qcom,sdm845-mss-pil:
 		    must be "iface", "bus", "mem", "xo", "gpll0_mss",
 		    "snoc_axi", "mnoc_axi", "prng"
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
