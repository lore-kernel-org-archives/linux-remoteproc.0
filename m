Return-Path: <cleger@kalray.eu>
From: Clement Leger <cleger@kalray.eu>
Subject: [PATCH v5 8/8] remoteproc: Adapt coredump to generate correct elf type
Date: Mon,  2 Mar 2020 10:39:02 +0100
Message-Id: <20200302093902.27849-9-cleger@kalray.eu>
In-Reply-To: <20200302093902.27849-1-cleger@kalray.eu>
References: <20200210162209.23149-1-cleger@kalray.eu>
 <20200302093902.27849-1-cleger@kalray.eu>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-remoteproc@vger.kernel.org
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Andy Gross <agross@kernel.org>, Patrice Chotard <patrice.chotard@st.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Clement Leger <cleger@kalray.eu>
List-ID: <linux-remoteproc@vger.kernel.org>

Now that remoteproc can load an elf64, coredump elf class should be
the same as the loaded elf class. In order to do that, add a
elf_class field to rproc with default values. If an elf is loaded
successfully, this field will be updated with the loaded elf class.
Then, the coredump core code has been modified to use the generic elf
macro in order to create an elf file with correct class.

Signed-off-by: Clement Leger <cleger@kalray.eu>
---
 drivers/remoteproc/remoteproc_core.c       | 67 ++++++++++++++++--------------
 drivers/remoteproc/remoteproc_elf_loader.c |  3 ++
 include/linux/remoteproc.h                 |  1 +
 3 files changed, 39 insertions(+), 32 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index b932a64a2be2..f923355aa3f9 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -38,6 +38,7 @@
 #include <linux/platform_device.h>
 
 #include "remoteproc_internal.h"
+#include "remoteproc_elf_helpers.h"
 
 #define HIGH_BITS_MASK 0xFFFFFFFF00000000ULL
 
@@ -1566,20 +1567,21 @@ EXPORT_SYMBOL(rproc_coredump_add_custom_segment);
 static void rproc_coredump(struct rproc *rproc)
 {
 	struct rproc_dump_segment *segment;
-	struct elf32_phdr *phdr;
-	struct elf32_hdr *ehdr;
+	void *phdr;
+	void *ehdr;
 	size_t data_size;
 	size_t offset;
 	void *data;
 	void *ptr;
+	u8 class = rproc->elf_class;
 	int phnum = 0;
 
 	if (list_empty(&rproc->dump_segments))
 		return;
 
-	data_size = sizeof(*ehdr);
+	data_size = elf_size_of_hdr(class);
 	list_for_each_entry(segment, &rproc->dump_segments, node) {
-		data_size += sizeof(*phdr) + segment->size;
+		data_size += elf_size_of_phdr(class) + segment->size;
 
 		phnum++;
 	}
@@ -1590,33 +1592,33 @@ static void rproc_coredump(struct rproc *rproc)
 
 	ehdr = data;
 
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
+	memset(ehdr, 0, elf_size_of_hdr(class));
+	/* e_ident field is common for both elf32 and elf64 */
+	elf_hdr_init_ident(ehdr, class);
+
+	elf_hdr_set_e_type(class, ehdr, ET_CORE);
+	elf_hdr_set_e_machine(class, ehdr, EM_NONE);
+	elf_hdr_set_e_version(class, ehdr, EV_CURRENT);
+	elf_hdr_set_e_entry(class, ehdr, rproc->bootaddr);
+	elf_hdr_set_e_phoff(class, ehdr, elf_size_of_hdr(class));
+	elf_hdr_set_e_ehsize(class, ehdr, elf_size_of_hdr(class));
+	elf_hdr_set_e_phentsize(class, ehdr, elf_size_of_phdr(class));
+	elf_hdr_set_e_phnum(class, ehdr, phnum);
+
+	phdr = data + elf_hdr_get_e_phoff(class, ehdr);
+	offset = elf_hdr_get_e_phoff(class, ehdr);
+	offset += elf_size_of_phdr(class) * elf_hdr_get_e_phnum(class, ehdr);
+
 	list_for_each_entry(segment, &rproc->dump_segments, node) {
-		memset(phdr, 0, sizeof(*phdr));
-		phdr->p_type = PT_LOAD;
-		phdr->p_offset = offset;
-		phdr->p_vaddr = segment->da;
-		phdr->p_paddr = segment->da;
-		phdr->p_filesz = segment->size;
-		phdr->p_memsz = segment->size;
-		phdr->p_flags = PF_R | PF_W | PF_X;
-		phdr->p_align = 0;
+		memset(phdr, 0, elf_size_of_phdr(class));
+		elf_phdr_set_p_type(class, phdr, PT_LOAD);
+		elf_phdr_set_p_offset(class, phdr, offset);
+		elf_phdr_set_p_vaddr(class, phdr, segment->da);
+		elf_phdr_set_p_paddr(class, phdr, segment->da);
+		elf_phdr_set_p_filesz(class, phdr, segment->size);
+		elf_phdr_set_p_memsz(class, phdr, segment->size);
+		elf_phdr_set_p_flags(class, phdr, PF_R | PF_W | PF_X);
+		elf_phdr_set_p_align(class, phdr, 0);
 
 		if (segment->dump) {
 			segment->dump(rproc, segment, data + offset);
@@ -1632,8 +1634,8 @@ static void rproc_coredump(struct rproc *rproc)
 			}
 		}
 
-		offset += phdr->p_filesz;
-		phdr++;
+		offset += elf_phdr_get_p_filesz(class, phdr);
+		phdr += elf_size_of_phdr(class);
 	}
 
 	dev_coredumpv(&rproc->dev, data, data_size, GFP_KERNEL);
@@ -2031,6 +2033,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->name = name;
 	rproc->priv = &rproc[1];
 	rproc->auto_boot = true;
+	rproc->elf_class = ELFCLASS32;
 
 	device_initialize(&rproc->dev);
 	rproc->dev.parent = dev;
diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index 4869fb7d8fe4..16e2c496fd45 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -248,6 +248,9 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 			memset(ptr + filesz, 0, memsz - filesz);
 	}
 
+	if (ret == 0)
+		rproc->elf_class = class;
+
 	return ret;
 }
 EXPORT_SYMBOL(rproc_elf_load_segments);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 1683d6c386a6..ed127b2d35ca 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -514,6 +514,7 @@ struct rproc {
 	bool auto_boot;
 	struct list_head dump_segments;
 	int nb_vdev;
+	u8 elf_class;
 };
 
 /**
-- 
2.15.0.276.g89ea799
