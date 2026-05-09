Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2176226B74A
	for <linux-remoteproc@vger.kernel.org>; Sat,  9 May 2026 11:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778327693; cv=none; b=iV2pryQnQ7wvW4Eo/gqOSfNMVH/dbX7ujXR3UClO6kIP5n7hrGFAej3Lwd6m7doGO8RCQ0mHm5j1Bx1WAiLD/YPMOxzSHtkckzFvhy76cDdYVgI4XuLgMhT/wVOr/KQoDFGZaYugjBl9dZlSwpCCJWLMyIXGQxKCzC27YbJ4slQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778327693; c=relaxed/simple;
	bh=iAs6EW6YdM8NB3a+zMRfoB79ddSYVoirG6L/eVPkl2c=;
	h=From:To:Cc:Subject:Date:Message-Id; b=K4YP/ksxrUIgXnXxd97ziY5HKDH0YTRqiES5+T0stVDIu4XdRte8nfB0c6Nagj4yN8KGRf1TfOAEKAQgZmIfRCP0JJqDd4VPIsy8h6QplqaMmpW7ZRkBhIQaSOpMdsd95G1VA9+BkEZwn72t8VTQ5e4tlTWf2p4MCJpdDjMTRF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 754FC1A3AAB;
	Sat,  9 May 2026 13:54:50 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3E5F21A3AB6;
	Sat,  9 May 2026 13:54:50 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id A403218002C2;
	Sat,  9 May 2026 19:54:48 +0800 (+08)
From: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
To: imx@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Subject: [PATCH] remoteproc: imx_rproc: add lost DRAM range for i.MX93
Date: Sat,  9 May 2026 19:57:19 +0800
Message-Id: <20260509115719.12546-1-Zhiqiang.Hou@nxp.com>
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
 drivers/remoteproc/imx_rproc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 7f54322244aca..175c2d3099794 100644
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
2.43.0

