Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6761C701F;
	Mon, 11 May 2026 02:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778467032; cv=none; b=kKUUFC0ZX1qq9/8NyhGUOlum2znOjAUadIAz61LiLn7RStbtg5e3aIiQf4IuSGgUgFgHOJpNaeQsz45NWazV27fd0/q2hQ1GS3WuXfyl+cV2oLIu3xcOeRi98PkY4HTo3PibezARBcSX7qrDclIiu+/+FyPaHnx+oflab8eBDH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778467032; c=relaxed/simple;
	bh=XjewDR+I37G8oNcTXpyclfh9G+81jGqiuY1IXmC5awY=;
	h=From:To:Cc:Subject:Date:Message-Id; b=o6KxOLrBN3PHBNd3szBRw1rq+E2r+oySnQEt2ICspCkoCiOSmDJQB/pLC9zCOa88mMMM3FGtKcfjrVx7kMwRO2u5mudLiwvR3qSM5R+22mZpXaEm39Mfu56mfh/g0SOohrNq9USTLXKiRAU8/44e+B40Ff/ERgfC1uPs1frTx1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7C1A120489C;
	Mon, 11 May 2026 04:37:03 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4F409201388;
	Mon, 11 May 2026 04:37:03 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 2082718002DC;
	Mon, 11 May 2026 10:37:01 +0800 (+08)
From: Jiafei Pan <Jiafei.Pan@nxp.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	peng.fan@nxp.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zhiqiang.Hou@nxp.com,
	mingkai.hu@nxp.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Jiafei Pan <Jiafei.Pan@nxp.com>
Subject: [PATCH v3 0/4] remoteproc: add Cortex-A Core remoteproc support on i.MX platforms
Date: Mon, 11 May 2026 10:39:24 +0800
Message-Id: <20260511023928.39640-1-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

This patch series is to add remoteproc support on Cortex-A Core of i.MX platforms:
1. Adding dts binding for Cortex-A Core remoteproc
2. Enable Cortex-A Core remoteproc support in remoteproc driver
3. Adding dts example on imx93 platforms.

Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>

---
Changes in v3:
- Fixed dt_binding_check warnings
- Updated prefix of patch subject

Changes in v2:
- Update arch/arm64/boot/dts/freescale/Makefile to add new dts

---
Hou Zhiqiang (1):
  remoteproc: imx_rproc: add autoboot support for A-core

Jiafei Pan (3):
  dt-bindings: remoteproc: add imx-rproc-psci
  remoteproc: imx_rproc: add support for Cortex-A Core
  arm64: dts: imx93: Cortex-A Core remoteproc device node

 .../remoteproc/fsl,imx-rproc-psci.yaml        |  51 ++++++
 arch/arm64/boot/dts/freescale/Makefile        |   2 +
 .../imx93-11x11-evk-multicore-rtos.dts        |  39 +++++
 .../imx93-14x14-evk-multicore-rtos.dts        |  39 +++++
 .../boot/dts/freescale/imx93-rproc-ca55.dtsi  |  14 ++
 drivers/remoteproc/imx_rproc.c                | 150 ++++++++++++++++++
 drivers/remoteproc/imx_rproc.h                |   2 +
 7 files changed, 297 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-14x14-evk-multicore-rtos.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi

-- 
2.43.0

