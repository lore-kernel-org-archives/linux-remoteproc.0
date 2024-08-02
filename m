Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AF5175D50;
	Fri,  2 Aug 2024 15:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722612087; cv=none; b=fjdUgR8/0ZkTzte64FHPXPVrhJ7JuTa2pjW/vpK1shfrXW/uTCgxA08bUoUq5AtfgGcwhCdXanovf6ClDIQ2f2GcLb+NFSpuIEQr98N6/KKuOid+xDr1xI91Z6mfWL7M5NMR/7MxILUbR93He7cTbFhpcEYsTbK/Cdgq7gA25jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722612087; c=relaxed/simple;
	bh=GESU2vy63jv2s1dJXyUahHwZ/0of8wAMLNHCY+WI1Vc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MiiJY4Q/uAMQN4+9K6LfHLH6sw9UjyoDVqbiN1zboLPDSrDqZ1P4t9T5G6ENWcVqjNWiTA/xpx95urr6nim1DWbCx3VnEchhgx1Co82Je2H4nQbEmZxdWZghlpgpc1Nw/ZsrEImAXuGCr7+7K2gySFSrVQEskmAL6hJ6kIWe2jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tI2xGgd7; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tI2xGgd7"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 472FLBJs109018;
	Fri, 2 Aug 2024 10:21:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722612071;
	bh=dMzobiPINGynYJxO6pCSmRhcNi3u9bYwLfHSjQ3otRc=;
	h=From:To:CC:Subject:Date;
	b=tI2xGgd7WEQ1T98bJBVtFH82zYMLZRihab8oaT+vyvlIsfztlO3M3qNxbSXQ0b8xB
	 ieUXIT7/vCdrHmnbzoeP56H16JKmqFLnvOy+d3LP+uvedk5Q1teyJ4n2rOp8CuF3aC
	 q42GLisXTZcNjLNFX4vGhWLO6IkTmPTJLYgW4WXw=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 472FLBt3099547
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Aug 2024 10:21:11 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 Aug 2024 10:21:10 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 Aug 2024 10:21:11 -0500
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 472FLAeo007504;
	Fri, 2 Aug 2024 10:21:10 -0500
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth
 Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo
	<kristo@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hari Nagalla
	<hnagalla@ti.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Andrew Davis <afd@ti.com>
Subject: [PATCH v11 0/9] TI K3 M4F support on AM62 and AM64 SoCs
Date: Fri, 2 Aug 2024 10:21:00 -0500
Message-ID: <20240802152109.137243-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hello all,

This is the continuation of the M4F RProc support series from here[0].
I'm helping out with the upstream task for Hari and so versions (v8+)
is a little different than the previous(v7-) postings[0]. Most notable
change I've introduced being the patches factoring out common support
from the current K3 R5 and DSP drivers have been dropped. I'd like
to do that re-factor *after* getting this driver in shape, that way
we have 3 similar drivers to factor out from vs trying to make those
changes in parallel with the series adding M4 support.

Anyway, details on our M4F subsystem can be found the
the AM62 TRM in the section on the same:

AM62x Technical Reference Manual (SPRUIV7A – MAY 2022)
https://www.ti.com/lit/pdf/SPRUIV7A

Thanks,
Andrew

[0] https://lore.kernel.org/linux-arm-kernel/20240202175538.1705-5-hnagalla@ti.com/T/

Changes for v11:
 - Added patch [2/9] factoring out a common function
 - Addressed comments by Mathieu from v10
 - Rebased on v6.11-rc1
 - Small reworks in driver for readability

Changes for v10:
 - Rebased on v6.10-rc3
 - Added AM64 M4 support in DT
 - Addressed comments by Mathieu from v9

Changes for v9:
 - Fixed reserved-memory.yaml text in [1/5]
 - Split dts patch into one for SoC and one for board enable
 - Corrected DT property order and formatting [4/5][5/5]

Andrew Davis (1):
  remoteproc: k3: Factor out TI-SCI processor control OF get function

Hari Nagalla (7):
  dt-bindings: remoteproc: k3-m4f: Add K3 AM64x SoCs
  arm64: dts: ti: k3-am62: Add M4F remoteproc node
  arm64: dts: ti: k3-am625-sk: Add M4F remoteproc node
  arm64: dts: ti: k3-am64: Add M4F remoteproc node
  arm64: dts: ti: k3-am642-sk: Add M4F remoteproc node
  arm64: dts: ti: k3-am642-evm: Add M4F remoteproc node
  arm64: defconfig: Enable TI K3 M4 remoteproc driver

Martyn Welch (1):
  remoteproc: k3-m4: Add a remoteproc driver for M4F subsystem

 .../bindings/remoteproc/ti,k3-m4f-rproc.yaml  | 125 ++++
 arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi       |  13 +
 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi |  19 +
 arch/arm64/boot/dts/ti/k3-am64-mcu.dtsi       |  13 +
 arch/arm64/boot/dts/ti/k3-am642-evm.dts       |  19 +
 arch/arm64/boot/dts/ti/k3-am642-sk.dts        |  19 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/remoteproc/Kconfig                    |  13 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/ti_k3_dsp_remoteproc.c     |  28 +-
 drivers/remoteproc/ti_k3_m4_remoteproc.c      | 667 ++++++++++++++++++
 drivers/remoteproc/ti_k3_r5_remoteproc.c      |  28 +-
 drivers/remoteproc/ti_sci_proc.h              |  26 +
 13 files changed, 918 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-m4f-rproc.yaml
 create mode 100644 drivers/remoteproc/ti_k3_m4_remoteproc.c

-- 
2.39.2

