Return-Path: <fabien.dessenne@st.com>
From: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [PATCH 1/8] dt-bindings: stm32: add bindings for ML-AHB interconnect
Date: Tue, 5 Mar 2019 15:24:02 +0100
Message-ID: <1551795849-13672-2-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1551795849-13672-1-git-send-email-fabien.dessenne@st.com>
References: <1551795849-13672-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc: Fabien Dessenne <fabien.dessenne@st.com>, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, "Ludovic Barre  <ludovic.barre@st.com>, Benjamin Gaignard" <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Document the ML-AHB interconnect for stm32 SoCs.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 .../devicetree/bindings/arm/stm32/mlahb.txt        | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/stm32/mlahb.txt

diff --git a/Documentation/devicetree/bindings/arm/stm32/mlahb.txt b/Documentation/devicetree/bindings/arm/stm32/mlahb.txt
new file mode 100644
index 0000000..880cb38
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/stm32/mlahb.txt
@@ -0,0 +1,30 @@
+ML-AHB interconnect bindings
+
+These bindings describe the STM32 SoCs ML-AHB interconnect bus which connects
+a Cortex-M subsystem with dedicated memories.
+
+Required properties:
+- compatible: should be "simple-bus"
+- ranges: describes memory addresses translation between the local CPU and the
+	   remote Cortex-M processor. Each memory region, is declared with 3
+	   parameters:
+		 - param 1: device base address (Cortex-M processor address)
+		 - param 2: physical base address (local CPU address)
+		 - param 3: size of the memory region.
+
+The Cortex-M remote processor accessed via the mlahb interconnect is described
+by a child node.
+
+Example:
+mlahb: mlahb@0 {
+	compatible = "simple-bus";
+	#address-cells = <1>;
+	#size-cells = <1>;
+	ranges = <0x00000000 0x38000000 0x10000>,
+		 <0x10000000 0x10000000 0x60000>,
+		 <0x30000000 0x30000000 0x60000>;
+
+	m4_rproc: m4@0 {
+		...
+	};
+};
-- 
2.7.4
