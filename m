Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937C55466C;
	Tue, 21 May 2024 08:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716279062; cv=none; b=EIEyUiXRhIQRFLWTYDH95QxnvnBX7ZVtyhLOV7/XuIfpHh2O1FwsTnpXODxuzeLXq/NSBf77l4BX7U0X8BYY6Y4S+bOsPBXuqR+41gN8J75Rai3QFtcfSgxT2LNj4NH75BBcx6MYiyVG0A6a65qHnGIDDBkrA1wA0ICF5Xc64nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716279062; c=relaxed/simple;
	bh=paM+/T4ub8hSwj6+v2vKkq691ZmzBdKEhnjn/9+0gNU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NuL3soN3JDO+Td6E1KLyBI2Uyxy0xORvMaXx6nVHo7i5QcMOfDiHiRiXEOxrBukrUunJZnoEXB69rTzXPU9c+/hEIm3Uwrt7SmtMHEIS5R4WZt2gFEcgQ3fEpGrQd34Ocvbs8BgCWFe4DB3koXPkIcn6mzyG4otstuxNmUHc44o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=QIJxNJtw; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="QIJxNJtw"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44L3UH7O009128;
	Tue, 21 May 2024 10:10:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=GN+nLCoaZHUydrf2dv/aCIwv8FX5c5zQd+BfUG5pP3U=; b=QI
	JxNJtwdGHtCZn4gIMComo8o/Qlff18zWVeaNhBMxJ6hWCvLJSVJn7Jrer2pfGL/B
	nx2n0LJzJLtOGxNXMKc1xof4/0JXi+BFnvWHSQTu8hpHfDHdF287HQPT3AWC6U6J
	oJBzEInpRrIavMd5FiTfWlThHr36E4d+5TX1xf4hf0NwNBlCog/rPPIG6CtskeiQ
	Ln1Ip8MV+/A20eNTeNX6H58yrtGniFx6t8F3qaE3AJRkHnwmQJlKBDtYDulZne7M
	0ARE35W/SO+wxm1ypDOctTr3LEhe0xPLcuewfCeJopOoi63a0SAS+l16uCVrcXVj
	vD6Oz9biYi9gaOKgsq2A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y779hrdyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 10:10:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 788EC40049;
	Tue, 21 May 2024 10:10:42 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F5D12122FC;
	Tue, 21 May 2024 10:10:16 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 10:10:16 +0200
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 10:10:16 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v5 7/7] remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
Date: Tue, 21 May 2024 10:10:01 +0200
Message-ID: <20240521081001.2989417-8-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240521081001.2989417-1-arnaud.pouliquen@foss.st.com>
References: <20240521081001.2989417-1-arnaud.pouliquen@foss.st.com>
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
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_04,2024-05-21_01,2024-05-17_01

The new TEE remoteproc device is used to manage remote firmware in a
secure, trusted context. The 'st,stm32mp1-m4-tee' compatibility is
introduced to delegate the loading of the firmware to the trusted
execution context. In such cases, the firmware should be signed and
adhere to the image format defined by the TEE.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
Update from V4:
- remove hard coded remote proc ID STM32_MP1_M4_PROC_ID, get the
  ID from the DT,
- replace find_loaded_rsc_table by get_loaded_rsc_table.
---
 drivers/remoteproc/stm32_rproc.c | 65 ++++++++++++++++++++++++++++++--
 1 file changed, 61 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 8cd838df4e92..f6f748814bf2 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -20,6 +20,7 @@
 #include <linux/remoteproc.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/tee_remoteproc.h>
 #include <linux/workqueue.h>
 
 #include "remoteproc_internal.h"
@@ -257,6 +258,19 @@ static int stm32_rproc_release(struct rproc *rproc)
 	return 0;
 }
 
+static int stm32_rproc_tee_stop(struct rproc *rproc)
+{
+	int err;
+
+	stm32_rproc_request_shutdown(rproc);
+
+	err = tee_rproc_stop(rproc);
+	if (err)
+		return err;
+
+	return stm32_rproc_release(rproc);
+}
+
 static int stm32_rproc_prepare(struct rproc *rproc)
 {
 	struct device *dev = rproc->dev.parent;
@@ -693,8 +707,20 @@ static const struct rproc_ops st_rproc_ops = {
 	.get_boot_addr	= rproc_elf_get_boot_addr,
 };
 
+static const struct rproc_ops st_rproc_tee_ops = {
+	.prepare	= stm32_rproc_prepare,
+	.start		= tee_rproc_start,
+	.stop		= stm32_rproc_tee_stop,
+	.kick		= stm32_rproc_kick,
+	.load		= tee_rproc_load_fw,
+	.parse_fw	= tee_rproc_parse_fw,
+	.get_loaded_rsc_table = tee_rproc_get_loaded_rsc_table,
+
+};
+
 static const struct of_device_id stm32_rproc_match[] = {
-	{ .compatible = "st,stm32mp1-m4" },
+	{.compatible = "st,stm32mp1-m4",},
+	{.compatible = "st,stm32mp1-m4-tee",},
 	{},
 };
 MODULE_DEVICE_TABLE(of, stm32_rproc_match);
@@ -853,17 +879,42 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct stm32_rproc *ddata;
 	struct device_node *np = dev->of_node;
+	struct tee_rproc *trproc = NULL;
 	struct rproc *rproc;
 	unsigned int state;
+	u32 proc_id;
 	int ret;
 
 	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (ret)
 		return ret;
 
-	rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
-	if (!rproc)
-		return -ENOMEM;
+	if (of_device_is_compatible(np, "st,stm32mp1-m4-tee")) {
+		/*
+		 * Delegate the firmware management to the secure context.
+		 * The firmware loaded has to be signed.
+		 */
+		ret = of_property_read_u32(np, "st,proc-id", &proc_id);
+		if (ret) {
+			dev_err(dev, "failed to read st,rproc-id property\n");
+			return ret;
+		}
+
+		rproc = devm_rproc_alloc(dev, np->name, &st_rproc_tee_ops, NULL, sizeof(*ddata));
+		if (!rproc)
+			return -ENOMEM;
+
+		trproc = tee_rproc_register(dev, rproc, proc_id);
+		if (IS_ERR(trproc)) {
+			dev_err_probe(dev, PTR_ERR(trproc),
+				      "signed firmware not supported by TEE\n");
+			return PTR_ERR(trproc);
+		}
+	} else {
+		rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
+		if (!rproc)
+			return -ENOMEM;
+	}
 
 	ddata = rproc->priv;
 
@@ -915,6 +966,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 		dev_pm_clear_wake_irq(dev);
 		device_init_wakeup(dev, false);
 	}
+	if (trproc)
+		tee_rproc_unregister(trproc);
+
 	return ret;
 }
 
@@ -935,6 +989,9 @@ static void stm32_rproc_remove(struct platform_device *pdev)
 		dev_pm_clear_wake_irq(dev);
 		device_init_wakeup(dev, false);
 	}
+	if (rproc->tee_interface)
+		tee_rproc_unregister(rproc->tee_interface);
+
 }
 
 static int stm32_rproc_suspend(struct device *dev)
-- 
2.25.1

