Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778DE1D63F0
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Feb 2026 08:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770195347; cv=none; b=McUVa3cmPNTZeAv1Uukbx8IuNs7njT8xg8IKI2nkbavGHhSRRbQqWkMovuwLtV6hj1EqNjOPoJimcFge4+/eX3UugCx5Pjuw883eMnrLSAYUGgBjiTREVhcpuY7R3aQL5bCsXqzwdi6syOr7i+GJAf5blYInxHb5arhH3pzzSOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770195347; c=relaxed/simple;
	bh=dc2pDQlje1TpaNRVrS3ErZEz9RPQs03Rk8N+eEL5ybw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gpQlawm67Fdm73ar8L9aEhWyuvdLe6HT0GcXwh+J7tQgrvYvEJR8D02uFmgIJqfzcx5YdzwpKNwA2hHP39ltgrYuK9/Cyf4MCwUqnekEMLuuVCpdU/O1pNavNGpWiyC+ssbffaFt7bNlOrZ7McCq/bJQBvjRVu0adZ2IrQ780Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p+1kiDEo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p+1kiDEo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 953B8C4CEF7;
	Wed,  4 Feb 2026 08:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770195347;
	bh=dc2pDQlje1TpaNRVrS3ErZEz9RPQs03Rk8N+eEL5ybw=;
	h=From:To:Cc:Subject:Date:From;
	b=p+1kiDEo+GImuELw6M/ciamJR/XwnorEXfsn64N9Da5bZpqqC2FNvOV8KjPj3822r
	 x1k0FEc7WLtJZb0dxTQ5644XqoxRiXpYCBNSx3EnDWuqVXu4AbAHE842D5JaUygQyE
	 OTi0XlzMpjhDDgJk6WVzG/qkPAZMs8ayIg2ePTcNEkxQ7HId1ysWqjHzuE5YXRgkQR
	 W05gik34LqWcD4dwJ/BXLnf67EERGXuqbrnVwINRsaZ9RUTCYbtVLw9fSPrJAzqoR+
	 5RgC6zkbdXOV7+Qxef4R9+ruLssY6jprOQ6N/YtMm79byZg/YZh3rVcOx1XyGcYiIk
	 lj7Th0Afvl6Xw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	tzungbi@kernel.org
Subject: [PATCH] remoteproc: mediatek: Unprepare SCP clock during system suspend
Date: Wed,  4 Feb 2026 08:54:42 +0000
Message-ID: <20260204085442.1822123-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prior to commit d935187cfb27 ("remoteproc: mediatek: Break lock
dependency to prepare_lock"), `scp->clk` was prepared and enabled only
when it needs to communicate with the SCP.  The commit d935187cfb27
moved the prepare operation to remoteproc's prepare(), keeping the clock
prepared as long as the SCP is running.

The power consumption due to the prolonged clock preparation can be
negligible when the system is running, as SCP is designed to be a very
power efficient processor.

However, the clock remains prepared even when the system enters system
suspend.  This prevents the underlying clock controller (and potentially
the parent PLLs) from shutting down, which increases power consumption
and may block the system from entering deep sleep states.

Add suspend and resume callbacks.  Unprepare the clock in suspend() if
it was active and re-prepare it in resume() to ensure the clock is
properly disabled during system suspend, while maintaining the "always
prepared" semantics while the system is active.

Fixes: d935187cfb27 ("remoteproc: mediatek: Break lock dependency to prepare_lock")
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/remoteproc/mtk_scp.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 4651311aeb07..6200c687e232 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1592,12 +1592,40 @@ static const struct of_device_id mtk_scp_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
 
+#ifdef CONFIG_PM_SLEEP
+static int scp_suspend(struct device *dev)
+{
+	struct mtk_scp *scp = dev_get_drvdata(dev);
+	struct rproc *rproc = scp->rproc;
+
+	/* Only unprepare if the SCP is running and holding the clock */
+	if (rproc->state == RPROC_RUNNING)
+		clk_unprepare(scp->clk);
+	return 0;
+}
+
+static int scp_resume(struct device *dev)
+{
+	struct mtk_scp *scp = dev_get_drvdata(dev);
+	struct rproc *rproc = scp->rproc;
+
+	if (rproc->state == RPROC_RUNNING)
+		return clk_prepare(scp->clk);
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops scp_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(scp_suspend, scp_resume)
+};
+
 static struct platform_driver mtk_scp_driver = {
 	.probe = scp_probe,
 	.remove = scp_remove,
 	.driver = {
 		.name = "mtk-scp",
 		.of_match_table = mtk_scp_of_match,
+		.pm = &scp_pm_ops,
 	},
 };
 
-- 
2.53.0.rc2.204.g2597b5adb4-goog

