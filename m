Return-Path: <ore@pengutronix.de>
From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v1 1/2] imx-rproc: dt: provide new remote-nodes option
Date: Fri, 15 Jun 2018 13:57:30 +0200
Message-Id: <20180615115731.18424-1-o.rempel@pengutronix.de>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, dl-linux-imx <linux-imx@nxp.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On AMP systems we need to make sure that some device
nodes are not used by main system and reserved for
external system. Some of configuration should be
maintained by main system. For example clocks and pins.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 .../devicetree/bindings/remoteproc/imx-rproc.txt    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt b/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
index fbcefd965dc4..40bec03e094c 100644
--- a/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
+++ b/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
@@ -15,6 +15,7 @@ Required properties:
 Optional properties:
 - memory-region		list of phandels to the reserved memory regions.
 			(See: ../reserved-memory/reserved-memory.txt)
+- remote-nodes		list of device node phandels used by remote system.
 
 Example:
 	m4_reserved_sysmem1: cm4@80000000 {
@@ -25,9 +26,21 @@ Example:
 		reg = <0x81000000 0x80000>;
 	};
 
+	/* node reserved for rproc */
+	&uart1 {
+		assigned-clock-rates = <240000000>;
+		status = "disabled";
+	};
+
+	&gpt2 {
+		assigned-clock-rates = <24000000>;
+		status = "disabled";
+	};
+
 	imx7d-cm4 {
 		compatible	= "fsl,imx7d-cm4";
 		memory-region	= <&m4_reserved_sysmem1>, <&m4_reserved_sysmem2>;
 		syscon		= <&src>;
 		clocks		= <&clks IMX7D_ARM_M4_ROOT_CLK>;
+		remote-nodes	= <&gpt2>, <&uart1>;
 	};
-- 
2.17.1
