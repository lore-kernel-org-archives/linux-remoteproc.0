Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0783763CB
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Mar 2026 15:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772550835; cv=none; b=ZoJDLg76copb4LNrNyduF9fT5DRrf5xTAtgpRx1msXBy0uJR1yKenZOnhg3bA0FrMqv2sRpsLuEtAEsMNM3Ngs36oc3Nit9KO2ltqE7M9BFQfzVEVfbNM0HSpExf03ZedyXFCXJYJHAE/eLbtc1M+uzPqitOYR6N3+z5vINmppY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772550835; c=relaxed/simple;
	bh=9jv4a1vz0B4Y0Se6PnOzjXSDFfM4cHN/74M5HEnLJGA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Gom3k+CcodUU/9ZIYMnko4ZvDEpOKhmnXwbB19nB/3ETM5wdMSugHuN86ifIGckgwvGK8LdAIDREaa+TXt15eVroqDs0/2iyKWnDALGxlg4OBqKDCJ5fg3kj3kWT7xLVd14hEcWxnX1lQrJHsAzMLk5PaYOAcUg3bMMIpFXHzlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=STLcj1gM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="STLcj1gM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48379a42f76so47650965e9.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Mar 2026 07:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772550830; x=1773155630; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pqHM9PVtocZZ6dJkagETpj+4ELwjylZhR4+lPK5nnFE=;
        b=STLcj1gMFPpnBlRzRPaGD5cLDek1o2dPTQ1CGIDEvhVatkkN5zvuRuuYj34alnhmJx
         ZcJ0gBlcNPu3Wa8jCAooLNC3Q629WLNBAoMQrSEFLewxuULGAJpZgMZXIUmARtHi30I+
         9wcpFbvaYkyzL9W+2tfd+ypAsYiLun1kO8Uo3qOIXVYld4M+g+n97UUd3oLDK6L/F3SU
         rOdGy7/9r6SeTUpzyErj+5A/zFlsAYmbXi4hOJ2UZNvcVrQHGr7QnYI6IoTsTv9NpLbU
         JA4dvohuobYKMXKKcTxjizNwpW24rHtfg+yUtmgsgrC5xB6QuR+q9+AI7JOib8VDAM1z
         Z17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772550830; x=1773155630;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqHM9PVtocZZ6dJkagETpj+4ELwjylZhR4+lPK5nnFE=;
        b=CjuF43bPQjvQfRGWKtKVoJrX47zIB8VTeHy0/1mUXIgqX+ktZ0w2ifSJbBxvzW0vh8
         +i+GlSXL5TFD9uG5PVdM7iihVb9ZlSnmJHYXL1I0YAorifb0lWmPqvRo4AfPdu+2rjdw
         VmQi1/fk4Ip2nH2I0RUVypwDvhYyp+pRxg+7baoY1zvmCqDKvcANmFYsUBpjTNuXoQ5x
         mC7NudS5JuWpfDch7okdU6PtFPXkpSE3jUC7aEZ24COI3WkGuXNvHbuow6+w3rj1452O
         H19VQUpBwq0ST7rpz5GuPkyzrnyaspOJiLiOs0z+WfLVyt9cxYPmBAEe61rFUR+Fs6xO
         S1lA==
X-Forwarded-Encrypted: i=1; AJvYcCUwwf1mHgnAXrnTBg7TTuYQzT/5On6Miyg50QM2INxPmSJAtFdwDBaM4aPnSIr8SSU65S68/yrGcvrXXzlR8c+b@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbkrmn+IEYdHoGm8tPQwYuvAIEQyUQyJJYtgcWr8MZeMM0NqXS
	H81jQsoMRaicD/ubokhEcFB6ZtRvd6Y4BTC9QpAwWq/oxWk/8t3IhkgeS84oUvlBjq8=
