Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B305B3D7D69
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Mar 2026 15:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846867; cv=none; b=np9tlzDlixA3k72UZPBuXIvQCvrq1hqaAMVltIg8yaAij8RGl0eQfsNuuAY3mCJ6j2HY1aYeSyeMeN61qdo7ubE3cMgdTkcwebrP0tCy/33y/4X0i9CiDJhJ39laHIkyzoE37seiXokXQlynh69Cnp/99yJurXnAHodWAxnsAU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846867; c=relaxed/simple;
	bh=edVr0rbhOgkFhSfFFpjtgCVxX4FcaJ3T2Pi370Z0o0o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U54449Qmye9VQvvgojasGhzln8xcMQFrSuDuReiOo7pMIZIZDj8/mMNf5zQ3gsGJhzmFnwM2NZpMWLoRhFaI/VtZUl1hruS7/sahi9vL411MSC7zyN9Rs2asxDBO1osZwiCuSSCX10J6vP4AFfHjlqkrqDkSOjA2SWZJckOIs4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=z6p5VMCS; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="z6p5VMCS"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b4f48c47cso1475278f8f.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Mar 2026 08:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773846861; x=1774451661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fnIikZ33fceOx0YIGtLUvBXoWdyjzbgo3+1Q5/tnQ60=;
        b=z6p5VMCSlxDI3Px+glaifyI+uenlBFkP8uhQCN42PLj2GVboanZKD1xFJkCPYULLfq
         2ASHBrpO2nZZhO5NbemUR3jaP5NwWPSSM4OZTPn32KpGQcAjneXaBLspasQT9hq7S/k7
         6emowG6eG8gBLl4ROteGqqIteqXNm+rQorWUOuHv+YT4yjmeWSGfPaSI83NJVdWWZ96L
         DdSXgRrWHtVliW11Z0R7gXqv7a7VC8e84VrISLW7cxiRmYA52f3XPYO/NDm8/oTyBVIC
         gET1XJAs6qSQbqNUAXD1JBi181L3V+3OvEv/x28OssQA+b0kBMFtLsalcuRbNrKTcOxG
         UwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846861; x=1774451661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fnIikZ33fceOx0YIGtLUvBXoWdyjzbgo3+1Q5/tnQ60=;
        b=cOwqy4RnfHDx62hYXySYpI5iLqJQWm80ypnTske+a0RygCOtGHqIaAjKkMN2KnAVRX
         DaNXVrQKYaxFXoVClCUcYVSLNhWhV9z6xxQ8/he1EAvWFLQTKzO/b+CQ5dZtSvpTWA7o
         Pa/ZeQxlwNy3w5BL/TSgTReGlu3Sw1kJWBfLCvTT+jkxNV+FD5orRviVAVTesj/xc3pl
         ym0pgyJbp9O63aYHWHH38h8Vdu/WeuNxd1ksD39Q3A5o30hXfJ7dY9QhBDvG2By8apuv
         5xlbpEjvqC8n8BrfRRc0DfWTOReGaZS+sOpyqgscQ/FKO9dxDWKX4R4Es/qEYBIRqFD3
         2aZA==
X-Forwarded-Encrypted: i=1; AJvYcCXsNntOSxlyb0M60DtYGC8FUvDH5qVgloEdkq4g6cRyDBv7T2nnClojMb/zJTIhCpI4u/bSXyA5dY4rl0QTVp9w@vger.kernel.org
X-Gm-Message-State: AOJu0YxDGXMb2NU16kdyvuP92ap/ekR1WkCGn1gSkojBopyJv96mOHGr
	egWC23gNm2vQz7WOgNMRDLToj6hMBfXP2EHMwiZ0BXY25rayJcGJ/ZChdaPoWYTqr1s=
X-Gm-Gg: ATEYQzzzSnyozXx0q2tSRlucAh/2iFEgKFT+3HipXOWMs5OzIvPAXETNnzxJevN/hzD
	V5mQKhjT1+yUpqdl59M7dpbRzt0lc5sFvyCCyvCOqg4ec0S6bAHVUGWqi9DIk+2qpC316KPfJ+O
	OaBCnRUyndr9k8k/yb+YYv+ltTFJqIU5g40yr5NsYVcSjIE4HAaMv1ZXK2OSM3XirlmRbXWwksq
	GR/0I+ueYBuAvo3YSQI9IQsGUkI0gETM4TagdLbKZt0JILbDMWelvW8iYhun2FWXona00JAP3i/
	Q6iQa3hxCvuOEf5oBuNPXcJxcvpRKLt/3F4g2JWNF4Qmk7T099Bl2IPz8ne5ocn6FEESTDNcY3I
	JVQzxG2MFLUXHxXvl6/wPMUIbhVaoPads/al2kf3+ZUvXO1hhTIrFmVPLMZahVt7fq5eTYAOzg1
	MJ5R/u7RvwCFulhxv/iFdv
X-Received: by 2002:a05:600c:1d0a:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-486f4429b1bmr67241605e9.8.1773846860878;
        Wed, 18 Mar 2026 08:14:20 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f5e162cbsm26759545e9.9.2026.03.18.08.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:14:20 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 18 Mar 2026 16:13:12 +0100
Subject: [PATCH v3 6/7] arm64: dts: ti: k3-am62a7-sk: Add r5f nodes to
 pre-ram bootphase
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-topic-am62a-ioddr-dt-v6-19-v3-6-c41473cb23c3@baylibre.com>
References: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
In-Reply-To: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
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
 h=from:subject:message-id; bh=edVr0rbhOgkFhSfFFpjtgCVxX4FcaJ3T2Pi370Z0o0o=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxdB02OVr3o/S3NEN5WfPnCzrP8d5b+mCt7bfeuhDXbI
 spXC2zp7ChlYRDjYpAVU2TpTAxN+y+/81jyomWbYeawMoEMYeDiFICJsMQzMqxfsqPjz+3Z7lW/
 DfevSH2yiqklwTYpoUeP9fCJxTVtxVcZGSZEce3/ftKfa/YMmepXm/lP2wW/v+ZxzkbHa5Z7/tQ
 zjuwA
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
index c381cc33064ec427751a9ac5bcdff745a9559a89..46483d4085c20fc297d28a49ca7ef5d4bfc4ae9a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -75,6 +75,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
 			no-map;
+			bootph-pre-ram;
 		};
 
 		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
@@ -957,4 +958,5 @@ &wkup_r5fss0_core0 {
 	memory-region-names = "dma", "ipc", "lpm-stub",
 			      "lpm-metadata", "lpm-context",
 			      "dm-firmware";
+	bootph-pre-ram;
 };

-- 
2.53.0

