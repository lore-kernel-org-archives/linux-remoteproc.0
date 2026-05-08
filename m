Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E022367D9;
	Fri,  8 May 2026 03:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778210525; cv=none; b=IVgUKTdvZ9lfO8Va26FtFE31cX8N4nQB4r4wYmVdy5qxymJ9UZzZhJVWUJpJcQx3xhS4MrEf/sSdSU99DgDpKwTvJdtOUM3hTk6Xnfa/fFyI2YffSRUXkfgGQMQsDOM/ziplfmWlQnKHBrLcw4meikItVQo9TTdEM24VUlRJ6Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778210525; c=relaxed/simple;
	bh=rq+kXuSyWYb57VR9Wun9wHncBZzkfhzoqnzHS4xSlx8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=JtZzax7Uo3UvPKXaXjM5m1KB/2gK0lAtc3n6WtFii5uzyJfg8dW7cmKxHzQPG0bcYH8W+Oq7cJW9S0iKaLlzxB+DlMwbiN4YQ5olYtxR2ZBqKz7rt+5poV94NcreyWou2qUfdTZI70N3QPP2ZvuWek9mFmBa1OiUWFN9VzSH7bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2ADFB1A1292;
	Fri,  8 May 2026 05:16:12 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E5BE91A11A8;
	Fri,  8 May 2026 05:16:11 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id BD79B1800093;
	Fri,  8 May 2026 11:16:09 +0800 (+08)
From: Jiafei Pan <Jiafei.Pan@nxp.com>
To: daniel.baluta@oss.nxp.com
Cc: Frank.Li@nxp.com,
	Jiafei.Pan@nxp.com,
	andersson@kernel.org,
	daniel.baluta@nxp.com,
	festevam@gmail.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	mathieu.poirier@linaro.org,
	peng.fan@nxp.com,
	s.hauer@pengutronix.de
Subject: [PATCH v2] remoteproc: imx_rproc: Use device node name as processor name
Date: Fri,  8 May 2026 11:18:32 +0800
Message-Id: <20260508031832.27451-1-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <830f0c65-faca-4843-a6c9-693db7562037@oss.nxp.com>
References: <830f0c65-faca-4843-a6c9-693db7562037@oss.nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

As currently there are maybe multiple remote processors, so change from
using fixed name to using device node name as remote processor name in
order to make them can be distinguished by through of name in sys
filesystem.

Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
---
Fixes sine v1:
* Update patch subject to aligin prefix name with existing patches

 drivers/remoteproc/imx_rproc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index e8d239bef5c9..38713f6f1c50 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1356,8 +1356,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	unsigned long cpus_bits;
 	int ret;
 
-	/* set some other name then imx */
-	rproc = devm_rproc_alloc(dev, "imx-rproc", &imx_rproc_ops,
+	rproc = devm_rproc_alloc(dev, np->name, &imx_rproc_ops,
 				 NULL, sizeof(*priv));
 	if (!rproc)
 		return -ENOMEM;
-- 
2.43.0

