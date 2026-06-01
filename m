Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876FF345CD8
	for <linux-remoteproc@vger.kernel.org>; Mon,  1 Jun 2026 08:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303620; cv=none; b=NmzOV9VkDrkk066xZxvLWBz3Yls7+8qg31nV3gvImCp2s+teHDUrNwmm7rqxLmV+XfE0BTX1XnmwQqxzQv6bobiG8F+uACxl11qwdk51pdcc7fCctEk1HQkcEGfndmLCFxUmYr6vzdGZKi0ZNjukilTJYeyHnQ0DmMa0w2IVm3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303620; c=relaxed/simple;
	bh=1qlcY0y259xbjnWTloWIWPE3d0CRfH7ESQKQ/1nYZ34=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l2mrZ53dDu2g/CC8WCLiW7sxiQ8iEXdo3RYxBfULqc0wpcCnBkbie6AS2PjQniZXBDwEHSU80HOPa8yZvNuV7YbVqapNCvr2GKf6UCQIRacQjvQKAP627rp6soLT8RCXBJYZgHSBQ+WlE6tey2bvSvoMD9bzFdoDWpguU76ksLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XydUxsF+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XydUxsF+"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45efa80e0afso1204017f8f.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Jun 2026 01:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780303615; x=1780908415; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CYbLJTcyGkPOWhCnzFzJEc5YHySHwwwqyvZml3ki+0w=;
        b=XydUxsF+qi1oNPzgHbYnAmA1E2kcHCT7WyDidfbKj6z1+iCDWtDxA8KRpbSwOpckJK
         2RZ8W8CbIRKinPAqx+tawgxAYu8rlnFajiB4jntHF2gq/o/x8gfHpxdeHBBmIV8d5dCv
         b1Kx2L1DRftOV5X/xNEh55t+cpz047KGiqCRLx0DIpVIDeRK6VatSJ/HTZGfD9GJd0j6
         gv1YMFmbVL6G838fubqrTlMA8VqoEge4Yal+AP2dJ/brl+88fmDyYk0j45pdAuX36yAa
         h2cymaZSpJtISPbfXUXTLCJ037KLgeESeahUVJ+1tJRtVdN4cUimzbj1A4ZNytsXJ1nn
         0Z/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303615; x=1780908415;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYbLJTcyGkPOWhCnzFzJEc5YHySHwwwqyvZml3ki+0w=;
        b=j2PWtI4J32XxeuKBPAxKSEWqPBvxU8EPUYGRQxNd23cHJXQNrJmwiUjbLVxMk091eV
         Soj+WkwJpHvSIdgjIZ7kayh0WcS/pHZeod1phPgF8nhGIcSePts5OfBDrUh3TvOes+M/
         HGWZCh5d+jexMfdrF+f+6lU8f8AKnCrleh7wPifMh4yG4DAc4AtcR48SQKyZV44xe39S
         um7i6VyakVJaN1+XItLeb16qUh8QbXTbfbH5/My01VNfycfZFJOSNOC5MnmaFrCv1f80
         uQgHW7v0nZ6vj2XoDrBelTwtPpg98I6BlwTGJaGBMrxul27ut3NUuJ4piwEEoWjmGX/c
         0R4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+rEp7Zol3DG7aBabyP6pmNS1tSFtT0faSO4wOYq3f2q4CEjp99Lp/k1sOJ/hLAwWmPZE4nZOxCZzN5km/HKYbj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8vmK0sdObv2NMrZimfVvoC+VQM/T+piClAVXPd3fVjcfOXARN
	/UtBR7VW6b5jBVeXfYIRJOL5AUSAI6weVb6LObivxVOkEkbRMkcPdyQpC+WU4seaytk=
X-Gm-Gg: Acq92OHF3i22xD8t5qGHl3kWXjVqYGiZWcosj380OpgSyZQX5OBDiFjfJMLZqkt6DFJ
	aV+r5YYPUh+aAws2aU+Vr1nSZ/XiUyK1E953ZMj/P6nR+jYcLTyZ9hSF1/bX37tjS37qODh/xc1
	XxIT5C5ouGHKjHElUsLKuqZfPK5ezYdp3+VuQxwJ29PhfLdOj0SO+84o2SsmLhOzNPG5DubA4Ii
	7V3NEgQz1QAm/CSOxgynxpk8TwgSHm1TzzwPZOH4/5hGoJv4H3pZEfIHhnu/Rn3s5ZigwY7N9Yq
	w7b4vYyGdu+qnmqi+9zNIaM3AotATDrd+bi2W8BWXPz+2v0OdjU6dz8wmgki/jIPq5GUc3EFO0p
	dNCRQoj/lE5pNp3orgLta+dWTtfSzxpuKsAUL8xY/+tXUvt2o6xMZSFjwCgltxv/HcqeYr/CsJ4
	xxjMZt6+m0dOUwuWXl1nwIgcUpMedL3rk=
