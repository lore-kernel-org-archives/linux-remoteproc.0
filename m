Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D101F5842
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Feb 2026 03:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770348694; cv=none; b=EupvYyL0Rzbm2HVc4uXGOrmyT+Kr3g7wCKweZMbWiIIrNQn8deicj8X3AEoGqowihh+yCO3+WU+X7VDnyKNdtO1a02m0vKZ+IUoIVOt1O1cQsxzUdWmqOhL/7pT2n8kKobBMQYgzMZRpgxA72rbAFICF32wjBGdTSuFbmJceFMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770348694; c=relaxed/simple;
	bh=hVVbQbgdE25lF5ghgQPEsPcAOupRTNJtJ71dyf69LX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fefo3xqAfAF3IhSQCD9UInKQfmYO46bx1FbALnFLM09SoH++xq9yV3hEj6mbfqvcNAnRpjIWovHw+bLvo1s++U9rwGkYXy4ztu41Bjq6HHwLMtxN7jEhhL6rZ+3+jKuw1wBDXIU6P2kEGBtuzQSIpOAt8MYaZtLkPUWN6Q+K8R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=odiN74dK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="odiN74dK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F58C4CEF7;
	Fri,  6 Feb 2026 03:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770348694;
	bh=hVVbQbgdE25lF5ghgQPEsPcAOupRTNJtJ71dyf69LX0=;
	h=From:To:Cc:Subject:Date:From;
	b=odiN74dKqEcp90TApVdIFSTI2p/6fRoWtJB69yufrp0J9K/aT96NG11Z+MUW3D/Sq
	 WPNqJiPKjte1J4jDxPdJeai3a1lahk+l0YtKlZoMP8tRgYOYJEiR9oCFxn8EKsE84Y
	 687yVUmGZUapGZKzg5O82Z98Er1vZzo1QvhQXXi7gsf7bSOWCnmWFhYVQqLn2m1cPv
	 Tnf3HGE0T/vN7zX+soxLC9sRHrKKisREpv80XTnP0Srbxyh8i52+fKKsK0Q2QEOdPO
	 6bAtDiLddpi5y2M25DKSagHAcibJhA66OwTC6yTP/dgytZpLxIBhzmNT7rhNtWx4WM
	 XRRr6DPdveEnw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	tzungbi@kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] remoteproc: mediatek: Unprepare SCP clock during system suspend
Date: Fri,  6 Feb 2026 03:30:33 +0000
Message-ID: <20260206033034.3031781-1-tzungbi@kernel.org>
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
prepared" semantics while the system is active.  The driver doesn't
implement .attach() callback, hence it only checks for RPROC_RUNNING.

Fixes: d935187cfb27 ("remoteproc: mediatek: Break lock dependency to prepare_lock")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/remoteproc/mtk_scp.c | 39 ++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 4651311aeb07..bb6f6a16d895 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1592,12 +1592,51 @@ static const struct of_device_id mtk_scp_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
 
+static int __maybe_unused scp_suspend(struct device *dev)
+{
+	struct mtk_scp *scp = dev_get_drvdata(dev);
+	struct rproc *rproc = scp->rproc;
+
+	/*
+	 * Only unprepare if the SCP is running and holding the clock.
+	 *
+	 * Note: `scp_ops` doesn't implement .attach() callback, hence
+	 * `rproc->state` can never be RPROC_ATTACHED.  Otherwise, it
+	 * should also be checked here.
+	 */
+	if (rproc->state == RPROC_RUNNING)
+		clk_unprepare(scp->clk);
+	return 0;
+}
+
+static int __maybe_unused scp_resume(struct device *dev)
+{
+	struct mtk_scp *scp = dev_get_drvdata(dev);
+	struct rproc *rproc = scp->rproc;
+
+	/*
+	 * Only prepare if the SCP was running and holding the clock.
+	 *
+	 * Note: `scp_ops` doesn't implement .attach() callback, hence
+	 * `rproc->state` can never be RPROC_ATTACHED.  Otherwise, it
+	 * should also be checked here.
+	 */
+	if (rproc->state == RPROC_RUNNING)
+		return clk_prepare(scp->clk);
+	return 0;
+}
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

