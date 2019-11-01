Return-Path: <jeffrey.l.hugo@gmail.com>
Return-Path: <jeffrey.l.hugo@gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom: Add Q6v5 Modem PIL binding for MSM8998
Date: Thu, 31 Oct 2019 19:44:35 -0700
Message-Id: <20191101024435.21975-1-jeffrey.l.hugo@gmail.com>
In-Reply-To: <20191101024301.21919-1-jeffrey.l.hugo@gmail.com>
References: <20191101024301.21919-1-jeffrey.l.hugo@gmail.com>
To: agross@kernel.org, ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Add new compatible string for Qualcomm MSM8998 SoCs.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 41ca5df5be5a..c416746f93cf 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -12,6 +12,7 @@ on the Qualcomm Hexagon core.
 		    "qcom,msm8916-mss-pil",
 		    "qcom,msm8974-mss-pil"
 		    "qcom,msm8996-mss-pil"
+		    "qcom,msm8998-mss-pil"
 		    "qcom,sdm845-mss-pil"
 
 - reg:
@@ -41,6 +42,7 @@ on the Qualcomm Hexagon core.
 	qcom,msm8974-mss-pil:
 		    must be "wdog", "fatal", "ready", "handover", "stop-ack"
 	qcom,msm8996-mss-pil:
+	qcom,msm8998-mss-pil:
 	qcom,sdm845-mss-pil:
 		    must be "wdog", "fatal", "ready", "handover", "stop-ack",
 		    "shutdown-ack"
@@ -70,6 +72,9 @@ on the Qualcomm Hexagon core.
 	qcom,msm8996-mss-pil:
 		    must be "iface", "bus", "mem", "xo", "gpll0_mss",
 		    "snoc_axi", "mnoc_axi", "pnoc", "qdss"
+	qcom,msm8998-mss-pil:
+		    must be "iface", "bus", "mem", "xo", "gpll0_mss",
+		    "snoc_axi", "mnoc_axi", "qdss"
 	qcom,sdm845-mss-pil:
 		    must be "iface", "bus", "mem", "xo", "gpll0_mss",
 		    "snoc_axi", "mnoc_axi", "prng"
@@ -137,6 +142,7 @@ For the compatible string below the following supplies are required:
 	qcom,msm8974-mss-pil:
 		    no power-domain names required
 	qcom,msm8996-mss-pil:
+	qcom,msm8998-mss-pil:
 		    must be "cx", "mx"
 	qcom,sdm845-mss-pil:
 		    must be "cx", "mx", "mss", "load_state"
-- 
2.17.1
