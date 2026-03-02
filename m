Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010058.outbound.protection.outlook.com [52.101.56.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011CC383C7A;
	Mon,  2 Mar 2026 19:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772481384; cv=fail; b=GkTFaCkQ1jE6ZKmtdkMdwST6LOlOfsW62UhIUIfrswHps/veLLJIBh3JRTX/OLqYiBpbO6AB/JWMtg0piNFbD1xbV1PfIoMLKeyaRBkN+oysGQlmJ3C/3WGzN/jl0zR6J49s3095UZ0rcCI+OdxSi57fEyslWSUYAcf7+YX6+sI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772481384; c=relaxed/simple;
	bh=RurYByDoI2fglqvsCXmUC0DkEAJ0yNC7vjUwsYIX8sM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XoQQJPrEXieMtHHPrREs/tAK6bpeVYV+/YwWbV1TleM+G2QLXK+m0qkoyiZ6lGU2RsEbtToNIQV/VHBiMTWwNb+ZXJJ4LdNVw+YaIKKjRxtk1DlnCyKTf3m91jL3zNZaYLvmncLlt50iby3vPymv2ZUDsX/xsJr6O/MirWRHfzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xaZDNxBV; arc=fail smtp.client-ip=52.101.56.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xaZDNxBV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVdCxs6cf1DYzYyUVuu8k1Yc1jmVnVbcJ96I/meorkiBm5h1a7sUSRrkt/TKs0vbWKsgo+gSOBTonQe+8S3z+33BD2XvJQ/u/9S96olDO4xF+6WdPPqHxjPNeMTDfPeiX2kW1seyM+jafsKXVwJryawcUHjnTF5dk3rkji8d9ftRW6kOraVE2rhFIoHFNkQhMnleTQcGufXMmfWTDHob5QsJtSLPAkWhKXw2DWmO7C3MFdlOPZQkp1twvysUzqyvJTwLbrtvbAN1MNy5XHU5Tf+XRM0DWT5WUPG/r2Z9bKB/SAxFgVX4BfMidml/WlXLuXx+TqxtEFssef7kZS0Asg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBNwQr06mfHdkpJ0wzSj28/VR0VZpvHZEtsBcssRTts=;
 b=dnpvLsmK9CgeS3HKSxEKyYJWYBAuMVbr+YEI0eDP6LNL0lhnrelYKJkAR9vkH+bcREDXTQ7cdb0K4M5FQKz4dkK5Hw10ogksWMnjyUtzQ47svgZNSDIiHMddhf5NaqHUAwHWB6nY97ZP4MfBwJFL5BJKQ6s0QfVEITJkHDJZ+OGzTJQs7AL0EIG66z6sM839eW0uHqIKxqjP2Gmg7dcRXQXNLxBFePrGGUB/eH6PyHcCB967v7Tv1cOtwj3iaizaBKjExUmqRJ8aZcCPjrDTqsPlGS7JzMWFbBZTLDimXDPRPoaSk1YJ6jorlKnAm+JNcW7Ql4Lh8+aKH8Dih+NLFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBNwQr06mfHdkpJ0wzSj28/VR0VZpvHZEtsBcssRTts=;
 b=xaZDNxBVup9uAWgoQgSqe8iXyKJLh4yrR2Ks9F+uoNoMGUCaOGgoWQIiqaMGF/Jpmx34PSWfGbf2pFRzzbvI5w53JoRlpbpls2XKrCgqt/zdDp7YehlSpak6SQvOPcYyWcuHTaQpv57omHxJ0ZgqcsZtjyvS6JAO2E2RKqoEnTM=
Received: from SJ0PR03CA0290.namprd03.prod.outlook.com (2603:10b6:a03:39e::25)
 by MN2PR10MB4255.namprd10.prod.outlook.com (2603:10b6:208:1d2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 19:56:21 +0000
Received: from MWH0EPF000C6195.namprd02.prod.outlook.com
 (2603:10b6:a03:39e:cafe::73) by SJ0PR03CA0290.outlook.office365.com
 (2603:10b6:a03:39e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.20 via Frontend Transport; Mon,
 2 Mar 2026 19:56:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000C6195.mail.protection.outlook.com (10.167.249.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 19:56:20 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 13:56:19 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 13:56:19 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 13:56:19 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622JuIOa1348869;
	Mon, 2 Mar 2026 13:56:18 -0600
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Andrew Davis" <afd@ti.com>
Subject: [PATCH 1/3] remoteproc: da8xx: Use dev_err_probe()
Date: Mon, 2 Mar 2026 13:56:14 -0600
Message-ID: <20260302195616.312378-1-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6195:EE_|MN2PR10MB4255:EE_
X-MS-Office365-Filtering-Correlation-Id: 82a2a558-2609-4740-dafe-08de7895c639
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|34020700016|376014;
X-Microsoft-Antispam-Message-Info:
	rqir08SYkGMA/KjaE6wwgqGHE3HKJJAZ/B0KI6F3/7jFMBMtUyoVlfLV4qYfk7B2WGyu7vT4kM9aLbRKQYKqgRbNDWBB0LTIEFopQJTt0MAqZrsprGJjuBZr/4d7LngvWKiB8/MWumeD8KIfLucd+4FIHsbX3zsEYIMrsb+1ZUHsN42BFb/VzdREj9nVcwwW0h9ZaqMyq0vnfzbmDTI/jd9ZM8lW7yGjELqWpP92Rh0pTrmIgiCjRrs7jqoX8Pq5xg7hVekymYGuvBhcfpdy37brEjo/0oYd2/xU1leTSGOR4KT5Mx8Y+u3aWmbaQ2J0JdNfkzHJvefNW4r+WogO9h3wR2ANd4duqBoDL8bIevwnqnCMu9y6fN/gHJiV0XZD8VGUKlaiWqyjs5yPjVdN+2aQi/3RbvGB0ISwuNhvNT4Oiq9d0+mXh7yBoB+vnyYxJTpAFWPpF9RwtduH7nt2AZlUMVaBkikBS4X4ld6FB3prNtDNsqqcG/LcqOEgmkjw1V5vAm0z2NGG6s5Nusj3CaC8ZZ6oOZP+SJRsB4cexBKQXasm6StFZ4wUC7e8EYLpVf3URD5aGc/PajJWVBePie6rNofx625sPqSqB+7zo8cC+Naa3pUFqzmjhmAen+wmlia/tj5UDOqkRs/+iKJKEyNNeOlnNtWu0JN5+LluqwKjODbYJdsnS1FNJzGoVvwiTcv88UIqLxlifaa2N/q89qW5BXNXiT/7GulGByyrQwlArQ1x4ln3SKPnY+Vi715JcNHQoMDnD89qEed2wPbDRPdvt7mjoD79Xy7s8PWHbZsnzVB3x15Y3soyEUhKqFsGS48EAZiak5W2mTb2y6Sy+A==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(34020700016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NfRhuX6r/XKAGnPMj0w1WM4EV9JqzrzosTcDsA7qe9iGxBAZVLoHsVQKw38KXcOxpvSVMUSrfaI1+kwDAXcDoq14CpLIo80mpnHrQt8L4wvjbHSuthHT7fd016T9wfZpS+tBJ4fxh2yOyp4T60NzeMOeaHXYzfhnsAHw5plzQMEcfRXGk9kjiYzWjIhsgcyeourCE6lpk3TTEQPrjIn0Umsr2tIdvGxdAZdUnhZFTOY7x2WMoW3Rs8rqN70VFt4HB1t4TgBOCFMMA0aQF49PeLozwvLeNzk4usXroCdzO3CzjQzWSVeDI50HCXFNS0KRjtAExEpkqJhn1E1yB3pT+gZFaPqUBy2tx7dIZfneZnBt8pamAKRWah30Z5QWQVH5jSANn82zjga90zLwtzl/xSPr55DQUN0+cwuTLPh2nbdV8plYthdsM+uTq3FAQxCQ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 19:56:20.2974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a2a558-2609-4740-dafe-08de7895c639
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6195.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4255

Simplify the probe() code by using dev_err_probe().

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/da8xx_remoteproc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index e418a2bf5d2ee..41744f3f0252f 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -306,10 +306,8 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(dev, irq, da8xx_rproc_callback,
 					handle_event, 0, "da8xx-remoteproc",
 					rproc);
-	if (ret) {
-		dev_err(dev, "devm_request_threaded_irq error: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "devm_request_threaded_irq error\n");
 
 	/*
 	 * rproc_add() can end up enabling the DSP's clk with the DSP
@@ -327,10 +325,8 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 	drproc->irq = irq;
 
 	ret = devm_rproc_add(dev, rproc);
-	if (ret) {
-		dev_err(dev, "rproc_add failed: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "rproc_add failed\n");
 
 	return 0;
 }
-- 
2.39.2

