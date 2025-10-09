Received: from mail-il1-f225.google.com (mail-il1-f225.google.com [209.85.166.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AFB27FD5D
	for <linux-remoteproc@vger.kernel.org>; Thu,  9 Oct 2025 21:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760044834; cv=none; b=jhUxCGQ0TS03yBCcZe0ms1numDeZJj8hObvZvqZgTlyLIJxNkIgmtTaDVci5hHQwbmX8CwAH0MoLEz8TTPsltgqOa3bYv9uwjku8UXA21Ehvv+zL8Aczp9lQUtFmH4buYTn2ReRrN2AvMDaRSytSoVWJUCzHhnJcTUOh2thEHes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760044834; c=relaxed/simple;
	bh=ZhL87hWPCqJqUdWzKetD/aJArXJ8FhDY4s+4hHC081k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PigJnL9iqmLgPtP+yHrDesvNhzGNFc/oZxR2x42QgeRyg8AprlR4KdASlZDnbdKa3QeuWjgO+TAfIAPKC1vedTjwLZm9aN75kYnEyL2N+QqY2qI4YJj1ElBgyvvfFrnL/RqUV5COU2C0hFDVAhNYn93a6rHwxoQQtq3ZTjM2EVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=C7IQ1hr1; arc=none smtp.client-ip=209.85.166.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="C7IQ1hr1"
Received: by mail-il1-f225.google.com with SMTP id e9e14a558f8ab-42d857dcf92so5566845ab.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Oct 2025 14:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760044828; x=1760649628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQrmK4OLtZ+IgNtZ8671Owl8Y5KLotbw1U+tAsx0fP8=;
        b=jUIaMsnC2dve6eJqsycYOOEa8X3lRxOVIAKJeONY4p1rkj/o04aJiwIL4GsgVL3hnp
         cO7XujopkRbQncrd4X9qt4auObfqv3dGz9es46+klth7bupxSDkFjiJXaM7zAHeuknx3
         MWsXRomwr4Al4GV9piDok3FeTol3jGHjJVKi+Im4zj/BswgF7SCPB27M7pc3foZE0ueH
         lDtTDM0frZ+A9dv79eY8RCnmftuv3d0qoQ0KQJJkG16lOmY5Kd6G5irejIXbfV3wI/6d
         UYAETbuPIAK2Opl2HcY1rb6PKp3O8f2dhVM1gRkH7Lxt7pK5zUY3VB12AJF1h34eSy+N
         WDLw==
X-Forwarded-Encrypted: i=1; AJvYcCU/wkKbq+1JFRaf2CsJ518MURm+y6kQ1bBwdkrzGNrdBXVPRfV3GQ0mpfOFllZWEqsLGUu+ZKGY8yWVPctTP2i3@vger.kernel.org
X-Gm-Message-State: AOJu0YyUm1KXkbERHu7sk2lyPzjpz1AFNhv9lpDxrbLVisqmLy7W8CwR
	pZajezy1jhA41XqybnRnAkQp8RVbPXFFoMO128w2ze6pTV6mF6RNoYY9dkYbIf6uOMGA6jUOvzl
	36qMXD7rEP2q07qq0pHS49HM3drP1aTHasERA37vvwm29zg6PvsLMv3iwI+iLk+H2wSgGV1zCn6
	RPjp9tZw7ee0YZ9pUs4YCf85T7HUW6lQNpUDABIA4OvoiXcJvwgpGL4foVK6OBc2HttjEKPVcGU
	bLk52CACNW4PFyuvN2XDQ==
X-Gm-Gg: ASbGnct9XN8AjABvtpPLnhiIqvBnc31Z6q0y/aOX4I3qqqbnOec1sC3omZucTklomjy
	rlCbCnLrjOz9hQHsVPcvKjzZffvnp9OC2m262oRJpmSNuK6iwU3zM/AjEzmzTkB372aW6SSuSVi
	Ehh0adPHJkiJRWJfgAEss70Y9aHlZDfTzD9SLVHfk+KX30LJGN1LOhjgj+Nbl500DuJmIO8kkQT
	OOaZViMHfDQLTt6RA2RrXH2Lzk9efOpdzkHsr8CYX7kDT1/9Mh1HVpFxi6KLr+xWWZDbsVpfAqT
	f4Az+kwyuShEE5nOyOphcKFR3lai3UKrv2VbpPDd/AvNwrW768qC0Lv1M8OS4lERhWA2U3WqAx+
	pLspTcmpMOiEJh4pXgOYuJwnxeqFvLFyhQUOD/nmjxzZJFzPIeKN+LfMNqD+BmNLOvvfAeQjtj6
	ixbg==
X-Google-Smtp-Source: AGHT+IGSutO6Oz8l5rHoqDZpO/kfu3b3TPe5a/BImdnqWGzxG/TGpUEd+x5IrpfxnHFH9zdyNAQgCNHsMRn4
X-Received: by 2002:a05:6e02:1c2e:b0:42d:86a7:164f with SMTP id e9e14a558f8ab-42f8737587emr83568645ab.11.1760044827779;
        Thu, 09 Oct 2025 14:20:27 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-58f726e3a8dsm39930173.45.2025.10.09.14.20.27
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Oct 2025 14:20:27 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-85a0492b5feso729228685a.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Oct 2025 14:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1760044827; x=1760649627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PQrmK4OLtZ+IgNtZ8671Owl8Y5KLotbw1U+tAsx0fP8=;
        b=C7IQ1hr16fabfBwl+LqkiTFxvCwn5fwb7V9rpS6CR7cw7+6fmS/9xO4IaxiuldEPS1
         x2GpL/+adxI5X11U8/4TJqj3Kt24OVJd5IfSiVaaTful2UP+fPjTcK544B9JtNFkFSP3
         DQwgwwe1pez5eCDm9uE6I8jKhw8+SwgoX8BbE=
X-Forwarded-Encrypted: i=1; AJvYcCWjJ/5ceCjG3qZCSaikp+pyVUmEAB2wGyopaiDwh/vs7kCA+lRMFcuPoiMCAyV6egLXZVWAPzkUe4Ii0mu51P2Y@vger.kernel.org
X-Received: by 2002:a05:620a:4492:b0:865:cacf:e133 with SMTP id af79cd13be357-8835104c86bmr1139486685a.36.1760044826817;
        Thu, 09 Oct 2025 14:20:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4492:b0:865:cacf:e133 with SMTP id af79cd13be357-8835104c86bmr1139483785a.36.1760044826325;
        Thu, 09 Oct 2025 14:20:26 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8849f9ae428sm274832685a.16.2025.10.09.14.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 14:20:25 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: peng.fan@oss.nxp.com,
	andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v3 0/3] Adding brcmstb-hwspinlock support
Date: Thu,  9 Oct 2025 17:20:00 -0400
Message-Id: <20251009212003.2714447-1-kamal.dasu@broadcom.com>
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
all brcmstb SoCs that have the same hardware semaphore registers
hence platform driver compatible uses:
	  '.compatible = "brcm,brcmstb-hwspinlock"'

The patch has been tested to work as builtin as well as a module.

v3 changes:
Added detailed explantion in the all commit messages as per review
comments
 - Added  description of 'sundry' ip block that the hardware semaphore
   belongs to
 - Added reasoning for using '.compatible = "brcm,brcmstb-hwspinlock"

v2 changes:
Adressed following review comments:
 - fixed ordering of obj brcmstb_hwspinlock.o in Makefile 
 - fixed ordering of 'config HWSPINLOCK_BRCMSTB' block in Kconfig
 - Renamed BRCMSTB_MAX_SEMAPHORES to BRCMSTB_NUM_SEMAPHORES
 - Removed unnecessary platfrom_set_drvdata(pdev, bank);

Also addressing duplicate PATCH 1/3 sent in error as part of v1 change.

v1 changes:
based on fixes made to Initial patch :
url:    https://github.com/intel-lab-lkp/linux/commits/Kamal-Dasu/dt-bindings-brcmstb-hwspinlock-support-for-hwspinlock/20250712-034624
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250711154221.928164-4-kamal.dasu%40broadcom.com
patch subject: [PATCH 2/4] hwspinlock: brcmstb hardware semaphore support

All the review comments and build warning have been fixed.

Kamal Dasu (3):
  dt-bindings: hwlock:  Adding brcmstb-hwspinlock support
  hwspinlock: brcmstb hardware semaphore support
  MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver

 .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 36 +++++++
 MAINTAINERS                                   |  8 ++
 drivers/hwspinlock/Kconfig                    | 11 ++-
 drivers/hwspinlock/Makefile                   |  1 +
 drivers/hwspinlock/brcmstb_hwspinlock.c       | 96 +++++++++++++++++++
 5 files changed, 151 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
 create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c

-- 
2.34.1

