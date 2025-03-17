Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2071.outbound.protection.outlook.com [40.107.247.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984BC245014;
	Mon, 17 Mar 2025 13:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742218328; cv=fail; b=eVr3B6Lz9Du7QUri+PZHQhgwRWIWzy6M++q9r3NKoCQXVyZtTvfmGyxLHrJoJQITl6Mvo7FdshIRe8z5H64ATLMhqwzli12fRSLhRjfq37Og+4iS4mKv6ujGQK2SGMzSMUKJXe/wxtPNI8MSeMGBBBTeCqU+OYchnakvH36H/tM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742218328; c=relaxed/simple;
	bh=I941TbbC7eDjPgwEMT94cc/UbnEXXRUwKO9DiT1veJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K6pHC8Dz72J2nUiHI/CA6YMk4JOYs/FU7+Nbsf1mvdwSbr7sxjAAZoEsWz3s8tZH9NRUvZutXjWLrvEMI/lS29V0as2TQb2dt+978Nvun4EeevpdUuQXSVVAYtUgqu5PP4GyBaPf8ITj1nYb2f+msBEaskUGareo7ZXTet+US1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lcEGQEhw; arc=fail smtp.client-ip=40.107.247.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lcEGQEhw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VR67WQO6AoLZemxl7jqI49F6Gym+kze+R8wtvG1GHzzHampGXQK+tRQaBmWb2BmxUhpKIPCwJPTTqUpqRz+Ensq7a1lW++y6dw3uzOBdt4ZQhOZktYs7aFM6d4N0bFBqQRYDLl5ryniMd7MLeLuhsKPAsvdIoTqIo2NGlTGLugApqazj7tYjd7muf/mAEJ2k2/FC1F57ORyG1jbemq1fc/ETMy/l6XArKok8HFI1AMHvOqVVUXa5NdmuM8bD5VijXHl/P9Pzkj/Hr0zpeMlskcYdSBH04mKOb25xU7fryqnNrIA1FwgQdItGxjvYR4uXqSJcHrZk1bcfRXxK1yV4pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCdahfXi/bSLi6xRjZ8LRFSd3u5mGK2m3FPla8DILQY=;
 b=U2k7658R5Iix0nPY3mC/hzQ2Ktq8lDIs+lQSJ/LANsTlTS//rD1lQW973Zy0wVMbs64G1DGTZABB6bD3wioHE0XFdc0FZCFDTcGMy0FkOoWBmytOJR7u9IWEIALabfbtSazj9Dc9kzRb940nxa9W7oqwdpy3/zNgG2MuOYMfXgyEnv22n18FwyEmMiyK08vJoiODeLo7p7U/R0FsY1YsT66TncXaXUhpEnesA9mItr6DmLVkAbCUmCHthm8XOubO240HtXPDmgz5FnbYxWiZq++7YJCezRWWXj0i6NpDlZ/VqQ3ZucEEiac2VvKF0vXYBH8F2eh8swLF3tvhzoOaUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCdahfXi/bSLi6xRjZ8LRFSd3u5mGK2m3FPla8DILQY=;
 b=lcEGQEhwbczryFZJXUHKGSOkM3xm+TMOl/4YgNpNDDfLooKQRdIGvuvU/DcO5FJrn6YFRB3GzHUwQBfIEN0+xLqVhIE+8/eMSqrfvuAt+MZiH0pcf2jIj3SjHtIECRO+vBHbhgHr473sIIC0D9Yk0YsKbsC8zZmkE+5kzMvsmn5PU5dXb504ls4J6rO38snMsWxDDRqjVjwcCNLXerAM/jzhbKuo1zOCzFZ48O95iR5W5wGr9MVq6jTHjUjL6BXzqs0H6wddAOJXm4w+NQWcCGxxqmsqrOIxPspPCgvdZJVBahCqE/gyXZibUz6GEtZma/CDjOwrZgOzf7+o5V+XvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by GV1PR04MB9513.eurprd04.prod.outlook.com (2603:10a6:150:1e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 13:32:01 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 13:32:01 +0000
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
Subject: [PATCH v5 5/5] arm64: dts: Add dsp rproc related mem regions
Date: Mon, 17 Mar 2025 15:33:06 +0200
Message-ID: <20250317133306.2003909-6-daniel.baluta@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5bea0c6c-0cdf-4eea-0a3a-08dd6558192c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3QJGnNBXhkahInjCjFLkXPz3jLmGh6gxN/mamErtebHUUUDPQLfndA5FLGf0?=
 =?us-ascii?Q?qIjKDZXprJD49PRuYzcfv+fT8flMYhHOQetQo0QLLzoO4KEDtUey9IR6Gnnv?=
 =?us-ascii?Q?KzMpdymOsod5OucI5gpSxsOMuyPoNusFk0/nMyyotPiU//ZZy0/kQDyfaz3f?=
 =?us-ascii?Q?wjsF23VXCxsh1Dg56yWWu2CReUCxqtArkKfSpZGfGStM9ep0S74q1+3R7UW9?=
 =?us-ascii?Q?H9clnIqTD0qEhXhJ6hJe48WcF+MPY+3PsdFzOe3nh7oqi6EouKz1Gqw7WEQw?=
 =?us-ascii?Q?TafdP9mU55YLjmVKWc8BPbL/uo2gdiKBFuUqRQyf6tRQaHpKZDaQDUiEp7MM?=
 =?us-ascii?Q?LjeYnZWp7Ucuxul4ELC03YrieYryXEt8/bbvF9y84kkpJB4uM7S//Amf8xbv?=
 =?us-ascii?Q?x5EXR5D53kVitIbe/6Jrind0DZqxggFyX8xreYGLFyfUDpXJs+vWBVjPXSW5?=
 =?us-ascii?Q?RZCfuXlzx+mGE2Ov1t6Oc8qzDlKKzAIzVSw9TkUUqsbqt74QHh/CbNF+PR/K?=
 =?us-ascii?Q?9KL5ictThM10H4PhdJxrdJG+ydjj9qJWOy4IM/sth0eW3VRrUIJEevN3xl+U?=
 =?us-ascii?Q?jwKBqGNlmh9neeqrQNQ9AU+xmI6d2tRxqIWYmAKH6pJIlwHUhQIxGbBjiBbP?=
 =?us-ascii?Q?NcUZKHtdXKeNur4SzwJD3hSiNWRA7eC+RArj+loAaJeIZl6XMy1TcTzL2DuH?=
 =?us-ascii?Q?ciuho1SI38L71CntufhJfHxVpIUMN+Lk6dqOb/iqfFD6alAEBlTrGe1oOXF2?=
 =?us-ascii?Q?OvB6dstRNwEMUy54zdQ/KbXydeOBSYtfUGzXFCPC8ouGvgj4bzCc/MONEq8V?=
 =?us-ascii?Q?1NUrAI9OVu5AjcaCxJr2C2vRrI04kBAXYnbreLPqxwuZPYsW1KGdMB7+2NT3?=
 =?us-ascii?Q?cqGABDBeXXznc0wfwIyxxb8zVeJkrbZM/C0S3kc/4ZSq0y9JXeCy6igaVmP8?=
 =?us-ascii?Q?rv0tVWMUQpPP0kzPLpjN8v8B3TDFvAo45WelAk09hPnKMwVCm2HRS5H4zeA6?=
 =?us-ascii?Q?K9Y+1Gz0KZ+vcoLZ8rAZ59/mZoG4qL/cPipXtsEBuGKjD0nL7wLFIrqD8HaV?=
 =?us-ascii?Q?vy/VFb0/nNtd+q8g/4dvu9TMG1Z8FCuKv1B6IUc3rD9yB+BFkjf52J3JURvP?=
 =?us-ascii?Q?gQMcWgqStWejEivyVa59HWafF1l0K4mcI/z36TVihahh04MDlqupwdXzHSIu?=
 =?us-ascii?Q?p3DQDxI31WScrjHe26wOINTnLdfJoVNNw12ZcA9cNyOj4Paf+R1pYVHwGuJi?=
 =?us-ascii?Q?sdvIysUVlP4gQiqQh03/yBwEwDF8hYmcwibqH4638sluKZJXD+cn7534JsPf?=
 =?us-ascii?Q?rTSpvZL4GAslkduYoWPsqBITn2DKRE0g8QMXAqu4vSJW/9qVMd9DWg/gsyqd?=
 =?us-ascii?Q?lGSYeacOCk26JdaWV7C2GsZhD+d9lE1hQZt/lVUUu63mwMEf2fA9tfztJ539?=
 =?us-ascii?Q?q3dlOcQc1QwZZHxKdmciVWjTebdDVwnd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XLMZgK9Eg6dNJbxOfV9PqbYhcWYjjud942HsKsNWlaqb+HKaBkovvBZs9fkF?=
 =?us-ascii?Q?AN3zuE6k7n6luWt3k1cf32I4fwLHipoDJuqxm3yVh39E4HnBsKES6DWQ+sWa?=
 =?us-ascii?Q?QgLXVPtmMjGE/hlQ1TrU76qDRfaPPol5abiNDevLCudpnvgXEu6nGaP/h1I5?=
 =?us-ascii?Q?bRQpbApJFzsYGHbXx5L5ojrSnoBSjXhOFs5f/MVoVviQFFndiFZzM723FRLZ?=
 =?us-ascii?Q?IpOO/UquFt6t+Ov+bYZmI3a9mmE36T5JYjL0Sp64S+wo6kRqQBbAD25p2VI5?=
 =?us-ascii?Q?Lm7zwsm7FVuArL8YYH8HYrCKw0k0S6uq6xFCWMGRDMbdttSnz14f05dgjcqo?=
 =?us-ascii?Q?4V+to2C+3HOuM0oXiswpvi48oPp8Enrigzs69fp7h9XR6iy7PHptQO6RWB2Z?=
 =?us-ascii?Q?lQrbRnWBir9zCQjE3H37PsS/NOqnHpA1kF6Y3dQn4F4jaUpSbm5rm/W476P1?=
 =?us-ascii?Q?LJDQbKHEYzx16FXOZZkE0f/asVpJE6071Na04GBAgpnYbAhuIIn8CQkMit1m?=
 =?us-ascii?Q?e0t/8XYpdjy1lpO3Jherf4v9g6hpLghvOL2HEkjx2qZXCY2Igk0e4ACugspz?=
 =?us-ascii?Q?EwWYBj6j/RW9uXUfYk3i6D/6W3xPcYsdyKDb07rAJNOHJ0QTPH2FDCikf9BA?=
 =?us-ascii?Q?ov3ARSyOQ8yNCPw/dhBktY/wQdFoFYVA49cLN5LTuCMhIoO9WWh4RWy07BWZ?=
 =?us-ascii?Q?TURV3Jb3MRTZiSd2mhL9Cp5ccJei43bFOuprBsqu5JDu0yZgi+MtbhjGkIyP?=
 =?us-ascii?Q?B//ZQPooRg6D6ZjcPeVXWoGXUwt1GkrM/sUmgee8ps/yKMzL4QBDTEUqLrdO?=
 =?us-ascii?Q?f5sMMK2MHNVXhgo11kAavLvTx9B09MUQI3RFOHtIszF59JN1cBiQuXT7+CQA?=
 =?us-ascii?Q?NN5YZJRL1HiBwBkJABqnyc/QQDhprdV+WuAJeWYFUXnESvX1uCTpRiw+9gOk?=
 =?us-ascii?Q?Us2WPUZnonbvTkWJU8nH7msMFbSafddApscnNYq+eLgRJoj5TeiQkBGnxe0K?=
 =?us-ascii?Q?zsXLriZB7ABRftesb8g9X76X7263r5tHihRh2SeFEgwnNcQLA4gsizzdulw8?=
 =?us-ascii?Q?WLA1Po/yOjkC7AQpPRvqm7lZWdN/dqaPyDyrXfu+jmP0RYItgVAIOJjVwK38?=
 =?us-ascii?Q?tnAahjF6doIyJKzORzNFecnKq48k/ZL6HgKyTIpGQ/O7D5fmyxvlGxQB+jps?=
 =?us-ascii?Q?nBr+N//rB7KUR1Oz8/tU3n9VDlyKw9xf6g0A+OEJta9PV78AkgybnBL7vzfw?=
 =?us-ascii?Q?a65mJQ1okrr+lSnEhUTDX6zlBb/e2w7ID0cUwbqVBdM7UWF511R4cI4k6nwb?=
 =?us-ascii?Q?0ChJHt97yWAofN9wRPGLqniWF+0lzKBKxUJBfL80hiBILhGXoeQhvtnrBuUE?=
 =?us-ascii?Q?qBmIs3iVI1Fl3s+Xm7Mw4G9yxXFNGYcqo7giMiuxMFCT/nT0SvgDyGwZqP5T?=
 =?us-ascii?Q?HRLX1mD+ERqg/tGyi/aVKV+GLiOhefVzFUHTNssn3rBD82sFtfZ3n8r+dJwn?=
 =?us-ascii?Q?+6fZvFi8GtDGcP1nNVstHc1VRmF/+i3+MpQqayaX+eJ+i9ssWdTQ6WDEMBde?=
 =?us-ascii?Q?FcQOpu8D1dmCGb3TbmqPLobPlO1CtPP7a07BKFwn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bea0c6c-0cdf-4eea-0a3a-08dd6558192c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 13:32:01.2477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RQPi1+szN1Ej9U9mrcoW1izrfRdspu72gavjwzA+KiM30HSZTWLw6bDkjSCeVTJQQ6SSbk3wd/MCUM4N1jK6pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9513

With imx8mp-evk board we are now configuring 'dsp' node for rproc usage,
so add rproc specific memory regions.

Also, enable dsp node because it is ready to be used.

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index c26954e5a605..cd7ab74de2b3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -309,6 +309,16 @@ &aud2htx {
 	status = "okay";
 };
 
+&dsp_reserved {
+	status = "okay";
+};
+
+&dsp {
+	memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
+			<&dsp_vdev0vring1>, <&dsp_reserved>;
+	status = "okay";
+};
+
 &eqos {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_eqos>;
-- 
2.43.0

