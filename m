Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011052.outbound.protection.outlook.com [52.101.70.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491072F2617;
	Mon, 22 Sep 2025 20:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758571497; cv=fail; b=pZC2iRUZu/p0gIHci4fCDJR1Y1c2u+YHr1vU/USorL1Jyg4WENakOomW2SJwCulAIki5J+Lllp05ZJOq0HOwW8husHerr4RZneLkXR5rEzUfdnYo8rkCtp3osJDoeJd9o2ek5W7EiDBixzHj+/DcpmvYouFpEjSuOeKQHw/eQMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758571497; c=relaxed/simple;
	bh=xeE2PHWcbrHtBmlOE8tdRH5lziZGWqWuXG7gcKkfO64=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EjFAu3EUQDulf2EWu9ZBzUYlKJZBbNf+2IS/bW9eoVtdLGqyGlD/c03drPVfOXwvSE72HSpPBUdzMkiPSkdF5nPtKgjFOAboB6G8EzjO5admryl5cFCwKxDSoQ9HX2s78o74akchOFLfUSFbA++a2KtR6ynQNCLWLGNNdvEwC80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=a1XircNB; arc=fail smtp.client-ip=52.101.70.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="a1XircNB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3tJOLHnW3f3Bfc5HlAOb27JHL+6TnWTqXdscXeGIX4cteOBybxuy04d8iEQ/fJC75WEILJoCzyiT0oClzgMxUhAbFKS3SLA3Hot7tXLoBNVtwS55cSGVNQxDf+pxR30unY4vCf0eqNpP/iGyHlZy74kCitleBUdJ4KUwXZK1jna1VXm5p3xOb+VupxQP48NxrSNLZs5Mwldeow12wW3O/G+i000A18im6jleMkj24LVDo9qydlTpjkj+iPVDD3BON7oPNaebFnFUecFyIX/sUiUIJazZMk1Mt43Ui0h5NzkL2po7DTveT0MyjA2MCV/DPFjQJxT8xxoNPuBpry0Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBaaVr5wVPge18dsK2Dnz9zxkLrLm/mC4VvF6P9wA6o=;
 b=XulEtIdVfRW77ZkC33rVyWhEMX15YEIFKR92q6qdDMG+DEnISwtzQ/FAZwJjxqX2sAeEaiMtx41Lk/I/Uu7suxa86QPUA7hXnCsziogUny4wUSweSdDIy2XXHUzqU0/PeaUfpCl3YKTKRfmxhkpmFrCQ8T3qPOOZnxGE1LqBbCH0OFzI7Z0Kb/Yc+KPPOsCde3GS5vWCKsor+XKDCr4O4IBRf2A+Y0vPUOBKtb3waFv32BERhtbKfltxto9xAFRqNX8ygdv0l88bRz09pIf6aJEIWRMQNPeemdYP6arvJk1BZy7C8+BsrJqofMFJO6hWhOwaQVzT6+WyZ3AqWsy6Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBaaVr5wVPge18dsK2Dnz9zxkLrLm/mC4VvF6P9wA6o=;
 b=a1XircNBLsv63ckunZ3qdYKNSJeCwpIQc57PnDsR5ySKn2kdCzICW3GYqAMiwabbQzT20HeItqTqRnn3H3clouLbp8NPInimKtmGWlzDhgQqzMKw4Yb0arrovSB6TKaLpIPqqVme5OjkY9ydJWRpMZy3U4e70ghbaI9ZN+H90YBI3B/SzVcWkLSB9KeAt62UD5CEDm6qsuxTvqZPMWeXvMRHbla7qn9bsEc/B93AKj7/F0IsXaFYOBd3eoz1gyOJ9fVuVHTwG/YnFfxxXAjY3nK1rVMVuJJnmsOfjGY/yMtCdXLZKugibUCDhuHT+QFjrbN8hrz1d6G7uX8LW52JgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM0PR04MB7073.eurprd04.prod.outlook.com (2603:10a6:208:1a0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Mon, 22 Sep
 2025 20:04:52 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%4]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 20:04:52 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
Date: Mon, 22 Sep 2025 15:04:09 -0500
Message-ID: <20250922200413.309707-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0056.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::31) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|AM0PR04MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: 04ab3e03-2c11-4138-268f-08ddfa134a92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d3CB5OmKJeN6zApp0lsk5mJEDtkYr96AQ2dEBBWfdtDE2fjxYiR0/foMkhAk?=
 =?us-ascii?Q?o4C1CYLZLGup5X0lqKUpp7MhB8bc/8QiCXOTBUKiYrz1ekbGXcXg57mNwj+M?=
 =?us-ascii?Q?cX0J41xhY9f2+Xuj8ZVUZPgnVvg/2qNqe+wvV2R0/0/eLtEuQfAp83oSjCU7?=
 =?us-ascii?Q?wk1qpNl0uOWpRq9FpuVv7Zhj3ZLplP3yBd9fIqVeO/2UI0Y6hfbDQFLZFlTG?=
 =?us-ascii?Q?8dd0RwRBMLWpRHeqFKRToVWL1NkAUSWd3yh4o5Kx26xJKxKw66ZAeqjzdVE+?=
 =?us-ascii?Q?/U0DqkA7CRzdxyipcLMM8JxOrZMSITYlmY/GDQmmRQm6fUt5atjBCMBwknAW?=
 =?us-ascii?Q?npE75bKjFohdzYdyfCmwMTG5ZCgqZo0qV6MDlTIb6poIiZL/xS1aC9res3KS?=
 =?us-ascii?Q?GAykKkS5SPY1/7SlPCUZnQkjlAJZ2z2mhiHdMvkXYmvCFQBK6YqE6uqotl88?=
 =?us-ascii?Q?gOREtNVzHgDTXzFinYQKEA4n+1sfZcsaq5GNE8VqXsE9SxFPGBH9m+V7N4ic?=
 =?us-ascii?Q?kFRTL2XYIZIX2BBjylCrAq/UFKb3jtC+2qRGAmJ8ujaYv9guWFy5DFvTqj22?=
 =?us-ascii?Q?UKHK/fsr8ItJhc9O2xyeHkm0u8BxOSAWhhonx39RLRSSoUflpBzMc5+WteOC?=
 =?us-ascii?Q?Vbnovu4pfefs7I26AGaB0RnpR0ZdbXJ/N5pCxa0OCsnD8Wq6+A5qWbZN/eX/?=
 =?us-ascii?Q?y/2ILPRfc44wCQpzBNXbAo1sPia68GjbP+o4unJ6xs/RX5g5xc0aAy8R3dGm?=
 =?us-ascii?Q?fj3t+vS7ThJ2AeMWD9DtFQQrNDPPH4K0a97G9c6LzSktIMCX7i5iiJa95RVP?=
 =?us-ascii?Q?Zln39/Nf9p3vFDkLmsY1BFdqBaAjoqOYKSFiTjZ2sXJSUl6zAvexnNcf4GcP?=
 =?us-ascii?Q?Q4lXRieLJEYlcz8vZ/k7iMFy9g0AP4qRSXMNNU+dvj3g+DpTetIpDOk6CIfb?=
 =?us-ascii?Q?4oj7CdIs3QHOpSGKD2UgcfWuMF0MABF78nJd7vKDcJ6IK7OgsQHtz9+RHOlb?=
 =?us-ascii?Q?1vDAB6G1J9SRSQcqyY4gTH/bDZli5Q3b7ppSepYgDkA+61V7RnieR3obTUyb?=
 =?us-ascii?Q?hE5GXx4gR9o8iefoj4q3xw84/dH0YX0wkaWPLw1VsZec/NakOd9XRdvk8q/W?=
 =?us-ascii?Q?kr2fmL9vM8YEdLMqKv6Le5ouAa1BJkqw51Qcqc5BhxuoGui6Uxxsq76S7uLI?=
 =?us-ascii?Q?Lm6eh0QoZlo/ICaltzk41hCUY2gjvzjU0OVwkPVArKkhXNNnOgFouIy3XFAF?=
 =?us-ascii?Q?eRu1Qtb+kTgT2DWiz/j2Rbu6VFyimOKTRtGQlYs6RfjXrU1ZulKtbFgTe0+t?=
 =?us-ascii?Q?mN99c+ttgw7Ha6sRBs7ro4h+Otqc9Tp/YCnaHuCLiTpl1k2lRBO8nmIlGGDK?=
 =?us-ascii?Q?6kbn5iU3sD2upuYOMxRq1EWgBkFZ6JXmE1IymOAXir6/F0mMPAnfyK+Uwh2K?=
 =?us-ascii?Q?4qGvIuBB59Yk9T+yJkBDmaGI3BqL7ZOW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JEYvNs0js40UkOCHgFYTiXcKfAPVsePIFa7AaYacuCM2XhvF2n4aXt5fvU3r?=
 =?us-ascii?Q?+u0TZMp7Vu5aK+Fem2MrAGKDE51tcrk4e2NqS8ynBRoVi63qUMXVohO0AsWq?=
 =?us-ascii?Q?M05BTr/QLP8H7aKaO8JDefjgDqDEEN8YHltvpC13GFdEHOxJ+z6N5h9pG6t+?=
 =?us-ascii?Q?XV+2oQoo/EKXHeeLaK9NQ5ZMsf/ieFav09CpVnzRQzzT8ACZcdQALvHY4nzq?=
 =?us-ascii?Q?tYjtDksnzdy6H/sQfpTkjomBZISYdyDTABd9v9/W1bLFXsT4sxOY9BobAqfX?=
 =?us-ascii?Q?82pX1jRAHIzwRdOdZBJ6y7/amdL7Y054BX8P5x/xoQBf02inbEcnKhnj5uje?=
 =?us-ascii?Q?ArGFdCBL1+exvcI8DlVwaL6uEiEZI/pg3ej7cR1sQPYjGOSYkgyUdV+WglTN?=
 =?us-ascii?Q?fwpqeQ1wCWRiEUgw65Je6LUoUgZzCOBxrNe9tR/cfsdV7VTXiDGbWYCyz/7G?=
 =?us-ascii?Q?up/5dtaURlC2W5Lnnm2xIZod0WZ5t5o14ekETDU17jxCdiUta5y4R8LSeV1G?=
 =?us-ascii?Q?i5RXBG6aDLxu8E6o0Z1oao02VvOzMM9mFtvsYB513j+4YB3FGJUufPxwtVKz?=
 =?us-ascii?Q?to7xcfvd8L6lxOZRN0WNDHG9FRzkg7ShXzCRgWXq2WAtuM6FYPhl5agG9ZD1?=
 =?us-ascii?Q?dbQW8gaHqmfilkxfP+66hmw7q5eDPDJXt7HgmnbhoQTFZuUx5OPgXnoi21d1?=
 =?us-ascii?Q?Y1GZZxmFbKDV4tnZTmJdeH4uLJ+n5AR9zQbHo6IfK/eMBk8yoVQIhPHmxsxi?=
 =?us-ascii?Q?vsFdyort0Y9nxekaktnumwcHShWtM2M8kK4YnpTIS3ST7cqdtTxXgy/UAJuD?=
 =?us-ascii?Q?Iz4on4mtwRbTwtwHkC+FoveijYsyouX+3ABWPyWOI9iDZQJOb9AWqHBHdSxb?=
 =?us-ascii?Q?xdEEerVCuUHbPIjQ75vdDfgKL/qmvFfg3ZGsyk1TLpH8zkNwnksXPTGgsdNp?=
 =?us-ascii?Q?X7mQUpr5TdXg43K51NQ/zusAExTW3058rGLfdOcyJOonjp0KigJeQMfwO7fR?=
 =?us-ascii?Q?hHTJvqXCT4dhkFXE5wflwgieH5ZWouFPjjJ/WjJN+EbKFxCmf9C41kbOwR2r?=
 =?us-ascii?Q?hn+4UYv2AyHBuQ2t4usQM5ZwLxXAeXiQ1MKDN3WW4KAyq6r/r2kH+XfuB0cy?=
 =?us-ascii?Q?Cv4S6sAtIgLUI8OJcxVfQfTa+5Pg75vXf0hUthkkQ19KkG5mhwnLbm41PgQG?=
 =?us-ascii?Q?er1xpIrwSqmV2Tpy8F64WhHHH0FBPOm4uLqwGxY3+geqQ2w5I8EBQQ0CtRwJ?=
 =?us-ascii?Q?eLBtseu+njo+cKFDZaoB7J8Hs1uipU8bFpWmmUSmI4qPYnaoZPQ4HptQtwNN?=
 =?us-ascii?Q?+726WXZVmG/5KsSTZ6teOtwdmKhflQzodDkU4yoQT6FqLCbzasj0L3tq37yk?=
 =?us-ascii?Q?sOYFo8OYqMpdPYX9HZ9jf95fYSM18PamhGPgIX3gtZXINwGremxsQwzFxyGI?=
 =?us-ascii?Q?ig1H2NZ3Ku2evqGVyZeQWQu86t2CjBVbl5tmbtOhJ+m7hwUf07vcF5StuRxr?=
 =?us-ascii?Q?+X50PK8SYWWzIMd0a1/nWMDB4EDjEpFGxxee8qJZiHWAP3XKvkouwQMSGsZL?=
 =?us-ascii?Q?xJFa9/liphMYjkI+gkhhvJce5aWtSEBp3OV92Uhj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ab3e03-2c11-4138-268f-08ddfa134a92
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 20:04:52.0744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMzcqLsP5SB95iAmZFk9bz3AdVg2IvPy/DG/hCKgdvGbLpYUqXyRPnN+Z4B0mLEfHpN+EOdCxRwdUJ1UNjBTJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7073

