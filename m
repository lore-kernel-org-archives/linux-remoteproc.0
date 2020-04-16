Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [RFC 10/18] remoteproc: Add capability to populate rproc subnode devices
Date: Thu, 16 Apr 2020 18:13:23 +0200
Message-ID: <20200416161331.7606-11-arnaud.pouliquen@st.com>
In-Reply-To: <20200416161331.7606-1-arnaud.pouliquen@st.com>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, arnaud.pouliquen@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

Add the capability to add rproc sub nodes in device tree.
Devices declared as rproc sub node will be probed
before the remote firmware boot sequence.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index c9e07c53ed0c..75f84fd3bd60 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1605,6 +1605,26 @@ static void rproc_crash_handler_work(struct work_struct *work)
 		rproc_trigger_recovery(rproc);
 }
 
+static int rproc_platform_populate(struct rproc *rproc)
+{
+	struct device *dev = rproc->dev.parent;
+	int ret;
+
+	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
+	if (ret < 0) {
+		dev_err(dev, "failed to populate child devices (%d)\n", ret);
+
+		goto depopulate;
+	}
+
+	return 0;
+
+depopulate:
+	of_platform_depopulate(dev);
+
+	return ret;
+}
+
 /**
  * rproc_boot() - boot a remote processor
  * @rproc: handle of a remote processor
@@ -1629,6 +1649,10 @@ int rproc_boot(struct rproc *rproc)
 
 	dev = &rproc->dev;
 
+	ret = rproc_platform_populate(rproc);
+	if (ret)
+		return ret;
+
 	ret = mutex_lock_interruptible(&rproc->lock);
 	if (ret) {
 		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
@@ -1735,6 +1759,7 @@ void rproc_shutdown(struct rproc *rproc)
 	rproc->table_ptr = NULL;
 out:
 	mutex_unlock(&rproc->lock);
+	of_platform_depopulate(rproc->dev.parent);
 }
 EXPORT_SYMBOL(rproc_shutdown);
 
-- 
2.17.1
