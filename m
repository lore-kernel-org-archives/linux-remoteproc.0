Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010014.outbound.protection.outlook.com [40.93.198.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A303D286D7D;
	Tue,  3 Mar 2026 23:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772581912; cv=fail; b=qVGU+5tIi+Gsb5e2jijSXPmAwSbA1NTrIxRlTMxDB9EokfpzPScg5cahhlTDjXtzRpvatOFwuvuGH5AxP7/eG62j7QXmoMWDnOxSVaLqD39lABFCivNVFIDh9sLoiFGP5XMY0EYE9tOEsSLruNHCGs3DqqrwxAjYoub2Se/Km2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772581912; c=relaxed/simple;
	bh=KZZTWjqKLNN9bCVS7U57mKrFIhhH3dZpK+XQ3ggPm0U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fMpT5Wqmj+8J9DdqUeRz6DRHrmuyxiikMOx0wD9U0eVqjqC96r+tFEKhm8IYld3HngRmb1RXPm1Zz/29jkEh8iEivfF+hjBCcVDzQBmgYNjpWli9Cc0RjSCZ+W1fWVfbVUj4vz1QSVIPxh3G1U1VBSkZ+eqhZ5r3J1snxGN79Sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DYWPPkjF; arc=fail smtp.client-ip=40.93.198.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DYWPPkjF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/8+bxZrSjCGsENHnwWGVcoWGR2mpnwgHJSZGuZsW8+Y3CjBk4MjUAJs+YHvSgyZKiU4qat+bHztleeSluvz2NDkwaLGaeFQcrdm073v3DDklrfsIenbIKj/u+nArwxDAPe68T/+KwpoQBj+3IBcpxNYGnUbQvo+0FSLFk0KDoJ3Px0d9kfZZG0o+0iO8vZ3f9iJyr7v31EtDiU+sHYDL+ONbhetb/nYAVTnSPJz/pbo6aj9dy++0wbyitq3PT6upIwJ27JCs/0LvJ8xQbA9Gud1aFzP5Nsyh6l9j7mrmQliuFLTvl8fbqjC+wL0HtbuYsbiRrdo/wDFzSABXpfaKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7wxHrbIGHG/Fyp44Qx9HonxuKCCH5XHBRTSlcYkHhU=;
 b=GOAi7JpVTZabnGtsF3bfIAX+CW6fqKIoGDUkBwwZPF5QvohUU3OwTs9LlLuUUu/MT/wJ+Jklm1RB4BZXxiannSXg131pL4NUxJKC3PewW7E1XfY28AYlnd1NXl2+zHHX+gEsNM38sdJaEgXwMlr89/DM3VYP0xjVe00ygXikOa5bViKf2fi8LIOIzSyfMP97ZLKxj9tdpIIbuf0QGSP0qRtYmzww/JvJms1lX5T1bEqqLPSijE20x1xMXAIONtZsXjZ01c7b+vv8aYIFeSEPN0GizcHfNMqna41FpGPEm3G32eUrOwPMxVHQ1qANKAkynBmx0dUReyOcYbsqfOBZuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7wxHrbIGHG/Fyp44Qx9HonxuKCCH5XHBRTSlcYkHhU=;
 b=DYWPPkjFr+39aU8nTqRr1Ftk/Zip16zT1Rqkq25Bmo7kg75TXURmWeQScEAy8uTCvxBvtLHh/EsPJWqFUVj1OrlxSSxVTvXZzZdDdjMe3CvxqyeAGU24lKktH9Cat2tJ+735nHKpsjD4760EIAQZxxUWwHX6I+pFdWq6iNSbSQo=
Received: from CH2PR07CA0031.namprd07.prod.outlook.com (2603:10b6:610:20::44)
 by MW4PR12MB7359.namprd12.prod.outlook.com (2603:10b6:303:222::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Tue, 3 Mar
 2026 23:51:45 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::39) by CH2PR07CA0031.outlook.office365.com
 (2603:10b6:610:20::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Tue,
 3 Mar 2026 23:51:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 23:51:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 3 Mar
 2026 17:51:44 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Mar
 2026 17:51:43 -0600
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 3 Mar 2026 17:51:43 -0600
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH 1/3] remoteproc: xlnx: avoid mailbox setup
Date: Tue, 3 Mar 2026 15:51:26 -0800
Message-ID: <20260303235127.2317955-2-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303235127.2317955-1-tanmay.shah@amd.com>
References: <20260303235127.2317955-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|MW4PR12MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e31838f-b7fa-4fe4-76b6-08de797fd348
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026;
X-Microsoft-Antispam-Message-Info:
	Xp5gngZ8AvffCeiQoxr8XBvbR/ffxo9hACT1R+ja0CvOPYM1oj9/ZS4Vpzu/4z3538ev8p6JDJ7Nlbzn7tY/XcK98TPoanvbwvyO+Jc9VVXThC45iLHVBcv1TZOQRgvOIhTGxIpJXOql45y5mwIn8asNFvj15F9rj2pLxZoDcVAI63rKUkge3ffISnHaJ1QQdHjyTLhXCnSQbsNidgty1aKovELsC401Q08+7pa8JPyxIj+6UpW108MI5RZLETEB4IHG3vyR4coRU1Qv09nzv92Fy12SavxyGYPxW2B1ryQycO+ps2oPVlN0FO0g8GsyeOwQhd6jo30/3PDq5rWczv17UYhgchB0I45QYG4FHdCwO/V+2ssQv9AQhH5KzdUzoVPEBw8LaaCVhCpStIlBDA6A+yF0w8WDEMhC+l2P8XtoWkW8zJFF1zEbtNtYNPC39DDlK100RNy9z/oDJUzyXCaxgfxrgPgeXv2bTrHSq7IpqoP3xVgNCoWUqlcBI7g3hnETv3ZJ17Urf+p43YKk/1uUAdzNO+Vo5fKNp0q/qLS5LHX8q8H5t6JAdUyrHcEG0bxCAbHCSQw1wV7NENd0EtefbAHCfaCNqrC/UltJJ71B9aeo9XGJzFIlb3qpExcaZdavKPWnq2IuUQjfcB+P4bdkal4nr3vNGSdA/g37Kbue5n+dWziqdS1yjH+lmh35tcQuFl6QvmUikCRoUkaalFWKHnUfnUfBOKKrjMnnB1EIq7i88CuJhPS7ggx11nglq7amqhwOacr07iIhzmknNA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	a4g+ARDVpj7P/TpIt3tFBrgBUI8wwcLUvVpEJkpaEmAmLrpcK4YG9gseHXLtBWT80nbXWUmHODYnK8xTiWugz91gs2IaS90Rj0N/bnL+COUjyhlmUXHvAzxoQNxjIwSK7Vem9fR9gEQGGLPJak+ilCgMyHB3UE6Z9DRnpHVSeGj6gwYuKOS83Dg0NKAOMQFINKGdeQ8VsaefY6FnZv0HaKlODdAt+hL237w0qaAanjnlPpsNGO2nTrT7+EUJHF+3QzGoS6rA0/hwu1bC/wmaPPIDKeyrOpZRp++CqGF3dgu5C+OWEjL0j3LeYgCDdkwUFltP2uKuyigmiwdgaD5123DU+9EdE7v2nq59Z4v/qSLUwAOjk2bMp4OuYYMfglfJQE8+MvUG4AFJIzeKYhoXr+3t8NWVKnTQ28ny8rPXNAXkeUdrO3rwipeOQKz67S6k
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 23:51:44.5476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e31838f-b7fa-4fe4-76b6-08de797fd348
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7359

Mailbox properties are optional in the remoteproc xlnx bindings.
If mailbox properties are not found in device-tree it's not fatal error
in the driver. Driver will print warning messages and continue with
normal operation. However, these warning messages can be interpreted as
error. Check "mboxes" and "mbox-names" properties in the driver and setup
mailbox only if they are available in the device-tree.
This will avoid any unwanted warning/error messages.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 5a468d959f1e..148d8c622566 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -265,6 +265,10 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
 	struct mbox_client *mbox_cl;
 	struct mbox_info *ipi;
 
+	if (!of_property_present(dev_of_node(cdev), "mboxes") ||
+	    !of_property_present(dev_of_node(cdev), "mbox-names"))
+		return NULL;
+
 	ipi = kzalloc_obj(*ipi);
 	if (!ipi)
 		return NULL;
-- 
2.34.1

