Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212C53E5564
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Mar 2026 15:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846865; cv=none; b=Nnd7fPWT36tMHia0wpKXoC5WB2g4+wmlIz1YKKz/9/+BpUJGMdm6UACJhIL5EzFW7sVOzoBCs30gB6NYRhTKH5Lhhl+1EjUPeY4lpO4m9zIRd+keTzX18FR2YGZ7X4f5uW39k9W0+sRMuypTsrTS8xYpnTD1TTNcUkawMzibpnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846865; c=relaxed/simple;
	bh=eg8ypgw5ZqfczO8GaLg+1+WWvtaYju8g3PHYUIABZr4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SH5fP7ZFt+hJUHo1N71z0DD4hTClsvwl+InISE3yH6xOsHpEAVKnYyrbhrSJCRIXmMoVqlk7NitHVzVdEk49IVlikIEK0e/WfP9JUgKWx9KoQSf/akat72Cd+RFnKWdyzChiBDRQrFciIF2pTFbxg9igHWnZnIl7z7CcOyxm6KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DI3quUU7; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DI3quUU7"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso78461615e9.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Mar 2026 08:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773846857; x=1774451657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=godpTaFXAY2ep8bhfkFW/rBnOk7asG87yrTm6n99gBY=;
        b=DI3quUU7zyv4eUOGadP8WypZT0058pql8U26s6izibozTBRtn+fu0LGHtctqPsxW9S
         /5EzjKBtOwpAFTqf4YIuUHHXAK48GjMLvGGkL7xsFITHntDqcYAmnFLCRKyFZXCbBv9N
         LrlhE7NV/zNUkXRNVo0/jSFumHOnNtqUSASfQm0IHmud35zXOFXHzzbO6kkDoP7096Wa
         fcC4hC6We4xuyj3GaqTwKnaix9cYurpzzRORMOfUnRP+W+mjCU8boLrc/QMVcS7Ripmi
         Y/nPgb9DMa/iAHTH2d5LVP1Nlun1AG+isG8bUebYOjhXlKczr0vDpjz837uQmtlFpcQq
         4YAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846857; x=1774451657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=godpTaFXAY2ep8bhfkFW/rBnOk7asG87yrTm6n99gBY=;
        b=TXxz1DeiakTBxHC+De3c8ik94VuwvmyXKqAEFj5lmd3lJdaEO9iv6Hx6yyuPFJrXsx
         V/kcrXF3d77zJHiKEzBbIlv300t/BnK87fxP25eceQRBmtMe/qjFGWljDS46USns6LKL
         yTEMUNrEYgYF6j2gIA1CWpp2wFbNe502+NW+mQ30HySyn7i/Dbc8RU+xPg/MTxFYZkSu
         AFYpZIzOQacGmeoz8K7lV3eJ8cvQrihS61tCKFMdDEBPQVbFHSj5mwoefF0fm56bWIPf
         USLOBMUOw4hGg+IG4EyxG3cKnRvO0rDyjqWxtFmk7L6fgWhskxO/I4mvgStKBsKQ+dnT
         5zqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNoHcw5NprxAtr8W8VBt2imJLPRkX0mY4gpivlB0uonEx0QKs7StHqGeoScyreCnOerLjm9QkHW37GG7+drpwn@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv0T6dTtYxXuWPzC7totG2ZQVZGN0gmbUFTy4FZTcroIWZqkqe
	CxPX0q/1NZ7ktXud6RuOgriwzNXPjjYDFAa/3GUBhmhcCrY7dYu5RqsFkgidxiEtfmU=
X-Gm-Gg: ATEYQzwdkdOKMTPpiQWVmaw3RTr2IUBbI5aPIksvXHaYJx+u+5EAP4HEJDgSurJA9Jq
	QSqM2E5Kb4s+Ni/PM2IOvPp+D3X6BxcqFIfNCatOgBQdqznGAKqz+ADBxlwPqs+LaDs6N04OiVd
	ZwQz4cejB0OJV1Lm1fH5h32ecqRfX4VIjUEouCgDrCcC3BXUwR+9iZwh7/u4ZKs5NwZ3q4BZyPY
	u9Zm2/wDOpzP1w/dNorfTE0+ItGURepbVQNWcsWqgo3BXqPs3NZlTwDnMcYpBKfbLIW0LB0c+wL
	jB5towZj5pQc1GUiDGkN6rQq3VNzWzwHHiT1LmW5PK6jtJqhTaxuG4z1bsK39TkIXT0M11fPJzi
	nQMXgifkkAxbMovH66ZBiq3DQiA698zmIN2v7BkAyzFpUAw1OqmIQolbtF+NfGMGSBs8ZQrQGbc
	ns0DpO6sVObxHEQR3Jh3Jp
X-Received: by 2002:a05:600c:4685:b0:485:40c6:f507 with SMTP id 5b1f17b1804b1-486f456feb6mr64803965e9.30.1773846857053;
        Wed, 18 Mar 2026 08:14:17 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f75f774fsm11253655e9.32.2026.03.18.08.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:14:16 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 18 Mar 2026 16:13:09 +0100
