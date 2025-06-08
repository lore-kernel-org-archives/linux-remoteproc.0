Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D108D288DB;
	Sun,  8 Jun 2025 02:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749350444; cv=pass; b=MRWGiV3bsa+qv2sSMj1uLFdEQHwLKgzpVNsZqp9y/fJzdrzHlODzfNd1z67ita0UyirgehyUKRvGRDyw+IAyU4/fF+Ow+K4bWmXFXxvbB5poTtRhpQYn9hHgKRkvgdMVPt+8iwvPjNNKCQ4hMKqPYoFEX3YEnpMsSOVpjuLea+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749350444; c=relaxed/simple;
	bh=pxVyFbX/Ddch/pyVx11kvYV760D2OOpkNd/hBW4z5g8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ODnpQit8bZsKSeqhWZUGXOd8GemHaryaXEOEstY4SWmcEnr4TVSO0TvGzXvtUOVOjQzYzYPEVDaUDg1HcdQkq/pcrl6LIK8LqZjSHJUc0Yn1RbvqhysXSTz3+LLUc2Jlpbm4BLC6hNIzMYS0J9CtYR/gjYWRzEyWO/g7KRSpKNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=KMtZEeQf; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="KMtZEeQf"
ARC-Seal: i=1; a=rsa-sha256; t=1749350411; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GDy9IPf77FiO1LI7giALtV5drf2MsrqBbcKotNNYi1SU9E6LHbIo8RhZabjNQ7dPwf9gmFD8WT9Uoe7LFxExnnRbif9JHacOvaQoyBnluDYZG8AjujJa/orHIICR1FUnEIM4uJ4n07+lVitDNH/4A5Z2iV2hNaFRJDRefuPjCD4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749350411; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5svXE7DFLiNA8Y0yUzTPzpzC0QbCj9kAVIbvj+Nw1Uw=; 
	b=nMTUNn1krYlvmYefSZK2MVhcAgIi9+q5xCQP2eMcHDeYlJfl73ugJRFuJj5WQDvn4HFgU5y6oO7jn060fY7Me3KIR8deVmXUyZHs9+eMZPJALReFrJWpAlTAEPSMze+iL4m7ymcr70JP164Xg5Vmo0/B7NPTGuMglnlWI8jh138=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749350410;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=5svXE7DFLiNA8Y0yUzTPzpzC0QbCj9kAVIbvj+Nw1Uw=;
	b=KMtZEeQfGOBwJjzk9ZS+Xwc4+qTJHvhj8ClgXYdY+6ATbZSgnoLOxF2kP88G0JeA
	xvSbjpTlmTfQ2MQQSlXdAn95r1ucgXj8ge1mgcbkP+WSvD3wtbKPvC3ruCT4MxZe0Mm
	pTvKRRWShOlMpGAxpX3ju3tPjDVIVulXmuh3KxOE=
Received: by mx.zohomail.com with SMTPS id 1749350408370445.01029448573786;
	Sat, 7 Jun 2025 19:40:08 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Sun, 08 Jun 2025 10:37:40 +0800
Subject: [PATCH 2/2] drivers: remoteproc: Add C906L controller for Sophgo
 CV1800B SoC
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250608-cv1800-rproc-v1-2-57cf66cdf6a3@pigmoral.tech>
References: <20250608-cv1800-rproc-v1-0-57cf66cdf6a3@pigmoral.tech>
In-Reply-To: <20250608-cv1800-rproc-v1-0-57cf66cdf6a3@pigmoral.tech>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Junhui Liu <junhui.liu@pigmoral.tech>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749350360; l=8606;
 i=junhui.liu@pigmoral.tech; s=20250507; h=from:subject:message-id;
 bh=pxVyFbX/Ddch/pyVx11kvYV760D2OOpkNd/hBW4z5g8=;
 b=28L4UDoddAB1Pp72y1g0749z/wuM67fjIcJCF32t9P7X+qWjhplVXgogCNNcKdpMECBvsqMbg
 71k20X+qPeECO9vDJ0keJBUqJq8RitILS2BfeaA0U/Y9HtR+j/kDlAO
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=d3i4H2mg9LUn4SQemoLAjLRQy0nTcyknIv6zgKMwiBA=
X-ZohoMailClient: External

Add initial support for the C906L remote processor found in the Sophgo
CV1800B SoC. The C906L is an asymmetric core typically used to run an
RTOS. This driver enables firmware loading and start/stop control of the
C906L processor via the remoteproc framework.

The C906L and the main application processor can communicate through
mailboxes [1]. Support for mailbox-based functionality will be added in
a separate patch.

