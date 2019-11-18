Return-Path: <0101016e807856ae-faa669ed-5a8b-4850-b2a4-434659202a12-000000@us-west-2.amazonses.com>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 03/16] dt-bindings: remoteproc: qcom: Add Q6V5 Modem PIL binding for SC7180
Date: Mon, 18 Nov 2019 21:43:20 +0000
Message-ID: <0101016e807856ae-faa669ed-5a8b-4850-b2a4-434659202a12-000000@us-west-2.amazonses.com>
In-Reply-To: <20191118214250.14002-1-sibis@codeaurora.org>
References: <20191118214250.14002-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, jhugo@codeaurora.org, robh+dt@kernel.org, jonathan@marek.ca
Cc: ohad@wizery.com, mark.rutland@arm.com, p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add a new modem compatible string for Qualcomm SC7180 SoCs and introduce
the "qcom,halt-nav-regs" bindings needed by the modem sub-system running
on SC7180 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 .../bindings/remoteproc/qcom,q6v5.txt         | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index c416746f93cfd..88dfa3fc15f78 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -13,6 +13,7 @@ on the Qualcomm Hexagon core.
 		    "qcom,msm8974-mss-pil"
 		    "qcom,msm8996-mss-pil"
 		    "qcom,msm8998-mss-pil"
+		    "qcom,sc7180-mss-pil"
 		    "qcom,sdm845-mss-pil"
 
 - reg:
@@ -43,6 +44,7 @@ on the Qualcomm Hexagon core.
 		    must be "wdog", "fatal", "ready", "handover", "stop-ack"
 	qcom,msm8996-mss-pil:
 	qcom,msm8998-mss-pil:
+	qcom,sc7180-mss-pil:
 	qcom,sdm845-mss-pil:
 		    must be "wdog", "fatal", "ready", "handover", "stop-ack",
 		    "shutdown-ack"
@@ -75,6 +77,9 @@ on the Qualcomm Hexagon core.
 	qcom,msm8998-mss-pil:
 		    must be "iface", "bus", "mem", "xo", "gpll0_mss",
 		    "snoc_axi", "mnoc_axi", "qdss"
+	qcom,sc7180-mss-pil:
+		    must be "iface", "bus", "xo", "snoc_axi", "mnoc_axi",
+		    "mss_crypto", "mss_nav", "nav"
 	qcom,sdm845-mss-pil:
 		    must be "iface", "bus", "mem", "xo", "gpll0_mss",
 		    "snoc_axi", "mnoc_axi", "prng"
@@ -86,7 +91,7 @@ on the Qualcomm Hexagon core.
 		    reference to the list of 3 reset-controllers for the
 		    wcss sub-system
 		    reference to the list of 2 reset-controllers for the modem
-		    sub-system on SDM845 SoCs
+		    sub-system on SC7180, SDM845 SoCs
 
 - reset-names:
 	Usage: required
@@ -95,7 +100,7 @@ on the Qualcomm Hexagon core.
 		    must be "wcss_aon_reset", "wcss_reset", "wcss_q6_reset"
 		    for the wcss sub-system
 		    must be "mss_restart", "pdc_reset" for the modem
-		    sub-system on SDM845 SoCs
+		    sub-system on SC7180, SDM845 SoCs
 
 For the compatible strings below the following supplies are required:
   "qcom,q6v5-pil"
@@ -144,6 +149,7 @@ For the compatible string below the following supplies are required:
 	qcom,msm8996-mss-pil:
 	qcom,msm8998-mss-pil:
 		    must be "cx", "mx"
+	qcom,sc7180-mss-pil:
 	qcom,sdm845-mss-pil:
 		    must be "cx", "mx", "mss", "load_state"
 
@@ -165,6 +171,19 @@ For the compatible string below the following supplies are required:
 		    by the three offsets within syscon for q6, modem and nc
 		    halt registers.
 
+For the compatible strings below the following phandle references are required:
+  "qcom,sc7180-mss-pil"
+- qcom,halt-nav-regs:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: reference to a list of 2 phandles with one offset each for
+		    the modem sub-system running on SC7180 SoC. The first
+		    phandle reference is to the mss clock node followed by the
+		    offset within register space for nav halt register. The
+		    second phandle reference is to a syscon representing TCSR
+		    followed by the offset within syscon for conn_box_spare0
+		    register.
+
 = SUBNODES:
 The Hexagon node must contain two subnodes, named "mba" and "mpss" representing
 the memory regions used by the Hexagon firmware. Each sub-node must contain:
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
