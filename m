Return-Path: <peter.griffin@linaro.org>
Return-Path: <peter.griffin@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v7 15/16] ARM: STi: DT: STiH407: Add uniperif reader dt nodes
Date: Mon,  1 Aug 2016 18:10:52 +0100
Message-Id: <1470071453-10730-16-git-send-email-peter.griffin@linaro.org>
In-Reply-To: <1470071453-10730-1-git-send-email-peter.griffin@linaro.org>
References: <1470071453-10730-1-git-send-email-peter.griffin@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, vinod.koul@intel.com, patrice.chotard@st.com, ohad@wizery.com, bjorn.andersson@linaro.org
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch adds the DT node for the uniperif reader
IP block found on STiH407 family silicon.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm/boot/dts/stih407-family.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index d263c96..bdddf2c 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -956,5 +956,31 @@
 			st,version = <5>;
 			st,mode = "SPDIF";
 		};
+
+		sti_uni_reader0: sti-uni-reader@0 {
+			compatible = "st,sti-uni-reader";
+			status = "disabled";
+			#sound-dai-cells = <0>;
+			st,syscfg = <&syscfg_core>;
+			reg = <0x8D83000 0x158>;
+			interrupts = <GIC_SPI 87 IRQ_TYPE_NONE>;
+			dmas = <&fdma0 5 0 1>;
+			dma-names = "rx";
+			dai-name = "Uni Reader #0 (PCM IN)";
+			st,version = <3>;
+		};
+
+		sti_uni_reader1: sti-uni-reader@1 {
+			compatible = "st,sti-uni-reader";
+			status = "disabled";
+			#sound-dai-cells = <0>;
+			st,syscfg = <&syscfg_core>;
+			reg = <0x8D84000 0x158>;
+			interrupts = <GIC_SPI 88 IRQ_TYPE_NONE>;
+			dmas = <&fdma0 6 0 1>;
+			dma-names = "rx";
+			dai-name = "Uni Reader #1 (HDMI RX)";
+			st,version = <3>;
+		};
 	};
 };
-- 
1.9.1
