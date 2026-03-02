Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010067.outbound.protection.outlook.com [52.101.61.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021A147D947;
	Mon,  2 Mar 2026 19:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772481387; cv=fail; b=QooiNwCI0MPXWCac8ZQKpoXcKlVulyb/E4OsvFlgGvj+fmnWLPudwEbIO39IST/Sw6WmPhpCBFc5V+t/Dj1f99Xw0Tbn44+1wAvO8T/lxdqtt2XOz89M1Xjb2q+NpD8SQ3IaCo14S7TzFRjIxyAqETnXnXzU6foH1schTc8OrGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772481387; c=relaxed/simple;
	bh=bW7CN2EuXCYiz51Yhkvk76hko++trjMAS4UZXxVJp2M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D19bc30e4LYPOVDbwAORw4h/9JTqEfGoarCszvGPenwFau7lWeyir3U9cRBSG9fhV7xIA+sh+iWUaojdlm0PIVWRa62DPvdKNK4PLwhxdMqtDqm0RdHw6eD+ZFZ9KAZuySAvxjx+kGf1xhPGT2toLvR2Rw35C3a1PBAwpVnXIYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dPehjQ8+; arc=fail smtp.client-ip=52.101.61.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dPehjQ8+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=szrd5SDFabNT79QVjdBR5Vnum2hxELz/amlh5BGYyBmyxPCZfnQ71TU1Kb4SYymrV6PmB+WJMQAYzt2aXvCRCky+kso0daYkaCsT75KVHDh721PzNOJAfpgSVkQOsB1LRw8qNAb983KPdxNc92RWvkDFCKGPw+fomAtU1tAiwDZ8cea4F0awemJfw+e7dp1m7eDAmBoznLik42tA/AUymd9rszbJ1fR/pKoulsqXutxkP4CN4wsjCdQ9YtDIuTEmi96TWIYMZlrKuXvhBlbEQ8nwRxNf8zfsNSapVxhb0Fhr1AkiWX1KXX50fz2lr7pkQg+DV/4y+Lw3p4sqSaU4jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEeNLxu2UYb41hDcjaMBJ7KumJThPNBuSGFiKM8qFzI=;
 b=JDbX64TrKuEFppUtN4eTiUoQj/twPHpqAK+jKr3lnJmcpUeu86kN6vxRn6ii4Qhxkd4Efw5/PQFT0UWFF9CHe9yKj/HZ5aCedVqp3+LDucdIGtzhfJupvYUViYpDlvytLk5pMqjg4Z25YYWMfZCiZ3TI215z9rbOh/L9fk4f0FB6dVXl2FXxvwSDN6M2IvMmdKxCnfwx7JvwnCJ+FLUlnMd+Is6MFX+El4huue1H4RVixLfI+rbifUFLJKxAA+OCnGX3sfEqQ+BvCM4oivnjlswFEYr+uOoR8+PKxbzS0XyYZ5y0o8bynjciinSluV7UyRRCyUYMFjRD7ks2eHBjsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEeNLxu2UYb41hDcjaMBJ7KumJThPNBuSGFiKM8qFzI=;
 b=dPehjQ8+qPlSQglNYXB7JXIvgnAytkdGfRC2V3CCKwYOQkxwrsil5T6qG9BxcqHVapgldBkrGZcglX6pndqyJ9P3FN8E7upKsH80naUGX40zB1n3pbJVmZb+JoAGcMvUtghqApkEbN3mzTI5AbLRbJAxCUS0r+4LpfFZl/ENi8E=
Received: from BN0PR03CA0020.namprd03.prod.outlook.com (2603:10b6:408:e6::25)
 by SA1PR10MB7554.namprd10.prod.outlook.com (2603:10b6:806:379::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 19:56:22 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:408:e6:cafe::c0) by BN0PR03CA0020.outlook.office365.com
 (2603:10b6:408:e6::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.18 via Frontend Transport; Mon,
 2 Mar 2026 19:56:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Mon, 2 Mar 2026 19:56:20 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 13:56:20 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 13:56:19 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 13:56:19 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622JuIOc1348869;
	Mon, 2 Mar 2026 13:56:19 -0600
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Andrew Davis" <afd@ti.com>
Subject: [PATCH 3/3] remoteproc: da8xx: Reorder resource fetching in probe()
Date: Mon, 2 Mar 2026 13:56:16 -0600
Message-ID: <20260302195616.312378-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260302195616.312378-1-afd@ti.com>
References: <20260302195616.312378-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|SA1PR10MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: 60819ac6-cb39-4a12-7b9c-08de7895c64d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info:
	Ftj1pFJs7oX2kHhYDgyGU+8oK3K42ZjeGWgWUnYkcke6K4AfhGzhBvhGvsDRpMWDA5YK+Di2XX0w5kX9SeLhbp3kgjjR7D3uf5JLkbanvUaa3PYm3fqJixv9CDNTEobXC6FlKw94B6CkY+vry0F/ankVYedQmMYv7Zq29XNLnl+4cB6FcII6OKPsrWscRY6/ssXWlTS7/RsDTZ13u8j7dorYswLI/GmDJSBtCcERHvaMpHjpsX5tWdCBxYo9Exzjul0MQB/9lSTc+rS9azwGr09+dJGR7ZRRwjIWfKVdyjNoC6Nm2tfiHXJ70MNXC0Vlptj1XGtTCAiw/XYvo4RTshojlL0OrVFayXx4Kg5GPnCtX7GireUbdtkLQGBggmGILYpgFO8KSmpEeCYqlmzQOajkGi6yUl63bQjHGl9tglDYHaarBsD47O24+AMaQX+C3MjsNWHWZML2IkitReVO0NQ5JGO63pCBJ/imm45WnfeksHUv0fQKQ6X46ZTPwZTbeNtvGMskaoUNXcsJM8Gq8QW8IqeisycL69C3y9KRRJgqNqSdbCxRDZ6XcSAgoNV0e/OjENc947boPR86ewoufIPq6Bd7Y14nspJ0rO3m3Oaf8pkvEUzYkRJN6W1YFMqThkXsxBX9Ybe2f5mL2jiig07hFwOGLW7G/ZAN10obc4BJWbyqL1Fqiwjf+MHgPm9W4cN9ihjyNe+Ab6afYVEX0QgdliWwRH3TqtvYBXuTZ43Bi0iDTK7W6w/RO5+vDGETi5JQFEUWqaApiXprnXPB7cdxOkmpmQ645qRW+GWbSAXPbvR9MS0UEL2qYahWNQXL
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aXsAQMIUIWH80PH3LcG4HdZObtJx4A96VDJaTxAxbf5d5fUl8jq3UIfdLT1Sf8A+NSvsRwGsb8JiSFhHQK9aaMJSoHko/cV5dkM21kMsiYvS68tEVZaywiofHWeqA5G9eUSdLfPIZ1oryF4Rgdgy5GkiWGdAejkhYTNikq2Pn3HlKR9udXFTdk58Has1iCNcfA+5qN/hZE5FQed6nsEJbt3jDhFpktdOjyeebh38k0VIj/IcYhbkQIpT0S9/Nv8QCc0vmBMBZVB7c1MyVuNYrP3XSWcPK3INNmy/cjox6MK4QJqLoTPRq+Qpyrm0TTQl4+kNrKtkXJ4Ajv8w8osPi0yM7LJDjEB/hT9bcbERBkcm/ESNeweQOhKPXgYTJgF8IzQ5esWaGbRdXHLbK0nNK+zlslBywIB4N1wNzgzOH7Hap+Htn0Rm2FTeXB53tIak
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 19:56:20.4408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60819ac6-cb39-4a12-7b9c-08de7895c64d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7554

Currently several resource are fetched before we allocate our instance
data struct. The is unlike most other drivers that fill in the instance
data with resources as they are fetched. Move these down which is more
natural and also removes the need for several temporarily locals.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/da8xx_remoteproc.c | 75 ++++++++++++---------------
 1 file changed, 32 insertions(+), 43 deletions(-)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index f44bee303eb5e..ea82500165cb6 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -242,45 +242,9 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct da8xx_rproc *drproc;
 	struct rproc *rproc;
-	struct irq_data *irq_data;
-	struct clk *dsp_clk;
-	struct reset_control *dsp_reset;
-	void __iomem *chipsig;
-	void __iomem *bootreg;
 	int irq;
 	int ret;
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
-
-	irq_data = irq_get_irq_data(irq);
-	if (!irq_data)
-		return dev_err_probe(dev, -EINVAL, "irq_get_irq_data(%d): NULL\n", irq);
-
-	bootreg = devm_platform_ioremap_resource_byname(pdev, "host1cfg");
-	if (IS_ERR(bootreg))
-		return PTR_ERR(bootreg);
-
-	chipsig = devm_platform_ioremap_resource_byname(pdev, "chipsig");
-	if (IS_ERR(chipsig))
-		return PTR_ERR(chipsig);
-
-	dsp_clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(dsp_clk))
-		return dev_err_probe(dev, PTR_ERR(dsp_clk), "clk_get error\n");
-
-	dsp_reset = devm_reset_control_get_exclusive(dev, NULL);
-	if (IS_ERR(dsp_reset))
-		return dev_err_probe(dev, PTR_ERR(dsp_reset), "unable to get reset control\n");
-
-	if (dev->of_node) {
-		ret = of_reserved_mem_device_init(dev);
-		if (ret)
-			return dev_err_probe(dev, ret, "device does not have specific CMA pool\n");
-		devm_add_action_or_reset(&pdev->dev, da8xx_rproc_mem_release, &pdev->dev);
-	}
-
 	rproc = devm_rproc_alloc(dev, "dsp", &da8xx_rproc_ops, da8xx_fw_name,
 				 sizeof(*drproc));
 	if (!rproc)
@@ -291,14 +255,43 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 
 	drproc = rproc->priv;
 	drproc->rproc = rproc;
-	drproc->dsp_clk = dsp_clk;
-	drproc->dsp_reset = dsp_reset;
 	rproc->has_iommu = false;
 
+	drproc->dsp_clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(drproc->dsp_clk))
+		return dev_err_probe(dev, PTR_ERR(drproc->dsp_clk), "clk_get error\n");
+
+	drproc->dsp_reset = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(drproc->dsp_reset))
+		return dev_err_probe(dev, PTR_ERR(drproc->dsp_reset), "unable to get reset control\n");
+
+	if (dev->of_node) {
+		ret = of_reserved_mem_device_init(dev);
+		if (ret)
+			return dev_err_probe(dev, ret, "device does not have specific CMA pool\n");
+		devm_add_action_or_reset(&pdev->dev, da8xx_rproc_mem_release, &pdev->dev);
+	}
+
 	ret = da8xx_rproc_get_internal_memories(pdev, drproc);
 	if (ret)
 		return ret;
 
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	drproc->irq_data = irq_get_irq_data(irq);
+	if (!drproc->irq_data)
+		return dev_err_probe(dev, -EINVAL, "irq_get_irq_data(%d): NULL\n", irq);
+
+	drproc->chipsig = devm_platform_ioremap_resource_byname(pdev, "chipsig");
+	if (IS_ERR(drproc->chipsig))
+		return PTR_ERR(drproc->chipsig);
+
+	drproc->bootreg = devm_platform_ioremap_resource_byname(pdev, "host1cfg");
+	if (IS_ERR(drproc->bootreg))
+		return PTR_ERR(drproc->bootreg);
+
 	/* everything the ISR needs is now setup, so hook it up */
 	ret = devm_request_threaded_irq(dev, irq, da8xx_rproc_callback,
 					handle_event, 0, "da8xx-remoteproc",
@@ -311,14 +304,10 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 	 * *not* in reset, but da8xx_rproc_start() needs the DSP to be
 	 * held in reset at the time it is called.
 	 */
-	ret = reset_control_assert(dsp_reset);
+	ret = reset_control_assert(drproc->dsp_reset);
 	if (ret)
 		return ret;
 
-	drproc->chipsig = chipsig;
-	drproc->bootreg = bootreg;
-	drproc->irq_data = irq_data;
-
 	ret = devm_rproc_add(dev, rproc);
 	if (ret)
 		return dev_err_probe(dev, ret, "rproc_add failed\n");
-- 
2.39.2

