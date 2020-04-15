Return-Path: <linux-arm-msm-owner@vger.kernel.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom: Replace halt-nav with spare-regs
Date: Wed, 15 Apr 2020 20:21:09 +0530
Message-Id: <20200415145110.20624-2-sibis@codeaurora.org>
In-Reply-To: <20200415145110.20624-1-sibis@codeaurora.org>
References: <20200415145110.20624-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
To: bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc: agross@kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, ohad@wizery.com, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

7C retail devices using MSA based boot will result in a fuse combination
which will prevent accesses to MSS PERPH register space where the mpss
clocks and halt-nav reside. However accesses to conn_box_spare0 in TCSR
register space is still permitted so rename the binding appropriately to
qcom,spare-regs and drop all accesses to the MPSS PERPH register space.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index 88dfa3fc15f78..607957ad32e7b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -79,7 +79,7 @@ on the Qualcomm Hexagon core.
 		    "snoc_axi", "mnoc_axi", "qdss"
 	qcom,sc7180-mss-pil:
 		    must be "iface", "bus", "xo", "snoc_axi", "mnoc_axi",
-		    "mss_crypto", "mss_nav", "nav"
+		    "nav"
 	qcom,sdm845-mss-pil:
 		    must be "iface", "bus", "mem", "xo", "gpll0_mss",
 		    "snoc_axi", "mnoc_axi", "prng"
@@ -173,16 +173,12 @@ For the compatible string below the following supplies are required:
 
 For the compatible strings below the following phandle references are required:
   "qcom,sc7180-mss-pil"
-- qcom,halt-nav-regs:
+- qcom,spare-regs:
 	Usage: required
 	Value type: <prop-encoded-array>
-	Definition: reference to a list of 2 phandles with one offset each for
-		    the modem sub-system running on SC7180 SoC. The first
-		    phandle reference is to the mss clock node followed by the
-		    offset within register space for nav halt register. The
-		    second phandle reference is to a syscon representing TCSR
-		    followed by the offset within syscon for conn_box_spare0
-		    register.
+	Definition: a phandle reference to a syscon representing TCSR followed
+		    by the offset within syscon for conn_box_spare0 register
+		    used by the modem sub-system running on SC7180 SoC.
 
 = SUBNODES:
 The Hexagon node must contain two subnodes, named "mba" and "mpss" representing
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
