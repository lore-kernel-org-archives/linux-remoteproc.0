Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH v3 3/4] remoteproc: Split rproc_ops allocation from rproc_alloc()
Date: Mon, 20 Apr 2020 17:16:00 -0600
Message-Id: <20200420231601.16781-4-mathieu.poirier@linaro.org>
In-Reply-To: <20200420231601.16781-1-mathieu.poirier@linaro.org>
References: <20200420231601.16781-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: elder@linaro.org, s-anna@ti.com, Markus.Elfring@web.de, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Make the rproc_ops allocation a function on its own in an effort
to clean up function rproc_alloc().

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Alex Elder <elder@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 33 ++++++++++++++++++----------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 45529d40342f..15318507aedb 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2028,6 +2028,26 @@ static int rproc_alloc_firmware(struct rproc *rproc,
 	return 0;
 }
 
+static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
+{
+	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
+	if (!rproc->ops)
+		return -ENOMEM;
+
+	if (rproc->ops->load)
+		return 0;
+
+	/* Default to ELF loader if no load function is specified */
+	rproc->ops->load = rproc_elf_load_segments;
+	rproc->ops->parse_fw = rproc_elf_load_rsc_table;
+	rproc->ops->find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table;
+	if (!rproc->ops->sanity_check)
+		rproc->ops->sanity_check = rproc_elf32_sanity_check;
+	rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
+
+	return 0;
+}
+
 /**
  * rproc_alloc() - allocate a remote processor handle
  * @dev: the underlying device
@@ -2067,8 +2087,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	if (rproc_alloc_firmware(rproc, name, firmware))
 		goto free_rproc;
 
-	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
-	if (!rproc->ops)
+	if (rproc_alloc_ops(rproc, ops))
 		goto free_firmware;
 
 	rproc->name = name;
@@ -2096,16 +2115,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 
 	atomic_set(&rproc->power, 0);
 
-	/* Default to ELF loader if no load function is specified */
-	if (!rproc->ops->load) {
-		rproc->ops->load = rproc_elf_load_segments;
-		rproc->ops->parse_fw = rproc_elf_load_rsc_table;
-		rproc->ops->find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table;
-		if (!rproc->ops->sanity_check)
-			rproc->ops->sanity_check = rproc_elf32_sanity_check;
-		rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
-	}
-
 	mutex_init(&rproc->lock);
 
 	INIT_LIST_HEAD(&rproc->carveouts);
-- 
2.20.1
