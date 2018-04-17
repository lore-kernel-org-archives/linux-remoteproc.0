Return-Path: <brgl@bgdev.pl>
Return-Path: <brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v6 3/7] remoteproc/davinci: add the missing retval check for clk_enable()
Date: Tue, 17 Apr 2018 19:30:34 +0200
Message-Id: <20180417173038.25510-4-brgl@bgdev.pl>
In-Reply-To: <20180417173038.25510-1-brgl@bgdev.pl>
References: <20180417173038.25510-1-brgl@bgdev.pl>
To: Suman Anna <s-anna@ti.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, David Lechner <david@lechnology.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The davinci platform is being switched to using the common clock
framework, where clk_enable() can fail. Add the return value check.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Acked-by: Suman Anna <s-anna@ti.com>
Reviewed-by: David Lechner <david@lechnology.com>
---
 drivers/remoteproc/da8xx_remoteproc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index bf3b9034c319..2b24291337b7 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -138,6 +138,7 @@ static int da8xx_rproc_start(struct rproc *rproc)
 	struct device *dev = rproc->dev.parent;
 	struct da8xx_rproc *drproc = (struct da8xx_rproc *)rproc->priv;
 	struct clk *dsp_clk = drproc->dsp_clk;
+	int ret;
 
 	/* hw requires the start (boot) address be on 1KB boundary */
 	if (rproc->bootaddr & 0x3ff) {
@@ -148,7 +149,12 @@ static int da8xx_rproc_start(struct rproc *rproc)
 
 	writel(rproc->bootaddr, drproc->bootreg);
 
-	clk_enable(dsp_clk);
+	ret = clk_enable(dsp_clk);
+	if (ret) {
+		dev_err(dev, "clk_enable() failed: %d\n", ret);
+		return ret;
+	}
+
 	davinci_clk_reset_deassert(dsp_clk);
 
 	return 0;
-- 
2.17.0
