Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35BB1F09AC;
	Fri, 21 Nov 2025 14:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763734998; cv=none; b=JH5DcPrRWKZHGqaXSzucGaEUDtbQZKIgeBvZp0rnKlEitehljYNNrO51szB/tmGXxwoHdC5VwB7iH+Tsl+yoa+f8qR8uUvtMJNTL2PuSUH3wQi8LVq86Qz+bLsiefezcoYrxJzCYHXVkiTtIcEQGi8xBMrioifC8BDwLB1H8PXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763734998; c=relaxed/simple;
	bh=siADLXNIdSZqDXTpejfo/TYTIA+I/j/UpCP+u8PRgqs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pe2BiUWWCIgWMSegQQzfNxRvKX4dzpnJ/cx/c5XEayClP5tHNvDQXociOEjr7aC0H31GJxQKt0Hqsj3kyGkp/2jU/8F6qjC0pMokafBfOpkGmILJbnWjPBpmRlc7atw5mfKVaKzd4C+WDO+3Avcsqfk4HEQ1w85b57VF4EM3+Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=FnyEaFm9; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="FnyEaFm9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1763734996; x=1795270996;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=siADLXNIdSZqDXTpejfo/TYTIA+I/j/UpCP+u8PRgqs=;
  b=FnyEaFm93np2VUt175gM3eJsXpBqhbFmAFUjPgpJk2akF4tBmB4LDC17
   Yu7dRnW0cpz4BZzjOJofjykLH0QCATsnSUsfNMQ/eTHckHBQ3FuJ57lNE
   CB4oRHK9DNgnyXzRQZ2rfPrkhusbpXYbSxs5WhqyOtvX1jPZv2qgotUHq
   n2xd25RrBtRHEoCsoKsOpGK+Dq7sj8ETpZwMMKzaY38znlBzVa7w7WczX
   4jVKC6uHkTazeORx0CDc0FyogRWkgswQfksN+H9Ry9GVOxhm2QmYbjYxP
   71f16Z54LQyPcg1xZeVJ9tjGXCvxbngFzO8NkC581tQD78Lr8p3vgudl+
   A==;
X-CSE-ConnectionGUID: L9J59RpxQyuZuauzmfB2LQ==
X-CSE-MsgGUID: i7TVzkosSjaP1RIWpAbhTQ==
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="216836360"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 07:23:15 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 21 Nov 2025 07:22:35 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 21 Nov 2025 07:22:33 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] Add Microchip IPC remoteproc support
Date: Fri, 21 Nov 2025 14:21:55 +0000
Message-ID: <20251121142157.3582463-1-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hello all,

This series adds support for the Microchip Inter-Processor Communication
(IPC) remoteproc platform driver.

Microchip's family of RISC-V SoCs typically has one or more clusters
that can be configured to run in Asymmetric Multi-Processing (AMP) mode.

The IPC remoteproc platform driver allows for starting and stopping
firmware on the remote cluster(s) and facilitates RPMsg communication.
The remoteproc attach/detach operations are also supported for use cases
where the firmware is loaded by the Hart Software Services
(zero-stage bootloader) before Linux boots.

Error Recovery and Power Management features are not currently
supported in the remoteproc platform driver.

Changes in v2:
 - simplify memory region handling with memory-region-names
 - rename compatible to "microchip,ipc-sbi-remoteproc"
 - rephrase dt binding commit  subject, message and description property
 - drop microchip,auto-boot and microchip,skip-ready-wait properties
 - fix memory-region constraints and add memory-region-names
 - fix binding example and add examples for all use cases
 - Link to v1: https://patchwork.kernel.org/project/linux-remoteproc/patch/20240912170025.455167-6-valentina.fernandezalanis@microchip.com/

Thanks,
Valentina

Valentina Fernandez (2):
  dt-bindings: remoteproc: add Microchip IPC remoteproc
  remoteproc: add support for Microchip IPC remoteproc platform driver

 .../microchip,ipc-sbi-remoteproc.yaml         |  95 ++++
 drivers/remoteproc/Kconfig                    |  12 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/mchp_ipc_sbi_remoteproc.c  | 465 ++++++++++++++++++
 4 files changed, 573 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/microchip,ipc-sbi-remoteproc.yaml
 create mode 100644 drivers/remoteproc/mchp_ipc_sbi_remoteproc.c

-- 
2.34.1

