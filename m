Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1CD2765C4
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 22:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771970657; cv=none; b=KGMhvEEkAkN+aIrylS6layg8gdVRaEYSGoQ5/T0I5YSeyJlNNyAdeiSE3AaU8GhnTHwEaKrJRQB7rT17gQuf9A6y51r4SQd5kTVlOVU5vv8X6LMzYIdIVCAay1ZU22LHoUN9QuOpmRvR5ESiKklcsqJc1FWzSbBYTinmCrneygo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771970657; c=relaxed/simple;
	bh=mbwRB4ZGvL4g1BgK0BDf89bAQ8LmFkBZL5/b0mRW7iA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l/FsXNJnJSyOy3Ul8t9WgFaS0nEPBVUY9o9pWeinL5D36dAT3+mY67EAEQW7SRjBeeJbTP7vmeXaiAB0m73AeayU4lA0gEouvQba0KS41EMu5bfDUdKyzoQ3zBGJy5wxi9KiS2S8k7yDXdAZvM1zLlSnW5rKUqujJSlkfAkv/ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=VsUznEyF; arc=none smtp.client-ip=209.85.214.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="VsUznEyF"
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2adbd435864so2352915ad.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 14:04:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771970656; x=1772575456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7wTU2wqO3eKHYFN8DRzgtidY91chf6u6I995CUEKtM=;
        b=CqJw8xJDI4foT12VnkyZTSSDWvUy6XT1qi2vlnwm7L29YJ2J+GaCv4+F6aL0SCxTux
         nYI1+brRTSRhSf+w1Ks87PHXwKnFozq7cbzWzuwPssev9yNUKaZYSld2zScAjfMgdFOY
         BVg6moIABpIFcnQeNKCYXhvVScJ0V7ivw8PJ3wlGRm9fdr/HhAvrtZkBlrAcMEeomh9w
         YrY8duNwC04MWpAgAPjQlQzdiq/78W8J/Yfk8P87LJzdeC6vWbhabS5CcsZwBnCyJ7Zi
         UXBcSMk72bU8O68ssGNOvUcR4xfEH4LdqoBqXUpx36kpPjDUk2aIZ7hTW59ltlemSRlu
         I5Dw==
X-Forwarded-Encrypted: i=1; AJvYcCX8vBz9HcER50YQD8MB/D/lFY2Gk76Qqi/KQ0aQQ6/XAcsm/AlhQfa4Dio8kMc3+mMeteuPmqmXw0ZRnT+ycIDf@vger.kernel.org
X-Gm-Message-State: AOJu0YzYjl2bpxt/HEromoZxyhIliAFBF2TSVkYOUNIMjsVEF+VOdK3q
	5hkh6rL9Jsk88gui6w6ZlWQQVVZnIf6mAWQrFGu3hQC3OIROLW+FqGCvFr09oSD749BosHrga0T
	zwsPQIvkv6GktTr5rZ4BoHaCvRrhZpXwT5+hBN4W//pJtkQPVUfAeDr+DihCe6DOyhddYY/dkb7
	ijMe5nvQ6WXTyRf+SHRbvL3GtuBehz6Mb/ewZCdl/NO66hUIJRst/kpsQM7w+WUz9FM69wwaBUX
	YzOE45RlZnLx2U576m5zA==
X-Gm-Gg: ATEYQzwbp0UzEtbOUJqZvppISBzGPCvnh5nVE5LWiZghmzNabkom23umdI3x5LMMTO0
	14y5K3LfoJjPqEiJA/9DAWePSsuXIEKyowPX6bsdfkcYpddkGeX6XBm1D+RZePCccK/ova9rNd7
	8tLvShdT6PjAmkCGTGN1Z5qLkxaP9rqOOdyDwxAICE4VvyRuUrCb2phfr+bnwob035k+R8ttPRB
	uWew/iLX/PFqpNehNGI8OwW3rCcyCDMoA/PTlQ5fsmDf5y2Uuqbtr/dNlBdIcrkkRzRHTSmm1k9
	IcqL9rxCtfQXhlpCoXEBxJq6/WaTVaMsi6Oy0OD1OR7r7ooJMXGjHj9ZHBP8tZdxjBONYj9s5ud
	CbTKBsF2RgIgjZ1kmVs+fcCWqcVMRtYc0KD2Eprch5Zp+rXq1aBo+Kif9o8LV07LDDw0Tpz/HWY
	67B0moZPlE9LrieYnuRlN2dHTY20NLbJC62ksFo2Vve93oumMwhr7rvQ==
