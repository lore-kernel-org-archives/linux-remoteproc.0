Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C646156F5A;
	Fri,  7 Jun 2024 09:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717753505; cv=none; b=piL5WnkoPZ7Yq4iK4tDbKoNQZaggrNHcF+UzwQmMB9CbrNvwEfLU2hFO6Hi6C57OB3j0jQ05J7dEuwOWwxEu5liifyRZSDWFZbCmmdn8gs1U54OT2G+agFuBnZP6awf82M5ciEeaXFGp13cSX1gs8JKtCK9HJY+CuJpkRfyP0Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717753505; c=relaxed/simple;
	bh=0jXa/ETpQ8oMk/aE8zUGLVukVp9YzweGLD1Q6nn19g4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tV6PyIaqaz/1dWepbziT0dqTEjFF6/nY1c1gSTypuVdS++jqh1mdCcaPKTbheN3HeSe6iLPKtUNzHax4JA/i/FqKJgkS5VEF3TxD5WZWhvDbAfF3v/Hchr+I+eYh6rsweeZqqdiqDl4dGaCe2rg9HVNnIHugJUJsLkuY/R09W8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=1SNJ8Att; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="1SNJ8Att"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45791LPx011040;
	Fri, 7 Jun 2024 11:35:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	x7+/7jGZKQUIxBxNoUHZ9GKuXhsWji229mzGjNW0pPY=; b=1SNJ8AttanJSS/kk
	109BxJxw4cSpZLjpNJO5oL2mcrvY/nM4NopcngWtLjU1Tre4nKjaLjXRP30/7v71
	4ibdVKfnwm5lXIbp+MVSD869pRw0BSNcFSgczFd77aYAcGUYwLAl1R2PDapxgEVv
	YuYth8T2aSLJWbxPxU0R5bHBkjrNoqynQj+5weTpMWIaYkaw2PLYzdmrHdgMNyBc
	5CwCWTkaRpGAoUzh8Wru1vQDXZ7SDDjSiNOBuZoBUXytLk6KpzD7wKghvJ0FQXJW
	FO2gvXCtwV7sIqgfyEO9RyI8WYu88Ywd0YWh6DsEh4PoEJ2QSHWCXlTgCH2l4x67
	us5pkg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yg7r0gtss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 11:35:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2F35E4004F;
	Fri,  7 Jun 2024 11:34:58 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C3671214534;
	Fri,  7 Jun 2024 11:34:09 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 7 Jun
 2024 11:34:09 +0200
Received: from localhost (10.252.5.235) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 7 Jun
 2024 11:34:09 +0200
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
Subject: [PATCH v6 5/5] remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
Date: Fri, 7 Jun 2024 11:33:26 +0200
Message-ID: <20240607093326.369090-6-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240607093326.369090-1-arnaud.pouliquen@foss.st.com>
References: <20240607093326.369090-1-arnaud.pouliquen@foss.st.com>
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
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_04,2024-06-06_02,2024-05-17_01

The new TEE remoteproc device is used to manage remote firmware in a
secure, trusted context. The 'st,stm32mp1-m4-tee' compatibility is
introduced to delegate the loading of the firmware to the trusted
execution context. In such cases, the firmware should be signed and
adhere to the image format defined by the TEE.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
Update from previous version
- replace find_loaded_rsc_table by  find_loaded_rsc_table ops.
---
 drivers/remoteproc/stm32_rproc.c | 63 ++++++++++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 8cd838df4e92..c1262e1ccc96 100644
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
+	.find_loaded_rsc_table = tee_rproc_find_loaded_rsc_table,
+
+};
+
 static const struct of_device_id stm32_rproc_match[] = {
 	{ .compatible = "st,stm32mp1-m4" },
+	{ .compatible = "st,stm32mp1-m4-tee" },
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

