Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B996E3750AE
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2026 15:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773330622; cv=none; b=A+vMMQAXXfYwrSsPkb5JA18SgvUhUDO+xmWOT/yKegvLkeO3yI0M27H/BCzkvetRfG7cBZicFsliSVVGIdCTEd6QHod3m+Qw2NH9uEVvCCDfJLcmG9EeElnuXI+OHwCxFKxVdzvdaliCn7v3TuB/b2CAEtYFatwLUzjnexSvGLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773330622; c=relaxed/simple;
	bh=eg8ypgw5ZqfczO8GaLg+1+WWvtaYju8g3PHYUIABZr4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I9czYMEjxishNjobSSOG6RO1Nb/rALGcWax6ZATFOksYzF735vFQmOfQ6G8BfZngD2c9ectxD7nba9lbkq6kYWuHd0yl8PsyhPa8BzmxTn5k3ahQtUo0wVOYNsI0lRSVE3KnlM0P17ElfKce4CCm5BZKmDFMYoNVluzoLAkka7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HTWJcXv1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HTWJcXv1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4853f2826f7so10650085e9.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2026 08:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773330615; x=1773935415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=godpTaFXAY2ep8bhfkFW/rBnOk7asG87yrTm6n99gBY=;
        b=HTWJcXv1frBLYwg1gZfaX5sDypfPfF45XUImqAgj+ZotTUvOzgPXvpcLQQJBeuFgCB
         5ycDVnAEaJ9y7JU0FPAoqiDTldJqEydWAbCaGlJ8Dc8lvNQOXcH7pcgqCXqipI9lCjR+
         SaYFkJvMVc8z8SwBjgbg+3cokzLqM8+/xJPRbYQkBfyEdk1e5ldYqPK8GJmhUmLNfMqr
         K0SaDGgiZo5kXr/2rwg9TE9V38cSwUpvfxGHjfeBKSdRajktewtwRPM193+EhW7ciMkE
         fIMfWFcpt6S3A2kiyMSw1SgRl4qOC52Utai9K+GfR0Tb/pY98msJiYsZjEHeVi3w+So6
         wzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773330615; x=1773935415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=godpTaFXAY2ep8bhfkFW/rBnOk7asG87yrTm6n99gBY=;
        b=PZciTI7PxsWWuhCsJh2bH4zSHtBNB5VCQJc1DqKiFZDQ0Rqd498n5QfmZE4f37MJIX
         q6OrVq79CkmOUkDshPHwIrIfOJfGHsVbPgEIdCAxi1awZ4Kqgk41U1tJRRyEopvG+s9/
         ghBdzovbaAOCkGI6gpcopzLWh2k8pS4hmmXRG0T4Q96WrXgQFlzIFLJF7bX9r3tyjCqR
         l83fSfib2xvHmpgokrefD5FXzeKABbTkrjtcK3i7LC0cdgd9ZVdkvsgIx0baA+ZuuBs2
         wYGuet6uorMTKK3qIkf2lJR3WmzpRWPQcWtlu3qoIeO8WwYJnp6MVJQwmd8wBhL4uCfY
         KAjw==
X-Forwarded-Encrypted: i=1; AJvYcCUDFdaTdkAdLhvA92pkOip7ivSdGXNKQ+O3TNQ3+10vH1HfODesFp2LRgbi8x9ZpRGJIpWq+AM0/wlk8PCyVC0N@vger.kernel.org
X-Gm-Message-State: AOJu0YzwZs5qPQCRjYpWxc7HgOOuqmFs0TbF//bVYxbSQcd5AQRhM+sZ
	f5/YdGmmUCLCz9yLQcL/w+iIqRqrmGF12Qq2LMlgeARsLtRZRICInMCzLc8jWMdGoLs=
X-Gm-Gg: ATEYQzxj39/F4VGxgVonAFOYDACfyzl0xM51mytxA+QmS1NhNYelJxI+6wtcAMak7QG
	wvDPFiHn6MpT5oO0Lez6GS4aHB1ASOjg6PlnxaEhcyweSUEh+pF+8nxTb3Gxu7yWR1+932bXOpf
	50NM5+5+KqNySFQr9+hjJJqpCJQbEzzC0lEa53vQ5YdUgBRme8IhALDbzr6wl8fTU3HNzalJnrd
	4Xcni3Izr0EUtSK0qpZYbK4kCWumpHOLg71rchpTUFuHtvb5wvLzWReqXW5xorP77G7FMGUVoU1
	Ng4LngFeET2bgSaOCYO0TaMSnNDl3HhIbetNgUVAvKxdAiPNjWcQZxXwedSIHTsuIVyFNu044+z
	rh2+7P/MKhcGVEDh1Ph7YHy/mL1gAJfmniYAhfcQCy3Z9CSScZ4dwiCiAtpl0g/YBU5QdJXqGmN
	djYVEDCfVq94r1b8qLAiDMUMe/YjSUxxU=
X-Received: by 2002:a05:600c:37c3:b0:485:358b:e80c with SMTP id 5b1f17b1804b1-4854ad76a80mr122016195e9.0.1773330614674;
        Thu, 12 Mar 2026 08:50:14 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b65fd3dsm143086075e9.10.2026.03.12.08.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:50:14 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 12 Mar 2026 16:49:01 +0100
Subject: [PATCH v2 7/8] arm64: dts: ti: k3: Use memory-region-names for r5f
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-topic-am62a-ioddr-dt-v6-19-v2-7-37cb7ceec658@baylibre.com>
References: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com>
In-Reply-To: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com>
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
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxND+YW9r5sfuzD9GXfCc7e6YXz4g4satwx0+nwnLUah
 2fz5RXHd5SyMIhxMciKKbJ0Joam/ZffeSx50bLNMHNYmUCGMHBxCsBE9jsz/NP+Pj/qzZbMutbZ
 wkyeN1x3Z+qqHrVcb3l8WfSsWMN/pWIM/4xXl7zlnM+izO41b274epHE+DNFtzmF71gv3d4fFSf
 wmQsA
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

