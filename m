Return-Path: <peter.griffin@linaro.org>
Return-Path: <peter.griffin@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v5 15/18] ARM: STi: DT: STiH407: Add sti-sasg-codec dt node
Date: Tue,  7 Jun 2016 17:19:09 +0100
Message-Id: <1465316352-20691-16-git-send-email-peter.griffin@linaro.org>
In-Reply-To: <1465316352-20691-1-git-send-email-peter.griffin@linaro.org>
References: <1465316352-20691-1-git-send-email-peter.griffin@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, maxime.coquelin@st.com, patrice.chotard@st.com, srinivas.kandagatla@gmail.com, vinod.koul@intel.com, bjorn.andersson@linaro.org, arnaud.pouliquen@st.com, arnd@arndb.de
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, dmaengine@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This patch adds the dt node for the internal audio
codec IP.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm/boot/dts/stih407-family.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index 017d670..3d74bc2 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -874,5 +874,12 @@
 				<&clk_s_c0_flexgen CLK_TX_ICN_DISP_0>,
 				<&clk_s_c0_flexgen CLK_EXT2F_A9>;
 		};
+
+		sti_sasg_codec: sti-sasg-codec {
+			compatible = "st,stih407-sas-codec";
+			#sound-dai-cells = <1>;
+			status = "disabled";
+			st,syscfg = <&syscfg_core>;
+		};
 	};
 };
-- 
1.9.1
