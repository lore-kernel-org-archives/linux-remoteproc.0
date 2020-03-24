Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44405 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727270AbgCXVqS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 17:46:18 -0400
Received: by mail-pl1-f193.google.com with SMTP id h11so7955157plr.11
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 14:46:17 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH v2 11/17] remoteproc: Repurpose function rproc_trigger_auto_boot()
Date: Tue, 24 Mar 2020 15:45:57 -0600
Message-Id: <20200324214603.14979-12-mathieu.poirier@linaro.org>
In-Reply-To: <20200324214603.14979-1-mathieu.poirier@linaro.org>
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: bjorn.andersson@linaro.org
Cc: ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com, linux-remoteproc@vger.kernel.org
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
