Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] dt-bindings: remoteproc: Rename qcom,adsp binding document
Date: Wed,  6 Mar 2019 15:22:20 -0800
Message-Id: <20190306232220.32722-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

The qcom,adsp binding document has evolved to cover the mechanism to
load and boot firmware on a range of different Hexagon based remote
subsystems. Rename the binding and update the description to better
capture this.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../{qcom,adsp.txt => qcom,q6v5-pas.txt}          | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)
 rename Documentation/devicetree/bindings/remoteproc/{qcom,adsp.txt => qcom,q6v5-pas.txt} (88%)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5-pas.txt
similarity index 88%
rename from Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
rename to Documentation/devicetree/bindings/remoteproc/qcom,q6v5-pas.txt
index 292dfda9770d..bbe9c7465a2c 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5-pas.txt
@@ -1,7 +1,8 @@
-Qualcomm ADSP Peripheral Image Loader
+Qualcomm TrustZone based Peripheral Image Loader
 
-This document defines the binding for a component that loads and boots firmware
-on the Qualcomm ADSP Hexagon core.
+This document defines the binding for the TrustZone based "Peripheral
+Authentication Service" (PAS) interface for loading and booting firmware on the
+Qualcomm Hexagon cores.
 
 - compatible:
 	Usage: required
@@ -85,10 +86,10 @@ on the Qualcomm ADSP Hexagon core.
 
 
 = SUBNODES
-The adsp node may have an subnode named either "smd-edge" or "glink-edge" that
-describes the communication edge, channels and devices related to the ADSP.
-See ../soc/qcom/qcom,smd.txt and ../soc/qcom/qcom,glink.txt for details on how
-to describe these.
+The remoteproc node may have an subnode named either "smd-edge" or "glink-edge"
+that describes the communication edge, channels and devices related to the
+remoteproc.  See ../soc/qcom/qcom,smd.txt and ../soc/qcom/qcom,glink.txt for
+details on how to describe these.
 
 
 = EXAMPLE
-- 
2.18.0
