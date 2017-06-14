Return-Path: <linux-arm-kernel-bounces+bjorn.andersson=linaro.org@lists.infradead.org>
From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [RFC PATCH 3/3] ARM: dts: imx7s: add rproc node
Date: Wed, 14 Jun 2017 22:48:55 +0200
Message-Id: <20170614204855.18347-4-o.rempel@pengutronix.de>
In-Reply-To: <20170614204855.18347-1-o.rempel@pengutronix.de>
References: <20170614204855.18347-1-o.rempel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+bjorn.andersson=linaro.org@lists.infradead.org
To: devicetree@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
Cc: Oleksij Rempel <linux@rempel-privat.de>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Oleksij Rempel <linux@rempel-privat.de>

Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
---
 arch/arm/boot/dts/imx7s.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index c138b0fb410a..8b84cd3cdd28 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -566,6 +566,14 @@
 			};
 		};
 
+		imx_rproc: imx7d-rp0@0 {
+			compatible	= "fsl,imx7d-rproc";
+			reg		= <0x00180000 0x4000>, <0x00184000 0x4000>;
+			reg-names	= "imem", "dmem";
+			syscon		= <&src>;
+			clocks		= <&clks IMX7D_ARM_M4_ROOT_CLK>;
+		};
+
 		aips2: aips-bus@30400000 {
 			compatible = "fsl,aips-bus", "simple-bus";
 			#address-cells = <1>;
-- 
2.11.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
