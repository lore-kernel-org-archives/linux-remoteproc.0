Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE0B3A1E6B
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Dec 2025 04:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766982739; cv=none; b=mEilf+N08sjg75p2r6rm41eKTkGAYnnTP3aLzVvREM9qhHmQ5Ae4sRVGcHBzsXP//5vklzoTDk9PbxvyHJcfoDdQpHGGad1otjHH794M9pG783/9K1s0oi+dwt6bCGiKJBka8XLMC1kvXvamNoS+fRKg9tbtPTaJZ0sC4B61cA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766982739; c=relaxed/simple;
	bh=kLJp2zW30SyEirLd2hJk5YmCXnYsCmPJ8ttStB77kFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YMFn7SmpHYJ05cfMgh33RPI/oq7mxxZjcypmULEJhJQ8OaYOFlgVaPw3vwWEhIXfZ+Iam3iGFwqD4CRr+xry6tjuhtLlHgisoYu+fXHYPN0nCDfbvTMh49MCyq35eo8xIaCcHHDI/U/naTpWtkky8rKV6iey9HLcF2X6WPY1cOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R17pDxF2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R17pDxF2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4716C4CEF7;
	Mon, 29 Dec 2025 04:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766982739;
	bh=kLJp2zW30SyEirLd2hJk5YmCXnYsCmPJ8ttStB77kFw=;
	h=From:To:Cc:Subject:Date:From;
	b=R17pDxF2cYQGJjr0Lui2Oskacm9bRRnadyTcMahexEeGvO8Ps+pERAKLWB9+MvSyj
	 Gb+GMAyo0U+bGza6YOMQXCf4uBGdozhNV3kLFPUE8wrQyoLOYtH5DLxRX2y3fZpGNY
	 sVhMUjr4bQ2eNLUhhYBJBPTuUbmhMOpeHcH2IZPSW7ZII/aftWtl55uCpX29x7G30P
	 T92ByQqgJVMEVaEQJqVaaNlRhE6ny2NEr9DG7E5sVdbeUizVVe4iDhet4VE7ttrQiT
	 d+kIEmC/ZCfmSBHoPuvd0OdF2GvRtAyJphGQN2s2Kd72iJvVWzKNEUVOL7O658a3Bt
	 ABlYzJ3S4+5Wg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	tzungbi@kernel.org
Subject: [PATCH] remoteproc: mediatek: Break lock dependency to `prepare_lock`
Date: Mon, 29 Dec 2025 04:31:46 +0000
Message-ID: <20251229043146.4102967-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`scp_ipi_send` acquires `prepare_lock` via `clk_prepare_enable` while
the caller often holds `ec_dev->lock` (e.g., `cros_ec_cmd_xfer`).  The
reverse dependency exists where `clk_prepare` can trigger operations
that eventually take `ec_dev->lock` (e.g., via sysfs/regulator/genpd).

Move clock prepare / unprepare operations to remoteproc prepare() /
unprepare() callbacks to break the lock dependency from `ec_dev->lock`
to `prepare_lock`.

This breaks the dependency chain in the lockdep report:
> WARNING: possible circular locking dependency detected
> ...
> the existing dependency chain (in reverse order) is:
> ...
> -> #0 (prepare_lock){+.+.}-{3:3}:
>        __lock_acquire
>        lock_acquire
>        __mutex_lock_common
>        mutex_lock_nested
>        clk_prepare
>        scp_ipi_send [mtk_scp_ipi]
>        scp_send_ipi [mtk_scp]
>        mtk_rpmsg_send [mtk_rpmsg]
>        rpmsg_send [rpmsg_core]
>        cros_ec_pkt_xfer_rpmsg [cros_ec_rpmsg]

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/remoteproc/mtk_scp.c     | 39 +++++++++++++++++++++++---------
 drivers/remoteproc/mtk_scp_ipi.c |  4 ++--
 2 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index db8fd045468d..98d00bd5200c 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -283,7 +283,7 @@ static irqreturn_t scp_irq_handler(int irq, void *priv)
 	struct mtk_scp *scp = priv;
 	int ret;
 
-	ret = clk_prepare_enable(scp->clk);
+	ret = clk_enable(scp->clk);
 	if (ret) {
 		dev_err(scp->dev, "failed to enable clocks\n");
 		return IRQ_NONE;
@@ -291,7 +291,7 @@ static irqreturn_t scp_irq_handler(int irq, void *priv)
 
 	scp->data->scp_irq_handler(scp);
 
-	clk_disable_unprepare(scp->clk);
+	clk_disable(scp->clk);
 
 	return IRQ_HANDLED;
 }
