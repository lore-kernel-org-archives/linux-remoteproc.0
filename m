Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 3/8] dt-bindings: remoteproc: qcom: Add missing clocks for MSM8996
Date: Wed, 26 Dec 2018 18:22:24 +0530
Message-Id: <20181226125229.20149-3-sibis@codeaurora.org>
In-Reply-To: <20181226125229.20149-1-sibis@codeaurora.org>
References: <20181226125229.20149-1-sibis@codeaurora.org>
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

v3:
  * Fixup dt-binding documentation as suggested by Doug

 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 20dd19f9ed99..af8788783e2b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -51,6 +51,9 @@ on the Qualcomm Hexagon core.
 	qcom,msm8916-mss-pil:
 	qcom,msm8974-mss-pil:
 		    must be "iface", "bus", "mem", "xo"
+	qcom,msm8996-mss-pil:
+		    must be "xo", "pnoc", "qdss", "iface", "bus", "mem",
+		    "gpll0_mss_clk", "snoc_axi", "mnoc_axi"
 	qcom,sdm845-mss-pil:
 		    must be "xo", "prng", "iface", "bus", "mem", "gpll0_mss",
 		    "snoc_axi", "mnoc_axi"
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
