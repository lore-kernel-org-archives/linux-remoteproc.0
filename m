Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8038D347515
	for <linux-remoteproc@vger.kernel.org>; Mon,  1 Jun 2026 08:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303619; cv=none; b=iujvcRkPBr2xgRqKBVB6mqXnouG4WRo/zKZQaffTQy6/JDr2OvIMsulc9Xwl+og2OKOxKZXTYYGwDrLMaLGuXsAVjvirZXILIrYxvbebeG0pcAYZ1Id4/jtsb1wAsm9tRoiEDcgbUCMUdyYizoeqS1e02VyPJXEo+Vq9Q+dPPHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303619; c=relaxed/simple;
	bh=+gnqMdF6sQvdDRSsLkFmNOCWP1iFQjEJ5t3wReQzdXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uPb96sgH8kBF3NyIXn7Y/KdJOqhTbRgp30XNlXjHsVcFrbzbGIzDAqHJzzbd+xJbt/uEq7ZSZBRLSFEHJNIdJUo/GY5eiNRYNPwlZy72L6Z0hbDQwbEnZwIRwIZwVCmTMg1PEAvwShIRB4eZFY65eT3PCzBReQ0aqX9QL9OQ5nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=lBvuu6xy; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="lBvuu6xy"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4905e190c71so89774375e9.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Jun 2026 01:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780303616; x=1780908416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ivoUdfOE8Ta2RbgeRzZsz/bf48Yn0D8i5te5bRdSAV8=;
        b=lBvuu6xydf6ZfkhOHgQY+qPF553q5WughV7Bi+LH45ZHVrVEvWTCDiCS5Sp6gtYWBG
         dnj1PnPySrdT3q+ilcAXVAwRjZGATh6UkLgcWgiuV8cz7qqrc/Rko7Sjijx3IM5Ngnhv
         LlEcUuWwU/GBarYhrnJwz+ZkEQakPGAZM/w2ckizi0vb4kfpuqhVoRDM6wI6h+rCZ0Nj
         i4L1ly1WHZkeOtK/LXEHwYNz3tzt/OJAv7Zib/9lqzdwcjc/vJTfTj0pUd43ZtxDi1gc
         aZcM1oax0Tu/pArHytt/NPg/eRbOnCzf2HEcD5NIz0WSw4to20PubilfInmtYH5pL+pU
         yeJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303616; x=1780908416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ivoUdfOE8Ta2RbgeRzZsz/bf48Yn0D8i5te5bRdSAV8=;
        b=cvfD35JxR4uWLXmPtWynbXcYWR6/aNXlHx3sOqkx07lG11QaE1cHCiwsGA4jTAe2eJ
         F2I4D3mw/9EBcoKWiTVaHa1NCR/ZcR6Agt+D9k4jz3u4LxkzoCbQjgHsZF+euprm5bYa
         mjKQXWc1uc3lTLlWEpvmMvl6LEKoWZy4CRZ4QcQ7i1eEyFAtpYpSXAMWf+L/n+0oRmGc
         ItjsyRvTe9xHcGu7XoFLH9gXiOTeZ+r/lgLwX5YnIkNXERYqtJyC4pmoVXIfj+uZvF/V
         OjNlxQuSAOoRBZLMXLNFAfNIzbHhhdQL0npFG9AVRz1UsX8wg82EqCFSMC26/7FTEV7Z
         gl+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/q59s3P5HqYQT3q6oj7mJ4qJugOyV9jmdpalsv5rrupoEkX4DF1T4MRHY386PG46BUjlIMTtOeWmHEBYkLl8TU@vger.kernel.org
X-Gm-Message-State: AOJu0YxUoQDHmAZ39sW3bGVZxV2fvG5MD5RRvwbyGQPWCdbz+VOcS6wj
	+aeKm9+S/+6Wp7niVSnPDctkuJZ5/hEDlBlqpv5KrH10TTvR1u19Wi3XjxWZhPgXL1E=
X-Gm-Gg: Acq92OGJFN5FzJZw3sIq1uqIWI4X4j3jMHzjx1Hc+/wBRxLqyZySM05MCwIo5EFM+HX
	zXcp8+SfiYdScCnSiW+tZJn70PIZouoL8Vkg1p9vVmIHVsFvInqviR3Kv1A8Jqjt4HXgFtT746m
	DF+PHe/p1+Sh6QZ+s4AO8CFjknNykuIWneC/8ncOrA47uRixVVJHzl4z4myA8jpWBEVFEO2gI6q
	E8jgPYQlziQuBTIQuAqgLtONcuvOMLMfQXn2hcuXmHd6eHKu+u49rsnerjWoJaQ8k/Nbuaq26Ug
	f4CFJnRA7cYNY+gXUB0Oay3/DdhIhiSzEoB/KBjNehGuVghHJjgZvJfqVMiGBvQ2KFwgDOG7E7/
	RR3cdNzMY+n9jfp+h3+LML7mogBcmZ+FXfgk+RGGH6f86MnlqRwMD2FQvOJ4zLFKlUr8/vgKZwx
	HRD5h9xrEWaSwYdsoIa7RySNcgh2B8MbnZxJ5fn30C2A==
