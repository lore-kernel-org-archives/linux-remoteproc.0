Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F421420DD;
	Mon, 10 Jun 2024 18:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718042792; cv=none; b=Be5uU/baFMdkjA74sm505rvr47ZneXCMKoVMzL9dET7EGrP1+SiESjP+3CXeFr8Wy+yI1aJkF9yysMhcpcfNPfJWJ8RGmqyhsrna603jgugIRUWvyHf/IXxp3UsYsMOh1wIfaoeOUHRCpWjNPMFioSxJdyQnwwrVxgHPjctiNy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718042792; c=relaxed/simple;
	bh=SGlTXlbAHbufnPd6Eo1oHjPC/WB5/kPMxMReDNymQY8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SOLfcB7Ab4VXWokScUAhgNrzJNsKllzfJiRS2g3P3t5nGmfNy6yJEDYmiyZRMHJeQC7kczG6ZD1Q2gwZWKPYctTtkWwiN0K+UWIzTh/qG9wvee38oQRVZ4joE+xa3xjzzaTwoukKpCvoVPfT7rXW7Jc6leZvqiIDqceAa0KOHYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vA76jLLq; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vA76jLLq"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45AI6HdW057292;
	Mon, 10 Jun 2024 13:06:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718042777;
	bh=h5VEq1G9dRBm6MKM7VYTq1WEKIHpwg4F8MH0iitI/x0=;
	h=From:To:CC:Subject:Date;
	b=vA76jLLqRjRRQ+XjFIFTkUne3Ll1Orh2yVNdhBXfBnjcFkRA3LHd6rpPdMfLbyhsx
	 qkUp3oStrWXExp8HXxsk7XS+Z5WjwCAUrh7TmWXjye9MbppGXq0pgVS5rQl2JNEZyj
	 Ns6WSvDZPRROSMmWrniouy1bWI7cGr9n4B7/4Adc=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45AI6H96011773
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Jun 2024 13:06:17 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Jun 2024 13:06:16 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Jun 2024 13:06:16 -0500
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45AI6Gtf056905;
	Mon, 10 Jun 2024 13:06:16 -0500
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
Subject: [PATCH v10 0/8] TI K3 M4F support on AM62 and AM64 SoCs
Date: Mon, 10 Jun 2024 13:06:07 -0500
Message-ID: <20240610180615.313622-1-afd@ti.com>
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

Changes for v10:
 - Rebased on v6.10-rc3
 - Added AM64 M4 support in DT
 - Addressed comments by Mathieu from v9

Changes for v9:
 - Fixed reserved-memory.yaml text in [1/5]
 - Split dts patch into one for SoC and one for board enable
 - Corrected DT property order and formatting [4/5][5/5]

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

 .../bindings/remoteproc/ti,k3-m4f-rproc.yaml  | 125 +++
 arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi       |  13 +
 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi |  19 +
 arch/arm64/boot/dts/ti/k3-am64-mcu.dtsi       |  13 +
 arch/arm64/boot/dts/ti/k3-am642-evm.dts       |  19 +
 arch/arm64/boot/dts/ti/k3-am642-sk.dts        |  19 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/remoteproc/Kconfig                    |  13 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/ti_k3_m4_remoteproc.c      | 760 ++++++++++++++++++
 10 files changed, 983 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-m4f-rproc.yaml
 create mode 100644 drivers/remoteproc/ti_k3_m4_remoteproc.c

-- 
2.39.2

