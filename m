Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH v2 14/17] remoteproc: Refactor function rproc_trigger_recovery()
Date: Tue, 24 Mar 2020 15:46:00 -0600
Message-Id: <20200324214603.14979-15-mathieu.poirier@linaro.org>
In-Reply-To: <20200324214603.14979-1-mathieu.poirier@linaro.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org
Cc: ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Refactor function rproc_trigger_recovery() in order to avoid
reloading the fw image when synchronising with an MCU rather than
booting it.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index d3c4d7e6ca25..dbb0a8467205 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1661,7 +1661,7 @@ static void rproc_coredump(struct rproc *rproc)
  */
 int rproc_trigger_recovery(struct rproc *rproc)
 {
-	const struct firmware *firmware_p;
+	const struct firmware *firmware_p = NULL;
 	struct device *dev = &rproc->dev;
 	int ret;
 
@@ -1678,14 +1678,16 @@ int rproc_trigger_recovery(struct rproc *rproc)
 	/* generate coredump */
 	rproc_coredump(rproc);
 
-	/* load firmware */
-	ret = request_firmware(&firmware_p, rproc->firmware, dev);
-	if (ret < 0) {
-		dev_err(dev, "request_firmware failed: %d\n", ret);
-		goto unlock_mutex;
+	/* load firmware if need be */
+	if (!rproc_sync_with_mcu(rproc)) {
+		ret = request_firmware(&firmware_p, rproc->firmware, dev);
+		if (ret < 0) {
+			dev_err(dev, "request_firmware failed: %d\n", ret);
+			goto unlock_mutex;
+		}
 	}
 
-	/* boot the remote processor up again */
+	/* boot up or synchronise with the remote processor again */
 	ret = rproc_start(rproc, firmware_p);
 
 	release_firmware(firmware_p);
-- 
2.20.1
