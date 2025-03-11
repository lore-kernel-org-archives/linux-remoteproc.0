Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FF72356D3;
	Tue, 11 Mar 2025 08:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741683424; cv=fail; b=HH3aKzuJrXQRQd1ObVR72MRp7z0q4MX50TO+Nh+CEklqyxt5hNJbsM7MXZtynkfPVfycS/uC5EtYaOipjeyeSY7w7RI7vRiljt1J/kgKp30+mqWCc5fcSMA+TFKRVtv+mLkBddrtQFXGVlmFUoN22CZNPpRLWzlGmAKDetJqcM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741683424; c=relaxed/simple;
	bh=ItY43bE0ko050sg5tgwN5IPDZwpU1n+lgESLQebtqw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NxDybiMQGoC8G174bQAqAEA7yEvmmyBS9XkuMGO2/QnXoXidbKehYNK/mGIMYAwoWPRZT8kJn0dpmgswl8tXetNbLeS1jQ98cesZCg76Zt/EqZwT2EcXQiou7ii92giC3KO+yNTO4i3YBuam1692DYKGNb2J6Q1/19fryVDZcPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=i/tEerhw; arc=fail smtp.client-ip=40.107.20.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="i/tEerhw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bIqZgReQu2DhcDBMwv07ZwOoiHcENsX5eqnUatJZvfFqr/iJ55Vq4HdR6Tpq4kzzRSmt8hZ3T+3Q+aaRI1wvBK1VmufbOeKmzcr3/h7iqke7SAqcugHAapcFSWO5H5GHPR+lcchR/VzFpV8rBlfu5hiswWNH+EsKb2wI0PL7WxdHe2jjBLaCaJ9OgFY8ZX7w83o3iV9yd7+Tgl5NC74MkW+TOOUEZAzPA8pD6+lfpHZLsYtMKj2qCnsQY3FRY681qThHor3fCX36Zzg3ACWxS/QlG8Oq2dMNwvv+lmtv/3bOZ60440/w+aYtV5U4I+D8aTkx6be54cab7IvI318hrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X5yLQQyCKRKWKGhz50k3aTGPZJNrQSMLk2f55agzQhU=;
 b=jepwll+Ux46VkEmITYtglO4NjnZNWBnqg2GtPz5dbdToErsQq89joX72nG1gEIG80XYZJvXyBPbmFALfXZ6rIdRzbII9dbng6dwWZMGjGb/jhZ2awSJIXscARCzf+htAfTNTjeUGddb3hVjBnEQnBuDIxcJwAizirieSAJdnEDlFedGB9dVKH2D+jb/k8yyUbni1o5YfJ6N5WGPNZ6eLAB0DXlIAVGW4nFK75WIpnafkdT2+6yjGm4sN5JVXUGBujQRJ3tezFGZ5AR5MlyslCB2GqgnNox4xYNclK5qoQM0uxsla4IeBEobkFyf/pIHFsCUmu6SG2HRt87fQQnYEdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5yLQQyCKRKWKGhz50k3aTGPZJNrQSMLk2f55agzQhU=;
 b=i/tEerhwcxPHWf1zvu57Gng4xoEr1uZ1ESKtq/RB72zcZr0dIiv+UcaCbooF/8yXJvdVDAeZSQv8If+YtTDYNkEvGSRgR7l9C4aTX0iRIm66qxNz1xXEy2KeCkjguXjpob/cDM+zfB3unEeJ2lzvyOGeyAE9tbvPhDTFAkYUjJKDaZGLHN52CHbcfAAeUR/tHPxl13avD5QF4QJCAQssduSKZhrdhZ/IZ9L5Sn2HeBrYaSbLI1EjnZ9CgXYFEsU74F26yI+pXXVIX6sDLm61vhYUwyme3Ts4D7xVZkoJQWKa2AWiTmHgrgboCFBh/uB6WuIwrfV2UeHsDlFE50W9Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DBAPR04MB7431.eurprd04.prod.outlook.com (2603:10a6:10:1a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 08:56:57 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 08:56:57 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	shawnguo@kernel.org,
	mathieu.poirier@linaro.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	andersson@kernel.org,
	Frank.Li@nxp.com,
	peng.fan@nxp.com,
	laurentiu.mihalcea@nxp.com,
	iuliana.prodan@nxp.com,
	shengjiu.wang@nxp.com,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v5 3/8] arm64: dts: imx8mp: Use resets property
