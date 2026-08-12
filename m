Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A11423A83;
	Wed, 12 Aug 2026 10:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786531628; cv=none; b=CK7AjW92Wa919nRXwbNuI6rrx9i9p/AFxycrA3pUTJ0sEOM4bcwe5SfF08OJpJux1wmGK8ILHUD95hjxFh4q15Rdkmpvtb/zwEqnqQILFkYMrSjjyVgucR6knKNdrLq96k3cp0s4x17U8VmIAPDt0fl+Jl1LSpiXgy7DUME44jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786531628; c=relaxed/simple;
	bh=4mp2ezuOxgaNTicIuF1O96Jr0R2GoLm0gTPpNMZZ6sI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=PL/38RNCVLetbHSENhUCVo3A1tuBU6bOg045YGQ/PB+ZTkOwAMJb6AoIhwxsbXcZkswKD4TJBsThKmYe8YWFynmpqTAOy2NXmEWawHhBMx2bZBdiMtJRnEunQlZsAxhEYPyPQewUvDSbgdhJ/jEx/ElJ3IZ3CGwtgBpy2CXFp6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A3240200012;
	Wed, 12 Aug 2026 12:47:04 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6D2C2200008;
	Wed, 12 Aug 2026 12:47:04 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 21F7A18000B0;
	Wed, 12 Aug 2026 18:47:02 +0800 (+08)
From: Jiafei Pan <Jiafei.Pan@nxp.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: krzysztof.kozlowski@linaro.org,
	peng.fan@nxp.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhiqiang.Hou@nxp.com,
	mingkai.hu@nxp.com,
	Jiafei Pan <Jiafei.Pan@nxp.com>
Subject: [PATCH v4 2/4] remoteproc: imx_rproc: add support for Cortex-A Core
Date: Wed, 12 Aug 2026 18:46:31 +0800
Message-Id: <20260812104633.22420-3-Jiafei.Pan@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260812104633.22420-1-Jiafei.Pan@nxp.com>
References: <20260511023928.39640-2-Jiafei.Pan@nxp.com>
 <20260812104633.22420-1-Jiafei.Pan@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>

Add Cortex-A Core remoteproc support, it use PSCI and SIP SMC call
to manage Cortex-A Core to be on or off.

Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 134 +++++++++++++++++++++++++++++++++
 drivers/remoteproc/imx_rproc.h |   2 +
 2 files changed, 136 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 0dd80e688b0e..8a3de27c96b7 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -6,6 +6,7 @@
 #include <dt-bindings/firmware/imx/rsrc.h>
 #include <linux/arm-smccc.h>
 #include <linux/clk.h>
+#include <linux/cpu.h>
 #include <linux/err.h>
 #include <linux/firmware/imx/sci.h>
 #include <linux/firmware/imx/sm.h>
@@ -20,12 +21,17 @@
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
+#include <linux/psci.h>
 #include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
 #include <linux/scmi_imx_protocol.h>
 #include <linux/workqueue.h>
 
+#include <uapi/linux/psci.h>
+
+#include <asm/smp_plat.h>
+
 #include "imx_rproc.h"
 #include "remoteproc_internal.h"
 
@@ -72,6 +78,8 @@
 #define IMX_SIP_RPROC_STARTED		0x01
 #define IMX_SIP_RPROC_STOP		0x02
 
+#define IMX_SIP_CPU_OFF			0xC2000012
+
 #define IMX_SC_IRQ_GROUP_REBOOTED	5
 
 /**
@@ -131,6 +139,9 @@ struct imx_rproc {
 	 * BIT 0: IMX_RPROC_FLAGS_SM_LMM_CTRL(RPROC LM is under Linux control )
 	 */
 	u32				flags;
+	/* used by Cortex-A Core remoteproc to manage all CPU Cores */
+	cpumask_t			cpus;
+	cpumask_t			offlined_cpus;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx95_m7[] = {
@@ -381,6 +392,45 @@ static int imx_rproc_sm_lmm_start(struct rproc *rproc)
 	return 0;
 }
 
+static int imx_rproc_psci_start(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	struct device *dev = priv->dev;
+	unsigned int cpu;
+	int ret;
+
+	if (cpumask_empty(&priv->cpus)) {
+		dev_err(dev, "No CPU Core assigned!\n");
+		return -ENODEV;
+	}
+
+	for_each_cpu(cpu, &priv->cpus) {
+		if (cpu_online(cpu)) {
+			ret = remove_cpu(cpu);
+			if (ret)
+				goto err;
+			cpumask_set_cpu(cpu, &priv->offlined_cpus);
+		}
+	}
+
+	cpu = cpumask_first(&priv->cpus);
+	ret = psci_ops.cpu_on(cpu_logical_map(cpu), rproc->bootaddr);
+	if (ret) {
+		dev_err(dev, "Boot failed on CPU Core %d\n", cpu);
+		goto err;
+	}
+
+	return 0;
+
+err:
+	for_each_cpu(cpu, &priv->cpus) {
+		if (!cpu_online(cpu) && add_cpu(cpu) == 0)
+			cpumask_clear_cpu(cpu, &priv->offlined_cpus);
+	}
+
+	return ret;
+}
+
 static int imx_rproc_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -456,6 +506,50 @@ static int imx_rproc_sm_lmm_stop(struct rproc *rproc)
 	return scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
 }
 
