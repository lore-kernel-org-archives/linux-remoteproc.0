Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010043.outbound.protection.outlook.com [52.101.46.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EC22D979F;
	Tue,  6 Jan 2026 10:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767696495; cv=fail; b=uZDZ05fsMHJu4xQTSRNxNpkzS4X+tjBB3sb3CYN5rHx/nAFfZfaaLDZnYmUqjtfw7B9Y44rMOC3nbLtYIeEUxOaA90iPNoo03OPUlYb1pLV/UKr1mSj6GZBS1Vhb3GJOHZPdUvC5BSL0jUYtcVEbQt35QZgz7JbPShxOozCaltU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767696495; c=relaxed/simple;
	bh=VYAV8qGZan+pOqHFBEU/ewVZ3IAu4z8a2SfPO6R4WrY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DCmZnVtNP04hsWfZG5M36sbZEsmAxajrAe4qpwvEux730vVQBW72bUcRV8uGG5zcty2c1btfixL/qO0lwDtNuju79WnGkGPDGuw1frwCpTy4Iu7FugwBtSw7mUrc0OgXszD0CkKqsPOohzNRFX0UbZxnKrOblNMhQUwgUoe2gT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lGT2ekdF; arc=fail smtp.client-ip=52.101.46.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lGT2ekdF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S91g9Sd/oW8qnw8y+8R2pR1fwedVU2eBIKVSVTYvcjdxZsLB+cGpPAEQ7zDE0QFWcaJ2OT9BanMbz1fHEwzg2HP/qIlclSwYDgTnArfYv24aq107S5Vuc6dUog2tSaakDkvwALkqfbKlNz9ecWsE3NMIFVnskQURKUdLI9p6nVy/SuhJyJO924QJ//HeK4r0J7jOlZGM0EvKcyRaPmvjo4LZe6JRFAf46pA7ensqEPKbZhby5s5O/qgm+keTXUb/C71YInTgEbtjsRI2Xtz74wxAXmJkmgvwCJAHO/Q7tbdI1BE8D2LngkdaKy2Hc5TgtTZVf4uibRKD0K0gg2Qu1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bnYmSqSZuCDudUTR6wqqqBS2Gd1Q76SLTpQDnd6PY+I=;
 b=W5772hj1zRkkHUlGLSQqnvu4g1l6YKIlWAZRGmTEQpnhgUAvfbTrrkNtrqwPfadkaiRtYbnj6wI4XOYOer9CaPiMf5TOZh5PnnmxgbDSKv+XomP4cIl8UZT3ViJuf4VoLCN4hWFpmoVOckgxQIZQgIGEz/EvOlzsdxqGjx0ClVr6g0bwmstcovDPQiK7Azn5BbJ2V/yo3d+G+B/etUaUdyzO8VL3woO86KtrE0iYuTYJBrmi4ElUPWBx3iMZ08+uZY5O+9DoNI3v75MQ77BEiIAnUcZetgdKQLVTDBRlYwlQPyvjJPj3Jj/ddvRERqNiJcGXLL551lF8lcpjPTsvLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnYmSqSZuCDudUTR6wqqqBS2Gd1Q76SLTpQDnd6PY+I=;
 b=lGT2ekdFXCdWm2eYLBjqptcuXS9WMHqjIQb6MCtWRVWwWJO2jUIoHolptxQx+yxF19El/vJaz8GpvAISlbmY2ksuNtiUHdI57Gsle86lH6BMSBDUKqBIl3giZ5jdhzgHhzAck/9d4X1O5q8vy8VxK8um8QVFlEOIeU6kE4ZL+JQ=
Received: from MN2PR04CA0031.namprd04.prod.outlook.com (2603:10b6:208:d4::44)
 by SA1PR10MB7588.namprd10.prod.outlook.com (2603:10b6:806:376::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 10:48:10 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:208:d4:cafe::6e) by MN2PR04CA0031.outlook.office365.com
 (2603:10b6:208:d4::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 10:48:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 10:48:07 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 04:48:01 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 04:48:00 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 04:48:00 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 606AluwY2890257;
	Tue, 6 Jan 2026 04:47:56 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
	<kristo@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <b-padhi@ti.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 0/3] Add TI K3 HSM M4F nodes in device-tree
Date: Tue, 6 Jan 2026 16:17:52 +0530
Message-ID: <20260106104755.948086-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|SA1PR10MB7588:EE_
X-MS-Office365-Filtering-Correlation-Id: e7f5f8d1-d191-453c-a377-08de4d111408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Tf3pr+tGrJ1uhsFOtU1wEmyab49Fopb7gY9nhrkwuY0z63igqjvRs1b/WCFM?=
 =?us-ascii?Q?kHSqzveODomlfHG7VlXdp2asOiMJtAmTP50ins6TFb3O233rF7IELX1elaYn?=
 =?us-ascii?Q?dGwk9tmSxLb9X91YTK4zNNaRm/iq6dYhdgZYx3Xak4urXyvF/A6Qh25bqoUb?=
 =?us-ascii?Q?soUprF/yc+iPkbeaobmwqWNrWyaQGfJLVgVkMwzc47wNg9jaZoCdC4aP71Hu?=
 =?us-ascii?Q?lWL0JW7Leld3GcQbCNaVNS5ieVwK0pnklhA/jRqfoMtwdXNoRLdudB48B67S?=
 =?us-ascii?Q?j6+rpsAIVw9FtzEjEz84OAJ/cj57/e1+EranSLxpVwynG8Qs2Xjfa2338i3R?=
 =?us-ascii?Q?f7T4/HH/hwGJNuhAzJZtP9CeE8VcKiqWtCWscYpkIlbdTtLjboSUxhrgz+rG?=
 =?us-ascii?Q?RomyXPl0g5OVjLQhOjU/1XTImtK/TlexmtxhtUPATcFZobximIAKzLHXiuAN?=
 =?us-ascii?Q?FBC8FF9POQJ83akud/di9nG1jhIt37kTwErVoEXPjiLYbN+Jl4sWE5pZHLZx?=
 =?us-ascii?Q?8qx+If2OVYJp0PvjpPxz4YjTm486leU9UotXmTcQaRFQ1CMXETZQYFkrDF0L?=
 =?us-ascii?Q?19yN0zGNcTXSy+buoBdZiGSGGJymQdy9bhoXErKNO5owxzK60uBdBYRWtM/3?=
 =?us-ascii?Q?OMdy/shY0AnmLUpeMIgBtn4HVIlZ14mUnkNfQ1NvPVK0Rf9TjMmzuPoMFgiC?=
 =?us-ascii?Q?i4GXltBwYuafJw4ZGBKiN/h4+EwBmi4RdLaC0fGF3lbNrEnke37dxlxaZmFx?=
 =?us-ascii?Q?8FNXAcMZk5NXK5lpt4dLdPn+88IBu7kv9o0FaZahCFRdL6SPg3CI0erN2BRK?=
 =?us-ascii?Q?BeIgpwJtoiCCOvQS6xKIaXkkE2N4lu6uuOBfrRAq8RNTAQJFrSCGlkKwojDv?=
 =?us-ascii?Q?vC9Z6e2dBV5j9yj8Mhb5w4rBuPDfsBShThl28Pf8k+Gy2NaE1nhUgoECWIyy?=
 =?us-ascii?Q?2hSWLmYJD4rxRyFz3HVdGE8wu0uvA8xauCvs7vTs5iejefqnXXsFmmQNwAH6?=
 =?us-ascii?Q?R313pKFK+5+PPpF2CsDl37shu7W0iRlGVHKDLVREjwN3SK7DRQIRRoTpqGJe?=
 =?us-ascii?Q?v+QGtfAyiHfQ9dLZYrRCSu0mQKtjGEqxCJgv6bWfTtf42jI9Qc7jpQ6Sywyi?=
 =?us-ascii?Q?+YzJYdY7pltTzGhBB8e3KBQu0rfAyAMDPUDFn5ijbALcA6mGJ4mchTe00tKm?=
 =?us-ascii?Q?VJv+p8fJ5kFBYL7yxX835V5r2oxvt2LXPr7hLlOANGOCGtvb6vtv76cW/FmI?=
 =?us-ascii?Q?D0UZp1vlICCosNZYIIOQCQz5kDuQMWKiIxujD9q4t+0i0GL0PkNNypAYGyci?=
 =?us-ascii?Q?010xjAzWKmqk0ah9MR5O+zXt5yRINyH9uimnx2/4bVVtj3FDk7m2N3g6oYwC?=
 =?us-ascii?Q?isOYpLQGN6uRI2EJMS7y5/SK9ueuAlDa6ULJrMxdBikBtFt15iF861rTUfIl?=
 =?us-ascii?Q?/IzV+zvHUjo7oQlj/Ux68k7eFnysDuYVG2XZMrR2l5GfvBtPjzxAJMUcH+7Q?=
 =?us-ascii?Q?ZyxqCvTRo9eV+j3e1cFQZQZ8rvMK+jm9hJ+LdjoDUFFYKjqXo2cwBe3fLX2m?=
 =?us-ascii?Q?T0KreOdk30uX6y0O7JBEat7Z1iYHuZ5YZbo/gOBF?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 10:48:07.7913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f5f8d1-d191-453c-a377-08de4d111408
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7588

Some of the TI K3 family of SoCs (like J721S2, J784S4, J722S) have a
HSM (High Security Module) M4F core in the Wakeup Voltage Domain which
could be used to run secure services like Authentication. Add the device
tree bindings and device-tree node definitions for this HSM M4F core.

The HSM M4 core is typically booted early from the bootloader and the
driver for the same is posted in U-Boot mailing list[0].

v2: Changelog:
[Krzysztof Kozlowski]:
 In [PATCH v2 1/3]
 1. Update commit msg to remove redundant "bindings".
 2. Update filename to match compatible.
 3. Remove "address-cells" & "size-cells" property. These belong to the
    device's parent node.
 4. Drop description from firmware-name property.
 5. Fix indentation for DT example.

Link to v1:
https://lore.kernel.org/all/20251231165102.950644-1-b-padhi@ti.com/

[0]: https://lore.kernel.org/all/20251231173621.1069988-1-b-padhi@ti.com/

Beleswar Padhi (3):
  dt-bindings: remoteproc: Add HSM M4F core on TI K3 SoCs
  arm64: dts: ti: k3-{j784s4-j742s2/j721s2}-mcu-wakeup: Add HSM M4F node
  arm64: dts: ti: k3-am62p-j722s-common-main: Add HSM M4F node

 .../bindings/remoteproc/ti,hsm-m4fss.yaml     | 72 +++++++++++++++++++
 .../dts/ti/k3-am62p-j722s-common-main.dtsi    | 15 ++++
 arch/arm64/boot/dts/ti/k3-am62p.dtsi          |  1 +
 .../boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi     | 15 ++++
 arch/arm64/boot/dts/ti/k3-j722s.dtsi          |  1 +
 .../k3-j784s4-j742s2-mcu-wakeup-common.dtsi   | 15 ++++
 6 files changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,hsm-m4fss.yaml

-- 
2.34.1

