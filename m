Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 4/5] remoteproc: qcom-common: Extract non-mdt related helper
Date: Mon, 30 Jan 2017 08:55:46 -0800
Message-Id: <20170130165547.4344-4-bjorn.andersson@linaro.org>
In-Reply-To: <20170130165547.4344-1-bjorn.andersson@linaro.org>
References: <20170130165547.4344-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.com>
List-ID: <linux-remoteproc@vger.kernel.org>

In preparation for moving the mdt loader out of remoteproc let's move
the somewhat unrelated resource table dummy helper to a Qualcomm
"common" file.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/Kconfig           |  6 +++++
 drivers/remoteproc/Makefile          |  1 +
 drivers/remoteproc/qcom_adsp_pil.c   |  1 +
 drivers/remoteproc/qcom_common.c     | 46 ++++++++++++++++++++++++++++++++++++
 drivers/remoteproc/qcom_common.h     | 11 +++++++++
 drivers/remoteproc/qcom_mdt_loader.c | 19 ---------------
 drivers/remoteproc/qcom_mdt_loader.h |  1 -
 drivers/remoteproc/qcom_q6v5_pil.c   |  1 +
 drivers/remoteproc/qcom_wcnss.c      |  1 +
 9 files changed, 67 insertions(+), 20 deletions(-)
 create mode 100644 drivers/remoteproc/qcom_common.c
 create mode 100644 drivers/remoteproc/qcom_common.h

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 454fd9a4dd96..71ea703190c6 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -78,11 +78,15 @@ config QCOM_ADSP_PIL
 	depends on QCOM_SMEM
 	select MFD_SYSCON
 	select QCOM_MDT_LOADER
+	select QCOM_RPROC_COMMON
 	select QCOM_SCM
 	help
 	  Say y here to support the TrustZone based Peripherial Image Loader
 	  for the Qualcomm ADSP remote processors.
 
+config QCOM_RPROC_COMMON
+	tristate
+
 config QCOM_MDT_LOADER
 	tristate
 
@@ -92,6 +96,7 @@ config QCOM_Q6V5_PIL
 	depends on QCOM_SMEM
 	depends on REMOTEPROC
 	select MFD_SYSCON
+	select QCOM_RPROC_COMMON
 	select QCOM_SCM
 	help
 	  Say y here to support the Qualcomm Peripherial Image Loader for the
@@ -104,6 +109,7 @@ config QCOM_WCNSS_PIL
 	depends on QCOM_SMEM
 	depends on REMOTEPROC
 	select QCOM_MDT_LOADER
+	select QCOM_RPROC_COMMON
 	select QCOM_SCM
 	help
 	  Say y here to support the Peripheral Image Loader for the Qualcomm
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 0938ea3c41ba..d4f9525a226d 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_WKUP_M3_RPROC)		+= wkup_m3_rproc.o
 obj-$(CONFIG_DA8XX_REMOTEPROC)		+= da8xx_remoteproc.o
 obj-$(CONFIG_QCOM_ADSP_PIL)		+= qcom_adsp_pil.o
 obj-$(CONFIG_QCOM_MDT_LOADER)		+= qcom_mdt_loader.o
+obj-$(CONFIG_QCOM_RPROC_COMMON)		+= qcom_common.o
 obj-$(CONFIG_QCOM_Q6V5_PIL)		+= qcom_q6v5_pil.o
 obj-$(CONFIG_QCOM_WCNSS_PIL)		+= qcom_wcnss_pil.o
 qcom_wcnss_pil-y			+= qcom_wcnss.o
diff --git a/drivers/remoteproc/qcom_adsp_pil.c b/drivers/remoteproc/qcom_adsp_pil.c
index e300b8c7e5aa..e2151b017616 100644
--- a/drivers/remoteproc/qcom_adsp_pil.c
+++ b/drivers/remoteproc/qcom_adsp_pil.c
@@ -29,6 +29,7 @@
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
 
+#include "qcom_common.h"
 #include "qcom_mdt_loader.h"
 #include "remoteproc_internal.h"
 
diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
new file mode 100644
index 000000000000..bd400336e209
--- /dev/null
+++ b/drivers/remoteproc/qcom_common.c
@@ -0,0 +1,46 @@
+/*
+ * Qualcomm Peripheral Image Loader helpers
+ *
+ * Copyright (C) 2016 Linaro Ltd
+ * Copyright (C) 2015 Sony Mobile Communications Inc
+ * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/firmware.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/remoteproc.h>
+
+#include "remoteproc_internal.h"
+#include "qcom_common.h"
+
+/**
+ * qcom_mdt_find_rsc_table() - provide dummy resource table for remoteproc
+ * @rproc:	remoteproc handle
+ * @fw:		firmware header
+ * @tablesz:	outgoing size of the table
+ *
+ * Returns a dummy table.
+ */
+struct resource_table *qcom_mdt_find_rsc_table(struct rproc *rproc,
+					       const struct firmware *fw,
+					       int *tablesz)
+{
+	static struct resource_table table = { .ver = 1, };
+
+	*tablesz = sizeof(table);
+	return &table;
+}
+EXPORT_SYMBOL_GPL(qcom_mdt_find_rsc_table);
+
+MODULE_DESCRIPTION("Qualcomm Remoteproc helper driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/remoteproc/qcom_common.h b/drivers/remoteproc/qcom_common.h
new file mode 100644
index 000000000000..caecf27c4ffa
--- /dev/null
+++ b/drivers/remoteproc/qcom_common.h
@@ -0,0 +1,11 @@
+#ifndef __RPROC_QCOM_COMMON_H__
+#define __RPROC_QCOM_COMMON_H__
+
+struct resource_table;
+struct rproc;
+
+struct resource_table *qcom_mdt_find_rsc_table(struct rproc *rproc,
+					       const struct firmware *fw,
+					       int *tablesz);
+
+#endif
diff --git a/drivers/remoteproc/qcom_mdt_loader.c b/drivers/remoteproc/qcom_mdt_loader.c
index f239f6fddbb7..b36a47bef056 100644
--- a/drivers/remoteproc/qcom_mdt_loader.c
+++ b/drivers/remoteproc/qcom_mdt_loader.c
@@ -27,25 +27,6 @@
 #include "remoteproc_internal.h"
 #include "qcom_mdt_loader.h"
 
-/**
- * qcom_mdt_find_rsc_table() - provide dummy resource table for remoteproc
- * @rproc:	remoteproc handle
- * @fw:		firmware header
- * @tablesz:	outgoing size of the table
- *
- * Returns a dummy table.
- */
-struct resource_table *qcom_mdt_find_rsc_table(struct rproc *rproc,
-					       const struct firmware *fw,
-					       int *tablesz)
-{
-	static struct resource_table table = { .ver = 1, };
-
-	*tablesz = sizeof(table);
-	return &table;
-}
-EXPORT_SYMBOL_GPL(qcom_mdt_find_rsc_table);
-
 static bool mdt_phdr_valid(const struct elf32_phdr *phdr)
 {
 	if (phdr->p_type != PT_LOAD)
diff --git a/drivers/remoteproc/qcom_mdt_loader.h b/drivers/remoteproc/qcom_mdt_loader.h
index 261088c8da18..ca9a91709810 100644
--- a/drivers/remoteproc/qcom_mdt_loader.h
+++ b/drivers/remoteproc/qcom_mdt_loader.h
@@ -5,7 +5,6 @@
 #define QCOM_MDT_TYPE_HASH	(2 << 24)
 #define QCOM_MDT_RELOCATABLE	BIT(27)
 
-struct resource_table * qcom_mdt_find_rsc_table(struct rproc *rproc, const struct firmware *fw, int *tablesz);
 
 ssize_t qcom_mdt_get_size(const struct firmware *fw);
 int qcom_mdt_load(struct device *dev, const struct firmware *fw,
diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 1afadab4edfd..d37f7d206b10 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -33,6 +33,7 @@
 #include <linux/soc/qcom/smem_state.h>
 
 #include "remoteproc_internal.h"
+#include "qcom_common.h"
 #include "qcom_mdt_loader.h"
 
 #include <linux/qcom_scm.h>
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index aa97a61e6a69..fbb25ea4ae8a 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -32,6 +32,7 @@
 #include <linux/soc/qcom/smem_state.h>
 #include <linux/rpmsg/qcom_smd.h>
 
+#include "qcom_common.h"
 #include "qcom_mdt_loader.h"
 #include "remoteproc_internal.h"
 #include "qcom_wcnss.h"
-- 
2.11.0
