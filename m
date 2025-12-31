Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013016.outbound.protection.outlook.com [40.93.196.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D1B22D4DD;
	Wed, 31 Dec 2025 16:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767199880; cv=fail; b=Q+nmpA1oN3iuVsH5IUCnFgjmAywAfENi5AKT7QtKv1/YGA30Q2nqklbCb7gPWU9lBI+bQ9I+tRC/3cCOIR0kVwuHFuFDlAHwBDAbjqX2YMcpSFLXus+6e9CEBbKTJXaHEY72E2oMBhKbw1hDJcXESQL0ymOZdRfDfxDv4xHXq/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767199880; c=relaxed/simple;
	bh=pGaV6aGyorQi9x9dJoqa5lua9uJrH3cINDaijSi2A8o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LuelBLyNb1KPhoiLzvAB9mAt0n3+k2e2OwObSHSSkh/xBVr1P6mmzthuRO8QzsGqGQhRwCmVsm173Yxg5P2PQUJq/fnlc3/tr99AxOaAy7hxhG/jaQ5MjvsGttxgvnm4YG0NnAaDBPJprUnY4C1/dZjuzDH2k4LHjoOIAqsahv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=XJ9v83ef; arc=fail smtp.client-ip=40.93.196.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XJ9v83ef"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5z7qx1vQp20E5G6hekJOEz/QIBE1lzOj90eeP7aG1IRuott6agOyvFLlMQ1QZofm3Rw2IyMXhJhbuGQmAfBcU3n4uGcQ/uIhAat81m571X10xBEvX3hJaP8LobJjzyGdF71eSNruVRwHiRFsdZS44nwsMn9NSSpY0ILdnjl1UcwCfRlWmt9jmc7ssabEOcl0EVUSCmlTffUq2h02zJZEUo9MQm2KO06ZSDxx4Itqnq0U3737tA/l9ef50/TINsLe2iWG89OBhHRqq3aXUaO2vBUmoLW36fhs/4/a+civ83BcMQlppZNeFO4n1tqB4P8jg1uM+pMAwBmv/OLTrBYcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20jzS7aZT8r8hud6Je7w7twKng4p6paLgdoWi+mGDHo=;
 b=nFjZ8IHi9tU344+9dV2otMppkZVNYrTtiuYdvtN24lOLkODc4GU1mG0cQ87iUQfrE7SnSJFRtfebkn4lZhICJKy/rKHGRP1qqK2SyIzczRlVXzddf3wQkqTAwnXT83ZI8frpewLs55er4NEbsA20qwivd6y/4uuP+5HSECvHWUUdeAm1NiDBDdx0ES+XwSmuc+xMxiyZDWRm+vab8A9Zbu72SzJ3sp90KNYoDFTRTqJwhpZImwJfFECJoUVdmh+SqrOJTjuicd7J1pOs3c+JcmuoRC6ztgR6Zr0rchdUzu+Lex48dvpNY4ga4pmpUvaTFT31jG1zIVo+ohe4ObnnxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20jzS7aZT8r8hud6Je7w7twKng4p6paLgdoWi+mGDHo=;
 b=XJ9v83ef5SQ1toRCyunc9LWkEwQeUkK+p7d81EYL5aFKHkBfna9ATxG2zBq/X4APOt6cw9RPA1goEkBfcrhq3eO2Ka6VMD+nb6RvxljbeMJ54dXZ0NXjx7brVemjxyX6PdhB6dZItDqZ7Z52E/o8FIG9vDP/fL9BiHLzqHwdDuM=
Received: from BLAPR05CA0041.namprd05.prod.outlook.com (2603:10b6:208:335::24)
 by MW4PR10MB6653.namprd10.prod.outlook.com (2603:10b6:303:22e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 16:51:14 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:335:cafe::6b) by BLAPR05CA0041.outlook.office365.com
 (2603:10b6:208:335::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 16:51:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Wed, 31 Dec 2025 16:51:12 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 31 Dec
 2025 10:51:08 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 31 Dec
 2025 10:51:07 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 31 Dec 2025 10:51:07 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BVGp3Zj2583331;
	Wed, 31 Dec 2025 10:51:04 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
	<kristo@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <b-padhi@ti.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 0/3] Add TI K3 HSM M4F nodes in device-tree
Date: Wed, 31 Dec 2025 22:20:59 +0530
Message-ID: <20251231165102.950644-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|MW4PR10MB6653:EE_
X-MS-Office365-Filtering-Correlation-Id: b9d0d0ba-bf4d-47b8-1576-08de488ccdf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lNog/m/6kAuYbMlSHuWj/bMVB8qv3Lz3100t+U+9zLgTF03S1G+oL1yb2oaj?=
 =?us-ascii?Q?UeZKt1ScQJjEIVbJIbzMZWYxffJjNJ4iyIVDg7Ka0updA4wvf9OnCIaKDJmv?=
 =?us-ascii?Q?kdpTocLNteBkpJ+zXLlGnx34uz5Y27UiLQYmTbmkTSTatygykhGMZYFn9gkG?=
 =?us-ascii?Q?wq0nWemivd7hezDPnkuHJCBkwByLKZVVg/NeuNia5Afkureu0fWYqRL6tlmc?=
 =?us-ascii?Q?D6FLf99arfbmJyMdL2AS6sFrRea7PnIFKHxUa4q41DaxgBoo+Ud//n2/bieF?=
 =?us-ascii?Q?vhhZQNdHEg13xl69o/srboz7gqfQe9JEyL7UNcno18Hpb0s2cD4waDHeR0FR?=
 =?us-ascii?Q?owXWNVGb0ayu/CihDalXcVtbU4MJUxfmIHYt8SvhJ5fckg/wxByrlME02LTv?=
 =?us-ascii?Q?5G2ceokt4M0yVkpr0IkBP21FIf9JQheZ7angrolhZ3BbqfClpuEfJoUfBPEq?=
 =?us-ascii?Q?gB5D6gGTOZW2v2op+XMI99Fsj9X2iW5+Md/DQT+9lHQv2qCZNt5xYga2/7wL?=
 =?us-ascii?Q?YsltDG5SWxhMFG3QnGq73HTNaPu1UFWZNRhJlAGcD2OMSiX8gPD/B3xXeA+w?=
 =?us-ascii?Q?bjCBvBVpM5ZqZoH+ZmfQwICXJkGgsFxli/epizBFLVMjzA4CV/IZ4zH2t96A?=
 =?us-ascii?Q?PMdPpmMf/1drpIDv/PzMQAlB0VAwtxeIG1l7Oc7tzuN2kDsmCE0ixZO3avZH?=
 =?us-ascii?Q?JjK4b1IzFU8l9BPqyKpPa691M3+54q+BdpxjwcA20PSDP5T8hWHnuVLsKTTg?=
 =?us-ascii?Q?vGhw0mKGd1xwj9C3BhQnNnJz7dk/9H/R5x6COkM3NEV/1TeH0eL7QLYBJDW4?=
 =?us-ascii?Q?YWH9WB3P4mvJTtzGjzXmHEpbuUfk1iZbwtQGu/35stftSVsKW6n3Busl6kzF?=
 =?us-ascii?Q?1IwKyctZoO6m3slfJjl5QX3AE40KP0cJbPcce05sjiNUrn9frngDRjzWVEwh?=
 =?us-ascii?Q?0f6uOzmL8LY5Wl/HnZcqBloM6i0h2Ysub4h6loeYjt1Xn8w5RoDtRoDrY5QV?=
 =?us-ascii?Q?0AUgf33OHzes/GGvNHQ0Aq49IOBNHisAqoPHwqWpzQrCZ/4pcFsGjGPYEn5c?=
 =?us-ascii?Q?pmMPEoTfcFKLtXDbFjT+Ehqa+u/YvoUuzQ6p96F0lYVoIXBNYs6f2TBBm/dH?=
 =?us-ascii?Q?L7M7RLwrDYy9gtt4CkfqdvPsfi4IQXWnHR9j94JbEH3ZC9JPmNU/syrJreWK?=
 =?us-ascii?Q?2+PVkUKZDm92AeXNltyZ7s0k7xl+6xnzqcp/lb+NUifhVOYguZTMB3Vi6212?=
 =?us-ascii?Q?H3TafErnnb5nx4m/xo6JaKQ0YuR9vSUWq9hqoLkcAs0ZxQ4bv5KBnYOWYKvK?=
 =?us-ascii?Q?O3ky34xCewHaxLHG2IwdifmY6o9AFh5/+0ZqLfBkNLgwtJlV16SuR2tb7fEI?=
 =?us-ascii?Q?rg1+fRopCD7G7hzmma0Xr/ebFrwMsLTzpwKPjRipJ5x669U327YRI76Crxm8?=
 =?us-ascii?Q?bqj56/mK0skH6RVO0Df6zZIxYvYA+aOT4yMFnABwnWb6T7EbFwVQOX7XQGXf?=
 =?us-ascii?Q?NBu0KKLv+IUOG61QdmfsMe6uqvp4jHsd3CJ0tnKAKpCXiCthHEZ87ct+YTJ8?=
 =?us-ascii?Q?+9J/cpoy1dYQyWPTMX4=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 16:51:12.0159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d0d0ba-bf4d-47b8-1576-08de488ccdf8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6653

Some of the TI K3 family of SoCs (like J721S2, J784S4, J722S) have a
HSM (High Security Module) M4F core in the Wakeup Voltage Domain which
could be used to run secure services like Authentication. Add the device
tree bindings and device-tree node definitions for this HSM M4F core.

The HSM M4 core is typically booted early from the bootloader and the
driver for the same will be posted shortly.

Beleswar Padhi (3):
  dt-bindings: remoteproc: Add bindings for HSM core on TI K3 SoCs
  arm64: dts: ti: k3-{j784s4-j742s2/j721s2}-mcu-wakeup: Add HSM M4F node
  arm64: dts: ti: k3-am62p-j722s-common-main: Add HSM M4F node

 .../bindings/remoteproc/ti,k3-hsm-rproc.yaml  | 79 +++++++++++++++++++
 .../dts/ti/k3-am62p-j722s-common-main.dtsi    | 15 ++++
 arch/arm64/boot/dts/ti/k3-am62p.dtsi          |  1 +
 .../boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi     | 15 ++++
 arch/arm64/boot/dts/ti/k3-j722s.dtsi          |  1 +
 .../k3-j784s4-j742s2-mcu-wakeup-common.dtsi   | 15 ++++
 6 files changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,k3-hsm-rproc.yaml

-- 
2.34.1