X-Received: by 2002:a05:6000:41ee:b0:460:1301:dec3 with SMTP id ffacd0b85a97d-4601311220dmr3151152f8f.3.1780303614676;
        Mon, 01 Jun 2026 01:46:54 -0700 (PDT)
Received: from localhost ([2001:4091:a246:8595:a745:3210:d732:4094])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef3587072sm24459222f8f.34.2026.06.01.01.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:46:54 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: [PATCH v5 0/5] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
Date: Mon, 01 Jun 2026 10:46:11 +0200
Message-Id: <20260601-topic-am62a-ioddr-dt-v6-19-v5-0-3856a023aff2@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANNGHWoC/33NQY4CIRCF4asY1tYEChpaV97DuICCHitRMXSHa
 EzffdBZjJmYXv5v8b2HGFPhNIrt6iFKqjxyvrTo1itBR3/5TsCxtUCJVqKSMOUrE/izRQ+cYyw
 QJ6gW1AZk9M4plL2KTjTgWtLAtxe+P7Q+8jjlcn99VfVcf1kt9RJbFUhQOCSHIRgZcRf8/cShp
 C/KZ/GUK75pChc1bJp2FBylRLbrP2j6XesXNd00Mso4TQE16Q+a+dMMbhY107SB0EXryXWa/mn
 zPP8A5wqo57EBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3394; i=msp@baylibre.com;
 h=from:subject:message-id; bh=1qlcY0y259xbjnWTloWIWPE3d0CRfH7ESQKQ/1nYZ34=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixZt+vbzRnXtSc+7J+a+vDBi13nb/e5LTSSVTvivGyHX
 DbTuuXnOkpZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAisrMY/scXB31vnJoa8+nw
 0q/cP0Q/cewL9+x6aZDA5O83N3dn4xVGhu+3iryLH6mY826yWlPUdnWPnPr6+QejpsUtSMsONiw
 0ZQIA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Hi,

Split the firmware memory region in more specific parts so it is better
described where which information is stored. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data and resume from RAM.

The bindings are already applied. The remaining patches use the new
layout for the platforms that are capable to support IO+DDR. For IO+DDR
the new layout is necessary as it defines the location of the LPM
metadata.

Additionally the two important devicetree nodes for resuming from IO+DDR
have the bootph-pre-ram flag added as this data needs to be read before
the RAM is in use.

The changes in this series were suggested as part of the IO+DDR u-boot series:
  https://lore.kernel.org/r/814c211f-a9eb-4311-bb84-165b1a69755f@ti.com

Best
Markus

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
Changes in v5:
- Move all changes into k3-am62a/p-ti-ipc-firmware.dtsi
- Dropped the patch that adds bootph-pre-ram to k3-am62a stuff as it is
  already present in k3-am62d2-evm.dts and got moved into the
  firmware.dtsi file which covers am62a as well then.
- Link to v4: https://lore.kernel.org/r/20260429-topic-am62a-ioddr-dt-v6-19-v4-0-fc27d6ac753c@baylibre.com

Changes in v4:
- Rebased to v7.1-rc1
- Dropped all already applied patches that are the bindings and the
  initial introduction of memory-region-names
- Link to v3: https://lore.kernel.org/r/20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com

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
Markus Schneider-Pargmann (TI) (5):
      arm64: dts: ti: k3-am62a-ti-ipc-firmware: Move wkup reserved memory
      arm64: dts: ti: k3-am62p-ti-ipc-firmware: Move wkup reserved memory
      arm64: dts: ti: k3-am62a-ti-ipc-firmware: Split r5f memory region
      arm64: dts: ti: k3-am62p-ti-ipc-firmware: Split r5f memory region
      arm64: dts: ti: k3-am62p-ti-ipc-firmware: Add r5f nodes to pre-ram bootphase

 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi   | 12 ------
 .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      | 48 +++++++++++++++++++++-
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            | 12 ------
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts           | 17 --------
 .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      | 48 +++++++++++++++++++++-
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            | 12 ------
 6 files changed, 92 insertions(+), 57 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7

Best regards,
-- 
Markus Schneider-Pargmann (TI) <msp@baylibre.com>

