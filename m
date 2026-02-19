Received: from mail-ot1-f97.google.com (mail-ot1-f97.google.com [209.85.210.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FD2329E5A
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Feb 2026 21:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771538233; cv=none; b=ThAdJVjwu1kG96EXTJm+s0rQbt85d4YGMdldZ+RRFR3P5PvZyyYKEx6FJhrFHCFgMcgy7qj3JrfZaL9/U8E7xPfEM8g+/sJc9NtuIFiHE+bIIhwmABtSB+E7j+6UBK1GDE63chw8/Vxik0T86CrdQIKQRibyaweGZGJ9hLuPBVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771538233; c=relaxed/simple;
	bh=M13rRdKkj48+l10Frz4L86bVw/CZ75WBD1Ms+1T541k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tF+txZ9zSV85Jc5DJyoKXPScGhR07czoe/ccpYLj7KU7Aik5kSg+ixmp3MIusMjkhVoZdi8qc8KvMT/UxLKlfPs4B/1kmsrCVGdqWAWwBsZMNiz1ANi+DLuQ6blUw3HJKIruMp9oFtf4M1W/ot/SqTaOKgvYd8dtcqCo0c1qH5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=YooRy1Mb; arc=none smtp.client-ip=209.85.210.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="YooRy1Mb"
Received: by mail-ot1-f97.google.com with SMTP id 46e09a7af769-7d18d0e6d71so965894a34.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Feb 2026 13:57:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771538231; x=1772143031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrI6BpFC3eI6yOKYRJrMT8qJD2DqNlsDbhGThIhmnQs=;
        b=NXb1IEtCQ+NugaqStwWIdIN8KJccedIKbLweQz5PIbS9VOvAB1kSv2yNuTgzO5eP2w
         Mh9TJMGh2n/e8lQozm4VwoFITxKMV8h32RWdVuOE+QtLQD6mdsx/Dp9LrQWRlpVKuveu
         oZx6TWZE2dS7+QGiDVwC5yMsBtDPxj8QqcpMAZjMUP9M6GG8lMWjOB7Mm6evxHnuiOf9
         6wtM6pKkPgz5iGYcTVQZxuSRjrS9I+OkCuwfPwXSNFY7MJ5oFYE4Yzg0jAX0qhrlCTSB
         mfF++8yowUVMVEI2Qu5cYFfsjHaURt9ylqaAa1vDt3q1AVJXdj3kGVzd0Pjxd3RvVCH9
         346g==
X-Forwarded-Encrypted: i=1; AJvYcCXhu+WntpNi8J6LjoeEQkN6P7a6BLd/wEGtcdgRsaB5R5hzNTsFjD+BN20oTWzL6kh5SsQYsuYJ7byj8ILmgOcy@vger.kernel.org
X-Gm-Message-State: AOJu0YzECrzACOAFRYKohbtEasFUKeKEWvAcDQso6Qxs9IgayU7TWbqe
	uDOS0WWuPb1OGAuYSxytC1eJB1dvCt787VeOA9GnWcav6u0Mr8DxKHRbzLvKGVpDCJxqQhe3T0P
	CIWDO8MUk6ZWZoWuILODk7VYwvu/9zan5YBdni0pOdW484cEAPmq07z6Zov1S3DS4VCvp1+mD8r
	ToTtuHPN+MO4XHmffBpiqNWsBl++HJvNzjhPnrF/T51ST4DKUZhDhJDso+zpg4PDl8YZGtCMWcU
	KxmMCncUKbaOn2qK6l6bg==
X-Gm-Gg: AZuq6aJc3Q/dnFly51VmDuNzTivD4Ke4JKhAeTHUWStsbG/Lwe6VoP9GO+EKkMoLc0x
	UUDloYE80N33qVkKgXFcA3YO1I7CyGETYwAwTAyZe1F9tUOOsatxJi84TEa613B4kOAgEQXgZhh
	rdpuid+RPDRE7Iz2W5Ws8EiElsz39eaxCzeRtUOnyzR75to3lqDa4YotVKL0StuYE22nXM0JdMo
	W+Carq2Lb8GpNfYNs3puMzitd76XNEnKkujEpNjgpANXE67crlr+ngJfnLdwvDpj2UnBc8gfH62
	0UyxN8vnxF5hIVq2g2/IW1euHNslN43goq4Polap0Ucpe1hKGXn8QGsnY93X2W8linjoHDLVJgb
	Pl1SpFIRB+/IVDSjA221vbZiOsraREHYmmIRihYM4beNlntUralkAtu6TcQH28bwgDgn19BakhN
	z+wnD0GZgA5VCA2yuXrWNqkIzkgCOt7ZwpgjnQuE7cBn+aKR7X+HKCGw==
X-Received: by 2002:a05:6830:6731:b0:7cf:dd63:3d37 with SMTP id 46e09a7af769-7d4d0c157aamr11352637a34.25.1771538230963;
        Thu, 19 Feb 2026 13:57:10 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-7d4d47aca62sm2396353a34.3.2026.02.19.13.57.10
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Feb 2026 13:57:10 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a863be8508so14804935ad.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Feb 2026 13:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771538229; x=1772143029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LrI6BpFC3eI6yOKYRJrMT8qJD2DqNlsDbhGThIhmnQs=;
        b=YooRy1MbEzA+TPPyKk6bKdlKsTi7nRo9oDFPpcHclFwh3ja1pICm83OPV9TQmbnxWV
         yBbhB4icMXEHYd6tvG19YO/blwljJSuTSXEJIZ5SFJKOqbOZe2NEZVVsCD1v5OXP5gr4
         k4AY8WsrQA3PPQ7zYo+c9ujFu/4URgfxLWGGY=
X-Forwarded-Encrypted: i=1; AJvYcCVRBpvwDsWkcszv7dHGNqB38yzpJvCjg4t1rHHxR7C3aC/lAne8RScZj0YxzFiF2EoMUZZ/F1uAnAcw/rLP7K1V@vger.kernel.org
X-Received: by 2002:a17:902:f647:b0:2aa:d2a7:ad2e with SMTP id d9443c01a7336-2ad17515e97mr214771115ad.36.1771538229582;
        Thu, 19 Feb 2026 13:57:09 -0800 (PST)
X-Received: by 2002:a17:902:f647:b0:2aa:d2a7:ad2e with SMTP id d9443c01a7336-2ad17515e97mr214770935ad.36.1771538229117;
        Thu, 19 Feb 2026 13:57:09 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aae9d73sm156416065ad.77.2026.02.19.13.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 13:57:08 -0800 (PST)
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
Subject: [PATCH v4 0/3] Adding brcmstb-hwspinlock support
Date: Thu, 19 Feb 2026 16:56:59 -0500
Message-Id: <20260219215702.63321-1-kamal.dasu@broadcom.com>
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
larger sundry block address space, consistent with how other upstream
hwspinlock drivers represent their standalone hardware blocks.

The compatible string has been renamed from "brcm,brcmstb-hwspinlock"
to "brcm,brcmstb-sun-top-ctrl-semaphore" to reflect the actual
hardware block name rather than the Linux subsystem name.

The patch has been tested to work as builtin as well as a module.

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

