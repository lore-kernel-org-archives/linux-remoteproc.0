Return-Path: <fabien.dessenne@st.com>
From: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [PATCH 3/6] dt-bindings: hwlock: update STM32 #hwlock-cells value
Date: Wed, 13 Mar 2019 16:50:34 +0100
Message-ID: <1552492237-28810-4-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1552492237-28810-1-git-send-email-fabien.dessenne@st.com>
References: <1552492237-28810-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jonathan Corbet <corbet@lwn.net>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Cc: Fabien Dessenne <fabien.dessenne@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Use a value of 2, so users can share hwlocks.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt b/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
index adf4f000..60a3716 100644
--- a/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
+++ b/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
@@ -4,8 +4,8 @@ STM32 Hardware Spinlock Device Binding
 Required properties :
 - compatible : should be "st,stm32-hwspinlock".
 - reg : the register address of hwspinlock.
-- #hwlock-cells : hwlock users only use the hwlock id to represent a specific
-	hwlock, so the number of cells should be <1> here.
+- #hwlock-cells : should be <2> so the hwlock users use the hwlock id to
+	represent a specific hwlock and define its shared / exclusive attribute.
 - clock-names : Must contain "hsem".
 - clocks : Must contain a phandle entry for the clock in clock-names, see the
 	common clock bindings.
@@ -16,7 +16,7 @@ Please look at the generic hwlock binding for usage information for consumers,
 Example of hwlock provider:
 	hwspinlock@4c000000 {
 		compatible = "st,stm32-hwspinlock";
-		#hwlock-cells = <1>;
+		#hwlock-cells = <2>;
 		reg = <0x4c000000 0x400>;
 		clocks = <&rcc HSEM>;
 		clock-names = "hsem";
-- 
2.7.4
