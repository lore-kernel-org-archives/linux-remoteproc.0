Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD98D3C3420
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 13:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468976; cv=none; b=tT/HTIoTWtjrDcMmEDv40tLoj1d8ZSMytKsVJDuMm96ilXTVVNZMV19j3wBMxcGcaxISIObcpFwK4C79jZ2KUvWGDzAnQkck9qy8i9eTox3swI8Tzuf9fzvpc1k1m7GVt7Z+dNhYcKvIXtfix7VjZPJ4j32o+bZFsxoisJ8wJK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468976; c=relaxed/simple;
	bh=+7e0qQOb7xNJ1GonbhJehRvqndv8OQWX5XWwzpXYTbA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bSFFs+ab9bwHxdP3fRvHhfIhCM9N9yVwGO60ZTz7S/057UUsLhH/Pdqvi9miJ3jTBa6Z96BNzx3RdcUMEi9j/51nbJNBdETx8mAAH/7GNufTo2Dh5cqxCwVu3brBIe0DyLjAjyiCaf1Se3pleqgroLzN9tLh76rJU/n5d4TtImE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=KvJEawRJ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="KvJEawRJ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso96370645e9.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2026 06:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777468971; x=1778073771; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1qz1XwK5bgbF4fSDLGldtnnQW+IDkK0wUVzSv05ZMs8=;
        b=KvJEawRJgW4mIR9V9uTeaRKa8KZ9eoKEVmQs4P6QvxcluhAFyDI5OBnwLdW6zlrXxF
         2vFgkTWZHUd1I5+4ZAPPOp9N9oIprNwC7MNQzHaQ9FU7DynV8kx6v6weywB5j5unPy4U
         DPUDH8AkiwM9zhjx7nSw0/clrLtxDqH7L+0OLaAIPQViRSYCHadEkTB/IJbTUXyow97C
         YXY1gwWFcjSuQTmoPP54Kvh2xzzzH7oIcSbOhiNVY5wyFl+iJ0acZA/RDK9INlBAL1Xi
         dpdL+oig1seFYGzWLv9JJplqVirT3F7C9X4PAhgbQPFpRFPjtDqXLNyqemMvp2RLfonl
         WCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468971; x=1778073771;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qz1XwK5bgbF4fSDLGldtnnQW+IDkK0wUVzSv05ZMs8=;
        b=Qw8yjatUSlsiJPA+1FZ0W1TOrVyIXcGfE0OW8O/eC/BQ5xTyVqcpBxjCB5/mxF/Pys
         K+thhy8/35vcaU+rM5/wUsE+OLJceypRWQotLN4CFB3aeOQy3SzmEqp3kMChEgcm3A41
         D+SxVUjg9KZd97PDST78inZ3h1VQqpex7I6oVU8jaI9zh8IOSsNGCAtX4QRMYhxgVPzy
         FEyWwQcm9/dVSNlPSz8MgGyBWFK+LqJaJUCqIvKIcjoLqA838DApnRv6r6psjtr7iLW2
         INTrspsgojC43h42p9s0wX4JZHICt81w1WEYj3ODhzVLhO3p6Vcgq6ZcXjCq8LfxOsE2
         m59A==
X-Forwarded-Encrypted: i=1; AFNElJ9QZlOjQh+BTUXwtlg9KRR5D9X3fnoWg5m5/x8qPxs+SXDwhhHy4KBC/q3hplaZvIOX+bcLtaBqHmMWbmadHXVo@vger.kernel.org
X-Gm-Message-State: AOJu0YxwLr78nMTqzfqR9t7YRWbzPllhDOW0dJ8tSFE7d/RG+ozFfXkZ
	6xNj82A22B37vDgVZ4jiif/S1Aq8AN3/RgnWA1EzDb4hyQQVto7SxP6u8FOTq3RBZSVl8bQ+dZa
	CRaBI
