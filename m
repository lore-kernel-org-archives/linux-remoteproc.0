Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B153130C155
	for <linux-remoteproc@vger.kernel.org>; Sun, 17 May 2026 08:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779004860; cv=none; b=NaWFtJe+fyYPHhZ+myiu83P+0YnIHfCYwIKsNUNARlQof21ZQnPID7+nk77uFECqRbAcUM80Dn3ljMquLxtajsrKac6jWZsDum4yzdCKfeZMrbNoWVySUb0BJdvZsxxc04AIU2PwSs2SC0ntuArdSx1Uq9fU0ESxDQMYfuDujBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779004860; c=relaxed/simple;
	bh=7xlmiF2cKn9+mTGPsHYhQtTJHz+rY9y3OXOe/uN+ZI4=;
	h=From:To:Cc:Subject:Date:Message-Id; b=fAnYK1L43OC3AVRWA2CX6AluSXKv67h6JxJG+HRkCPcl87Zw0nVJJI1kjQoEF/lRpIYIBrG0RheQaHWXIdNTQokL2pqy10TiC9uiEIahwZ/7YqP4KsY+71Mwrqv0JFVqM5+x+pQJRE3/v7yOkxNwX0HKJMI/UeyZMPK9WNXEgr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C28CD202C3E;
	Sun, 17 May 2026 10:00:49 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8C7722008AE;
	Sun, 17 May 2026 10:00:49 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id E13221800093;
	Sun, 17 May 2026 16:00:47 +0800 (+08)
From: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
To: imx@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Subject: [PATCHv2] remoteproc: imx_rproc: add missing DRAM range for i.MX93
Date: Sun, 17 May 2026 16:03:01 +0800
Message-Id: <20260517080301.24774-1-Zhiqiang.Hou@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

The M33 DRAM view of 256MB ranges 0x[a,b]0000000 are mapped to
0xa0000000 of A55 mapping view.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
V2:
 - Refined the patch subject.

 drivers/remoteproc/imx_rproc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 7f54322244ac..175c2d309979 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -198,6 +198,9 @@ static const struct imx_rproc_att imx_rproc_att_imx93[] = {
 	{ 0x80000000, 0x80000000, 0x10000000, 0 },
 	{ 0x90000000, 0x80000000, 0x10000000, 0 },
 
+	{ 0xA0000000, 0xA0000000, 0x10000000, 0 },
+	{ 0xB0000000, 0xA0000000, 0x10000000, 0 },
+
 	{ 0xC0000000, 0xC0000000, 0x10000000, 0 },
 	{ 0xD0000000, 0xC0000000, 0x10000000, 0 },
 };
-- 
2.17.1

