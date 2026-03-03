Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF5F48125B
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Mar 2026 15:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772550840; cv=none; b=rQvc2C1aDxESL0WcAbpZx4duhMU0lo0GG2CEmoyN2eCP4ZxiVvoAgC3bQe2ZQKLauu+TWGLX5+QhUszEUBduyLedcQaiTdpW0eAnQwFzM0fdbUD7/ABfj0VPWTUZj1N3b3e7rv128VSOjkUnTYJcUdD/KbpBmmqX0RLBtHEgdVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772550840; c=relaxed/simple;
	bh=60YTLpePbAhheGlRr0IQd8JJuIK7LJIkkR+TFA7gb4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UpVbL44bkFxPvK2qu9Lc/0lPkX0+2gAQFMWRzNhrR/+DBDj5HoCILMgS1blnWmeONNp314Z5B71r4FwuP5XGLn8B/0kZOW/1Pix+SywkebbxOwXCVmwRZmVGFj64e0SEynGbWQhuMCaiVeoa1UsYzEZKTVke7c6IggT7LjwOyGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=j3GMPGX+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="j3GMPGX+"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-483a2338616so36186875e9.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Mar 2026 07:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772550837; x=1773155637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TcJA/8Mwq453n41Liu4Q1RPW1Mr6IjyitTMqDg3JnXs=;
        b=j3GMPGX+08S1cQgRTP6gf5+I3AdwhZrQfc2wDJXdswwFLY6diN6Q8zSoBSBAP1OJcC
         qw6T8DL5ZrH7Xthd/OtFibVaicG1aWTNxfOzh1U40gfWympY5/J16wh6VEHIpOlbi3zN
         3CfexXbhk/XsDSdUNqvikEKtVDZMcJdjVXIFLEtCqmTcDUxlbRCK/+dcTwohN3Ns2CS/
         tgZD7ZV5Xqsf2PlbqGMECL2EinpISncHYxPET+xLTh+eTnXsdWukO0lMirh16yMDTAmC
         4HO7kLjJHYpFK9XAQbdpLw5rk+FBTZQ3iSeIhnXOesNNkp5ZGrwmcgO78A2UFcSYzQm/
         tnbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772550837; x=1773155637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TcJA/8Mwq453n41Liu4Q1RPW1Mr6IjyitTMqDg3JnXs=;
        b=OdkcyYEYy8786Anp2xehiegRy5UsG/U8fHQQCbURjbZKyXdoY25VStRrmf22gVj4VW
         qLC1bQrwyiAYc3AdmDkuOuYLK0whWNd/ZRZpeAqIGC47zxTuPBOl8NRNJc0OYDuzEl03
         MgEGiCSTttyeA45AygIxd50AFO9DfYEWWgHI284QdXeoxGabc9HguVSq99Xkbcsm99jx
         Mr5Qiun2FlC5KPFhp/wUC7g/dEDskGfrsacvS7TlyPmjxmKRVCFbyY61UGnnS6I8LUBH
         jRgV1+i08qB07SRdlzB0PWyr+tAKmADiyV2gdWhy3D1htH8didp6eTBj+1OXq3/i0pc6
         8ljw==
X-Forwarded-Encrypted: i=1; AJvYcCWBwXYYn0MwQiKJr2zWGtFtG0D8h1BLXvmO8CvgB/EpBjkYhD0gGe3UcIiYLliP7N0C+l3woupRflXOVpnltY+Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzwcQRpUfyR+zIVWpzvWNrn4ozLjUzvTvfwVKWxVZljqunH4SIk
	4+QJ3BxI/4MTMRuKj1+hBsSKxAsBBo0/ox9IWUqE0jHrKtUvl5eDzmsYQDWAzmYLIEQ=
X-Gm-Gg: ATEYQzzhD615IMi3vV2mEDsak8IbYG892Zlcf44OOzunkD+uVta/g9fA8ELMUMtQjm+
	M3O8RiI1AwjBSBebJpFCuSgWDi+Y4+/BuC0qG2wwnT74BsfoV0A/yWNi8zx1SGgslZ83HF33om3
	DKy/4ZI/9ZHcWpANvK55d65PNJOQ0RRrDRbWAeh4t6+0dB0SDSWe2QEcR0QNQS/8j4qNI/EEdxY
	3/fEMAabsSPBO2CS66R6djYSaIfjFjmo1V1xSn8dC5IJmH/O+moKadyVBNS8BJtw4Gw5C+XlvyY
	dk32mv4lDtG9hnqF9XHPu9heDmxNRymeY3VKNR2cg5YtxyjIl8C8iZe6ZkXnqQghldslz4mkA5x
	OzuN/k/d9CyzennLCa9L01246eHh8ZbVs4+7Q4OERyMBCab41Uu3bSDRknv7uWBg7bH4kmG1Gfi
	fLhjh7NToaEmPtjsOiZ/mq
X-Received: by 2002:a05:600c:138d:b0:483:361b:deff with SMTP id 5b1f17b1804b1-483c9bb2c10mr288804005e9.14.1772550837470;
        Tue, 03 Mar 2026 07:13:57 -0800 (PST)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485133a928bsm16836685e9.18.2026.03.03.07.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 07:13:57 -0800 (PST)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 03 Mar 2026 16:13:03 +0100
Subject: [PATCH 5/6] arm64: dts: ti: k3-am62a7-sk: Add r5f nodes to pre-ram
 bootphase
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-topic-am62a-ioddr-dt-v6-19-v1-5-12fe72bb40d2@baylibre.com>
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
 h=from:subject:message-id; bh=60YTLpePbAhheGlRr0IQd8JJuIK7LJIkkR+TFA7gb4Q=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxlvxapbb+ukrBkiiWL/dGWrBdzmU5+2qJZLJB4bcXeJ
 juRqrbUjlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZhI92NGhqMTJx+Jf+3y64SS
 fGqP+JfK+zmPogS2zPB+eWDNrfYb/lMZ/lf8ujlRX8Opj73dWtMvUm/m8dOJPHveTLy4d36ebLf
 ANiYA
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
2.51.0

