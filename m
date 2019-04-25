Return-Path: <fabien.dessenne@st.com>
From: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [PATCH v2 4/6] ARM: dts: stm32: Add hwspinlock node for stm32mp157 SoC
Date: Thu, 25 Apr 2019 11:17:21 +0200
Message-ID: <1556183843-28033-5-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1556183843-28033-1-git-send-email-fabien.dessenne@st.com>
References: <1556183843-28033-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jonathan Corbet <corbet@lwn.net>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Cc: Fabien Dessenne <fabien.dessenne@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Declare hwspinlock device for stm32mp157 SoC

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 arch/arm/boot/dts/stm32mp157c.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
index 105e21f..824d7e1 100644
--- a/arch/arm/boot/dts/stm32mp157c.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c.dtsi
@@ -886,6 +886,14 @@
 			status = "disabled";
 		};
 
+		hsem: hwspinlock@4c000000 {
+			compatible = "st,stm32-hwspinlock";
+			#hwlock-cells = <2>;
+			reg = <0x4c000000 0x400>;
+			clocks = <&rcc HSEM>;
+			clock-names = "hsem";
+		};
+
 		ipcc: mailbox@4c001000 {
 			compatible = "st,stm32mp1-ipcc";
 			#mbox-cells = <1>;
-- 
2.7.4
