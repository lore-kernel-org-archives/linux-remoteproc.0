Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B25346FCA
	for <linux-remoteproc@vger.kernel.org>; Mon,  1 Jun 2026 08:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303620; cv=none; b=WLOLpaFp1H3oOGbhwrc0Dn+8WlBVkHUiB2W56kgMGTLuSIldZJY0oX2RgNtx0b9V9yYqBD3bBYzCtai0m8yMdBAZs2QSwwxnUoTHOZgeTI2bJ26URPqOnjtFLve+PiEmh0b5LDGHDtrE4OLCheWXqd/nJ6DbQoXTZ46lkc0MsJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303620; c=relaxed/simple;
	bh=AoejhMWFhhzgn/Oz1rWsnXYdKgFZw/QDwGfYGclplaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DjO+wzbPpyPhoVPP4QFvv9RLiUQnEUZbjKSYiHQEnh2UvCxmMTtWBti956vEmv8S5fhJpzQvbTBvJqQ52O7SvTTgejH1UPyJFlXbrhwNOJlKaNdbGFocxlpxJxm2v8FjfkcHRezqZsR0WjPsa0G5+YgXr6j204U/YW/G1yfIp1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=aIc8l0Rm; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="aIc8l0Rm"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45ee1a56328so4385636f8f.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Jun 2026 01:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780303617; x=1780908417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GC0UVsmy6URrMQSSCL/Ft5Q+Xpgj2pACeOoCZV6IJH4=;
        b=aIc8l0Rm1Bsm/Pjyl52IhIfO082unliVWrw13DP3eBGaazvbNI2GqHvvqfx0YCkN9N
         wzMhE372z+UbIrcIvNbz1wpnlDmigYHqoPPWs6bqwP4uDGbOeqtH/rtMLglcZcwB/LZ0
         8yFJMpbKl/9gDp9c1vetYwYAo1FxSmXQqfQp1ldQ1CnQpU9Q6Blz90xkKpdMZ6w7tC2K
         k8K+QtJAQoVdTuGfnAo0xUO41RiBclWuNgMLFHulJxmmITAOj3tjzNb+2m5MKTyOlcjt
         YZGCenGviTuMb9Po+M8iuo3c6dzxsOJ/Y8FzHcpqui+uM1IWichUdPywE76Obq8yD2aW
         oz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303617; x=1780908417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GC0UVsmy6URrMQSSCL/Ft5Q+Xpgj2pACeOoCZV6IJH4=;
        b=MrTNYRnPV615zeurI0eLCXr9a6PM4RxrBfdYbpORxKr9YpLu7e9O2XkyiRV2nprdPm
         WPR9WmBHutzRXAIQxIKfRn9d+zYwKZM5z7h+aRhm0qKNopikVO4d2IM4P+P+eiZrPAa1
         SiOs16Mmwv1twnQg0bMTw6R3lRSuYs2q8M54ZBCVggR+PqJhl9uqlw3JvyMQTc8qXKBY
         hoHVRpVmZCRZXIA43n8QSHqqHp0jCr7/rSkA1K1oJnIdLQDmlnxXBqIcAsnOQak2sr62
         IbIVsJ9MXQFCjfRbamL4a5AipoXBbM6BDaRz+tsu9ydYEJ9cTtP+3efsjDbBYDQqIyjj
         VPRQ==
X-Forwarded-Encrypted: i=1; AFNElJ9I2JgREbEJhC3d85JSDRZ04pG6ZybUE8jlz3Fnaxk4YxIel/PTxVKcSSDBV0A6opBZtuiENxI536ljmmZUJfDl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1wwh1i10asR2NIJFsew+yxBGgazvAPt/IxJvDhI6zBn5lnrq6
	FEmmf9aNDbU3AvgxFNW5Wv9x9ixvzOULNps63AvlWpNL21hgwPCqzERJ700yf0VTMI0=
X-Gm-Gg: Acq92OHXhmJryiRCy7HltQZ+7Wc0Y6OduT/4I2TpcsaCme5KDfaZsJWaEWY9Wkb9l04
	pe96wbLYRi3X7SgDvs0QV8ZP5RP8I0CdqVfbtgi95Xi7OolVvj5z1TLuNq2bxC9bGKGcnz/eSjH
	Ls6CNm2mD4llUgO5Vb4dvrDMo1ZFR/vJSJm2jA00cbJ4baV2iCN7UTHtoaqAhpgpcqHK2L/U3vh
	lmoAKFSopKGoGj0sxJ0BkbpDkOiO+//l4vDLx/zMn4elaDIhsod1pYfViyxP3HV5xmFHgjFQ5jI
	OXIKC4kuZR8MGgiRsICYkFHOAiGZ5keVmwVgK70sfoCwgLAm0TdLtVmU2W/eD5+wagUvo05jwFd
	wBcmsV3aKEiX2TDjs5r/+HQ1dSWRdMkSN6Vjgdxl0H+ycKKmpoDB9iKAI+F2GZCakJ3EBrf4hOG
	YfSeb73UwgdDlW5DyoVOPeuZdUog5t30A=
X-Received: by 2002:adf:f690:0:b0:43c:f66e:f24 with SMTP id ffacd0b85a97d-45ef6b8043fmr14522597f8f.35.1780303617148;
        Mon, 01 Jun 2026 01:46:57 -0700 (PDT)
Received: from localhost ([2001:4091:a246:8595:a745:3210:d732:4094])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a0403sm24643087f8f.6.2026.06.01.01.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:46:56 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Mon, 01 Jun 2026 10:46:13 +0200
Subject: [PATCH v5 2/5] arm64: dts: ti: k3-am62p-ti-ipc-firmware: Move wkup
 reserved memory
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-topic-am62a-ioddr-dt-v6-19-v5-2-3856a023aff2@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2151; i=msp@baylibre.com;
 h=from:subject:message-id; bh=AoejhMWFhhzgn/Oz1rWsnXYdKgFZw/QDwGfYGclplaY=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixZtyeNteuPBxa8rFt5Z9XjE+YVkfu+bz7jIXOr2efYi
 qbs9HbdjlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZjItO8M/1PPJGUU8XqX3rLS
 S77JW1LPsfzcgt13Lrx/t+LWk/7zN+4zMvzlePJnz72ftwuNHNxyvvpZ316fa3tDadlhf415+nK
 vlnAAAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Move the reserved memory regions used for wkup_r5fss0_core0 to the
k3-am62p-ti-ipc-firmware.dtsi. These are all the same for the other
boards as well, so we can combine them here similar to what is already
done for the mcu_r5fss0_core0 memory regions.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi | 12 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts              | 12 ------------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index 5d7f701420e2d8308b637f3064c560e485ed85f2..12902231e58a7a958f335096047b0d2384dee722 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -17,6 +17,18 @@ mcu_r5fss0_core0_memory_region: memory@9b900000 {
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
+	};
 };
 
 &mailbox0_cluster0 {
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index b770ed82be9d8f5827c49ed871351a6423db8026..6444aa0c106197eb44088ec99d7c7dba7f8f854d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -49,18 +49,6 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
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
 			no-map;

-- 
2.53.0

