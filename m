Return-Path: <fabien.dessenne@st.com>
From: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [RFC v2 1/5] dt-bindings: remoteproc: add system resource manager (SRM)
Date: Wed, 27 Jun 2018 10:06:18 +0200
Message-ID: <1530086782-5046-2-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1530086782-5046-1-git-send-email-fabien.dessenne@st.com>
References: <1530086782-5046-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Loic Pallardy <loic.pallardy@st.com>, Oleksij
Cc: Fabien Dessenne <fabien.dessenne@st.com>, Suman Anna <s-anna@ti.com>, Alex Elder <elder@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add Documentation of devicetree bindings to support the remote processor
system resource manager.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 .../devicetree/bindings/remoteproc/rproc-srm.txt   | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/rproc-srm.txt

diff --git a/Documentation/devicetree/bindings/remoteproc/rproc-srm.txt b/Documentation/devicetree/bindings/remoteproc/rproc-srm.txt
new file mode 100644
index 0000000..a17208e
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/rproc-srm.txt
@@ -0,0 +1,54 @@
+Remoteproc System Resource Manager
+----------------------------------
+
+The remoteproc SRM (System Resource Manager) handles resources allocated
+to remote processors.
+This makes it possible for remote proc to reserve and initialize system
+resources for a peripheral assigned to a coprocessor.
+
+The devices are grouped in a core node
+
+Core
+====
+Required properties:
+- compatible: should be "rproc-srm-core"
+
+Dev
+===
+Required properties:
+- compatible: should be "rproc-srm-dev"
+
+Optional properties:
+- clocks: clocks required by the coprocessor
+- clock-names: see clock-bindings.txt
+- assigned-clocks: see clock-bindings.txt
+- assigned-clock-parents: see clock-bindings.txt
+- assigned-clock-rates: see clock-bindings.txt
+- pinctrl-x: pins configurations required by the coprocessor
+- pinctrl-names: see pinctrl-bindings.txt
+- x-supply: power supplies required by the coprocessor
+- interrupts: see interrupts.txt
+- interrupt-parent: see interrupts.txt
+- interrupt-names: see interrupts.txt
+
+Example:
+	system_resources {
+		compatible = "rproc-srm-core";
+
+		mmc0: sdhci@09060000 {
+			compatible = "rproc-srm-dev";
+			pinctrl-names = "default", "idle";
+			pinctrl-0 = <&pinctrl_mmc0>;
+			pinctrl-1 = <&pinctrl_mmc1>;
+			clock-names = "mmc", "icn";
+			clocks = <&clk_s_c0_flexgen CLK_MMC_0>,
+				 <&clk_s_c0_flexgen CLK_RX_ICN_HVA>;
+			vdda-supply = <&vdda>;
+		};
+		button {
+			compatible = "rproc-srm-dev";
+			interrupt-parent = <&gpioa>;
+			interrupts = <5 1>;
+			interrupt-names = "gpio_key";
+		};
+	};
-- 
2.7.4
