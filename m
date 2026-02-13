Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012027.outbound.protection.outlook.com [52.101.48.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63AC286A9;
	Fri, 13 Feb 2026 00:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770941535; cv=fail; b=Y6sAXwWpuD6DC1y8Ep3TEL8bYIoK1HBMJRqaMrZTm1dBKrXL+3U3LyNKgq+/h+/3GFhARaeHSepADtu+v3pE/oPTNAaUafrHVKbJ/ODt9D/P7B152cZPhplwZiWrlClBkU0wTC87lOaSaGNS0eHGdJ1J6g8c/QmUqfLFahRPXlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770941535; c=relaxed/simple;
	bh=2N+r1E0ls4J3FHB2ZWNVT5q0XKMMYmvGZjmgI36JDoY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mbUvqrwg6GmhEIfPKHTLzZM/xyfDSQWZ7Ih1ppPHWA+4mU2W0JNmPZfxg1HmfMoDQjVmtOhPGqMT5ChHHRW8HFVLgIJFfcd2ufG5h0OvHJ7fwS2nIKSd2ecTAJkWEGF46s7ISeEl29qHcfhujg+/7jXcTfzcGFvN5I53d3wOYOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=e2StyUWf; arc=fail smtp.client-ip=52.101.48.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="e2StyUWf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGSDGDI3hTaRPd8OwGyL0BVUz43KUH0Vm98gFrwX6Oy1ZFEGPhbyuP+IHpWYWA5hxjESq453E6YhJe7W4mrPX3raLjmqnoHUJzmyYC0+2sdBBbyaaHR0tfh4o6rcqwq77ABB6UpkmalmeBD1AopoIV6KwoUbbrpnFRPUjlK286Y8hiKyRB08qEtb0iy+znftXlznyV6oWUufKVQz6J5kaj+34VeRTgFxw72yrnpBX8M5KzuoeQ1c+aUtie5ngVZP+6n+5UXSSdlKrTSmbtCVLA0hNXcw5jyHieaZNBtfDW2nTyM/hUfisim8X4XuBtRqR4NpxExJBskNChGCpksEUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7RLrY+6f1tADVcggWZtiUJWeSouJUnwzfZ2+QjIChk=;
 b=jKmMDCMISgLJ/5OK9dg/spkhVGc1X1QQdqPbL6+NjbSYdI4orpZNRPOWIIN1z2RZCzXizZB74Gq7Dkom7rgXWo+XsXC3Z8PhQslCO9VFUW2V42Xijq0qNgChv86mN8fgMXO8I8K4eqtmbbj/fmeMLMYeEEcmKSTkERWJYpL4xqgwCMqa/ADMQoIbHCzd21M4Z8+GAsACF5VttECTxlNZnElblTFNHgoVxysVdm4FXje56EmJsoyHHDtPu9Cwxmeyi4rKuN8ZCLautqJhopE7HKxXss2vzj80GuhpWdN2sJsocBkpGJbSiQvOpau96mEuimKgqpyYBkmlUmn54Cb9ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7RLrY+6f1tADVcggWZtiUJWeSouJUnwzfZ2+QjIChk=;
 b=e2StyUWfm1ubRGVrtSvf4udlBPTQsqFNWNso5zbMDf7mn4FN1ZeE1IctyVJfbWPMuSxxeyucwOefYi0+7J0fPB67t2Na6rfnXb9KQ0fQOx05k54TVgkqIGA0HQGXRRUyZh+eVsv1CfVl7+jmG/1wew3rfXu4XZLYAyGA6BXv7/I=
Received: from PH8PR07CA0006.namprd07.prod.outlook.com (2603:10b6:510:2cd::7)
 by DS4PPFEE36F3C1F.namprd10.prod.outlook.com (2603:10b6:f:fc00::d56) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 00:12:12 +0000
Received: from MW1PEPF00016159.namprd21.prod.outlook.com
 (2603:10b6:510:2cd:cafe::ba) by PH8PR07CA0006.outlook.office365.com
 (2603:10b6:510:2cd::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.12 via Frontend Transport; Fri,
 13 Feb 2026 00:12:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MW1PEPF00016159.mail.protection.outlook.com (10.167.249.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.0 via Frontend Transport; Fri, 13 Feb 2026 00:12:09 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 18:12:09 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 18:12:09 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 18:12:08 -0600
Received: from localhost ([10.249.48.175])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61D0C8kk3961765;
	Thu, 12 Feb 2026 18:12:08 -0600
From: Hari Nagalla <hnagalla@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>
CC: <vigneshr@ti.com>, <s-anna@ti.com>, <b-padhi@ti.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <kristo@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Hari Nagalla <hnagalla@ti.com>
Subject: [PATCH 0/4] Fix AM62A/J722S C7XV DSP reset variation.
Date: Thu, 12 Feb 2026 18:11:47 -0600
Message-ID: <20260213001151.17370-1-hnagalla@ti.com>
X-Mailer: git-send-email 2.17.1
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
X-MS-TrafficTypeDiagnostic: MW1PEPF00016159:EE_|DS4PPFEE36F3C1F:EE_
X-MS-Office365-Filtering-Correlation-Id: d8793340-e92a-4630-ea83-08de6a9487c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rZ+1EpBKHSbIqTRqLoG8ANV/LBx8gSqdyHfu2cUMFuirMGPjjy+Zf9PHY1Xg?=
 =?us-ascii?Q?1SDWjuTXR8tqS0C1XmyFnwqYjtE3Z0/RDnk8Dw/qecEcxiR39X3TVXTK9zZz?=
 =?us-ascii?Q?+umUVA2VJ651ClyIHkLotCXkubGAKSF16WtMp0E5jfhhqBrO2W10ZIa6vs8J?=
 =?us-ascii?Q?koSmJmkA9SaOusAUx6dWs9G23FKkj7smEQwty/4rtnAhxRrlYpW/6wcDotAu?=
 =?us-ascii?Q?B6nUVwBa2SLWKfm34gW0E4qUeXKGPsNW3BDQs8G9cHYD+cC7qYgWkwRzT/Im?=
 =?us-ascii?Q?Y77srD8qjrUj0q3lX08ii9NIQN2BUEXL0Mjkxf664Z3yt5jVvW620ceisvE0?=
 =?us-ascii?Q?LnmxzBHJdmo4D4Go12fXL344e5HY0tPhgjFd/icK8U40iNEk783CxIutlwPO?=
 =?us-ascii?Q?8QP/H7O4QFtfW4cUEz+LmdvcZo5S6KdJCeJzmVnFiIBXo6AgJBrhxP1xsSut?=
 =?us-ascii?Q?N50k3Ia6fDZ7cdloGQzlbt6sK60tlXx5C1wAfebotlu7ulB7hWXQ3JhSbwuE?=
 =?us-ascii?Q?gssq8gUNqylUniECQB8NB0GThx997QErf28pFXlRv/WyLlYHrF5RJrYZ/Bdc?=
 =?us-ascii?Q?TLn3QmHw+TfT2EDdvVt0T93VAU2OXgl2ESHXEF4YZqEi0m6usgaXAKeeWUqd?=
 =?us-ascii?Q?NId/ShPO+XhPVViioLu8nHrXTV+DfKQX+A5y4Pc8a1MQKcZqe8DwS6B9G8XQ?=
 =?us-ascii?Q?8uuDU1pm8UpFns/r044cX4EyVhICTV8tssldNgJtCywJHa7AULsGZU8NNZy9?=
 =?us-ascii?Q?V4xDQ/2UaSZ6xEKw3+QRpmJL+UYBZ23MATxFFHY954oBI6S5yDlOQWA1+o/4?=
 =?us-ascii?Q?7YCi9ML0yiuJh2P8mmDmu7J0Rt6Fb3yDh+gnIzZGGeA0++gz0wmyRyCXbhwa?=
 =?us-ascii?Q?LkOzk7RT6iAKenjiRtESphtq12JcZZ4a0B5Dgyi6X0VMb+Z+qvo5JmtWfhOs?=
 =?us-ascii?Q?6Qp2P8e7dn2SclQRuqncDiy9WuQSEFOmMTh0j6g2FuRj2JvW4VrX2xQt8Qoc?=
 =?us-ascii?Q?9QmqeCbxEE6Bo7zP8+Qhah/mTAFIlsQVFYRGhQDrh1ovlv2ZGH1yGxxddJLm?=
 =?us-ascii?Q?C5kgYb/f0bAM0UAG6v7o2y5L4oFDlY/tqvu03kX4VhVMcyHleeEToFFwxArs?=
 =?us-ascii?Q?rHNBMyQ/enSfjl7I1b+lbFv1KFN9nMkvwOE0oF4TLOi3f0b/hZHUuIFHk6vB?=
 =?us-ascii?Q?5thy0uofBTZ8964E4drqWZyISce9EaOqiP74QyZJulSCQrS94WLdywydZZex?=
 =?us-ascii?Q?pcVMG+WBCA7gdfQ3dNaBU2maCxby8UvyyESxrXRixBE+N/PtTTMe0/iEpnxW?=
 =?us-ascii?Q?MrbLGm/35Nu1k0tPWYELo1mgKudF4m43jLh3Ovq9iJN2egDh4DjNcVbO5kfq?=
 =?us-ascii?Q?0nFOLuMvZ63HebJQ+qI5y1IQqhn+e4qHcLfxsOQdR7oRVSqHxFqSFehrrC9t?=
 =?us-ascii?Q?u2Yb7KyCtrdkTLFQ5O+RoHasX99Wn0CB7uPs5pBS37NYDizXnquCIa3BIfXt?=
 =?us-ascii?Q?rkJCQau9jzqjt3ICAdunFLzCOgV0KRQLce6Ckj4NTeIHaAVhCVzt9SEIdVVS?=
 =?us-ascii?Q?nDexBame5JssAAqDmN2l7A++EJQQQE73ZStWvwSDtD+8EhTxP/2xyIedfs67?=
 =?us-ascii?Q?4mDX/KyAe0ximetcHQ2Eq5pV2O/EpWFq3u5GbD+Vhdl2Udd9uAaHSiqclE8P?=
 =?us-ascii?Q?/VHnFg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OM7J54Y9XtIQEDMWl2Vk6ooCNGmAhq8txxVr+7l0QFsIMXgWXZKKzIi2DUJsEg4wnTAs6gFzaWdtiHlcgStlzuF2hJu6kxmqwMt4tQkPX+mxe46WM6W4b+so6WU/+25NbzO/t2ZHsUj5tTbdkwpqjO1BPDtcErykTBsnI+BxXt81OYZjZyhaIlPbIff/vHJ1BgAAM4johHrtYJ6HivNFtBGwZQMd4V+9uPEDtWPyP0LcFdfbmqM80EgFg/QeNtHV3V4u4cCvTiEXfRMfo1dTjheCqqoXzYTBpC07cubjBGrAkKzw0D0UMwC/ehPp/J+OwbL5rOZy7JeKVwjpxd0y//IBopteDvkWYgfOW6Q7L6pBB6Jy74wKeLIY2xfn7WcG+gaCyt8MKCqXuZxnKYzABJ7fGJ4f60sNKau7rnkxiQOLUwN4B/47DwWzXSaKb7c8
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 00:12:09.7449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8793340-e92a-4630-ea83-08de6a9487c8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF00016159.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFEE36F3C1F

Even though both AM62A and J722S2 devices have similar C7XV DSP deep
learning engines, they are integrated differently to the Reset
controller. Both devices provide module level global reset for the C7xv DSP.
However, on AM62A an additonal local reset signal is provided which
can be used to halt CPU execution with DSP core still powered on. 

patch dependency/apply order :
1) dt-bindings: remoteproc: k3-dsp: Add C7xv dsp variant for J722S
2) arm64: dts: ti: k3-j722s-main: update compatible string for C7XV dsp 
3) remoteproc: k3-dsp: use local reset for C7XV dsps on AM62A
4) remoteproc: k3-dsp: add compatible string for j722s C7XV DSP

Testing done:
 Tested on AM62A SK and J722S EVM boards.

Hari Nagalla (4):
  dt-bindings: remoteproc: k3-dsp: Add C7xv dsp variant for J722S
  arm64: dts: ti: k3-j722s-main: update compatible string for C7XV dsps
  remoteproc: k3-dsp: use local reset for C7XV dsps on AM62A
  remoteproc: k3-dsp: add compatible string for j722s C7XV DSP

 .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml   | 3 +++
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi                 | 4 ++--
 drivers/remoteproc/ti_k3_dsp_remoteproc.c                 | 8 ++++++++
 3 files changed, 13 insertions(+), 2 deletions(-)

-- 
2.34.1