X-Received: by 2002:a17:903:38c3:b0:2aa:d5b1:1954 with SMTP id d9443c01a7336-2ad74460576mr121759115ad.16.1771970655866;
        Tue, 24 Feb 2026 14:04:15 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-95.dlp.protect.broadcom.com. [144.49.247.95])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2adba0441f4sm1588025ad.33.2026.02.24.14.04.15
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Feb 2026 14:04:15 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bd9586c512so381527eec.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 14:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771970654; x=1772575454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/7wTU2wqO3eKHYFN8DRzgtidY91chf6u6I995CUEKtM=;
        b=VsUznEyFEW3/uiZMAGgCnLmPQNcFcIPyXBBvOhT3eBn2xKK2JBIeMTSydkX2ZpxGaU
         5i+WGFa2p2DPdFhrAtNaMuCSMRwr582aNKLbd5tPWCfPDJH+WeIvT8wcfr9N20q5doLK
         wNJ26mS4iENkPOdZTDf9ZMRGEOyUklod04sKw=
X-Forwarded-Encrypted: i=1; AJvYcCXEJikJi4P/KYeajNFiJD9yNyo8tDgfHZ51k0MKecMl500fbvxKNQ9tKZC3U3d6nwo2Mqmsorh3zgXYYz9rO6XT@vger.kernel.org
X-Received: by 2002:a05:7300:bc0e:b0:2ba:8f47:fe4f with SMTP id 5a478bee46e88-2bd7bd24d3dmr6232096eec.18.1771970654355;
        Tue, 24 Feb 2026 14:04:14 -0800 (PST)
X-Received: by 2002:a05:7300:bc0e:b0:2ba:8f47:fe4f with SMTP id 5a478bee46e88-2bd7bd24d3dmr6232074eec.18.1771970653607;
        Tue, 24 Feb 2026 14:04:13 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdb055507bsm2374822eec.0.2026.02.24.14.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 14:04:13 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: baolin.wang@linux.alibaba.com,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v6 0/3] Adding brcmstb-hwspinlock support
Date: Tue, 24 Feb 2026 17:04:04 -0500
Message-Id: <20260224220407.2351692-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This is a standalone patch for the hardware semaphore feature for
all brcmstb SoCs that have the same hardware semaphore registers.

The semaphore registers belong to the sundry hardware block. The
node describes only the semaphore register range carved out of the
larger sundry block address space.

The compatible string uses "brcm,bcm7038-sun-top-ctrl-semaphore"
based on the BCM7038 SoC where the semaphore registers were first
introduced in settop chips.

The patch has been tested to work as builtin as well as a module.

v6 changes:
Addressed review comments from Krzysztof Kozlowski:
 - Renamed DT binding YAML file from "brcm,brcmstb-hwspinlock.yaml"
   to "brcm,bcm7038-sun-top-ctrl-semaphore.yaml" to match the
   compatible string
 - Updated $id in the YAML to match the new filename
 - Updated MAINTAINERS F: entry to match the new filename

v5 changes:
Addressed review comments from Krzysztof Kozlowski:
 - Changed compatible to "brcm,bcm7038-sun-top-ctrl-semaphore"
   using the SoC where the semaphore hardware was first introduced,
   following the brcm,bcm7038-l1-intc convention

v4 changes:
Addressed review comments from Krzysztof Kozlowski and Rob Herring:
 - Renamed compatible from "brcm,brcmstb-hwspinlock" to
   "brcm,brcmstb-sun-top-ctrl-semaphore" to use the hardware name
 - Added description block to the DT binding YAML explaining what
   the semaphore registers are and their relationship to the sundry
   block
 - Fixed typo in Kconfig "Setttop" -> "Settop"
 - Fixed email typo in MODULE_AUTHOR

v3 changes:
Added detailed explanation in the all commit messages as per review
comments
 - Added description of 'sundry' ip block that the hardware semaphore
   belongs to
 - Added reasoning for using common compatible string

v2 changes:
Addressed following review comments:
 - fixed ordering of obj brcmstb_hwspinlock.o in Makefile
 - fixed ordering of 'config HWSPINLOCK_BRCMSTB' block in Kconfig
 - Renamed BRCMSTB_MAX_SEMAPHORES to BRCMSTB_NUM_SEMAPHORES
 - Removed unnecessary platform_set_drvdata(pdev, bank);

Also addressing duplicate PATCH 1/3 sent in error as part of v1 change.

v1 changes:
based on fixes made to Initial patch:
Link: https://github.com/intel-lab-lkp/linux/commits/
  Kamal-Dasu/dt-bindings-brcmstb-hwspinlock-support-
  for-hwspinlock/20250712-034624
Link: https://lore.kernel.org/r/20250711154221.928164-
  4-kamal.dasu%40broadcom.com
  [PATCH 2/4] hwspinlock: brcmstb hardware semaphore support

All the review comments and build warning have been fixed.

Kamal Dasu (3):
  dt-bindings: hwlock: Adding brcmstb-hwspinlock support
  hwspinlock: brcmstb hardware semaphore support
  MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver

 .../brcm,bcm7038-sun-top-ctrl-semaphore.yaml  | 45 +++++++++
 MAINTAINERS                                   |  8 ++
 drivers/hwspinlock/Kconfig                    | 11 ++-
 drivers/hwspinlock/Makefile                   |  1 +
 drivers/hwspinlock/brcmstb_hwspinlock.c       | 96 +++++++++++++++++++
 5 files changed, 160 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml
 create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c

-- 
2.34.1

