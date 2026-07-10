Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012016.outbound.protection.outlook.com [40.107.200.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A537037EFE6;
	Fri, 10 Jul 2026 19:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783711723; cv=fail; b=DO4FDFKm4SVEYM27WU15UCKmVeongXF8jriE3coVRUzjbloHd8VlRUA2x1bUBOIkYfBIJTp+eMasWKSavuTpIkXAZfbZdxjH+gUJClQh13X30rTTMiAKLpNIn6T8RFKj6eSWixEDujFQn+gsryWN6BjSWKM0EScgAG/40JvHxXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783711723; c=relaxed/simple;
	bh=L/J2ItVW0lcI0mvOPVdcgSTovFHyGge4BakbRB/yWu4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=baflV8QOYC30f15fePhSgSrCBpk7hf4VbbDmSpn6LwGjsp3ok8aYTF4iW8W9Iz6bobEgFCxR+JgftBDp8hxUkSqI9G+xSflrvLJQzCriLz3GM5nOA1gs6vZxuitH9U/vv5KYia7bSjQdgz7rjAyMF8E1SRKN4tgGuHT4+0L9Jms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ar4TYdvJ; arc=fail smtp.client-ip=40.107.200.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ar4TYdvJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aU4yABDLgr7ES3y86FBgxML4jkCzlx/WXoTPbAYXrG30KNse0LCp00dm36yta2ikXybfBaq+wn/DAz90bcKlGUxR1aUmJ2b1ZtZmYYcACBmXLek/25LB8Qyq4RqVjOxng1t8UfbvxK9s9LFJ2Sap9wFeibyRsoFgJfKntjZ2YOku1cHE2//o2uSotoSIoyJFMm5IJfZHB0w4Lm8c0H4wX4ADBK7w84cCEs51IB/xW8w0VXe9FGxPTLM5awA9NZMhFkEwQALaSeeq/z+bU+oogWkT+++oeJDBRj0OKr0MSzK3v4PfQTrGk44m+BjJ1tOUMe1V8FJNZP1Ye56RAK3e6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRNptIgXeyRprJCu0906UDG6LykXlRRm7nmOTQD3/Zk=;
 b=vQBPxX0y0S53KG0Dbv+W+M6GtwxpL8YHAfXwOLAY/6Ug6GQ8xuPDIxl1rYEcAiSk52QeSDqBztEakNnDaEk4Ox/aPHVgTj+KkSli21NfVIUnJZ+ODKW4vICeUzyoG5TPfs6bzrQKoG2QCvhWJy3CGV1X5tACqyNb/Z1HmXyxePRC4MzHU+R4DHVkHKnsK6REqi4QV4ZqY/aJAnXqXAhz/1GdB3AeEm3skJa5pY68H1ppErpy2IZLi2cDdi1hbToOMFB+oDLfGIdenDt8V9dC5sgdnlc8Q5qmVaRuixnuNlgJgITxbJpAvvBvbqH/+4V3fkMx5rVNnJbvL96GJKSHgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRNptIgXeyRprJCu0906UDG6LykXlRRm7nmOTQD3/Zk=;
 b=Ar4TYdvJtOffVsPYSexU7EXLxRbW/O36PheM3KuSNIC2ZAmej96XxcvLsvvj9+xuuVnsKrs/e0CvxRIjqnaN2hrXabAaFDd2yRA1MmP22NxEtI3FFuNyk723gZXhenvblPzeGIVQ/XiPdHhAU4gW7ojAi6pdUzHS+NCTut/19yY=
Received: from DS7PR03CA0293.namprd03.prod.outlook.com (2603:10b6:5:3ad::28)
 by DS7PR12MB8084.namprd12.prod.outlook.com (2603:10b6:8:ef::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.17; Fri, 10 Jul 2026 19:28:36 +0000
Received: from DS2PEPF000061C7.namprd02.prod.outlook.com
 (2603:10b6:5:3ad:cafe::a2) by DS7PR03CA0293.outlook.office365.com
 (2603:10b6:5:3ad::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.13 via Frontend Transport; Fri,
 10 Jul 2026 19:28:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF000061C7.mail.protection.outlook.com (10.167.23.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 19:28:36 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 14:28:35 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 10 Jul 2026 14:28:35 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v5 4/5] docs: rpmsg: add virtio config space details
Date: Fri, 10 Jul 2026 12:28:30 -0700
Message-ID: <20260710192831.3440427-5-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260710192831.3440427-1-tanmay.shah@amd.com>
References: <20260710192831.3440427-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C7:EE_|DS7PR12MB8084:EE_
X-MS-Office365-Filtering-Correlation-Id: 7deaa7db-f008-4b22-4526-08dedeb97056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|23010399003|36860700016|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	7/MiEJM8kk74nH6Wu1Xn/vobEj/XrbPV6HvCDBFuiN1dPWOMFp/xz2zzYhv30qZ8qA+oI3jqeQ2Pfq84ooSLku6OJmiMGm0BkhhAhD0JG44ynvf63U2mQ/kiF9/YNj/cbvt+iSzVFzCIuDcBgfis/E9vUx2k6H4Ge3TaO/3I94fBXO8Bp49hhQRm4+OZ/UuwM3in029XsztN9TvpNDhMO17d/S45zlJU8p/DZI3suLCBbERr+eTHnfHCbU+n/J2W/NrEfm8OEhS3dZqF5ORs+Uy+t6TMNLniq0m2WUj+pXW/PkWLxGRJH/1iiHIsxmxlmqFrCFebTDp0TENcsow1wE9M+dzKOzs6ZREARECGsghQ4ou453nlagpdRjj07Dbu6O+X1w+vj2nNzKPYe0xsoz3PQLlMlmk/kXIWpzWHsJvTgLGQW3S8CEk5ejTu7Ue8t3xyR9R63BO9jUryhu88xYzbr6tUy6MErrtGDgdGe06UBqRaTPZ8hO7WT5kg1fCK+igb42yWslkBugTLVRjJzzVYl7Dxq+qpToqlWxuIe1USoA+sLK3yiexA53qLGFsRYeVdIIbrBaBYBcRD88Fl7t8XXkGMHk1Q/UlaXGSEVICGAGjrTZ1EdFVxxpxVGymxAGTwDTA5JCatOfzICJedVrX1dhOe/wz6BA5AEN2ShUusWMRmmkc+mCVx6tSWuUVFwvHznMeA9dBgh05PaiwgWA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(23010399003)(36860700016)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ScLPNiaB96WhrADnDctZUJHUcNaufDETcWO/ALL1BAJmI46qhmBC9/Dy+VUX4Srx2ASvrCghF7PRwlKgUVzCQHvNde3O4l4d8sn2E+El3GFYkuE3GKKjqctakuNC2Tlqglq4x3agbFSRPHSkZzH88ZrCE072jkBQFc9Dx32WQcpcfu/YyJrx9MkBhbfklJ2C/plUM+M7i7PJV/R+y6oW6xhD3lkZSKTUwOmqJ4khTtKWJ97NMUH8S9SC+7v/7kCW/KrucZOQZIwrCX0ijHRtB9OVWnRiYPNZg+i9XWFFYOfHv9UiHQ6flLqaZLk1PQYQdIbqElvqBosIWdtOa4THSDmygzjCejRQrBhVM+8RriRib36OyCTLwNCAbpAvVd7JLETLMwRT4lZci63aiRMRvfKH/P1Bfv/gSs4F7UD3+s153MaGCcnl442HAg32ihF1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 19:28:36.7709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7deaa7db-f008-4b22-4526-08dedeb97056
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8084

The virtio config space can provide single rpmsg buffer size in each
direction. Document details of the configurable buffer size via virtio
config space.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
Changes in v5:
  - fix documentation of buffer alignment

 Documentation/staging/rpmsg.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/staging/rpmsg.rst b/Documentation/staging/rpmsg.rst
index 42bac1149d9d..abf9d20fafcf 100644
--- a/Documentation/staging/rpmsg.rst
+++ b/Documentation/staging/rpmsg.rst
@@ -300,3 +300,23 @@ by the bus, and can then start sending messages to the remote service.
 
 The plan is also to add static creation of rpmsg channels via the virtio
 config space, but it's not implemented yet.
+
+Configurable buffer sizes
+=========================
+
+By default each rpmsg buffer is 512 bytes, and the same size is used for both
+the receive and transmit directions. Remote processors that need a different
+size (for example a larger MTU, or different RX and TX sizes) can advertise it
+through the virtio device config space by setting the VIRTIO_RPMSG_F_BUFSZ
+feature bit.
+
+When this feature is negotiated, the driver reads struct virtio_rpmsg_config
+from the config space. This structure provides the size of a single buffer for
+each direction (TX and RX). It also provides alignment field to align single
+buffer which will help decide start address of the next buffer. The total
+buffer space will be divided between total aligned buffers of tx and rx.
+However, the MTU size of a single buffer is not equal to the aligned buffer
+size. The MTU size of a single buffer and aligned buffer size can be different.
+
+If the feature is not negotiated, the default 512-byte buffers are used for
+both directions.
-- 
2.34.1

