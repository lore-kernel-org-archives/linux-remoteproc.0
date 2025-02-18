Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2067.outbound.protection.outlook.com [40.107.241.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C14E266192;
	Tue, 18 Feb 2025 14:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739887547; cv=fail; b=thytsbshQJoDv6XHATzPs/9eetNQ8wmOD+Q6j4S5DM/ofGdAhW3B/Kf1oWaM1dGVqadm7YgQXQnXrRJFcE8zeWOwEa7nWdqlDkWElPk4AEYpzm9ro7SJ0UfGlX6jtUoVN9VrgMjNXz5HP9zJR6haXJF/rDuT4HSAw0egl2pF2LI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739887547; c=relaxed/simple;
	bh=tpmhKFRdYIWSP1phTCNgsmuwWEdIEri5o8OE++Pvgi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TXJ57mbkupgSkqPYDCeBX4clr55Eeq60b1CpkL8PkRh9YIc2q/r2LHGmtzwtEEG+aHKmQI3IAJIs+ALearW0ohborvasxqq6edlurtWie7DLyCbuaRtxr3/wuj33k1Ijtu6yTWJoHja4QVD+Ac7pF2qSJub4tpew1qe3FTNhfFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SOW7iJcI; arc=fail smtp.client-ip=40.107.241.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SOW7iJcI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tv+VxByZDVqaX5vkgLWA+iVcKnJTESFn4UNUFa2cGrqFJvP/IaxwU3n8kTnXtZCeLI0j58Ydu/JbQ9wCiQx2HMCq6l+OCQVM5djaO+x9jWjhhtANE0NkVU3qciRmyT4r/jibblPHgbR9Pc4Sv4cZAo1pyaPvix9TNuWPNB8sHSGDnx5qdEVHtAAqkl8ISi47c6SA1AxsKnvNmUrK2wTxtgxIA9hKebmPqbzLrn3F1yGz2lQjOsnGvq+tm+K42V/Heryp9leTjuHc2oekftlD6cctIMKLZ9PoHAymNUR1PixdT8X4ergJONuHBogAKvT1mh8AYWC9BcPxUwhtciXDFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhNh9+ZlOrYdoAZB8u5XvGgzR3OB/73/dbNhlsELZDU=;
 b=iX5V23dOFxvdDgVvWoohk1SoFejuXYd80H50EV/Xgp9/R07rcWBnYoiUweDsNcIpX5BQcDfPgzw+F30SxdrYIleB/6/Oy6DBrfvlkt4f98Pf9pp7SkHBveMWf7XFQS1DWetiI+qsUIw+VvfyNfpEaYoyrr6knV8v4ziHEjJ3ZSuf6C1VJrcDrirPngDs3cHPWt6YXoApObjFkmG9GoWyReNsasWJ7GPvdHJZ1ZEKSKqFlv5g+75kBQ5CO00f08tkk+5WSyel4CRKPXqMf84bqcEIqFMqmqDmqhQ4Ih20tsyC9p/YWJcVv7i3Lrg5L5ka3e3pEy1VhWWa6D28gmTChQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhNh9+ZlOrYdoAZB8u5XvGgzR3OB/73/dbNhlsELZDU=;
 b=SOW7iJcIHowaiSmph0Z5N6xfpfSYl+Jwa1QXFx7Vj+z4VGuwF4EFXdjEzy+F1gZ2ORE+xMHercFjpIVZjnqYk+ig7uCufXJXJv2PvCyh2bwCSGQw/BsEwbdW1TlKOwRpI04fsaT7+o/ogBPG2j2czJoXmYLUYV24IZdxxQaKpKfFzM4Z95L+6iNFgr0Xs6gu0HHgR51Hx/aBLZjsDC4vbst0IdBPZNNZn2TjlGbF8TEHqZ2G3sUO3KuAiAS8MkQDHuUs9a0ORj/hscQbcSPOnCbio7jLwn/ntsiAxsadb0RO9l0J0XzQGGVgQcnF9qZNzgXe0T6JrGU6u3oluXXJ/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by VE1PR04MB7247.eurprd04.prod.outlook.com (2603:10a6:800:1a2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Tue, 18 Feb
 2025 14:05:39 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 14:05:39 +0000
Date: Tue, 18 Feb 2025 23:12:43 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: p.zabel@pengutronix.de, shawnguo@kernel.org, mathieu.poirier@linaro.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, andersson@kernel.org,
	linux-remoteproc@vger.kernel.org, iuliana.prodan@nxp.com,
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, Frank.Li@nxp.com,
	krzk@kernel.org
Subject: Re: [PATCH 4/5] reset: imx8mp-audiomix: Add support for DSP run/stall
Message-ID: <20250218151242.GC6537@nxa18884-linux>
References: <20250218085712.66690-1-daniel.baluta@nxp.com>
 <20250218085712.66690-5-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218085712.66690-5-daniel.baluta@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::8) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|VE1PR04MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: 151252a2-337f-446a-e1f9-08dd502552e4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2dfzyYZwMk8+TZ5DN8OBI1nhuVCcqRvO0UBGDPNoDg4b6eA9UZ/8wFyeUn1T?=
 =?us-ascii?Q?qBIlxYB6ALV9xnVhUvJ1djJ4s9eDbGJqWoDGdhBQ/dLLMsmoHLFAjVKNeya0?=
 =?us-ascii?Q?ph+MffXhTHpvdeYcIVLDEk/d7EUfKl+m21+2XTXm0G571fOhNUFRiXJnv4UA?=
 =?us-ascii?Q?5aRv32OJG69IJdc30EKlB7PB/C3nVFWg3dLJV+4TPb/ga+6bw/8fi8a1nWGP?=
 =?us-ascii?Q?gPor8qrXLGZWYg+mPynTiCYQzekp2JRahn46FBqdwhUK8xulqQHGrkc39U//?=
 =?us-ascii?Q?FBfuadjEFSvAFfs44r6s+8mO+e8z+XCv3W+uQrLyi+Edn9QHcE95Uxl5jygU?=
 =?us-ascii?Q?f2gC/wsGdFXvx3Mt8H2J5+HdTCA5p3pKMpfnq/VyoZaBBmAEz5r+sCruIE44?=
 =?us-ascii?Q?qgTIbHj2W015x1Lb3Dx0mOKLfb4D3dwV/h4CaQJ/0ISDbp5k7ksPEnqtr8lX?=
 =?us-ascii?Q?rNOg08oP0CWP2+IHy6lA8vQwfDGhvwcrMWyZAvRQymI+0xUzG7afymN008Ur?=
 =?us-ascii?Q?MBG/MlRC7S8ociDSJN8wHxUrVtenT+mWXqfUJlEl0h6Mov0tRE40cEhx77We?=
 =?us-ascii?Q?vxNdr6ZHbKB35mXBAe1uJPf+SeP4oWxB555jee0MeRukKV9Y+j2BZfdJ/UXc?=
 =?us-ascii?Q?W/IOGg0uV1icu03giTgp04a2ib5vG1bwOuDQpNIJu9AYjz2YGt5flQ67QYDr?=
 =?us-ascii?Q?+cou2Pyv++/D9s/2MQA/fh0vm3KapOd2HdlygEgcE2Vjws5GrcULpI1HTiO3?=
 =?us-ascii?Q?+WXEfjdaLu1Jvur0Ggb+qa/h8ASZsIi24Gj+o5h2o9W1Hy7ztzKGUG0bZcUv?=
 =?us-ascii?Q?dKkUV1vQpF/7AN8t4yiA2LzjDVhDxlZFR27gSJv6Azl16i8ogb5ttGrLCOca?=
 =?us-ascii?Q?gIX7gL+xw/Dx/K6K9bgim4WleTQkyENk53QPdlTh2G/CmJGXaC12BmfUAqXs?=
 =?us-ascii?Q?E+yrLhHQlIVCV7N+gY09GJ8R3l5S1z5PtfWZk5FHYbm0zLPuUmZy6qSs9dI8?=
 =?us-ascii?Q?csH7LVHEelLmkt32bjZHszgfXN21sP887Ggr0l+lgW7Zt6k4YFh1Y59BVczm?=
 =?us-ascii?Q?vY0wNOztlKJA/mCxvpAghQOWJJD0UU9XPaD+BNY112ZsLNghZo+0dCv2vcMg?=
 =?us-ascii?Q?lUBcECyN3VkCChoh7Vt3jcS50GvNhp6IOxe6GLe/Hx//t1XgrYIvycmtxMWd?=
 =?us-ascii?Q?xBeaq4zbzXXniueuybuUqH4HP1UeMUffMPKDWUsUs+mwnjk+9NELozEaGE1x?=
 =?us-ascii?Q?LPUO3CyOepea3WkMTvS5ZpKCCcga2+0yCwhu79sSV6W/Etpic39apiQlE7kR?=
 =?us-ascii?Q?Rg+ol2F06yTxIG9JlgClgXuojRM9BwWZSkJPdnsDqPEGsZLyq8NfQMs8m6o2?=
 =?us-ascii?Q?8zvL9PsIfcxllwA5dt0j8qX/tHYgLonRORuMn6hAOneBUEGAxJ84qIAwvAcV?=
 =?us-ascii?Q?hPMBk5VTJIE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K4kxB2QcDhquFaQlzGDfXxrBZLTqTabQFh59DokEpETyCVD6sQA1D3sJAKE7?=
 =?us-ascii?Q?zVET/1EtuT3cu5wIJWKFsYG5kU2h3ZYhULgUcKisY6tZ86lef0zS4tPbwt8q?=
 =?us-ascii?Q?OUucDer4f4jl7gHzoa/SLWk3NtzY3vtM2wXnxA/Pvt198lUA/QgLvBDellvl?=
 =?us-ascii?Q?SCUZzRyOhzGuAri/M75l+yrOpcTvmZ5/IZ2cOXO52iq9yXJl/skzKE6Jfng3?=
 =?us-ascii?Q?4P70YCtDGYNGp8lZfr5OGmkxFts1YjQXs9hc90dYCW49kTWb4HsO7yXNKNjE?=
 =?us-ascii?Q?sog1T6UC+AKvumX5X3DVKAOCqaBRSc7CDZT/bue6FFbhPA+yOIice2MQtQW4?=
 =?us-ascii?Q?jO+MOrvRwX3ayCyzTMQCV4AnSkWCrSZojSL6UNJq9ME+5Vwho1IbEoBZAyyx?=
 =?us-ascii?Q?F4E96v8JHNX0aK1aaLQnXVkHeqh25ulisk0B3qZROQxxOVMPFQKz7JLRtNJR?=
 =?us-ascii?Q?8EZqX87mMeNGMALPDNFANINX767ZYjvVhBIld4ZRU+nXkYr1KMYIdj4VpSnS?=
 =?us-ascii?Q?i8P+BO8ABEgjhWNbTxQnmKyr5v/44I/BiKSXy9KbAaR9DUisCIxREAm2Rn/0?=
 =?us-ascii?Q?8GisIxsvDK4tNlL+vquJREFAlwXEwovW7A/DoqtxGJ8MoGgTYIKY1F1qeYGw?=
 =?us-ascii?Q?9jXQVMUO7Az6RRfNI3hriOrUY4Q7TSYuQzxVWPb3uylIXP1z2I8AkZ1sXqYH?=
 =?us-ascii?Q?PCC9t/6Vrr95dHiuw4Cecwfq9FHbt7KgQMyYwpJrBjWDJYgRFkr0MWS7b+sw?=
 =?us-ascii?Q?o8VP8BvF5GEVGci6KejvSfSR/rSN8N3g1XDkfq/NIVXxZbMxfD4cn1qjLqk5?=
 =?us-ascii?Q?M32TXL08jgJlf4DYg1/K/4r9Korc7h660aEmRrpJmGolGx/RZYXLWU/xdqpY?=
 =?us-ascii?Q?N+uhfntrsRFdABajDJh7k2a7/ZSt1Z4L+gxxmKFwGXH/3FoqoxtupvAOFaMC?=
 =?us-ascii?Q?iB2o9dOpT+9jpC59GGkc6tA32YysUu0tsvylTTTrCtCgNyzMdtTRcgJAetZb?=
 =?us-ascii?Q?y0BHpPtyWIpxCjC0FXU13PyLhtalFPlr2pM7WTtbSueVOAe+ywGcx61kowpL?=
 =?us-ascii?Q?txmg5fo+V/FecsDmt2v+NNFssYkgTkm9jbjIi85sUl8RpgFASB+cwpO8NT49?=
 =?us-ascii?Q?YnolW+3Wh/+/7jnLFKboyE/l3wFJV+gOMcUBrm9WwxrQKA6C6m5BRU6nMbku?=
 =?us-ascii?Q?b4Eazk8wsdg8eXuy6s3AjJr8wtMzHmwz/Gfi+FvbKLh06qpwmXGeLJgdpSw9?=
 =?us-ascii?Q?7861D9yUFAaVRMkucaVX0+60mCTJLCvaiOAFJkmRG5bHX5rtutqldLlf0uCv?=
 =?us-ascii?Q?5MCiC680DlgOiCmV5YnxaVbEFMbWGqQdzvZDMHTTHiPqBb5gIIy106L8yD2x?=
 =?us-ascii?Q?MarShA56b0sQMHONakrS13gKz/FuI5tq5meWHHpgKUJVaIe1SKtWUpJA2HYN?=
 =?us-ascii?Q?cgXkp+x9LvERsoTVBELCFBwOcgtjB+H+0TLwRSqwFuFrYsbupvVe/U9wNbc4?=
 =?us-ascii?Q?Q3nfieyqtsH3VWaa8SRa0+c2ko8ENl2+AIF8tGI6S19ab59wfyIQd1EhCulm?=
 =?us-ascii?Q?4xozSihdPcYqedF5PZzoYtE/ypHLZSaSL/bjc6Ty?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 151252a2-337f-446a-e1f9-08dd502552e4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 14:05:39.2634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2pECEreAivJLwoURIy7ydVa+fwe0IPmZUh+dkMUOdIZkOhsl2jjwn4p4hEO6So18liTMxmk70FbSpfnGfyyt3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7247

On Tue, Feb 18, 2025 at 10:57:11AM +0200, Daniel Baluta wrote:
>We can Run/Stall the DSP via audio block control bits found in audiomix.
>Implement this functionality using the reset controller and use assert
>for Stall and deassert for Run.
>
>Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>---
> drivers/reset/reset-imx8mp-audiomix.c | 12 ++++++++++--
> 1 file changed, 10 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
>index 8cc0a6b58cbc..ee56d52a7278 100644
>--- a/drivers/reset/reset-imx8mp-audiomix.c
>+++ b/drivers/reset/reset-imx8mp-audiomix.c
>@@ -15,10 +15,14 @@
> #define IMX8MP_AUDIOMIX_EARC_RESET_MASK		0x1
> #define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	0x2
> 
>+#define IMX8MP_AUDIOMIX_DSP_OFFSET		0x108
>+#define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	0x20
>+
> #define IMX8MP_AUDIOMIX_EARC		0
> #define IMX8MP_AUDIOMIX_EARC_PHY	1
>+#define IMX8MP_AUDIOMIX_DSP		2

Move this to dt-binding?

Regards,
Peng
