Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AF91D356C;
	Mon,  7 Oct 2024 13:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728307300; cv=none; b=K0sg3hXIjq/oDuyOCEK1JJ4cmaFQAWFwvxIfT+MC62T86q2N0mYi5SyetSjJUL2fL8iySJZ13kWGVgEeJ8lKiF2DH54Zc+d6igRGjyfMHD5DMJiSO8zFb2MS/tufgt24VYlVi+CUQjRCnpkjzRgXfOLPqIS7xlR5EQ7Vp18BNTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728307300; c=relaxed/simple;
	bh=ABncTFhrW40O3uD3jPtcehaZHkQrR/3wP4b/EjwnLr4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mhj12PtUHUPi8g8KS+DD60Z+EuvRAaMOHske7Gp3RcUM/7eW7/sj6OMimeV4aQgV3jhzrU/kEiZaEwDpQa1gAgVHFl9rSOSTvgCO597LQAlOd2yitgLic8c9+2I+HeGi0Pgyr6xIUxmM0JQNKtjMhuklyp82Qr5i6Xcr7fM5lsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=XyMEKhJa; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="XyMEKhJa"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497BwBkc004331;
	Mon, 7 Oct 2024 15:21:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	iH9OlSNhQFY6eLim+2KjT93xZIeACtqGSkI5U4SfABU=; b=XyMEKhJaLsu17NFz
	43UnW4wDwjImGwiM0e7wG+LjWLL9StblDH48ACr6n7huEezVe5UPmyBktGqJpUVC
	YB0H5kamHkSWl2S8UmPeD9iNkK1vInps/TuI2RkGdtIJw1zDU87OF1r6azNuGR21
	1Pn8fHXEOk05u49LZCzTC9DG4/4xRSB0XvDqjVRYckMWuVPoWSopaOZ+MVus78A2
	SixFT2FWAJg9cqmICj1oM2drjsWqhEntlyoCCRbKEik4PY1xLMN4SepJpb3VPxaX
	ThpEAWCfdc1fatOcp1Yqpzxa7CLdb6Cn3xPQr0iMkBdvQl7BXjYiNxM21HD3CeZ2
	eFy+TA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 422xv713fw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 15:21:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3F74540048;
	Mon,  7 Oct 2024 15:19:40 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7516426DDAC;
	Mon,  7 Oct 2024 15:16:46 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 7 Oct
 2024 15:16:46 +0200
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 7 Oct
 2024 15:16:46 +0200
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
Subject: [PATCH v10 7/7] remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
Date: Mon, 7 Oct 2024 15:16:20 +0200
Message-ID: <20241007131620.2090104-8-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241007131620.2090104-1-arnaud.pouliquen@foss.st.com>
References: <20241007131620.2090104-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

The new TEE remoteproc driver is used to manage remote firmware in a
secure, trusted context. The 'st,stm32mp1-m4-tee' compatibility is
introduced to delegate the loading of the firmware to the trusted
execution context. In such cases, the firmware should be signed and
adhere to the image format defined by the TEE.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
update vs previous version
- rename tee_interface to tee_rproc_itf
- in stm32_rproc_probe(), test and use rproc->tee_rproc_itf instead of
  trproc in the tee_rproc_unregister() call
- initialize release_fw ops
- add select REMOTEPROC_TEE in Kconfig for STM32_RPROC.
---
 drivers/remoteproc/Kconfig       |  1 +
 drivers/remoteproc/stm32_rproc.c | 63 ++++++++++++++++++++++++++++++--
 2 files changed, 61 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index d0284220a194..df9ccbffe48b 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -327,6 +327,7 @@ config STM32_RPROC
 	depends on ARCH_STM32 || COMPILE_TEST
 	depends on REMOTEPROC
 	select MAILBOX
+	select REMOTEPROC_TEE
 	help
 	  Say y here to support STM32 MCU processors via the
 	  remote processor framework.
diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 288bd70c7861..cb7093de41df 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -18,6 +18,7 @@
 #include <linux/pm_wakeirq.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
+#include <linux/remoteproc_tee.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
@@ -255,6 +256,19 @@ static int stm32_rproc_release(struct rproc *rproc)
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
@@ -691,8 +705,20 @@ static const struct rproc_ops st_rproc_ops = {
 	.get_boot_addr	= rproc_elf_get_boot_addr,
 };
 
+static const struct rproc_ops st_rproc_tee_ops = {
+	.prepare	= stm32_rproc_prepare,
+	.start		= tee_rproc_start,
+	.stop		= stm32_rproc_tee_stop,
+	.kick		= stm32_rproc_kick,
+	.load		= tee_rproc_load_fw,
+	.parse_fw	= tee_rproc_parse_fw,
+	.find_loaded_rsc_table = tee_rproc_find_loaded_rsc_table,
+	.release_fw	= tee_rproc_release_fw,
+};
+
 static const struct of_device_id stm32_rproc_match[] = {
 	{ .compatible = "st,stm32mp1-m4" },
+	{ .compatible = "st,stm32mp1-m4-tee" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, stm32_rproc_match);
@@ -851,17 +877,42 @@ static int stm32_rproc_probe(struct platform_device *pdev)
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
 
@@ -913,6 +964,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 		dev_pm_clear_wake_irq(dev);
 		device_init_wakeup(dev, false);
 	}
+	if (rproc->tee_rproc_itf)
+		tee_rproc_unregister(rproc->tee_rproc_itf);
+
 	return ret;
 }
 
@@ -933,6 +987,9 @@ static void stm32_rproc_remove(struct platform_device *pdev)
 		dev_pm_clear_wake_irq(dev);
 		device_init_wakeup(dev, false);
 	}
+	if (rproc->tee_rproc_itf)
+		tee_rproc_unregister(rproc->tee_rproc_itf);
+
 }
 
 static int stm32_rproc_suspend(struct device *dev)
-- 
2.25.1

