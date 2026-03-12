Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A53B3F0778
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2026 15:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773330619; cv=none; b=UZz3uS8n97B341MZAn9m6EuuhSOer0QWbd1jD8YM9I4NgsjE8GH3KMf7wGPuSOLUedQzFG6hiUPRarNP1D10yWg6JR8MdHN9ULiu4md6/RI+V0q01IF2whRp8SvbWGuM4ik3M+ZeiiZkPs0uXK7TWwB+cevZ+TsV7iSfKGARO3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773330619; c=relaxed/simple;
	bh=iQg2/EW5erfGuk4mijSK5nSh9QVwrNZkATnyLQE0wvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uEuQmbqySRWKbxoLZWi964joVc9VCsaHfskoZSCge4G6jlgRQRPsTi28hfNLg5tsdoVhZ1F3KV74VreK+ymC4adrvDz49lqxGFZ3vtw5NJmTny4VpZ0Rvy17ydjIPGWFDYQKDrDTAV5SGm2VpwIlzgCp2GTt0kG+ytyBONcjARM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ykHYUVN0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ykHYUVN0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4853510b4f3so15351165e9.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2026 08:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773330613; x=1773935413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zGfrel/ZHD/jnfQbmAOjbJYHLBGT6cfB4kl14spMH9I=;
        b=ykHYUVN0YQdEbmDttumLD+YuZUGWaEXvH/6lUXE15HDrhwXCis8jGZqkwWhOODyi0z
         v//M3uZh4ZD6WRCV4sfeQRjUyUmEOoAc1iGJC9ZNOTtPgv0LMPVWiHogCkVXdUN+ACvc
         xgsoECfLTCKtDFL8XXUPwxYkrVlknmdR4+zO4dbUwEQjKq3IEVk4qxjpmurPFl09P5+v
         KhQF+Hbt8ICg7O6lMt6jKwrO/IfQPWA1jyo5UYI0oO46jcWDOEXWW3RHqfvoQ1xwton5
         IoPE34tqDk69tahICZpIwobr4Xxr3ma/oN0LFg7PRYrdtKcmRI808M5OfsLVhZ3pUapM
         //oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773330613; x=1773935413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zGfrel/ZHD/jnfQbmAOjbJYHLBGT6cfB4kl14spMH9I=;
        b=M6fQnBGbJG/XBz74AaqZTV2IxkvrAOB40vYTbCJVMQ8wm4x4nCp5IDyl1sxhgvmX45
         EGeLu0YxnCjYpqEHAy+4pfEPLE+0Xs9VsSbpxjE8slvB0V09aTmA/ZM9Dp4+Y2s5Z0te
         tzbABvvRi0ce/awxx0uYKp+J3VAOxpbyyGP1V9buBEltHXjt/pla+p4Y7XnAHpHLA2cU
         DheNJmQ9FZIFiBrz9miloHaHi7zIo0m0WK9sXxjBUacXWhicTKtIIo2hut8RJLWWIAyR
         Cp4l7KvoC6UGD0Id6ApTJGzpyFR+Op0dWGXK9AEMXVZ/MpJfCawyUH+xR8jESmjg4FEl
         /DCA==
X-Forwarded-Encrypted: i=1; AJvYcCUP84fVc/k9LDAgC4bNZI6Yua0SwsaS5NP9OvUUx6l4BHJQmXCdiGXSWVPjY1bINXEtQZJHKU2WNomBY4t2ck08@vger.kernel.org
X-Gm-Message-State: AOJu0YxG8bx4iH6+iSLKYmMw7Ur+YgKXeVEfYDk+aEUZQROmLK8pp9XX
	6+9rBryqjyOaHbm+jqvNtfOgOtrOen/i8W8b0zoElBNNt+t4anQpLEbTp6tJEJhoz1E=
X-Gm-Gg: ATEYQzznhghipcOjOoBzG8EHcoBR83+vICoHhj2es2iD6fFaJavwlr7/cf/CGgoE785
	UGDuVSrsg8CNKUUjd4xTZ7xCz0MiFeM7pgVtWAJX0p0pEFXJHwXVM5Be0tu+X+3oLo3n2L32/PT
	nT8WCa4YySXe+co6iF8JiThDB/mCV0SpV38rWzvyepem9VpAePtmj7Ikr34jGNGlh1u/r4+HTME
	nZzzKhC62movPcz3Cp7lOJwUWkYW4BVBTNjxDMM+KKKYt06XB12obiMLAvc+rEEL2W701g8erYR
	qqzKVXtcZ3u5Laep6A1LT1NCdQH53qlN9O1t8GViJvvfFu8Cit28ycINAOW7t24oIJd9PYgUNNY
	d2CSYOTkABElVJ8KzLHakdzx6h70P29ve7DhnbXoyDYEi/+ZoJurfdUSD4jDIdKpEbsT+BOpFnB
	kQuYfE480M7ybGMgpXaIlDhWhXcNkED6c=
X-Received: by 2002:a05:600c:1d16:b0:485:3c66:e21d with SMTP id 5b1f17b1804b1-4854b0a56c9mr119096055e9.2.1773330613544;
        Thu, 12 Mar 2026 08:50:13 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e912fsm361182305e9.2.2026.03.12.08.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:50:13 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 12 Mar 2026 16:49:00 +0100
Subject: [PATCH v2 6/8] arm64: dts: ti: k3-am62p5-sk: Add r5f nodes to
 pre-ram bootphase
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-topic-am62a-ioddr-dt-v6-19-v2-6-37cb7ceec658@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183; i=msp@baylibre.com;
 h=from:subject:message-id; bh=iQg2/EW5erfGuk4mijSK5nSh9QVwrNZkATnyLQE0wvU=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxND6bmTWfLePjz9YetV1XPL1uRe6HDIOXBFz/H8H1Tz
 U9zB8rs6ihlYRDjYpAVU2TpTAxN+y+/81jyomWbYeawMoEMYeDiFICJ6N1h+Gej35bBE71u2YyZ
 r9XPzmT7wqb/fObN/GWTE7xkz9dOk2BiZDj/1cRFh2WfcdS1mvpZH+vz1LWVfyWfFDZWkU9r9vo
 QzwEA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

For IO+DDR the wkup_r5fss0_core0 and the
wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
setup is done. These are used to read the lpm metadata region in which
data is stored to resume. This needs to be done before RAM is in use to
avoid overwriting data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index 7fa4924ab52484c7ac4243a0cd6c0d7aacaf8b30..55e75e9946f75d4d787c933d1d87de6ea9670a13 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -71,6 +71,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
 			no-map;
+			bootph-pre-ram;
 		};
 
 		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
@@ -868,4 +869,5 @@ &wkup_r5fss0_core0 {
 	memory-region-names = "dma", "ipc", "lpm-stub",
 			      "lpm-metadata", "lpm-context",
 			      "dm-firmware";
+	bootph-pre-ram;
 };

-- 
2.53.0

