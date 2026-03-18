Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2862627E1D7
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Mar 2026 15:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846869; cv=none; b=ODwaWtmR52J+wNri8sjqlN/H1ejpQ5RQY25asGr2gq4wvKCZGz/NbFS0sTfCDhAwBSrVSekvnl13v+fMEzNdFIuxYjrU99n0tRiD7xXSGml2Kf/nouHi025RKaa9qVm94M+cE8dKIftL8wKj+x41s3dabpr1u+DcDes9Ydco5Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846869; c=relaxed/simple;
	bh=iQg2/EW5erfGuk4mijSK5nSh9QVwrNZkATnyLQE0wvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ldkaGtM2va4uYFjs+v7hgoLGcLa6ipMhJx5vKW+u88dRFR7BnS2a3RoxoXobJZ/IvI32h7Xcq3i2biLLluX+vrK+4zhadmxv7fCEzw5u8wFnlvpXwM1DAP99kcqIrdlsN0FOVrMNVG7GXAVIIBnqxOKCtgkFcuCUvHZ7Ja49Wjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dXHCSTXe; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dXHCSTXe"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-482f454be5bso10587885e9.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Mar 2026 08:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773846862; x=1774451662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zGfrel/ZHD/jnfQbmAOjbJYHLBGT6cfB4kl14spMH9I=;
        b=dXHCSTXecQ7ZxnVepSo9r7nWEG680FKcBJtX19fvXivIetheC8U9QR28Uj25oMRCbG
         AZ4MWE7S52rDg6uClgQbqacJG8I5QjFvMxbzKnXifFMa1GI/0/+7WVJGgaHlx/uu70RY
         T1zziEcqffyQ59+dqcU8Nsc0Lh5zwLziDlIJwIUEFfgBB1XFaIATUmEplSHcTt/dDfzG
         3EZWsqm9VDQNyMqDCrgm36WeEgQBkONiKYBOkwvw/sqAqZkZpm5LDxiZdAJsyjSNz9AQ
         svLN46Ha1Pkfop+3S3ZuYvWBNwWo7AbSwHZLE3mhrTgnWASryTSNfFDZ988e1UHa517u
         A76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846862; x=1774451662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zGfrel/ZHD/jnfQbmAOjbJYHLBGT6cfB4kl14spMH9I=;
        b=rpm04zvV2K+ZL3hem/5w4Yby0NDblCQrUN6agaKBmZjSBE9YZUFLD2lXEkzkibMtWU
         ViqETqMLLq4r2tT+wV2q9z0JUjxB7R2IbgOTjntshQvNr/eSkORDbPT8FrfJhEcety2f
         Qxcpwod/HC2EIvwcjDd+XjF/uIC36+UKzmHSy2rAhnQaNlG5tYTA/ggit7ltyQzkkgvd
         /lH7VeUL/Xv9gjdchnb5O4+6T0X3pX+8+a+VSFRcxPgUk+FZ3ahgBB8YkhXtxyHwPhV7
         v4oy5Jct3S3SZYfqafqnxPZP7gQA+Tlbpg8/R1NC4WHVnKvyz/MGwC7ZK0w/o0Tvlpqd
         P3MA==
X-Forwarded-Encrypted: i=1; AJvYcCWQJmn4QKAD0aBnsG4JUG4QxM0dv7MKC/7xOEV+xleh8axZa/XwYU3+4sR0hPMemnT3qW1iyZ+xS2oRop3rUSSF@vger.kernel.org
X-Gm-Message-State: AOJu0YzFNOM8uXowd9GAKQ+GqKJjLJ6gtLpMznHw8P9xERYsfKaxp0Os
	dNmvTkKM0gm7vMrMZf2XQLzC+4AKdie/ejgG686zymJ3TFjb/3O6i/2QSFI/E76Ep7E=
X-Gm-Gg: ATEYQzzsfEB5ynmQaM7fOmHzjOdjtfb7njJcZKcJjQwIM5x1WyeOrQqz7PkRd0vC7Qx
	pkQoH00ui1v68ENK5StV9nLDbh4qXBe04OyYg4PltBhaNhh+xP4regWzulcAK7YZFZ36ggeB/+9
	0zxcRT2Qhjedg2mtENznriVdAYtsoNBPsIXjWjnPPkv+bF1/3iYIiYKbnKAz9mtbouGnwYL3A1b
	X/JN0ZfF8uGIK7jG/WuP/3ysjyNYPFe2iR6hocXL21YC/3xXkmz1jx8z0QnFf2nvri+JzN9TPHZ
	j7+jGcN1QwThRwSNjd2WN2AapAE/PPt3oHPPOFuU5CWbyozDTrExiL9rtpZmTBDBhwFFS4/KKRf
	e2ADKDp1QTbIxymYg/2XjJEFNJg4x7wJQMsuH3NIrri7tk1qJxyV81AmCbkP9wslhrShAJZSy3d
	RYe+3HCKCP/leLcGYzs8UL
X-Received: by 2002:a05:600d:6414:20b0:485:39b9:9680 with SMTP id 5b1f17b1804b1-4856eaebb6bmr93960945e9.16.1773846861955;
        Wed, 18 Mar 2026 08:14:21 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5189970fsm9220183f8f.27.2026.03.18.08.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:14:21 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 18 Mar 2026 16:13:13 +0100
Subject: [PATCH v3 7/7] arm64: dts: ti: k3-am62p5-sk: Add r5f nodes to
 pre-ram bootphase
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-topic-am62a-ioddr-dt-v6-19-v3-7-c41473cb23c3@baylibre.com>
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
 h=from:subject:message-id; bh=iQg2/EW5erfGuk4mijSK5nSh9QVwrNZkATnyLQE0wvU=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxdB22qtudcW/vOftsUM4ujlgu+n+nKe5/41MwleM3hY
 L1zwldKOkpZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAiETsZ/ikkyRsuDzs/88Wu
 ZUs3Ra0+8Ztjv4uC/XytUj1JndeKGUsY/gfvOp1SKBihVZUR1/xs3ulCn/mxE+ZOygl0Z/3UwZK
 vywEA
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

