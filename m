Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012045.outbound.protection.outlook.com [40.107.209.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8619425776;
	Fri, 13 Feb 2026 00:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770941543; cv=fail; b=QA3YZx/S38lq+Rje4JjMCxkccRE1lgDx9qidplDkTFdmpRQdB9jHTg0hg4TJKFdG1qARAg0Zn0sasWCUd3i+tur0dViuziiVa05fCau9qOG+bTYYTFelxIWHW3EAuZrmRfSMFVWkeKQedri7je55YIYKyVbKMbj5914uMNkiqzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770941543; c=relaxed/simple;
	bh=TiCb1Dnol276VsJ8WYFw7an5TEl9iDbGqGvKozjRjTk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S91cEsajHZnATHbG8MR5F7matj6RlC03CNnZG/ZQDUsUyhqYqjQynasdvDVrKGhzo99xkZz3NScXhLk0BSjCpCSBELYFIeSnYhcL2YmyXmT2vwhxe9CQISbQI2zUDTdyw0PW4KSdx63q3BjJv/P0zJ5zchQ8lPfNZNKASCeSyFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cFX/Oe2+; arc=fail smtp.client-ip=40.107.209.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cFX/Oe2+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjviv9CaI2U64/afQQbbT9IHwqRotu8vtzQGKxCIpPUIghO3O9eJOOM4fA3TdbH+ZLYFjMs50WL2miLv0gA7Ypgeos9+sgIHjvazqwsgfSZEhVSIIOHSMYdcfLqTJZIVOlBNXyF+fnH81+VYIDNOHjPzlz3ZnQL+mcxZSkE4i8lFunFpBadPhJhpKkmuoMRvgN1AYEFRhVD154wNFeeAqqU5C0LIvjA6uF1Wn4ObhgMjN2x6I2fhoIs7yAQpy33fMs5tL5NONOBNv75jLe8EmLP4of5EiGppmBLSgN1b5gSGW7vGP/QCaVLu1aidd2pl6lIgAulngZPf2XtgHm9O/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdHFT1uE3OTsFNtfp6YAuZ2tkYGCrZDRnNCbO/y1JqY=;
 b=eAtYoXypOFvR9sMd3r6kH2+aoFsd9YarWF98pzdp1lCzAKkYSXRuWsKC+c1h4Bc4BUCOygIMyN+iei5lebcgl0tBO2ltQrgCcJwYpv4fS3VG6P7+32FPjHVL/0DySLuZ+o69yhtxmFCIANiEOezUYRIg9NzYoBY3Upn1DgR/3NHPI/hnh8MFHRlECbn51EHSQuzRfdUFxh+JfPhO8Y/Ul077zRzVmgIoDfqqowoi/hGCOFajQEWtVOk5S5qJGmGNl2qfBJ63gYmhHAnX969YLFylrmeCT9WjGZCdeRbaI0StjPN5jZBpGUsYPHruzbhksPrzOQ8U6axk2KFdiUyVUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdHFT1uE3OTsFNtfp6YAuZ2tkYGCrZDRnNCbO/y1JqY=;
 b=cFX/Oe2+3JornTPzA2AZ0TjLTlD9tNRGPGJgnNqodF83lK8BUt2av9yL1jjBcdF6OwiL4H0SXxF/fNtjZMPTeoCFuMhY35iVse1Fn6Z7BL3/iYDZk5m4o8dZzOBenBQrD3lhZ4oHOJ0gD2bSKj4mSpWCdIqcGw/pTjR1fDAZqgE=
Received: from BLAPR05CA0047.namprd05.prod.outlook.com (2603:10b6:208:335::28)
 by CY5PR10MB6239.namprd10.prod.outlook.com (2603:10b6:930:41::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.20; Fri, 13 Feb
 2026 00:12:18 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:335:cafe::2c) by BLAPR05CA0047.outlook.office365.com
 (2603:10b6:208:335::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.12 via Frontend Transport; Fri,
 13 Feb 2026 00:12:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 00:12:15 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 18:12:15 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 18:12:14 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 18:12:14 -0600
Received: from localhost ([10.249.48.175])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61D0CDJt3961981;
	Thu, 12 Feb 2026 18:12:13 -0600
From: Hari Nagalla <hnagalla@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>
CC: <vigneshr@ti.com>, <s-anna@ti.com>, <b-padhi@ti.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <kristo@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Hari Nagalla <hnagalla@ti.com>
Subject: [PATCH 2/4] arm64: dts: ti: k3-j722s-main: update compatible string for C7XV dsps
Date: Thu, 12 Feb 2026 18:11:49 -0600
Message-ID: <20260213001151.17370-3-hnagalla@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260213001151.17370-1-hnagalla@ti.com>
References: <20260213001151.17370-1-hnagalla@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|CY5PR10MB6239:EE_
X-MS-Office365-Filtering-Correlation-Id: 688ac93b-b8a9-4660-b6de-08de6a948b2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FJtYO03+wXczuLyHWcq4Fzh6ceOYSjfmU5SvfeLWIGyWmM/boHF/r7qTecu1?=
 =?us-ascii?Q?7M+1dYZNxX81npK7UJ1B+F4zhUQQS47oKTbIviwEKpZyyXyI6btnUeM0LtVn?=
 =?us-ascii?Q?4cPhZx51zPV5AGsSHFiatlk/F7A3Wr9kzVwM8HX65E2w7jawD32w6E/n7+lg?=
 =?us-ascii?Q?JShZXq8xUXsckL4gLNcqrsbP1YE+nKCogOFU1wZnGnjSwt9T4UthmDAoGE8Y?=
 =?us-ascii?Q?x5Bifel8umdam2y/GXdkJ0ssOZppg0l54nlD+irnMxh5XcCCz/Dd8Z/NeCQ0?=
 =?us-ascii?Q?zbwZrImiSyekjssFp543RerhwF7mD18AYuybYYEfOoALV1TxcI/J9tpoBLBr?=
 =?us-ascii?Q?w43hzlR+qz/lwqI9805ld4H3oFM3q9FUGQvfW+7mvKUjX6tvGT2gIwxhxx34?=
 =?us-ascii?Q?b0fLweoAimMEy4z/1o1eiVdB6QGxZB1yDe3DqpxDpzGEW8Nvx9n2pgFS3sNC?=
 =?us-ascii?Q?ccsR3XdjSNY1wXXGJ81a77LA7yp7QQAx2140HVZoOAVQKfZueZwDm7zRjuq3?=
 =?us-ascii?Q?icT1sXWd/4FSKDT7w/pwDYxYFPstdaZGZXpNs/5lZMNWreDbXZCgvi36lbLn?=
 =?us-ascii?Q?7WaJcBoOtQd2lpESb+2gf5mADQJwmQLIoX+x8cao8lqC9UIwiJwttYRFZJdS?=
 =?us-ascii?Q?6IzO0Bnpr1QqSOVhHF9q9T4oPKcLO4EEJ/J4Ki5KdSe5uBz+ycFbBqYkEW3j?=
 =?us-ascii?Q?ghkXcdVoDOLwhr3wQFYcUTAssrGBFFS8yzac8UOrROpcop2RITMmSLQplcGh?=
 =?us-ascii?Q?ssIRzNpmC9FpteAZP9DU0NpTUlXwo3EPKojqY7GuSd14al9O0+SuTcFA6BKc?=
 =?us-ascii?Q?lPs8v4Ri3CEq0HbcwOfEXrSul9ofewwMEUVRbNREeAjmnSKjIk80fzNbPJHb?=
 =?us-ascii?Q?6eB/Fe0WbB+u2cPBZ8wApz4fc5Tk29NTzaqVe8nka/lOJ2U+TdSV8rOAm9Iz?=
 =?us-ascii?Q?yaqwwjovNxkHdlgspEReHIdbkpKvIYfZYKfTfT1Ldg94mQrY0YZGgzRtzNu9?=
 =?us-ascii?Q?jt+Y9D7URgPNBUUhbcKH73gA34V8oVz7t6EhsDmutuenSuwVkrZk/hc4K3Ro?=
 =?us-ascii?Q?uuAWwBD8ey/DIELTB53gNMu6kNLfJ/Hcg0aa+u6LBCcBFOrl6bfRiWl6X3CK?=
 =?us-ascii?Q?t8P+xre0Zwc0+KHHcns18wbN7PZeowYPSfgelWJ+HUinffBAfPdI5gMVOqXb?=
 =?us-ascii?Q?Ob4jNEq078TKx+KdXY00VHJF2TV6hactBHuVc9wKQvJeGzV2D57OA/aSVBRb?=
 =?us-ascii?Q?5/NMQozN9DQYO3EgzVhXkAU7kgLdTVD5B1GWkVNCnUCN9EKhQrQ0s+hwu7+g?=
 =?us-ascii?Q?YTJ5jFt9+igXsROpB5ev7vdJ7lrOmWAmpl3tI/MXvcr8f/F5S9C9QQSxyB/Z?=
 =?us-ascii?Q?4hzle4Odr1p3SgmwuO7GWmmcrXRrHQ0g25QiqjPUotTay092EjC2+Y1K+iQY?=
 =?us-ascii?Q?kwPb8N7M4Pe7EGjKj4HK6kdXttEjFiHH6IPatHq0txvB54jGIRZP9dOzM+3c?=
 =?us-ascii?Q?yPU/0kyEL3NmLluPaJc1VZZROPkGnBsXwocF0jRjnUavSF7RF6zAFws/ev5b?=
 =?us-ascii?Q?1y7FjP88zWSzkRWf1uTAVPBppxU8IYDKJUgV4GqtRXjQAJ4IP942/Bn/yYCQ?=
 =?us-ascii?Q?TdUHSG3VIayazr2q4MfNKfF5cmBhFV2fCEVX0LkutljvMbsQitO+4gDGIPZv?=
 =?us-ascii?Q?662WDA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3zo1dE1Q6g29iJn7hi/G96B0DEIaL8tcn+vdBEEsgdhrNPYpC4qANiHeBTrSESixAN3wX7AHaCJx6pA7VgSclfKx+WCOsmW+A/yi/7NU/u8uT3+DEt1QVjlqiAX9a8RqIZk/dHuUDl1umgEN1vpM9OcCbj7NNR931KcNViuf6OUvC0mfBkW7H1KdPxYtuU1zP14Tjn8fd3MmfUZCIW5sG4lN0AeHZ84lC7a+Qe/PcGvx8GZ4LN3qUWBJkw/OoMbpOPqckP39RWUjmFY4PB27RJ7rN7L/JRh+YUIcwfdhf7v6KDHQ6+8AekK9liUiwYI+yhoqJUjmSX+QTgOHNCTB2ZRFkhGNjxqRvybyjZxI8NhFW0OEpccAtZFZA7woURHmAVrEV063ygemNOuS3Du6CWn3rR29G3IWuu1Md6uTnsgSncLvAFTq0Ei6PmLQKzof
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 00:12:15.4684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 688ac93b-b8a9-4660-b6de-08de6a948b2d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6239

update the compatible string for C7XV deep learning DSP core in J722S.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index 9ee5d0c8ffd1..0a746ede01dd 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -373,7 +373,7 @@ main_r5fss0_core0: r5f@78400000 {
 	};
 
 	c7x_0: dsp@7e000000 {
-		compatible = "ti,am62a-c7xv-dsp";
+		compatible = "ti,j722s-c7xv-dsp";
 		reg = <0x00 0x7e000000 0x00 0x00200000>;
 		reg-names = "l2sram";
 		resets = <&k3_reset 208 1>;
@@ -385,7 +385,7 @@ c7x_0: dsp@7e000000 {
 	};
 
 	c7x_1: dsp@7e200000 {
-		compatible = "ti,am62a-c7xv-dsp";
+		compatible = "ti,j722s-c7xv-dsp";
 		reg = <0x00 0x7e200000 0x00 0x00200000>;
 		reg-names = "l2sram";
 		resets = <&k3_reset 268 1>;
-- 
2.34.1

