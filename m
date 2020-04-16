Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [RFC 18/18] ARM: dts: stm32: Declare a virtio device
Date: Thu, 16 Apr 2020 18:13:31 +0200
Message-ID: <20200416161331.7606-19-arnaud.pouliquen@st.com>
In-Reply-To: <20200416161331.7606-1-arnaud.pouliquen@st.com>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, arnaud.pouliquen@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

Declare a virtio device as sub device of the stm32 remote proc

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
index f6672e87aef3..2bb16c860c82 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
@@ -414,6 +414,16 @@
 	interrupt-parent = <&exti>;
 	interrupts = <68 1>;
 	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	vdev@0 {
+		memory-region = <&vdev0vring0>,	<&vdev0vring1>, <&vdev0buffer>;
+		compatible = "rproc-virtio";
+		reg = <0>;
+		status = "okay";
+	};
 };
 
 &pwr_regulators {
-- 
2.17.1
