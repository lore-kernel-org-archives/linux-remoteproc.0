Return-Path: <clabbe.montjoie@gmail.com>
Return-Path: <clabbe.montjoie@gmail.com>
From: LABBE Corentin <clabbe.montjoie@gmail.com>
Subject: [PATCH RFC 3/3] ARM: dts: sun8i: add hwspinlock device to sun8i-h3
Date: Fri, 12 Aug 2016 13:46:34 +0200
Message-Id: <1471002394-1106-3-git-send-email-clabbe.montjoie@gmail.com>
In-Reply-To: <1471002394-1106-1-git-send-email-clabbe.montjoie@gmail.com>
References: <1471002394-1106-1-git-send-email-clabbe.montjoie@gmail.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, LABBE Corentin <clabbe.montjoie@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Add the hwspinlock device tree node for the device present on H3.

Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
---
 arch/arm/boot/dts/sun8i-h3.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index 439e8ed..c801389 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -489,6 +489,16 @@
 			status = "disabled";
 		};
 
+		hwspinlock: hwspinlock@1c18000 {
+			compatible = "allwinner,sun8i-hwspinlock";
+			reg = <0x01c18000 0x400>;
+			resets = <&ccu RST_BUS_SPINLOCK>;
+			reset-names = "ahb";
+			clocks = <&ccu CLK_BUS_SPINLOCK>;
+			clock-names = "ahb";
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@01c81000 {
 			compatible = "arm,cortex-a7-gic", "arm,cortex-a15-gic";
 			reg = <0x01c81000 0x1000>,
-- 
2.7.3