Link: https://lore.kernel.org/linux-riscv/20250520-cv18xx-mbox-v4-0-fd4f1c676d6e@pigmoral.tech/ [1]
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/remoteproc/Kconfig                |   9 ++
 drivers/remoteproc/Makefile               |   1 +
 drivers/remoteproc/sophgo_cv1800b_c906l.c | 233 ++++++++++++++++++++++++++++++
 3 files changed, 243 insertions(+)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 83962a114dc9fdb3260e6e922602f2da53106265..7b09a8f00332605ee528ff7c21c31091c10c2bf5 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -299,6 +299,15 @@ config RCAR_REMOTEPROC
 	  This can be either built-in or a loadable module.
 	  If compiled as module (M), the module name is rcar_rproc.
 
+config SOPHGO_CV1800B_C906L
+	tristate "Sophgo CV1800B C906L remoteproc support"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	help
+	  Say y here to support CV1800B C906L remote processor via the remote
+	  processor framework.
+
+	  It's safe to say N here.
+
 config ST_REMOTEPROC
 	tristate "ST remoteproc support"
 	depends on ARCH_STI
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 1c7598b8475d6057a3e044b41e3515103b7aa9f1..3c1e9387491cedc9dda8219f1e9130a84538156f 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -33,6 +33,7 @@ obj-$(CONFIG_QCOM_WCNSS_PIL)		+= qcom_wcnss_pil.o
 qcom_wcnss_pil-y			+= qcom_wcnss.o
 qcom_wcnss_pil-y			+= qcom_wcnss_iris.o
 obj-$(CONFIG_RCAR_REMOTEPROC)		+= rcar_rproc.o
+obj-$(CONFIG_SOPHGO_CV1800B_C906L)	+= sophgo_cv1800b_c906l.o
 obj-$(CONFIG_ST_REMOTEPROC)		+= st_remoteproc.o
 obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+= st_slim_rproc.o
 obj-$(CONFIG_STM32_RPROC)		+= stm32_rproc.o
