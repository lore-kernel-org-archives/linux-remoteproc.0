Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sidgup=codeaurora.org@mg.codeaurora.org
From: Siddharth Gupta <sidgup@codeaurora.org>
Subject: [PATCH 1/2] remoteproc: core: Add an API for booting with firmware name
Date: Wed, 19 Feb 2020 18:11:52 -0800
Message-Id: <1582164713-6413-2-git-send-email-sidgup@codeaurora.org>
In-Reply-To: <1582164713-6413-1-git-send-email-sidgup@codeaurora.org>
References: <1582164713-6413-1-git-send-email-sidgup@codeaurora.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: Siddharth Gupta <sidgup@codeaurora.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org, psodagud@codeaurora.org, rishabhb@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Add an API which allows to change the name of the firmware to be booted on
the specified rproc. This change gives us the flixibility to change the
firmware at run-time depending on the usecase. Some remoteprocs might use
a different firmware for testing, production and development purposes,
which may be selected based on the fuse settings during bootup.

Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
---
 drivers/remoteproc/remoteproc_core.c | 34 ++++++++++++++++++++++++++++++++++
 include/linux/remoteproc.h           |  1 +
 2 files changed, 35 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 097f33e..5ab65a4 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1779,6 +1779,40 @@ int rproc_boot(struct rproc *rproc)
 EXPORT_SYMBOL(rproc_boot);
 
 /**
+ * rproc_boot_with_fw() - boot a remote processor with the specified firmware
+ * @rproc: handle of a remote processor
+ * @firmware: name of the firmware to boot with
+ *
+ * Change the name of the firmware to be loaded to @firmware in the rproc
+ * structure, and call rproc_boot().
+ *
+ * Returns 0 on success, and an appropriate error value otherwise.
+ */
+int rproc_boot_with_fw(struct rproc *rproc, const char *firmware)
+{
+	char *p;
+
+	if (!rproc) {
+		pr_err("invalid rproc handle\n");
+		return -EINVAL;
+	}
+
+	if (firmware) {
+		p = kstrdup(firmware, GFP_KERNEL);
+		if (!p)
+			return -ENOMEM;
+
+		mutex_lock(&rproc->lock);
+		kfree(rproc->firmware);
+		rproc->firmware = p;
+		mutex_unlock(&rproc->lock);
+	}
+
+	return rproc_boot(rproc);
+}
+EXPORT_SYMBOL(rproc_boot_with_fw);
+
+/**
  * rproc_shutdown() - power off the remote processor
  * @rproc: the remote processor
  *
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 16ad666..e2eaba9 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -609,6 +609,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, int len,
 			     u32 da, const char *name, ...);
 
 int rproc_boot(struct rproc *rproc);
+int rproc_boot_with_fw(struct rproc *rproc, const char *firmware);
 void rproc_shutdown(struct rproc *rproc);
 void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
 int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
