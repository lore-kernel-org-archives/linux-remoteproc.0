Received: from mail-vs1-f100.google.com (mail-vs1-f100.google.com [209.85.217.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AD02FD68B
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Apr 2026 20:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777320765; cv=none; b=of13whDafvMbX04Shaa4B3oxIflntwftkG4BeY83lsFFm+kyGuDW7mdA39cA0hY8lc5zfI5Hn6gTxX24odXI3BSxcLUJOQrtCk1G+FRwU4PSLxGEUFA3k71+zP+hSrEeQoNTLReripq6FcsSw4SACRaOY21XUbC1Wi0KyQgwNeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777320765; c=relaxed/simple;
	bh=i71Bp36ualB1scUtZbDN1BlrOJCB/iUmDohv4h35vFM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Xt+RCcq4hW/NmLFkINVFxJV/G9tyIO+wVLR+Wck0rdb9GeCI3OxTVOi+uXU/F9oYDDDaEDUSvU1wPH69dqzOqrzXi/Rntb30lwzu44SGV0uFhU1Yz2h9vdGv6VK4krJIunM4nBlfJWpHG1wiRweHPdKpoayoCA6P6HczHfIG9cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=O6C9Orh/; arc=none smtp.client-ip=209.85.217.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="O6C9Orh/"
Received: by mail-vs1-f100.google.com with SMTP id ada2fe7eead31-610f4cf6ddcso8135941137.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Apr 2026 13:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777320763; x=1777925563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X88UXqkPXIfmwYlICLDKaIiVceuFJijGDlq2QP6KUmc=;
        b=lEpC7Jn30AX0XkpGxwrxnxMHAktP54Uv30cT4+fp/9RO01Iy5oQuv/qt2OEZvO4HTE
         2c/RR4G9MeYdPBJTbDRolTsiqvRw43EPhxJoa3Wq2SljQOLgh7jogMxbnwdWD+Kx3xur
         tv3Q6KFhhHkaD6nTaJIfGWcxqDRO0x2UP66kndB9KGdT+WWCC5yqYRJbuWB0Q8ZffSVK
         ETtBM9GSuOASIPo2gLCLUsM8GqB5/oHiW/+l+gRZ9V+EtC3LfWwI1ymoa6vd0UI4Uop0
         IYGsdkbPUn15KtHDyzS4aeXKSQexeeglUJrp5yr7oYd6tdUiKJkhtsWfrxDfWOYwiYNY
         d1TQ==
X-Forwarded-Encrypted: i=1; AFNElJ+aMck1tKuFU7aYz3h8J8GR97cW4W9CPwbf+NQm5IGILWzw0pxpQihrkhyEZ82IZh1z0dap7LFByr4umCkIw9N5@vger.kernel.org
X-Gm-Message-State: AOJu0YyK+bNUP0PlZTShgRgJoUJ7AWKkqtGsUNe9jqu+upnneqRh8C/j
	Jtyx0yhHLj5E4JZE8dWDusF/NTW1rHEIY0M27cA34p6Q+GekfIp3OiLb9UGhCa3kF4kw6O8dG4D
	A/YFNc/duB9keb3Gi8TxhbagAlC+4agVppOndPiUlLRl+iqSWPnaoDA94VcbTOzLfC/T05YgDSQ
	dTwIhpQ1fpBsA5V+xMoJW/+0qqtj3VS9zSZaRz/QhTrHBbjnkLYhNp7EL1NDB4yvFck0x42K1NN
	ZQeAsf/fVbPEK2Umcrsmw==
X-Gm-Gg: AeBDietmhXNVt01NDxtBNSZfk8DFWIG6DfznuYK2kftdX2CbYBDYii3igyCKMcCPH8T
	vf394U3AimpOsPfCBUdgautnrJZbvOM/Z9BvQ3FY1y2PFYduaybIXptODI+nS3nKJjzDWeQjaY/
	Sqgl1KOSpUzEZ9FdtY7CezyKm8hlqa2DZhVKssjN+SzaGEW01nd5lSL9cGOlycBP6NgKq+HWXF5
	MHEwclMnEtGBgnckwG6YY58PXFdlQ6ySWFvzzTchSgyQJhd9219Y+MFvybLZhDbnV2N67pYGAMt
	rvBJr1JrQ2VnWP1mlwt1qC0z6JrRqag15ugCdLuyzn9mcoEAtwnOaBDTNQGJSsgsAQIkXchSJKy
	TJerTidOvNSfOwwtz0jgO5Cl0g2xfb4SV/BQdAhpwr7WcV/XE+cLq0I2d6+tRf/T54zdPqXVVs7
	HLH/vzUZ88nyx4
X-Received: by 2002:a05:6102:f83:b0:5fd:eacf:27df with SMTP id ada2fe7eead31-6280720b3f6mr57083137.10.1777320763250;
        Mon, 27 Apr 2026 13:12:43 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-627f7c32f12sm13051137.18.2026.04.27.13.12.42
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Apr 2026 13:12:43 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bda35eab74so9540536eec.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Apr 2026 13:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1777320762; x=1777925562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X88UXqkPXIfmwYlICLDKaIiVceuFJijGDlq2QP6KUmc=;
        b=O6C9Orh/8U6Z9ADbc7/3mzc+hxoKaz8GdIKsyxWiMnmG35YoWHG9vqmA55U02muNHT
         fXNgA/PCiS3hgIL9J2mhJ2mgUb1Wn1qy019nwcnoIvtaMUYsLgmInnNYfF3DC8a5y7I3
         huxq5QUeDxPCw9sim/xc9/UKoqHgRGCfmszu4=
X-Forwarded-Encrypted: i=1; AFNElJ9V903nk2ek0dRapQVdRuBD0PD6bG3rhjoOZ7Cj+oU3SBAa8RLHG09/pGgXAZlHL1XoY47DzeJVjN6Gbapw+hQc@vger.kernel.org
X-Received: by 2002:a05:7300:7fa2:b0:2d1:9b35:4edb with SMTP id 5a478bee46e88-2ed0a5a2ddfmr107170eec.0.1777320761881;
        Mon, 27 Apr 2026 13:12:41 -0700 (PDT)
X-Received: by 2002:a05:7300:7fa2:b0:2d1:9b35:4edb with SMTP id 5a478bee46e88-2ed0a5a2ddfmr107159eec.0.1777320761283;
        Mon, 27 Apr 2026 13:12:41 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed09fb6b7fsm437136eec.10.2026.04.27.13.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 13:12:40 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org
Cc: krzysztof.kozlowski@linaro.org,
	conor+dt@kernel.org,
	baolin.wang@linux.alibaba.com,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v7 0/3] Adding brcmstb-hwspinlock support
Date: Mon, 27 Apr 2026 16:12:30 -0400
Message-Id: <20260427201233.380314-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This series adds hardware semaphore support for Broadcom set-top SoCs
via the generic hwspinlock framework.

The semaphore registers live in the sundry block; the DT binding
describes only the semaphore register range. The compatible is
brcm,bcm7038-sun-top-ctrl-semaphore (BCM7038 is where this block first
appeared on set-top chips).

The driver has been tested built-in and as a module.

v7 changes :
 - Rebase: Whole series rebased onto Linux 7.1-rc1 (254f49634ee1) so it
   applies cleanly on current upstream.
 - Reviewed-by tag (PATCH 1/3, dt-bindings): Krzysztof Kozlowski's

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
Link: https://github.com/intel-lab-lkp/linux/commits/Kamal-Dasu/dt-bindings-brcmstb-hwspinlock-support-for-hwspinlock/20250712-034624
Link: https://lore.kernel.org/r/20250711154221.928164-4-kamal.dasu%40broadcom.com
  [PATCH 2/4] hwspinlock: brcmstb hardware semaphore support

All the review comments and build warning have been fixed.

Kamal Dasu (3):
  dt-bindings: hwlock: Adding brcmstb-hwspinlock support
  hwspinlock: brcmstb hardware semaphore support
  MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver

 .../brcm,bcm7038-sun-top-ctrl-semaphore.yaml  | 44 +++++++++
 MAINTAINERS                                   |  8 ++
 drivers/hwspinlock/Kconfig                    | 10 ++
 drivers/hwspinlock/Makefile                   |  1 +
 drivers/hwspinlock/brcmstb_hwspinlock.c       | 96 +++++++++++++++++++
 5 files changed, 159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,bcm7038-sun-top-ctrl-semaphore.yaml
 create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c

-- 
2.34.1

