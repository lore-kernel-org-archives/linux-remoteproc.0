Return-Path: <fabien.dessenne@st.com>
From: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [PATCH v2] remoteproc: stm32: fix probe error case
Date: Mon, 7 Oct 2019 09:39:51 +0200
Message-ID: <1570433991-16353-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc: Fabien Dessenne <fabien.dessenne@st.com>, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

If the rproc driver is probed before the mailbox driver and if the rproc
Device Tree node has some mailbox properties, the rproc driver probe
shall be deferred instead of being probed without mailbox support.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
Changes since v1: test IS_ERR() before checking PTR_ERR()
---
 drivers/remoteproc/stm32_rproc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 2cf4b29..a507332 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -310,7 +310,7 @@ static const struct stm32_mbox stm32_rproc_mbox[MBOX_NB_MBX] = {
 	}
 };
 
-static void stm32_rproc_request_mbox(struct rproc *rproc)
+static int stm32_rproc_request_mbox(struct rproc *rproc)
 {
 	struct stm32_rproc *ddata = rproc->priv;
 	struct device *dev = &rproc->dev;
@@ -329,10 +329,14 @@ static void stm32_rproc_request_mbox(struct rproc *rproc)
 
 		ddata->mb[i].chan = mbox_request_channel_byname(cl, name);
 		if (IS_ERR(ddata->mb[i].chan)) {
+			if (PTR_ERR(ddata->mb[i].chan) == -EPROBE_DEFER)
+				return -EPROBE_DEFER;
 			dev_warn(dev, "cannot get %s mbox\n", name);
 			ddata->mb[i].chan = NULL;
 		}
 	}
+
+	return 0;
 }
 
 static int stm32_rproc_set_hold_boot(struct rproc *rproc, bool hold)
@@ -596,7 +600,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	stm32_rproc_request_mbox(rproc);
+	ret = stm32_rproc_request_mbox(rproc);
+	if (ret)
+		goto free_rproc;
 
 	ret = rproc_add(rproc);
 	if (ret)
-- 
2.7.4
