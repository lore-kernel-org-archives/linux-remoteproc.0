Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC698347515
	for <linux-remoteproc@vger.kernel.org>; Mon,  1 Jun 2026 08:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303621; cv=none; b=daAABcubeePVBdUxlWRWrJrU3fN0hVTU9QWB/eLibeNvcdV7DHoIbt/yzesDO1Si8Pvo5E6MeaiWxpTyhdkATbwmmsHu2q287IKue1texnFrRmYNPCmU0j6NPW4Qp97AiSEKxPcYNhPU8ABTreupU2QKDfxbsAtNA+K7gSA0ohs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303621; c=relaxed/simple;
	bh=30BdNR/xbGVIKnyF1/2jhh2h1Klijxil3BTcH8aa/ZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hFGXyg33hfezOOJq7LvM83yqLj7PBJ7tUPajAgJuN0hUfUsGv4fbdlhulFs/OvGhpnHModIFmE1czvmRCVEpjiR/SH0ggZBi3M+YIJHywOyk1RwnZC54iE7h+w1E9F/oCYyVzAeDJ+0J5u+YNa7IMWXct3huenm6MfIOM0HO/lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XX4P9RXV; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XX4P9RXV"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490a765d410so12868705e9.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Jun 2026 01:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780303618; x=1780908418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ypjTwr217bx6Ztde7fmIDAdz9Zru4N1aFxfAHxMhjg0=;
        b=XX4P9RXVDJEpcfvvUk7LkIZKBXAsbN3SfbY9lb6dcXQOLuSsg+uTVlx0CBy05TfuWe
         wKNgT+8dgfntSfAPYvildhd3c8tV2+rLG1PJA5mGxiQGi9YTMHTkDd3aDK2tot3rkSoc
         kzsFxw/w8r3CGadSATVechU80WJStJvDhugvWtJgBs5IMEG02MohItiPvf4wmeZ4itf8
         Jx3ByU+hBiBM4yOAD+2bPoPdUUMJQu9hR1k6KM2AVV/yTQN42FwWF5KPupzSMVZv2Br5
         ADJXdGTskRXE4rCnlDl18SZBlrE0DnCuPRf5lU9WI3f3z0hvNniiHHw8T185Zi+ll64j
         vOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303618; x=1780908418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ypjTwr217bx6Ztde7fmIDAdz9Zru4N1aFxfAHxMhjg0=;
        b=Q80rXR5+1K811la9YGt2jJ6HeinpJan0WaS9HspwB6Wde0m186Sb6CYyPZ2l/vaMRn
         1dq7fDVcueeNjTQXmHTK9wKhVJAgIG58tWQzAJ0yd8BPLEuUikKwP89g9PJ1IllRhog5
         m6WGh/BVsYOJMarHZlZ2mYUX93PC91vJ7ulErckBL5du/TBPHiwAE2ME0a5KWDcFTlZV
         JbU8r/MqNTVNzhHTtQN5CDRDG2ywt3evHbnjAz02F4M8p6GtxJ+fCt5UmwR4ZWaHg349
         UtjpLlMTZn167GgUjqoml3qkfsaWWEuxTH2EBqZxki9ot0DhKK0OPrPfb3BWR72Xpl9c
         fe0A==
X-Forwarded-Encrypted: i=1; AFNElJ8D5F4HKEB74hOyRCzsbBgTLPV7RkJ3ggZtFV1+MK7XRHKb4g0Sb/GvE0VT/DRIHRpzd7moYtlfiV6zrizlYP5m@vger.kernel.org
X-Gm-Message-State: AOJu0YyiyzXOnBQE3TPZA94D8M0aIrKC8MDXT6qQ/VCqP+Heh1bWril+
	IAT0QAGZguR2+O57529G6eRH1+N7LLO1eHJ8dNFiLuIYqg3Go6lFryMXM58IRT4V30Y=
