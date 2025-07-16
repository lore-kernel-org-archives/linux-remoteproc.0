Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7A82EBB9C;
	Wed, 16 Jul 2025 21:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752701474; cv=fail; b=Vd5LooR3cc9st3JuJM2QwPIJLAl5lhIBZvHKCije/zLSoYfnZk+nRfv6Q5GFZsojwzUMMkAqHaJy0aAxCTfa9zADN1tfE5erDWJv/GFt2sl+Pd3FAzb7QPB30mZBDV5JCzDLZ33aLEVeYxPQpQBCrMzWIY7DzXNytokhuV6WuPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752701474; c=relaxed/simple;
	bh=w7S8KuUT5PQx0QcitQRbaVnpwD4JK02XxwBMib0U79I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=scQ6CIBgTFGhScicrqJXfrPbsAhH9xTuu/WT4Vq8VQNgOwr/Ydnl5lfX9/EWBsqDbfExH22v2xqSSDm7uTAcuiU7bR/dAwZRs+i0MXlvrQe+8nTjsgRmksLmMqRljmRUdeGgfkfRcG3VHw4IjWPgMgDwbCqa0eCEC2xQSpQShAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bLn5fAtq; arc=fail smtp.client-ip=40.107.237.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bLn5fAtq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZjhjOVbRIR0PEp7bc4FM5GvjEdlHw98EGmsq6AxKHKfnAc+qgFUq0d1d28RC9Ls2HaKg5SF6T/lUqnTHxucmgu9dSnPW23gZ5pxU5XbSUoH6Cjy1N5+OsDyNs6HkmNzBR1Ol0Uxeyiz5rlfRd69XwkdVStS1ywbN5L2f7W41MfZia9wUlHEd7wvhvZYqEWLD7N2QzZW1h59H7pfVTz3sdmK3hSEXsqF2yWG8Y5/QyX705xTKoglY8Dce8+r3t93tT3M6masY6B1wPUGOYnQD4WyFi/3w9BAT7G/GsJbTYM2VD5xkeMWmF8nHAHtTGXEYu2+UiMujBOtgilY566EWwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2n9/rViGivS5pt1hX4xncAvmVUuHhtRoPiFDDymchBI=;
 b=wdIDlc2DdZeaqKVixXGqiU40mVdaKV669wf5c8r7mhrlWjAT9e/uxnRdoW4Py39pi9O7mi4Uz2shUiNpL3ZTrhAlbHUh8xLzuK0IlVFYPdcp64TGRZAVQ0aD2WFqDTZu+0swydGdKzoxp+yYnXp1VYpBpS9DzcoDvbFxPqfgzDb1y2UiEvrMsxLSVsiRb8gJRujYaaPt9Uzlc/zf1PEFgAbnZ0nC2CZzj8WDPFoIJycB4GUSQr0ZmznqxEODS9WKvIXgLhg3D4VwcKBEslpti9k6viC2A8po/wED7nRG9msI2+Sla7yP8HcF5nX+QqBcpmdYG49WZZOm6EY7rsGNWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2n9/rViGivS5pt1hX4xncAvmVUuHhtRoPiFDDymchBI=;
 b=bLn5fAtqDoaAbZYOFgss3iWPJaWyAP6FZ2UFfmXQ4/ZUTDsxHOIL6wQDE478iD94snH0n9V+rdREiY4rt472fgI92EykK7HhyYFYZdtRFwcRRaQsDOPNy02BQzd16x4GWaard59QHRQIaGhn9k316QvreSRs52f4Po6CB5wzmbs=
Received: from MW4PR04CA0097.namprd04.prod.outlook.com (2603:10b6:303:83::12)
 by SA5PPFE91247D15.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Wed, 16 Jul
 2025 21:31:07 +0000
Received: from SJ1PEPF000026C3.namprd04.prod.outlook.com
 (2603:10b6:303:83:cafe::99) by MW4PR04CA0097.outlook.office365.com
 (2603:10b6:303:83::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Wed,
 16 Jul 2025 21:31:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C3.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 21:31:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:31:05 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 16:31:04 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH 0/2] remoteproc xlnx driver enhancements
