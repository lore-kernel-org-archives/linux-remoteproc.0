Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B87337BA3;
	Wed, 29 Apr 2026 03:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777432096; cv=none; b=Ew2xJDxY5GuXhgB33wJt1BPFGcryJlReLk4IXnF1hTKPQzvo4rvR13dTtcSfVss7pP/CwZ/qGtE5p1kVD69/5VvlGQBEsYBdkK4UvIZ8jWk0OWk4iDHgMbXUAB+M46QCrNBM8d5GYW1ThsWnubqZQjpvcj03in6dtv4oSQwWFAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777432096; c=relaxed/simple;
	bh=g6Xa2DXBj4D8qClv1EhkZIU16xFateUsMlEbArJ3g00=;
	h=From:To:Cc:Subject:Date:Message-Id; b=AsjQO0o20Ipd5h+TxRHFqwPzClx1t2Fkg6b79WJbZLsIFYlUzrJSiiD4KruBSjlHf3R0hxjbsQs73rOpd/u3DaBuvbxNxs3iQfz9mEDgQKLmS+VdlqTmJCCfIkWMvB/q47ixNPGjl2d6tZjt2zPym3HTiW/XX5kM1gbFcCqTfxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 751DD202040;
	Wed, 29 Apr 2026 05:08:13 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3BA5E201A26;
	Wed, 29 Apr 2026 05:08:13 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id D29C21800083;
	Wed, 29 Apr 2026 11:08:10 +0800 (+08)
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
Subject: [PATCH v2 0/5] remoteproc: add Cortex-A Core remoteproc support on i.MX platforms
Date: Wed, 29 Apr 2026 11:10:42 +0800
Message-Id: <20260429031047.30893-1-Jiafei.Pan@nxp.com>
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
4. Updating remoteproc driver to use prcoessor name as device node in sys filesystem

Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>

---
Changes in v2:
- Update arch/arm64/boot/dts/freescale/Makefile to add new dts

---
Hou Zhiqiang (1):
  drivers: remoteproc: imx: add autoboot support for A-core remoteproc

Jiafei Pan (4):
  dt-bindings: remoteproc: add imx-rproc-psci binding
  drivers: remoteproc: imx: add support for Cortex-A Core
  arm64: dts: imx93: Cortex-A Core remoteproc device node
  remoteproc: imx: use device node name as processor name

 .../remoteproc/fsl,imx-rproc-psci.yaml        |  64 ++++++++
 arch/arm64/boot/dts/freescale/Makefile        |   2 +
 .../imx93-11x11-evk-multicore-rtos.dts        |  39 +++++
 .../imx93-14x14-evk-multicore-rtos.dts        |  39 +++++
 .../boot/dts/freescale/imx93-rproc-ca55.dtsi  |  14 ++
 drivers/remoteproc/imx_rproc.c                | 152 +++++++++++++++++-
 drivers/remoteproc/imx_rproc.h                |   2 +
 7 files changed, 311 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-14x14-evk-multicore-rtos.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi

-- 
2.43.0

