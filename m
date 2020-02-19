Return-Path: <peng.fan@nxp.com>
From: peng.fan@nxp.com
Subject: [PATCH 6/9] remoteproc: imx_proc: enable virtio/mailbox
Date: Wed, 19 Feb 2020 15:27:42 +0800
Message-Id: <1582097265-20170-7-git-send-email-peng.fan@nxp.com>
In-Reply-To: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
References: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
Return-Path: peng.fan@nxp.com
MIME-Version: 1.0
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: linux-imx@nxp.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Peng Fan <peng.fan@nxp.com>

Use virtio/mailbox to build connection between Remote Proccessors
and Linux. Add delayed work to handle incoming messages.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 106 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 102 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index e31ea1090cf3..36dec1ce4f50 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -7,14 +7,18 @@
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
+#include <linux/mailbox_client.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
 
+#include "remoteproc_internal.h"
+
 #define IMX7D_SRC_SCR			0x0C
 #define IMX7D_ENABLE_M4			BIT(3)
 #define IMX7D_SW_M4P_RST		BIT(2)
@@ -87,6 +91,10 @@ struct imx_rproc {
 	struct imx_rproc_mem		mem[IMX7D_RPROC_MEM_MAX];
 	struct clk			*clk;
 	bool				early_boot;
+	struct mbox_client		cl;
+	struct mbox_chan		*tx_ch;
+	struct mbox_chan		*rx_ch;
+	struct delayed_work		rproc_work;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx7d[] = {
@@ -402,9 +410,25 @@ static u32 imx_rproc_elf_get_boot_addr(struct rproc *rproc,
 	return 0;
 }
 
+static void imx_rproc_kick(struct rproc *rproc, int vqid)
+{
+	struct imx_rproc *priv = rproc->priv;
+	int err;
+	__u32 mmsg;
+
+	mmsg = vqid << 16;
+
+	priv->cl.tx_tout = 20;
+	err = mbox_send_message(priv->tx_ch, (void *)&mmsg);
+	if (err < 0)
+		dev_err(priv->dev, "%s: failed (%d, err:%d)\n",
+			__func__, vqid, err);
+}
+
 static const struct rproc_ops imx_rproc_ops = {
 	.start		= imx_rproc_start,
 	.stop		= imx_rproc_stop,
+	.kick		= imx_rproc_kick,
 	.da_to_va       = imx_rproc_da_to_va,
 	.load		= imx_rproc_elf_load_segments,
 	.parse_fw	= imx_rproc_parse_fw,
@@ -503,6 +527,67 @@ static int imx_rproc_configure_mode(struct imx_rproc *priv)
 	return 0;
 }
 
+static void imx_rproc_vq_work(struct work_struct *work)
+{
+	struct delayed_work *dwork = to_delayed_work(work);
+	struct imx_rproc *priv = container_of(dwork, struct imx_rproc,
+					      rproc_work);
+
+	rproc_vq_interrupt(priv->rproc, 0);
+	rproc_vq_interrupt(priv->rproc, 1);
+}
+
+static void imx_rproc_rx_callback(struct mbox_client *cl, void *msg)
+{
+	struct rproc *rproc = dev_get_drvdata(cl->dev);
+	struct imx_rproc *priv = rproc->priv;
+
+	schedule_delayed_work(&(priv->rproc_work), 0);
+}
+
+static int imx_rproc_xtr_mbox_init(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	struct device *dev = priv->dev;
+	struct mbox_client *cl;
+	int ret = 0;
+
+	cl = &priv->cl;
+	cl->dev = dev;
+	cl->tx_block = true;
+	cl->tx_tout = 20;
+	cl->knows_txdone = false;
+	cl->rx_callback = imx_rproc_rx_callback;
+
+	priv->tx_ch = mbox_request_channel_byname(cl, "tx");
+	if (IS_ERR(priv->tx_ch)) {
+		if (PTR_ERR(priv->tx_ch) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		ret = PTR_ERR(priv->tx_ch);
+		dev_dbg(cl->dev, "failed to request mbox tx chan, ret %d\n",
+			ret);
+		goto err_out;
+	}
+
+	priv->rx_ch = mbox_request_channel_byname(cl, "rx");
+	if (IS_ERR(priv->rx_ch)) {
+		ret = PTR_ERR(priv->rx_ch);
+		dev_dbg(cl->dev, "failed to request mbox rx chan, ret %d\n",
+			ret);
+		goto err_out;
+	}
+
+	return ret;
+
+err_out:
+	if (!IS_ERR(priv->tx_ch))
+		mbox_free_channel(priv->tx_ch);
+	if (!IS_ERR(priv->rx_ch))
+		mbox_free_channel(priv->rx_ch);
+
+	return ret;
+}
+
 static int imx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -543,22 +628,28 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, rproc);
 
+	ret = imx_rproc_xtr_mbox_init(rproc);
+	if (ret) {
+		if (ret == -EPROBE_DEFER)
+			goto err_put_rproc;
+	}
+
 	ret = imx_rproc_configure_mode(priv);
 	if (ret)
-		goto err_put_rproc;
+		goto err_put_mbox;
 
 	if (!priv->early_boot) {
 		ret = imx_rproc_addr_init(priv, pdev);
 		if (ret) {
 			dev_err(dev, "failed on imx_rproc_addr_init\n");
-			goto err_put_rproc;
+			goto err_put_mbox;
 		}
 
 		priv->clk = devm_clk_get(dev, NULL);
 		if (IS_ERR(priv->clk)) {
 			dev_err(dev, "Failed to get clock\n");
 			ret = PTR_ERR(priv->clk);
-			goto err_put_rproc;
+			goto err_put_mbox;
 		}
 
 		/*
@@ -568,10 +659,12 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		ret = clk_prepare_enable(priv->clk);
 		if (ret) {
 			dev_err(&rproc->dev, "Failed to enable clock\n");
-			goto err_put_rproc;
+			goto err_put_mbox;
 		}
 	}
 
+	INIT_DELAYED_WORK(&(priv->rproc_work), imx_rproc_vq_work);
+
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed\n");
@@ -583,6 +676,11 @@ static int imx_rproc_probe(struct platform_device *pdev)
 err_put_clk:
 	if (!priv->early_boot)
 		clk_disable_unprepare(priv->clk);
+err_put_mbox:
+	if (!IS_ERR(priv->tx_ch))
+		mbox_free_channel(priv->tx_ch);
+	if (!IS_ERR(priv->rx_ch))
+		mbox_free_channel(priv->rx_ch);
 err_put_rproc:
 	rproc_free(rproc);
 
-- 
2.16.4
