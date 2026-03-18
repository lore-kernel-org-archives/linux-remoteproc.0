Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43AD3E5ECB
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Mar 2026 15:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846860; cv=none; b=SpNKhPvB4P8ivxgr4aShzqh2UbpgG+MnUVFVd6STYkM/ckhE5x3UyfgIZzs8a9jbQR14D2r1LDKtCk488y3EEqBcnJI8FBTAPZGkCUlll8Lx+TYzb249FHq23v3EmJs+0aEPT6zoCF6yVfBv0XrrOZTXxtbsMmSBTf7HBvmlLig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846860; c=relaxed/simple;
	bh=O7KJbMSkvzvMpAGjjOIeIlfXCIp/PPoZz5+LKET/qs0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aNhvQFNNczXmJzbQ1WDEsFkyQNtqVN6g+LFfVJs9LbV0+VHUasC2bQJrAR/tDkyI+IeeVzgo3+kiatyazm0srTcBBX8vp9Y7Wl3kRuGLr4ZOL8rx1X9e+xDPpt3DwucbECHDZ+T+kIZ8vBwKU26BTWPUo1RvCEQcEDmdXuGoQj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gqby+B+x; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gqby+B+x"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so81546985e9.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Mar 2026 08:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773846854; x=1774451654; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/yllf7A2iKXDpzRGmszNp9+Jv/HEAfql39j2Q2qp1aI=;
        b=gqby+B+xUOo4khya6alnJLqDw7FBhoU4QKp1AraWXOP5H61jwBebtivnWfzPENTOrX
         6wsJ5OO/chpssCEFC3FkLet9nTWHLKsenhByI9xUuCzh7A/FBf+OuCEtpxzCiDBs7nYi
         ZkZcRe04JOmpqYuz3gsMTeKJrbilgvaB3T3yeqoZ/5KZzwbd/P2KDS6ta1LhK8IFwLJN
         qV/CNwYE61AdFw1fUcAfuw4QRohGiiyeLwJ0V6H8DlnSj9srabiijBdF8kdka0LFUhpO
         81SIhuJqUtZuzwtrAVZYxgyrwzI/L/h88mcDgEHFeky868x+wjiszWiez4G0vd/N/WOD
         czJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846854; x=1774451654;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yllf7A2iKXDpzRGmszNp9+Jv/HEAfql39j2Q2qp1aI=;
        b=tLxGovZjQ/Fq0UufDma0BDglYlP6fPdpXOSWycd1EdzrnJBeF3sZrLQ44didIGp8y9
         FgY9hA3rVTNH/1AjlbLBQctMBpGJ39Zks0CtNDML6SqMEOFFwVe4FS0nfZV+IGO9FGQS
         DNISEvtv6l6QbsouiNfx2M9HUoh9U1E2ehlRHfpF12xNJshZHAbQRAFdaxeLW3BCftoZ
         YkyKIslOlB061WQd18NbHFA1bocwiF9LzFC1xTpSrKPFGaJAdU+wiEQKeOylSVtgBxue
         DvQ3NkvIA+j4keUdBFUrT2hn/vngeUJPxdGWOABv0VQOvmNRoKIAMgVymvpIIYggcC89
         uQ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0c1+8T2q0NkIsP6vJHBzuGZAddlfyDJj4l8AaPeY/5q1K5n0EalRKnf/f34x5r8FmDdcVsIpJNsrdqinxZscY@vger.kernel.org
X-Gm-Message-State: AOJu0YzmMRT4ibypiHooTxhQBw1HYikIu5pOad/TLGWnxlbO3UBRN7F8
	6bOwn+1dBILuBWGmwaCGZkniyzHEn2/BCmSFNUpp+hVsfYkTvD2WpAwMdNo0ti/Sn2A=
