Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21]:56606
        "EHLO a27-21.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726739AbfKRVnz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Nov 2019 16:43:55 -0500
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 10/16] dt-bindings: remoteproc: qcom: SM8150 Add ADSP, CDSP, MPSS and SLPI support
Date: Mon, 18 Nov 2019 21:43:54 +0000
Message-ID: <0101016e8078dad4-458c8501-93fd-4daa-8938-d01027f248cb-000000@us-west-2.amazonses.com>
In-Reply-To: <20191118214250.14002-1-sibis@codeaurora.org>
References: <20191118214250.14002-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, jhugo@codeaurora.org, robh+dt@kernel.org, jonathan@marek.ca
Cc: ohad@wizery.com, mark.rutland@arm.com, p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add ADSP, CDSP, MPSS and SLPI compatibles for SM8150 SoC.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 .../devicetree/bindings/remoteproc/qcom,adsp.txt   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
index 34dc1d94a78c7..9938918b2fea3 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
@@ -17,6 +17,10 @@ on the Qualcomm ADSP Hexagon core.
 		    "qcom,qcs404-wcss-pas"
 		    "qcom,sdm845-adsp-pas"
 		    "qcom,sdm845-cdsp-pas"
+		    "qcom,sm8150-adsp-pas"
+		    "qcom,sm8150-cdsp-pas"
+		    "qcom,sm8150-mpss-pas"
+		    "qcom,sm8150-slpi-pas"
 
 - interrupts-extended:
 	Usage: required
@@ -37,8 +41,12 @@ on the Qualcomm ADSP Hexagon core.
 	qcom,qcs404-cdsp-pas:
 	qcom,sdm845-adsp-pas:
 	qcom,sdm845-cdsp-pas:
+	qcom,sm8150-adsp-pas:
+	qcom,sm8150-cdsp-pas:
+	qcom,sm8150-slpi-pas:
 		    must be "wdog", "fatal", "ready", "handover", "stop-ack"
 	qcom,qcs404-wcss-pas:
+	qcom,sm8150-mpss-pas:
 		    must be "wdog", "fatal", "ready", "handover", "stop-ack",
 		    "shutdown-ack"
 
@@ -95,7 +103,13 @@ on the Qualcomm ADSP Hexagon core.
 		    must be "mx"
 	qcom,sdm845-adsp-pas:
 	qcom,sdm845-cdsp-pas:
+	qcom,sm8150-adsp-pas:
+	qcom,sm8150-cdsp-pas:
 		    must be "cx", "load_state"
+	qcom,sm8150-mpss-pas:
+		    must be "cx", "load_state", "mss"
+	qcom,sm8150-slpi-pas:
+		    must be "lcx", "lmx", "load_state"
 
 - memory-region:
 	Usage: required
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
