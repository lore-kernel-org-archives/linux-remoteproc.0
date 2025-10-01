Received: from mail-il1-f226.google.com (mail-il1-f226.google.com [209.85.166.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400B1139D1B
	for <linux-remoteproc@vger.kernel.org>; Wed,  1 Oct 2025 18:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759342644; cv=none; b=BLnnbrwlOTHTE/gj/1bQk4JPwBhpbVWPEK+d90rZjSm5gTYgqoydle4amjb0kJolw8xUFgJRx83wzlfhe2STXZCyP0lHM63Sq7q145Tnu7Qe7wP59Err8ro3cO+KX/KLQMdNUF26e44vJNIVEDeozugoQBmrcKewXbUp6AO6lUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759342644; c=relaxed/simple;
	bh=4D2u5+7Q4n316L058k0BKdEZoe/mLPgqNFtIcDxFUac=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kekjdb2ma1/Lj7joNeax1ET5J6YukYKjwWDLswdKK/cY9UX0zR0M0yNGO/4CrnUQHPUOiW7uZUHHBQHkgrKgkhTRg8ELRfv3k1HEKGFjLl8ZliFetCdE2f6qzqEGPYC9+XnyNR8Yn8fNLbEIZNM4iUQ+x4T70hklNS5iuhvANLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=V7ztuWXc; arc=none smtp.client-ip=209.85.166.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="V7ztuWXc"
Received: by mail-il1-f226.google.com with SMTP id e9e14a558f8ab-426516e0961so948015ab.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Oct 2025 11:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759342642; x=1759947442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecfc2ylaD/7+laCYwVlEzsbxMMAjlj+CWU7OhEl57sc=;
        b=gCCh1Yghuq3wekxv+V9nHzSzvnFANOn1DAf1mc9nKsJ+3tdcg4hDx2vMnmHNFNpy/1
         +Bfy1BlZC9Wd0n307h5krynjqTbGCLeoT2Dm3Y8CGSOvT2T+yfUXfsiTPzkYimgVOfHj
         cWtM46zlByC5JxGD69rv7fLX3LSb0ArtFcg52JaBloyURG0nGSNTQadywffh5Se6WpA2
         kKrTXRkmHK9RgVBDtT4HqFG6atIe5ZrKnM310IE/XnLiwHEbx7eqwffjSd6w577s7BTv
         +wcU6Ds4KTei/HZ9QGuIZXAxpbN9NjgWPKAf7VWUBxnsDFyBH9Jk3kAil0CzaiNKG4J6
         fqHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfQq1NuxYCyVyDWo/o9Z1PldvjRX9OlCjKqolcAS9KkYO6rjHdCXVO9DusCO5pHMR+8zmRhy/9MEmJKXB8uSDM@vger.kernel.org
X-Gm-Message-State: AOJu0YwkT1yZTCK9iXYtCH9wPchejyyRbdH7dc5TjjPkdEHxiJMyDnuI
	daVFMqkG9S/8OfEa9XlKPX2+tXmLcMmkXkwJPC2mtI3cajCMVLzrt1/H8evBVtA8NNiasVG+spq
	MkUCZs8qy6ZzRx7kTXSbEF8j/0uF/BMHg0Au8bnScdncnkRgA2oRmGq44Gp5tnORFQd0Zq8r6A3
	gUQp7fpHZDZUD/ChJCvEEP3SYlC8eJ6ykOhp2V6Xwi7PQJrgOjaBsioNVIOzdRpwAj5ErI7z/Jr
	BJScQwxIp9l9qRCUz9S0A==
X-Gm-Gg: ASbGncsckfd6hdbJKibMpKipIikXXEHbycAA+LgmT+Zdg/hqd1ipCZ1RgzGQGzm3uu2
	M8tuRzANE/dAal0m17tR1GTH1XVizBGIupYO+R8oFa3ZS6Qj3w4x2uj0NLX233gzFCda9va5VKE
	91jHkIsYTYT7Se7amfu8F5RBVZe8LYbng9IdNbHiZxNY7YtWUflp/R+KOnUQrFdGEOfkeFE8Hwm
	zrURhAPswt/IBU+Bygzi7yIJXrn9BO8Gbf7Sh5YM5CtqOZQ7JaUEaQqD6/nBDi5tyZv7usbQuv/
	OJtf9VbOLN3FMg8SpNKVGVC0MKuVQSiRWlzoDQuQE/4p3i+KDSaM4BPB1wp+zdfI18/WZ+SvLHi
	bm8DCQFqhs6IAVEn471tCLJcxUFla91JlYpfohJjzigWHaA0hGuPJPDTAVg4HHVzdsfA8ah1j1G
	L0fZ7K
X-Google-Smtp-Source: AGHT+IF1bsmS68qSnnf1SYiKFb4ZBrmhXfzjnMJuX27NDQmyccCPOEOIS5rsgcL82aTX/l3iy6rgHggoay08
X-Received: by 2002:a05:6e02:12c8:b0:427:6510:650a with SMTP id e9e14a558f8ab-42d81622bb6mr67750105ab.25.1759342642229;
        Wed, 01 Oct 2025 11:17:22 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-57b5eb573bdsm10738173.21.2025.10.01.11.17.22
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Oct 2025 11:17:22 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8635d475527so43985985a.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Oct 2025 11:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759342641; x=1759947441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ecfc2ylaD/7+laCYwVlEzsbxMMAjlj+CWU7OhEl57sc=;
        b=V7ztuWXch+CaYdGpnMpGbAJJyYNbibHDHc5DXMdw7UR3EEBERaL8GwDk80pYIXBnK1
         fyxk0e8n0s3Ip8OH11vSRUZTP8LMFUv2aw7qRUZj+FzTWzI4M3tAJiVU7wXSzeKLW4N9
         ia+c2PoFhTrRghPBHBZ8b0ysnnuYft4Y4yxmM=
X-Forwarded-Encrypted: i=1; AJvYcCVOww/zIbq2MorWbppW5IQ7X3pFZA5ASkExpN8NGdU+OyuG92VfO0q7Ivk2RdOw+MJSJ5tsY8r/gzyZpRBpIZZP@vger.kernel.org
X-Received: by 2002:a05:620a:3193:b0:866:73f7:259d with SMTP id af79cd13be357-873796bd7eemr589522085a.61.1759342641381;
        Wed, 01 Oct 2025 11:17:21 -0700 (PDT)
X-Received: by 2002:a05:620a:3193:b0:866:73f7:259d with SMTP id af79cd13be357-873796bd7eemr589514985a.61.1759342640724;
        Wed, 01 Oct 2025 11:17:20 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55c9e78cfsm3847671cf.27.2025.10.01.11.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 11:17:20 -0700 (PDT)
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
Subject: [PATCH v2 0/3] Adding brcmstb-hwspinlock support
Date: Wed,  1 Oct 2025 14:16:38 -0400
Message-Id: <20251001181641.1561472-1-kamal.dasu@broadcom.com>
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

v2 changes:
Adressed following review comments:
 - fixed ordering of obj brcmstb_hwspinlock.o in Makefile 
 - fixed ordering of 'config HWSPINLOCK_BRCMSTB' block in Kconfig
 - Renamed BRCMSTB_MAX_SEMAPHORES to BRCMSTB_NUM_SEMAPHORES
 - Removed unecessary platfrom_set_drvdata(pdev, bank);

Also addressing duplicate PATCH 1/3 sent in error as part of v1 change.

v1 changes:
based on fixes made to Intial patch :
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

