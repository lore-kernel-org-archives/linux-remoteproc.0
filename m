Received: from mail-oa1-f103.google.com (mail-oa1-f103.google.com [209.85.160.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A50242935
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 20:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759176401; cv=none; b=GJAUicc+7e3hKnDdXyvVM8ZaDUAz0vc7uzlal3zBY3BhREqrx1GZcfjfgxd/f98Cn+TpEdLmMprq/Plh4TP/lWC6Zfdy4xrweecPzQqMNy3VG/PxU9QaYyDF2Xzlp4ZVwsyaQEgImf/o0WvrKXcmOumfH39kHSSgGehBw3Y9o6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759176401; c=relaxed/simple;
	bh=xJ0YjV6u0u1BrqJyi5HsaFx0jR+epqiScXrW80J8Ilo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PaKTVdZBpy2ukdw/QykA/LPWy+dv7WYedklIugcvJGIY3NOJMFj9THzGP31tjKk9rjAlKLEDXpeRTMAZytV0isVp9Hg6k3vVY6QGeRK7KTgS5es+YOqfG7TrA/QRZByVJhK9f3vu6ylPkh88AJFHEt/HLvW0Xw7XVQLKmIaWh1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Bow644b6; arc=none smtp.client-ip=209.85.160.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Bow644b6"
Received: by mail-oa1-f103.google.com with SMTP id 586e51a60fabf-36ce5686d75so2925825fac.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 13:06:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759176398; x=1759781198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNXWXlHT5+84YH+qmxDCb+3VQowVLVSncoXOi7xa9mU=;
        b=usXUhknAFDR1tbBbZ1fGFl64HzkW+vC0VadTk5wB3/S+6LrV9hKXwa+ymi5z+cAi/D
         e7BFvoizymH1ESqy2uYt/G+cHan2i3FVxzDGwrLFUuFjbeek16iQC+uExl2xQ5/FX54f
         xbfX1g0R4nq9yAQC6VQ0ZXc3wuKDn6JpEDNvVOd94PB7xXMPVhQ6YOYJ3WzNBTZH7PEL
         KgrNzH8FkXIZjaKg3WBX3PDLThYM11R7Ce3xP8M37BxgohfNFCCnWeI3EiiQshxIQu1l
         4rkhBsNQu0dITv3In9u51rTYwwIyaOuiTevy0RIJMiu7FgCMkpVYsPBK3FmbJg4ndL3e
         dZ8w==
X-Gm-Message-State: AOJu0Yy+bhBfds6Xrr/UohbsmcyQBfs6EEnzcGfWByIICw/DoP0iVNiH
	g2XmVQRB9W1AwVSL/rR740alBwBoFhld+qDdgBUadD9YTadPzsrRtd/ctybVxIm/5sb0qmDARLz
	pKAedEKdJN341PeqWjpz5VR1/OkC4iZ/CFtR2/Gb2IqwtFmO/46Hhe4O4LfokvVsW0sLTi02EBR
	fgI+02d5RfHDaRZMrqgTiiHpXTp6J4Dy5eH/ogPEgP5IkncyF7V6YMSMWotoAnHJFt/a9jUfisj
	tYFPavRfXf0dnsj/Kl9ejMj
X-Gm-Gg: ASbGncsCiaxgdeEa3dSJ1sK32t964hQ35LpcUNL8zLS9e+cL5Uae3GrFsuEE11U2ITt
	xv4c3nVYQKzCmrWDZ9SKccvUvBXuszlwCfZ5ZthhbFtCwVgDZwOWfZcSAgP6W0+rEP9AZOOInrR
	Mf4hKlZCwfFyCNqvnRtTa0Fok9RfPUlMvSwEYzB7UY7EoMirlwn//lWFlG2uR6LcBoh2OaWPKtQ
	6Kw6UArqun2g1LT6q+yEDJwlnNzlomyCTa3WhhYC6j5pC3X3Cioy22DQ8c23TNNYSDnoc+wDzFF
	4kRgOR4U1dYnyyW0pLi8zBRPHg8y8e8CfR9VTUxtPuxnlM2zij4Pr2bG6u72asAH7ySrFTcJGra
	bIANlN3uSR+b9VjCxK9nb
X-Google-Smtp-Source: AGHT+IH+pM/pzXks4v+vghyFJTuYcLM73DieVTdxYizakA3UCe07nMAHUbXDyQqPwa1fJo9N02lwj7udDHzp
X-Received: by 2002:a05:6870:a10a:b0:31d:64c9:8b12 with SMTP id 586e51a60fabf-35e8e6b1c96mr10279378fac.0.1759176398471;
        Mon, 29 Sep 2025 13:06:38 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-363ba04cdabsm1043724fac.25.2025.09.29.13.06.38
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Sep 2025 13:06:38 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32eae48beaaso5017243a91.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 13:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759176397; x=1759781197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PNXWXlHT5+84YH+qmxDCb+3VQowVLVSncoXOi7xa9mU=;
        b=Bow644b6p+csLTa64Wcuf5kVEfAMYp91VRVecGYttqiFI8QLU7Sby4GwzPfA2a33oq
         ksjtHowGcFUNNlE3hBbc/BJZqk5T0faJUSmMv83EsoXZBO0oBEgMArPlJVHBgRFA7LIQ
         GGius/12GADlmXHU8dUEtiY1cKu09tDOMzYIk=
X-Received: by 2002:a17:90b:4b90:b0:330:a301:35f4 with SMTP id 98e67ed59e1d1-3342a296f22mr20564268a91.20.1759176396997;
        Mon, 29 Sep 2025 13:06:36 -0700 (PDT)
X-Received: by 2002:a17:90b:4b90:b0:330:a301:35f4 with SMTP id 98e67ed59e1d1-3342a296f22mr20564239a91.20.1759176396554;
        Mon, 29 Sep 2025 13:06:36 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33838735194sm2121479a91.22.2025.09.29.13.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 13:06:36 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH 0/3] Adding brcmstb-hwspinlock support
Date: Mon, 29 Sep 2025 16:06:23 -0400
Message-Id: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This is standalone patch for the harware semaphore feature for
brcnstb SoCs. The initial patch was sent as part of different patch
set shown below. That was not accepted, however the hwspinlock feature
is geenric for all brcmstb SoCs.

Intial patch:
url:    https://github.com/intel-lab-lkp/linux/commits/Kamal-Dasu/dt-bindings-brcmstb-hwspinlock-support-for-hwspinlock/20250712-034624
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250711154221.928164-4-kamal.dasu%40broadcom.com
patch subject: [PATCH 2/4] hwspinlock: brcmstb hardware semaphore support

All the review comments and build warning have been fixed in the current version.

Kamal Dasu (3):
  dt-bindings: hwlock:  Adding brcmstb-hwspinlock support
  hwspinlock: brcmstb hardware semaphore support
  MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver

 .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 36 +++++++
 MAINTAINERS                                   |  8 ++
 drivers/hwspinlock/Kconfig                    |  9 ++
 drivers/hwspinlock/Makefile                   |  1 +
 drivers/hwspinlock/brcmstb_hwspinlock.c       | 98 +++++++++++++++++++
 5 files changed, 152 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
 create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c

-- 
2.34.1

