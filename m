Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04771313550;
	Mon, 26 Jan 2026 12:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769429323; cv=none; b=MLsB3gEJyBQrArtOeFavPpsYiCNUsy71pDJc2xGs6V+5Zm8I3tXrasfcWeAyg/FGA9EucT5qhsyLuy7yTRyTb0/Mdgzr8vWCJgMm4hvLG1tgZErjTZ3qxUm3zaCPJpJ+hy7lEYOYLgiFNSOKQ5AdlW17TO3PLqsraf3g7hZre6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769429323; c=relaxed/simple;
	bh=Y6sUaUtvpMTu0Wf3O7a4vFBsqfedkoyz0S5r64NVT3w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZUFghtPJTt1nXbXxM7h/n9JVEeqsy3nPQTJPeQwrPJdnWfFTdZLG3r7+07c+kGCzUtOl3tqwHJavaiMT24MpMwBS8YlreccioExogm9WNLJuCQmmV3YO4XjPJUTP1pyPWn1Z54o2Al7lV6pjG1+K4/GTRL8Y7AFOHEIESC7FUG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=EJFeroVb; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="EJFeroVb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1769429320; x=1800965320;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Y6sUaUtvpMTu0Wf3O7a4vFBsqfedkoyz0S5r64NVT3w=;
  b=EJFeroVbKPlef44gBDcyXE/la7hdcpe4IS2MuPR9cx6D8UngCwqByLRV
   coKONEUS1TjZDnoK2Mlojt+AcwfjeBS1CNvkybyxVvJcwDtwSu4aOj+78
   KiSYCwtrK42e/9UE/9Fga3QBWAN3eaajoCrPTrJI7gsw7mLdAbpHQS1aT
   FuVvPhYQ2Vk5nsGeV2kO8/HtAXTSdN5dZX00wBepbhhWSNn0UJ8FmSYUM
   cnXYN9zChGC9/TzMCXfAAx7q9OoMN28iKziDo9WS/MKmlq9oOnMVQo33f
   9LMWDdtDcGWRPxJ3r2mpOED6iK0wAvfNDMgCj+OTYksEqoIihUsR4My0K
   w==;
X-CSE-ConnectionGUID: lg+rExm3SemOjIBtFxY/WA==
X-CSE-MsgGUID: QDRAihz9TiyGuXqSZ5fcjA==
X-IronPort-AV: E=Sophos;i="6.21,255,1763449200"; 
   d="scan'208";a="52870263"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 05:08:33 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Mon, 26 Jan 2026 05:08:18 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 26 Jan 2026 05:08:16 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/2] Add Microchip IPC remoteproc support
Date: Mon, 26 Jan 2026 12:06:56 +0000
Message-ID: <20260126120658.1674253-1-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hello all,

This series adds support for the Microchip Inter-Processor
Communication (IPC) remoteproc platform driver.

Microchip RISC-V SoCs typically contain one or more clusters. Clusters
can operate in Asymmetric Multi-Processing (AMP) mode, where individual
cores or groups of cores run as independent software contexts.

The configuration is flexible, as the set of cores or clusters that can
be controlled as remote processors may vary, and memory regions used
for firmware as well as mailbox assignments depend on the system
design.

Communication with remote cores or clusters is abstracted using ecalls
to the platform's Supervisor Binary Interface (SBI) firmware, through
which the state of remote cores or clusters are controlled.

Changes in v3:
- dt-bindings:
  - Improve commit message and property descriptions as per feedback.
  - Add cpu property and update memory region descriptions.
  - Implement conditional to handle required properties
  - Implement conditionals on vring memory regions

- mchp_remoteproc driver:
  - Drop "ipc_sbi" from Makefile and rename driver file
    to mchp_remoteproc.c
  - Add support for using remote cluster CPU ID for life
    cycle management via SBI interface
  - Improve documentation for early and late boot use cases
  - Improve resource table mapping and error handling
- Link to v2: https://lore.kernel.org/r/20251121142157.3582463-1-valentina.fernandezalanis@microchip.com/

Changes in v2:
 - simplify memory region handling with memory-region-names
 - rename compatible to "microchip,ipc-sbi-remoteproc"
 - rephrase dt binding commit  subject, message and description property
 - drop microchip,auto-boot and microchip,skip-ready-wait properties
 - fix memory-region constraints and add memory-region-names
 - fix binding example and add examples for all use cases
 - Link to v1: https://lore.kernel.org/r/20240912170025.455167-6-valentina.fernandezalanis@microchip.com/

Thanks,
Valentina

Valentina Fernandez (2):
  dt-bindings: remoteproc: add Microchip IPC remoteproc
  remoteproc: add support for Microchip IPC remoteproc platform driver

 .../microchip,ipc-sbi-remoteproc.yaml         | 131 ++++
 drivers/remoteproc/Kconfig                    |  12 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/mchp_remoteproc.c          | 613 ++++++++++++++++++
 4 files changed, 757 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/microchip,ipc-sbi-remoteproc.yaml
 create mode 100644 drivers/remoteproc/mchp_remoteproc.c

-- 
2.34.1

