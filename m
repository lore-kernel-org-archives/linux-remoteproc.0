Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 20 Jun 2016 10:41:43 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/2] remoteproc: qcom: Driver for the
 self-authenticating Hexagon v5
Message-ID: <20160620174143.GC1256@tuxbot>
References: <1466183839-5968-1-git-send-email-bjorn.andersson@linaro.org>
 <57680235.2060402@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57680235.2060402@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 20 Jun 07:48 PDT 2016, Srinivas Kandagatla wrote:

> Thanks Bjorn for this patch,
> 
> I will start playing with patch soon, but here are few comments.
> 
> On 17/06/16 18:17, Bjorn Andersson wrote:
> >From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> >
> >This initial hack powers the q6v5, boots and authenticate the mba and
> >use that to load the mdt and subsequent bXX files.
> >
> >Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> >Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >---
> >
> >Changes since v1:
> >- Corrected boot address in relocation case
> >- Using rproc_da_to_va() to clean up mdt loader api
> >- Dynamically allocating scratch space for mdt verification
> >
> >  drivers/remoteproc/Kconfig           |  12 +
> >  drivers/remoteproc/Makefile          |   2 +
> >  drivers/remoteproc/qcom_mdt_loader.c | 166 +++++++
> >  drivers/remoteproc/qcom_mdt_loader.h |  13 +
> >  drivers/remoteproc/qcom_q6v5_pil.c   | 914 +++++++++++++++++++++++++++++++++++
> 
> We should probably split this patch into two one for mdt loader and other
> for pil.
> 

I did consider it, as it's currently out for review in two different
patch sets, but I don't want to add dead code so it shouldn't be merged
on its own.

> Also checkpatch reports:
> 
> total: 1 errors, 28 warnings, 1117 lines checked
> 

I'll review that again.

[..]
> >diff --git a/drivers/remoteproc/qcom_mdt_loader.c b/drivers/remoteproc/qcom_mdt_loader.c
> >new file mode 100644
> >index 000000000000..4efeda908d9a
> >--- /dev/null
> >+++ b/drivers/remoteproc/qcom_mdt_loader.c
> >@@ -0,0 +1,166 @@
> >+/*
> >+ * Qualcomm Peripheral Image Loader
> >+ *
> >+ * Copyright (C) 2016 Linaro Ltd
> >+ * Copyright (C) 2015 Sony Mobile Communications Inc
> >+ * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
> >+ *
> >+ * This program is free software; you can redistribute it and/or
> >+ * modify it under the terms of the GNU General Public License
> >+ * version 2 as published by the Free Software Foundation.
> >+ *
> >+ * This program is distributed in the hope that it will be useful,
> >+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >+ * GNU General Public License for more details.
> >+ */
> >+
> >+#include <linux/elf.h>
> >+#include <linux/firmware.h>
> >+#include <linux/kernel.h>
> >+#include <linux/module.h>
> >+#include <linux/qcom_scm.h>
> 
> ??
> 

Leftover from being TZ-only.

> >+#include <linux/remoteproc.h>
> >+#include <linux/slab.h>
> ??
> 

For kfree() ?

> >+
> >+#include "remoteproc_internal.h"
> >+#include "qcom_mdt_loader.h"
> >+
> >+/**
> >+ * qcom_mdt_find_rsc_table() - provide dummy resource table for remoteproc
> >+ * @rproc:	remoteproc handle
> >+ * @fw:		firmware header
> >+ * @tablesz:	outgoing size of the table
> >+ *
> >+ * Returns a dummy table.
> >+ */
> >+struct resource_table *qcom_mdt_find_rsc_table(struct rproc *rproc,
> >+					       const struct firmware *fw,
> >+					       int *tablesz)
> >+{
> >+	static struct resource_table table = { .ver = 1, };
> >+
> >+	*tablesz = sizeof(table);
> >+	return &table;
> >+}
> >+EXPORT_SYMBOL_GPL(qcom_mdt_find_rsc_table);
> >+
> >+int qcom_mdt_parse(const struct firmware *fw, phys_addr_t *fw_addr, size_t *fw_size, bool *fw_relocate)
> Missing doc for this function?
> 

