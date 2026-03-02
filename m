Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012071.outbound.protection.outlook.com [52.101.53.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4822FE044;
	Mon,  2 Mar 2026 20:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772482668; cv=fail; b=qKZV/+5//QRb/z8k1AJgqXo4hTCU031+9HnRdulycISW2igwUBD1S4sIOgq5uLXT4DMthPlfp0KVj4IFR104CgNiBC2jpp8c/NUJwX4lpzSR1ddbeqU5DPgSAVJgpm1WvX54OtWNIfgU0OTWBWDoJaI7JzU17Cox6UJ1CJy4G7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772482668; c=relaxed/simple;
	bh=EfB1Pv8gMQGp/CUMd/oLQTAtqwl0T7P2D2lK3PlbxiM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B7w+wM88ioPEiVVHznAu7GQrbAhUnWuuhAvzeB4axB+g99+jruzhiBlz6cJgFUF5EcVFlry10wbHfha9SLNJbl0TDlpU7rShUv7XXw743KBMGa36ZHTSyR7/MU1KCDDfELF3lRYVkfjy8tC2btRBOsQMbFtO4DFqi/7MCIHZ/Ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=b+/SRoh/; arc=fail smtp.client-ip=52.101.53.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="b+/SRoh/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ro7449ItdpY9qXoPYRL2dd2P+km2v11JP4VDVbLUlH5J5NsQCYYCYE5iA5dByh7KJVZVJBghpy7SKKXcaB6QISjPTVueb8GfNNsJK1mgDUprVP0s4iPPtS6ZdJwDfA0dQzummZB6UIiF9D/6uqMtyQF5yCviDjFVIIN3vXaf65VMPujV7tT5xUmgsoJUmR8d8l93q6/NV7UMVPlmgTJqlmnC+ypWG6PXlAqpUDMybXrMiKY/6/HIMOpm6OlE77ghq8RHU2ysvLhFtc8gzaY7mefxyy73Dszvqq+1sniDCVVXx6h9HgU0P/WVBA4t7xvYkHvL5NqK012WF1iYHOoYpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfQ3u+an+Z2WWl5S5ElTTEv4QFYIPh75klDIxJbE6Ec=;
 b=bcOX8MtxRgNFJbejc0PNznW5URHQeX8yxKvH/mh8/l1/1FaY2MiVpP2Rry5jiSliNujpyQVZar7jC1jJmAk9LKsx7PeEukScJaG60bVwHEl53zzA1npX/iEj3D8Yqc83Pd4AnZOn6rGeR2B+rkAan4Uo5jw22+H/Nsq5/8nT6AJkoCKmQC5/7LBkrSXfSpVGp199klDtkMSKhSKEp7b9V6+Mjg+bDSnZWpCh2//WLAIOB2vc1hmtd/VEJMF4bZkKIUVa1/9YnhJVhmUp+MOStmI7NDexMh5AqtZ6CPmsYh/kerHLdDNRS3XflYXbryT1ku3lwnrAYwlEGKLXqytOLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfQ3u+an+Z2WWl5S5ElTTEv4QFYIPh75klDIxJbE6Ec=;
 b=b+/SRoh/x1V2VqLr/MkKJTQdxt1/4f3MogaXyEi5QnhvqEWDl5i8UyqyWpQ4wsaUBKZ3r+EWdMACN4TOE3pBfRllHbDyHhRNQzn5ykAZaphyIwSU/PWlybueHKHeOQIa4adpTf+INcFlKxOugS4AcPFZ7EPPcrD4Vzt1lV0bvMQ=
Received: from BL1PR13CA0418.namprd13.prod.outlook.com (2603:10b6:208:2c2::33)
 by PH7PR10MB6081.namprd10.prod.outlook.com (2603:10b6:510:1fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 20:17:43 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:208:2c2:cafe::7d) by BL1PR13CA0418.outlook.office365.com
 (2603:10b6:208:2c2::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 20:17:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 20:17:41 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 14:17:36 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 14:17:36 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 14:17:36 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622KHZ1P881392;
	Mon, 2 Mar 2026 14:17:35 -0600
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Andrew Davis" <afd@ti.com>
Subject: [PATCH] remoteproc: keystone: Request IRQs in probe()
Date: Mon, 2 Mar 2026 14:17:34 -0600
Message-ID: <20260302201734.320747-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
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
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|PH7PR10MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ed43bf0-6a52-42e4-3cca-08de7898c1b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|34020700016|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	V/IRUkDsk4hKNJxfeX+K2K5zHE3aTi8G+E+U54LhawGOnpRzH9Ia8+1rbRrrVZXuNPuITHnYmaDi81R2golu93vvJ/M6mVT/bCb6Aych8FV1W2Ud+YWA4tsT9SnxfUuMEnNR4Xp/B3JtbCDC2zhb72qVvrFhl+sTn9q6Iq74Am/ix3Aoq/1NXoqqc7Vi7XSNYN0CG3zZLnOlU4Okm5qatxRv8FXf/MCNwgAt1/ecMpLCpwBOzO6SvRv3jQPQeBwSc/bd7b/jd8QE4qQp99XkfPVQyD6xbib5/6tdhemNbVGAibaAHn5mpi4+z/Eko3JEQNBhAVR590OHEGsVCBwBFa48rx942qRoTD85bXv6VFuBFBf1JqOCXg0fzZSBYOfdgZ+zPUL+7bqQ4NdQODSdxtgwAYHB+Zg+jrhz6sSASvJsJvwy24TBuyJSpiolOOYyoru77lk5q44cgjgdfaHgJh1i6/H/0zeC9W+mXpRepgxM2PA62ypqmxy9BhzmqJgsrWNeWJUuxTKyk2NyqI1vyinbIiuM582vzWjtB8qx0P+hJ8ZNjX2VNC8x0sXhW1/OZ+uOJ67KWeE1oEUwXWVv7SdRdWj0Y46E7fWXpuW7WONHgj1i8zdtoYIEAAcCtnxXlyRjNIstahVqxVL35ISMcG03bZGa1GdVOc2T7WKJXoARKEUrL8vKxc2IUclVrIlu9bW1utqSjolxirmjx5Srtohax4EJZ7DtfOOTruvLd7jor0Tyh0KmNYaiyZnvg5Y29Wfsv/hJYr7lfhoObT68YNoB1u2Cg1jbQJBNC1t28+OyCla6BREi1TrdgmDiTyoEqJUufRW7YxaxGoYDzzVfAg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(34020700016)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ev7Bsp9os02XYByevco7NdN3lSytw2DJtj9QzuWXsrG93YsArjmmq+eviXaAqRlEgyz2Hyp2Rh8RQeI6TVs/e3Kf/WZ4Cw1U9DvnmVtlEkW5vJKmOeDaaFthnELRr+S/ryilFN1RclTwcG/pT9ir7O3h/UrnLaklU4YQJgTOJeoweQnM4mikOsBXnobZ2od47xwVjj/lrZao6H+3YGdYCchYyaLyAAF96kg9iFtdWMGYzPF/mqLnErxdbP7CVxHMGITW607jVX5XoP8c1vBoCTi/eIUufkS0UP7fHZ9PtcBYufpcl6CXG8qXpk+Yr2u1RqOMGpvd0HyWTdv6hSSjs8WexLULIpmUUshyk6FMEu3WgkdFvnQ6xbgnDPJVXZSO+oz5zV/89cUfxLPVGCiyjRu88iUzeMt26HwLLwgWTjwbWVyBXuE5Ypsfhh3BdX8d
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 20:17:41.2050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed43bf0-6a52-42e4-3cca-08de7898c1b3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6081

IRQs can be registered in probe and only need to be enabled/disabled
during remoteproc start/stop. This lets us catch IRQ issues early
and simplify remoteproc start/stop.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/keystone_remoteproc.c | 41 +++++++++---------------
 1 file changed, 15 insertions(+), 26 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 4d6550b485675..e7fde55097866 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -173,35 +173,16 @@ static int keystone_rproc_start(struct rproc *rproc)
 
 	INIT_WORK(&ksproc->workqueue, handle_event);
 
-	ret = request_irq(ksproc->irq_ring, keystone_rproc_vring_interrupt, 0,
-			  dev_name(ksproc->dev), ksproc);
-	if (ret) {
-		dev_err(ksproc->dev, "failed to enable vring interrupt, ret = %d\n",
-			ret);
-		goto out;
-	}
+	enable_irq(ksproc->irq_ring);
+	enable_irq(ksproc->irq_fault);
 
-	ret = request_irq(ksproc->irq_fault, keystone_rproc_exception_interrupt,
-			  0, dev_name(ksproc->dev), ksproc);
+	ret = keystone_rproc_dsp_boot(ksproc, rproc->bootaddr);
 	if (ret) {
-		dev_err(ksproc->dev, "failed to enable exception interrupt, ret = %d\n",
-			ret);
-		goto free_vring_irq;
+		flush_work(&ksproc->workqueue);
+		return ret;
 	}
 
-	ret = keystone_rproc_dsp_boot(ksproc, rproc->bootaddr);
-	if (ret)
-		goto free_exc_irq;
-
 	return 0;
-
-free_exc_irq:
-	free_irq(ksproc->irq_fault, ksproc);
-free_vring_irq:
-	free_irq(ksproc->irq_ring, ksproc);
-	flush_work(&ksproc->workqueue);
-out:
-	return ret;
 }
 
 /*
@@ -215,8 +196,8 @@ static int keystone_rproc_stop(struct rproc *rproc)
 	struct keystone_rproc *ksproc = rproc->priv;
 
 	keystone_rproc_dsp_reset(ksproc);
-	free_irq(ksproc->irq_fault, ksproc);
-	free_irq(ksproc->irq_ring, ksproc);
+	disable_irq(ksproc->irq_fault);
+	disable_irq(ksproc->irq_ring);
 	flush_work(&ksproc->workqueue);
 
 	return 0;
@@ -427,10 +408,18 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	ksproc->irq_ring = platform_get_irq_byname(pdev, "vring");
 	if (ksproc->irq_ring < 0)
 		return ksproc->irq_ring;
+	ret = devm_request_irq(dev, ksproc->irq_ring, keystone_rproc_vring_interrupt,
+			       IRQF_NO_AUTOEN, dev_name(dev), ksproc);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to request vring interrupt\n");
 
 	ksproc->irq_fault = platform_get_irq_byname(pdev, "exception");
 	if (ksproc->irq_fault < 0)
 		return ksproc->irq_fault;
+	ret = devm_request_irq(dev, ksproc->irq_fault, keystone_rproc_exception_interrupt,
+			       IRQF_NO_AUTOEN, dev_name(dev), ksproc);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable exception interrupt\n");
 
 	ksproc->kick_gpio = devm_gpiod_get(dev, "kick", GPIOD_ASIS);
 	ret = PTR_ERR_OR_ZERO(ksproc->kick_gpio);
-- 
2.39.2

