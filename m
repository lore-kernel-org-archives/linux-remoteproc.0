Return-Path: <peter.griffin@linaro.org>
Return-Path: <peter.griffin@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v8 12/18] ARM: DT: STiH407: Add spdif_out pinctrl config
Date: Fri, 26 Aug 2016 15:56:47 +0100
Message-Id: <1472223413-7254-13-git-send-email-peter.griffin@linaro.org>
In-Reply-To: <1472223413-7254-1-git-send-email-peter.griffin@linaro.org>
References: <1472223413-7254-1-git-send-email-peter.griffin@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, vinod.koul@intel.com, patrice.chotard@st.com, dan.j.williams@intel.com, airlied@linux.ie, kraxel@redhat.com, ohad@wizery.com, bjorn.andersson@linaro.org
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, linux-remoteproc@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch adds the pinctrl config for the spidf out
pins used by the sasg codec IP.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm/boot/dts/stih407-pinctrl.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/dts/stih407-pinctrl.dtsi
index 537db7e..598dbab 100644
--- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
@@ -1114,6 +1114,14 @@
 				};
 			};
 
+			spdif_out {
+				pinctrl_spdif_out: spdif_out{
+					st,pins {
+						spdif_out = <&pio34 7 ALT1 OUT>;
+					};
+				};
+			};
+
 			serial3 {
 				pinctrl_serial3: serial3-0 {
 					st,pins {
-- 
1.9.1
