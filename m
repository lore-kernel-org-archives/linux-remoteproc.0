Return-Path: <fabien.dessenne@st.com>
From: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [PATCH v3 1/8] dt-bindings: stm32: add bindings for ML-AHB interconnect
Date: Thu, 2 May 2019 10:09:59 +0200
Message-ID: <1556784606-3016-2-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1556784606-3016-1-git-send-email-fabien.dessenne@st.com>
References: <1556784606-3016-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc: Fabien Dessenne <fabien.dessenne@st.com>, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, "Ludovic Barre  <ludovic.barre@st.com>, Benjamin Gaignard" <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Document the ML-AHB interconnect for stm32 SoCs.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 .../devicetree/bindings/arm/stm32/mlahb.txt        | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/stm32/mlahb.txt

diff --git a/Documentation/devicetree/bindings/arm/stm32/mlahb.txt b/Documentation/devicetree/bindings/arm/stm32/mlahb.txt
new file mode 100644
index 0000000..3f5b779
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/stm32/mlahb.txt
@@ -0,0 +1,37 @@
+ML-AHB interconnect bindings
+
+These bindings describe the STM32 SoCs ML-AHB interconnect bus which connects
+a Cortex-M subsystem with dedicated memories.
+The MCU SRAM and RETRAM memory parts can be accessed through different addresses
+(see "RAM aliases" in [1]) using different buses (see [2]) : balancing the
+Cortex-M firmware accesses among those ports allows to tune the system
+performance.
+
+[1]: https://www.st.com/resource/en/reference_manual/dm00327659.pdf
+[2]: https://wiki.st.com/stm32mpu/wiki/STM32MP15_RAM_mapping
+
+Required properties:
+- compatible: should be "simple-bus"
+- dma-ranges: describes memory addresses translation between the local CPU and
+	   the remote Cortex-M processor. Each memory region, is declared with
+	   3 parameters:
+		 - param 1: device base address (Cortex-M processor address)
+		 - param 2: physical base address (local CPU address)
+		 - param 3: size of the memory region.
+
+The Cortex-M remote processor accessed via the mlahb interconnect is described
+by a child node.
+
+Example:
+mlahb {
+	compatible = "simple-bus";
+	#address-cells = <1>;
+	#size-cells = <1>;
+	dma-ranges = <0x00000000 0x38000000 0x10000>,
+		     <0x10000000 0x10000000 0x60000>,
+		     <0x30000000 0x30000000 0x60000>;
+
+	m4_rproc: m4@38000000 {
+		...
+	};
+};
-- 
2.7.4
