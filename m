Return-Path: <festevam@gmail.com>
Return-Path: <festevam@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] remoteproc: imx: Fix typo in "failed"
Date: Mon,  3 Jun 2019 20:46:28 -0300
Message-Id: <20190603234628.10924-2-festevam@gmail.com>
In-Reply-To: <20190603234628.10924-1-festevam@gmail.com>
References: <20190603234628.10924-1-festevam@gmail.com>
To: bjorn.andersson@linaro.org
Cc: ohad@wizery.com, o.rempel@pengutronix.de, linux-remoteproc@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

There are several places where "failed" is spelled incorrectly.

Fix them all.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/remoteproc/imx_rproc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 54c07fd3f204..7e0804c72677 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -168,7 +168,7 @@ static int imx_rproc_start(struct rproc *rproc)
 	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
 				 dcfg->src_mask, dcfg->src_start);
 	if (ret)
-		dev_err(dev, "Filed to enable M4!\n");
+		dev_err(dev, "Failed to enable M4!\n");
 
 	return ret;
 }
@@ -183,7 +183,7 @@ static int imx_rproc_stop(struct rproc *rproc)
 	ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
 				 dcfg->src_mask, dcfg->src_stop);
 	if (ret)
-		dev_err(dev, "Filed to stop M4!\n");
+		dev_err(dev, "Failed to stop M4!\n");
 
 	return ret;
 }
@@ -206,7 +206,7 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
 		}
 	}
 
-	dev_warn(priv->dev, "Translation filed: da = 0x%llx len = 0x%x\n",
+	dev_warn(priv->dev, "Translation failed: da = 0x%llx len = 0x%x\n",
 		 da, len);
 	return -ENOENT;
 }
@@ -352,7 +352,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 	ret = imx_rproc_addr_init(priv, pdev);
 	if (ret) {
-		dev_err(dev, "filed on imx_rproc_addr_init\n");
+		dev_err(dev, "failed on imx_rproc_addr_init\n");
 		goto err_put_rproc;
 	}
 
-- 
2.17.1