X-Gm-Gg: ATEYQzyWAZ26yASsUDGzMabS8W/iyn+UcT602MyAQ+zZKmGDGa4qVvzrWtjEPGkoXY+
	WGjp6pFJP89OgQELQw/Yflg8EuswAeeDvF0l7ThUdmGTE/D5wd3D747U1CcUw3yNzjQ4iniCVH+
	b5VCnCHw7Fii/YzT600X60CZy9iNAGEk5FwTuVpC0ZalmCVtbaldD2THOuGbMPB8c/t43RqHkfW
	AYondBgI7YGoaFs/4QDqpe+VwFD5oQCsAb/2Q2RhukpulP7HbaXAyrrw9Iu3MWejvkToUNNb1xd
	Twt0b4s3wVLE00yQo8FfWX3bAsmwReFwSXkhmb8Xd2z/vPyssdB3o9mOX/N5VZkCTZ5y8NTv4yl
	T4xQvcFdfkyVzzmTp+F3M5E6FSU5SSvjRLX/nFw8L6enWJLUBbJEUnDLs9oV1lXrEbt5mtk/u9J
	rarh0DQJSSNiasskd7zEfe
X-Received: by 2002:a7b:cd98:0:b0:485:30d4:6b98 with SMTP id 5b1f17b1804b1-486f443c6f1mr42988885e9.15.1773846853405;
        Wed, 18 Mar 2026 08:14:13 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f45f7e96sm43046295e9.0.2026.03.18.08.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:14:12 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: [PATCH v3 0/7] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
Date: Wed, 18 Mar 2026 16:13:06 +0100
Message-Id: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAALBumkC/33Nuw4CIRCF4Vcx1I6BQUGtfA9jwWXUSdzFwIZoN
 vvustoYC8v/FN8ZRaHMVMR+MYpMlQunvoVeLkS4uv5CwLG1QIlGopIwpDsHcJ1BB5xizBAHqAb
 UDmR01iqUWxWtaMA905kfb/x4an3lMqT8fH9VNa8fVkv9j60KJCg8k0Xv1zLiwbvnjX2mVUidm
 OWKX5rCvxo2TdvgbSAKZrP90aZpegFWQFIQFQEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3689; i=msp@baylibre.com;
 h=from:subject:message-id; bh=O7KJbMSkvzvMpAGjjOIeIlfXCIp/PPoZz5+LKET/qs0=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxdB9kVur1rF5s88AqfFGHq2L//yN9zKkIhW/2lflxb0
 T5Rzda+o5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACbyIZmR4eydIIXbS4wmO+xc
 bRS6KN65RPv/mVsvAiNTPuw6Jno1RYrhf9y65om3fthpfOibv4xP/n7P/vS9+sdFO+1+7VZ+KSN
 qwAIA
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
Changes in v3:
- Squash the enforcement of the memory-region-names requirement in the
  patch adding the memory-region-names, as suggested.
- Link to v2: https://lore.kernel.org/r/20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com

Changes in v2:
- Make memory-region-names required if memory-region is present
- Fixup memory-region and memory-region-names conditions. Require either
  2 or 6 regions for memory-region and memory-region-names
- Reword and restructure the binding documentation for memory-region and
  memory-region-names
- Add memory-region-names to all uses of memory-region
- Link to v1: https://lore.kernel.org/r/20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com

---
Markus Schneider-Pargmann (TI) (7):
      dt-bindings: remoteproc: k3-r5f: Split up memory regions
      dt-bindings: remoteproc: k3-r5f: Add memory-region-names
      arm64: dts: ti: k3: Use memory-region-names for r5f
      arm64: dts: ti: k3-am62a7-sk: Split r5f memory region
      arm64: dts: ti: k3-am62p5-sk: Split r5f memory region
      arm64: dts: ti: k3-am62a7-sk: Add r5f nodes to pre-ram bootphase
      arm64: dts: ti: k3-am62p5-sk: Add r5f nodes to pre-ram bootphase

 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml       | 55 ++++++++++++++++++----
 .../arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi |  1 +
 .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      |  2 +
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            | 42 ++++++++++++++++-
 .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      |  2 +
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            | 42 ++++++++++++++++-
 .../arm64/boot/dts/ti/k3-am64-ti-ipc-firmware.dtsi |  4 ++
 .../arm64/boot/dts/ti/k3-am65-ti-ipc-firmware.dtsi |  2 +
 .../boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi      |  4 ++
 .../boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi      |  6 +++
 .../boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi     |  6 +++
 .../boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi      |  3 ++
 .../k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi   |  8 ++++
 13 files changed, 163 insertions(+), 14 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7

Best regards,
-- 
Markus Schneider-Pargmann (TI) <msp@baylibre.com>

