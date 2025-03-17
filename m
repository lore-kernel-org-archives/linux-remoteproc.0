Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2079.outbound.protection.outlook.com [40.107.247.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675E424291F;
	Mon, 17 Mar 2025 13:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742218323; cv=fail; b=Tocnd79l+CZhnecEhFRj0HZhp1TmBkWjocZgVIn/WK9oVVabZBEAaOJiJll+9wu9BGai1gFKXxHHnOA0xM+ndHTGLjhM/SpIfyL4dE2QmPnaALGlWkWGPphR+LCVUzohlgtJpKRfR7A/4+bvJuRV8gUml5g6esJ0FNi1gU1lPy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742218323; c=relaxed/simple;
	bh=nGQG1R0UWov8DF6ewc19QNy972NWqhvR9DpRFu1HBJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iAUWcDQZcfQbwEvfCW8RSuQkgqKoj1T+Q6iZhTWmOQzSIddCVp+zzU7fk+qUhIEmRa0JjYp7H3IvQ6ejvQsQ+YQMaSuKsaR6TFCWfhS17hKkvdQ6RcgXQ4dsN8sHdvLHEoiH3j4NdR2ZL8tPtkpQjwSRKDCP5pq5QIvV0Gni9ZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XTL9Ki88; arc=fail smtp.client-ip=40.107.247.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XTL9Ki88"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQb8v1dFn8BEZZ6j5Z77ba11OTK3S5cwRtGc+ztlNUSsgHU7GbO5PgDl/zWCnztzP2C1rEz1PaiXncTMy3PzkAItUuKAdEOxBnD+Sj5rFoHgkgnP70KY2Twtz10HopEh3y7YZ3x7kDqGRKIeqq8wJtIP7/Cqf76Lg1Wg7PtTrGd7dssGxIGb51dbaN3+gtyacKpF6F0j7Kb/CTKvkLp4k6szj/h9fWl0mOQZmf4+kwOex295e4lt5o0MQ+wChGp4pVtmis0E3IuxuYgzX+lhAu6alWh7UEeLTF+N7jzeiIXhXIBajyGYayUiMAMSLh7XKXfzNm4wK482i6+0jPSqEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgjlQ+XNSW6wPSeoiyFYMKJSMIURTzughfoPCoVU4PQ=;
 b=s2q6G56/DAUwBn/SfNtJUBO5RQDs8EAKuasa2nv01QiERYExZU3QYaT/K3T6Z3NLxKGn6wLhFnXurk2mKmIcc6DL3pdS5miYyjALZpad8a+LzULSCf3g2LRS2QP/BAJQi+mggDhdwc9ASX054dglHDjWVjrFIAuP8NSqEf9K847yaQjrdrT5pw0seQcoYJUOdx9qK50GxZnx619V5KBOZ4x+FefVL4Lbt/Auu8Ckozq8NLwvuP0q1W1sJo5Zlz2V7ja6FGNShMhitNhVa2Gypy0RUEZlXhw6rhrKnwg0ShBMLiaSJpPwAfVBkX29WIk53X3d4uvpveNOsOyCiVgmXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgjlQ+XNSW6wPSeoiyFYMKJSMIURTzughfoPCoVU4PQ=;
 b=XTL9Ki881h280KEwxTWn2Y63fi1UBkH4BSQe72UEoCF1ueeQIWUwgpsmBTcPkVTzJ7geeGesTtVX5w2sXGHchsi13xv5RAz27HQnjJ6+jVEKulTigoOxiVkURPPFQmp48mU5Lq89M6jEuu1FostydNaBmhhFEtSqurQaPD1c8fqO39Bv1EB/WYlHC/Of0D15RaQImS1ysE2kVMH5l2gWPVI3NYyLqcni7WSZWvvUGAAV+1hkaP5jD1vKO0mMLolDVLpsIXTcJY7FZu5FGeae1Z4LYYOkEno8gHHbNlvxocgwX1e4JXFkbS9B4mbTQbWOA8+juAJfisPw1mbGkjnpQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by GV1PR04MB9513.eurprd04.prod.outlook.com (2603:10a6:150:1e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 13:31:59 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 13:31:58 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: shawnguo@kernel.org,
	robh@kernel.org
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	frank.li@nxp.com,
	aisheng.dong@nxp.com,
	daniel.baluta@gmail.com,
	laurentiu.mihalcea@nxp.com,
	shengjiu.wang@nxp.com,
	iuliana.prodan@nxp.com,
	a.fatoum@pengutronix.de,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v5 4/5] arm64: dts: imx8mp: Add DSP clocks
Date: Mon, 17 Mar 2025 15:33:05 +0200
Message-ID: <20250317133306.2003909-5-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317133306.2003909-1-daniel.baluta@nxp.com>
References: <20250317133306.2003909-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PAZP264CA0254.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:239::20) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|GV1PR04MB9513:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c03c4b4-0811-4fc7-b830-08dd655817c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?z6ywvMUcAjC9SeOMjWwss+VjyYHVLCQvrY2VYT9SJSWKINqBF5dFgaBZQjbJ?=
 =?us-ascii?Q?Xbj6BzlDsxVZmkqofxBbIAxzA2uI73D8sKnVUAKPGftPMLZ/uLxQronarJyZ?=
 =?us-ascii?Q?G9vgLMgnqoRaNPOaMWwlxK7yhXMd22LwVJyiJqbh6MjMgempwxA8IpspAuLz?=
 =?us-ascii?Q?swMhC4F0vK5BCs3wVuEhNDsBeJqjv3ePKGLZD1bXeruCKMnYta4GX7nqJDk0?=
 =?us-ascii?Q?0YGEvMSdU45d8gfj762cjgWdIIh6IvFeOxvFPqF0PLf1VnsULa1PrKO/zM0V?=
 =?us-ascii?Q?ABUzFEM2kY8DiR+4JVdty/yNIVIzzE351qyZAkSuJTELqQttB9FfDf3NsB78?=
 =?us-ascii?Q?mkzYCe3iuJT6rgGnjStueyyEinAHqKmD8mz/c2pLAnFgoaam9LxuwH9Q2k39?=
 =?us-ascii?Q?tnAPvdy1mP8de9viTpWhR5ozt//G/3xwjuttat3PAhCVAHFEI+v9zGsira6v?=
 =?us-ascii?Q?XvuFDhITpb53dTHlg8xXrWQ9fwUMrXH3FmwSYB4a/EQeg0O+F8puFcD9GxMC?=
 =?us-ascii?Q?DrUctkk1hjgQuFxIqOuykfDLuEIIcpowehXsVo+49n8z/mdmj2C/mnyz2gb2?=
 =?us-ascii?Q?eEoGV6H+qDM5fHSG7Nva0Ku8QGOUFzukafHs3+bdTUpjXkT2Xiu1YM1hzRD5?=
 =?us-ascii?Q?W145cVe0D2sACujyklxDALJqIG4AZCoroKtbfdxafpHxxl3zQ8ECZCwInJ5j?=
 =?us-ascii?Q?CfQO0Ffxx2F8F0lSKcJOvM3x8wozbpM8iRMGi+gS2W/P4ThS1fghaGyFqjCE?=
 =?us-ascii?Q?aNi72PeIFuLMkvaEklT/fK98Lp2myUgOoyVqPr9BuuLEakrr3wHzeoOcIYHx?=
 =?us-ascii?Q?Y3KaNQUPhuS4k1a3SkOLKzOvvfC4G3K2QoNiUQLIbHwzCD0nW8XkSCaXSv9F?=
 =?us-ascii?Q?uAifWgkJB/T+pYs5/L+vaHBtOon2IL5QgidXCydw8zoHEvbOV3guo+oUlLsU?=
 =?us-ascii?Q?YeJ1/c9KhjgC2pAtVyYSitIixTEqxmLfH8Ci0u0EJdxaY96J2UjQ+y3WV9bL?=
 =?us-ascii?Q?s5URljRJ1NqY0ifxvnRgcUD8l5psm1rhDNkbCq8lIsXCivlpTmKVuPp86koa?=
 =?us-ascii?Q?EdD7rNT78DDm33YChBsLl6gs00tY46rT+SlDdDtswsSzelclUiJHMJKGw0yv?=
 =?us-ascii?Q?NYTYydX4tPXeIZeARYJ82mszTCvLF1BQUb5ATrD6DKLRuC/zB0btg0d3NcSO?=
 =?us-ascii?Q?+3RzjBQznAYF9qh45KkYS9uDZT6Odb/7EV2gtHZLmAguR90iEqV5VBgv+IUb?=
 =?us-ascii?Q?f8mPkbkuyznsJjwQdQSAZlMnf9AP0+Hp1/E5j5+6t+Aunbq9mUTiNFWSdYsD?=
 =?us-ascii?Q?N3H1LWvCjeHRZztNLNGs5hFryvz0yRYBQ7o4tNz2mRb6Bs8ivOqIRvkWDq96?=
 =?us-ascii?Q?Mi1rLHg11+gllctwqoPUQrW9aSG8elruK9SLj6GZ77qFPLriLBg/Z7182CIa?=
 =?us-ascii?Q?zXMJPZSfwkk4/H17M/DJcRJznLH7NQIg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YpGvRMpA15WxfscvEEeWdKfBvXYmUCiBESgzGtBKIVk8aBO+655GxLpIkFOX?=
 =?us-ascii?Q?EDZxHlEttVR0UhPxKUtDGsMT0cSu4VhIxBytFvRV50UgTFHjUZ4drHwd8xe6?=
 =?us-ascii?Q?QYLVf7maAmIpWd1ANDN14juP0IEyFkmHJvu1jzINq+PLJm37a842Z/Vf0WNz?=
 =?us-ascii?Q?1rkVWIqaGVVlP8YYs5zMbeA/CkcwlEcI/i+aqhZkNABDNWrw5pPDBiqDI69U?=
 =?us-ascii?Q?ocGbDH5y+Ug+wP0rNm6P1XS/eyt7N8h/1STraFSNTnNujH2MgMHTED7/d8LS?=
 =?us-ascii?Q?wTV2qfAS/1thrUYL0BqER7C9BGEw0kKqv/QK6xi36/AeQYa8uztwdHHBvkDO?=
 =?us-ascii?Q?AOx4aRvsrPT2OlGbFZAmfD7g25/7un9nHapwjqV0NK+4uAfBgsMVMyO8bV0R?=
 =?us-ascii?Q?8Vp4Y7YhDBIdFzpM2miNRQbLIJ2kZJWrUOpLqAdKKwJj631ge3D1bWrey9MR?=
 =?us-ascii?Q?swiOvu1Okng42RtWzzb6hkRwDaq3cel01RTeLnqxc5Ca2S+RSzXuoYuvLgTF?=
 =?us-ascii?Q?vtlP1bhx8fNjMEJVNla+xGRUMhaAFxHBqWKcWGC+iSfSTFlUIIrJWGJQrDXf?=
 =?us-ascii?Q?5sEktEX6qrAgbOAibxZwE0VioNMJcJha0nl5MyXggWNXlzPvIjsbWiZR809A?=
 =?us-ascii?Q?fI1Ya9Nu/Vo6tJWOylwgQRO4zz/dPHDkHZsSVHkFjbeeyGF0oxs+xSWvZusg?=
 =?us-ascii?Q?fSToYkM/+oZLuqgqGdZDcwsQZFyDKvjw5Lxi6/fvUh7UGl9Eg5S3rQumprQ2?=
 =?us-ascii?Q?E4zp5l9Jp6Cui/uGoUMT7ij35Eo9++Axl3Jh1Cwq1rR2vtWABXBzwVGo+uaf?=
 =?us-ascii?Q?D9CBwr9iPNp7aszWlAHp+BXqc6bdmPW3xaLb2fsktnvD2RLjw20KkJhvdVnm?=
 =?us-ascii?Q?DjVUW5bySqRA2VCph4b+ajt2MEB8VHa0Ej57UNNc05eX5FbaZ+sX7Z2yppeG?=
 =?us-ascii?Q?9unkVeesFjszAC4cIh6WUDXikBiFR72nkV1IznYk5OIDK85ZIAN1qYGkPuPx?=
 =?us-ascii?Q?/R9W4qz7ImtkN5XtShV6+GiBcwaozbXAPSQJA3lWT8WXTg9fuT8KbPo/Xf3l?=
 =?us-ascii?Q?HzuLdIWq7w6H591ARZRxd//WWALaU2DMsI1/z8Nj486GU5/47Dl3rIu9Jhnr?=
 =?us-ascii?Q?BF771D3Dpodm1JiXd2RXoRkkIYfzVRKewpqSJiFks70ciFo5y8Vic3iTfjjH?=
 =?us-ascii?Q?quTtuCspMq6AwFwaCBJMO02X4eoMRQdsMT/3nn/hnMYYoNt6uD7vpIly6jCb?=
 =?us-ascii?Q?QgAnMhIp0cavWNSfUMslEguC6M79KxVY/1Y/LJoGdl2c0WON21O2O4o2NPlA?=
 =?us-ascii?Q?oRiFMOQN4ARBujePXm2Bx2Z/yqD4RS2DyfmMTVw6HrqbUVoLU9APcedrusns?=
 =?us-ascii?Q?FV9VuHQhQ3On74tzQLIz5/rg1hYaYVZF+y7wiV8Ll4z4kCSnRJjlJAzKRbOd?=
 =?us-ascii?Q?xK4TXNnROyZFaztLxwsBosZ0wll5elyMLjvwrgV0/sYLDwnZsoqfwKtuKmLj?=
 =?us-ascii?Q?A3RdPdfz+4aryVQpufuGiyV/I21T6qtG6PDUdGmcmzjrpX9Bi/mspeOo4ean?=
 =?us-ascii?Q?t6tiMjwSy8E9mrpQ4Vv0cRwVZKtF/usR4N3Py4LI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c03c4b4-0811-4fc7-b830-08dd655817c0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 13:31:58.9248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DD/d5L1w1F4z1F0/FDVuY4gCiLX97c58FuuTB5zAu3jZfA0x9DCbnfHXixYvrtGvra5KtxOtw3yOr79EqN3hrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9513

DSP core needs ocram, core and debug clocks.

Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index cbe8dfa3b3bc..5a43c10d07f6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2418,6 +2418,11 @@ usb_dwc3_1: usb@38200000 {
 		dsp: dsp@3b6e8000 {
 			compatible = "fsl,imx8mp-hifi4";
 			reg = <0x3b6e8000 0x88000>;
+			clocks = <&audio_blk_ctrl  IMX8MP_CLK_AUDIOMIX_DSP_ROOT>,
+				<&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_OCRAMA_IPG>,
+				<&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_DSP_ROOT>,
+				<&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_DSPDBG_ROOT>;
+			clock-names = "ipg", "ocram", "core", "debug";
 			power-domains = <&pgc_audio>;
 			mbox-names = "tx", "rx", "rxdb";
 			mboxes = <&mu2 0 0>, <&mu2 1 0>, <&mu2 3 0>;
-- 
2.43.0

