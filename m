Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 2/4] remoteproc: st: add virtio communication support
Date: Tue, 31 Jan 2017 13:35:54 +0100
Message-ID: <1485866156-6364-3-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1485866156-6364-1-git-send-email-loic.pallardy@st.com>
References: <1485866156-6364-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com, hugues.fruchet@st.com, peter.griffin@linaro.org, Ludovic Barre <ludovic.barre@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch provides virtio communication support based on mailbox
for ST co-processors.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
Changes from V2:
- Flatten mailbox channel to simplify mailbox management
- Flip test condition to simplify code
- Move clk_unprepare in a dedicated fix patch
- Add missing Signed-off-by

Changes from V1:
- fix typos
- fix mailbox allocation per co-processor
---
 drivers/remoteproc/Kconfig         |   3 +
 drivers/remoteproc/st_remoteproc.c | 113 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 114 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 8f9cf0b..108add8 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -111,6 +111,9 @@ config ST_REMOTEPROC
 	tristate "ST remoteproc support"
 	depends on ARCH_STI
 	depends on REMOTEPROC
+	select MAILBOX
+	select STI_MBOX
+	select RPMSG_VIRTIO
 	help
 	  Say y here to support ST's adjunct processors via the remote
 	  processor framework.
diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
index bdfab49..f1e9339 100644
--- a/drivers/remoteproc/st_remoteproc.c
+++ b/drivers/remoteproc/st_remoteproc.c
@@ -15,6 +15,7 @@
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
+#include <linux/mailbox_client.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -25,6 +26,16 @@
 #include <linux/remoteproc.h>
 #include <linux/reset.h>
 