Yes, that should be added.

> >+{
[..]
> >+}
> >+EXPORT_SYMBOL_GPL(qcom_mdt_parse);
> >+
> >+/**
> >+ * qcom_mdt_load() - load the firmware which header is defined in fw
> >+ * @rproc:	rproc handle
> >+ * @pas_id:	PAS identifier to load this firmware into
> 
> ??
> 

Sorry, another leftover. Thanks for spotting that.

> >+ * @fw:		frimware object for the header
> 
> s/frimware/firmware
> 

Thanks.

> >+ *
> >+ * Returns 0 on success, negative errno otherwise.
> >+ */
> >+int qcom_mdt_load(struct rproc *rproc,
> >+		  const struct firmware *fw,
> >+		  const char *firmware)
> >+{
[..]
> >+}
> >+EXPORT_SYMBOL_GPL(qcom_mdt_load);
> 
> Module Licence info?
> 

Didn't consider it a module on it's own, but you're right.

[..]
> >diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
[..]
> >+
> >+static void q6v5_regulator_disable(struct q6v5 *qproc)
> >+{
> >+	regulator_bulk_disable(ARRAY_SIZE(qproc->supply), qproc->supply);
> >+	regulator_set_voltage(qproc->supply[Q6V5_SUPPLY_CX].consumer, 0, INT_MAX);
> >+	regulator_set_voltage(qproc->supply[Q6V5_SUPPLY_MX].consumer, 0, INT_MAX);
> 
> we disable the regulators and then set voltage why?
> I think these should be moved to q6v5_regulator_enable() unless am missing
> something here.
> 

Because during enable we reduce the valid range of voltages on the SMPS,
regardless of it being enabled or not. So I need to broaden that vote
for the application CPU to be allowed to vote for the lower voltages
again.


cx is however supposed to be a corner, so not sure if I should touch
that here at all. I'll replace that line with a TODO comment.

> >+	regulator_set_voltage(qproc->supply[Q6V5_SUPPLY_MSS].consumer, 0, 1150000);
> >+}
> >+
[..]
> >+
> >+static int q6v5_rmb_pbl_wait(struct q6v5 *qproc, int ms)
> >+{
> >+	unsigned long timeout;
> >+	s32 val;
> >+
> >+	timeout = jiffies + msecs_to_jiffies(ms);
> >+	for (;;) {
> >+		val = readl(qproc->rmb_base + RMB_PBL_STATUS_REG);
> >+		if (val)
> 
> I think making an explicit check for a bits of interest would be much
> readable.
> Or a comment would be good.
> 

All we do here is wait for the register to become non-zero; I can add a
short comment on the function if you would like.

> 
> >+			break;
> >+
> >+		if (time_after(jiffies, timeout))
> >+			return -ETIMEDOUT;
> >+
> >+		msleep(1);
> >+	}
> >+
> >+	return val;
> >+}
> >+
[..]
> >+
> >+static int q6v5_init_mem(struct q6v5 *qproc, struct platform_device *pdev)
> >+{
> >+	struct device_node *halt_np;
> >+	struct resource *res;
> >+	int ret;
> >+
> >+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "qdsp6");
> >+	qproc->reg_base = devm_ioremap_resource(&pdev->dev, res);
> >+	if (IS_ERR(qproc->reg_base)) {
> >+		dev_err(qproc->dev, "failed to get qdsp6_base\n");
> >+		return PTR_ERR(qproc->reg_base);
> >+	}
> >+
> >+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rmb");
> >+	qproc->rmb_base = devm_ioremap_resource(&pdev->dev, res);
> >+	if (IS_ERR(qproc->rmb_base)) {
> >+		dev_err(qproc->dev, "failed to get rmb_base\n");
> >+		return PTR_ERR(qproc->rmb_base);
> >+	}
> >+
> 
> >+	halt_np = of_parse_phandle(pdev->dev.of_node, "qcom,halt-regs", 0);
> >+	if (!halt_np) {
> >+		dev_err(&pdev->dev, "no qcom,halt-regs node\n");
> >+		return -ENODEV;
> >+	}
> >+
> >+	qproc->halt_map = syscon_node_to_regmap(halt_np);
> >+	if (IS_ERR(qproc->halt_map))
> >+		return PTR_ERR(qproc->halt_map);
> >+
> >+	ret = of_property_read_u32_index(pdev->dev.of_node, "qcom,halt-regs",
> >+					 1, &qproc->halt_q6);
> >+	if (ret < 0) {
> >+		dev_err(&pdev->dev, "no q6 halt offset\n");
> >+		return -EINVAL;
> >+	}
> >+
> >+	ret = of_property_read_u32_index(pdev->dev.of_node, "qcom,halt-regs",
> >+					 2, &qproc->halt_modem);
> >+	if (ret < 0) {
> >+		dev_err(&pdev->dev, "no modem halt offset\n");
> >+		return -EINVAL;
> >+	}
> >+
> >+	ret = of_property_read_u32_index(pdev->dev.of_node, "qcom,halt-regs",
> >+					 3, &qproc->halt_nc);
> >+	if (ret < 0) {
> >+		dev_err(&pdev->dev, "no nc halt offset\n");
> >+		return -EINVAL;
> >+	}
> We could used of_parse_phandle_with_fixed_args() here.
> 

