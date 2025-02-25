Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2041.outbound.protection.outlook.com [40.107.103.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAE5266B40;
	Tue, 25 Feb 2025 10:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740478751; cv=fail; b=Bjei3QDLKAeQNpm11RisfxJmHm/VnAEMl716H/GyXpIV1o74rDNp/Ny7/Kdkzf5KyDMQ73h93+KnGYTv5upeiCO1tlFNugKx91XtZrMzXWEVT1a5DsiXzeKhXsJSJ9uAxMPCvklETx57ubJSL4Oqqt0O4IjwvmZX/MV37okvSPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740478751; c=relaxed/simple;
	bh=uBS5ptsT9ETr3k7xf9A+4oL8garBBJBa44bjMLaEdCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jsfbP4qCVeMDEFILgB8pJhzFBUuYFKuadxE9aaegt5FtvGOgOl/dJoRqWOgA0rZfvWezGs6kZzbxUydiedtmsoJhIfC1T6I2Apewwa7iys3Ykc0l10VBZ9P/JgKkp0NtsDsobk16a5sCeVsKiRVXwMYaNWO/5P11vsIKqVT+d6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=frkgZ1xt; arc=fail smtp.client-ip=40.107.103.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="frkgZ1xt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KKGVYUA3cxQHDFBVTZW3+AFnq6qINNLd+nsa5gN6Uz3L9uH7GE4U+L3Z6JuOHBuTHnLF7CFjyGJz7QR10TfF3+w6rUcG68c4FyxTMAJQaIHVOCZJ7yIu7Yx+0yCXjVGDzLtK5Lg3WHmfrUBs5omZ619po0GR5sJuffgI3QyG5QzbLQnKATnYWKL56feYjZ4TJFaD9VOS0QyxEgDnvLKCTgFi3JxSo0P5etPhbLwZEWksu/G892M3cibaZoKdwN9HJVBbkaMkbsh5XbxyVmTj9UjC7BC68qUK/oayEeF4Ue8kR0g8NwHTO1rej/HtzzPSeugU14qqfAwOG4z9HcYpCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wXGk9lx+7Syhq5sNmRNp9NvIXFKxVku1f0QNdVFfvM=;
 b=DOJ6EDEcSAdjSNpZjvSoG7U20hKztDT1pWcSzJk1kHv3DWU+IaMe2cOJ5t+HV+I2bAyvfW6/3xep2ktW1ACOpMEGG6Z5o8ZdAmD073lBxoEd3/t4L5Ol/crFc4+PFQXKZEw2a14kTGClBbqbNnfgkjGsd4l8sBdBppoTKxJux9yh5JcQra9eD/fHk8vEUpquF1uIN7xGqLlwVTsvGErNTxow5hZ1Mm8DFU7GeWXuLQ7gbSjx5bvr/JPGar5+VD17ZZHdWojNSSRtKCNq4rdEuHl7tXT77bvbAIgLpFaPfg/F0sLZ970Untgw/aVeb/IbOxnTi9Uoe9BLfxxOOD4bdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wXGk9lx+7Syhq5sNmRNp9NvIXFKxVku1f0QNdVFfvM=;
 b=frkgZ1xtdP7u6W4kr4sV44mE/OLM9E7WDVMX6AZPV0irx+5eoLLffZUq+DC5A9eQxOQ2Mx3/RXdTH5iBkivcONf6hbHB0zPcZybirbEgAb4mS9AvSwCK3L4aGn65K+klviF71AGs9iYh5vFjyYkwCIzPhzTMAM7hmVGAxkRzS7rMz14lze55kIJEti15QieZp2a9A//IpHlF6GINsdWaVyeJt1RBaK3Pu5E25Ik7Nh4UPFz9BtoOk27txuLZV3xp29+iennIoKRKyqQ/81HpoknCukSqSsiaoJNqhxx5pmjz6vfsCd8enyZCArp2TvgYr5z+dDcLe9T9xC/D2i7Lqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DU0PR04MB9393.eurprd04.prod.outlook.com (2603:10a6:10:358::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 10:19:06 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 10:19:06 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	shawnguo@kernel.org,
	mathieu.poirier@linaro.org
Cc: conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	andersson@kernel.org,
	Frank.Li@nxp.com,
	peng.fan@nxp.com,
	laurentiu.mihalcea@nxp.com,
	iuliana.prodan@nxp.com,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 1/8] dt-bindings: reset: audiomix: Add reset ids for EARC and DSP
