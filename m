Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC0919F105;
	Thu, 12 Sep 2024 16:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726159708; cv=none; b=ZtbZkva11dOuSaFt2M4efZ6C/gkooKUnltqMef16Zi3IOdfJhOpdcbS8hp5ofRedwWiVmubleGQtsoxgutbR78I2g/WwIp+CTcdtUQHHmSxFdHntkIM9DJmSlhRK3+HwVoVNiI5M0lPJm72kneq0KCWXwca50+YzDnlIZEvZd9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726159708; c=relaxed/simple;
	bh=tumOMK6ePQtr6oYjEIUYDl/feJA9f3v2UT5ccuOHVNo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Xch5xX4H0RJBVVpIsZTDeu6uouBiM+kSEruxKlnnprzu09l8HyQLSP8sAoeXjJEmJ49dD9LlNxHejYY4Elt9lJwNbEjeO2SIyUWhLq4iSLxifvdPTQ00BA6bGsG5Fy1NdMKJhmLK3eWJNw88Wf5Ma240x5eFEsc0XRG0aGZYiOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=lWy7vtvS; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="lWy7vtvS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726159706; x=1757695706;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tumOMK6ePQtr6oYjEIUYDl/feJA9f3v2UT5ccuOHVNo=;
  b=lWy7vtvSLIv/9Lhv2vYS/tWxwkuBZoupEwCO1oREwmF14Wns8hHMx7A/
   v9SvRtxVwSgI1YE7N8wGqPmmQMJ4kUyI8IIfKsemjK5m3UG1Mx95ui7nr
   483+vov7+loBlcn+cJO7J7IXPKzIfKV0FuHLcPLJcsY9jsMT0G64zkSXq
   Rc56pfud026DT5hkQdLpwLUEjvNRxQBhioJ29QQnJPGs0Umk3a56L92U5
   Q72H5BJ0jVZoPOtJlP205xdfARdvRysQOvdB3YQStoN6PD9ZbYtCw/uVj
   RqOhQyUj3j8dhrQ9/P+Ljm/7mhYQ1mptMjIok+sFTchczu40Arlu7aNLx
   A==;
X-CSE-ConnectionGUID: DQLE4LE3SvKX/JE8rC2tCg==
X-CSE-MsgGUID: fZT3tPZfQRufVAoEKWniow==
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="32331225"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Sep 2024 09:48:24 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 12 Sep 2024 09:47:44 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 12 Sep 2024 09:47:41 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<peterlin@andestech.com>, <dminus@andestech.com>,
	<conor.dooley@microchip.com>, <conor+dt@kernel.org>, <ycliang@andestech.com>,
	<jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
Subject: [PATCH v1 0/5] Add Microchip IPC mailbox and remoteproc support
Date: Thu, 12 Sep 2024 18:00:20 +0100
Message-ID: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
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
(IPC) mailbox controller, as well as an IPC remoteproc platform driver.

Microchip's family of RISC-V SoCs typically has one or more clusters
that can be configured to run in Asymmetric Multi-Processing (AMP) mode.

The Microchip IPC is used to send messages between processors using
an interrupt signaling mechanism. The driver uses the RISC-V Supervisor
Binary Interface (SBI) to communicate with software running in machine
mode (M-mode) to access the IPC hardware block.

Additional details on the Microchip vendor extension and the IPC
function IDs described in the driver can be found in the following
documentation:

https://github.com/linux4microchip/microchip-sbi-ecall-extension

The IPC remoteproc platform driver allows for starting and stopping
firmware on the remote cluster(s) and facilitates RPMsg communication.
The remoteproc attach/detach operations are also supported for use cases
where the firmware is loaded by the Hart Software Services
(zero-stage bootloader) before Linux boots.

Error Recovery and Power Management features are not currently
supported in the remoteproc platform driver.

The PIC64GX MPU has a Mi-V IHC block, this will be added to the PIC64GX
dts after the initial upstreaming:

https://patchwork.kernel.org/project/linux-riscv/patch/20240725121609.13101-18-pierre-henry.moussay@microchip.com/

Thanks,
Valentina

Valentina Fernandez (5):
  riscv: asm: vendorid_list: Add Microchip Technology to the vendor list
  dt-bindings: mailbox: add binding for Microchip IPC mailbox driver
  mailbox: add Microchip IPC support
  dt-bindings: remoteproc: add binding for Microchip IPC remoteproc
  remoteproc: add support for Microchip IPC remoteproc platform driver

 .../bindings/mailbox/microchip,sbi-ipc.yaml   | 115 ++++
 .../remoteproc/microchip,ipc-remoteproc.yaml  |  84 +++
 arch/riscv/include/asm/vendorid_list.h        |   1 +
 drivers/mailbox/Kconfig                       |  12 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/mailbox-mchp-ipc-sbi.c        | 539 ++++++++++++++++++
 drivers/remoteproc/Kconfig                    |  12 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/mchp_ipc_remoteproc.c      | 461 +++++++++++++++
 include/linux/mailbox/mchp-ipc.h              |  23 +
 10 files changed, 1250 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/microchip,ipc-remoteproc.yaml
 create mode 100644 drivers/mailbox/mailbox-mchp-ipc-sbi.c
 create mode 100644 drivers/remoteproc/mchp_ipc_remoteproc.c
 create mode 100644 include/linux/mailbox/mchp-ipc.h

-- 
2.34.1