Ahh that's better. Thanks!

> >+
> >+	return 0;
> >+}
> >+
[..]
> >+
> >+static int q6v5_alloc_memory_region(struct q6v5 *qproc)
> >+{
> >+	struct device_node *child;
> >+	struct device_node *node;
> >+	struct resource r;
> >+	int ret;
> >+
> <---
> >+	child = of_get_child_by_name(qproc->dev->of_node, "mba");
> >+	node = of_parse_phandle(child, "memory-region", 0);
> >+	ret = of_address_to_resource(node, 0, &r);
> >+	if (ret) {
> >+		dev_err(qproc->dev, "unable to resolve mba region\n");
> >+		return ret;
> >+	}
> >+
> >+	qproc->mba_phys = r.start;
> >+	qproc->mba_size = resource_size(&r);
> >+	qproc->mba_region = devm_ioremap_wc(qproc->dev, qproc->mba_phys, qproc->mba_size);
> >+	if (!qproc->mba_region) {
> >+		dev_err(qproc->dev, "unable to map memory region: %pa+%zx\n",
> >+			&r.start, qproc->mba_size);
> >+		return -EBUSY;
> >+	}
> >+
> -->
> 
> Looks like same code below, we could add a function to do the same.
> 

I'll give it some thought; in the end I'm hoping to hand this off to the
remoteproc core as "carveouts" and have it deal with the mapping and
whatnot.

> >+	child = of_get_child_by_name(qproc->dev->of_node, "mpss");
> >+	node = of_parse_phandle(child, "memory-region", 0);
> >+	ret = of_address_to_resource(node, 0, &r);
> >+	if (ret) {
> >+		dev_err(qproc->dev, "unable to resolve mpss region\n");
> >+		return ret;
> >+	}
> >+
> >+	qproc->mpss_phys = qproc->mpss_reloc = r.start;
> >+	qproc->mpss_size = resource_size(&r);
> >+	qproc->mpss_region = devm_ioremap_wc(qproc->dev, qproc->mpss_phys, qproc->mpss_size);
> >+	if (!qproc->mpss_region) {
> >+		dev_err(qproc->dev, "unable to map memory region: %pa+%zx\n",
> >+			&r.start, qproc->mpss_size);
> >+		return -EBUSY;
> >+	}
> >+
> >+	return 0;
> >+}
> >+
[..]
> >+
> >+static int q6v5_remove(struct platform_device *pdev)
> >+{
> >+	struct q6v5 *qproc = platform_get_drvdata(pdev);
> >+
> >+	rproc_del(qproc->rproc);
> >+	rproc_put(qproc->rproc);
> clk_uprepare_disable of the used clks here?
> resets?
> 

We should not end up here without passing q6v5_stop(), which handles all
resources but rom_clk; so I'll update this.

> >+
> >+	return 0;
> >+}
> >+
[..]
> >+
> >+module_platform_driver(q6v5_driver);
> 
> Module licence?
> 

Sure.

Thanks for the review Srinivas!

Regards,
Bjorn
