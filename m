Return-Path: <fabien.dessenne@st.com>
From: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [PATCH v2 4/8] ARM: dts: stm32: add m4 remoteproc support on STM32MP157c
Date: Tue, 16 Apr 2019 16:58:15 +0200
Message-ID: <1555426699-5340-5-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1555426699-5340-1-git-send-email-fabien.dessenne@st.com>
References: <1555426699-5340-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc: Fabien Dessenne <fabien.dessenne@st.com>, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, "Ludovic Barre  <ludovic.barre@st.com>, Benjamin Gaignard" <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Declare the M4 remote processor in a sub-node of the mlahb simple bus.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index c664b55..2d3f8c0 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -1242,4 +1242,24 @@
 			status = "disabled";
 		};
 	};
+
+	mlahb {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		dma-ranges = <0x00000000 0x38000000 0x10000>,
+			     <0x10000000 0x10000000 0x60000>,
+			     <0x30000000 0x30000000 0x60000>;
+
+		m4_rproc: m4@0 {
+			compatible = "st,stm32mp1-m4";
+			reg = <0x00000000 0x10000>,
+			      <0x10000000 0x40000>,
+			      <0x30000000 0x40000>;
+			resets = <&rcc MCU_R>;
+			st,syscfg-holdboot = <&rcc 0x10C 0x1>;
+			st,syscfg-tz = <&rcc 0x000 0x1>;
+			status = "disabled";
+		};
+	};
 };
-- 
2.7.4
