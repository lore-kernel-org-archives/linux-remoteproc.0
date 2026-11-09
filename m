Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794245483;
	b=yWVTDonRFq41qdmHNQy+BYSHUUXmuZHNKUgLpBO3/6so6XDJZB8NXZ5eKdCsFQLADSCb
	 J38RNYLqLrVmZcJ2Czci81BZ5mV1DgLH4zrfSNgkG/FDlz3/bPg1Aa6JZr5U8/NTYjWuS
	 P5l22PkPsSuuQcJbWtmzeEAR6O096LFt4Vb4stpzas/0ReDTC/09fXS1FhClRcXI8CRSz
	 BYoRyigO+C2et31OBO5DbjFFzAKb3sVZJ9R2J2RVieGeA5C2AS9OWbKhlU3cz5F5H2HBz
	 lSgc+f+les7QYzRhm+/dyI0zItsP3tc9KTQ2miDEEm+R6mcxpbZNFJ3g29r1rNhrlVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794245483;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZL3nYrPsqqItt2tFVj+sUMiuLO1InqAzv3kT3Gptqeo=;
	b=dAl/Lxjz+7W6dVaakdnlFTKpsE4LDQ/FCWq3wp56pmYqokFevRtyZJE7Cna5p5S5MZwd
	 kSWyR5GO1XWW2y7u7pKHYCa6BNP2UM+RaflwzsmOZTwfl6lbdxu4SOnL0qgIPxg4JIsUO
	 zy3kPh+cPAY0LF8FbH/7RjRoHH2zswiGiTKh4W+AOik1/wiSxggCUckdrIB+6118mk/QW
	 dyaVCeeaYT0IL5ibyoXvdkawkteiryUYcJftWQqlNgewN/WdEPFj+WHXzN0s7vo+8Zw2I
	 c7WlPDuSlKWVTWqlJNi0ySM5uzO0LtASVI9HgELX7NYoE1yZQ+hHQRtalYf1+QQrzYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YIsPyMz5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA74606A335;
	Mon,  9 Nov 2026 17:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YIsPyMz5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44FEC1F0089F;
	Mon,  9 Nov 2026 17:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794245482;
	bh=ZL3nYrPsqqItt2tFVj+sUMiuLO1InqAzv3kT3Gptqeo=;
	h=From:To:Cc:Subject:Date;
	b=YIsPyMz5BjpR0loCF6GQUpImEM7Ihg/LZWf66GyRNC9HRmemr23EWJnuQCXBACpVk
	 1y0L8GV13Z8mBcGL5f/sBMvloJTcia72Pc3XKf+lEFI3vYLa9M02rKn29xVJjCvPd+
	 9lmPXMZUej69U7KvyUjuGLJEXfuavnUgBo1jAav9jne0uAroFWmRZBrLa1pCc3hpa5
	 uWwK5wJGlPNXYDKRgz+uoBqY3MoJo3tD29ZJ1IrQsuQ1vPfKyqnT29q8bHZdL+/Nio
	 IbsTUy150rUfnDEWQWo8wyqPIg3YbdzE/uN2cETj4wCqPZn45YPDSQPmGufF+JVauT
	 rA8wsuRps6LFg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nishanth Menon <nm@ti.com>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: reset: Convert the ti,syscon-reset binding to DT schema
Date: Mon,  9 Nov 2026 11:31:11 -0600
Message-ID: <20261109173112.4111810-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the ti,syscon-reset binding to DT schema format. It's a straight
forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/remoteproc/ti,keystone-rproc.txt |  2 +-
 .../bindings/reset/ti,syscon-reset.yaml       | 58 ++++++++++++
 .../bindings/reset/ti-syscon-reset.txt        | 91 -------------------
 3 files changed, 59 insertions(+), 92 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/ti,syscon-reset.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/ti-syscon-reset.txt

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
index 847552133633..94f4508c8b0c 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
+++ b/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt
@@ -46,7 +46,7 @@ The following are the mandatory properties:
 			managing the resets for this device, and a reset
 			specifier. Please refer to either of the following reset
 			bindings for the reset argument specifier as per SoC,
-			Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
+			Documentation/devicetree/bindings/reset/ti,syscon-reset.yaml
 			    for 66AK2HK/66AK2L/66AK2E SoCs or,
 			Documentation/devicetree/bindings/reset/ti,sci-reset.yaml
 			    for 66AK2G SoCs
