Return-Path: <clabbe.montjoie@gmail.com>
Return-Path: <clabbe.montjoie@gmail.com>
From: LABBE Corentin <clabbe.montjoie@gmail.com>
Subject: [PATCH RFC 2/3] Documentation: dt: add the sun8i-hwspinlock bindings document
Date: Fri, 12 Aug 2016 13:46:33 +0200
Message-Id: <1471002394-1106-2-git-send-email-clabbe.montjoie@gmail.com>
In-Reply-To: <1471002394-1106-1-git-send-email-clabbe.montjoie@gmail.com>
References: <1471002394-1106-1-git-send-email-clabbe.montjoie@gmail.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, LABBE Corentin <clabbe.montjoie@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch adds the DT bindings information for sun8i-hwspinlock module.

Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
---
 .../bindings/hwlock/sun8i-hwspinlock.txt           | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/sun8i-hwspinlock.txt

diff --git a/Documentation/devicetree/bindings/hwlock/sun8i-hwspinlock.txt b/Documentation/devicetree/bindings/hwlock/sun8i-hwspinlock.txt
new file mode 100644
index 0000000..38c1d7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/sun8i-hwspinlock.txt
@@ -0,0 +1,23 @@
+Sun8i HWspinlock Driver
+========================
+
+Required properties:
+- compatible:		Should be "allwinner,sun8i-hwspinlock"
+- reg:			Contains the hwspinlock module register address space
+			(base address and length)
+- clocks:		A phandle to the reference clock for this device
+- clock-names:		should be "ahb"
+- resets:		A phandle to the reset control for this device
+- reset-names:		should be "ahb"
+
+Example:
+
+/* sun8i-h3 */
+hwspinlock: hwspinlock@1c18000 {
+	compatible = "allwinner,sun8i-hwspinlock";
+	reg = <0x01c18000 0x400>;
+	resets = <&ccu RST_BUS_SPINLOCK>;
+	reset-names = "ahb";
+	clocks = <&ccu CLK_BUS_SPINLOCK>;
+	clock-names = "ahb";
+};
-- 
2.7.3
