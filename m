Return-Path: <peter.griffin@linaro.org>
Return-Path: <peter.griffin@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v9 15/19] ARM: STi: DT: STiH407: Add uniperif reader dt nodes
Date: Mon,  5 Sep 2016 14:16:57 +0100
Message-Id: <1473081421-16555-16-git-send-email-peter.griffin@linaro.org>
In-Reply-To: <1473081421-16555-1-git-send-email-peter.griffin@linaro.org>
References: <1473081421-16555-1-git-send-email-peter.griffin@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, vinod.koul@intel.com, patrice.chotard@st.com, dan.j.williams@intel.com, airlied@linux.ie, kraxel@redhat.com, ohad@wizery.com, bjorn.andersson@linaro.org
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-remoteproc@vger.kernel.org, virtualization@lists.linux-foundation.org, Arnaud Pouliquen <arnaud.pouliquen@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch adds the DT node for the uniperif reader
IP block found on STiH407 family silicon.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm/boot/dts/stih407-family.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index 1edc36c..883019a 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -960,5 +960,33 @@
 
 			status = "disabled";
 		};
+
+		sti_uni_reader0: sti-uni-reader@8d83000 {
+			compatible = "st,sti-uni-reader";
+			#sound-dai-cells = <0>;
+			st,syscfg = <&syscfg_core>;
+			reg = <0x8d83000 0x158>;
+			interrupts = <GIC_SPI 87 IRQ_TYPE_NONE>;
+			dmas = <&fdma0 5 0 1>;
+			dma-names = "rx";
+			dai-name = "Uni Reader #0 (PCM IN)";
+			st,version = <3>;
+
+			status = "disabled";
+		};
+
+		sti_uni_reader1: sti-uni-reader@8d84000 {
+			compatible = "st,sti-uni-reader";
+			#sound-dai-cells = <0>;
+			st,syscfg = <&syscfg_core>;
+			reg = <0x8d84000 0x158>;
+			interrupts = <GIC_SPI 88 IRQ_TYPE_NONE>;
+			dmas = <&fdma0 6 0 1>;
+			dma-names = "rx";
+			dai-name = "Uni Reader #1 (HDMI RX)";
+			st,version = <3>;
+
+			status = "disabled";
+		};
 	};
 };
-- 
1.9.1
