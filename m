Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B6621441D;
	Fri, 25 Oct 2024 21:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729890109; cv=none; b=Aag4QzDwQ8cmQ7qqJPcfsgzNgrVq3isrTDjwe/GCQGP8PUbplbJLfhV/P2+Qw1WzFxS1C9iBoRRuJ4II00Ekl1ZhGj+zzQdJ7YwhIwxEd/DRx7l73BX1Q7xoyNt+elfQouaxAX/9g0RG1SkC3h7qr4FzDEjkcRwp5S6H75QaFpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729890109; c=relaxed/simple;
	bh=7bqGUgJ+D4rKiv14URUVZeYC5YP2JjDXckXCnF3xyUs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NswUXiSXTZZnrkVA1S0PVeOI+kNbhlD6JDBtOBHu/bwe1mO0yjsLms8H7mEtkuIZJxgsFRjjuiOK9/ao/yzuS5xfnK+4xaLerX1PZR/aoUUI2meDkIIpvNncNkzvyRAZ1Td9HEW1zzYFJV6MHdad3I+ZKzU09V/sZPgzcx3jcRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=pQU+/B0I; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="pQU+/B0I"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PBuOcY031406;
	Fri, 25 Oct 2024 23:01:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	c5iz62PeSjlWIokihA97La9pYiB5Gc4tO/64PYlEZtY=; b=pQU+/B0IhISSX9kb
	GnKuNE2JJogEOjDJ2HTNpf/J24lHZpA7xORGwOEBs9SFCQrK6lPnDMsfgLGWC08G
	asyFk2FX/uDCqehpaQA77dWVh0WWVC0JPikM9e5r5cokpoCQgFYYXK0Gs4vtDUYg
	wEEWAB+4L57qmqARaQA+zUIvbmeq3SxTcusDNi2TWKFHy8xo8mb9uXRb9c+VFO7e
	ayurTbuh6ikaqR/oQ2HYIIyCDXglV3mBuPz6Yr6UKvUyRzemGJz5PyrvbcWMzCMH
	HJ6GJLJ0go3SOqNgqrFVN5F/cER9HznXDiVKCFTX0PZxYM63Gj9Ca1kQjkd1zcuU
	5Z7xCw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42em4dyk0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 23:01:32 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4873140045;
	Fri, 25 Oct 2024 23:00:27 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F191F231944;
	Fri, 25 Oct 2024 22:59:34 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 25 Oct
 2024 22:59:34 +0200
Received: from localhost (10.252.3.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 25 Oct
 2024 22:59:34 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>, <devicetree@vger.kernel.org>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v12 2/7] remoteproc: Add TEE support
Date: Fri, 25 Oct 2024 22:59:19 +0200
Message-ID: <20241025205924.2087768-3-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241025205924.2087768-1-arnaud.pouliquen@foss.st.com>
References: <20241025205924.2087768-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Add a remoteproc TEE (Trusted Execution Environment) driver
that will be probed by the TEE bus. If the associated Trusted
application is supported on secure part this driver offers a client
interface to load a firmware by the secure part.
This firmware could be authenticated by the secure trusted application.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
Updates vs previous version:
- rename structures, functions, and variables from "tee_rproc_xxx" to
  "rproc_tee_xxx",
- update rproc_tee_register to return an error instead of
  "struct rproc_tee *" pointer,
- update rproc_tee_unregister argument from "struct rproc_tee *trproc"
  to "struct rproc *rproc",
- reword MODULE_DESCRIPTION.
---
 drivers/remoteproc/Kconfig          |  10 +
 drivers/remoteproc/Makefile         |   1 +
 drivers/remoteproc/remoteproc_tee.c | 510 ++++++++++++++++++++++++++++
 include/linux/remoteproc.h          |   4 +
 include/linux/remoteproc_tee.h      | 106 ++++++
 5 files changed, 631 insertions(+)
 create mode 100644 drivers/remoteproc/remoteproc_tee.c
 create mode 100644 include/linux/remoteproc_tee.h

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 955e4e38477e..d0284220a194 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -23,6 +23,16 @@ config REMOTEPROC_CDEV
 
 	  It's safe to say N if you don't want to use this interface.
 