X-Received: by 2002:a05:600c:828c:b0:490:ade0:6129 with SMTP id 5b1f17b1804b1-490ade061c8mr19542475e9.33.1780303616006;
        Mon, 01 Jun 2026 01:46:56 -0700 (PDT)
Received: from localhost ([2001:4091:a246:8595:a745:3210:d732:4094])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909dff2a80sm271291435e9.3.2026.06.01.01.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:46:55 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Mon, 01 Jun 2026 10:46:12 +0200
Subject: [PATCH v5 1/5] arm64: dts: ti: k3-am62a-ti-ipc-firmware: Move wkup
 reserved memory
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-topic-am62a-ioddr-dt-v6-19-v5-1-3856a023aff2@baylibre.com>
References: <20260601-topic-am62a-ioddr-dt-v6-19-v5-0-3856a023aff2@baylibre.com>
In-Reply-To: <20260601-topic-am62a-ioddr-dt-v6-19-v5-0-3856a023aff2@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4472; i=msp@baylibre.com;
 h=from:subject:message-id; bh=+gnqMdF6sQvdDRSsLkFmNOCWP1iFQjEJ5t3wReQzdXM=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixZt3sbIng/W9/4Ih/28Ma+RflSFVVV61hby7Z89dKcp
 3tuo5x2RykLgxgXg6yYIktnYmjaf/mdx5IXLdsMM4eVCWQIAxenAExkyl+G/45Vj/VTL278Md3y
 /yux0jnMF6o2tL6Zf7RLcgFfrtgHpp8Mv5jm3b99xfmiqALb27nr7ym7eFfIVy9LvbKbk6FcRuW
 RATcA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Move the reserved memory regions used for wkup_r5fss0_core0 to the
k3-am62a-ti-ipc-firmware.dtsi. These are all the same for the other
boards as well, so we can combine them here similar to what is already
done for the mcu_r5fss0_core0 memory regions.

It also moves the bootph-pre-ram flags from k3-am62d2-evm.dts into the
firmware dtsi so that all boards inherit them.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi     | 12 ------------
 arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts              | 12 ------------
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts             | 17 -----------------
 4 files changed, 14 insertions(+), 41 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index de4048a3564bcac9558f88c94381f07db30d4f99..228ffa4be4be7b32e43a06d807d3fee073d203dc 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -59,18 +59,6 @@ linux,cma {
 			linux,cma-default;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c800000 0x00 0x100000>;
-			no-map;
-		};
-
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
-			no-map;
-		};
-
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			alignment = <0x1000>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
index 06d4e815b1670beafb8852b76a3f6a79295ce8ca..dceaee6ac57b01a280e891f70587a679f5b732a6 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
@@ -29,6 +29,19 @@ mcu_r5fss0_core0_memory_region: memory@9b900000 {
 		reg = <0x00 0x9b900000 0x00 0xf00000>;
 		no-map;
 	};
+
+	wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9c800000 0x00 0x100000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9c900000 0x00 0xf00000>;
+		no-map;
+		bootph-pre-ram;
+	};
 };
 
 &mailbox0_cluster0 {
@@ -67,6 +80,7 @@ &wkup_r5fss0_core0 {
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
 			<&wkup_r5fss0_core0_memory_region>;
 	memory-region-names = "dma", "firmware";
+	bootph-pre-ram;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index c1e9067b3bdd5ab0591541d4685bb17a5dac4f65..8dda657f854cc4456c38dae812f9e00646c6c0d0 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -53,18 +53,6 @@ linux,cma {
 			linux,cma-default;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c800000 0x00 0x100000>;
-			no-map;
-		};
-
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
-			no-map;
-		};
-
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			alignment = <0x1000>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index f5ceb6a1b5debabf1ead67eea634b48db1540186..dd6937789a9c6b7c92ef5ad1fcc3ae94a90e2353 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -59,19 +59,6 @@ secure_tfa_ddr: tfa@80000000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c800000 0x00 0x100000>;
-			no-map;
-		};
-
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
-			no-map;
-			bootph-pre-ram;
-		};
-
 		secure_ddr: optee@9e800000 {
 			reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
 			no-map;
@@ -776,10 +763,6 @@ partition@3fc0000 {
 	};
 };
 
-&wkup_r5fss0_core0 {
-	bootph-pre-ram;
-};
-
 &mcu_r5fss0_core0 {
 	firmware-name = "am62d-mcu-r5f0_0-fw";
 };

-- 
2.53.0