X-Gm-Gg: AeBDievjzxkJSF/MbT1IsXynZn7m81ysxbVDlIHyO+qqpY1mYTTCHnVQiHeLSM2Y0M/
	ub17ZzVNyiBX8QGhB9/mA5KMy5s01OuxuSfeTCNk6qNCf1Y/Q4s5VDh38LJh3eHHJtCpI8sB8et
	oxf4jm0+BJfhfuHgr/SViPV5TKcTXFbGbaA1Ct79lQccOQmDFV66Bnm19RByCcOxiOLzBUsVHIg
	B5zw7AGQjoHj1OEd/NcXVA47t52OWYTGt/s7mFJITUX4krIwFzRzhhZDEAP8ntsb0w7sl6wGw12
	sXQcAfSDrXh3HkHnaloXXqPIYK6lTq85yyioLe1o1VkkkPi45/7aLuepNMHwnDYFIiAJxuulzqP
	+JOucYClS6GQV/hvJM/+M7cG4cVkYtLqwXUibFROjgQ9hUC7HZCnAcE0Uvy1lL5FR08bFfMpkK1
	G8qagStw/wKALaHHqJPCaIooIbvtxk8NI=
X-Received: by 2002:a05:600c:1382:b0:488:b99b:4177 with SMTP id 5b1f17b1804b1-48a77b232femr117816745e9.25.1777468971146;
        Wed, 29 Apr 2026 06:22:51 -0700 (PDT)
Received: from localhost ([2001:4090:a246:83ca:1917:a47e:1872:2063])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b91cab9sm28569085e9.2.2026.04.29.06.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:22:49 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Subject: [PATCH v4 0/4] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
Date: Wed, 29 Apr 2026 15:22:07 +0200
Message-Id: <20260429-topic-am62a-ioddr-dt-v6-19-v4-0-fc27d6ac753c@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP8F8mkC/33NQW7CMBCF4asgrzuVZ5zGKSvugVjY46GMVDByI
 guEcvcaukEIZfm/xfduZpSiMpr16maKVB01n1p0HyvDh3D6EdDU2pCl3hJamPJZGcKxpwCaUyq
 QJqg94DfYFLxHsgMmbxpwLrLXywPf7lofdJxyuT6+Kt7Xf9ZZt8RWBAtIe/EUY2cTbWK4/mos8
 sn5aO5ypScNaVGjpjnP0bMI91/DG809a8Oi5prGHXbecSTH7kWb5/kPZXoAkGMBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2643; i=msp@baylibre.com;
 h=from:subject:message-id; bh=+7e0qQOb7xNJ1GonbhJehRvqndv8OQWX5XWwzpXYTbA=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxPbMz9GtdfHPNUnsnqmedka7px/412lxsP7fne/yuo9
 LT/z6zUUcrCIMbFICumyNKZGJr2X37nseRFyzbDzGFlAhnCwMUpABO59YyR4bz7z5WGL0peNnBb
 d0hELloR7ux82G77sk1FnR71+6JTfBgZfmgn9EsvnK+a8eLlLHmDCvNP3o+THKV6W3xk9+Qd2l3
 JAwA=
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
Markus Schneider-Pargmann (TI) (4):
      arm64: dts: ti: k3-am62a7-sk: Split r5f memory region
      arm64: dts: ti: k3-am62p5-sk: Split r5f memory region
      arm64: dts: ti: k3-am62a7-sk: Add r5f nodes to pre-ram bootphase
      arm64: dts: ti: k3-am62p5-sk: Add r5f nodes to pre-ram bootphase

 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 42 +++++++++++++++++++++++++++++++--
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 42 +++++++++++++++++++++++++++++++--
 2 files changed, 80 insertions(+), 4 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260210-topic-am62a-ioddr-dt-v6-19-0da7712081d7

Best regards,
-- 
Markus Schneider-Pargmann (TI) <msp@baylibre.com>

