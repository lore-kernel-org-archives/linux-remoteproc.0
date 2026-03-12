Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6C43CA4A5
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2026 15:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773330616; cv=none; b=Etb7upUK86OhEw0m8YbouIDq/wYRGXE2B0dQKqg45JWsARncOGMDLlrMh+rtD01XZqADtIKQ5nM6vrmTtzbSWylF0vzOOtmteLQEqCBSIPMjWr7NyjbjdOEEcozdp3Q0HolsSK918MSMvs65QE9wOluTpz9U0Ivc3I+ayR1HcPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773330616; c=relaxed/simple;
	bh=8u+OHH2OFtnrDqEIjHNZaX9z21vlFvfBncTMKuwpawg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y51Pd5I/VWVbwzBPEloN2Uxc9L3yf4TvAxxX55f7cYvGKaMMFQZ4p575Pa2RlTMSK7cbL5HyiEP6jrtUj9TPtsV9aV3m3vU3pGLJvCBQinPAuJuUIm6F+I6Vl2hDQolfrFpLeW8+3i8ZZl+l8bQoUd7XPDDmrmT/CmBZT3AGKDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=thh6PbWu; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="thh6PbWu"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439fe4985efso1036496f8f.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2026 08:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773330610; x=1773935410; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6FKMrTLP+EgoNwLb1d4K/Z1ONjM0ZaJwdkY97QIcxI=;
        b=thh6PbWu7KwZTHAYwy6TDj606OkJXtfOuw6q5GzdOZh6d0wS8jxILjJkYiWsF8tP6P
         KtMjHXlUd9dIH1fTMMH787wh3xEnxFfSVSPA5m6g9HzDJPcXwvH4ZC+SbgTHNyGVpJ8o
         nH2ZUB1k6EkaPyftinwASy4wcwldav/6Tkam/+RKVPepeq+0rZkavHgu2ltLXB0N9Xgw
         o0IYhBSPxaVCs19q4Grt+oXvor5F4pEA8nOjjzZD3MBIRIs9hPhMs00NUuZB8rW/ifod
         TT+uiKbXMO/nU1dJkY0+y3XvGQCrHAieJknYFrcviCVLS4jiOdkBK6wFz0hoZm31Xrun
         LNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773330610; x=1773935410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d6FKMrTLP+EgoNwLb1d4K/Z1ONjM0ZaJwdkY97QIcxI=;
        b=Dz4VSLgumBx1STIr7nd11+A+1xjhLMUIbpoEspoVnyOkAsZZNU/opMUo0hw3yT5+e5
         4zuLiw0JXTDPTDO0csmTDMFoJHyBxfoUlzEeoUJ38ZzDTTo8L6CsZk90MV2rlKmbPGVz
         7nDkp84nF7K8UgP9GisIFtbozwOBRoBhfGPwMI8CrrmddyfJABh417QOiKUU3whDGcyg
         9s5RDtx2mSOJTPtWair5MkdUPWvQSeGDFfzFzyV8JUQPr9k9eegLCnP81xyQcUSIFdMS
         oo/28rDwd8MKSaFUKc3CZ9c+upSNSlhsfiXgF85TUkw1XF9d9H/2PQw0Fo85KCWvmbsZ
         2NbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUakaB8doqySAgOZqE2UXITJh9tzIEACXGqZuaCvXoKC9rNbTtLWBHcz2EDBGjZMdS+HxOvxUD1gZvLRNx6fZKi@vger.kernel.org
X-Gm-Message-State: AOJu0YxBGtZTtRXn4WbykyHtV7DCNpP6jISDU0/j7+X9E9U4ql7Fn+fM
	zD4Gkx/OZKOx1tj2zvY7H6HzNzChwvCrZWp8qiHM+Zlm4BCL7Gy+ZcRsu6H1PRzEmTc=
X-Gm-Gg: ATEYQzzp9ubDbVnVln+aSD49VSWdx7sk9lMJjvod4PE/p5uHtkJVIo1jaAuifrfNkdt
	15Z/6jEEdXcKR3cTs0qvIjdbGBZMpeG2AbisVQ1rhzKEnytv0mJX+iLGYq+nKWyCABiWbsHsGKs
	ItvvFBsoivx/AGQ3NH6CBRjqyFu1KltJ1wwJq2sOdlmRFQgmLfSotvCPyLyABVZtmXDHc/xnJO8
	y3zFwcVkq2khVbBCykLzYPRoVTGwJHTd9BxOAZSujpRQqv+4ZCInaoZWMg9wHx+XdhnmFHDNVQO
	0+2uIQA530VJMsxqIEZ7hl5UwU8YxPJ1zZcCk1MQG5OOP/2elWZcV8mS/TLM20tsrTqhkINhaxr
	rbLz2eeAVkB0YtQlU5jcLl+iQEt3bMOEtrhKDHQb7YqCWfHieCzJFQpF8sw0WObRQd6KKG2xOnT
	PB0YwbQcLRWqgYvn+oVzFc
X-Received: by 2002:a05:600c:8b65:b0:483:6d42:25c6 with SMTP id 5b1f17b1804b1-4854b10f1ffmr118612015e9.23.1773330610261;
        Thu, 12 Mar 2026 08:50:10 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f255sm243387035e9.12.2026.03.12.08.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:50:09 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 12 Mar 2026 16:48:57 +0100
Subject: [PATCH v2 3/8] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-topic-am62a-ioddr-dt-v6-19-v2-3-37cb7ceec658@baylibre.com>
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
 h=from:subject:message-id; bh=8u+OHH2OFtnrDqEIjHNZaX9z21vlFvfBncTMKuwpawg=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxND+o1FzUcigo7+OpmvYqcxAYzR/kPvRz7+D8z9j068
 FqQJ/57RykLgxgXg6yYIktnYmjaf/mdx5IXLdsMM4eVCWQIAxenAExkCS8jw77vIdWHvxouk/9g
 d/ibcr/UIfXw6bL/6xmfl6854S1tdJHhn1lYe4xq+UpF+Q3/YtVyFrn03Gh8UduyOuD33prpncn
 ujAA=
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