Subject: [PATCH v3 3/7] arm64: dts: ti: k3: Use memory-region-names for r5f
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-topic-am62a-ioddr-dt-v6-19-v3-3-c41473cb23c3@baylibre.com>
References: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
In-Reply-To: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14721; i=msp@baylibre.com;
 h=from:subject:message-id; bh=eg8ypgw5ZqfczO8GaLg+1+WWvtaYju8g3PHYUIABZr4=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxdB+XcPJp1Hif+2KPQlu1mnV8+9dq27GirRSaz7+84Y
 sipWz+9o5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACYSLc3wP7/xyUxenVcch9ef
 6L7S+Pf3mi9a071DY/2cuya/U+B54MHI8O/DGpnqJ1y5czq2rJZjtyz60RLr2lq86XHqnf/1mX1
 nGQE=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Add the newly introduced memory-region-names to all occurences of
ti,*-r5f. This helps adding a name to each memory-region so it is
easier to see what memory regions are for.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi               | 1 +
 arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi              | 2 ++
 arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi              | 2 ++
 arch/arm64/boot/dts/ti/k3-am64-ti-ipc-firmware.dtsi               | 4 ++++
 arch/arm64/boot/dts/ti/k3-am65-ti-ipc-firmware.dtsi               | 2 ++
 arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi              | 4 ++++
 arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi              | 6 ++++++
 arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi             | 6 ++++++
 arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi              | 3 +++
 .../boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi      | 8 ++++++++
 10 files changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi
index ea69fab9b52b0458a830c03adbccbf3c2842a9c9..ad247f53fe82da57504e5ffc0351c8cc3c4a0e67 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi
@@ -48,5 +48,6 @@ &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
 			<&wkup_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
index 950f4f37d477a32b5eb5f66c97daed4c8fd09aca..06d4e815b1670beafb8852b76a3f6a79295ce8ca 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
@@ -66,6 +66,7 @@ &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
 			<&wkup_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -77,6 +78,7 @@ &mcu_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster2>, <&mbox_mcu_r5_0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index d29a5dbe13ef7e66e7df8e8c3542ab5c4dc64262..5d7f701420e2d8308b637f3064c560e485ed85f2 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -45,6 +45,7 @@ &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
 			<&wkup_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -56,5 +57,6 @@ &mcu_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster1 &mbox_mcu_r5_0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am64-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am64-ti-ipc-firmware.dtsi