X-Gm-Gg: Acq92OFM+Jqu/PbRbEcmdphsyGQbjtTM/mpVrDpx8u/RaKqfz/vDxGLI3DOyrctSwMF
	bk8kPIBfc6jb7pQ43UZjl3MS/sde4Shry9ed/1MiMbo1nJ/K3OTQBe0NbZHa3nW39jT5LWwdhjP
	mLUj/cXSoECxihXA4MbsObSM/XIdubSZbe7u+qsIIiLMJmL83GxYWqQtuS2rB5wDzIw4b8/hdjL
	IMnV0J8hLZUfMvynBUMk8BlVFYjDZyaNYC7/CH7OSZG7Uh+nJvo9Asr58CjmrD96pGmGRBeytcu
	H5T9U9KYY03uNTpz7ZM9rSnqSvtISPnbIuBaAkPq1Z0bbrdHwQh646FtEEtTuzS+RuX5Gfnpcio
	nVXtoUtxxKSDG3m/qcZ/+JuBuZN2X0h8mWr8z9EiKvv9LJQH/P4rsO2OjJzCvqBDn4PZtik4zyU
	xyFrA/yK2xB1BfpxTZHtZ1CEhn4upoqstd4YZbSnsR6Q==
X-Received: by 2002:a05:600c:c108:b0:48f:d612:3c4a with SMTP id 5b1f17b1804b1-490a2923a71mr137138235e9.1.1780303618389;
        Mon, 01 Jun 2026 01:46:58 -0700 (PDT)
Received: from localhost ([2001:4091:a246:8595:a745:3210:d732:4094])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490af364371sm31585e9.19.2026.06.01.01.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:46:58 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Mon, 01 Jun 2026 10:46:14 +0200
Subject: [PATCH v5 3/5] arm64: dts: ti: k3-am62a-ti-ipc-firmware: Split r5f
 memory region
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-topic-am62a-ioddr-dt-v6-19-v5-3-3856a023aff2@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2464; i=msp@baylibre.com;
 h=from:subject:message-id; bh=30BdNR/xbGVIKnyF1/2jhh2h1Klijxil3BTcH8aa/ZM=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixZtxcKbnPUu6RO/tr92is42TRCSpJZyWEBj0hHegVrY
 7p89OOOUhYGMS4GWTFFls7E0LT/8juPJS9athlmDisTyBAGLk4BmMhZI4b/cZxbdGrnu562efzi
 SalCAefr9QqbtGIlW4oXBVYf1DnowPDfcdEhrrb/17tXc8dN9Vti7K2Zunlz5OnmLxv/9Pusv/m
 cFQA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Split the firmware memory region in more specific parts so it is better
described where to find which information. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      | 38 +++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
index dceaee6ac57b01a280e891f70587a679f5b732a6..24c4e2ec091c3f66e51b4af1b10bea0d0ae26ceb 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
@@ -36,12 +36,36 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 		no-map;
 	};
 
-	wkup_r5fss0_core0_memory_region: memory@9c900000 {
+	wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 		compatible = "shared-dma-pool";
-		reg = <0x00 0x9c900000 0x00 0xf00000>;
+		reg = <0x00 0x9c900000 0x00 0x100000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca00000 0x00 0x8000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca08000 0x00 0x1000>;
 		no-map;
 		bootph-pre-ram;
 	};
+
+	wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca09000 0x00 0x97000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_dm_region: memory@9caa0000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9caa0000 0x00 0xd60000>;
+		no-map;
+	};
 };
 
 &mailbox0_cluster0 {
@@ -78,8 +102,14 @@ &wkup_r5fss0 {
 &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
-			<&wkup_r5fss0_core0_memory_region>;
-	memory-region-names = "dma", "firmware";
+			<&wkup_r5fss0_core0_ipc_region>,
+			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
+			<&wkup_r5fss0_core0_lpm_metadata_region>,
+			<&wkup_r5fss0_core0_lpm_rest_region>,
+			<&wkup_r5fss0_core0_dm_region>;
+	memory-region-names = "dma", "ipc", "lpm-stub",
+			      "lpm-metadata", "lpm-context",
+			      "dm-firmware";
 	bootph-pre-ram;
 	status = "okay";
 };

-- 
2.53.0

