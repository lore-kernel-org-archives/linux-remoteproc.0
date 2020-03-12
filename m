Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH 11/18] remoteproc: Repurpose function rproc_trigger_auto_boot()
Date: Thu, 12 Mar 2020 16:11:51 -0600
Message-Id: <20200312221158.3613-12-mathieu.poirier@linaro.org>
In-Reply-To: <20200312221158.3613-1-mathieu.poirier@linaro.org>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

Repurpose function rproc_trigger_auto_boot() so that it can deal with
scenarios where the MCU is already running.  As such give it a new name
to better represent the capabilities and add a call to rproc_actuate()
if instructed by the platform code to synchronise with the MCU rather
than boot it from scratch.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 7faee1396ef7..d57b47b0d6be 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -51,6 +51,8 @@ static int rproc_alloc_carveout(struct rproc *rproc,
 				struct rproc_mem_entry *mem);
 static int rproc_release_carveout(struct rproc *rproc,
 				  struct rproc_mem_entry *mem);
+static int rproc_actuate(struct rproc *rproc,
+			 const struct firmware *firmware_p);
 
 /* Unique indices for remoteproc devices */
 static DEFINE_IDA(rproc_dev_index);
@@ -1444,10 +1446,17 @@ static void rproc_auto_boot_callback(const struct firmware *fw, void *context)
 	release_firmware(fw);
 }
 
-static int rproc_trigger_auto_boot(struct rproc *rproc)
+static int rproc_trigger_auto_initiate(struct rproc *rproc)
 {
 	int ret;
 
+	/*
+	 * The MCU is already booted, all we need to do is synchronise with it.
+	 * No point dealing with a firmware image.
+	 */
+	if (rproc_sync_with_mcu(rproc))
+		return rproc_actuate(rproc, NULL);
+
 	/*
 	 * We're initiating an asynchronous firmware loading, so we can
 	 * be built-in kernel code, without hanging the boot process.
@@ -1931,9 +1940,12 @@ int rproc_add(struct rproc *rproc)
 	/* create debugfs entries */
 	rproc_create_debug_dir(rproc);
 
-	/* if rproc is marked always-on, request it to boot */
+	/*
+	 * if rproc is marked always-on, request it to boot or synchronise
+	 * with it.
+	 */
 	if (rproc->auto_boot) {
-		ret = rproc_trigger_auto_boot(rproc);
+		ret = rproc_trigger_auto_initiate(rproc);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.20.1
