Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7F2481FA6
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Mar 2026 15:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772550839; cv=none; b=YDt9sjWql+CWCUiQriPYS0INLqYmqJtZ6CFBCir8uhnr76H+H/kb1yyBByZKnwNFrI+TRRRGQ93mvJQTGm1cPrlr0RcwdP+wmr3isIt/N75jptqhipoLUepYW9h//J4cDonnzLzkxaQv25Z7XF6wYy2N+K85Qw3Mu1oaAE/aIVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772550839; c=relaxed/simple;
	bh=WyT89chcbmYqJC7DKZPxjAVElAXe9OzF+0pwJ2S76L8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=riYHQnQpl3zhlATK4CdgvziJ6Exvk4N5jys1gNaIhlkkGM4wFm8tOzyQVM5FcoUaqLxnWtv8qmMaQNwVeszoJF/7ZlStzLC4qR2VIl4IXwXWZ2sjjFiOQVFyhsMqRYKy111QqC2MphE6I+kl6ggUcKdruV4x92BW9PqMQrnBxOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=3F32+mpU; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3F32+mpU"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4837907f535so50947795e9.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Mar 2026 07:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772550836; x=1773155636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WbJgbWAnfu0WdyiSKYKXFL9ucpwnq0NwS8nZPGPTy/I=;
        b=3F32+mpUjDmlo5xUCJc5IFw5viCYRuVuLyjx7nOqKENRbZJqYD8WTdIIrUYEuYa43F
         +9bLu8g+rVBhodMgE2dQDgSHe074KeYgnObUoqZsBGRoDuwTOUujzyvHkVYM5LRnRIGf
         fpyqG8/ofkxJTPsaWpCgw1n2ApLr2dMevuMtaqBQ5NzZmRydOGZfdzDyN/sAh6jJNt32
         JBcfyqIHJPrsKyj+ffVsYIJu9nZUfNFhLaoC8+SBZ/FlrjRr1tCwdeSey57ItHNr2FJ8
         6ARJYU9LvnBwl0ZJ6Z+/lRFXnAfhzykymCMlz5YyyoUzCFsEBPzKIx2v0nVCkS/k/lpz
         MHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772550836; x=1773155636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WbJgbWAnfu0WdyiSKYKXFL9ucpwnq0NwS8nZPGPTy/I=;
        b=QFR0FASLbUNIpLSayXyWxZdPD4Qyk1rJNlIClpYpQp4ayRqqwGo9crH9EUwMr2chB5
         erKkjqcXi8He7GM+ocgI5Y46AHcfTKLbE+9T0NNtlnHSAmMk3v2bd87oUAu43syNKYcC
         gLzGDsOS8XqReaCHTwi7Mc0fFVH6qnT1AlwaVNg9vpoa46JtkuI+YAaoKRq4pq4sgl9+
         sUv/v1fgtNTPAntyJisrsaU6/kSAqyP6sR0chx73K/SaE1YICzF+gVqIGwDF4dGBuy3y
         btAtSC7SKYZ9ZxCVM/EfBz7vXABvZk9j82CpVEWZHRCh10uYHZVh6ilhkk7MfrUJ0nQp
         +1EA==
X-Forwarded-Encrypted: i=1; AJvYcCXoCH7MvT/V8RTZmmlYTsiVVpPbHxRr/fm9EEcsIDh4DVxM5rse4IPWxU+V2+u2PBiiuulY/27okvsDPGO46APZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyoZX37MCH1AhYnihzCZRpHBgR6y8CxkiYnZsuhC0NVMBmpidi+
	sJEKUpP/AIMLkPSRwmmc6sUjX/O46CalovBnaINyXGTK1j9SUeioa1uJfmKt3ocy8R4=
X-Gm-Gg: ATEYQzx1vwoLdm64G06zuYSmZerhjHIr0SBLF8OXEjkAs3SEatCvN5l32o6yw3bbPCI
	MKDfLqcv068D9monUp4Ii8hmg/lM7Ldujdp3rNa5akpXF0crPYGVOhPx4GdPXlek0fPP4TOQDS1
	Dk+ioJ+Oev0ex5inSD/pxTab4iFIY6DqcNV10efnZzJK2HYODZvN7L5nt5MjPT/+/6Y3jsdCmFF
	T//Konb20mhYJBz34KHO9I1ThBY5IyVmLF/ZNBe0D8plsuC7g83AxuCzEajQyEkkUhBXzzsF8tx
	gxwNzkcQQHgYDUFO0/zWc+EstdPs8Vw12H4cScasTfizyxo/cs/wnSfy79kk2ZOUv8gVwqsj3Sd
	P7tjYUj2yxri9eje6351oLDNMuyQGY5UYgtu/Jog3bT427BXqGMT9dZjgElpA5qvBBMfUvZPn9C
	QxXa2YqeUUftip+b/RX/C+j7yjp5L/LDc=
X-Received: by 2002:a05:600c:818e:b0:480:1b65:b741 with SMTP id 5b1f17b1804b1-483c9ba3aadmr304376075e9.15.1772550836189;
        Tue, 03 Mar 2026 07:13:56 -0800 (PST)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd75df9fsm574690085e9.13.2026.03.03.07.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 07:13:55 -0800 (PST)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 03 Mar 2026 16:13:02 +0100
Subject: [PATCH 4/6] arm64: dts: ti: k3-am62p5-sk: Split r5f memory region
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-topic-am62a-ioddr-dt-v6-19-v1-4-12fe72bb40d2@baylibre.com>
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
 h=from:subject:message-id; bh=WyT89chcbmYqJC7DKZPxjAVElAXe9OzF+0pwJ2S76L8=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxlv+btWXQucSrb6dTV7a27za4J5sbas02ezip+R3/2A
 7fzjq2uHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCRkk5Ghl3TlqVpXM37a2Jd
 t3PdtwfL6jIO1/o6rW3+n2czMX6b2klGhr/eO05bXw0pktcycVlyVmXemfhN8m3PFgtUvK3eWqH
 8jRUA
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
2.51.0

