Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45241 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728343AbgCXWDq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Mar 2020 18:03:46 -0400
Received: by mail-pf1-f196.google.com with SMTP id j10so10011726pfi.12
        for <linux-remoteproc@vger.kernel.org>; Tue, 24 Mar 2020 15:03:46 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH 11/11] remoteproc: stm32: Allocate rproc for synchronisation with MCU
Date: Tue, 24 Mar 2020 16:03:29 -0600
Message-Id: <20200324220329.15523-12-mathieu.poirier@linaro.org>
In-Reply-To: <20200324220329.15523-1-mathieu.poirier@linaro.org>
References: <20200324220329.15523-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: bjorn.andersson@linaro.org
Cc: ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Allocate remote processor structure with state machine if the MCU
has already been started by an external entity.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 07be306c0fb1..f320ef9ee286 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -608,7 +608,7 @@ static struct rproc_ops st_rproc_ops = {
 	.get_boot_addr	= rproc_elf_get_boot_addr,
 };
 
-static __maybe_unused struct rproc_ops st_rproc_sync_ops = {
+static struct rproc_ops st_rproc_sync_ops = {
 	.start		= stm32_rproc_sync_start,
 	.stop		= stm32_rproc_sync_stop,
 	.kick		= stm32_rproc_kick,
@@ -616,6 +616,12 @@ static __maybe_unused struct rproc_ops st_rproc_sync_ops = {
 	.find_loaded_rsc_table = stm32_rproc_sync_elf_find_loaded_rsc_table,
 };
 
+static struct rproc_sync_states st_sync_states = {
+	.on_init = true, /* sync with MCU when the kernel boots */
+	.after_stop = false, /* don't resync with MCU if stopped from sysfs */
+	.after_crash = false, /* don't resync with MCU after a crash */
+};
+
 static const struct of_device_id stm32_rproc_match[] = {
 	{ .compatible = "st,stm32mp1-m4" },
 	{},
@@ -847,15 +853,22 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 		ret = stm32_rproc_get_loaded_rsc_table(pdev, ddata);
 		if (ret)
 			goto free_ddata;
+
+		rproc = rproc_alloc_state_machine(dev, np->name, &st_rproc_ops,
+						  &st_rproc_sync_ops,
+						  &st_sync_states, NULL,
+						  sizeof(*ddata));
+	} else {
+		rproc = rproc_alloc(dev, np->name, &st_rproc_ops,
+				    NULL, sizeof(*ddata));
+		rproc->auto_boot = auto_boot;
 	}
 
-	rproc = rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
 	if (!rproc) {
 		ret = -ENOMEM;
 		goto free_ddata;
 	}
 
-	rproc->auto_boot = auto_boot;
 	rproc->has_iommu = false;
 	ddata->workqueue = create_workqueue(dev_name(dev));
 	if (!ddata->workqueue) {
-- 
2.20.1
