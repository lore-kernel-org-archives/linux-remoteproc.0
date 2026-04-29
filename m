Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461EF3FD15B
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 13:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468978; cv=none; b=HTNeQBCSm3VAebzh//Q7eOByoPBq/FVGVPo5gfKvWW2k7nN9CGR4yQWZMUembcj6HqfbyBrBodxpGzfeT1ZZo3StL67YiC8qyEZvWSa0G3CsJRFjXRbkBJAUTMi1d4kA1DF/2Gr2xJ/XvAtWPzKAe8CvwoHzdONs/8Vic1rGz44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468978; c=relaxed/simple;
	bh=S9PhpLFx+N3VMs13TwHZ1Fz84zCZTEwqsIfi6+XGGtw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bw7DcKvHaEtDLgWGEHuonjeL5abA22/I9OBZcfI9tJrVkqIA9PV94JZNE1dwyu+N3O6YsB4myX8r+QRd+Zs6+tc5INK5IRrby31rf7BPegOKjL1ZBF/IJR4bm3q3NueOPKZy2F7N7a97mSk6kpSFXkLUJ+x9x6F3jATwtOxxsB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=h50G46Fs; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="h50G46Fs"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d77f6092eso8752016f8f.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 06:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777468976; x=1778073776; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+67EPX7Gc76LkP0rB0FN86BjtT6XKaRsT3p4u4gAuA=;
        b=h50G46FsLE7ZyOnvn+adxJ4p5goPzleppAQM5plxH9O+u/gRc4xHqh/3ntvdOEnp5D
         hu9mafh6+MbwxtabUSvkS0A1LjuDfvLeqQToxUbJQAu+aqskuiiXlfZAVNvyZBMY4XCk
         TxiFKJx/CNTbwk72dFO2D4uwy3oAXS9hcqMJpzuzF1pms7rFUSXE+pSNsWfLxQSoUirO
         wEUUtk/7X9bsTrSRF0dNezy5iL4MLes/m7dF6HRF2Zl1EKg/CFVIFvHeRf7FcpyGNB/T
         nwSA7NCJris0xlL6l0t3V/12z5DBG0dK35wK91jdBuZX0KJh6Sw77Tqc+KVQEVecTzHD
         HKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468976; x=1778073776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l+67EPX7Gc76LkP0rB0FN86BjtT6XKaRsT3p4u4gAuA=;
        b=bGOGNeQaU/daweMv8kLo/11yth8myICqdpMLBGLvHmV5ljx7N9w8WxruZwsiNpCkTd
         7mbYAAgfgFHCbNTak/OXZqw3e7uoITO6rovbnJM+gUpPStOUu5AiEbSDDA/zn2KiJ4CI
         pUSBS5BQqPf509ijq2nh+hT+Q4so3KmXwYzBVZQ3PQ1IEooWOWrEbf8najMH1mI6gmd0
         uVr1PiLqw2ob2CL/caLQZWNv7+EU7+Pr/VWvalRb7oinpl1qZM1w/UplNiDC08xLwjN7
         3y4wPiWVNyZO3kSi0muppCS/dEcqjAZG398+gFf0ZDEOaLA8iZKBZneDTJ2JBeLIdIri
         Ex+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9YMzT3YD3JC9vAq7typNUjUJ4v82ymouvwykB7ykF1Gm4vUj72tDCWdk2T7FnpDrRkoq74qHdp/e++9pNo5EJm@vger.kernel.org
X-Gm-Message-State: AOJu0YxPeEaxSRbZBw1rEgFIQ92Y9ZoufGtkqWWRsovq0L5mXuwbolIW
	2GO9JXTcAAVW96FHs5Uh3tXrYON3xyAP7j6xbTKNMUg8lMDPbaT1AZ4UyCJ/4orEvhxpIennqeZ
	BNeM4
X-Gm-Gg: AeBDieticPK3/Un8RtHMiN62ISdaEzrEeTdmU2Pmp9efWDmRpbUhtxP6jMTAfXNcCCH
	KJu+l59v9I8wBwd+37vbM/68g3GfixaefrMyUUJXcx4z3ddQKwno1kMMc1kPPnHKmvrnGvdkwdD
	TBK55Q9r++Nuzcct7oKvYozXh18B13qTETgcCVR+6xLple1c1BZfzI5Pv+VnnnlLi8NzVufUaEL
	xqFLcqkW39t3ebVPIcY4TnOeDdr1XL/IXIZr6/Fcwdm1tR2Oy/LlPrLKBZArXP7hFrMonBQSG1/
	9UIQDYDvRcz6rUKgaP7nos3XEDFA9x7VknmT4C8PFhnL1zoGzERI4/UC5w7rWpgpks7bODHg9fr
	xyfOTnTgUbtFhOgDqBtDNtXqCb3LTKNxfR/56RaW9R0H57/qpykmscdWWjVAHO5BfO+BZkbuORP
	dEzc5qCRvOCL0qlrwQkMfwQ4mojvGt0aOtBWen25D7rA==
X-Received: by 2002:a05:6000:200f:b0:43d:70de:1c68 with SMTP id ffacd0b85a97d-4464aced5d6mr13681441f8f.30.1777468975590;
        Wed, 29 Apr 2026 06:22:55 -0700 (PDT)
Received: from localhost ([2001:4090:a246:83ca:1917:a47e:1872:2063])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca664csm6222511f8f.35.2026.04.29.06.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:22:55 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 29 Apr 2026 15:22:10 +0200
Subject: [PATCH v4 3/4] arm64: dts: ti: k3-am62a7-sk: Add r5f nodes to
 pre-ram bootphase
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-topic-am62a-ioddr-dt-v6-19-v4-3-fc27d6ac753c@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183; i=msp@baylibre.com;
 h=from:subject:message-id; bh=S9PhpLFx+N3VMs13TwHZ1Fz84zCZTEwqsIfi6+XGGtw=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxPbFJVk2Y4bps8v5vpQ4TVzSPWh1bZq7dd2XBPNJfDT
 EBcSti2o5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACbCPJuRYe2Gp/f2hhkFbM3I
 lt+4wjQkM2V+WMzTmR4mJv7vLW8FOjD8lWVjULp38e6GqV6HVFawCt+4ubqTifeU7z+2OJHGJdm
 1PAA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

For IO+DDR the wkup_r5fss0_core0 and the
wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
setup is done. These are used to read the lpm metadata region in which
data is stored to resume. This needs to be done before RAM is in use to
avoid overwriting data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 6f2ee93c7be141ee5ae3f1e3324d3a060db069f6..5155f093437f35d815b2bf62429b57c9d8672290 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -75,6 +75,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
 			no-map;
+			bootph-pre-ram;
 		};
 
 		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
@@ -968,4 +969,5 @@ &wkup_r5fss0_core0 {
 	memory-region-names = "dma", "ipc", "lpm-stub",
 			      "lpm-metadata", "lpm-context",
 			      "dm-firmware";
+	bootph-pre-ram;
 };

-- 
2.53.0

