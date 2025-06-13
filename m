Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDB2291C34;
	Fri, 13 Jun 2025 09:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749806388; cv=none; b=UJMxQmCgzfIgeiPziqcY8NriRBOoN9BT8mChfPHAEPvep0g0fpJ/JSK8e0v5R+p4yBpn7eCilAGD1T4MstKRu4cHg9rauqIEkSx1AsDaq0qb/WVjOWYGy/rxry+MGQ3x9ZuUuHmnubb604HR/wt/0CevX+BfXl8WRbbepBVNXzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749806388; c=relaxed/simple;
	bh=54OTCCe6IxOayzste09DjRx7T70J4NR2amXWUqkCM6k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Db+Cz5Km4/WPTsN0Nd8f7fw0zIw/LS0CJBax5aQcb7k/f9JxSeb60YiChPVc2IOKkn28jNY7TjSD25Y3zg6pFrdvdZNLiQMRuyDXOes1XcddpjQOAdOXGcyVLtRu821y0kA8OWVCD9k4415oZ0N84S6K/yVyBSrfWJOoYNeDA1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=fBQLsIVI; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="fBQLsIVI"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D9CFWB014198;
	Fri, 13 Jun 2025 11:19:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	94VnVbpWMosowgrfHe7Clhz40y17D7U8VhRGXHli9wg=; b=fBQLsIVIwW3eu/3B
	klnkVs56QZNS0P79dpBf2TVRXdryzzIrl6MR2yoEN09dT1Rp1fAx7hHnzX1Y02x9
	G/P0Z+zFzLSbKIg2QzyiZ+KU/qwRzPVAYhyaEA4RHtxuqACr06kgvaisTXryhKf4
	4eL5QPO/ct7kdl+ovSdyQRIlqv75p8s5YxiSiUdeUTIz+Be16gqznKeiOA1oXqgB
	aAGj2u+TH48U6zsatus/+YzLAzfxA9bZbpkhT7SOJZLZKAFVh9EitcWJylt6xpL2
	asYAr5kwrshbAPoNjWEN4AdU1wR94uYTTBt+kg5lTObCZoWO2Vb5AkeiMhvglbDL
	+DmwTA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474caj3pwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 11:19:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 84C274005A;
	Fri, 13 Jun 2025 11:18:11 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 24993BAD734;
	Fri, 13 Jun 2025 11:17:23 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 11:17:22 +0200
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 11:17:22 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>, <devicetree@vger.kernel.org>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v17 6/6] remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
Date: Fri, 13 Jun 2025 11:16:50 +0200
Message-ID: <20250613091650.2337411-7-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250613091650.2337411-1-arnaud.pouliquen@foss.st.com>
References: <20250613091650.2337411-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01

The new TEE remoteproc driver is used to manage remote firmware in a
secure, trusted context. The 'st,stm32mp1-m4-tee' compatibility is
introduced to delegate the loading of the firmware to the trusted
execution context. In such cases, the firmware should be signed and
adhere to the image format defined by the TEE.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
updates vs previous version
- rebase on V6.16-rc1

---
 drivers/remoteproc/stm32_rproc.c | 57 ++++++++++++++++++++++++++++++--
 1 file changed, 54 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index db82d4308376..a3613c337264 100644
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
+	err = rproc_tee_stop(rproc);
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
+	.start		= rproc_tee_start,
+	.stop		= stm32_rproc_tee_stop,
+	.kick		= stm32_rproc_kick,
+	.load		= rproc_tee_load_fw,
+	.parse_fw	= rproc_tee_parse_fw,
+	.find_loaded_rsc_table = rproc_tee_find_loaded_rsc_table,
+	.release_fw	= rproc_tee_release_fw,
+};
+
 static const struct of_device_id stm32_rproc_match[] = {
 	{ .compatible = "st,stm32mp1-m4" },
+	{ .compatible = "st,stm32mp1-m4-tee" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, stm32_rproc_match);
@@ -854,6 +880,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	const char *fw_name;
 	struct rproc *rproc;
 	unsigned int state;
+	u32 proc_id;
 	int ret;
 
 	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
@@ -865,9 +892,29 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	if (ret < 0 && ret != -EINVAL)
 		return ret;
 
-	rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, fw_name, sizeof(*ddata));
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
+		rproc = devm_rproc_alloc(dev, np->name, &st_rproc_tee_ops, fw_name, sizeof(*ddata));
+		if (!rproc)
+			return -ENOMEM;
+
+		ret = rproc_tee_register(dev, rproc, proc_id);
+		if (ret)
+			return dev_err_probe(dev, ret,  "signed firmware not supported by TEE\n");
+	} else {
+		rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, fw_name, sizeof(*ddata));
+		if (!rproc)
+			return -ENOMEM;
+	}
 
 	ddata = rproc->priv;
 
@@ -919,6 +966,8 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 		dev_pm_clear_wake_irq(dev);
 		device_init_wakeup(dev, false);
 	}
+	rproc_tee_unregister(dev, rproc);
+
 	return ret;
 }
 
@@ -939,6 +988,8 @@ static void stm32_rproc_remove(struct platform_device *pdev)
 		dev_pm_clear_wake_irq(dev);
 		device_init_wakeup(dev, false);
 	}
+
+	rproc_tee_unregister(dev, rproc);
 }
 
 static int stm32_rproc_suspend(struct device *dev)
-- 
2.25.1

