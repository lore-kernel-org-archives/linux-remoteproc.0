Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B54142C4FF;
	Wed, 12 Aug 2026 10:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786531634; cv=none; b=DEMoGeeGfreOahncRTClRcpZzRCVvncbcWBV4wJlRuNPQph6K1NB/kR0HkPMYj5/Upsti495bjnhvwtn8S19y0ySy8oMYlgz1wmXuaSWvyKvUDwIq1hnzSJdVrK/YngxMljnPCbd5Qo0WtoWYEAw+EyycTjTtZs8NKFBPiMZ3jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786531634; c=relaxed/simple;
	bh=HbfwYcVN9JDlSY7DygCc3+yGIcN54pOnFwHX3tq40Vo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=fPwpcf0G/KXdpyooB7WQvsTbjKZVVzuKtpk52Ri/it/i3Ih8ijoT8og/E+2qFgQXaMs2qm3MaKIbCmYwq590nDMoSfh4hqA0U6T8S0iGwt4YRRyQAWAKLKt8f61yxwVi22i7FpV4Bz1fF2qFfKrca0KmduLuTxcQaU0WxaSLYg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 893491A0012;
	Wed, 12 Aug 2026 12:47:11 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 505751A0005;
	Wed, 12 Aug 2026 12:47:11 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id F22A018000B0;
	Wed, 12 Aug 2026 18:47:08 +0800 (+08)
From: Jiafei Pan <Jiafei.Pan@nxp.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: krzysztof.kozlowski@linaro.org,
	peng.fan@nxp.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhiqiang.Hou@nxp.com,
	mingkai.hu@nxp.com,
	Jiafei Pan <Jiafei.Pan@nxp.com>
Subject: [PATCH v4 4/4] arm64: dts: imx93: Cortex-A Core remoteproc device node
Date: Wed, 12 Aug 2026 18:46:33 +0800
Message-Id: <20260812104633.22420-5-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260812104633.22420-1-Jiafei.Pan@nxp.com>
References: <20260511023928.39640-2-Jiafei.Pan@nxp.com>
 <20260812104633.22420-1-Jiafei.Pan@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

Create device tree for i.MX93 14x14 evk and 11x11 evk, add Cortex-A Core
remoteproc device nodes in these device tree.

Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

---
Changes in v4:
- Updated dts compatible.

---
 arch/arm64/boot/dts/freescale/Makefile        |  2 +
 .../imx93-11x11-evk-multicore-rtos.dts        | 39 +++++++++++++++++++
 .../imx93-14x14-evk-multicore-rtos.dts        | 39 +++++++++++++++++++
 .../boot/dts/freescale/imx93-rproc-ca55.dtsi  | 14 +++++++
 4 files changed, 94 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-14x14-evk-multicore-rtos.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 711e36cc2c99..f067e5c44dae 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -460,12 +460,14 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk-multicore-rtos.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
 
 imx93-11x11-frdm-pixpaper-dtbs += imx93-11x11-frdm.dtb imx93-11x11-frdm-pixpaper.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm-pixpaper.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk-multicore-rtos.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts
new file mode 100644
index 000000000000..9fb2b94b83b4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023-2026 NXP
+ */
+
+/dts-v1/;
+#include "imx93-11x11-evk.dts"
+#include "imx93-rproc-ca55.dtsi"
+
+/ {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/*
+		 * Reserve up to 16MB for one possible RTOS instances running on
+		 * one Cortex-A Cores when booting Linux on at least one Cortex-A Core.
+		 */
+		rtos_ca55_reserved: rtos-ca55@d0000000 {
+			no-map;
+			reg = <0 0xd0000000 0x0 0x1000000>;
+		};
+
+		/* Reserve 16MB for FreeRTOS on M33 */
+		m33_reserved: m33@a5000000 {
+			no-map;
+			reg = <0 0xa5000000 0 0x1000000>;
+		};
+	};
+};
+
+&lpuart2 {
+	status = "disabled";
+};
+
+&clk {
+	init-on-array = <IMX93_CLK_LPUART2_GATE>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk-multicore-rtos.dts b/arch/arm64/boot/dts/freescale/imx93-14x14-evk-multicore-rtos.dts
new file mode 100644
index 000000000000..b2481bf19b4a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk-multicore-rtos.dts
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024-2026 NXP
+ */
+
+/dts-v1/;
+#include "imx93-14x14-evk.dts"
+#include "imx93-rproc-ca55.dtsi"
+
+/ {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/*
+		 * Reserve up to 16MB for one possible RTOS instances running on
+		 * one Cortex-A Cores when booting Linux on at least one Cortex-A Core.
+		 */
+		rtos_ca55_reserved: rtos-ca55@d0000000 {
+			no-map;
+			reg = <0 0xd0000000 0x0 0x1000000>;
+		};
+
+		/* Reserve 16MB for FreeRTOS on M33 */
+		m33_reserved: m33@a5000000 {
+			no-map;
+			reg = <0 0xa5000000 0 0x1000000>;
+		};
+	};
+};
+
+&lpuart2 {
+	status = "disabled";
+};
+
+&clk {
+	init-on-array = <IMX93_CLK_LPUART2_GATE>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi b/arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi
new file mode 100644
index 000000000000..715134a55b61
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2024-2026 NXP
+ */
+
+/ {
+	ca55_1: remoteproc {
+		compatible = "fsl,imx93-ca55-rproc", "fsl,imx-rproc-psci";
+		/* bitmask:0b10, assign A55 Core 1 */
+		fsl,cpus-mask = <0x2>;
+		memory-region = <&rtos_ca55_reserved>;
+	};
+};
+
-- 
2.43.0

