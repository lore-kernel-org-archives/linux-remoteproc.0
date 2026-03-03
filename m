Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4007448A2B2
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Mar 2026 15:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772550842; cv=none; b=twXWEfQcQlcxCAQ2V88jF9CWAuJChlFD3i6sQAkYQpF/M2swFL1QZI8grf3xgpRJBUkYGCg+dqcrgoiB33wLBDVWXwznioKiG9/B1ISbF1mhXbc5ndBlI0xzqk3HE/+P9jrv60RkqFVwcCc2PR5qCzprRlAotA4XIgaI5EFyYEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772550842; c=relaxed/simple;
	bh=Z0hCS+H2IItocsB+jWcDutoPEuYwBwtSDmCeiRLXMdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LJtE3vMQwvrDxzvoiC9JJ/02qGeEDYrIi9hq/EG7hB0B3kLzQV3l/QWJkrcdfIeYVYVbBNLUoBLFcdJzMHgCmhPhbfVkoFhV3dT+FtUVYEAbOu2kLhPkwl9r0qwgIswq4czr64LnHUQtUm8KtPdEWEdBDN2lzDAEoV3bon2KvyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LKYhEc6R; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LKYhEc6R"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-483770e0b25so49473705e9.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Mar 2026 07:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772550838; x=1773155638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8FTo5uT1h7nOZ7FtDex+0/FEIZ4xUi7xNVLguZff5jE=;
        b=LKYhEc6R5OWpDSo+H+386bB2Kb1OE/iOipn55BTNZs4QAxlMf6e574TB9LTBXK7fNU
         MiHEyV6OAK3Mm0oQYjco5DsNTL7Yb8+7PJlGe+W0uEqylL77rCgeZcjP0bHXWa+XXQOg
         Rb/NMYSQy8ENtRIClvVI1C3dWiQnpXJme4uZYHlr5avXDVv2kWM2YSrZh7j+6+Ov4qik
         TtWwULXXZK6eXM1Si+OmTH5gIOprJGjiAvW6UkMC0BQEKxytC0ng94bnFUMLBWsj4QdC
         BvKf6OOrV1ndVGIaF0tL7VZ7Ts8ogi0m7MLCyEElHVPWjt+wFQa5Xq/H7vtFFwIwcoHE
         FS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772550838; x=1773155638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8FTo5uT1h7nOZ7FtDex+0/FEIZ4xUi7xNVLguZff5jE=;
        b=WXPjuGI+MYCjjB3cmt+rDeHzMKeaFEpcGQR28xCd22pDgKvvvu1fcI8VK/BpWKhOZY
         uGVbFwA43eTkwxVZBNTbewQbX0g/V8DuU2AGtR2O3lE85DRgkr77lagVJybjLzpO075E
         D+1Bpc05gUrZjmv9NEKC8XOCznkEF/47ZFLhG5Jrq0Sq8y4bYfrgbkbF70/TAv9TZhYm
         eoZZjMXPrNcbs34kIkWZuTp7FUor06CyL4RWm8CwQKYiXH8NWNyl3xZTb2ZFyc6PCX4T
         +FQK9CLrh95LddZ1NXGyoWndD3HmTyK1cU/tivqSW8PZZIHuGnPflWe9i4lO6MJX/kHE
         VqjA==
X-Forwarded-Encrypted: i=1; AJvYcCUlDSJr3NC2aWc9DEfwFqisQvTdgmpeAP9ADlygahr3E/eyENq62Oif/rWfVdjQJBdR2ACWeHEC0jn5ONWvzaG2@vger.kernel.org
X-Gm-Message-State: AOJu0YybO5YhrX5RZ8Zdzhm4LWTQ/CeDJqfiK3vfWDfyledo3gt8jlxR
	jD6oKj7Bcpq7/NdRECF0HF1ZEgio0nSk33Y+iNUD4pfvudnvkuKKdMkNY07HxC+AsWo=
X-Gm-Gg: ATEYQzxLJKzslNvTSiN82LyQ+p5xqaT5fv8CgqcUHyi8RWw/TuZZNiAwKv0PB+TcrN0
	/79Qzk/IpW/bJThKbYXrlpsvOuhMzvdmDf+Z6M/Z1I/itVJY9GOMCCMkEhyAieefbXtMtge+K0G
	LCPNTm/e+Y2Arr9iNmfUPgrkm0SCfLTt5BUg6wP8sV0nyQjYuS8vtpObTq5x9Jpog0zbRpF4e4/
	qDAY3LjO7/LbBp8mx9S+ZmIyhe1J6MyHFWd9JIM5lMIen3MQi+PDFyHj4CNto9xWd4hnsTmAmKb
	Lx2EMVSwFnToDwXi4J61R9wswNxBQ3g0aHKtBPwjCIjWLmZTFEcy3vdiT3q7QKW9fhm9yl0ooqI
	dcdlN+QL2kt+jKGdY2B1616b0Sbp/pTcMhUHfqBzcwWMbgOb88GlarSWtqm69IoS4bcsOrkc8nW
	AeibG4c/RXorstPc50fKxjIMge+dP3pWA=
X-Received: by 2002:a05:600c:3110:b0:480:2521:4d92 with SMTP id 5b1f17b1804b1-483c9c23ffbmr281348625e9.24.1772550838544;
        Tue, 03 Mar 2026 07:13:58 -0800 (PST)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b3ce8fsm357946955e9.4.2026.03.03.07.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 07:13:58 -0800 (PST)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 03 Mar 2026 16:13:04 +0100
Subject: [PATCH 6/6] arm64: dts: ti: k3-am62p5-sk: Add r5f nodes to pre-ram
 bootphase
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-topic-am62a-ioddr-dt-v6-19-v1-6-12fe72bb40d2@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183; i=msp@baylibre.com;
 h=from:subject:message-id; bh=Z0hCS+H2IItocsB+jWcDutoPEuYwBwtSDmCeiRLXMdg=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxlv5b/TcnsfLZmYhPfvfsXtk8u7/qyr3NGqXKF8oOGW
 /eNTgls6yhlYRDjYpAVU2TpTAxN+y+/81jyomWbYeawMoEMYeDiFICJnD/C8D9q0TWey7Y+eqq8
 a94KvXN1bzjwOfrC1TOfHaVTmDVLOzMYGf5O0DPs/X3bY0qOy8+WSeI2FX5bpl44f28t20+u7xM
 CF3ECAA==
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
2.51.0

