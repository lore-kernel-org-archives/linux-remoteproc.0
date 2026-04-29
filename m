Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99E23F789A
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 13:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468976; cv=none; b=hCLt7q+EuBgxyJU6Z4nzzlsuy3zHhoDmrf+zDCQQ+FqbuK07JRPCwdaPZYgrZuW/4vSofeu1Ewxst2ebSj67eIOis9YvtNbatrq0kpyTXJub7yiLihBe9BlzP/jhpfiNbEwghjqJsugCF0/Ls3vr6ajqXAXnS4usMtIUpvmLE6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468976; c=relaxed/simple;
	bh=URQQ9Z6jTAoqQ+MLUzm/WhCvSZ5DsHJ0Gwd/k9oBwGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xf8I3avCLT4ZFFVGNKHcko6YmViO3Ztot/zsVRiI8Z3hy+jWiHGEKukifcFnk/Hg5hBGkG7vH4q1DgXZ96VZQe+gDjdIEZ2brTeovepKquaJ2e8fUNt8dkg0OgqhHK5kLJrIKSRHJikjQN9jCevw8EWo19aSdVEVaj27+4toqyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=oX8lqo1u; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="oX8lqo1u"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48896199cbaso123846475e9.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 06:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777468973; x=1778073773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xTKIOxHviJSuZyXfPdDaD8f53AbdDA07/I+kul6Gy1o=;
        b=oX8lqo1ujQrr3gBZJUjytgdfb2/yPchb+GNlHZ9hjJfoAk3p9fSFKBR9Yg9ujQBvt3
         tjcIZi//crw4/Q+RbI0R2hFUB0wnFDIyUDMSYr8rqV7bvQrt7a83engpxA00z8l3r4Ne
         02MYVDy/gQdDzf2YctgqYpUkKGZz9S4prE3hrU04V4HAUr/oW+ZV+P8NlPpOY807wQi2
         BVH6NuZfzg90t/Zf3MKqIRBHmSaQsQge0qvbErl/GW9xsORdH40zHxDY5Py5ciCpNNwv
         0/7vVKpmKWcx7a3bMSzcAa6LiUCsIAnHXYVO8jEjUeJe8SAjPVa2DQaqJ/RtB62hL2o2
         SbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468973; x=1778073773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xTKIOxHviJSuZyXfPdDaD8f53AbdDA07/I+kul6Gy1o=;
        b=bjWl4KSh69Dwlmak+0/TdcI5XTz/G19jwDfUn7Q3vndfz6N2AIcuWHzxg13GN0l0Qo
         kQ16weHUN/2GYYf3NJ/5C99QSHnaFxPzjmUnL1q17HJnaxLggLV8FbGHLgczT7qeoMjo
         WgosSBNkjN7z0WSGTXQIm8aScYdNdusUGGlQFuYNvJty58C6HDZXtULwbnkZdOQta5/h
         xjf7j+kdMbGWA79FdMekFsX3Skcgg4lExRpAu9O/LHqSNrMJFe7U90OzZ5vs77CHR6vp
         y7mzzb8fy505qP2lxkq0EoEwI7hg6tvwv8YUg7VrtUENetKva2HQfS+bg85m3Clu0gEp
         46kg==
X-Forwarded-Encrypted: i=1; AFNElJ81yAxiS8drBnpAzbDLvwRPLr+RgYLEyVLHjFzi0qtruLq1PyzInNgYcELo2ATXuYT9KbbccwjqSg3NeEZwgtrv@vger.kernel.org
X-Gm-Message-State: AOJu0YxXzQqsDclDlYjQScWgh3bLeObEJDsZnOG0VyL3AxSFwDHWNT3C
	ll13WCs0BJblm1jUMAPoB7jhDmNIa/Zb0IX/FYBvTt2yGXIb5pY119Bu1bP5KcfONx/HsVWhg6p
	5L7+f
X-Gm-Gg: AeBDievWR6ckrgZT9RhgtH47W62/qQsmqFrJFsmz3+6DxN/RpKVdJATYfNuWjCSTBvG
	vhIHwcTf/4vbVKl0Uo91duRrXBHAGS+u+Elw37u0ys+dNo/NZLRWknL7k4uLfzm97DRyZN8xLfG
	zLhXGFNHfgyllI4+35JsVbF3moqOcNxOh8BeZSAjzWM9L+19qSGSLo8tQ2kN67LQn1GnNa32Ds3
	Yilr2NyaUDTj1RXfHHvioGSMsG9P1nauFCMqTqAVYqPeEaD6el4p+qDiml3G05wUlgHBxoN0VdX
	BtksLfXggymnCiZklCBgSMxhI9FpRzqBtnye7kqQR5z1HTkAJhIn1WHJL/pHU4QlkCgNZ/hxIlR
	3HQ2RuuZ7eO8GnaXvnSxB1JKzDWZwFsBy6TVZ7zeYmqgQvFhI72OwkRlL+qY7NuZgLFrB7Dao7q
	9D+ubc2JH7rlbzlJP+McFEG1CoLJcVeak=
X-Received: by 2002:a05:600c:a315:b0:488:9e54:94c0 with SMTP id 5b1f17b1804b1-48a77adc73dmr87486785e9.8.1777468973283;
        Wed, 29 Apr 2026 06:22:53 -0700 (PDT)
Received: from localhost ([2001:4090:a246:83ca:1917:a47e:1872:2063])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c2fb999sm27272745e9.6.2026.04.29.06.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:22:52 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 29 Apr 2026 15:22:08 +0200
Subject: [PATCH v4 1/4] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-topic-am62a-ioddr-dt-v6-19-v4-1-fc27d6ac753c@baylibre.com>
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
 h=from:subject:message-id; bh=URQQ9Z6jTAoqQ+MLUzm/WhCvSZ5DsHJ0Gwd/k9oBwGc=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxPbLwNny5P2dS6bpNoeqX514OlZ9ZZruoR0pyy9Hnw0
 9UMJWumdJSyMIhxMciKKbJ0Joam/ZffeSx50bLNMHNYmUCGMHBxCsBETkow/FN5k3/4zoRlaWFT
 DvWbrWKIKDXhdGH14/yWsdHO46Z/9UFGhinX13w+NffX9meK1xseeKgYpE2TmT67zlLH+u0jc4m
 /3FwA
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
index c1e9067b3bdd5ab0591541d4685bb17a5dac4f65..6f2ee93c7be141ee5ae3f1e3324d3a060db069f6 100644
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
 
@@ -933,3 +957,15 @@ &mcu_uart0 {
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

