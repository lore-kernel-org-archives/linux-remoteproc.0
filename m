Return-Path: <peter.griffin@linaro.org>
Return-Path: <peter.griffin@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v4 17/18] ARM: STi: DT: STiH407: Add uniperif reader dt nodes
Date: Wed, 25 May 2016 17:06:51 +0100
Message-Id: <1464192412-16386-19-git-send-email-peter.griffin@linaro.org>
In-Reply-To: <1464192412-16386-1-git-send-email-peter.griffin@linaro.org>
References: <1464192412-16386-1-git-send-email-peter.griffin@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, vinod.koul@intel.com, ohad@wizery.com, bjorn.andersson@linaro.org, arnd@arndb.de
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This patch adds the DT node for the uniperif reader
IP block found on STiH407 family silicon.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm/boot/dts/stih407-family.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index 7ca149b..fb6363e1 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -831,5 +831,33 @@
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
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_i2s_8ch_in>;
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