X-Gm-Gg: ATEYQzy4OAe/TtmvmjsK1gzDh5MRDYIgT/6HnTuNZejq2+L2+NOtNXiWkMJAWefPfLk
	2+hSHa9cIQ2b2PsIeIguvxqrxHi4FY76xPtaoMgLZKyVTXNtTBtfQVC6CaKrp1bNGa7uPiU2M0g
	j+bhrhGk0GcXb7tZAwVtbNaJgFLSguhHI2cwhG3BFiX0UHpvoVbj8mmC5KVVt4NpI0C1vuiMnjr
	vR5lr3W5iU2muK1SEC5BnW4uvGPmyDYDyueFOp7SNHMBg9iNym9BayQ4MJayYRO4M2NnH8diaei
	+2lLqxrqX3OUtblleipyv4rki8IitG+2VApbbDuqnRbWY+QHqyay9sc31/vI33VhIO+Pe6KMEVQ
	1Cucv7iyENnhGbNo5skagRmSN2MotZ5YFAlJF9O3/fBX9Z2bqYnnxRb3LiR3nu7nSRl04ylhJz7
	1xgVKLipu67NF/BaSoKuOgVx6KNw3s7hI=
X-Received: by 2002:a05:600c:34d6:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-483c9c1cc59mr302543825e9.31.1772550830411;
        Tue, 03 Mar 2026 07:13:50 -0800 (PST)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b7713csm321623695e9.11.2026.03.03.07.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 07:13:49 -0800 (PST)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: [PATCH 0/6] arm64: dts: ti: k3-am62a7-sk: Split r5f memory region
Date: Tue, 03 Mar 2026 16:12:58 +0100
Message-Id: <20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHr6pmkC/x3MwQqDMAwA0F+RnBdIcmjVXxk7FJNpDlppRQbiv
 1t2fJd3QbXiVmHsLih2evW8NfCrg2lJ22zo2gxCEkiY8Mi7T5jWIAk9qxbUA8+APCBpipGFetY
 ILdiLff33z9+f+34AUxmDi2wAAAA=
X-Change-ID: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2289; i=msp@baylibre.com;
 h=from:subject:message-id; bh=9jv4a1vz0B4Y0Se6PnOzjXSDFfM4cHN/74M5HEnLJGA=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxlvzoO1/L61zJk/4vPK15VZG7vLng/9u7+Cwwnt90Nu
 GbNe0uso5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACbSuIqR4V2JyZ+ZU97MPb/a
 7gGjtFGJccxWsaCru3webIvdJlQ8MZaR4drsuf3GzPPrb/vwPpLfpyi6jcthf6vajiKRw5uVlAu
 1uAA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Hi,

Split the firmware memory region in more specific parts so it is better
described where which information is stored. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data and resume from RAM.

IO+DDR is a deep sleep state in which a few pins are set to be sensitive
for wakeup while the DDR is kept in self refresh. Everything else is
powered off.

The changes in this series were suggested as part of the IO+DDR u-boot series:
  https://lore.kernel.org/r/814c211f-a9eb-4311-bb84-165b1a69755f@ti.com

There are currently no real users of the memory-region that is split in
this series. The size of the memory-region in total stays the same.
The new layout is derived from the software running on the r5f
processor:
  https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd#L172
  https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/source/drivers/device_manager/sciclient.h#L459

Additionally the two important devicetree nodes for resuming from IO+DDR
have the bootph-pre-ram flag added as this data needs to be read before
the RAM is in use.

Best
Markus

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
Markus Schneider-Pargmann (TI) (6):
      dt-bindings: remoteproc: k3-r5f: Split up memory regions
      dt-bindings: remoteproc: k3-r5f: Add memory-region-names
      arm64: dts: ti: k3-am62a7-sk: Split r5f memory region
      arm64: dts: ti: k3-am62p5-sk: Split r5f memory region
      arm64: dts: ti: k3-am62a7-sk: Add r5f nodes to pre-ram bootphase
      arm64: dts: ti: k3-am62p5-sk: Add r5f nodes to pre-ram bootphase

 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml       | 37 ++++++++++++++++++-
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            | 42 ++++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            | 42 ++++++++++++++++++++--
 3 files changed, 116 insertions(+), 5 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7

Best regards,
-- 
Markus Schneider-Pargmann (TI) <msp@baylibre.com>

