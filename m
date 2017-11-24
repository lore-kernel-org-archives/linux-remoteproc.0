Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [RFC 2/6] dt-bindings: remoteproc: add system resource manager (SRM)
Date: Fri, 24 Nov 2017 15:36:38 +0100
Message-ID: <1511534202-12995-3-git-send-email-arnaud.pouliquen@st.com>
In-Reply-To: <1511534202-12995-1-git-send-email-arnaud.pouliquen@st.com>
References: <1511534202-12995-1-git-send-email-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, arnaud.pouliquen@st.com, "Loic PALLARDY  <loic.pallardy@st.com>, Fabien DESSENNE" <fabien.dessenne@st.com>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Fabien Dessenne <fabien.dessenne@st.com>

Add Documentation of devicetree bindings to support the remote processor
system resource manager.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 .../devicetree/bindings/remoteproc/rproc-srm.txt   | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/rproc-srm.txt

diff --git a/Documentation/devicetree/bindings/remoteproc/rproc-srm.txt b/Documentation/devicetree/bindings/remoteproc/rproc-srm.txt
new file mode 100644
index 0000000..986dad1
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/rproc-srm.txt
@@ -0,0 +1,45 @@
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
+	};
-- 
2.7.4
