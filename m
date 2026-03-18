Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355203E5580
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Mar 2026 15:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846866; cv=none; b=mNwAqn3CT9NDoMAl6bkktxDMTAKjKpDXnK2INEjpyFWyEu3irSRshuhCclwVaTMU+arKA4X/lbs5xUMJEyuBxKZTBAIgCScC9fQRWgWa975Teq2Q9/9Vey+4SZ0NO+AW1rFQziP+AbC/ESpYirYc+cguO3L3oVbSkN6yommlOLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846866; c=relaxed/simple;
	bh=8u+OHH2OFtnrDqEIjHNZaX9z21vlFvfBncTMKuwpawg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MqH1SeVEpjzl9e55CYgBAz81aGb+poG2m+ogUtlam5olj1ApJOHvFE9m+JxGzUFJ91tUTYszrNhtubnEYWbWlYzUv1HcJ5+6SOpGPRF/DUHn/7lWuuxMG/DI9cjX4EowWmZXVKOwRgqHi7v2k8OcWcGSqYVpIVOOEhhHvnoMaDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=BmcDr2yz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BmcDr2yz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852e09e23dso60096345e9.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Mar 2026 08:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773846858; x=1774451658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6FKMrTLP+EgoNwLb1d4K/Z1ONjM0ZaJwdkY97QIcxI=;
        b=BmcDr2yzdSM5Tny+rm8768G+62jiM1jVGGtCCsEj2gd5bWRRN6Z2W/hoBZuV4NaXEo
         QYgMBkp6yvtIwLtWOsshCZr1gLpQRlQXX3MUl92etLphOX3kD8tF+qqs0qOmpTpJJgsX
         Ag0cXXZx8vaRRn56zA3pLHsiTzvw4uWbP8vfysXDhFYoQkBgMTo/6epnVJSk7JSAP6rE
         R7vUfcAkAajUgm1HDeqPsjJELFhFN2LaazpD7vsqFhMTehfChZR3Dg1smZ8t3VzZYUzH
         Lcfvi5+k0/x8TZTbJ9pkTLpx7uWlJzyI5UDLtqeJV4ppLv/6H3GV4V75IDB4GVj1+ia1
         jBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846858; x=1774451658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d6FKMrTLP+EgoNwLb1d4K/Z1ONjM0ZaJwdkY97QIcxI=;
        b=N1+kRXDRQDN66VoDlrrchDM//DQIm7BVQKnRCY+weXXOzZzvOhmI3Hdz6L284625AF
         NGwEJJPVlDLdTlIjjvPoIm7AjhbDPjP3Zdtle86VCqNoXlm5cDF3+wvRveBv8CtNPyXO
         Z8ah6i3POaf/aIrMOT46u6AM5RLv54yFAHhn64qCQO41jX/SpTqH42A8oXFl7DwTozmY
         WHqLgj+r7fur21K1FjficniZypxAqjA/STzi8JrI/Hg0K3om9IWy+yxVzDfP3pCWruh3
         H2lljpzY48EkCF9VxbcgVlkOHvIr8m01vPxZtWyhkyj9n9+B4X8iBw9ZB5E6rsUpWIX+
         4xeg==
X-Forwarded-Encrypted: i=1; AJvYcCXv9xS0h1PloOfrQbrMONsO2Bo2apELCx0eWkGDkezlEWuopdg6dDjCEF/HwEh8LCpip5wtvauJOg8ENDbsAJ+5@vger.kernel.org
X-Gm-Message-State: AOJu0YyHWAj6StP96XkFTOONIpBtfdSxlxVQTxJYgAYskF9yYoUzolh1
	PhoNns2Og5SIMhY8rl+f1Zaar6qBwtgGzGbnBt2VG+3vonHLKJ4BLbnj3Y6+IGt9snU=
X-Gm-Gg: ATEYQzxND80cZ3jC1X/5NJwX5k0YxzzisClkVIpRvRi/BhSRy8H8SVSd8krbVJeY/OA
	kt6CQzaIO3HDWlipcm/+8FQLlXX9eqpJWJ+FFbdmy8bLrswQb551kQrtUqBhOvbv4XFMNyEbkSm
	QSDabFqhgK+8ulujA2HbIv9K//a5mdE8ToIcOD3KtSpMLUxwFMP4e2/+Me2YT7/SxFs++HYgSB+
	5+ueEVC4cLTUoOdcikdP1ZDTAHznd70HoRI4J1cdQXxRyDPGfpDC5Wyhw4JcPQ4n0lE1SJsO6OJ
	lucNwKGkJFChZi/zzqYF0OnHcj7HHLpDyXbYd3YVJnN4kB7NOvepjMNcQ4vy3uWE/EVJNV1X3k9
	VFoyUN9QsqxU71J5fH7mGtv3C71qXJM1/qmNeDWvgRSrEAmla01EvfdqMhIKTPFhGMvhj+WWlZg
	ErvUH1lPnYwxljHLsXFbGXytRajtM3Q2I=
X-Received: by 2002:a05:600c:1f10:b0:485:34b3:858a with SMTP id 5b1f17b1804b1-486f4429d04mr58038485e9.11.1773846858250;
        Wed, 18 Mar 2026 08:14:18 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4bbe471sm22788945e9.27.2026.03.18.08.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:14:17 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 18 Mar 2026 16:13:10 +0100
Subject: [PATCH v3 4/7] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-topic-am62a-ioddr-dt-v6-19-v3-4-c41473cb23c3@baylibre.com>
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
 h=from:subject:message-id; bh=8u+OHH2OFtnrDqEIjHNZaX9z21vlFvfBncTMKuwpawg=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxdB1Vz/n1aOGmeiVvd0XeuFj/O1kyweeiZ7nNz+sbfB
 TmnGdxZOkpZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAiBX8ZGV5YbV5Z9Xf1fp/F
 i9IDzHYWB2kqen23CD0yV0phy1X2cBZGhn7fzJgl53sdSsTNtFov/RIT+KEj/tTXYoeyu0DYK34
 xZgA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Split the firmware memory region in more specific parts so it is better
described where to find which information. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 40 +++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index e99bdbc2e0cbdf858f1631096f9c2a086191bab3..c381cc33064ec427751a9ac5bcdff745a9559a89 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -59,9 +59,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
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
 
@@ -922,3 +946,15 @@ &mcu_uart0 {
 };
 
 #include "k3-am62a-ti-ipc-firmware.dtsi"
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

