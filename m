Return-Path: <peng.fan@nxp.com>
From: peng.fan@nxp.com
Subject: [PATCH 3/9] remoteproc: add support to skip firmware load when recovery
Date: Wed, 19 Feb 2020 15:27:39 +0800
Message-Id: <1582097265-20170-4-git-send-email-peng.fan@nxp.com>
In-Reply-To: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
References: <1582097265-20170-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
Return-Path: peng.fan@nxp.com
MIME-Version: 1.0
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: linux-imx@nxp.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Peng Fan <peng.fan@nxp.com>

Remote processor such as M4 inside i.MX8QXP is not handled by Linux
when it is configured to run inside its own hardware partition by
system control unit(SCU). So even remote processor crash reset, it is
handled by SCU, not linux. To such case, firmware load should be
ignored, So introduce skip_fw_load_recovery and platform driver
should set it if needed.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_core.c | 19 +++++++++++--------
 include/linux/remoteproc.h           |  1 +
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 876b5420a32b..ca310e3582bf 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1678,20 +1678,23 @@ int rproc_trigger_recovery(struct rproc *rproc)
 	if (ret)
 		goto unlock_mutex;
 
-	/* generate coredump */
-	rproc_coredump(rproc);
+	if (!rproc->skip_fw_load_recovery) {
+		/* generate coredump */
+		rproc_coredump(rproc);
 
-	/* load firmware */
-	ret = request_firmware(&firmware_p, rproc->firmware, dev);
-	if (ret < 0) {
-		dev_err(dev, "request_firmware failed: %d\n", ret);
-		goto unlock_mutex;
+		/* load firmware */
+		ret = request_firmware(&firmware_p, rproc->firmware, dev);
+		if (ret < 0) {
+			dev_err(dev, "request_firmware failed: %d\n", ret);
+			goto unlock_mutex;
+		}
 	}
 
 	/* boot the remote processor up again */
 	ret = rproc_start(rproc, firmware_p);
 
-	release_firmware(firmware_p);
+	if (!rproc->skip_fw_load_recovery)
+		release_firmware(firmware_p);
 
 unlock_mutex:
 	mutex_unlock(&rproc->lock);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 4fd5bedab4fa..fe6ee253b385 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -514,6 +514,7 @@ struct rproc {
 	bool has_iommu;
 	bool auto_boot;
 	bool skip_fw_load;
+	bool skip_fw_load_recovery;
 	struct list_head dump_segments;
 	int nb_vdev;
 };
-- 
2.16.4
