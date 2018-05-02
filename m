Return-Path: <brgl@bgdev.pl>
Return-Path: <brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 2/3] remoteproc/davinci: prepare and unprepare the clock where needed
Date: Wed,  2 May 2018 11:56:58 +0200
Message-Id: <20180502095659.3626-3-brgl@bgdev.pl>
In-Reply-To: <20180502095659.3626-1-brgl@bgdev.pl>
References: <20180502095659.3626-1-brgl@bgdev.pl>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Sekhar Nori <nsekhar@ti.com>, David Lechner <david@lechnology.com>, Suman Anna <s-anna@ti.com>, Aparna Balasubramanian <aparnab@ti.com>, Kevin Hilman <khilman@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We're currently switching the platform to using the common clock
framework. We need to explicitly prepare and unprepare the rproc
clock.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Suman Anna <s-anna@ti.com>
Reviewed-by: David Lechner <david@lechnology.com>
Reviewed-by: Sekhar Nori <nsekhar@ti.com>
---
 drivers/remoteproc/da8xx_remoteproc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index 2b24291337b7..f134192922e0 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -149,9 +149,9 @@ static int da8xx_rproc_start(struct rproc *rproc)
 
 	writel(rproc->bootaddr, drproc->bootreg);
 
-	ret = clk_enable(dsp_clk);
+	ret = clk_prepare_enable(dsp_clk);
 	if (ret) {
-		dev_err(dev, "clk_enable() failed: %d\n", ret);
+		dev_err(dev, "clk_prepare_enable() failed: %d\n", ret);
 		return ret;
 	}
 
@@ -165,7 +165,7 @@ static int da8xx_rproc_stop(struct rproc *rproc)
 	struct da8xx_rproc *drproc = rproc->priv;
 
 	davinci_clk_reset_assert(drproc->dsp_clk);
-	clk_disable(drproc->dsp_clk);
+	clk_disable_unprepare(drproc->dsp_clk);
 
 	return 0;
 }
-- 
2.17.0