Date: Tue, 25 Feb 2025 12:19:58 +0200
Message-ID: <20250225102005.408773-2-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225102005.408773-1-daniel.baluta@nxp.com>
References: <20250225102005.408773-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::13) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DU0PR04MB9393:EE_
X-MS-Office365-Filtering-Correlation-Id: b50616cd-df4b-4c89-124c-08dd5585d5fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6axS+ddLg+kh6kQ5IZtCIgSAJ7QonR3tIwDu8FfLmktKw6jw9zD8ShYPQB1K?=
 =?us-ascii?Q?czTVtgTNYKs18RuwTn6pePgyx3TcGHNJ0/kpg3UrTL2/bCpNakSMipWkvGSZ?=
 =?us-ascii?Q?6h92vKfOgFm94fh5UPQjsUVoZi7IB0koT2FOsAxnaOIanNAOOXsP2OGFZn7j?=
 =?us-ascii?Q?BCna28Sp7apYQkkvTVaJlEW7K8Bs4RPcU3+aYLKuDHIkkBvHsORYdVEPzdpT?=
 =?us-ascii?Q?WK/uc0RYwlqLco6U4TTo/pwQrShfTt5JKSFLlvufA2lajGFvX4GfkgJpGk0c?=
 =?us-ascii?Q?oxN8is91pJ1cZbgbrh88Zgf7Bkc+IcIn0bjgY4xeX2Cov2qPynGlm/iqbjCZ?=
 =?us-ascii?Q?6aXQnZtgHODQj6/Njn/RdEyaAay5b/VX2IwnALxzKYii+5NebfK4PQa4JxlZ?=
 =?us-ascii?Q?saVX8kO8cVjutwTSYmQ5vOX95upqkx570rxi//iPgLGijjT5My2kXOb1gaRZ?=
 =?us-ascii?Q?jS7mFNJBzY54Y52g2w3nlWCb4RF8XJn3JD6Vzhhe/ioDnPdVPYYVj5Xi4opN?=
 =?us-ascii?Q?14UWXWNsJEKPprY74VpFvwO8zrNjFLQR8GmgtKRmqN7foe7t5cZ86zyrXjGv?=
 =?us-ascii?Q?O1kRSDzSoO74lsMN2j2qNz6p/Vvw9+hFj881YgkxBuaTdI2pIm02ycLbfbv2?=
 =?us-ascii?Q?3zdYqMTJVDhKeUCP717TjenyzkNfQbU4kq+y4jpRIUrOoZSrLoLYSZsE4CeA?=
 =?us-ascii?Q?8s/e+XOdVlNBJW6bRkKXsPBO7PFTWoSG16fI/6A4DXe4ODrKNVH0+8ggbguE?=
 =?us-ascii?Q?3oHfUy7gaaC2UL8U3wbYYoycIb7UD44lqzB0H9Qa1/yQbhAxoQqjRPzlxy7Z?=
 =?us-ascii?Q?PPQ5WNbrUTtsqZBqxR3P/t6wXMiL2HkmRxGpKr0TmXIBYDIugovQHNNul5wt?=
 =?us-ascii?Q?0Rz3EyAywrO6+o+d+zly2jC3MVJx+v83SSxnIIXSpEuJuLwzRE2kmCMxG06X?=
 =?us-ascii?Q?UceGyFlQ9r9y7PbKXgMSj+Sa/qSlfxGriIjDn2AEHmvj8BtRRl86mEhTOUXZ?=
 =?us-ascii?Q?E/TtKxifRZqL4P/g6hCUe0HqrbaKb7QDnfxeJ/lnU5mS3OClGnhsHByKPCTe?=
 =?us-ascii?Q?5JKPre269Wrfl0gOdJjNBaP8k0+OmxghVwkhn+xW47+3MoZjR80/Bz/cbePY?=
 =?us-ascii?Q?oDhK6qy3FDyDiHJHvGiLViMaPqInKpzA3EiRp3gwYtrkFXtJpowxSQQwPrH5?=
 =?us-ascii?Q?qb3qTVzMlxtafkPEHOEU9QpTk4MsjtGdlKWITqHU84/06j9rKsQVY2pssgIN?=
 =?us-ascii?Q?uOpSdRCvHiXDBzlb9FEkxV6ERitpuRjR+hasEvHc63o2TbsOWsG2ItwR201S?=
 =?us-ascii?Q?0baywGUqDjhjVZZInSy9YQklGVTPi1BIyaPz1miMTl/kY/yrUaQp7yLjwUda?=
 =?us-ascii?Q?ohPxm/vFR/UP91mME2IZsfD46hZEGoA3QIExFdH+WH+/uN8DKKYOf3vzIRlG?=
 =?us-ascii?Q?qjxs7xU7FY42nM39HVRGSXvnvmNWpv89?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?10hQ5ppCrzX0YQnyNDWbejsSlHceZybGbRwjMw2JN2aZ7DYonre7L0PpUi9q?=
 =?us-ascii?Q?eWUWz0CS/Sz1qi26yRrc5+nYouByEAIF0tol3dnBNEng+ohGjv5cuiiHqQus?=
 =?us-ascii?Q?juXOaYZ+hbjw83OSPEeJkaRcHOW+oql2KCxFMKKEmU4zAj4Qv6GaQCrozDsw?=
 =?us-ascii?Q?CYZWN8Cv/kBkJ+n7S711ev0qOXfcY+LFOP0F9bHYc5D5pir92gd6EvNacMvo?=
 =?us-ascii?Q?5Hc6+egwA4axthpQ/+nhFqKVlyGtRoQufJosdi40Qes9fmKzN6f/Zyhngv9S?=
 =?us-ascii?Q?ppVTm9WtDZ77Aw/Punno1sl4pWN/78vuUoEvXdg3VjeJ2Th/5d7lNQhe8soF?=
 =?us-ascii?Q?WX0dfG4FAiDf7HPyh+jXVQwb65GkhiR+Fzpk0HPU3ZXAklJYjI0NsTvTdK3K?=
 =?us-ascii?Q?7KEOMdMzLSATaVNMpRuJzwQBVH4+96SpFNWujTPuapMASWn7Vw/4JF8alX2H?=
 =?us-ascii?Q?NCMowskpQl0WmLd8eeS8qM5WSQ+HR/ED/AZkbNNmPXjva0N/g+9UAzJ/MMSp?=
 =?us-ascii?Q?G+33jIuERbvSBshu/m4egPYE5hhBdiNxeVnJL0IDJpr8oerwfyqfpIOR/O9l?=
 =?us-ascii?Q?B6ZSIcOscyr6+OiHZMhowuZq5n95Gu8zJ+LD/HNMVXWvWwXwyh3WJIB8ZFC/?=
 =?us-ascii?Q?6I4jzE2ehsRT+HKnJHQqGqO8tACwDh8Ym/y/c9cmr47STLhzQc6Yc0RhspEZ?=
 =?us-ascii?Q?Q+CMmDmwxfP3BqqD+jTLTEtzegP0xJZOw/ds7yCH3jWUXJlB+0IUioYdMGbx?=
 =?us-ascii?Q?y8Th0SlXcUdh0z3mZjHTEthsv9y6YD/ZIg1kxlBn4auggVASsyWws933nHQM?=
 =?us-ascii?Q?tkQtV2tzF/WyjSuSS5pcF908/gmFKepgCm2Gaih+mTBIGa3GmTq90QsMlcfx?=
 =?us-ascii?Q?2fMDav6JKCdlZFnS6CbrK6NmxHRvI3gjhc8uhGxVpj/nwkX9rf53zQcOq7zk?=
 =?us-ascii?Q?iWYFwAU1lOd2Sg02jlEXWZYx+CmIa3e2X6NIRc1RSV0PY1bRtAuxBLJtKtR2?=
 =?us-ascii?Q?xUEPm4ot2eUIKkFd4w34oMrFGVdUp1kgRcEE4JS4N/dwx8n9ueN6HLkrPqww?=
 =?us-ascii?Q?Rr3whojiR9myt/yYrYND815urGWKujWq8xBhjomLBUzKBudS8hl6eHzda98h?=
 =?us-ascii?Q?/Q60Ak7HC+vlgvvJCT+k2UEVm/uYN/8jHwQkCStJUpOq5E9GIIN9zYJOcDZ8?=
 =?us-ascii?Q?yXVC8oUT409EvR+gfvffXcFF2qx4r0EGcfzMqCwzLEQrI+4aFfkHrSJ32mPC?=
 =?us-ascii?Q?pXFcbw4tBAQfGtet5mZqB5S4vG2YoDJ9a2TU8iE7BefhaB43hzKKexcBywIl?=
 =?us-ascii?Q?N4VZS8S5u881w3/NPIgK2J65jZ0lruEU3elvt6YGVEoswbGSlG5N6FbMJFOR?=
 =?us-ascii?Q?8iXVKsEEJoBt29SoMQg4eGx1TR+g6boPsiyjMnsnxsNT6rAQKQc4AHETU7cS?=
 =?us-ascii?Q?evdq57vAqKrSLprLH45e5JWZtj8fUWAYj7Bsql6snDmJTAEfJ3+ujcaZgjq8?=
 =?us-ascii?Q?a2ABZcnEaOENWxfzfQmuB62RwW8DRMYIXRhyQNJRvh3jI1BapdiQ7MYCPlqe?=
 =?us-ascii?Q?m4zKP+cGZ+KqUBJFOC5mnOxgGyCCc/rgptZRAloS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b50616cd-df4b-4c89-124c-08dd5585d5fd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 10:19:06.8819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZgDRsUM/ioKlV8SrzINq50t4WoAOPCfKNwByDSeb5cz38Kpr7zkYr9cYX9UpsHRYe1TlEFgLqTXqfl5bHNI+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9393

Add reset ids used for EARC and DSP on i.MX8MP platform.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 include/dt-bindings/reset/imx8mp-reset-audiomix.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 include/dt-bindings/reset/imx8mp-reset-audiomix.h

diff --git a/include/dt-bindings/reset/imx8mp-reset-audiomix.h b/include/dt-bindings/reset/imx8mp-reset-audiomix.h
new file mode 100644
index 000000000000..3349bf311764
--- /dev/null
+++ b/include/dt-bindings/reset/imx8mp-reset-audiomix.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef DT_BINDING_RESET_IMX8MP_AUDIOMIX_H
+#define DT_BINDING_RESET_IMX8MP_AUDIOMIX_H
+
+#define IMX8MP_AUDIOMIX_EARC		0
+#define IMX8MP_AUDIOMIX_EARC_PHY	1
+#define IMX8MP_AUDIOMIX_DSP		2
+
+#endif /* DT_BINDING_RESET_IMX8MP_AUDIOMIX_H */
-- 
2.43.0

