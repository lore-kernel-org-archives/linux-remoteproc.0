Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C5F481AB1
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Mar 2026 15:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772550838; cv=none; b=O6xBd/+FQ9Dn+IbafOJb6DJHWdNQ/I4PsoleQ/BZWVHWlLkBFwWIdNZqUvVnRgXwE2U2m/sKP/farBLCYM9/WjwWGFEoi/tehqvl8UkI6cjWEGzjwDjjyxMCtmZ38j121C8aSQl+OZNA3r1cFZrfWrm0N8ixB5Q4bvZCHcwHJIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772550838; c=relaxed/simple;
	bh=8gzlbnd/lrhfH675InFOw6ENiznOrf5//f1/mKofVks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NTuDJ++NDZjRgKL9dUzgzeFvhmfFr/A19eTcCTHpdAogYHD3fzRLneeyx0DVk0fKpK6FNH8cxseO4rsDxPsQ5isi4ELInVj0c3C8RSC49MS3N/jcyrTli2L/aFCxGp6D4QUTxpB0DaPDrg/hJCIEJUggq4nRKV6XEUiUArUgivY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=v4vqRcXU; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="v4vqRcXU"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4398d9a12c6so4568500f8f.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Mar 2026 07:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772550835; x=1773155635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZfHnZo1dfLxFmlRErM/g2D0e3BjI58pYZzPrUU0N//E=;
        b=v4vqRcXUvfbaga6kNMZZd6P5BsjVYG+Jh2oByQqHKBcE+vCAeDrrlVsUvAxekSl/ln
         x/H3cYVtHd9ZNRTPy5BQS1H4dcUQIPIuIsIKu6C449yNHN/ZCGJq7Jp+9gP/GD4RkL/N
         XtvlDNzsqzWUNaMxA7QlWfh6Zhdnh91zhKd+xkmjGMO0i98cf5TdlQ0jCGoqCKYWHfGS
         ZA7ttslqBRj2Dr4qnMRSmj4W7J0S4LZc0bisqWPPLIJRWIw1kRJWfR19E/hbPlLESCR4
         MbcO3WTWAsdI2J/0lAQQe9sRGcqIgwMNwZKCA6eB1AT6+H92b4U31/FuKHfpFBCfh83E
         GmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772550835; x=1773155635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZfHnZo1dfLxFmlRErM/g2D0e3BjI58pYZzPrUU0N//E=;
        b=hhuch5aS460S9tWu6OxPRQ/VcAe67PwRbPUUn61aj1ZnDB19XunxmIqWnIll3b02Th
         z/iqGmEwYYT3Y5j/Oxr/RYdaEQWn0K/hcSvZ/1CfdBK2WLbKe+9Q40ppP/LNJRPbox86
         bRp0aufO1FX47+8KxXeFS2lBCeBeiTsvjxIGE7vDDyiRePOuMEYrEdOUwbIFuDbOQelX
         fctzQ054BdE1vLq/DUQQvy1CZtREMY8XUBAcdlP1B3w/FwIXBsl+4+8oy9hQR9cm7e2d
         ksdf64RbqPr+0JfrHkQGFQdWfwmGWLCij1+aQvp/+znDnoilwu7JyhsxgCWKpl6OKkPw
         0h4w==
X-Forwarded-Encrypted: i=1; AJvYcCVxVbgK4lC2G7mYAJAqEVkjSM4WXeFTEIIy4bg8Kl7d0KUX+4+t/noxyTMyV67CKQQuwBltInReDpDszNFE8X75@vger.kernel.org
X-Gm-Message-State: AOJu0YwuQ5FsrmRmxTfd584iTIEZfOUw42KKRImeZBI5o2B3DuAtx9qL
	QnsgBLPrEm0kyzrTpUmVYXittjxi53azaqNjEDDtS+wdhPVBiJCnIjWu6C3Kaut4Auw=
X-Gm-Gg: ATEYQzwO3DgkeG6VZg5kefNBbhtsYfG/kgHbFBJfJSfq5RWfXv24bxuXmosR2hc/Mgu
	DoQdsjetWwRPdQSZ21Lw6uPcjou+PT53+ZOfLJIiaVzYNtXCRfbrjuZHRKXsT70Ly1TY8m9+m8V
	HQALRdtdxgAjfKto8qdmQIldzP/gFVumYKJhlpfoSXwKj8PlrZr+T39RynuFXEdAxHtLBhpXnjg
	qCSzt+eDcdZ2de2X7MkP/l7YEVaD8LSMQjZ0IsbZSUaLwqD4ysoicyvekv5uuZNiLIaq0JG96FD
	1IMnejp3YS/LGf0ZGFz3EujSnZx8U006olDxKxb0CzIYaCbXQ1GGgzxeHWlGW3rMG8XuaGzwJSK
	XpT4Xv/jToOm1tLAzFVFKCp1hXYzNgREkvxdcFyKOoDP3PfdfR1lQFoNUGnYBXweU5zXH1amVKq
	+ux6QQJSZfrpyIe2KCAar7bfg38ngZlIE=
X-Received: by 2002:a05:600c:190c:b0:480:5951:fc1e with SMTP id 5b1f17b1804b1-483c9ba7fd9mr278150565e9.11.1772550835019;
        Tue, 03 Mar 2026 07:13:55 -0800 (PST)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48516f74a1dsm10515885e9.2.2026.03.03.07.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 07:13:54 -0800 (PST)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 03 Mar 2026 16:13:01 +0100
Subject: [PATCH 3/6] arm64: dts: ti: k3-am62a7-sk: Split r5f memory region
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-topic-am62a-ioddr-dt-v6-19-v1-3-12fe72bb40d2@baylibre.com>
References: <20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com>
In-Reply-To: <20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com>
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
 h=from:subject:message-id; bh=8gzlbnd/lrhfH675InFOw6ENiznOrf5//f1/mKofVks=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxlv2YuYdvkp1713/DdRHeX0qL0Pae9jt4V1d4dlrROO
 VhBg/FfRykLgxgXg6yYIktnYmjaf/mdx5IXLdsMM4eVCWQIAxenAExEbRXD/+LSPTkWFQmhnucO
 f2P4/i+mozWU7+B2pgPaPv4RzWen+TIy9C1g+7HIde2CuaW27mfFfSU5VxyYXBIp0RJ/Wufqi9k
 LmAA=
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
2.51.0

