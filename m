Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656B43E6381
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Mar 2026 15:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846868; cv=none; b=qStPbdBYLPx7G19xnLh1y/VIb6LT3O1ha4hsbNjJU7TbjiVmks77UDQLbynDFFziSN1KwcZpNR5GaQSeEgIYddcMt8EpiDqDQvdQ5yMkl70ODZsFdsL8DTa/ryooRPi0IGef1UTloFH2zKpLdY4ODWFTCh2HF1ouhaoKbbIwI4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846868; c=relaxed/simple;
	bh=XPX0yeV9y6Q1/hILfx/rQYzRxhs7KMWJhy8D6EKmBWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EjNI3O13eAOlkX/dOMigxbwJsXOpT3ulzYInF1FaCs9SvW+oDt595k6NsKVIKbav5t0FY1Uq2Y+KsgVIEttb2PyPoWtXKsrvME2L2ZbLSZc6mVu/CHzZ+140YN1DbSzJd39sx6c2WyEMRgKD0FID+38Yt9/Xk9sUW6afj+CGW1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Dl226U51; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Dl226U51"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43b4fd681c2so1542221f8f.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Mar 2026 08:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773846861; x=1774451661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7J/XuAEJGTEZtvWSSq3yXfnStm9aseiZmgqCqYghcM=;
        b=Dl226U51c6Z+Uec3GTkhhCGJKDJf7hkEJ/T0iYaorcDl8n+h0mW+BQ3bluFPSlbEkr
         TjS/zGNBJRS6bldbJAjsApMPl/SyxqykaiV9Vbi/xmbmY1l6t+iICGlyP7BSUd/6xLtm
         AstVo/rX1KfF9OTWuQIzcEn3CW7tFIpGIITUh6ySeJchrJdV+AVqnQHb7GaCHtywaOo4
         AB9Yx1r1teAKkSi5L5nxQVExGF3ptEM1yPjvXTYjEZ9hvSEHqaov/tD0BlB8zGRPxgm1
         nOHgvOIUv0uaGSU5qQsZ1jibbvQHEVsyLN3jGKeIXWbpwEAYBUMaG4N0PpRNTW1Wt9OC
         JHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846861; x=1774451661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J7J/XuAEJGTEZtvWSSq3yXfnStm9aseiZmgqCqYghcM=;
        b=AgqZXrDqeNO7kqDugOJOLZJ51QGOpj7+KrWpZOD/3CvDt6Lxlu/2t17p9LvVSGatBG
         4Wwy3rG+mEW1XXx1377rK5IGBlGd6e/vKm2xN+e87v79CigqWJWJHqEba1HJg5bpn/7i
         UgtUBG0GEkrqjS9+GtL8FSKZeFD2cMAfEEnhnT2/JxN4kkIyxUCXdK2HDS7NmIE0YwsV
         fdobLbKPWrFDyw0aAlHJzYQgP8tPBP5vYE8w1SkvNI37tzLuKbleWhKDBUtux106EOsv
         AsoieovDIZDK10QGolVgKZM+ivFhWddA+mFu1Bmstv+4ZPgNKRk3Cz+lrNmpzL6lkDoh
         6EMA==
X-Forwarded-Encrypted: i=1; AJvYcCVMtEThAaZv4JlrF1oBdd986sd06hTK4XUK8nx4FcbYvfotyU2Pzh4TtnonfSnHWcsJfODPUpVkZtMs4LJ14xTL@vger.kernel.org
X-Gm-Message-State: AOJu0YxfchsHx5Yu/VDElOp5cyttX6SKWAswNW7Tnb+fQdXbXFEm6mra
	hbMPueF4eSyDrNOQal92FJhonUiEBX7vuKvYBjMqvGY6f5AefsBSl4jWLcqgCMJEHIs=
X-Gm-Gg: ATEYQzxajrBy9k5FuLQQDsCGEQnkPiufkqrorb15HVkObx93ihhXxXAEBCi2r0OgzkN
	AXAmsgFJ6r5M+C0tZiGt1I984qtR7J9KUs96eSnTDgtYaKlgmAh+s9Nyxvvdq3yY7CfpLgFGrA3
	RmEattqdwHLBBRAEWis0xMmU34epiq2skv4ncLUxS2NRrivxreEEIbgGt9vOpE7FDP9PaWro84R
	NjrunfV5R/W/55+slWC6X8GNEmcS7tr+JKpcPFq5vJ2AdSuVwErvcURLCMnohvf/S2/FORf6hyT
	feRd351VALxOAghFYuVNiE/uDEtUpT6kL0pmzRd/0hGHfHJcm39cWgKbF0yMzphMwe3FnydAOBN
	5cwFCT3fFieNNUWTcemWjOZuGR6y92gFoB/4mEvMsphdoJS58WTJxuTVXWu5ff2urSgW1gKb3J6
	MlFw13y6vpwLkBO1dhUkOK
X-Received: by 2002:a05:6000:608:b0:439:b858:1d28 with SMTP id ffacd0b85a97d-43b527c429cmr6235032f8f.26.1773846859401;
        Wed, 18 Mar 2026 08:14:19 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892290sm8063440f8f.20.2026.03.18.08.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:14:19 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 18 Mar 2026 16:13:11 +0100
Subject: [PATCH v3 5/7] arm64: dts: ti: k3-am62p5-sk: Split r5f memory
 region
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-topic-am62a-ioddr-dt-v6-19-v3-5-c41473cb23c3@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2273; i=msp@baylibre.com;
 h=from:subject:message-id; bh=XPX0yeV9y6Q1/hILfx/rQYzRxhs7KMWJhy8D6EKmBWY=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxdB3V2ZCVcX7v3SmPaKv6pV+bsuL0mR8HO9Vl7AV9gt
 PnGo188O0pZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAisXKMDM/3O8zdU5XYcGoN
 w0qV9funcVevuKr08a1G6HHGmJPqxx8z/E+ekj6jXfL2iQX6wqL8H3/M0KufrLN7ocWrxN2f169
 s2sYMAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Split the firmware memory region in more specific parts so it is better
described where to find which information. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 40 +++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index 4f7f6f95b02ef94a140edcef595ad8f6cc4b4113..7fa4924ab52484c7ac4243a0cd6c0d7aacaf8b30 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -55,9 +55,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca00000 0x00 0x8000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca08000 0x00 0x1000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca09000 0x00 0x97000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dm_region: memory@9caa0000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9caa0000 0x00 0xd60000>;
 			no-map;
 		};
 
@@ -833,3 +857,15 @@ &mcu_uart0 {
 };
 
 #include "k3-am62p-ti-ipc-firmware.dtsi"
+
+&wkup_r5fss0_core0 {
+	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
+			<&wkup_r5fss0_core0_ipc_region>,
+			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
+			<&wkup_r5fss0_core0_lpm_metadata_region>,
+			<&wkup_r5fss0_core0_lpm_rest_region>,
+			<&wkup_r5fss0_core0_dm_region>;
+	memory-region-names = "dma", "ipc", "lpm-stub",
+			      "lpm-metadata", "lpm-context",
+			      "dm-firmware";
+};

-- 
2.53.0

