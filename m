Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF96429038;
	Wed, 12 Aug 2026 10:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786531616; cv=none; b=WvgkhbodlVfc4ooIp1jecWHSHBC02C6zyvcoLLlFaR4Zvq7qxROe2cGvPLLCneRhgZJ7A8qctPKAcRuchraZal+g6lv1m0w3yT+AhKQSBWfShgb78iC7AvbohmPZCl+DG8w9/BhnCbVlAAp7t1nz9Z19tJhDXDdS7miMybk30Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786531616; c=relaxed/simple;
	bh=mKCZ6MgSi57xCv06xLzeYFzgIeyAYLNxeXN2KHP5xJM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=MQi76+GVbYITxnJTX62iaDO3Eu5zA1tYxhWQJmpb6SznIj9c3iwAtKR5UhJLJVDkbBSDxi5gmHFA6vH5pH/FSS5n2wU3UrwXU1Ozfv6P49CuMH+C7aUE0zQJPEuX4JBf3Wm9cc3pYUFjdYy2YnFHcsbo06s3EJK1GklxzgbdNb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 86981200018;
	Wed, 12 Aug 2026 12:46:51 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4E29E200011;
	Wed, 12 Aug 2026 12:46:51 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id EA84018000B0;
	Wed, 12 Aug 2026 18:46:48 +0800 (+08)
From: Jiafei Pan <Jiafei.Pan@nxp.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: krzysztof.kozlowski@linaro.org,
	peng.fan@nxp.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhiqiang.Hou@nxp.com,
	mingkai.hu@nxp.com,
	Jiafei Pan <Jiafei.Pan@nxp.com>
Subject: [PATCH v4 0/4] remoteproc: add Cortex-A Core remoteproc support on i.MX platforms
Date: Wed, 12 Aug 2026 18:46:29 +0800
Message-Id: <20260812104633.22420-1-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260511023928.39640-2-Jiafei.Pan@nxp.com>
References: <20260511023928.39640-2-Jiafei.Pan@nxp.com>
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
Changes in v4:
- Refined dts binding

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

 .../remoteproc/fsl,imx-rproc-psci.yaml        |  54 +++++++
 arch/arm64/boot/dts/freescale/Makefile        |   2 +
 .../imx93-11x11-evk-multicore-rtos.dts        |  39 +++++
 .../imx93-14x14-evk-multicore-rtos.dts        |  39 +++++
 .../boot/dts/freescale/imx93-rproc-ca55.dtsi  |  14 ++
 drivers/remoteproc/imx_rproc.c                | 150 ++++++++++++++++++
 drivers/remoteproc/imx_rproc.h                |   2 +
 7 files changed, 300 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-14x14-evk-multicore-rtos.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-rproc-ca55.dtsi

-- 
2.43.0

