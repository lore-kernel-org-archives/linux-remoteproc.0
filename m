Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBFB1D1514;
	Wed, 23 Oct 2024 16:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729700524; cv=none; b=JwNgmhR01zvyd6nmziT8xz4s/ber0UAgeTRQ9LUdJL8H39oC1qSuddh6EichCdPkUIM2VTVZKO691UPVNRgbEaP8NVXMpd2euXd34fgI7mccGXOsST0V53QTO+/9herueEwRETqXBbgNEH4DHz432sXGdblmKiADZKkHFFDgyjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729700524; c=relaxed/simple;
	bh=CV+a1u31LibQxT1yOOnoJsym4J95d6k8E+g1fOvjKYE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m0zc0iMnKSs/l/dETJQhHKQ169A3/7Gu7HMi0yfQW9t0gCppNhlGW5PMaELnUF+2U44dXMW5Nb0EmDq3ZDlbOyu1wXTsDSFSbN2vRauuiZVY6fGtSh+7pypWG2aOaT/LC/FODOoAYY/EmkfuaWorXaRk+HgKokqNgs71qJfveYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHgMGEsZ; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHgMGEsZ"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c903f5bd0eso4784005a12.3;
        Wed, 23 Oct 2024 09:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729700520; x=1730305320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXfzRrMmGuS4F2YWdJq/YzxJF9IR9HFQYca1G3wKa1M=;
        b=IHgMGEsZo1XeuqnxJxzBu88t6AMBDUSXe4O+IKoM61GVaXJOiQ9cQ7H4mM2voI9VQr
         ktzTisH7aRYirY1T89fxXd6uugjj/5m0sSdvO18Z7F3IVVG4ybVDKAV/NDDmG+4brND/
         FV0Fpy5kePpZiVMwScQhiKnO0pkI/6rBTUPbsxFlPNw/qjVhwqKYSrK6D/bAkmrWxtJZ
         xv2gMG7TsbOCsn+lqGBwgtCtmoG9mb3CKZ1csa4citMD2B8KP7I86jp3GBA4s9mIE6VD
         EUBmvf2tH+1JLGCkwlNk3oqh5jOD++PlDzpm71cEiNofNunMgd9wcWG7XlDO81QT7JIP
         4olA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729700520; x=1730305320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXfzRrMmGuS4F2YWdJq/YzxJF9IR9HFQYca1G3wKa1M=;
        b=ZWuojl2+AfpopNqTvzEcBA0e7aWyabNe4oMJv2x4zpSI+7ptRl823Zhq3Dtu7dMz7x
         TzDtBIRZ02g9w+uR1+cxsqX7At54kE515kt6JI7WFYZ/EkwL4uymVydXHjJRi2K1CUU4
         N6PyFXMCT3pxa7W9qFkMeyBBPy6H1l2NSKv5WrhDID1daFQe6/gsukz4EepwtdOuTe4s
         2ZlVaK1hKfU5yHGV5i8bF4hk4KEYKYwi730N5sZTBMnb4a4Ma+VTv8e0H2kVTMn6pct9
         vxH//OnwzKMJCLcW8eqhZQDCuwAvnQrKRleHUmq1ikYunMDKpHQdqoRiQi9DyQNtOoFG
         r3Vw==
X-Forwarded-Encrypted: i=1; AJvYcCU+zhEMS8h/44iF0nnItB90qX3dnyRq3faYBE8U3yzrIKipFBrwydkb6Mc4xEjivqvPZ1+oBV047GXd@vger.kernel.org, AJvYcCUkGhOcAJEj0oKOU29u7xfYlUXGl44rZN0eymxrfiNO519x7t9ukU04xEsHtlGBV1ZH4uAGAb2AsdRDqaY=@vger.kernel.org, AJvYcCW13cOXCBydfyh/BW2uZ5EYUWmFgD3qnQTpooDR+EY78ZIydo6PfF78Wq6RHrPpMQYxYGwzFHK5k8IqW/HJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7M4lV55Ccv3CLoKSZp3FMKvUgYkcFcGedgFTC/8YEV+plR2QV
	T/qjtEN4+89LMbPqfRwXgihgjqXT/ND2OMZHIxtoKVQLlTOkDT4b
X-Google-Smtp-Source: AGHT+IHyWANucfMDs/aKTkkC8XZgbLKNuPqA5aMjbx82Ju9yhv6/bGm9rJGwx/eAlr5ksCAKO44IYQ==
X-Received: by 2002:a05:6402:2344:b0:5c9:59e6:e908 with SMTP id 4fb4d7f45d1cf-5cb8ac5e8ebmr3350503a12.6.1729700520186;
        Wed, 23 Oct 2024 09:22:00 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c72609sm4588382a12.88.2024.10.23.09.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:21:59 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: imx: add imx95 dts for sof
Date: Wed, 23 Oct 2024 12:21:14 -0400
Message-Id: <20241023162114.3354-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
References: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add imx95 DTS for SOF usage.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../dts/freescale/imx95-19x19-evk-sof.dts     | 86 +++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 2a69b7ec6d6d..94660e3e8b2b 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -267,6 +267,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 
 imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
new file mode 100644
index 000000000000..b10dc1af5ce2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+/dts-v1/;
+
+#include "imx95-19x19-evk.dts"
+
+/ {
+	reserved-memory {
+		adma_res: memory@86100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x86100000 0x0 0x100000>;
+			no-map;
+		};
+	};
+
+	sound-wm8962 {
+		status = "disabled";
+	};
+
+	sof-sound-wm8962 {
+		compatible = "audio-graph-card2";
+
+		links = <&cpu>;
+		label = "wm8962-audio";
+
+		hp-det-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_hp>;
+
+		widgets =
+			"Headphone", "Headphones",
+			"Microphone", "Headset Mic";
+		routing =
+			"Headphones", "HPOUTL",
+			"Headphones", "HPOUTR",
+			"Headset Mic", "MICBIAS",
+			"IN3R", "Headset Mic",
+			"IN1R", "Headset Mic";
+	};
+
+	sof_cpu: cm7-cpu@80000000 {
+		compatible = "fsl,imx95-cm7-sof";
+
+		reg = <0x0 0x80000000 0x0 0x400000>,
+		      <0x0 0x86000000 0x0 0x3000>;
+		reg-names = "dram", "mailbox";
+
+		memory-region = <&adma_res>;
+
+		mboxes = <&mu7 2 0>, <&mu7 2 1>, <&mu7 3 0>, <&mu7 3 1>;
+		mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
+
+		cpu: port {
+			cpu_ep: endpoint { remote-endpoint = <&codec_ep>; };
+		};
+	};
+};
+
+&wm8962 {
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SAI3>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>, <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>,
+			       <393216000>, <361267200>,
+			       <12288000>;
+	status = "okay";
+
+	port {
+		codec_ep: endpoint { remote-endpoint = <&cpu_ep>; };
+	};
+};
+
+&edma2 {
+	dma-channel-mask = <0x3fffffff>, <0xffffffff>;
+};
+
+&sai3 {
+	status = "disabled";
+};
-- 
2.34.1

