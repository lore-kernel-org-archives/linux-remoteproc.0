Return-Path: <cleger@kalray.eu>
From: Clement Leger <cleger@kalray.eu>
Subject: [PATCH] remoteproc: remove rproc_elf32_sanity_check
Date: Fri, 27 Mar 2020 09:49:39 +0100
Message-Id: <20200327084939.8321-1-cleger@kalray.eu>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Patrice Chotard <patrice.chotard@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, Clement Leger <cleger@kalray.eu>
List-ID: <linux-remoteproc@vger.kernel.org>

Since checks are present in the remoteproc elf loader before calling
da_to_va, loading a elf64 will work on 32bits flavors of kernel.
Indeed, if a segment size is larger than what size_t can hold, the
loader will return an error so the functionality is equivalent to
what exists today.

Signed-off-by: Clement Leger <cleger@kalray.eu>
---
 drivers/remoteproc/remoteproc_core.c       |  2 +-
 drivers/remoteproc/remoteproc_elf_loader.c | 21 ---------------------
 drivers/remoteproc/remoteproc_internal.h   |  1 -
 drivers/remoteproc/st_remoteproc.c         |  2 +-
 drivers/remoteproc/st_slim_rproc.c         |  2 +-
 drivers/remoteproc/stm32_rproc.c           |  2 +-
 6 files changed, 4 insertions(+), 26 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index a9ac1d01e09b..02ff076b0122 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2069,7 +2069,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 		rproc->ops->parse_fw = rproc_elf_load_rsc_table;
 		rproc->ops->find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table;
 		if (!rproc->ops->sanity_check)
-			rproc->ops->sanity_check = rproc_elf32_sanity_check;
+			rproc->ops->sanity_check = rproc_elf_sanity_check;
 		rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
 	}
 
diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index 16e2c496fd45..29034f99898d 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -112,27 +112,6 @@ int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
 }
 EXPORT_SYMBOL(rproc_elf_sanity_check);
 
-/**
- * rproc_elf_sanity_check() - Sanity Check ELF32 firmware image
- * @rproc: the remote processor handle
- * @fw: the ELF32 firmware image
- *
- * Make sure this fw image is sane.
- */
-int rproc_elf32_sanity_check(struct rproc *rproc, const struct firmware *fw)
-{
-	int ret = rproc_elf_sanity_check(rproc, fw);
-
-	if (ret)
-		return ret;
-
-	if (fw_elf_get_class(fw) == ELFCLASS32)
-		return 0;
-
-	return -EINVAL;
-}
-EXPORT_SYMBOL(rproc_elf32_sanity_check);
-
 /**
  * rproc_elf_get_boot_addr() - Get rproc's boot address.
  * @rproc: the remote processor handle
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index b389dc79da81..31994715fd43 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -54,7 +54,6 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len);
 phys_addr_t rproc_va_to_pa(void *cpu_addr);
 int rproc_trigger_recovery(struct rproc *rproc);
 
-int rproc_elf32_sanity_check(struct rproc *rproc, const struct firmware *fw);
 int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw);
 u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw);
 int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw);
diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
index a6cbfa452764..a3268d95a50e 100644
--- a/drivers/remoteproc/st_remoteproc.c
+++ b/drivers/remoteproc/st_remoteproc.c
@@ -233,7 +233,7 @@ static const struct rproc_ops st_rproc_ops = {
 	.parse_fw		= st_rproc_parse_fw,
 	.load			= rproc_elf_load_segments,
 	.find_loaded_rsc_table	= rproc_elf_find_loaded_rsc_table,
-	.sanity_check		= rproc_elf32_sanity_check,
+	.sanity_check		= rproc_elf_sanity_check,
 	.get_boot_addr		= rproc_elf_get_boot_addr,
 };
 
diff --git a/drivers/remoteproc/st_slim_rproc.c b/drivers/remoteproc/st_slim_rproc.c
index 3cca8b65a8db..09bcb4d8b9e0 100644
--- a/drivers/remoteproc/st_slim_rproc.c
+++ b/drivers/remoteproc/st_slim_rproc.c
@@ -203,7 +203,7 @@ static const struct rproc_ops slim_rproc_ops = {
 	.da_to_va       = slim_rproc_da_to_va,
 	.get_boot_addr	= rproc_elf_get_boot_addr,
 	.load		= rproc_elf_load_segments,
-	.sanity_check	= rproc_elf32_sanity_check,
+	.sanity_check	= rproc_elf_sanity_check,
 };
 
 /**
diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 6a66dbf2df40..2e07a95439c8 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -505,7 +505,7 @@ static struct rproc_ops st_rproc_ops = {
 	.load		= rproc_elf_load_segments,
 	.parse_fw	= stm32_rproc_parse_fw,
 	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
-	.sanity_check	= rproc_elf32_sanity_check,
+	.sanity_check	= rproc_elf_sanity_check,
 	.get_boot_addr	= rproc_elf_get_boot_addr,
 };
 
-- 
2.17.1