@@ -665,7 +665,7 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
 	struct device *dev = scp->dev;
 	int ret;
 
-	ret = clk_prepare_enable(scp->clk);
+	ret = clk_enable(scp->clk);
 	if (ret) {
 		dev_err(dev, "failed to enable clocks\n");
 		return ret;
@@ -680,7 +680,7 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
 
 	ret = scp_elf_load_segments(rproc, fw);
 leave:
-	clk_disable_unprepare(scp->clk);
+	clk_disable(scp->clk);
 
 	return ret;
 }
@@ -691,14 +691,14 @@ static int scp_parse_fw(struct rproc *rproc, const struct firmware *fw)
 	struct device *dev = scp->dev;
 	int ret;
 
-	ret = clk_prepare_enable(scp->clk);
+	ret = clk_enable(scp->clk);
 	if (ret) {
 		dev_err(dev, "failed to enable clocks\n");
 		return ret;
 	}
 
 	ret = scp_ipi_init(scp, fw);
-	clk_disable_unprepare(scp->clk);
+	clk_disable(scp->clk);
 	return ret;
 }
 
@@ -709,7 +709,7 @@ static int scp_start(struct rproc *rproc)
 	struct scp_run *run = &scp->run;
 	int ret;
 
-	ret = clk_prepare_enable(scp->clk);
+	ret = clk_enable(scp->clk);
 	if (ret) {
 		dev_err(dev, "failed to enable clocks\n");
 		return ret;
@@ -734,14 +734,14 @@ static int scp_start(struct rproc *rproc)
 		goto stop;
 	}
 
-	clk_disable_unprepare(scp->clk);
+	clk_disable(scp->clk);
 	dev_info(dev, "SCP is ready. FW version %s\n", run->fw_ver);
 
 	return 0;
 
 stop:
 	scp->data->scp_reset_assert(scp);
-	clk_disable_unprepare(scp->clk);
+	clk_disable(scp->clk);
 	return ret;
 }
 
@@ -909,7 +909,7 @@ static int scp_stop(struct rproc *rproc)
 	struct mtk_scp *scp = rproc->priv;
 	int ret;
 
-	ret = clk_prepare_enable(scp->clk);
+	ret = clk_enable(scp->clk);
 	if (ret) {
 		dev_err(scp->dev, "failed to enable clocks\n");
 		return ret;
@@ -917,12 +917,29 @@ static int scp_stop(struct rproc *rproc)
 
 	scp->data->scp_reset_assert(scp);
 	scp->data->scp_stop(scp);
-	clk_disable_unprepare(scp->clk);
+	clk_disable(scp->clk);
 
 	return 0;
 }
 
+static int scp_prepare(struct rproc *rproc)
+{
+	struct mtk_scp *scp = rproc->priv;
+
+	return clk_prepare(scp->clk);
+}
+
+static int scp_unprepare(struct rproc *rproc)
+{
+	struct mtk_scp *scp = rproc->priv;
+
+	clk_unprepare(scp->clk);
+	return 0;
+}
+
 static const struct rproc_ops scp_ops = {
+	.prepare	= scp_prepare,
+	.unprepare	= scp_unprepare,
 	.start		= scp_start,
 	.stop		= scp_stop,
 	.load		= scp_load,
diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
index c068227e251e..7a37e273b3af 100644
--- a/drivers/remoteproc/mtk_scp_ipi.c
+++ b/drivers/remoteproc/mtk_scp_ipi.c
@@ -171,7 +171,7 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
 	    WARN_ON(len > scp_sizes->ipi_share_buffer_size) || WARN_ON(!buf))
 		return -EINVAL;
 
-	ret = clk_prepare_enable(scp->clk);
+	ret = clk_enable(scp->clk);
 	if (ret) {
 		dev_err(scp->dev, "failed to enable clock\n");
 		return ret;
@@ -211,7 +211,7 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
 
 unlock_mutex:
 	mutex_unlock(&scp->send_lock);
-	clk_disable_unprepare(scp->clk);
+	clk_disable(scp->clk);
 
 	return ret;
 }
-- 
2.52.0.351.gbe84eed79e-goog

