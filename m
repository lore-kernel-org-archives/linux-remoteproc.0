Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4863F786B
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 13:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468977; cv=none; b=U2Tx+kSaK+0Bb4lfqtTEHkPhRG3XmGRMt8bH+5xnQeL4uxB41ghOwjJLwd9o7WvC1oF5G5DKDVIM4Ti29ofJKUMVvKpFGn7ZGkJOGmL5cFsIYNfUKfjYwBxRV77NPmLESduj2iomQbfsKWQM+DN1ox8Ke+O/YU4nuYBOy3xkFGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468977; c=relaxed/simple;
	bh=NwbSyCiqLGeKdK60gi64/kirGNSyXATr0VwfsBib500=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sv2RUKhNaQxu9UD+E2qzuyUt4/NgI/WtZhrPWiPkjJbwFmH4mJC3nrghstSXsQCAWhhf2VPXxh/VZFWMVa2iVOMv3gilfs5AgIuijLYfNDxAEKSkOh7y0G5yjAltQxHnez9wj4fwV/Bnxk/9zcurtfPra2qLc3R3lkWqBGN7rsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=x3z8zVe2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="x3z8zVe2"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso97636485e9.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 06:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777468974; x=1778073774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vrhzQzY+SFxj7hTi5Z0y+DFAQM4RDCG/dTmsNuzfWXc=;
        b=x3z8zVe20jwo1VRqNKtyG+whkmhK3z0huLQR2+dt6V1oLL7R2x/RmuQsvjOpmnqbUk
         86oxF2nIdHEsKta9LHlHBx/2ZnBIllcJfjEmKAJdk/GwnbmpitU13Hu6qyHLwlIpvo5M
         nmr5GtV8AZGpX1kBANl9cospRIzGcq6q6vWhowcCcgRKTmMX6R+8u4fXHN/N8+Rph2bN
         Xa7TKhs7/k+2121vKk00bz+UFwsNthY+VRwBscgFtM7/bIph6uCFIN8GJdwpaq0U3594
         22Crf/8hMiqta1yp0fRIJq8mnWrG8pwNp40HVXhuqB5aV4n8dBsNTCV80O4Jq9Xf9NUo
         0/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468974; x=1778073774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vrhzQzY+SFxj7hTi5Z0y+DFAQM4RDCG/dTmsNuzfWXc=;
        b=eMpGa9ha7572gbN7FgjA1e4lVwz+ep94j2ngGqk3wKofEWM/c9XH1Gi8uLVqqOHsh6
         g2/YJ/1kFEuKs7fDy3IBuyMzpHFrAhEzMPY+qMs26mpbYeh7BLpZqqUygpZzaxm8qT3U
         eDexlKrbRBleGT+tDxPTQL0nDSKfhS+U5Dmpwi+eKiGVgeXntRasIHvfB4xWLT5Fdlgr
         auFGmeO3nSB3naYftI3aeKAXTiIWELH9ucP3hVbloNbGMt+LacdSxbT4iPe2RwNowPpY
         bX5qTIU3F4mDED6QyGe9bTh7lh7hH+ywXzSUo1cnxYZ5X9kTj4v4rn07VkYhdw8FhwZ7
         Fpjw==
X-Forwarded-Encrypted: i=1; AFNElJ9mvYJjtjxd4zPQIbo4wfCheeMoCNyjjABbdHGNk7qvQVoduSvrv3etyWjL0oIE4GjhybJnlCqkM1MWjhjWpvig@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt1oI17uPARRyGFggpI2AzuPcCP6U3baUYNacFtoldIHWCxFt0
	L2pks9W0cObRyXzrvXNN+ty007Ob908G/a6mQ1yhMTuZYry8f3+cAiSR21c/Vkb3zmgCSNy9VVq
	40Tq2
X-Gm-Gg: AeBDiesr4JeE5+7QhT5ztY1ZYFkfmP3PJlRMrKKm/tgOrKj1mRejSVpOh1TF7Zp+tTA
	zA1nECIfGeFSxocTRYzh9MGm9iQVtxO1o+cvpYu8eTqPlEeYEGyH3Qz1Cg4CHaNh1gBTmS+zEPx
	Ghkg9B3JDrOFGvAyRvuSBJBB7x+EfPS/vx5XfQyybonZBTFpGlNB94TA1yDEky7BDvWJ74tThIw
	8tEhRIsBCmRWZY3pmB2Cc5H8OP3DFOxyKcMFADbYTsV8iPpNyiM/DERSA9SOvwOH9J5/bbDEN22
	7+gIEgXOQXZlEzW0Es3G+T9RowfZjGYhvOkgWzFycRIpWz+IHsPWAA49nBvlSDIxqvV14xueqX3
	jmMsNmLxncDYSRBVkLLbq/ofSVoBh0S/wjdmKqLvUi9Dk3/wpxn1NqiXjKGxzuEcGyxZyA1j5n7
	dS0CYNteYm7Kc+9ixkH04P0lLBhJLESL0GuK8JvAJkPA==
X-Received: by 2002:a05:600c:609a:b0:48a:54a6:b29f with SMTP id 5b1f17b1804b1-48a77b1da9dmr117530135e9.17.1777468974486;
        Wed, 29 Apr 2026 06:22:54 -0700 (PDT)
Received: from localhost ([2001:4090:a246:83ca:1917:a47e:1872:2063])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b72176fesm5619258f8f.17.2026.04.29.06.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:22:54 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 29 Apr 2026 15:22:09 +0200
Subject: [PATCH v4 2/4] arm64: dts: ti: k3-am62p5-sk: Split r5f memory
 region
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-topic-am62a-ioddr-dt-v6-19-v4-2-fc27d6ac753c@baylibre.com>
References: <20260429-topic-am62a-ioddr-dt-v6-19-v4-0-fc27d6ac753c@baylibre.com>
In-Reply-To: <20260429-topic-am62a-ioddr-dt-v6-19-v4-0-fc27d6ac753c@baylibre.com>
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
 h=from:subject:message-id; bh=NwbSyCiqLGeKdK60gi64/kirGNSyXATr0VwfsBib500=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxPbMIsItsZVnyaFb/TiMfrZO/B/U6/O9SX3rbavuO4n
 t+Omj33OkpZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAife6MDNtz53g/8lr6/NHO
 e9t+GH5NdhO5d2fe4tD8ms8/rMI4Fp9gZLjU/mf70c9XOZiXJXZ+tApXMrfvk6mWNL+uUho1yU6
 +mBsA
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
index b770ed82be9d8f5827c49ed871351a6423db8026..e67489a178f2a2caedf1306e1c1c9dd6a95745e6 100644
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
 
@@ -844,3 +868,15 @@ &mcu_uart0 {
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

