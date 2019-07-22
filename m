Return-Path: <paul@crapouillou.net>
From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/3] remoteproc: Add prepare/unprepare callbacks
Date: Sun, 21 Jul 2019 22:31:39 -0400
Message-Id: <20190722023140.14701-2-paul@crapouillou.net>
In-Reply-To: <20190722023140.14701-1-paul@crapouillou.net>
References: <20190722023140.14701-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, od@zcrc.me, Paul Cercueil <paul@crapouillou.net>
List-ID: <linux-remoteproc@vger.kernel.org>

The .prepare() callback is called before the firmware is loaded to
memory. This is useful for instance in the case where some setup is
required for the memory to be accessible.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/remoteproc/remoteproc_core.c | 16 +++++++++++++++-
 include/linux/remoteproc.h           |  4 ++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 3c5fbbbfb0f1..68faad3ef0c1 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1300,11 +1300,19 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	struct device *dev = &rproc->dev;
 	int ret;
 
+	if (rproc->ops->prepare) {
+		ret = rproc->ops->prepare(rproc);
+		if (ret) {
+			dev_err(dev, "Failed to prepare rproc: %d\n", ret);
+			return ret;
+		}
+	}
+
 	/* load the ELF segments to memory */
 	ret = rproc_load_segments(rproc, fw);
 	if (ret) {
 		dev_err(dev, "Failed to load program segments: %d\n", ret);
-		return ret;
+		goto unprepare_rproc;
 	}
 
 	/*
@@ -1355,6 +1363,9 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	rproc_unprepare_subdevices(rproc);
 reset_table_ptr:
 	rproc->table_ptr = rproc->cached_table;
+unprepare_rproc:
+	if (rproc->ops->unprepare)
+		rproc->ops->unprepare(rproc);
 
 	return ret;
 }
@@ -1484,6 +1495,9 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 
 	rproc->state = RPROC_OFFLINE;
 
+	if (rproc->ops->unprepare)
+		rproc->ops->unprepare(rproc);
+
 	dev_info(dev, "stopped remote processor %s\n", rproc->name);
 
 	return 0;
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 16ad66683ad0..be65c2a92c58 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -355,6 +355,8 @@ enum rsc_handling_status {
 
 /**
  * struct rproc_ops - platform-specific device handlers
+ * @prepare:	prepare the device for power up (before the firmware is loaded)
+ * @unprepare:	unprepare the device after it is stopped
  * @start:	power on the device and boot it
  * @stop:	power off the device
  * @kick:	kick a virtqueue (virtqueue id given as a parameter)
@@ -371,6 +373,8 @@ enum rsc_handling_status {
  * @get_boot_addr:	get boot address to entry point specified in firmware
  */
 struct rproc_ops {
+	int (*prepare)(struct rproc *rproc);
+	void (*unprepare)(struct rproc *rproc);
 	int (*start)(struct rproc *rproc);
 	int (*stop)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
-- 
2.21.0.593.g511ec345e18
