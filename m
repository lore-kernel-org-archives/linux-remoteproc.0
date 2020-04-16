Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: rishabhb=codeaurora.org@mg.codeaurora.org
From: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH 1/3] remoteproc: Make coredump functionality configurable
Date: Thu, 16 Apr 2020 11:38:30 -0700
Message-Id: <1587062312-4939-1-git-send-email-rishabhb@codeaurora.org>
To: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, mathieu.poirier@linaro.org, tsoni@codeaurora.org, psodagud@codeaurora.org, sidgup@codeaurora.org, Rishabh Bhatnagar <rishabhb@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Add a new file implementing coredump specific functionality.
This would enable clients to have the option to implement custom
dump functionality. The default coredump functionality remains same
as rproc_coredump function.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
---
 drivers/remoteproc/Makefile              |   1 +
 drivers/remoteproc/remoteproc_core.c     |  83 -----------------------
 drivers/remoteproc/remoteproc_coredump.c | 111 +++++++++++++++++++++++++++++++
 drivers/remoteproc/remoteproc_internal.h |  10 +++
 4 files changed, 122 insertions(+), 83 deletions(-)
 create mode 100644 drivers/remoteproc/remoteproc_coredump.c

diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index e30a1b1..f1d1264 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -9,6 +9,7 @@ remoteproc-y				+= remoteproc_debugfs.o
 remoteproc-y				+= remoteproc_sysfs.o
 remoteproc-y				+= remoteproc_virtio.o
 remoteproc-y				+= remoteproc_elf_loader.o
