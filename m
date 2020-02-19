Return-Path: <peng.fan@nxp.com>
From: peng.fan@nxp.com
Subject: [PATCH 9/9] remoteproc: imx_rproc: add i.MX8MM support
Date: Wed, 19 Feb 2020 15:27:45 +0800
Message-Id: <1582097265-20170-10-git-send-email-peng.fan@nxp.com>
In-Reply-To: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
References: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
Return-Path: peng.fan@nxp.com
MIME-Version: 1.0
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: linux-imx@nxp.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Peng Fan <peng.fan@nxp.com>

Add i.MX8MM support. Remote processor is under control of Cortex-A
processor. Currently only early boot is supported.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index fc2a504bc350..d00c3cbcd87c 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -56,6 +56,7 @@
 enum imx_rproc_variants {
 	IMX8QM,
 	IMX8QXP,
+	IMX8MM,
 	IMX7ULP,
 	IMX7D,
 	IMX6SX,
@@ -194,6 +195,10 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qm = {
 	.variant	= IMX8QM,
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mm = {
+	.variant	= IMX8MM,
+};
+
 static int imx_rproc_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -788,6 +793,7 @@ static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx6sx-cm4", .data = &imx_rproc_cfg_imx6sx },
 	{ .compatible = "fsl,imx8qxp-cm4", .data = &imx_rproc_cfg_imx8qxp },
 	{ .compatible = "fsl,imx8qm-cm4", .data = &imx_rproc_cfg_imx8qm },
+	{ .compatible = "fsl,imx8mm-cm4", .data = &imx_rproc_cfg_imx8mm },
 	{},
 };
 MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
-- 
2.16.4
