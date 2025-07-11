Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2AC2EE279
	for <linux-remoteproc@vger.kernel.org>; Fri, 11 Jul 2025 15:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752248555; cv=none; b=Bn7553qiupygkkVjbj98ld3aHHQFEe3Vd1ekO/bwpoGxdtRZ5XXXxy9mCQgFTdO+VljldeQouRhkyjY3qCZIyPFjjwwLHTWwNLHTTfFhi6ECH3BHBu8SuWBmvo89kF2Q68FvXkiW7e/yqT4WymTMT7HfX4KXAK5EYsSuy2UWsJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752248555; c=relaxed/simple;
	bh=iF8ihvJBIUayCH7M+0g/FxeDaHneCHPNV7PdfMD3EjA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lLRiKiX+XCK47oVa1E2CYbD7cLLPc777/9OpNvGMKgyFvxM6WwpeX1MA733+e56263cs1QAozD9Ofo0hCa1x0ZRSY+H6r9bGSB6kGpGc0522Bum/ptmIZ5PUyWbdKEnScN0Bf0VU2QzWMY+D5++SD9Z4VV/UZFt3xLWVPMwQyL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=gtHREV1U; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="gtHREV1U"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so2206984b3a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Jul 2025 08:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1752248553; x=1752853353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7skpOByzW+hOTXagKwoSr9X/HjtkTFtxhdBwxlew5M=;
        b=gtHREV1UN0iNImAXaqVLfkwOSS0oYfzXpQdsx35pW498V5lEPuY5ytmaRLMym/+6lr
         vzNtxX+Mlf6xiiOeN3eYbs41DVi6z6DjHvshe6cpO//imMI1sHb6jlEFPjdmz2OhYFu8
         oLAUArWh18dVFFtRV+yfLdHbGhsz40n5Hq7WA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752248553; x=1752853353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7skpOByzW+hOTXagKwoSr9X/HjtkTFtxhdBwxlew5M=;
        b=tjlx/yIFO6gQnpjmAPY72w9Ddzf8ODQZVK4rmaG80TEeTmQkxaYYjKQiqff7tJJJcX
         2NEV1lx1EaWZyEyP9D9JjGlsAjmI7OGrybpfmwyxtwoxnMuJosG9y56Y5I/2rEsiykCT
         +xzgga4EuorxWmfeD7AwqtFd9qA4ZuU5bmQCFuWqruoO7Yf3pNTU79PFLVWplkDCPcqB
         ZV7L0/NvjJILJQVzA7yIZ5Y3Ak16mvmbTfjWApetkrxC25v8TlbNjNzfFet3UiRDxXRE
         /dYyWlm79RuNZwgH13UHmP6Mj6x5/xaBYXQI4TYFWVVjFUh3gkA0lLzOjTu5sY986c4G
         cPog==
X-Forwarded-Encrypted: i=1; AJvYcCU8rk8MweLXuuNlPMa4d/FaFIb+aRQewPfQeSzeqpJmuzCuXwZzeEvNu2v1PBGM/J5jvL2GLZ/qxuJU6RlPP1/y@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi3SxPW8sYRcHQtjfh8iCO+qhxX7TCQzP0zyt5AmqpE3skL5RI
	eUDoBBXDMrTupPAV66KbX0kvl5JC2jtI+g4AkkzM4Cox/jgkWRwNdke8pzTsU35Otg==
X-Gm-Gg: ASbGncugFDcN6V6wZunKi1c8jYlKZjD3deK9uUvKUldcXj4z2i+8FTOKlRht87hO5k3
	oGcICjglbDmovlmBQSvEbyT+5FYntIl1AaJSymR0ppIieRhjcNPrQYag8iHSUO/VpELsCnOPA+u
	t/SKqprARqCLGA/vtYB2GUhbskvf46Om+bW92fOoWgvaMSgvIOnxiZsXn2eI9o8lWrQfryxDsb1
	OKuSyjNDe+1ZP2cMd6gyx4chpyZXU1fLc88Pj3ToEjwwudDLvzOnBR2OHzjdYsHklU9Cxxy3iTi
	j8PP8QomTy+k2PddDhZjJmuwchcW7aLOafIPjFW2DK9moAgsfoKcha7oi4ZpNf0JSqQaCFUvGAd
	UPIRHYb1alZ3kPi8qtpCfhmNHPQMzNkg9HHe/bBp8Zc2OZ/nofic5olxECQ==
X-Google-Smtp-Source: AGHT+IGDEkar+diQDXAFzWseo9mmENOlTrd0V0FLWObaE74a9KCtE2gcym2rmo5BmC5WxmqYeQa0ow==
X-Received: by 2002:a05:6a00:188c:b0:74d:3a57:81d9 with SMTP id d2e1a72fcca58-74ee0ab538cmr5458867b3a.8.1752248553448;
        Fri, 11 Jul 2025 08:42:33 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5ccesm5762420b3a.27.2025.07.11.08.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 08:42:32 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	ulf.hansson@linaro.org,
	adrian.hunter@intel.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	kamal.dasu@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org
Subject: [PATCH 0/4] mmc: sdhci-brcmstb: rpmb sharing by claiming host for TZOS
Date: Fri, 11 Jul 2025 11:42:17 -0400
Message-Id: <20250711154221.928164-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711154221.928164-1-kamal.dasu@broadcom.com>
References: <20250711154221.928164-1-kamal.dasu@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds support to claim host for TZOS RPMB access and synchronized
access to the controller hardware using hwspinlock framework.
To achieve this Linux OS and the secure TZOS make use of:
- shared hardware semaphore register
- a set of SDIO shared work registers and
- IPI interrupt registers 

The currently running OS that needs access to the controller puts itself in its
slot of work register and if its next in line it can try to grab the hardware
semaphore and complete its mmc requests. The shared work registers indicate next
in queue to access the controller, and current agent in the queue. Next agent
queue state is changed under the hwspinlock is owned by the current OS accessing
the controller hardware before release the semaphore, send and receive IPI
interrupts between linux and secure world are used to indicate completion of
transaction to the waiting OS. TZOS has its own RPMB driver which accesses
partition when it wants to read/write RPMB frames. Current implementation
assumes Linux and TZOS as the two work agents.

Kamal Dasu (4):
  dt-bindings: brcmstb-hwspinlock: support for hwspinlock
  hwspinlock: brcmstb hardware semaphore support
  dt-bindings: mmc: add brcmstb share register and hwlocks reference
  mmc: sdhci-brcmstb: rpmb sharing by claiming host for TZOS

 .../hwlock/brcm,brcmstb-hwspinlock.yaml       |  36 +++
 .../bindings/mmc/brcm,sdhci-brcmstb.yaml      |  29 ++-
 drivers/hwspinlock/Kconfig                    |   9 +
 drivers/hwspinlock/Makefile                   |   1 +
 drivers/hwspinlock/brcmstb_hwspinlock.c       |  98 +++++++
 drivers/mmc/host/sdhci-brcmstb.c              | 243 +++++++++++++++++-
 6 files changed, 413 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
 create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c

-- 
2.34.1