Date: Wed, 16 Jul 2025 14:30:46 -0700
Message-ID: <20250716213048.2316424-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: tanmay.shah@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C3:EE_|SA5PPFE91247D15:EE_
X-MS-Office365-Filtering-Correlation-Id: 72ba0d93-025a-43f6-309f-08ddc4b0131b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ugjOJVEXlbMa1AlmnhR23fYO17WOn3QdJVoYPllDJjWO9Q9UIGTvlYYSa7fM?=
 =?us-ascii?Q?plYkqJ1EihZTqzyrnSe681Q7P/wAV80vY0qO5R8CEeqyu3aEUlxN30g3KXc6?=
 =?us-ascii?Q?rWHOOd6oBzDBh1PNNG8klyErh5V2QyIj/DM0NWfhenPYerCYY8aLVOYHEaGL?=
 =?us-ascii?Q?N8Hf6c8Ra5TkWOL5USyyHKUd1aQzMEDw8W4Mt/e95PUI5PXp3/EifY3uZHaS?=
 =?us-ascii?Q?Zx8Syq7biAhgQ/m73rtkJeDNK50PavLiaaVFKn2dP1U7N29SXWB70/2v1cO4?=
 =?us-ascii?Q?qe4DSkxUL8zxEnTAkb1+LG5skZoIwxRsRVxm83imI8TdXcg26ed1dDjqH/kv?=
 =?us-ascii?Q?BGNKUiEaU9LO2kudEqOFWB5urSU3fT/KF8Wca4kX2MXVZuiwtfP5Co6/CweZ?=
 =?us-ascii?Q?CrSOIC7CnhC65Vxyb7Nh/niLUZD/bNqJ9ax/yM7NCiBAVvcSgoINB2UiOsT6?=
 =?us-ascii?Q?CrtgHXGDkZAq03pOdrcFkW4vjH6IyM4JMtHNXDT3g6sEjB1YF2ggAJP/cDdJ?=
 =?us-ascii?Q?6+y4jDv/G2qsNuNG0bRUMxPcyjbYrwUELmPXkJZb62XcmufNttJrjh6YqqBV?=
 =?us-ascii?Q?ej6m/1mYtzadKNEgjnM4t7Xm1h4KXHfosUIcLbc0Leidn++oNgxYGRF6OvJ6?=
 =?us-ascii?Q?A0M6Xa1vc4EDzfjTUQt7mmxl4ajivKUAvMb2zyjTizjbu5zkOdmplMiFUKNg?=
 =?us-ascii?Q?pYSpPlQNR5a4bcStIPTCJ+nwPvq2fPlmCcvM/PnCFB4PBcmpx63BeSNHsvNY?=
 =?us-ascii?Q?TzLLw+5RDiC2akhpQhuFcmInKZNfueyh4u16iVe/Qz+qGlc8s7NgTE4Iwb47?=
 =?us-ascii?Q?sM4If9P2xdk6VQP9r4nLu1WV+5K9uhiRGht5pyQY2+9AkzX07CkyHsa0V19l?=
 =?us-ascii?Q?o4gZVlXyLFwO8nkqZlo6Nclylr6XIEBqMxfFLzke68Uf9+FUhhP9Fux5pxDV?=
 =?us-ascii?Q?eSTnKprLWfz9hgKyVKKTADtDLJMtc56nH+iekn4yZs19HFoHOGIcBxmkg/Lo?=
 =?us-ascii?Q?PtpjAR8vpgA0Rxyeya2k7Pvhkizu2zGGwhO+auNN5Rbf/CuXiWUBzw+R8Q6V?=
 =?us-ascii?Q?WLCqTvC/BcoWdCm0+SP48Z+9wnfqFpVfdpGVOfTm8qvnI4Y1BnVnhEritQI/?=
 =?us-ascii?Q?Y+h4SVxuSy4koijz23MIX0ClVQMv1Ggu3CQyBn9H+66lMwcRNGO/Mc6hKz4K?=
 =?us-ascii?Q?pqJ/jEnQxeBs8nd9tV4ialA97p22PTbe9+lIL1Sy4ueppM4RrEyU6zYW4h6C?=
 =?us-ascii?Q?3vbumV4sFJLLNiXHAEiaUOx43/vAZGBxtLvBooRkcMY2+wyFUJxKNMWw8wd6?=
 =?us-ascii?Q?0Mkkj7QNxbNmBdzmEWmeEInELnN3P3pp+u3z2N7cz+7T1TKcnk0iTVUc0WuY?=
 =?us-ascii?Q?jdntqUKK6zo80T3XY9Blw+hTHlfNIE6Ley9eTCeqELdYUMG2SDGsnuITmsqk?=
 =?us-ascii?Q?VoRMRCUtXEN3zgqb+csCgty4v8vDINSKspyunEi7qIbjVjjV7xz0El/+2DGh?=
 =?us-ascii?Q?QW1YcpMyMNiMmdRJ7fkG0jjUOocK2LBBGbYV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 21:31:06.9042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ba0d93-025a-43f6-309f-08ddc4b0131b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFE91247D15

- Disable unsupported features from platform driver
- Fix kernle-doc warnings to make documentation better

Tanmay Shah (2):
  remoteproc: xlnx: disable unsupported features
  remoteproc: xlnx: fix kernel-doc warnings

 drivers/remoteproc/xlnx_r5_remoteproc.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)


base-commit: 76970c009cefc4f9308b57d063beb169762b9164
-- 
2.34.1