index 6b10646ae64a62e19067b80bead7c99643d1702b..51fd9b68f58d1f8ae3a7a77a48f74a77c2c795f3 100644
--- a/arch/arm64/boot/dts/ti/k3-am64-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am64-ti-ipc-firmware.dtsi
@@ -126,6 +126,7 @@ &main_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss0_core0>;
 	memory-region = <&main_r5fss0_core0_dma_memory_region>,
 			<&main_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -133,6 +134,7 @@ &main_r5fss0_core1 {
 	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss0_core1>;
 	memory-region = <&main_r5fss0_core1_dma_memory_region>,
 			<&main_r5fss0_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -144,6 +146,7 @@ &main_r5fss1_core0 {
 	mboxes = <&mailbox0_cluster4 &mbox_main_r5fss1_core0>;
 	memory-region = <&main_r5fss1_core0_dma_memory_region>,
 			<&main_r5fss1_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -151,6 +154,7 @@ &main_r5fss1_core1 {
 	mboxes = <&mailbox0_cluster4 &mbox_main_r5fss1_core1>;
 	memory-region = <&main_r5fss1_core1_dma_memory_region>,
 			<&main_r5fss1_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-am65-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am65-ti-ipc-firmware.dtsi
index 61ab0357fc0de01df641b887b47e88ee26b4f2fb..e5f37cfd18bc55c86e9970cbfd25d354371ac079 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-ti-ipc-firmware.dtsi
@@ -52,6 +52,7 @@ &mcu_r5fss0 {
 &mcu_r5fss0_core0 {
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
 	status = "okay";
 };
@@ -59,6 +60,7 @@ &mcu_r5fss0_core0 {
 &mcu_r5fss0_core1 {
 	memory-region = <&mcu_r5fss0_core1_dma_memory_region>,
 			<&mcu_r5fss0_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 	mboxes = <&mailbox0_cluster1 &mbox_mcu_r5fss0_core1>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
index 9477f1efbbc61d0befc56368436ccbc5007a1411..d65f68c7d43210b5af8eff52c5cec6ddb54e5c68 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
@@ -100,6 +100,7 @@ &mcu_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -107,6 +108,7 @@ &mcu_r5fss0_core1 {
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core1>;
 	memory-region = <&mcu_r5fss0_core1_dma_memory_region>,
 			<&mcu_r5fss0_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -119,6 +121,7 @@ &main_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core0>;
 	memory-region = <&main_r5fss0_core0_dma_memory_region>,
 			<&main_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -126,5 +129,6 @@ &main_r5fss0_core1 {
 	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core1>;
 	memory-region = <&main_r5fss0_core1_dma_memory_region>,
 			<&main_r5fss0_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi
index 40c6cc99c4056009e9ff66adb831400b8842de9e..5d4fc26b413b22a9c2168e5d37f04475511a75a4 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi
@@ -219,6 +219,7 @@ &mcu_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &mcu_r5fss0_core1 {
@@ -226,6 +227,7 @@ &mcu_r5fss0_core1 {
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core1>;
 	memory-region = <&mcu_r5fss0_core1_dma_memory_region>,
 			<&mcu_r5fss0_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &main_r5fss0 {
@@ -238,6 +240,7 @@ &main_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core0>;
 	memory-region = <&main_r5fss0_core0_dma_memory_region>,
 			<&main_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &main_r5fss0_core1 {
@@ -245,6 +248,7 @@ &main_r5fss0_core1 {
 	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core1>;
 	memory-region = <&main_r5fss0_core1_dma_memory_region>,
 			<&main_r5fss0_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &main_r5fss1 {
@@ -257,6 +261,7 @@ &main_r5fss1_core0 {
 	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core0>;
 	memory-region = <&main_r5fss1_core0_dma_memory_region>,
 			<&main_r5fss1_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &main_r5fss1_core1 {
@@ -264,6 +269,7 @@ &main_r5fss1_core1 {
 	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core1>;
 	memory-region = <&main_r5fss1_core1_dma_memory_region>,
 			<&main_r5fss1_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &c66_0 {
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
index ebab0cc580bbb2fb2b101450ea7def0bf717be0e..5253d028da0946e6dd619c0adebdfcf88400cb14 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
@@ -190,6 +190,7 @@ &mcu_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -197,6 +198,7 @@ &mcu_r5fss0_core1 {
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core1>;
 	memory-region = <&mcu_r5fss0_core1_dma_memory_region>,
 			<&mcu_r5fss0_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -209,6 +211,7 @@ &main_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core0>;
 	memory-region = <&main_r5fss0_core0_dma_memory_region>,
 			<&main_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -216,6 +219,7 @@ &main_r5fss0_core1 {
 	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core1>;
 	memory-region = <&main_r5fss0_core1_dma_memory_region>,
 			<&main_r5fss0_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -228,6 +232,7 @@ &main_r5fss1_core0 {
 	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core0>;
 	memory-region = <&main_r5fss1_core0_dma_memory_region>,
 			<&main_r5fss1_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -235,6 +240,7 @@ &main_r5fss1_core1 {
 	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core1>;
 	memory-region = <&main_r5fss1_core1_dma_memory_region>,
 			<&main_r5fss1_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
index cb7cd385a1655375931bac1d65fc766ae174234a..a59c3648d8056c8a759fcc536e51bc9adb04a62b 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
@@ -123,6 +123,7 @@ &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_wkup_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
 			<&wkup_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -134,6 +135,7 @@ &mcu_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster1 &mbox_mcu_r5_0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -145,6 +147,7 @@ &main_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster3 &mbox_main_r5_0>;
 	memory-region = <&main_r5fss0_core0_dma_memory_region>,
 			<&main_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
index 455397227d4a1081a1579061208b7e92db32ebd1..d08fd3ff8a8902b7dc1f0f55c251e5546f1bdd2c 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
@@ -262,6 +262,7 @@ &mcu_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &mcu_r5fss0_core1 {
@@ -269,6 +270,7 @@ &mcu_r5fss0_core1 {
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core1>;
 	memory-region = <&mcu_r5fss0_core1_dma_memory_region>,
 			<&mcu_r5fss0_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &main_r5fss0 {
@@ -281,6 +283,7 @@ &main_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core0>;
 	memory-region = <&main_r5fss0_core0_dma_memory_region>,
 			<&main_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &main_r5fss0_core1 {
@@ -288,6 +291,7 @@ &main_r5fss0_core1 {
 	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core1>;
 	memory-region = <&main_r5fss0_core1_dma_memory_region>,
 			<&main_r5fss0_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &main_r5fss1 {
@@ -300,6 +304,7 @@ &main_r5fss1_core0 {
 	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core0>;
 	memory-region = <&main_r5fss1_core0_dma_memory_region>,
 			<&main_r5fss1_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &main_r5fss1_core1 {
@@ -307,6 +312,7 @@ &main_r5fss1_core1 {
 	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core1>;
 	memory-region = <&main_r5fss1_core1_dma_memory_region>,
 			<&main_r5fss1_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &main_r5fss2 {
@@ -319,6 +325,7 @@ &main_r5fss2_core0 {
 	mboxes = <&mailbox0_cluster3 &mbox_main_r5fss2_core0>;
 	memory-region = <&main_r5fss2_core0_dma_memory_region>,
 			<&main_r5fss2_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &main_r5fss2_core1 {
@@ -326,6 +333,7 @@ &main_r5fss2_core1 {
 	mboxes = <&mailbox0_cluster3 &mbox_main_r5fss2_core1>;
 	memory-region = <&main_r5fss2_core1_dma_memory_region>,
 			<&main_r5fss2_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &c71_0 {

-- 
2.53.0