+remoteproc-y				+= remoteproc_coredump.o
 obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
 obj-$(CONFIG_MTK_SCP)			+= mtk_scp.o mtk_scp_ipi.o
 obj-$(CONFIG_OMAP_REMOTEPROC)		+= omap_remoteproc.o
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 097f33e..c0e9e5d 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1555,89 +1555,6 @@ int rproc_coredump_add_custom_segment(struct rproc *rproc,
 EXPORT_SYMBOL(rproc_coredump_add_custom_segment);
 
 /**
- * rproc_coredump() - perform coredump
- * @rproc:	rproc handle
- *
- * This function will generate an ELF header for the registered segments
- * and create a devcoredump device associated with rproc.
- */
-static void rproc_coredump(struct rproc *rproc)
-{
-	struct rproc_dump_segment *segment;
-	struct elf32_phdr *phdr;
-	struct elf32_hdr *ehdr;
-	size_t data_size;
-	size_t offset;
-	void *data;
-	void *ptr;
-	int phnum = 0;
-
-	if (list_empty(&rproc->dump_segments))
-		return;
-
-	data_size = sizeof(*ehdr);
-	list_for_each_entry(segment, &rproc->dump_segments, node) {
-		data_size += sizeof(*phdr) + segment->size;
-
-		phnum++;
-	}
-
-	data = vmalloc(data_size);
-	if (!data)
-		return;
-
-	ehdr = data;
-
-	memset(ehdr, 0, sizeof(*ehdr));
-	memcpy(ehdr->e_ident, ELFMAG, SELFMAG);
-	ehdr->e_ident[EI_CLASS] = ELFCLASS32;
-	ehdr->e_ident[EI_DATA] = ELFDATA2LSB;
-	ehdr->e_ident[EI_VERSION] = EV_CURRENT;
-	ehdr->e_ident[EI_OSABI] = ELFOSABI_NONE;
-	ehdr->e_type = ET_CORE;
-	ehdr->e_machine = EM_NONE;
-	ehdr->e_version = EV_CURRENT;
-	ehdr->e_entry = rproc->bootaddr;
-	ehdr->e_phoff = sizeof(*ehdr);
-	ehdr->e_ehsize = sizeof(*ehdr);
-	ehdr->e_phentsize = sizeof(*phdr);
-	ehdr->e_phnum = phnum;
-
-	phdr = data + ehdr->e_phoff;
-	offset = ehdr->e_phoff + sizeof(*phdr) * ehdr->e_phnum;
-	list_for_each_entry(segment, &rproc->dump_segments, node) {
-		memset(phdr, 0, sizeof(*phdr));
-		phdr->p_type = PT_LOAD;
-		phdr->p_offset = offset;
-		phdr->p_vaddr = segment->da;
-		phdr->p_paddr = segment->da;
-		phdr->p_filesz = segment->size;
-		phdr->p_memsz = segment->size;
-		phdr->p_flags = PF_R | PF_W | PF_X;
-		phdr->p_align = 0;
-
-		if (segment->dump) {
-			segment->dump(rproc, segment, data + offset);
-		} else {
-			ptr = rproc_da_to_va(rproc, segment->da, segment->size);
-			if (!ptr) {
-				dev_err(&rproc->dev,
-					"invalid coredump segment (%pad, %zu)\n",
-					&segment->da, segment->size);
-				memset(data + offset, 0xff, segment->size);
-			} else {
-				memcpy(data + offset, ptr, segment->size);
-			}
-		}
-
-		offset += phdr->p_filesz;
-		phdr++;
-	}
-
-	dev_coredumpv(&rproc->dev, data, data_size, GFP_KERNEL);
-}
-
-/**
  * rproc_trigger_recovery() - recover a remoteproc
  * @rproc: the remote processor
  *
diff --git a/drivers/remoteproc/remoteproc_coredump.c b/drivers/remoteproc/remoteproc_coredump.c
new file mode 100644
index 0000000..9de0467
--- /dev/null
+++ b/drivers/remoteproc/remoteproc_coredump.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Coredump functionality for Remoteproc framework.
+ *
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/devcoredump.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/remoteproc.h>
+#include "remoteproc_internal.h"
+
+static void create_elf_header(void *data, int phnum, struct rproc *rproc)
+{
+	struct elf32_phdr *phdr;
+	struct elf32_hdr *ehdr;
+	struct rproc_dump_segment *segment;
+	int offset;
+
+	ehdr = data;
+
+	memset(ehdr, 0, sizeof(*ehdr));
+	memcpy(ehdr->e_ident, ELFMAG, SELFMAG);
+	ehdr->e_ident[EI_CLASS] = ELFCLASS32;
+	ehdr->e_ident[EI_DATA] = ELFDATA2LSB;
+	ehdr->e_ident[EI_VERSION] = EV_CURRENT;
+	ehdr->e_ident[EI_OSABI] = ELFOSABI_NONE;
+	ehdr->e_type = ET_CORE;
+	ehdr->e_machine = EM_NONE;
+	ehdr->e_version = EV_CURRENT;
+	ehdr->e_entry = rproc->bootaddr;
+	ehdr->e_phoff = sizeof(*ehdr);
+	ehdr->e_ehsize = sizeof(*ehdr);
+	ehdr->e_phentsize = sizeof(*phdr);
+	ehdr->e_phnum = phnum;
+
+	phdr = data + ehdr->e_phoff;
+	offset = ehdr->e_phoff + sizeof(*phdr) * ehdr->e_phnum;
+	list_for_each_entry(segment, &rproc->dump_segments, node) {
+		memset(phdr, 0, sizeof(*phdr));
+		phdr->p_type = PT_LOAD;
+		phdr->p_offset = offset;
+		phdr->p_vaddr = segment->da;
+		phdr->p_paddr = segment->da;
+		phdr->p_filesz = segment->size;
+		phdr->p_memsz = segment->size;
+		phdr->p_flags = PF_R | PF_W | PF_X;
+		phdr->p_align = 0;
+
+		offset += phdr->p_filesz;
+		phdr++;
+	}
+}
+
+/**
+ * rproc_default_coredump() - perform coredump
+ * @rproc:	rproc handle
+ *
+ * This function will generate an ELF header for the registered segments
+ * and create a devcoredump device associated with rproc.
+ */
+void rproc_default_coredump(struct rproc *rproc)
+{
+	struct rproc_dump_segment *segment;
+	struct elf32_phdr *phdr;
+	struct elf32_hdr *ehdr;
+	size_t data_size;
+	void *data, *ptr;
+	int offset, phnum = 0;
+
+	if (list_empty(&rproc->dump_segments))
+		return;
+
+	data_size = sizeof(*ehdr);
+	list_for_each_entry(segment, &rproc->dump_segments, node) {
+		data_size += sizeof(*phdr) + segment->size;
+
+		phnum++;
+	}
+
+	data = vmalloc(data_size);
+	if (!data)
+		return;
+
+	ehdr = data;
+	create_elf_header(data, phnum, rproc);
+
+	phdr = data + ehdr->e_phoff;
+	offset = ehdr->e_phoff + sizeof(*phdr) * ehdr->e_phnum;
+	list_for_each_entry(segment, &rproc->dump_segments, node) {
+		if (segment->dump) {
+			segment->dump(rproc, segment, data + offset);
+		} else {
+			ptr = rproc_da_to_va(rproc, segment->da, segment->size);
+			if (!ptr) {
+				dev_err(&rproc->dev,
+					"invalid coredump segment (%pad, %zu)\n",
+					&segment->da, segment->size);
+				memset(data + offset, 0xff, segment->size);
+			} else {
+				memcpy(data + offset, ptr, segment->size);
+			}
+		}
+		phdr++;
+	}
+
+	dev_coredumpv(&rproc->dev, data, data_size, GFP_KERNEL);
+}
+EXPORT_SYMBOL(rproc_default_coredump);
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 493ef92..28b6af2 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -47,6 +47,9 @@ struct dentry *rproc_create_trace_file(const char *name, struct rproc *rproc,
 int rproc_init_sysfs(void);
 void rproc_exit_sysfs(void);
 
+/* from remoteproc_coredump.c */
+void rproc_default_coredump(struct rproc *rproc);
+
 void rproc_free_vring(struct rproc_vring *rvring);
 int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
 
@@ -119,4 +122,11 @@ struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
 	return NULL;
 }
 
+static inline
+void rproc_coredump(struct rproc *rproc)
+{
+	return rproc_default_coredump(rproc);
+
+}
+
 #endif /* REMOTEPROC_INTERNAL_H */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
