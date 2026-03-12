Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AF13D523C
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2026 15:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773330618; cv=none; b=r/W/ChbQdKeItYoy6QLEbIKTEkxa7hlnqZPMpqdocah0zgF2k4MVl8psAXdalyQ83b/8tnWmx3X2COidh4pCMns3xmbQHy37jfo84eFrOPZlEDHPuZJmItPS71DY5gfJRIR997B2S2/svrZnqzehjvgd7D4akRt/8V4lefB0ovM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773330618; c=relaxed/simple;
	bh=XPX0yeV9y6Q1/hILfx/rQYzRxhs7KMWJhy8D6EKmBWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b3HLEX/3rz1x0tUe1UKqNJmOKmpMBMhlrhKHu0ompuyj+HNatYEpK7JWWJnmVAS+z0Ss2E3JamThqN3X0bw6DWn9T3vaX3t4EGjqcT/Apz7ka7cJrKZtVyn+PsBwP9AQFO6eT8+wbfjPath9gPBH23KCOpBkvSbiCFK6yfxdEVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tvqASqT6; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tvqASqT6"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48374014a77so13679785e9.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2026 08:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773330611; x=1773935411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7J/XuAEJGTEZtvWSSq3yXfnStm9aseiZmgqCqYghcM=;
        b=tvqASqT63FS1pHGj/3Tdxxc9JUz3ao58hjbk9Tbkjag/1SflVHaPuBfEDwJWKY6kBQ
         a3Yxd42tdBOU0PXVISTJcTKV0X5ZUUaEsQ63zRYc+paQ6Ks5C38uGgyeqi0R1sM4odJ7
         xnMT7GCMsi4HhBYV5re+YRFeQ42n0r8tiraT01oEQFkIDbIWQHGNPSJaZu/qmr9OpJJS
         KKmVpmWBP2986LbhL1JbrU2JolxXjEb77EVOFZ7wwoMsgmMu/JRY0phreXGb/0pzRXNf
         sNBX5f8Uy302top2/8NlKW+PZulTv5FeINZrsY1iMWfhsJHzoASENQ/r7DWfmUWLj4VT
         cHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773330611; x=1773935411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J7J/XuAEJGTEZtvWSSq3yXfnStm9aseiZmgqCqYghcM=;
        b=QKObITvIMvsrbf/dyFRBf72M988VPfI+9Zi08ZnVrGSJly472YkjSb8CyYnTlIFqUz
         yZiB1RmZGl5GUCZ6KVdXIeSnC9IVgoPSd14rPvMz+EC3lGjf3DFSSh+GbcUn4EIQvC3c
         Cc8zwUY8ghTqStdAYd5skDs2r0PQf50j68xWQLftlI4+q2H25jgqaDkMOMQrHF/r9xt+
         k+6zIyVZ5+oW9NQS7gDkXhTTF35L3CuOTzhITmn+vJ1cEH4BiTFeQoJc/nAUgK3uV6hA
         yPwFUCuAt3l8uX+/39gSOEO59Uus6g9yv2VhSz3Wkwz2alW9sOpT0uOy4tv4+myIcHtt
         Qhwg==
X-Forwarded-Encrypted: i=1; AJvYcCUiLEzAqFjTm9It+iB7TT1LyAw5c4cjCWTWXtBFIgD4g07mJFSmWqJop1gfNG/FQPzO0U+R7YUSaVtHFVWRwmGP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw64bsXU/rQ36A3QDQGzNHu+HqubM76MAHbmdmA/3xfkztA0R+N
	IkI+HcEZw3Te1odVu47pB1oOHZwzBUPvMu+QwQz4/cqhWBwTSHK4c1OutaF4ma+K3GI=
X-Gm-Gg: ATEYQzzLE8BPYv1SPl7pE8ZI46f36xF11WntwLHBDWIiBea6vcV/gJEVlYy/onGLHKU
	34LMPx/jmOxpWVoyBEi4vPSuG+ynpWcd0Af/R2D7tmdZm/ByJseA+fF7cXx939C/6r8JSCqEXgY
	whZV5oCw3vW9SKveL1G7koRJT6fX7RSQzgSDuCbglvRTXJWeHVPNPFeCGOXFSbkPGeocbdMXV37
	7DWwDjhbBtE6ZS5gOW7Ct9rzfqwpJeG2ELREzIWLCUB0f6UEZaJ/d/OeBY8ZUJvfbUj21JDMz+y
	3vAimmljd2Gb1vywWdzBtzCDSmWqAGr8psHOZ7NCvnf0n3K1RdW9Du6gPxGlcDlsups/a/p1f3/
	dil9STW8pPK8QLjv68crDETkpVErLoQzriXzVEY8liXvPmbt14SnqZq7ZaCg3YkO7jTw+2k+2Rx
	7RACTdkDq2lwnX1x67ybNC
X-Received: by 2002:a05:600c:4452:b0:485:40a4:364 with SMTP id 5b1f17b1804b1-4854b145513mr120904965e9.26.1773330611284;
        Thu, 12 Mar 2026 08:50:11 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e912fsm361176715e9.2.2026.03.12.08.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:50:10 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 12 Mar 2026 16:48:58 +0100
Subject: [PATCH v2 4/8] arm64: dts: ti: k3-am62p5-sk: Split r5f memory
 region
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-topic-am62a-ioddr-dt-v6-19-v2-4-37cb7ceec658@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2273; i=msp@baylibre.com;
 h=from:subject:message-id; bh=XPX0yeV9y6Q1/hILfx/rQYzRxhs7KMWJhy8D6EKmBWY=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxND9qjCuYpaXHGajomCN3XOFP9ii0gP7hyWXZj+YZba
 ivXGH/pKGVhEONikBVTZOlMDE37L7/zWPKiZZth5rAygQxh4OIUgIksMWT4Z7ZCuP/ymmNx6s4z
 Uw+ULmXXvWVpMr1zV4zKBHWNrxnSDxkZvrqxHl9wZVa/C8M052kTH0Q5Vh48VHVeYFqQ+e9fZUc
 NmAE=
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