+#include "remoteproc_internal.h"
+
+#define ST_RPROC_VQ0		0
+#define ST_RPROC_VQ1		1
+#define ST_RPROC_MAX_VRING	2
+
+#define MBOX_RX			0
+#define MBOX_TX			1
+#define MBOX_MAX		2
+
 struct st_rproc_config {
 	bool			sw_reset;
 	bool			pwr_reset;
@@ -39,8 +50,47 @@ struct st_rproc {
 	u32			clk_rate;
 	struct regmap		*boot_base;
 	u32			boot_offset;
+	struct mbox_chan	*mbox_chan[ST_RPROC_MAX_VRING * MBOX_MAX];
+	struct mbox_client mbox_client_vq0;
+	struct mbox_client mbox_client_vq1;
 };
 
+static void st_rproc_mbox_callback(struct device *dev, u32 msg)
+{
+	struct rproc *rproc = dev_get_drvdata(dev);
+
+	if (rproc_vq_interrupt(rproc, msg) == IRQ_NONE)
+		dev_dbg(dev, "no message was found in vqid %d\n", msg);
+}
+
+static
+void st_rproc_mbox_callback_vq0(struct mbox_client *mbox_client, void *data)
+{
+	st_rproc_mbox_callback(mbox_client->dev, 0);
+}
+
+static
+void st_rproc_mbox_callback_vq1(struct mbox_client *mbox_client, void *data)
+{
+	st_rproc_mbox_callback(mbox_client->dev, 1);
+}
+
+static void st_rproc_kick(struct rproc *rproc, int vqid)
+{
+	struct st_rproc *ddata = rproc->priv;
+	struct device *dev = rproc->dev.parent;
+	int ret;
+
+	/* send the index of the triggered virtqueue in the mailbox payload */
+	if (WARN_ON(vqid >= ST_RPROC_MAX_VRING))
+		return;
+
+	ret = mbox_send_message(ddata->mbox_chan[vqid * MBOX_MAX + MBOX_TX],
+				(void *)&vqid);
+	if (ret < 0)
+		dev_err(dev, "failed to send message via mbox: %d\n", ret);
+}
+
 static int st_rproc_start(struct rproc *rproc)
 {
 	struct st_rproc *ddata = rproc->priv;
@@ -108,6 +158,7 @@ static int st_rproc_stop(struct rproc *rproc)
 }
 
 static struct rproc_ops st_rproc_ops = {
+	.kick		= st_rproc_kick,
 	.start		= st_rproc_start,
 	.stop		= st_rproc_stop,
 };
@@ -221,8 +272,9 @@ static int st_rproc_probe(struct platform_device *pdev)
 	struct st_rproc *ddata;
 	struct device_node *np = dev->of_node;
 	struct rproc *rproc;
+	struct mbox_chan *chan;
 	int enabled;
-	int ret;
+	int ret, i;
 
 	match = of_match_device(st_rproc_match, dev);
 	if (!match || !match->data) {
@@ -257,12 +309,65 @@ static int st_rproc_probe(struct platform_device *pdev)
 		clk_set_rate(ddata->clk, ddata->clk_rate);
 	}
 
+	if (of_get_property(np, "mbox-names", NULL)) {
+		ddata->mbox_client_vq0.dev		= dev;
+		ddata->mbox_client_vq0.tx_done		= NULL;
+		ddata->mbox_client_vq0.tx_block	= false;
+		ddata->mbox_client_vq0.knows_txdone	= false;
+		ddata->mbox_client_vq0.rx_callback	= st_rproc_mbox_callback_vq0;
+
+		ddata->mbox_client_vq1.dev		= dev;
+		ddata->mbox_client_vq1.tx_done		= NULL;
+		ddata->mbox_client_vq1.tx_block	= false;
+		ddata->mbox_client_vq1.knows_txdone	= false;
+		ddata->mbox_client_vq1.rx_callback	= st_rproc_mbox_callback_vq1;
+
+		/*
+		 * To control a co-processor without IPC mechanism.
+		 * This driver can be used without mbox and rpmsg.
+		 */
+		chan = mbox_request_channel_byname(&ddata->mbox_client_vq0, "vq0_rx");
+		if (IS_ERR(chan)) {
+			dev_err(&rproc->dev, "failed to request mbox chan 0\n");
+			ret = PTR_ERR(chan);
+			goto free_clk;
+		}
+		ddata->mbox_chan[ST_RPROC_VQ0 * MBOX_MAX + MBOX_RX] = chan;
+
+		chan = mbox_request_channel_byname(&ddata->mbox_client_vq0, "vq0_tx");
+		if (IS_ERR(chan)) {
+			dev_err(&rproc->dev, "failed to request mbox chan 0\n");
+			ret = PTR_ERR(chan);
+			goto free_mbox;
+		}
+		ddata->mbox_chan[ST_RPROC_VQ0 * MBOX_MAX + MBOX_TX] = chan;
+
+		chan = mbox_request_channel_byname(&ddata->mbox_client_vq1, "vq1_rx");
+		if (IS_ERR(chan)) {
+			dev_err(&rproc->dev, "failed to request mbox chan 1\n");
+			ret = PTR_ERR(chan);
+			goto free_mbox;
+		}
+		ddata->mbox_chan[ST_RPROC_VQ1 * MBOX_MAX + MBOX_RX] = chan;
+
+		chan = mbox_request_channel_byname(&ddata->mbox_client_vq1, "vq1_tx");
+		if (IS_ERR(chan)) {
+			dev_err(&rproc->dev, "failed to request mbox chan 1\n");
+			ret = PTR_ERR(chan);
+			goto free_mbox;
+		}
+		ddata->mbox_chan[ST_RPROC_VQ1 * MBOX_MAX + MBOX_TX] = chan;
+	}
+
 	ret = rproc_add(rproc);
 	if (ret)
-		goto free_clk;
+		goto free_mbox;
 
 	return 0;
 
+free_mbox:
+	for (i = 0; i < ST_RPROC_MAX_VRING * MBOX_MAX; i++)
+		mbox_free_channel(ddata->mbox_chan[i]);
 free_clk:
 	clk_unprepare(ddata->clk);
 free_rproc:
@@ -274,6 +379,7 @@ static int st_rproc_remove(struct platform_device *pdev)
 {
 	struct rproc *rproc = platform_get_drvdata(pdev);
 	struct st_rproc *ddata = rproc->priv;
+	int i;
 
 	rproc_del(rproc);
 
@@ -281,6 +387,9 @@ static int st_rproc_remove(struct platform_device *pdev)
 
 	of_reserved_mem_device_release(&pdev->dev);
 
+	for (i = 0; i < ST_RPROC_MAX_VRING * MBOX_MAX; i++)
+		mbox_free_channel(ddata->mbox_chan[i]);
+
 	rproc_free(rproc);
 
 	return 0;
-- 
1.9.1
