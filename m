Return-Path: <jliang@xilinx.com>
Return-Path: wendy.liang@xilinx.com
From: Wendy Liang <wendy.liang@xilinx.com>
Subject: [RFC LINUX PATCH 06/19] remoteproc: elf loader: Add get checksum firmware implementation
Date: Fri, 24 Mar 2017 12:22:22 -0700
Message-ID: <1490383355-23176-7-git-send-email-jliang@xilinx.com>
In-Reply-To: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
References: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, "Wendy Liang  <wendy.liang@xilinx.com>, Wendy Liang <jliang@xilinx.com>, Michal Simek" <michal.simek@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Wendy Liang <wendy.liang@xilinx.com>

Add get_chksum() implementation to calculate the checksum of
the loadable sections of the firmware.

Signed-off-by: Wendy Liang <jliang@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
 drivers/remoteproc/Kconfig                 |   1 +
 drivers/remoteproc/remoteproc_elf_loader.c | 109 +++++++++++++++++++++++++++++
 drivers/remoteproc/remoteproc_internal.h   |   3 +
 3 files changed, 113 insertions(+)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 65f86bc..d832f3b 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -7,6 +7,7 @@ config REMOTEPROC
 	select FW_LOADER
 	select VIRTIO
 	select VIRTUALIZATION
+	select CRYPTO
 	help
 	  Support for remote processors (such as DSP coprocessors). These
 	  are mainly used on embedded systems.
diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index c523983..f508083 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -29,6 +29,7 @@
 #include <linux/firmware.h>
 #include <linux/remoteproc.h>
 #include <linux/elf.h>
+#include <crypto/hash.h>
 
 #include "remoteproc_internal.h"
 
@@ -328,10 +329,118 @@ u32 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
 	return rproc_da_to_va(rproc, shdr->sh_addr, shdr->sh_size);
 }
 
+/**
+ * rproc_elf_get_chksum() - calcuate checksum of the loadable section
+ * @rproc: the rproc handle
+ * @fw: the ELF firmware image
+ * @algo: name of the checksum algorithm
+ * @chksum: checksum
+ * @output_size: size of the checksum
+ *
+ * This function calculate the checksum of the loadable secitons
+ * of the specified firmware.
+ *
+ * Returns 0 for success, negative value for failure.
+ */
+static int
+rproc_elf_get_chksum(struct rproc *rproc, const struct firmware *fw,
+		char *algo, u8 *chksum, int output_size)
+{
+	int ret, i;
+	struct device *dev = &rproc->dev;
+	struct crypto_shash *tfm;
+	struct shash_desc *desc;
+	int algo_len = 0;
+	struct elf32_hdr *ehdr;
+	struct elf32_phdr *phdr;
+	const u8 *elf_data = fw->data;
+
+	memset(chksum, 0, output_size);
+	/* If no algo is specified, default it to "sha256" */
+	if (!strlen(algo))
+		sprintf(algo, "sha256");
+	ret = crypto_has_alg(algo, 0, 0);
+	if (!ret) {
+		dev_err(dev, "failed to find crypto algo: %s.\n", algo);
+		return -EINVAL;
+	}
+	dev_dbg(dev, "firmware checksum algo: %s.\n", algo);
+	tfm =  crypto_alloc_shash(algo, 0, 0);
+	if (!tfm) {
+		dev_err(dev, "failed to allocate shash.\n");
+		return -ENOMEM;
+	}
+	algo_len = crypto_shash_digestsize(tfm);
+	if (algo_len > output_size) {
+		dev_err(dev,
+			"algo digest size %d is larger expected %d.\n",
+			algo_len, output_size);
+		return -EINVAL;
+	}
+	desc = kzalloc(sizeof(*desc) + algo_len, GFP_KERNEL);
+	if (!desc)
+		return -ENOMEM;
+	desc->tfm = tfm;
+	ret = crypto_shash_init(desc);
+	if (ret) {
+		dev_err(dev, "failed crypto %s initialization.\n", algo);
+		return ret;
+	}
+
+	ehdr = (struct elf32_hdr *)elf_data;
+	phdr = (struct elf32_phdr *)(elf_data + ehdr->e_phoff);
+
+	/* go through the available ELF segments */
+	for (i = 0; i < ehdr->e_phnum; i++, phdr++) {
+		u32 memsz = phdr->p_memsz;
+		u32 filesz = phdr->p_filesz;
+		u32 offset = phdr->p_offset;
+
+		if (phdr->p_type != PT_LOAD)
+			continue;
+
+		if (filesz > memsz) {
+			dev_err(dev, "bad phdr filesz 0x%x memsz 0x%x\n",
+				filesz, memsz);
+			ret = -EINVAL;
+			break;
+		}
+
+		if (offset + filesz > fw->size) {
+			dev_err(dev, "truncated fw: need 0x%x avail 0x%zx\n",
+				offset + filesz, fw->size);
+			ret = -EINVAL;
+			break;
+		}
+
+		/* put the segment where the remote processor expects it */
+		if (phdr->p_filesz) {
+			ret = crypto_shash_update(desc,
+				elf_data + offset, filesz);
+			if (ret) {
+				dev_err(dev,
+				"Failed to update fw crypto digest state at offset 0x%x, size 0x%x.\n",
+				offset, filesz);
+				return ret;
+			}
+		}
+
+	}
+	ret = crypto_shash_final(desc, chksum);
+	crypto_free_shash(tfm);
+	kfree(desc);
+	if (ret) {
+		dev_err(dev, "failed to finalize checksum of firmware.\n");
+		return ret;
+	}
+	return ret;
+}
+
 const struct rproc_fw_ops rproc_elf_fw_ops = {
 	.load = rproc_elf_load_segments,
 	.find_rsc_table = rproc_elf_find_rsc_table,
 	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
 	.sanity_check = rproc_elf_sanity_check,
+	.get_chksum = rproc_elf_get_chksum,
 	.get_boot_addr = rproc_elf_get_boot_addr
 };
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 1e9e5b3..f03e07a 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -33,6 +33,7 @@
  *			expects to find it
  * @sanity_check:	sanity check the fw image
  * @get_boot_addr:	get boot address to entry point specified in firmware
+ * @get_chksum:		get checksum of the loadable sections of the firmware
  */
 struct rproc_fw_ops {
 	struct resource_table *(*find_rsc_table)(struct rproc *rproc,
@@ -43,6 +44,8 @@ struct rproc_fw_ops {
 	int (*load)(struct rproc *rproc, const struct firmware *fw);
 	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
 	u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
+	int (*get_chksum)(struct rproc *rproc, const struct firmware *fw,
+			char *algo, u8 *chksum, int output_size);
 };
 
 /* from remoteproc_core.c */
-- 
1.9.1
