Return-Path: <peter.griffin@linaro.org>
Return-Path: <peter.griffin@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v5 18/18] ARM: DT: STi: stihxxx-b2120: Add DT nodes for STi audio card
Date: Tue,  7 Jun 2016 17:19:12 +0100
Message-Id: <1465316352-20691-19-git-send-email-peter.griffin@linaro.org>
In-Reply-To: <1465316352-20691-1-git-send-email-peter.griffin@linaro.org>
References: <1465316352-20691-1-git-send-email-peter.griffin@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, maxime.coquelin@st.com, patrice.chotard@st.com, srinivas.kandagatla@gmail.com, vinod.koul@intel.com, bjorn.andersson@linaro.org, arnaud.pouliquen@st.com, arnd@arndb.de
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, dmaengine@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This patch enables the uniperif players 2 & 3 for b2120 boards
and also adds the "simple-audio-card" device node to interconnect
the SoC sound device and the codec.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm/boot/dts/stihxxx-b2120.dtsi | 45 ++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/stihxxx-b2120.dtsi b/arch/arm/boot/dts/stihxxx-b2120.dtsi
index 722c63f..1f64bb6 100644
--- a/arch/arm/boot/dts/stihxxx-b2120.dtsi
+++ b/arch/arm/boot/dts/stihxxx-b2120.dtsi
@@ -131,5 +131,50 @@
 				dvb-card	= <STV0367_TDA18212_NIMA_1>;
 			};
 		};
+
+		sti_uni_player2: sti-uni-player@2 {
+			status = "okay";
+		};
+
+		sti_uni_player3: sti-uni-player@3 {
+			status = "okay";
+		};
+
+		sti_sasg_codec: sti-sasg-codec {
+			status = "okay";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_spdif_out>;
+		};
+
+		sound {
+			compatible = "simple-audio-card";
+			simple-audio-card,name = "sti audio card";
+			status = "okay";
+
+			simple-audio-card,dai-link@0 {
+				/* DAC */
+				format = "i2s";
+				mclk-fs = <256>;
+				cpu {
+					sound-dai = <&sti_uni_player2>;
+				};
+
+				codec {
+					sound-dai = <&sti_sasg_codec 1>;
+				};
+			};
+			simple-audio-card,dai-link@1 {
+				/* SPDIF */
+				format = "left_j";
+				mclk-fs = <128>;
+				cpu {
+					sound-dai = <&sti_uni_player3>;
+				};
+
+				codec {
+					sound-dai = <&sti_sasg_codec 0>;
+				};
+			};
+		};
 	};
 };
-- 
1.9.1