+config REMOTEPROC_TEE
+	tristate "Remoteproc support by a TEE application"
+	depends on OPTEE
+	help
+	  Support a remote processor with a TEE application. The Trusted
+	  Execution Context is responsible for loading the trusted firmware
+	  image and managing the remote processor's lifecycle.
+
+	  It's safe to say N if you don't want to use remoteproc TEE.
+
 config IMX_REMOTEPROC
 	tristate "i.MX remoteproc support"
 	depends on ARCH_MXC
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 5ff4e2fee4ab..f77e0abe8349 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -11,6 +11,7 @@ remoteproc-y				+= remoteproc_sysfs.o
 remoteproc-y				+= remoteproc_virtio.o
 remoteproc-y				+= remoteproc_elf_loader.o
 obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
+obj-$(CONFIG_REMOTEPROC_TEE)		+= remoteproc_tee.o
 obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
 obj-$(CONFIG_IMX_DSP_REMOTEPROC)	+= imx_dsp_rproc.o
 obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
diff --git a/drivers/remoteproc/remoteproc_tee.c b/drivers/remoteproc/remoteproc_tee.c
new file mode 100644
index 000000000000..f258b9304daf
--- /dev/null
+++ b/drivers/remoteproc/remoteproc_tee.c
@@ -0,0 +1,510 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) STMicroelectronics 2024
+ * Author: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
+ */
+
+#include <linux/firmware.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/remoteproc.h>
+#include <linux/remoteproc_tee.h>
+#include <linux/slab.h>
+#include <linux/tee_drv.h>
+
+#define MAX_TEE_PARAM_ARRAY_MEMBER	4
+
+/*
+ * Authentication of the firmware and load in the remote processor memory
+ *
+ * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
+ * [in]	 params[1].memref:	buffer containing the image of the buffer
+ */
+#define TA_RPROC_FW_CMD_LOAD_FW		1
+
+/*
+ * Start the remote processor
+ *
+ * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
+ */
+#define TA_RPROC_FW_CMD_START_FW	2
+
+/*
+ * Stop the remote processor
+ *
+ * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
+ */
+#define TA_RPROC_FW_CMD_STOP_FW		3
+
+/*
+ * Return the address of the resource table, or 0 if not found
+ * No check is done to verify that the address returned is accessible by
+ * the non secure context. If the resource table is loaded in a protected
+ * memory the access by the non secure context will lead to a data abort.
+ *
+ * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
+ * [out]  params[1].value.a:	32bit LSB resource table memory address
+ * [out]  params[1].value.b:	32bit MSB resource table memory address
+ * [out]  params[2].value.a:	32bit LSB resource table memory size
+ * [out]  params[2].value.b:	32bit MSB resource table memory size
+ */
+#define TA_RPROC_FW_CMD_GET_RSC_TABLE	4
+
+/*
+ * Return the address of the core dump
+ *
+ * [in]  params[0].value.a:	unique 32bit identifier of the remote processor
+ * [out] params[1].memref:	address of the core dump image if exist,
+ *				else return Null
+ */
+#define TA_RPROC_FW_CMD_GET_COREDUMP	5
+
+/*
+ * Release remote processor firmware images and associated resources.
+ * This command should be used in case an error occurs between the loading of
+ * the firmware images (A_RPROC_CMD_LOAD_FW) and the starting of the remote
+ * processor (TA_RPROC_CMD_START_FW) or after stopping the remote processor
+ * to release associated resources (TA_RPROC_CMD_STOP_FW).
+ *
+ * [in]  params[0].value.a: Unique 32-bit remote processor identifier
+ */
+#define TA_RPROC_CMD_RELEASE_FW		6
+
+struct rproc_tee_context {
+	struct list_head sessions;
+	struct tee_context *tee_ctx;
+	struct device *dev;
+};
+
+static struct rproc_tee_context *rproc_tee_ctx;
+
+static void rproc_tee_prepare_args(struct rproc_tee *trproc, int cmd,
+				   struct tee_ioctl_invoke_arg *arg,
+				   struct tee_param *param,
+				   unsigned int num_params)
+{
+	memset(arg, 0, sizeof(*arg));
+	memset(param, 0, MAX_TEE_PARAM_ARRAY_MEMBER * sizeof(*param));
+
+	arg->func = cmd;
+	arg->session = trproc->session_id;
+	arg->num_params = num_params + 1;
+
+	param[0] = (struct tee_param) {
+		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
+		.u.value.a = trproc->rproc_id,
+	};
+}
+
+void rproc_tee_release_fw(struct rproc *rproc)
+{
+	struct tee_param param[MAX_TEE_PARAM_ARRAY_MEMBER];
+	struct rproc_tee *trproc = rproc->rproc_tee_itf;
+	struct tee_ioctl_invoke_arg arg;
+	int ret;
+
+	if (!rproc) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/*
+	 * If the remote processor state is RPROC_DETACHED, just ignore the
+	 * request, as the remote processor is still running.
+	 */
+	if (rproc->state == RPROC_DETACHED)
+		return;
+
+	if (rproc->state != RPROC_OFFLINE) {
+		ret = -EBUSY;
+		goto out;
+	}
+
+	rproc_tee_prepare_args(trproc, TA_RPROC_CMD_RELEASE_FW, &arg, param, 0);
+
+	ret = tee_client_invoke_func(rproc_tee_ctx->tee_ctx, &arg, param);
+	if (ret < 0 || arg.ret != 0) {
+		dev_err(rproc_tee_ctx->dev,
+			"TA_RPROC_CMD_RELEASE_FW invoke failed TEE err: %x, ret:%x\n",
+			arg.ret, ret);
+		ret = -EIO;
+	}
+
+out:
+	if (ret)
+		/* Unexpected state without solution to come back in a stable state */
+		dev_err(rproc_tee_ctx->dev, "Failed to release TEE remoteproc firmware: %d\n", ret);
+}
+EXPORT_SYMBOL_GPL(rproc_tee_release_fw);
+
+int rproc_tee_load_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	struct tee_param param[MAX_TEE_PARAM_ARRAY_MEMBER];
+	struct rproc_tee *trproc = rproc->rproc_tee_itf;
+	struct tee_ioctl_invoke_arg arg;
+	struct tee_shm *fw_shm;
+	int ret;
+
+	if (!trproc)
+		return -EINVAL;
+
+	fw_shm = tee_shm_register_kernel_buf(rproc_tee_ctx->tee_ctx, (void *)fw->data, fw->size);
+	if (IS_ERR(fw_shm))
+		return PTR_ERR(fw_shm);
+
+	rproc_tee_prepare_args(trproc, TA_RPROC_FW_CMD_LOAD_FW, &arg, param, 1);
+
+	/* Provide the address of the firmware image */
+	param[1] = (struct tee_param) {
+		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
+		.u.memref = {
+			.shm = fw_shm,
+			.size = fw->size,
+			.shm_offs = 0,
+		},
+	};
+
+	ret = tee_client_invoke_func(rproc_tee_ctx->tee_ctx, &arg, param);
+	if (ret < 0 || arg.ret != 0) {
+		dev_err(rproc_tee_ctx->dev,
+			"TA_RPROC_FW_CMD_LOAD_FW invoke failed TEE err: %x, ret:%x\n",
+			arg.ret, ret);
+		if (!ret)
+			ret = -EIO;
+	}
+
+	tee_shm_free(fw_shm);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(rproc_tee_load_fw);
+
+static int rproc_tee_get_loaded_rsc_table(struct rproc *rproc, phys_addr_t *rsc_pa,
+					  size_t *table_sz)
+{
+	struct tee_param param[MAX_TEE_PARAM_ARRAY_MEMBER];
+	struct rproc_tee *trproc = rproc->rproc_tee_itf;
+	struct tee_ioctl_invoke_arg arg;
+	int ret;
+
+	if (!trproc)
+		return -EINVAL;
+
+	rproc_tee_prepare_args(trproc, TA_RPROC_FW_CMD_GET_RSC_TABLE, &arg, param, 2);
+
+	param[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
+	param[2].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
+
+	ret = tee_client_invoke_func(rproc_tee_ctx->tee_ctx, &arg, param);
+	if (ret < 0 || arg.ret != 0) {
+		dev_err(rproc_tee_ctx->dev,
+			"TA_RPROC_FW_CMD_GET_RSC_TABLE invoke failed TEE err: %x, ret:%x\n",
+			arg.ret, ret);
+		return -EIO;
+	}
+
+	*table_sz = param[2].u.value.a;
+
+	if (*table_sz)
+		*rsc_pa = param[1].u.value.a;
+	else
+		*rsc_pa  = 0;
+
+	return 0;
+}
+
+int rproc_tee_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	phys_addr_t rsc_table;
+	void __iomem *rsc_va;
+	size_t table_sz;
+	int ret;
+
+	if (!rproc)
+		return -EINVAL;
+
+	ret = rproc_tee_load_fw(rproc, fw);
+	if (ret)
+		return ret;
+
+	ret = rproc_tee_get_loaded_rsc_table(rproc, &rsc_table, &table_sz);
+	if (ret)
+		goto release_fw;
+
+	/*
+	 * We assume here that the memory mapping is the same between the TEE and Linux kernel
+	 * contexts. Else a new TEE remoteproc service could be needed to get a copy of the
+	 * resource table
+	 */
+	rsc_va = ioremap_wc(rsc_table, table_sz);
+	if (IS_ERR_OR_NULL(rsc_va)) {
+		dev_err(rproc_tee_ctx->dev, "Unable to map memory region: %pa+%zx\n",
+			&rsc_table, table_sz);
+		ret = -ENOMEM;
+		goto release_fw;
+	}
+
+	/*
+	 * Create a copy of the resource table to have the same behavior as the ELF loader.
+	 * This cached table will be used by the remoteproc core after the remoteproc stops
+	 * to free resources and for crash recovery to reapply the settings.
+	 * The cached table will be freed by the remoteproc core.
+	 */
+	rproc->cached_table = kmemdup((__force void *)rsc_va, table_sz, GFP_KERNEL);
+	iounmap(rsc_va);
+
+	if (!rproc->cached_table) {
+		ret = -ENOMEM;
+		goto release_fw;
+	}
+
+	rproc->table_ptr = rproc->cached_table;
+	rproc->table_sz = table_sz;
+
+	return 0;
+
+release_fw:
+	rproc_tee_release_fw(rproc);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(rproc_tee_parse_fw);
+
+struct resource_table *rproc_tee_find_loaded_rsc_table(struct rproc *rproc,
+						       const struct firmware *fw)
+{
+	phys_addr_t rsc_table;
+	size_t table_sz;
+	int ret;
+
+	ret = rproc_tee_get_loaded_rsc_table(rproc, &rsc_table, &table_sz);
+	if (ret)
+		return NULL;
+
+	rproc->table_sz = table_sz;
+	if (!table_sz)
+		return NULL;
+
+	/*
+	 * At this step the memory area that contains the resource table should have been registered
+	 * by the remote proc platform driver and allocated by rproc_alloc_registered_carveouts().
+	 */
+	return (struct resource_table *)rproc_pa_to_va(rproc, rsc_table, table_sz, NULL);
+}
+EXPORT_SYMBOL_GPL(rproc_tee_find_loaded_rsc_table);
+
+int rproc_tee_start(struct rproc *rproc)
+{
+	struct tee_param param[MAX_TEE_PARAM_ARRAY_MEMBER];
+	struct rproc_tee *trproc = rproc->rproc_tee_itf;
+	struct tee_ioctl_invoke_arg arg;
+	int ret = 0;
+
+	if (!trproc)
+		return -EINVAL;
+
+	rproc_tee_prepare_args(trproc, TA_RPROC_FW_CMD_START_FW, &arg, param, 0);
+
+	ret = tee_client_invoke_func(rproc_tee_ctx->tee_ctx, &arg, param);
+	if (ret < 0 || arg.ret != 0) {
+		dev_err(rproc_tee_ctx->dev,
+			"TA_RPROC_FW_CMD_START_FW invoke failed TEE err: %x, ret:%x\n",
+			arg.ret, ret);
+		if (!ret)
+			return  -EIO;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(rproc_tee_start);
+
+int rproc_tee_stop(struct rproc *rproc)
+{
+	struct tee_param param[MAX_TEE_PARAM_ARRAY_MEMBER];
+	struct rproc_tee *trproc = rproc->rproc_tee_itf;
+	struct tee_ioctl_invoke_arg arg;
+	int ret;
+
+	if (!trproc)
+		return -EINVAL;
+
+	rproc_tee_prepare_args(trproc, TA_RPROC_FW_CMD_STOP_FW, &arg, param, 0);
+
+	ret = tee_client_invoke_func(rproc_tee_ctx->tee_ctx, &arg, param);
+	if (ret < 0 || arg.ret != 0) {
+		dev_err(rproc_tee_ctx->dev,
+			"TA_RPROC_FW_CMD_STOP_FW invoke failed TEE err: %x, ret:%x\n",
+			arg.ret, ret);
+		if (!ret)
+			ret = -EIO;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(rproc_tee_stop);
+
+static const struct tee_client_device_id rproc_tee_id_table[] = {
+	{UUID_INIT(0x80a4c275, 0x0a47, 0x4905, 0x82, 0x85, 0x14, 0x86, 0xa9, 0x77, 0x1a, 0x08)},
+	{}
+};
+
+int rproc_tee_register(struct device *dev, struct rproc *rproc, unsigned int rproc_id)
+{
+	struct tee_param param[MAX_TEE_PARAM_ARRAY_MEMBER];
+	struct tee_ioctl_open_session_arg sess_arg;
+	struct tee_client_device *tee_device;
+	struct rproc_tee *trproc;
+	int ret;
+
+	/*
+	 * Test if the device has been probed by the TEE bus. In case of failure, we ignore the
+	 * reason. The bus could be not yet probed or the service not available in the secure
+	 * firmware.The assumption in such a case is that the TEE remoteproc is not probed.
+	 */
+	if (!rproc_tee_ctx)
+		return -EPROBE_DEFER;
+
+	/* Prevent rproc tee module from being removed */
+	if (!try_module_get(THIS_MODULE)) {
+		dev_err(rproc_tee_ctx->dev, "can't get owner\n");
+		return -ENODEV;
+	}
+
+	trproc =  devm_kzalloc(dev, sizeof(*trproc), GFP_KERNEL);
+	if (!trproc) {
+		ret = -ENOMEM;
+		goto module_put;
+	}
+
+	tee_device = to_tee_client_device(rproc_tee_ctx->dev);
+	memset(&sess_arg, 0, sizeof(sess_arg));
+
+	memcpy(sess_arg.uuid, tee_device->id.uuid.b, TEE_IOCTL_UUID_LEN);
+
+	sess_arg.clnt_login = TEE_IOCTL_LOGIN_REE_KERNEL;
+	sess_arg.num_params = 1;
+
+	param[0] = (struct tee_param) {
+		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
+		.u.value.a = rproc_id,
+	};
+
+	ret = tee_client_open_session(rproc_tee_ctx->tee_ctx, &sess_arg, param);
+	if (ret < 0 || sess_arg.ret != 0) {
+		dev_err(dev, "tee_client_open_session failed, err: %x\n", sess_arg.ret);
+		ret = -EINVAL;
+		goto module_put;
+	}
+
+	trproc->parent = dev;
+	trproc->rproc_id = rproc_id;
+	trproc->session_id = sess_arg.session;
+
+	trproc->rproc = rproc;
+	rproc->rproc_tee_itf = trproc;
+
+	list_add_tail(&trproc->node, &rproc_tee_ctx->sessions);
+
+	return 0;
+
+module_put:
+	module_put(THIS_MODULE);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(rproc_tee_register);
+
+int rproc_tee_unregister(struct rproc *rproc)
+{
+	struct rproc_tee *trproc = rproc->rproc_tee_itf;
+	int ret;
+
+	if (!rproc->rproc_tee_itf)
+		return -ENODEV;
+
+	ret = tee_client_close_session(rproc_tee_ctx->tee_ctx, trproc->session_id);
+	if (ret < 0)
+		dev_err(trproc->parent,	"tee_client_close_session failed, err: %x\n", ret);
+
+	list_del(&trproc->node);
+	rproc->rproc_tee_itf = NULL;
+
+	module_put(THIS_MODULE);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(rproc_tee_unregister);
+
+static int rproc_tee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
+{
+	/* Today we support only the OP-TEE, could be extend to other tees */
+	return (ver->impl_id == TEE_IMPL_ID_OPTEE);
+}
+
+static int rproc_tee_probe(struct device *dev)
+{
+	struct tee_context *tee_ctx;
+	int ret;
+
+	/* Open context with TEE driver */
+	tee_ctx = tee_client_open_context(NULL, rproc_tee_ctx_match, NULL, NULL);
+	if (IS_ERR(tee_ctx))
+		return PTR_ERR(tee_ctx);
+
+	rproc_tee_ctx = devm_kzalloc(dev, sizeof(*rproc_tee_ctx), GFP_KERNEL);
+	if (!rproc_tee_ctx) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	rproc_tee_ctx->dev = dev;
+	rproc_tee_ctx->tee_ctx = tee_ctx;
+	INIT_LIST_HEAD(&rproc_tee_ctx->sessions);
+
+	return 0;
+err:
+	tee_client_close_context(tee_ctx);
+
+	return ret;
+}
+
+static int rproc_tee_remove(struct device *dev)
+{
+	struct rproc_tee *entry, *tmp;
+
+	list_for_each_entry_safe(entry, tmp, &rproc_tee_ctx->sessions, node) {
+		tee_client_close_session(rproc_tee_ctx->tee_ctx, entry->session_id);
+		list_del(&entry->node);
+		kfree(entry);
+	}
+
+	tee_client_close_context(rproc_tee_ctx->tee_ctx);
+
+	return 0;
+}
+
+MODULE_DEVICE_TABLE(tee, rproc_tee_id_table);
+
+static struct tee_client_driver rproc_tee_fw_driver = {
+	.id_table	= rproc_tee_id_table,
+	.driver		= {
+		.name		= KBUILD_MODNAME,
+		.bus		= &tee_bus_type,
+		.probe		= rproc_tee_probe,
+		.remove		= rproc_tee_remove,
+	},
+};
+
+static int __init rproc_tee_fw_mod_init(void)
+{
+	return driver_register(&rproc_tee_fw_driver.driver);
+}
+
+static void __exit rproc_tee_fw_mod_exit(void)
+{
+	driver_unregister(&rproc_tee_fw_driver.driver);
+}
+
+module_init(rproc_tee_fw_mod_init);
+module_exit(rproc_tee_fw_mod_exit);
+
+MODULE_DESCRIPTION(" remote processor TEE module");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 8fd0d7f63c8e..2e0ddcb2d792 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -503,6 +503,8 @@ enum rproc_features {
 	RPROC_MAX_FEATURES,
 };
 
+struct rproc_tee;
+
 /**
  * struct rproc - represents a physical remote processor device
  * @node: list node of this rproc object
@@ -545,6 +547,7 @@ enum rproc_features {
  * @cdev: character device of the rproc
  * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
  * @features: indicate remoteproc features
+ * @rproc_tee_itf: pointer to the remoteproc tee context
  */
 struct rproc {
 	struct list_head node;
@@ -586,6 +589,7 @@ struct rproc {
 	struct cdev cdev;
 	bool cdev_put_on_release;
 	DECLARE_BITMAP(features, RPROC_MAX_FEATURES);
+	struct rproc_tee *rproc_tee_itf;
 };
 
 /**
diff --git a/include/linux/remoteproc_tee.h b/include/linux/remoteproc_tee.h
new file mode 100644
index 000000000000..b9ec63505a5c
--- /dev/null
+++ b/include/linux/remoteproc_tee.h
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright(c) 2024 STMicroelectronics
+ */
+
+#ifndef REMOTEPROC_TEE_H
+#define REMOTEPROC_TEE_H
+
+#include <linux/tee_drv.h>
+#include <linux/firmware.h>
+#include <linux/remoteproc.h>
+
+struct rproc;
+
+/**
+ * struct rproc_tee - TEE remoteproc structure
+ * @node:		Reference in list
+ * @rproc:		Remoteproc reference
+ * @parent:		Parent device
+ * @rproc_id:		Identifier of the target firmware
+ * @session_id:		TEE session identifier
+ */
+struct rproc_tee {
+	struct list_head node;
+	struct rproc *rproc;
+	struct device *parent;
+	u32 rproc_id;
+	u32 session_id;
+};
+
+#if IS_REACHABLE(CONFIG_REMOTEPROC_TEE)
+
+int rproc_tee_register(struct device *dev, struct rproc *rproc, unsigned int rproc_id);
+int rproc_tee_unregister(struct rproc *rproc);
+int rproc_tee_parse_fw(struct rproc *rproc, const struct firmware *fw);
+int rproc_tee_load_fw(struct rproc *rproc, const struct firmware *fw);
+void rproc_tee_release_fw(struct rproc *rproc);
+struct resource_table *rproc_tee_find_loaded_rsc_table(struct rproc *rproc,
+						       const struct firmware *fw);
+int rproc_tee_start(struct rproc *rproc);
+int rproc_tee_stop(struct rproc *rproc);
+
+#else
+
+static inline struct rproc_tee *rproc_tee_register(struct device *dev, struct rproc *rproc,
+						   unsigned int rproc_id)
+{
+	return ERR_PTR(-ENODEV);
+}
+
+static inline int rproc_tee_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return 0;
+}
+
+static inline int rproc_tee_unregister(struct rproc_tee *trproc)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return 0;
+}
+
+static inline int rproc_tee_load_fw(struct rproc *rproc,  const struct firmware *fw)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return 0;
+}
+
+static inline int rproc_tee_start(struct rproc *rproc)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return 0;
+}
+
+static inline int rproc_tee_stop(struct rproc *rproc)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return 0;
+}
+
+static inline void rproc_tee_release_fw(struct rproc *rproc)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+}
+
+static inline struct resource_table *
+rproc_tee_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *fw)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+
+	return NULL;
+}
+#endif /* CONFIG_REMOTEPROC_TEE */
+#endif /* REMOTEPROC_TEE_H */
-- 
2.25.1