Date: Tue, 11 Mar 2025 10:58:06 +0200
Message-ID: <20250311085812.1296243-4-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250311085812.1296243-1-daniel.baluta@nxp.com>
References: <20250311085812.1296243-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P195CA0009.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::14) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DBAPR04MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: afae5431-ab5b-4b50-e842-08dd607aad8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P7TaGC5t7Qds5KPZ8j57P11AiRY5FRMsV8bCxvvv3+NpjGhtlzGUmzcXBVYO?=
 =?us-ascii?Q?67VQ07uK5t50FTDIB1la8LRQLLcaDMAAkB3bTgZyx0uvwdi0gbpJY05H2eqA?=
 =?us-ascii?Q?9GaP5+J4aSQqtJSMAiFULTX/0UQDVoGUX8HMvdM+ujuHfPd2sXFrNkc4XQpg?=
 =?us-ascii?Q?ai263y7wV6kKyGq3fKq+9jWcRRl76229qYo1smCMtJ7znNSeFJbSui0qGTCv?=
 =?us-ascii?Q?zQAj2QM6FTuVoUloparrNKbhBOJjlXOJTyc7MjfqnknG70cueM0417XJTKdj?=
 =?us-ascii?Q?7X04gW3SE0uo5vy8sN2377b3Sszs5BPcnXy3SEucJZkLOeRh9IhcmU7QfiLP?=
 =?us-ascii?Q?mn9OZnt2cV/r1QZw173jk7SciN5NXKziUnKVgpzr5znrBGrOwSDN5kMxVTC0?=
 =?us-ascii?Q?IyQZs2o9QjMmtjlPCWzWz5ufXELkj/URVoZYZzzTv4alZRo2588RTMGQrTId?=
 =?us-ascii?Q?2Tm9r+bOWsTaDz96PYzZz6pzL0WiWmpKNCTiTdWTS0VNjbp0WmaNRmXYFM2j?=
 =?us-ascii?Q?Ai6Tknn8p9TLFExHRlPeAVMxjONn2B0Sx4jcozIZi3kjNAPBIalcRqg592+k?=
 =?us-ascii?Q?PXUbLl2vJDcXnOB8W7iOz/4JqepqP/2nTcPbx3jVLYp157fs7kxSzGuW8eEv?=
 =?us-ascii?Q?gu9fzMPkYGR6mkbgkPj1xtqvDJoeSibsWqf2FqLa3z0UHfu7Jx//4ntqEvlw?=
 =?us-ascii?Q?e7GOeO1LuXKLxf8a15bjDNNhlsaMQHXsNFPeapqg++nrKhc6Yrq1WWo3Ht4q?=
 =?us-ascii?Q?6vt4+xtasKvQ75uwpeESkND0J6SB3lqUsgDwX+c/NUq9OZQjv+uplNnHpqWw?=
 =?us-ascii?Q?D9Fs6sJre4Svl9ithfEo+9xnvVMjm+xgLhd5G0uzAsZJtpVqbTnLbzvlh74Q?=
 =?us-ascii?Q?7kOF6j8ztCLcuFpKAN0N64Kpd9P5iV2Uw4hd4qw1jfs356NEfsKnA68GGsId?=
 =?us-ascii?Q?W/v+qJWkwMqSBP1VKevvNwwctVCdal/tDRJYnA5iyT+k/hx/OSuPDw3yQAEj?=
 =?us-ascii?Q?wMSbdL8uii35dqVNmiaGR763Lz9I4PY+RFA9G97oHzGtF05XwT4XrS8LlW5f?=
 =?us-ascii?Q?6m+S2TRnFDElnnu0bx1xNQhuMN56RQklfAvR7jM+4aPnen9VQdHPr/F+pSbJ?=
 =?us-ascii?Q?axX/NREfXEE0jCyKz5IWs4Wb1x87QzORALkL2eErLaOVhz+jsaZ6yg+jgvOg?=
 =?us-ascii?Q?KkEts/mfmY3QZpA2nHAfYCtK6VDungZI+ycfryCycA5DqMXqg+s2rQO0HcZ0?=
 =?us-ascii?Q?lS6kmmtaq3eTZfZH8VhxiXaJJ9zlj20ZOtztQT772MNVwqkO0G7HbuXwwAWF?=
 =?us-ascii?Q?zaH3on/G9QUp7qMtSjedtaXhiHBe56HcQ/Kezqwf1LH2C8FRqmQ3DKJfPi7B?=
 =?us-ascii?Q?G0VRac108a3oP5U2Wz5iLMOYNaVrTCjl5YMPT6ZNeMzqUesj8z9Nx2h2wqwW?=
 =?us-ascii?Q?TXua34AL9I4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LTUQLAObLLPVTskYjOYpAZzcnCIb59jLt9gL7OioSHsN+RtGGoexS4ChCA6Y?=
 =?us-ascii?Q?4LTdJi7aZWVXFfGvoJdHf2rZt8duXADcAelsocwxj0ryidUsn0nNp/leac3x?=
 =?us-ascii?Q?/Ppu5YGsXxf2YSm+xNoNl6yoR9TJV6VPOWFBgZGcsE38RhlbZkZnRugorkxZ?=
 =?us-ascii?Q?WYbuJjYTw+4TAaoV909dgnToPNsZB5bt/BdurbvhMRsbDjJWwT97poL/Nxg+?=
 =?us-ascii?Q?uClneLDNcuAVx0HfOEzf+U0UXHHZJ06ELH0M+epR6R/QNv2RGo6PHiLgpBt+?=
 =?us-ascii?Q?khVlIOAvuqOIH9gMsNeEYjhR7p1F+ygMVxjgYwjgj17G5oulQqJXuo/ofW2T?=
 =?us-ascii?Q?TLr6cdlEpuCTeFbk9vAAC1R2OO7ItLNYvwQkT5J7fuSS+uhFDS8eE2X1YUUn?=
 =?us-ascii?Q?F9VQykQMls4s34VmADhbLCQs+cgX5vaOCdGdE3fjwozvXUR06Hz+XsGWzdTN?=
 =?us-ascii?Q?bKYfy04LgMNrLp227vlaopLyg4ESscJqVURR1yJR/2Lp9TNRNCtE2srB3Quw?=
 =?us-ascii?Q?g+1FEkXlPbtMplpNy1bNWH2qGwM2pST1KppIRk674JJs/nfvLhjrbJFeNAcs?=
 =?us-ascii?Q?VDwVatmpjlMOuCREiwv23QpobsM+R2rMKgcX9YLTe2axZDBJAWGHc7aWUQdM?=
 =?us-ascii?Q?E4zOUAEzoJ7G47VF0AXupoEW1O4rKfov+VvKs1jinzewEun8ILoGm51mRaqg?=
 =?us-ascii?Q?/18YxuwQos2CICzZ99lsaag52UMVJupsiLCIL+PjEMwtbc3Enoow1OEziK/4?=
 =?us-ascii?Q?Ux9KfxqZOYGTqCOgG8VJvqSnbmEjhPyLA3WQM4E54ONbWNfpOM6dUbCjK8rL?=
 =?us-ascii?Q?KcNDk4g+d30J6K6zl5EGrKv1cvCmIlV7QVPReBVz+4Qp7lNGWy8eh0cPFUUH?=
 =?us-ascii?Q?s4U8azEG2PDU+o3lsT2Us6AEvwJWVKZ1eN9/iABsd8kNY0q8n89s9T1KXN7k?=
 =?us-ascii?Q?0CGtQdo2f+fUBs2x+aJAKjmDGEClQI18H/3ANluamKLpsC1BWu3U8DpCYkr9?=
 =?us-ascii?Q?pwcnSEAIyQVfOD6AA4gpVOacAa4KO+AsZuGqcseSYK0I9DP5nEvvDg6W57+f?=
 =?us-ascii?Q?5MyaTfySh+H4P4PKPLrfNc7twpDGvNN26BbmEq0gcnyG0FeO/JZ8G8jezgW6?=
 =?us-ascii?Q?HikK7OdXaaEWsaZdw8kjIREqyn/AUCLMylp8EUdJisSHW99BNxxLgi57XQuo?=
 =?us-ascii?Q?eJcXKTxG47n4/ZXvuz+K4fEHNQ4MEVW6dvdSiXdOh44GtYprTnRQr2sboaUp?=
 =?us-ascii?Q?eHCKR1qSy8b3+A1QKIEITBuS29zvklNt07KJ4trEJ37U3xPzo7vFPkWIMgpI?=
 =?us-ascii?Q?+9Owf2kgcTSt81MSkz30z5kNHCjws0GWj9U4VU/bq5cx7pTRzbE/t1DtLYUT?=
 =?us-ascii?Q?1pOyeX3/12yOgADP+d7DxY3zF9XwsVb2xzW6wchMPvp/UCtqJXl2eQt/JWAh?=
 =?us-ascii?Q?WjxjuY1Zk0X2Z7m5IpqrC1dAxkpz+WlOttUP3zQtRjGJoJ+E5dUxcgzJu8Ce?=
 =?us-ascii?Q?WxdMUwNHJ0YiK/RBf/6DvE6bXmEvdQzosCOcX8hmQowhejO8wvnqe4FMv2+3?=
 =?us-ascii?Q?GHXGjDOTKhQSYacAAooKLQafTze5agrpRB/z0gaz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afae5431-ab5b-4b50-e842-08dd607aad8e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 08:56:57.5351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BlrD1zwGWM7GyPuAGOSWJdMuw09SVA93cLzsmM7N/L1cSzXxXC84hT9gaf9w6fRsompgnJG7cu3xH2Mg5U973Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7431

Add resets property to dsp node in order to be able to control the dsp
run/stall bit from audio block control.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index e0d3b8cba221..90ecee81e465 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/imx8mp-clock.h>
 #include <dt-bindings/power/imx8mp-power.h>
 #include <dt-bindings/reset/imx8mp-reset.h>
+#include <dt-bindings/reset/imx8mp-reset-audiomix.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interconnect/fsl,imx8mp.h>
@@ -2421,6 +2422,8 @@ dsp: dsp@3b6e8000 {
 			mboxes = <&mu2 2 0>, <&mu2 2 1>,
 				<&mu2 3 0>, <&mu2 3 1>;
 			memory-region = <&dsp_reserved>;
+			resets = <&audio_blk_ctrl IMX8MP_AUDIOMIX_DSP_RUNSTALL>;
+			reset-names = "runstall";
 			status = "disabled";
 		};
 	};
-- 
2.43.0

