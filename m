Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78928439914
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 16:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429333; cv=none; b=jQQVy6qbM1tzk4bFnTE1hvhKpJaRyOGgv/zKHjQOrcg+N7Z+VSOAHxEFcqPc5HG8AY0ei0Uw3v2/+cHRGjC0zeRIbVlwBFr8KlWv/8gfcr2R1smnd8fx3dVGDn7Ob+RmnUTvwRqBIoDu7V/8YxJXywAUhFpIL6UWSKsYz2Quhcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429333; c=relaxed/simple;
	bh=kuGy2C+TsQWsScNzk2IT+jSBO4cKZ8il/wZBfLzIWXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CRpl6i5+BRTWp3o5Td1D39zod0erO+ZbnKQR2FX70PDGj+/mDVb/G64VqpaDJ5cXgo5d1X6N2IK5RZODAoaJglFW4Pb360MTsGxA40k7Nt0POWlQq48Ls210uQ08KPXl9wkGI1g3sltWfLP0mMLdIlK6bmDn4P85A0LHpe8rdrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=grKteX1Z; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grKteX1Z"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954afac04bso26369205e9.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 09:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785429330; x=1786034130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kJhL3RsYBYDwWZhud+U9+49c/408+YK8Ri5w8J9rOB0=;
        b=grKteX1Zv/LDvHEUXexeuWA2siZxDUaoha0wjGAtsNS0PUvkoQ9wd0PMqz1nrhkZgX
         DXxKwffkJlke8L0044puQOx0On0nYUf1PQk25fOu61WLpQR8b796Z4DCT5u0ndSbgopA
         dWY2UsPmiiOD8Pcsxs6SR4x/ljjI9fpHkD5XyvDVf7O+2G5HqLxLWSMZnsVOzCZ1W3BB
         /icpQyE1daCuyWHv8QP3C4773+YcZAsnxY//2ZB8afPHbGqqO9pV+KXY0PffYVSh16V3
         6HxsHxGR/bu04J/AzsUB3j00yE5rEB+GMYH7cFShxsMCLPEkVCFT/arMFtFKO6keG3i1
         CHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429330; x=1786034130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kJhL3RsYBYDwWZhud+U9+49c/408+YK8Ri5w8J9rOB0=;
        b=d1XNP6BP3TFQHNK3FIbTFhGhmV3NH+ZObAxigydAwL5K8pKOvtxzcbP05wmgYs+QHb
         ZSfzH2jjYHJQomaJTArH9VmyFnYWPYfsdAPLY/U9CJaCIM9UjREeNDIIiWL/dxZS8JbD
         TOBJRLE8OP2d+yOd77sz78zlbHppQS80FAVb0uq7JZXzvjyXKOWlG30MYqv0DVamWo51
         bG0MtTzMuZXtQYSo8rIY8DhaTVDg2wkPMnZQ2OMl6gD5nkPcpaQNKNzUNE83hoQe2Lhx
         7/S07By5e/J5gxYMVU3SjVfDBjCWGwbwYqV8jA/CuYAZ7hS+89L0Nst/aIdj8dEKqg+5
         2Mng==
X-Gm-Message-State: AOJu0YzS0ywd7twavwM5FwIPhdKB76vV15/HEJEG2eQbCHiXaEDK2uD6
	Z/j40UyEDWydhKVXz0Jx3xSfzGLDwvGRgr3IIzjIWOvJP1hr3rpHBRi1
X-Gm-Gg: AR+sD11bP1xXYLXidkN5J+rrvLN73Yp97blSr+7OQWBmuc49N8OuHUI1JSNu45RghNY
	FzK9rsHYAQF3nSqTkVgDNqsMbcnV2TsuCOrjbHHuLDQEiJMrlYnZoLXTZ5xlKtivPXyDMHpgN4e
	TvKWdomtDZBOuj39EUeDcmTDIz0zsS4qWOehubKkWa9oJfhgD6ATWeqnIZLEwdKF484wveMAvNp
	bFcRz8zowvFSPHypi3MXU6BLesFKljApLGcINc984I6+WoohjV3KaE/5KPascEGHUAOWOpy5fAS
	QBAEw+SN/pwfGNvG31rcJWgPLhnHYekI6pCYJunTF+O/YyIrTNzrYYbVFy0hU98panfqxjs1n63
	PZxHrBPfjO0tua5hNOoCIrd0UbCu3i0RMNy7Tm9kIgtirZKby1Vv5KHHTJCUPpjr/9Ui2ryxlvB
	ZVWVm+q/DxqjoF8gl2dwjDhmcNeKeTu9z7om8bBlZ3+CNPlIf6aGvDcoBykeAkVLjV9YGsq9Uw/
	JDeHZpO9EPgdA==
X-Received: by 2002:a05:600c:1987:b0:493:a438:7f98 with SMTP id 5b1f17b1804b1-49800ea99b0mr45414735e9.18.1785429329577;
        Thu, 30 Jul 2026 09:35:29 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc892cdeasm7758445f8f.22.2026.07.30.09.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:35:29 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] arm64: dts: freescale: add DT overlay for MX95-15x15-FRDM RPMSG usage
Date: Thu, 30 Jul 2026 09:34:12 -0700
Message-ID: <20260730163412.1145-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add RPMSG DT overlay for the MX95-15x15-FRDM board. This overlay is meant
to be used with the mx95evkrpmsg system manager configuration for
remoteproc and audio over rpmsg-usecases.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  3 +
 .../dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 67 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 95ae85ab4adf..3f98132f5a32 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -707,6 +707,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx943-evk-sdwifi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-ab2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm-rpmsg.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
@@ -729,6 +730,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
+imx95-15x15-frdm-rpmsg-dtbs = imx95-15x15-frdm.dtb imx95-15x15-frdm-rpmsg.dtbo
+
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
new file mode 100644
index 000000000000..bc02864c6f88
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ *
+ * This DT overlay is meant to be used alongside the mx95evkrpmsg SM
+ * configuration for remoteproc and audio over rpmsg.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	remoteproc-cm7 {
+		compatible = "fsl,imx95-cm7";
+		mboxes = <&mu7 0 1>, <&mu7 1 1>, <&mu7 3 1>;
+		mbox-names = "tx", "rx", "rxdb";
+		memory-region = <&vdev0buffer>, <&vdev0vring0>,
+				<&vdev0vring1>, <&rsc_table>;
+		memory-region-names = "vdev0buffer", "vdev0vring0",
+				      "vdev0vring1", "rsc-table";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		vdev0vring0: memory@88000000 {
+			reg = <0 0x88000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: memory@88008000 {
+			reg = <0 0x88008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0buffer: memory@88020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x88020000 0 0x100000>;
+			no-map;
+		};
+
+		rsc_table: memory@88220000 {
+			reg = <0 0x88220000 0 0x1000>;
+			no-map;
+		};
+	};
+
+	sound-micfil {
+		status = "disabled";
+	};
+};
+
+&edma1 {
+	/* reserved for M7 */
+	dma-channel-mask = <0x40>;
+};
+
+&edma2 {
+	/* reserved for M7 and V2X */
+	dma-channel-mask = <0xf>;
+};
+
+&micfil {
+	/* reserved for M7 */
+	status = "reserved";
+};
-- 
2.53.0

