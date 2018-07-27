Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v4 14/17] remoteproc: keystone: declare reserved memory region for vdev device
Date: Fri, 27 Jul 2018 15:14:49 +0200
Message-ID: <1532697292-14272-15-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
References: <1532697292-14272-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, s-anna@ti.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch introduces keystone_rproc_parse_fw() to declare a
carveout region based on reserved memory for vdev buffer
allocation, if a memory region has been declared on rproc DT node.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/keystone_remoteproc.c | 53 +++++++++++++++++++++++++++++---
 1 file changed, 49 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index aaac311..ef542f2 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -293,11 +293,56 @@ static void *keystone_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
 	return (__force void *)va;
 }
 
+/*
+ * Custom function to register platform specific memory region(s)
+ * before loading firmware resource table thanks to generic
+ * rproc_elf_load_rsc_table() function.
+ */
+static int keystone_rproc_parse_fw(struct rproc *rproc,
+				   const struct firmware *fw)
+{
+	struct device *dev = rproc->dev.parent;
+	struct rproc_mem_entry *mem;
+	struct device_node *node;
+	struct resource res;
+	int err;
+
+	node = of_parse_phandle(dev->of_node, "memory-region", 0);
+	if (!node) {
+		dev_warn(dev, "No memory-region specified\n");
+		goto out;
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
+out:
+	return rproc_elf_load_rsc_table(rproc, fw);
+}
+
 static const struct rproc_ops keystone_rproc_ops = {
-	.start		= keystone_rproc_start,
-	.stop		= keystone_rproc_stop,
-	.kick		= keystone_rproc_kick,
-	.da_to_va	= keystone_rproc_da_to_va,
+	.start			= keystone_rproc_start,
+	.stop			= keystone_rproc_stop,
+	.kick			= keystone_rproc_kick,
+	.da_to_va		= keystone_rproc_da_to_va,
+	.parse_fw		= keystone_rproc_parse_fw,
+	.load			= rproc_elf_load_segments,
+	.find_loaded_rsc_table	= rproc_elf_find_loaded_rsc_table,
+	.sanity_check		= rproc_elf_sanity_check,
+	.get_boot_addr		= rproc_elf_get_boot_addr,
+
 };
 
 static int keystone_rproc_of_get_memories(struct platform_device *pdev,
-- 
1.9.1