diff --git a/Documentation/devicetree/bindings/reset/ti,syscon-reset.yaml b/Documentation/devicetree/bindings/reset/ti,syscon-reset.yaml
new file mode 100644
index 000000000000..1cbb2bf88716
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/ti,syscon-reset.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/ti,syscon-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI Syscon Reset Controller
+
+maintainers:
+  - Nishanth Menon <nm@ti.com>
+
+description:
+  Reset controller implemented by registers in the parent syscon.
+
+properties:
+  compatible:
+    oneOf:
+      - const: ti,syscon-reset
+      - items:
+          - enum:
+              - ti,k2e-pscrst
+              - ti,k2l-pscrst
+              - ti,k2hk-pscrst
+          - const: ti,syscon-reset
+
+  '#reset-cells':
+    const: 1
+
+  ti,reset-bits:
+    description: >
+      Seven cells per reset, indexed by the reset specifier:
+
+        Cell #1 : offset of the reset assert control register
+        Cell #2 : bit position of the reset in the reset assert control register
+        Cell #3 : offset of the reset deassert control register
+        Cell #4 : bit position of the reset in the reset deassert control register
+        Cell #5 : offset of the reset status register
+        Cell #6 : bit position of the reset in the reset status register
+        Cell #7 : Flags used to control reset behavior, available flags defined
+                  in the DT include file <dt-bindings/reset/ti-syscon.h>
+
+required:
+  - compatible
+  - '#reset-cells'
+  - ti,reset-bits
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/ti-syscon.h>
+
+    reset-controller {
+        compatible = "ti,k2e-pscrst", "ti,syscon-reset";
+        #reset-cells = <1>;
+        ti,reset-bits = <0xa3c 8 0xa3c 8 0x83c 8
+                          (ASSERT_CLEAR | DEASSERT_SET | STATUS_CLEAR)>;
+    };
diff --git a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
deleted file mode 100644
index 61a0ff33e89f..000000000000
--- a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
+++ /dev/null
@@ -1,91 +0,0 @@
-TI SysCon Reset Controller
-=======================
-
-Almost all SoCs have hardware modules that require reset control in addition
-to clock and power control for their functionality. The reset control is
-typically provided by means of memory-mapped I/O registers. These registers are
-sometimes a part of a larger register space region implementing various
-functionalities. This register range is best represented as a syscon node to
-allow multiple entities to access their relevant registers in the common
-register space.
-
-A SysCon Reset Controller node defines a device that uses a syscon node
-and provides reset management functionality for various hardware modules
-present on the SoC.
-
-SysCon Reset Controller Node
-============================
-Each of the reset provider/controller nodes should be a child of a syscon
-node and have the following properties.
-
-Required properties:
---------------------
- - compatible		: Should be,
-			    "ti,k2e-pscrst"
-			    "ti,k2l-pscrst"
-			    "ti,k2hk-pscrst"
-			    "ti,syscon-reset"
- - #reset-cells		: Should be 1. Please see the reset consumer node below
-			  for usage details
- - ti,reset-bits	: Contains the reset control register information
-			  Should contain 7 cells for each reset exposed to
-			  consumers, defined as:
-			    Cell #1 : offset of the reset assert control
-			              register from the syscon register base
-			    Cell #2 : bit position of the reset in the reset
-			              assert control register
-			    Cell #3 : offset of the reset deassert control
-			              register from the syscon register base
-			    Cell #4 : bit position of the reset in the reset
-			              deassert control register
-			    Cell #5 : offset of the reset status register
-			              from the syscon register base
-			    Cell #6 : bit position of the reset in the
-			              reset status register
-			    Cell #7 : Flags used to control reset behavior,
-			              available flags defined in the DT include
-			              file <dt-bindings/reset/ti-syscon.h>
-
-SysCon Reset Consumer Nodes
-===========================
-Each of the reset consumer nodes should have the following properties,
-in addition to their own properties.
-
-Required properties:
---------------------
- - resets	: A phandle to the reset controller node and an index number
-		  to a reset specifier as defined above.
-
-Please also refer to Documentation/devicetree/bindings/reset/reset.txt for
-common reset controller usage by consumers.
-
-Example:
---------
-The following example demonstrates a syscon node, the reset controller node
-using the syscon node, and a consumer (a DSP device) on the TI Keystone 2
-66AK2E SoC.
-
-/ {
-	soc {
-		psc: power-sleep-controller@2350000 {
-			compatible = "syscon", "simple-mfd";
-			reg = <0x02350000 0x1000>;
-
-			pscrst: reset-controller {
-				compatible = "ti,k2e-pscrst", "ti,syscon-reset";
-				#reset-cells = <1>;
-
-				ti,reset-bits = <
-					0xa3c 8 0xa3c 8 0x83c 8 (ASSERT_CLEAR | DEASSERT_SET   | STATUS_CLEAR) /* 0: dsp0 */
-					0xa40 5 0xa44 3 0     0 (ASSERT_SET   | DEASSERT_CLEAR | STATUS_NONE)  /* 1: example */
-				>;
-			};
-		};
-
-		dsp0: dsp0 {
-			...
-			resets = <&pscrst 0>;
-			...
-		};
-	};
-};
-- 
2.53.0

