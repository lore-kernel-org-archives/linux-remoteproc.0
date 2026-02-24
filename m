Received: from mail-pf1-f225.google.com (mail-pf1-f225.google.com [209.85.210.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AE61A262A
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 01:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771897697; cv=none; b=eodPyEjTtPzsKyGHUn7FuIplJ0XWTZJoaYt/a1a2iQ+NTnRPW0+Fs7XTVRp1ffXRn5VMw33flrWecwssUmv0SGhDUnx+FN8zku+P0jdkCml7HCEYG3DQ9rykOgk6VVvkLBVnC54jQhUZ8cm2qdqQM37pIaDNAqLqhNqe6zTkS0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771897697; c=relaxed/simple;
	bh=Jg7M8Y27o9R+KC+um2GQHVA8k04aDMaNaY+U3ArEqR4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u6iHcrpx7rd8S8ysNGq8Rx3OFpbQQF8qG1MFy7T066Kej7+0zTu7T4eaqybydMUPRf6RTD6kiCpbj5oKlgtIMPdNEDOsb/C192zSoCB8N5cpYN1fkEeMOgqdq7smaBPOJNMmTk8c/s1ySgJngevmUZCYAE4y4Ws9ZNp8vvH+1dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=HnwDPO/K; arc=none smtp.client-ip=209.85.210.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HnwDPO/K"
Received: by mail-pf1-f225.google.com with SMTP id d2e1a72fcca58-824af5e5c81so4665489b3a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Feb 2026 17:48:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771897694; x=1772502494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3dB7+eefW5Li2eyi5u+nXkNwMUEBPNrYMz+/+fKzj8=;
        b=qBQQWjxyOqTbxsIKBbAgO2lJ3fLuFwKK2AyX61mrBZW8qRT82X/NLgRyzRbL+Tsort
         1miyMuaGzTA7hLJTUBjTCxWY7UVx3+PTqtFf5myc/UVfWNFOB7ksZqX0PjQc5LfDUWrC
         xOJkJk5/JZuTdDnpILFWnNk5BpIOyJ+3W3JeL0Ndvg50gyy609eBIzi5828QUfds1936
         G+EX91txSkVWRTPf+v0FO7F20vOfomAFjsovMJy1iWcfJV4pxv6V14g0fZgrip/IpSlN
         dutifFrS8uRobgRTf/lCXAYfeJkqDmHMkdSZ181I2agKaftrMwbfZJgpK5KOjiM0Z286
         kfTw==
X-Forwarded-Encrypted: i=1; AJvYcCUhsbLg+1k5yLoa8ez4GJ5ZML97uApGoQuXPiYZk6qEHINysB/MWzjNi3njul4B3qDpkXSkDhAdTSQN7UPyGgev@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv11xYbNQNJEWEdqG4DTqTZQUZUUG9Jnw06BtDxv7FpsY322kw
	e8cknKyvrmv5yLI4m/PvlCjYSJ+5cYNdrbvTH5fUqezErpUmwbuBvXY/1hs1Ys4FWxkj3shjUTA
	TYuaDd5ZYpFxa3pM3WuWUKW16c9CVvjXOuR3IYuOPlPkNB54LCnsInq5yGXZa64J4cQKpU2YSYK
	KhoEoze27bJ/OfgGZPATq903KEC66JNanG/WWbV7Ep+lSoEewH4s/ptXXCWlBvNqV/3Y3N+ikZP
	6HK7iO8Xnm4BZ2Ru3XVAA==
X-Gm-Gg: AZuq6aJ8gzi6RPayQOV3rsNXtGvBDoaNfOYWtO2p+qzEe9Pdg/LZ7mF6ys9evOQLVBk
	YAEujUnhyOBfLpg2MDCSaILqNLRPUPiH9zCImbcoAlc4bk2pAOwoAHm9vhp3JR74EzqYVnHqfhD
	kq4wyuOXWUB3Ib412Jy6ftRllIJguPRQywjOe2BpM500OywxxkSkrKAW8Ccs9eopn+UicVgGKu0
	IneMP/v8mhv9ifIasa5hXuNhua6cEsWjcGPCtVYYT7ZbMnwk6E1Q3KuAIVshgD1vk7ZE8rB4IA9
	Skqmx3696pxsYbUM8Wcxf4bcOSv/3LVva7stCPD3xsNBKsc2gQ5t6ZqPkBhoZ8LkPAO2oCCHAMm
	JfU9cwDaoZaL/8jt0WBXknpduAdn4tGXy4lIdBoqp3ZisO5sGbhFl4ygY0EOg3Viq+zaEt1HyqF
	6SQZwGiXxbh5WjWlcqsnQL0V2rBvLvkI38LaCzJIj/0ZttXrPgm/12CL7U
X-Received: by 2002:a05:6a00:3021:b0:81f:b159:d2ea with SMTP id d2e1a72fcca58-826da9ee902mr7448631b3a.37.1771897693821;
        Mon, 23 Feb 2026 17:48:13 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-103.dlp.protect.broadcom.com. [144.49.247.103])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-826dd640fb6sm1060283b3a.1.2026.02.23.17.48.13
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Feb 2026 17:48:13 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ba87c0e198so3783179eec.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Feb 2026 17:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771897692; x=1772502492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U3dB7+eefW5Li2eyi5u+nXkNwMUEBPNrYMz+/+fKzj8=;
        b=HnwDPO/KkXEybpu5edoXWQklvyCWHugUInEWGONB+kWxl5AEdOxAxDCeR0Y5VJ5PKW
         2OUmorLtm5kVfHg7mnUtXnfz8qP+rLi9Z3PwcxcZsvf1WQ5MAQD5QjwUPxs99yyFTGGW
         DnhQLDEFb7jhuYD2dcOGSW19bcyfOuhLsopPk=
X-Forwarded-Encrypted: i=1; AJvYcCWgN95dMhlv2vVn1uVc0xRDq1DwWYVezbG0briis9fmLqaR9/r0k1A47vw/vqBubqKhpEgyFx2PAGg3xNki/YsJ@vger.kernel.org
X-Received: by 2002:a05:7300:6915:b0:2b8:26b8:3446 with SMTP id 5a478bee46e88-2bd7bae9e1bmr3940773eec.2.1771897692000;
        Mon, 23 Feb 2026 17:48:12 -0800 (PST)
X-Received: by 2002:a05:7300:6915:b0:2b8:26b8:3446 with SMTP id 5a478bee46e88-2bd7bae9e1bmr3940763eec.2.1771897691372;
        Mon, 23 Feb 2026 17:48:11 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af102d9sm8470964c88.1.2026.02.23.17.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 17:48:11 -0800 (PST)
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
Subject: [PATCH v5 0/3] Adding brcmstb-hwspinlock support
Date: Mon, 23 Feb 2026 20:47:55 -0500
Message-Id: <20260224014758.2660318-1-kamal.dasu@broadcom.com>
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
based on the BCM7038 SoC.

The patch has been tested to work as builtin as well as a module.

v5 changes:
Addressed review comments from Krzysztof Kozlowski:
 - Changed compatible to "brcm,bcm7038-sun-top-ctrl-semaphore"
   using the SoC.


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

 .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 45 +++++++++
 MAINTAINERS                                   |  8 ++
 drivers/hwspinlock/Kconfig                    | 11 ++-
 drivers/hwspinlock/Makefile                   |  1 +
 drivers/hwspinlock/brcmstb_hwspinlock.c       | 96 +++++++++++++++++++
 5 files changed, 160 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
 create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c

-- 
2.34.1

