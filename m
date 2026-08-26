Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012035.outbound.protection.outlook.com [40.107.209.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D5540B0E6;
	Wed, 26 Aug 2026 17:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787765991; cv=fail; b=NIn9d+s24I6KdV4a/O7czrj/RDczxQUXzyXJaDdetDCiicUcvZwrOoY6fFlGjTDsLWge1hDgZyXYd62GEKh4KmTZxVlBZuSfBW7nqeIMKS7krQUP8lT1kSvlHblfTT7TjzdCLGZGp+mR+N2eoqJ99L9j5w0rLIUz4gjdL3JCwvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787765991; c=relaxed/simple;
	bh=+z9yX1iACvjVZuxVK2H4avgxsl98L+RpiZaYQM0Mafs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cJ123t5CdIxtvXuFc1GHxe17mRw/NPR5RjHKlXAISwEPHr1ezDkK7D5MEZi4dp28ePxBjZrpSL6LBmZTvZR1iP0M11xUi87C6uX8HbwZwKeCTHubu4L9bHEDaUhb0MyNtz307IlozRJnV01aVSZvN0afu1naU+GMgn2+AkZA370=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=j5uZReEm; arc=fail smtp.client-ip=40.107.209.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="j5uZReEm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqvruQq3dCHliL6B9pPwCMf0+sce8S5kaXv7pL1wFsqiHcfS/O4XyN+8lQa00Unvwci4KAjeRg6+aZZKLOGUbDbg4BKPXUXWBpJVQTNGsH81rWFBpCBnWpi2UDiqLhTpMPkc1Km7PqYylazPaUiuSed7lAiDMhvUpK7oL9Mevq5UVH4Cao4SFJuBN6MC6bZxIenyURTF9r/xiNUwjOHNMAI3pxCcrH0HJHjZvw/a1Aqa3OkdsXyPqtNJQg3zfw+Xo1NEdrs/kcFttEZOXetfHrberBLMgMSq1Xl0ow+FbcdfTxFhGE8xjyiXjyto7v0HQkwbZNfjKIMROC6RnySo0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iliyurqiiunxCxTgzMTcfXk4Xn/wlOgclHuZKoG4sa4=;
 b=XizbKHEW4CqTvZEC43iUJOkCZ/h2O/ZtbbN8jch2deQkk8Fo1iVQmQhtAbftUVjtfCz3nuxVaiaQlI5JCVkzdW5K59NYS/LeO6yKMpWV186s2U09qEEHIgKOmj2QEBAVmXB2WWdvjcmf/5bQZtv25gpBRwyocvZfU+58GWwNSxFsrIOm8zp1Jze0aL5HiXKx784zwXuoPUFrV6tl2SaU39W1rxMrbMeivTlyMx5Oj+wHDZw/3GhTjKeJ9wKBuk6Eki+1R071v6+XO65siZJGhxLbNWX4zqNFRWgvWcqjdGgo78MyFB/DsdjqYBsIp9TAVvVY8gaNrneOkrN+Fe8Tmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iliyurqiiunxCxTgzMTcfXk4Xn/wlOgclHuZKoG4sa4=;
 b=j5uZReEmbKKX17/F8N+9xz+u6gA+2PvNu5v7Ovgdyn6IfX2LRr6EcSC0yjR8PRlIjvpO9CjLgxQFuB6fogdbp5WF5JPqxGBOBoz1oaMkgxuAatMUCQzp3jdOP4XVNzxNZVcdZOOxNzMMSxnkU5eSXiqbwi9hwxfbV91qubhlF2s=
Received: from SJ2P221CA0006.NAMP221.PROD.OUTLOOK.COM (2603:10b6:a03:5db::6)
 by CH3PR12MB8331.namprd12.prod.outlook.com (2603:10b6:610:12f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 17:39:31 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:a03:5db:cafe::8d) by SJ2P221CA0006.outlook.office365.com
 (2603:10b6:a03:5db::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Wed,
 26 Aug 2026 17:39:30 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.0 via Frontend Transport; Wed, 26 Aug 2026 17:39:30 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 26 Aug
 2026 12:39:22 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Wed, 26 Aug 2026 12:39:22 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [RESEND PATCH] remoteproc: xlnx: do not send new mailbox notification
Date: Wed, 26 Aug 2026 10:39:01 -0700
Message-ID: <20260826173901.2329068-2-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|CH3PR12MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: f3e83d14-b7fe-4556-26a9-08df0398fbdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|23010399003|36860700016|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	0m+LyujW2Rj0r/0C5l6lPFm9fjYAl3Dh0jAeEK6gsOUtbYDBtdb6/3UJggBLjFn4gGJ8Oft6wSrH7HLbzKxUWH1mU/h5OSISw6JgyFDORJVG9MHu+w0zIBPmXktxY33IgPHBWNzA5mQriCyUOpJZXrQfKocoPje4dK8M3WDLEnu/QHD5tLbKOs0T+giYRTmfyu8DNI7SmfdAkd/ty5y4/MIaS+ukbmKqgcvZX/nhRqWyjbalQAvlJKiyTOwwV8Wzm7k4j2eByp8UPl9cJQN0ZOozBhlC+dJLqaR7++I6bGj2z+Xk+9zd1I5KOWAuE657PQR2jaKduUOTINdgPMEDQlwmR6ktMvTr8fJjujGWdBetzTSlpNHt5UGeIf0O+UHaATVOJF584CyhdxNsbiTsTlZvbQpRNWGNcbyQkn2yKit2T4mhwMYHi11iiGDqyMrN8RbufnACgUYoXIQmuEB2mvK3E3f+iXK/xOj/NDOMzqyKzRbdATFbJa+d5XMNIvNXTgrWEzgHrPg1ECVYjxUIh4hgKGtijpD8E9hVMjAAyHbWKGSE3PHdbtoBOGSSxj16bSbtG+SgO+ODR2OvD4pxaPX+tSxirL6EE1MgcOAcu2rzotwfEna/dltbzZOXt6y3UUjMFajOB5fPkBXLZy1CQO9AI/sNqDedZ/2SsN06F4MbLhc2Ai2qPzShVQl3RMquRv6HLW1u90dsqe4RDk7Tlw==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vALjs6IQd/p+51fV/T2h/Qa9O7Oy4cPJ9bU7P/jynrBwGoauBXGSJxgQVNu0ly1V3eH0Wl4CLnC2T7SF8fD41T1gncSV38HnVvD3aqWOwhksbi296A2qao2eXfh6UoYfUdT6dffgkT7m3HATPgd35iZoSiqarM23jvXD3Anb32CqZD2w8tlNOT86ZYFgooaU6lvafGPAgmHwyne41z1JOSNNdOYi4xH2Ywn9FaX4/BWAG+EmtDFUJpn3+ITTV+nHY2CVtuKipWxFtG+Gd7lV1qARXxkG7FGlX5/ilrnDuWVUlAwLF6h9Y9aApG5KTJDaupbcHvGHYZAizjusK8cTjM3Vcg7wXBWxG6vceng6cAi3fKFj/jGlC9lnBSwHXD8GyqKafojzndf8ctEHjXPgdG17rEV7v04RSqTd2JmbABSy04s5xsfTMyduw+8QZQJF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 17:39:30.4041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3e83d14-b7fe-4556-26a9-08df0398fbdd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8331

Only write a new message to the tx mbox queue if slot is available in
the tx queue. If queue is full, then do not send new mbox notification.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index c685bb5fa62c..0e71edf8174c 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -381,7 +381,10 @@ static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
 	int ret;
 
 	ipi = r5_core->ipi;
-	if (!ipi)
+	if (!ipi || !ipi->tx_chan)
+		return;
+
+	if (mbox_chan_tx_slots_available(ipi->tx_chan) == 0)
 		return;
 
 	mb_msg = (struct zynqmp_ipi_message *)ipi->tx_mc_buf;

base-commit: d4d61a4b0a52e8f3cdb3e1578602850a3452ec3e
-- 
2.43.0

