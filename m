Return-Path: <cleger@kalray.eu>
From: Clement Leger <cleger@kalray.eu>
Subject: [PATCH 1/2] remoteproc: add rproc_coredump_set_elf_info
Date: Fri, 10 Apr 2020 12:24:32 +0200
Message-Id: <20200410102433.2672-2-cleger@kalray.eu>
In-Reply-To: <20200410102433.2672-1-cleger@kalray.eu>
References: <20200410102433.2672-1-cleger@kalray.eu>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, Clement Leger <cleger@kalray.eu>
List-ID: <linux-remoteproc@vger.kernel.org>

This function allows drivers to correctly setup the coredump output
elf information.

Signed-off-by: Clement Leger <cleger@kalray.eu>
---
 drivers/remoteproc/remoteproc_core.c       | 32 ++++++++++++++++++++--
 drivers/remoteproc/remoteproc_elf_loader.c |  3 --
 include/linux/remoteproc.h                 |  2 ++
 3 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index a9ac1d01e09b..382443bab583 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1562,6 +1562,28 @@ int rproc_coredump_add_custom_segment(struct rproc *rproc,
 }
 EXPORT_SYMBOL(rproc_coredump_add_custom_segment);
 
+/**
+ * rproc_coredump_set_elf_info() - set coredump elf information
+ * @rproc:	handle of a remote processor
+ * @class:	elf class for coredump elf file
+ * @size:	elf machine for coredump elf file
+ *
+ * Set elf information which will be used for coredump elf file.
+ *
+ * Return: 0 on success, negative errno on error.
+ */
+int rproc_coredump_set_elf_info(struct rproc *rproc, u8 class, u16 machine)
+{
+	if (class != ELFCLASS64 && class != ELFCLASS32)
+		return -EINVAL;
+
+	rproc->elf_class = class;
+	rproc->elf_machine = machine;
+
+	return 0;
+}
+EXPORT_SYMBOL(rproc_coredump_set_elf_info);
+
 /**
  * rproc_coredump() - perform coredump
  * @rproc:	rproc handle
@@ -1584,6 +1606,11 @@ static void rproc_coredump(struct rproc *rproc)
 	if (list_empty(&rproc->dump_segments))
 		return;
 
+	if (class == ELFCLASSNONE) {
+		dev_err(&rproc->dev, "Elf class is not set\n");
+		return;
+	}
+
 	data_size = elf_size_of_hdr(class);
 	list_for_each_entry(segment, &rproc->dump_segments, node) {
 		data_size += elf_size_of_phdr(class) + segment->size;
@@ -1602,7 +1629,7 @@ static void rproc_coredump(struct rproc *rproc)
 	elf_hdr_init_ident(ehdr, class);
 
 	elf_hdr_set_e_type(class, ehdr, ET_CORE);
-	elf_hdr_set_e_machine(class, ehdr, EM_NONE);
+	elf_hdr_set_e_machine(class, ehdr, rproc->elf_machine);
 	elf_hdr_set_e_version(class, ehdr, EV_CURRENT);
 	elf_hdr_set_e_entry(class, ehdr, rproc->bootaddr);
 	elf_hdr_set_e_phoff(class, ehdr, elf_size_of_hdr(class));
@@ -2043,7 +2070,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->name = name;
 	rproc->priv = &rproc[1];
 	rproc->auto_boot = true;
-	rproc->elf_class = ELFCLASS32;
+	rproc->elf_class = ELFCLASSNONE;
+	rproc->elf_machine = EM_NONE;
 
 	device_initialize(&rproc->dev);
 	rproc->dev.parent = dev;
diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index 16e2c496fd45..4869fb7d8fe4 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -248,9 +248,6 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 			memset(ptr + filesz, 0, memsz - filesz);
 	}
 
-	if (ret == 0)
-		rproc->elf_class = class;
-
 	return ret;
 }
 EXPORT_SYMBOL(rproc_elf_load_segments);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index ed127b2d35ca..d67eb5a40476 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -515,6 +515,7 @@ struct rproc {
 	struct list_head dump_segments;
 	int nb_vdev;
 	u8 elf_class;
+	u16 elf_machine;
 };
 
 /**
@@ -619,6 +620,7 @@ int rproc_coredump_add_custom_segment(struct rproc *rproc,
 						     struct rproc_dump_segment *segment,
 						     void *dest),
 				      void *priv);
+int rproc_coredump_set_elf_info(struct rproc *rproc, u8 class, u16 machine);
 
 static inline struct rproc_vdev *vdev_to_rvdev(struct virtio_device *vdev)
 {
-- 
2.17.1
