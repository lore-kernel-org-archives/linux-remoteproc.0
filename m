Return-Path: <sricharan@codeaurora.org>
From: Sricharan R <sricharan@codeaurora.org>
Subject: [PATCH v5 2/6] remoteproc: Export rproc_elf_get_boot_addr
Date: Tue, 14 Nov 2017 16:23:10 +0530
Message-Id: <1510656794-3815-3-git-send-email-sricharan@codeaurora.org>
In-Reply-To: <1510656794-3815-1-git-send-email-sricharan@codeaurora.org>
References: <1510656794-3815-1-git-send-email-sricharan@codeaurora.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
Cc: sricharan@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Export rproc_elf_get_boot_addr so that it can be
used by any remoteproc to get the bootaddr of the
elf type firmware images. This is used in the
subsequent patch by the q6v5 based remoteproc
while loading its elf based mdt type image.

Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 drivers/remoteproc/remoteproc_elf_loader.c | 2 +-
 drivers/remoteproc/remoteproc_internal.h   | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index c523983..f6d07d9 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -110,13 +110,13 @@
  * Note that the boot address is not a configurable property of all remote
  * processors. Some will always boot at a specific hard-coded address.
  */
-static
 u32 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
 {
 	struct elf32_hdr *ehdr  = (struct elf32_hdr *)fw->data;
 
 	return ehdr->e_entry;
 }
+EXPORT_SYMBOL(rproc_elf_get_boot_addr);
 
 /**
  * rproc_elf_load_segments() - load firmware segments to memory
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index c1077be..1bbbfea 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -124,4 +124,7 @@ struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
 
 extern const struct rproc_fw_ops rproc_elf_fw_ops;
 
+/* from remoteproc_elf_loader.c */
+u32 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw);
+
 #endif /* REMOTEPROC_INTERNAL_H */
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
