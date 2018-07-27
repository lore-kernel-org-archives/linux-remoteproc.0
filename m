Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v4 15/17] remoteproc: da8xx: declare reserved memory region for vdev device
Date: Fri, 27 Jul 2018 15:14:50 +0200
Message-ID: <1532697292-14272-16-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
References: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, s-anna@ti.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch introduces da8xx_rproc_parse_fw() to declare a
carveout region based on reserved memory for vdev buffer
allocation.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/da8xx_remoteproc.c | 38 +++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index b668e32..679a076 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -16,6 +16,7 @@
 #include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of_address.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/remoteproc.h>
@@ -179,10 +180,47 @@ static void da8xx_rproc_kick(struct rproc *rproc, int vqid)
 	writel(SYSCFG_CHIPSIG2, drproc->chipsig);
 }
 
+static int da8xx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	struct device *dev = rproc->dev.parent;
+	struct rproc_mem_entry *mem;
+	struct device_node *node;
+	struct resource res;
+	int err;
+
+	node = of_parse_phandle(dev->of_node, "memory-region", 0);
+	if (!node) {
+		dev_err(dev, "No memory-region specified\n");
+		return -EINVAL;
+	}
+
+	err = of_address_to_resource(node, 0, &res);
+	if (err) {
+		dev_err(dev, "Bad memory-region definition\n");
+		return err;
+	}
+
+	/* Register memory region for vdev buffer allocation */
+	mem = rproc_of_resm_mem_entry_init(dev, 0, resource_size(&res),
+					   res.start, "vdev0buffer");
+
+	if (!mem)
+		return -ENOMEM;
+
+	rproc_add_carveout(rproc, mem);
+
+	return rproc_elf_load_rsc_table(rproc, fw);
+}
+
 static const struct rproc_ops da8xx_rproc_ops = {
 	.start = da8xx_rproc_start,
 	.stop = da8xx_rproc_stop,
 	.kick = da8xx_rproc_kick,
+	.parse_fw = da8xx_rproc_parse_fw,
+	.load = rproc_elf_load_segments,
+	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
+	.sanity_check = rproc_elf_sanity_check,
+	.get_boot_addr = rproc_elf_get_boot_addr,
 };
 
 static int da8xx_rproc_get_internal_memories(struct platform_device *pdev,
-- 
1.9.1