+static int imx_rproc_psci_stop(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	struct device *dev = priv->dev;
+	struct arm_smccc_res res;
+	unsigned int cpu;
+	unsigned long start, end;
+	int err;
+
+	for_each_cpu(cpu, &priv->cpus) {
+		/* Check CPU status */
+		err = psci_ops.affinity_info(cpu_logical_map(cpu), 0);
+		if (err == PSCI_0_2_AFFINITY_LEVEL_OFF)
+			continue;
+
+		/* Bring CPU to be off */
+		arm_smccc_smc(IMX_SIP_CPU_OFF, cpu, 0,
+			0, 0, 0, 0, 0, &res);
+		start = jiffies;
+		end = start + msecs_to_jiffies(100);
+		do {
+			err = psci_ops.affinity_info(cpu_logical_map(cpu), 0);
+			if (err == PSCI_0_2_AFFINITY_LEVEL_OFF) {
+				pr_info("CPU%d is killed (polled %d ms)\n", cpu,
+					jiffies_to_msecs(jiffies - start));
+				break;
+			}
+
+			usleep_range(100, 1000);
+		} while (time_before(jiffies, end));
+	}
+
+	/* Return back freed CPU Core to Linux kernel */
+	for_each_cpu(cpu, &priv->cpus) {
+		if (cpumask_test_cpu(cpu, &priv->offlined_cpus)) {
+			if (add_cpu(cpu) != 0)
+				dev_err(dev, "Failed to bring CPU %d back to be online", cpu);
+			cpumask_clear_cpu(cpu, &priv->offlined_cpus);
+		}
+	}
+
+	return 0;
+}
+
 static int imx_rproc_stop(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -480,6 +574,12 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	int i;
 
+	/* No need to translate for Cortex-A Core */
+	if (dcfg->flags & IMX_RPROC_NO_ADDR_TRANS) {
+		*sys = da;
+		return 0;
+	}
+
 	/* parse address translation table */
 	for (i = 0; i < dcfg->att_size; i++) {
 		const struct imx_rproc_att *att = &dcfg->att[i];
@@ -1184,6 +1284,13 @@ static int imx_rproc_sm_detect_mode(struct rproc *rproc)
 	return imx_rproc_sm_lmm_check(rproc, started);
 }
 
+static int imx_rproc_psci_detect_mode(struct rproc *rproc)
+{
+	rproc->state = RPROC_OFFLINE;
+
+	return 0;
+}
+
 static int imx_rproc_detect_mode(struct imx_rproc *priv)
 {
 	/*
@@ -1228,6 +1335,8 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	struct imx_rproc *priv;
 	struct rproc *rproc;
 	const struct imx_rproc_dcfg *dcfg;
+	unsigned int cpus;
+	unsigned long cpus_bits;
 	int ret;
 
 	/* set some other name then imx */
@@ -1274,6 +1383,17 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed on imx_rproc_addr_init\n");
 
+	ret = of_property_read_u32(dev->of_node, "fsl,cpus-bits", &cpus);
+	if (ret) {
+		cpumask_clear(&priv->cpus);
+	} else {
+		cpus_bits = cpus;
+		bitmap_copy(cpumask_bits(&priv->cpus), &cpus_bits,
+				min((unsigned int)nr_cpumask_bits,
+				    (unsigned int)sizeof(unsigned long)));
+		rproc->auto_boot = false;
+	}
+
 	ret = imx_rproc_detect_mode(priv);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed on detect mode\n");
@@ -1372,6 +1492,12 @@ static const struct imx_rproc_plat_ops imx_rproc_ops_sm_cpu = {
 	.stop		= imx_rproc_sm_cpu_stop,
 };
 
+static const struct imx_rproc_plat_ops imx_rproc_ops_psci = {
+	.start		= imx_rproc_psci_start,
+	.stop		= imx_rproc_psci_stop,
+	.detect_mode	= imx_rproc_psci_detect_mode,
+};
+
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
 	.src_reg	= IMX7D_SRC_SCR,
 	.src_mask	= IMX7D_M4_RST_MASK,
@@ -1464,6 +1590,13 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx95_m7 = {
 	.lmid		= 1, /* Use 1 as Logical Machine ID where M7 resides */
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_psci = {
+	.att		= NULL,
+	.att_size	= 0,
+	.ops		= &imx_rproc_ops_psci,
+	.flags		= IMX_RPROC_NO_ADDR_TRANS,
+};
+
 static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx7ulp-cm4", .data = &imx_rproc_cfg_imx7ulp },
 	{ .compatible = "fsl,imx7d-cm4", .data = &imx_rproc_cfg_imx7d },
@@ -1479,6 +1612,7 @@ static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
 	{ .compatible = "fsl,imx93-cm33", .data = &imx_rproc_cfg_imx93 },
 	{ .compatible = "fsl,imx95-cm7", .data = &imx_rproc_cfg_imx95_m7 },
+	{ .compatible = "fsl,imx-rproc-psci", .data = &imx_rproc_cfg_psci },
 	{},
 };
 MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index d37e6f90548c..be6709971042 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -18,6 +18,8 @@ struct imx_rproc_att {
 /* dcfg flags */
 #define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
 #define IMX_RPROC_NEED_CLKS		BIT(1)
+/* No need address translation */
+#define IMX_RPROC_NO_ADDR_TRANS		BIT(2)
 
 struct imx_rproc_plat_ops {
 	int (*start)(struct rproc *rproc);
-- 
2.43.0

