Return-Path: <fabien.dessenne@st.com>
From: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [PATCH 4/8] ARM: dts: stm32: add m4 remoteproc support on STM32MP157c
Date: Tue, 5 Mar 2019 15:24:05 +0100
Message-ID: <1551795849-13672-5-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1551795849-13672-1-git-send-email-fabien.dessenne@st.com>
References: <1551795849-13672-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc: Fabien Dessenne <fabien.dessenne@st.com>, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, "Ludovic Barre  <ludovic.barre@st.com>, Benjamin Gaignard" <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Declare the M4 remote processor in a sub-node of the ahb simple bus.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index c664b55..105e21f 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -1242,4 +1242,25 @@
 			status = "disabled";
 		};
 	};
+
+	mlahb: mlahb@0 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x00000000 0x38000000 0x10000>,
+			 <0x10000000 0x10000000 0x60000>,
+			 <0x30000000 0x30000000 0x60000>;
+
+		m4_rproc: m4@0 {
+			compatible = "st,stm32mp1-rproc";
+			reg = <0x00000000 0x10000>,
+			      <0x10000000 0x40000>,
+			      <0x30000000 0x40000>;
+			resets = <&rcc MCU_R>;
+			reset-names = "mcu_rst";
+			st,syscfg-holdboot = <&rcc 0x10C 0x1>;
+			st,syscfg-tz = <&rcc 0x000 0x1>;
+			status = "disabled";
+		};
+	};
 };
-- 
2.7.4
