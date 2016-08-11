Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 2/4] remoteproc: Calculate max_notifyid during load
Date: Thu, 11 Aug 2016 14:52:51 -0700
Message-Id: <1470952373-4823-2-git-send-email-bjorn.andersson@linaro.org>
In-Reply-To: <1470952373-4823-1-git-send-email-bjorn.andersson@linaro.org>
References: <1470952373-4823-1-git-send-email-bjorn.andersson@linaro.org>
To: linux-remoteproc@vger.kernel.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>, Lee Jones <lee.jones@linaro.org>, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The calculation of max_notifyid must only be done before we call start()
on the remoteproc drivers, so move the calculation to be part of the
loading steps.

Cc: Lee Jones <lee.jones@linaro.org>
Cc: Loic Pallardy <loic.pallardy@st.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 drivers/remoteproc/remoteproc_core.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 5ca98039e494..f484e04810f3 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -697,17 +697,13 @@ static rproc_handle_resource_t rproc_loading_handlers[RSC_LAST] = {
 	[RSC_CARVEOUT] = (rproc_handle_resource_t)rproc_handle_carveout,
 	[RSC_DEVMEM] = (rproc_handle_resource_t)rproc_handle_devmem,
 	[RSC_TRACE] = (rproc_handle_resource_t)rproc_handle_trace,
-	[RSC_VDEV] = NULL, /* VDEVs were handled upon registrarion */
+	[RSC_VDEV] = (rproc_handle_resource_t)rproc_count_vrings,
 };
 
 static rproc_handle_resource_t rproc_vdev_handler[RSC_LAST] = {
 	[RSC_VDEV] = (rproc_handle_resource_t)rproc_handle_vdev,
 };
 
-static rproc_handle_resource_t rproc_count_vrings_handler[RSC_LAST] = {
-	[RSC_VDEV] = (rproc_handle_resource_t)rproc_count_vrings,
-};
-
 /* handle firmware resource entries before booting the remote processor */
 static int rproc_handle_resources(struct rproc *rproc, int len,
 				  rproc_handle_resource_t handlers[RSC_LAST])
@@ -836,6 +832,9 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 		goto clean_up;
 	}
 
+	/* reset max_notifyid */
+	rproc->max_notifyid = -1;
+
 	/* handle fw resources which are required to boot rproc */
 	ret = rproc_handle_resources(rproc, tablesz, rproc_loading_handlers);
 	if (ret) {
@@ -923,13 +922,6 @@ static void rproc_fw_config_virtio(const struct firmware *fw, void *context)
 
 	rproc->table_ptr = rproc->cached_table;
 
-	/* count the number of notify-ids */
-	rproc->max_notifyid = -1;
-	ret = rproc_handle_resources(rproc, tablesz,
-				     rproc_count_vrings_handler);
-	if (ret)
-		goto out;
-
 	/* look for virtio devices and register them */
 	ret = rproc_handle_resources(rproc, tablesz, rproc_vdev_handler);
 
-- 
2.5.0