diff --git a/drivers/remoteproc/sophgo_cv1800b_c906l.c b/drivers/remoteproc/sophgo_cv1800b_c906l.c
new file mode 100644
index 0000000000000000000000000000000000000000..f3c8d8fd4f796d0cf64f8ab0dd797e017b8e8be7
--- /dev/null
+++ b/drivers/remoteproc/sophgo_cv1800b_c906l.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2025 Junhui Liu <junhui.liu@pigmoral.tech>
+ */
+
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/remoteproc.h>
+#include <linux/reset.h>
+#include <linux/regmap.h>
+
+#include "remoteproc_internal.h"
+
+#define CV1800B_SYS_C906L_CTRL_REG	0x04
+#define   CV1800B_SYS_C906L_CTRL_EN	BIT(13)
+
+#define CV1800B_SYS_C906L_BOOTADDR_REG	0x20
+
+/**
+ * struct cv1800b_c906l - C906L remoteproc structure
+ * @dev: private pointer to the device
+ * @reset: reset control handle
+ * @rproc: the remote processor handle
+ * @syscon: regmap for accessing security system registers
+ */
+struct cv1800b_c906l {
+	struct device *dev;
+	struct reset_control *reset;
+	struct rproc *rproc;
+	struct regmap *syscon;
+};
+
+static int cv1800b_c906l_mem_alloc(struct rproc *rproc,
+				   struct rproc_mem_entry *mem)
+{
+	void *va;
+
+	va = ioremap_wc(mem->dma, mem->len);
+	if (IS_ERR_OR_NULL(va))
+		return -ENOMEM;
+
+	/* Update memory entry va */
+	mem->va = va;
+
+	return 0;
+}
+
+static int cv1800b_c906l_mem_release(struct rproc *rproc,
+				     struct rproc_mem_entry *mem)
+{
+	iounmap(mem->va);
+
+	return 0;
+}
+
+static int cv1800b_c906l_add_carveout(struct rproc *rproc)
+{
+	struct device *dev = rproc->dev.parent;
+	struct device_node *np = dev->of_node;
+	struct of_phandle_iterator it;
+	struct rproc_mem_entry *mem;
+	struct reserved_mem *rmem;
+
+	/* Register associated reserved memory regions */
+	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
+	while (of_phandle_iterator_next(&it) == 0) {
+		rmem = of_reserved_mem_lookup(it.node);
+		if (!rmem) {
+			of_node_put(it.node);
+			return -EINVAL;
+		}
+
+		mem = rproc_mem_entry_init(dev, NULL, (dma_addr_t)rmem->base,
+					   rmem->size, rmem->base,
+					   cv1800b_c906l_mem_alloc,
+					   cv1800b_c906l_mem_release,
+					   it.node->name);
+
+		if (!mem) {
+			of_node_put(it.node);
+			return -ENOMEM;
+		}
+
+		rproc_add_carveout(rproc, mem);
+	}
+
+	return 0;
+}
+
+static int cv1800b_c906l_prepare(struct rproc *rproc)
+{
+	struct cv1800b_c906l *priv = rproc->priv;
+	int ret;
+
+	ret = cv1800b_c906l_add_carveout(rproc);
+	if (ret)
+		return ret;
+
+	/*
+	 * This control bit must be set to enable the C906L remote processor.
+	 * Note that once the remote processor is running, merely clearing
+	 * this bit will not stop its execution.
+	 */
+	return regmap_update_bits(priv->syscon, CV1800B_SYS_C906L_CTRL_REG,
+				  CV1800B_SYS_C906L_CTRL_EN,
+				  CV1800B_SYS_C906L_CTRL_EN);
+}
+
+static int cv1800b_c906l_start(struct rproc *rproc)
+{
+	struct cv1800b_c906l *priv = rproc->priv;
+	u32 bootaddr[2];
+	int ret;
+
+	bootaddr[0] = lower_32_bits(rproc->bootaddr);
+	bootaddr[1] = upper_32_bits(rproc->bootaddr);
+
+	ret = regmap_bulk_write(priv->syscon, CV1800B_SYS_C906L_BOOTADDR_REG,
+				bootaddr, ARRAY_SIZE(bootaddr));
+	if (ret)
+		return ret;
+
+	return reset_control_deassert(priv->reset);
+}
+
+static int cv1800b_c906l_stop(struct rproc *rproc)
+{
+	struct cv1800b_c906l *priv = rproc->priv;
+
+	return reset_control_assert(priv->reset);
+}
+
+static int cv1800b_c906l_parse_fw(struct rproc *rproc,
+				  const struct firmware *fw)
+{
+	int ret;
+
+	ret = rproc_elf_load_rsc_table(rproc, fw);
+	if (ret == -EINVAL) {
+		dev_info(&rproc->dev, "No resource table in elf\n");
+		ret = 0;
+	}
+
+	return ret;
+}
+
+static const struct rproc_ops cv1800b_c906l_ops = {
+	.prepare = cv1800b_c906l_prepare,
+	.start = cv1800b_c906l_start,
+	.stop = cv1800b_c906l_stop,
+	.load = rproc_elf_load_segments,
+	.parse_fw = cv1800b_c906l_parse_fw,
+	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
+	.sanity_check = rproc_elf_sanity_check,
+	.get_boot_addr = rproc_elf_get_boot_addr,
+};
+
+static int cv1800b_c906l_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct cv1800b_c906l *priv;
+	struct rproc *rproc;
+	const char *fw_name;
+	int ret;
+
+	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
+	if (ret)
+		return dev_err_probe(dev, ret, "No firmware filename given\n");
+
+	rproc = devm_rproc_alloc(dev, dev_name(dev), &cv1800b_c906l_ops,
+				 fw_name, sizeof(*priv));
+	if (!rproc)
+		return dev_err_probe(dev, -ENOMEM,
+				     "unable to allocate remoteproc\n");
+
+	rproc->has_iommu = false;
+
+	priv = rproc->priv;
+	priv->dev = dev;
+	priv->rproc = rproc;
+
+	priv->syscon = syscon_regmap_lookup_by_phandle(np, "sophgo,syscon");
+	if (IS_ERR(priv->syscon))
+		return PTR_ERR(priv->syscon);
+
+	priv->reset = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(priv->reset))
+		return dev_err_probe(dev, PTR_ERR(priv->reset),
+				     "failed to get reset control handle\n");
+
+	platform_set_drvdata(pdev, rproc);
+
+	ret = devm_rproc_add(dev, rproc);
+	if (ret)
+		return dev_err_probe(dev, ret, "rproc_add failed\n");
+
+	return 0;
+}
+
+static void cv1800b_c906l_remove(struct platform_device *pdev)
+{
+	struct rproc *rproc = platform_get_drvdata(pdev);
+
+	if (atomic_read(&rproc->power) > 0)
+		rproc_shutdown(rproc);
+
+	rproc_del(rproc);
+}
+
+static const struct of_device_id cv1800b_c906l_of_match[] = {
+	{ .compatible = "sophgo,cv1800b-c906l" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, cv1800b_c906l_of_match);
+
+static struct platform_driver cv1800b_c906l_driver = {
+	.probe = cv1800b_c906l_probe,
+	.remove = cv1800b_c906l_remove,
+	.driver = {
+		.name = "cv1800b-c906l",
+		.of_match_table = cv1800b_c906l_of_match,
+	},
+};
+
+module_platform_driver(cv1800b_c906l_driver);
+
+MODULE_AUTHOR("Junhui Liu <junhui.liu@pigmoral.tech>");
+MODULE_DESCRIPTION("Sophgo CV1800B C906L remote processor control driver");
+MODULE_LICENSE("GPL");

-- 
2.49.0

