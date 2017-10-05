Return-Path: <dan.carpenter@oracle.com>
Date: Thu, 5 Oct 2017 15:58:27 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] remoteproc: imx_rproc: fix a couple off by one bugs
Message-ID: <20171005125827.sfnrpmqhrgmpy3fp@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Ohad Ben-Cohen <ohad@wizery.com>, Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

The priv->mem[] array has IMX7D_RPROC_MEM_MAX elements so the > should
be >= to avoid writing one element beyond the end of the array.

Fixes: a0ff4aa6f010 ("remoteproc: imx_rproc: add a NXP/Freescale imx_rproc driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 612d91403341..81ba44510b75 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -264,7 +264,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		if (!(att->flags & ATT_OWN))
 			continue;
 
-		if (b > IMX7D_RPROC_MEM_MAX)
+		if (b >= IMX7D_RPROC_MEM_MAX)
 			break;
 
 		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev,
@@ -296,7 +296,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 			return err;
 		}
 
-		if (b > IMX7D_RPROC_MEM_MAX)
+		if (b >= IMX7D_RPROC_MEM_MAX)
 			break;
 
 		priv->mem[b].cpu_addr = devm_ioremap_resource(&pdev->dev, &res);
