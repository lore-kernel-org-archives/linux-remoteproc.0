Return-Path: <brgl@bgdev.pl>
Return-Path: <brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v7 3/4] ARM: davinci: dts: make psc0 a reset provider
Date: Thu, 21 Jun 2018 09:37:05 +0200
Message-Id: <20180621073706.22812-4-brgl@bgdev.pl>
In-Reply-To: <20180621073706.22812-1-brgl@bgdev.pl>
References: <20180621073706.22812-1-brgl@bgdev.pl>
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, David Lechner <david@lechnology.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The psc driver registers with the reset framework as a provider. Add
the #reset-cells property to the psc0 node.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: David Lechner <david@lechnology.com>
---
 arch/arm/boot/dts/da850.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index 3fc8b8fd816e..1bc0e4bc0697 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -132,6 +132,7 @@
 			compatible = "ti,da850-psc0";
 			reg = <0x10000 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			clocks = <&pll0_sysclk 1>, <&pll0_sysclk 2>,
 				 <&pll0_sysclk 4>, <&pll0_sysclk 6>,
-- 
2.17.1
