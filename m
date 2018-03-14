Return-Path: <christophe.jaillet@wanadoo.fr>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 3/3] remoteproc: imx_rproc: Slightly simplify code in 'imx_rproc_probe()'
Date: Wed, 14 Mar 2018 20:56:39 +0100
Message-Id: <fbc1425293b6540a6fc835264fba2b71f2b63444.1521057013.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1521057013.git.christophe.jaillet@wanadoo.fr>
References: <cover.1521057013.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1521057013.git.christophe.jaillet@wanadoo.fr>
References: <cover.1521057013.git.christophe.jaillet@wanadoo.fr>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
List-ID: <linux-remoteproc@vger.kernel.org>

We can return directly at the beginning of the function and save the 'err'
label.
We can also explicitly return 0 when the probe succeed.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/remoteproc/imx_rproc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 6d02ef62a626..54c07fd3f204 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -333,10 +333,8 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	/* set some other name then imx */
 	rproc = rproc_alloc(dev, "imx-rproc", &imx_rproc_ops,
 			    NULL, sizeof(*priv));
-	if (!rproc) {
-		ret = -ENOMEM;
-		goto err;
-	}
+	if (!rproc)
+		return -ENOMEM;
 
 	dcfg = of_device_get_match_data(dev);
 	if (!dcfg) {
@@ -381,13 +379,13 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		goto err_put_clk;
 	}
 
-	return ret;
+	return 0;
 
 err_put_clk:
 	clk_disable_unprepare(priv->clk);
 err_put_rproc:
 	rproc_free(rproc);
-err:
+
 	return ret;
 }
 
-- 
2.14.1