Support the remote devices on the remote processor via the RPMSG bus on
i.MX platform.

The expected DTS layout structure is following:

    cm33: remoteproc-cm33 {
             compatible = "fsl,imx8ulp-cm33";

             rpmsg {
                     rpmsg-io-channel {
                             gpio@0 {
                                     compatible = "fsl,imx-rpmsg-gpio";
                                     reg = <0>;
                             };

                             gpio@1 {
                                     compatible = "fsl,imx-rpmsg-gpio";
                                     reg = <1>;
                             };

                             ...
                     };

                     rpmsg-i2c-channel {
                             i2c@0 {
                                     compatible = "fsl,imx-rpmsg-i2c";
                                     reg = <0>;
                             };
                     };

                     ...
             };
     };

Changes in v2:
 - re-implemented the gpio driver per Linus Walleij's feedback by using
   GPIOLIB_IRQCHIP helper library.
 - fix various format issue per Mathieu/Peng 's review comments.
 - update the yaml doc per Rob's feedback

Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

Shenwei Wang (4):
  dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
  remoteproc: imx_rproc: Populate devices under "rpmsg" subnode
  gpio: imx-rpmsg: add imx-rpmsg GPIO driver
  arm64: dts: imx8ulp: Add rpmsg node under imx_rproc

 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 129 +++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  27 +
 drivers/gpio/Kconfig                          |  17 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-imx-rpmsg.c                 | 488 ++++++++++++++++++
 drivers/remoteproc/imx_rproc.c                | 126 +++++
 include/linux/rpmsg/imx_rpmsg.h               |  48 ++
 7 files changed, 836 insertions(+)
 create mode 100644 drivers/gpio/gpio-imx-rpmsg.c
 create mode 100644 include/linux/rpmsg/imx_rpmsg.h

--
2.43.0

