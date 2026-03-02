Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012023.outbound.protection.outlook.com [52.101.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A400B481241;
	Mon,  2 Mar 2026 20:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772483256; cv=fail; b=ugw9Uk90eIUQtsNwQufe/14k75NcLBs39VlRoVvqfHtnfFtd6MFyE+2xPQ4xojKBm5ksSwwZpxwx+1TndRgD7FDDnbkLtOq3XrBbiq4By+UMQrbCJVPw9W6w3tmH4bsbDQ+1czbYn4c7Ir5afqHSk/urHaqxcaFbvHecTr8Kal4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772483256; c=relaxed/simple;
	bh=OxBfdlHp4ca4ORTxNS0lXqHGYKIFh1hBQRHj7u7QJvs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m5QmtrM7AFhlqZl/3Dcn9j7mAGcyV7H2gPwomnrpCwW/FPdovMr3ZyhTWyPc2qM1w3ztE29cNlZtL/sj2uxDHZ713MDevh4FNTa7XUyP3G5h3mL3Rabrn/YYm5zexbG9rjByIoTPhBdpMvf5ugnH6Lk7YFbGNv5t9/AVC2HrO5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=t/lEpIxN; arc=fail smtp.client-ip=52.101.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="t/lEpIxN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MKQ6C+bd2qdgFk/WXZeAxHd/Te1aP9ma1+FVDYVm+4hqBJPbKtj/PAIWg1Ge25uteolg+bQUgTCb66JzwOvgcq3JULVYLZy9hjR5WaRk+8XVRfNpmYGp1YpVRgXp8ueP1Ossw14tBY6Tu+1mb+EYy4NTAU6iPU4q+nXK334o04sbz3V0/nTbRx1KIA2mCEzuDhmyZWyQkHP6LfP2aVOheboHPIcEDPhcKeZowna/XEXcxiUsmhzv2YMgLxNVjCI8slHqV84ZLYKaswqrkbq7TzdDJshKk8QIPPyH5ir4+HHn0FzCo/FgzwK9cAZqgSB02yIEH4ty0MFY7e3q3F7QOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEQRSF1nXWASAQPjjFwLap+6ioUljNwYB3ui+Fl/3JI=;
 b=GzhoasrbZJxY1zeMeDIphAa13T57reNR56Wya/GRVfFf+gzhe7g7B6UQMSfRbCVflLVsb+htgDO1VpgL+IPz3s7Lr677lAAfaRgn4S2xXpCa8ghBht6yzpbWeQ3r3NykdTk3v3/eKcTsSAOwyWK7kkStdYT8hgual3rdUhhd8wMpfk3vzCKq+ctdYsevod7Gr5SQ1H9X/yntENj7PX3YYP1WrSHgxKsz4DBPeGJX2sgv5f2bKH7+eOO0me4tYsVkV8ImBPYOGLhAQk88cg1GpK2jb/h90Q3+JOft0UfyCSMeiJnrplC0jG1F/RP/u5eE1NvcEpxR9kvt+/XtJBk7Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iEQRSF1nXWASAQPjjFwLap+6ioUljNwYB3ui+Fl/3JI=;
 b=t/lEpIxNSB+jBa1as3LFxKRRWh1mv9m6NsNKDOO6Wga1imQR5CxK386jvvdv2jRzB+5RvZGXucR5/v+pZvjV+uDm5JqGn2xvYmVRwmQAfTQ6v/q2VRXoUpw82z717FVqAvEK6x5cIkA9TaJF5I1R7QmZ1un4wUG7KdDeM0xOb5A=
Received: from SN1PR12CA0060.namprd12.prod.outlook.com (2603:10b6:802:20::31)
 by PH0PR10MB997594.namprd10.prod.outlook.com (2603:10b6:510:37f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 20:27:33 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:802:20:cafe::ed) by SN1PR12CA0060.outlook.office365.com
 (2603:10b6:802:20::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 20:27:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 20:27:32 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 14:27:31 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 14:27:31 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 14:27:31 -0600
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622KRUtK1383398;
	Mon, 2 Mar 2026 14:27:31 -0600
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Andrew Davis" <afd@ti.com>
Subject: [PATCH 2/2] remoteproc: pru: Remove empty remove callback
Date: Mon, 2 Mar 2026 14:27:28 -0600
Message-ID: <20260302202728.322073-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260302202728.322073-1-afd@ti.com>
References: <20260302202728.322073-1-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|PH0PR10MB997594:EE_
X-MS-Office365-Filtering-Correlation-Id: be49ee9c-c9b1-400e-adb4-08de789a2257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info:
	fBHFns6UnWyMJCQaKbDLgyvqCv9zUKBlmVqhcLcBpquI+2BOtaBCgf13AmwHj3Xwe0viBtgclFCIognAY9Fq3NEx0RzgXjO6vG7ZX0xddP8bsaQF5VoO68WfLE9UU73w3opmFtdb1I7VqXJIa0HUP/xtBr6ow+e2DC70oGnqFBKqf3Trg5VH9N7Hj5QiUEuwNkeRjf4Mk2Wjd2BGLT8tS2N0cVSaUlkbTZ9VCaSSGPfH86f9qmDZtQd12C/KQVtjQQC44bkxya79bmS79LP8TpTmN/8Ox4nQV/h3YVe9a4PMawjo5QHFR5j7Pu0jgZdNQmyqY6MiJ5NuGPEu0WuV9dywRqJ+YNHzYMk7ySZzz8TLkeiWcfntUPjj61dgCK80ozaqvfVa/QLUcur4n6oPfBu+HErGieJ8nKpyJlsFwyUnul6tvHYJ1WxBqqPM7pI4qELzi7Y4MfiyNt1lWef0O4kqrLxYBzT2VzHxGNNo+lLtQ2DIMP0YmWG7ynXYQGKrFll0tVwPHp+vRm4oVoAB2Bjvbp4vMINnICAM+x+rv5baNEL3z+7kDnuXqFne1ZX+G5Q2EYlwFvDc8X05o7w8t4ZdWUJrRZC5ZF1K6KV9G77LuDg5vBtB3tkA4JXWwY9hFdqMLxf7WZoA0YE1z8hDa067Z2QEFpyaSJccO2PP+PftccPV8PF2+uPCXmcx88iDE4gb6B84uUG2lCXwFXTHtuHuvDhVlcq320wR9zPnHgR7dwS+wFcxAQ0Uef2Li/CIXoEjkHImlSbrVIAIktMoLnroSiIGAwRnpx9dAdbQX2dGcnOK0kOiCU9q0GUxj1VRVLWtXVeLzV4GdE/yaZUm/g==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zvaqr6azJjtBNEX4EvVKeh14PR5a/8Jla2t+MrIMTkcVEbGz7wd2zuFytYDQKcTsWl7H+UAITTsVSOBXngGKu46hft4e6uMwYwkyBbJT8LX0ueuMU59ko7DxRO6w5gQmmrvm7DOFcywnvSdkBgId3o4pzOlYIgDRgaBqxygdauqEQuGJKq1fKcrtoLmjvuj56e7RN+lHDb2Klq3TqOibrIXiaCCUqKAsoEZmyn6384tkKn3GTPGxAlgsQ3xhd6tC/HOK44z0dsRyCgANKp5Nwuq7leNOlbTozs31Y6nk6cZhTRQyy+vepkl6HeyHIAYiTmOYzxYyR1n54TUNzjqp17vWyUM3On0PcVCnb668IhN/ZTP90QmHBfxue/Fdq6QPImMKH6N0epAEshOLn/pPsCeBpBi29T3FIkvXuWqoyxPWKKkdXL4Dky5pQYit/GiH
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 20:27:32.8995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be49ee9c-c9b1-400e-adb4-08de789a2257
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997594

The .remove() callback only prints out a debug message, remove
this otherwise unneeded callback.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/pru_rproc.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index 19b107d29242d..a4636c7bc6b7b 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -1078,14 +1078,6 @@ static int pru_rproc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void pru_rproc_remove(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct rproc *rproc = platform_get_drvdata(pdev);
-
-	dev_dbg(dev, "%s: removing rproc %s\n", __func__, rproc->name);
-}
-
 static const struct pru_private_data pru_data = {
 	.type = PRU_TYPE_PRU,
 };
@@ -1131,7 +1123,6 @@ static struct platform_driver pru_rproc_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe  = pru_rproc_probe,
-	.remove = pru_rproc_remove,
 };
 module_platform_driver(pru_rproc_driver);
 
-- 
2.39.2

