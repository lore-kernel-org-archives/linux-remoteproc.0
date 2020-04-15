Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH v2 6/7] remoteproc: Split rproc_ops allocation from rproc_alloc()
Date: Wed, 15 Apr 2020 14:48:57 -0600
Message-Id: <20200415204858.2448-7-mathieu.poirier@linaro.org>
In-Reply-To: <20200415204858.2448-1-mathieu.poirier@linaro.org>
References: <20200415204858.2448-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: s-anna@ti.com, elder@linaro.org, Markus.Elfring@web.de, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Make the rproc_ops allocation a function on its own in an effort
to clean up function rproc_alloc().

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Alex Elder <elder@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 32 +++++++++++++++++-----------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 0bfa6998705d..a5a0ceb86b3f 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2001,6 +2001,25 @@ static int rproc_alloc_firmware(struct rproc *rproc,
 	return 0;
 }
 
+static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
+{
+	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
+	if (!rproc->ops)
+		return -ENOMEM;
+
+	/* Default to ELF loader if no load function is specified */
+	if (!rproc->ops->load) {
+		rproc->ops->load = rproc_elf_load_segments;
+		rproc->ops->parse_fw = rproc_elf_load_rsc_table;
+		rproc->ops->find_loaded_rsc_table =
+						rproc_elf_find_loaded_rsc_table;
+		rproc->ops->sanity_check = rproc_elf_sanity_check;
+		rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
+	}
+
+	return 0;
+}
+
 /**
  * rproc_alloc() - allocate a remote processor handle
  * @dev: the underlying device
@@ -2040,8 +2059,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	if (rproc_alloc_firmware(rproc, name, firmware))
 		goto free_rproc;
 
-	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
-	if (!rproc->ops)
+	if (rproc_alloc_ops(rproc, ops))
 		goto free_firmware;
 
 	rproc->name = name;
@@ -2068,16 +2086,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 
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
