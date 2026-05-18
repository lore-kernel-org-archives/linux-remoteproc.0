Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011032.outbound.protection.outlook.com [52.101.65.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B243BB48
	for <linux-remoteproc@vger.kernel.org>; Mon, 18 May 2026 01:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779067065; cv=fail; b=YK51j4NUGY9PfKEf8fRS53k+iZlmn59xOU+Ray3kvD2NQ3E3UltCZSOBEnpHfoVPlsUjSZBu45xCnlTtbAz8oOsPXZpQXH0ETIIEbSwSb/zHRphj3AyBCUYSfOWu0Ecv2FbFjANjeotmc+Rtpp8WxU2Nx3rSOsthjUhjm+gBTYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779067065; c=relaxed/simple;
	bh=LPz2StI/9KrCbtLv7z8aOjRxUDUPx1pjJ2DTBR4yk70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FeM4C6m4spquxSaE0KTINg46vm4lXFe6grnwg7hyERNpF4L5el0cKtG9to/RoaEXtIuYLDzRCDrriEg+Z0Pajz/HNZSs+euoqwJv3//k3aRxEOEOURZeVcSun90mfCvLvvymRdiqqsWAGyAtLo/1OMXP14LyzWrzxKLSfGhMovs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=atcO629Y; arc=fail smtp.client-ip=52.101.65.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="atcO629Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVfZ8TkVVLs9pI5dOG8CQKJW8UaYvR5HtZYD9Ogcng4tBEYzr/ivREN2k0bXVL0Ec8CPUzGPB5EjtP4e/y/tlhd942m5O0QvnoTgRfLjHpLWZnra28NXVXT9fb1ki+f9RzBAX4JGxt2j2aHCzgnEK+qnpkHU9k3R9cMqlxzgWZ9Z85fDhZUHrEfC8l1+X9uTC7Hefpx3besMWlQQ5YHgaAjmN04aiVlxgMTfDli6mHo1s8a+i1dgHtSPdoeHINc0DVFkBhMy1ku9coSkNJm6pa14J8JpwA+TyLm5j+cuXu8W2kp9u2Mc8mE/SWvL4OMhSbPwvZMSUAWgAdwwKknqjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LPz2StI/9KrCbtLv7z8aOjRxUDUPx1pjJ2DTBR4yk70=;
 b=bHwZy6+qzVVMfvNDAb6TS6U0XyHwtv4vnAi4w0O+bVSNTy/P460mVHZEYkc71s6HTJPlcr2rldXGqi33V3GI8n1QgE31BoiL/gMkkHte0iDrGI5bCngmgbWRrTNzXOIwcXAyWIi5xRyd6nQUvrlT+uhZBeu3eUGsFOrsXVQPnoZ/MqeH2yGEATdkmRWQ2JCNIk6HR4vjFwfZZI4DcvF7oubB2V4f3MgLxyZ3ghW566ZS3xpHDyXYfRRisfnbhtc6wlOBRwtc/v4lLDKUyuZvXRdZ4NUzGjzYTpE/r5+eo61l1Z7V1ptX6hIGk1AOKytAWIOlqj9vZukjlvucfcq+tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPz2StI/9KrCbtLv7z8aOjRxUDUPx1pjJ2DTBR4yk70=;
 b=atcO629YZF95Ct2R+3QYQTMTJ4aL+gQPPyHkS+j+5dBI/lAqv0lUVJeONKT0DaXud2iU3WpHbPTh+/oYR/Z6sW3/FUc5b8C+GKrMB+GbouGVP303j1iMf//LwbDpb4oZeJjIxFeLu6jCnCD1nOk04TQbODOaLlOmR6iwEEneZSIVoWfzsi7WWwDHlwH4AxxPK7x/eWkwg8qdYPNdUKTWImR8rzcTmBPVqYwDAGqcu2U22YOCH6w1g3nHcsWa1l6gSEg8PBZK46yx8D8VXsPVz/o1CpLDESxlraYEmHr19MZ0k2VB1b2js20cSHWfvKZq4Jct7K7rurVvmclMo6AYwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by AS8PR04MB8087.eurprd04.prod.outlook.com (2603:10a6:20b:3fb::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 01:17:40 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0025.020; Mon, 18 May 2026
 01:17:40 +0000
Date: Mon, 18 May 2026 09:20:33 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
Cc: imx@lists.linux.dev, linux-remoteproc@vger.kernel.org,
	andersson@kernel.org, mathieu.poirier@linaro.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, festevam@gmail.com
Subject: Re: [PATCHv2] remoteproc: imx_rproc: add missing DRAM range for
 i.MX93
Message-ID: <agppYVRcGLwflwCl@shlinux89>
References: <20260517080301.24774-1-Zhiqiang.Hou@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517080301.24774-1-Zhiqiang.Hou@nxp.com>
X-ClientProxiedBy: MA5PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::17) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|AS8PR04MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: ec2a2ed9-9362-47b0-8526-08deb47b4171
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|52116014|1800799024|18002099003|22082099003|56012099003|38350700014|11063799003;
X-Microsoft-Antispam-Message-Info:
	gS+kgQgZG+6O1zmMt/FashYJWVTj6Ttk86zhfjGRarZpYhZByXnmo73KvlHzouql+g53GnSpKwaYWF8zAIA8E+vtds5holuGs5O3hXQqy6+YrRp96vtRqreyT0+X3KOXbPAKXPOgKtoZfrgGOJ6ysH80iDepbA78jQyx0Im6yGZCvf+ora6rjv1FBtCnEW7glsXmeRchaFop7GVJaZYZp2/pIkoXQvQKQbY0q3ZyMEQPzjcQVE54MeHui0Z82liQZrgCa4dKgQqNkHJsLbQzJuHpRQ0WCevPg0TdxdhS5N8SmypvwM3ts4W/kMBg5lpjLsCDh3k4Kzxzqud6kH6FEgj2eZNHkK49NpMIGfwl5OXrfzzCFuq14iDRIgA3HYRrI33+RUDpowVSL63s7D7cgGpxLOoj/mLZiqzwtBPAkOONUiahzrmsL6HVhXTlAecmNz2+o+7XggLuSmjEwkCQbRosyxqy6Lj4DBxIwrrjfAQtlw8GLab+Dg6TM6m04V1ZSKSIxEOmwSKlSGKFfkuw0BD+ZQ+2h8jWeKkvLuPXLGoQZu9NRo4juDjvTwwJO6BPKqcxZhiJsUGw0qxTRh10I781Yfs66fYpTQkjww1kiUy1uq+uwgPVeJ9bHNs55W9dno6KJa42A5G0zqwxR/xZEbrfrElfHYACDiuMWpMA1zEJA3a3hT39NaJLlCjAB9df4bySm7za0RImobTyEbAnynDiWN3ephWaGC72PKK+xKLEmW3YQW+C8duP4k3lhx8g
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(52116014)(1800799024)(18002099003)(22082099003)(56012099003)(38350700014)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Krgv5ioagnlGHUyDKwXLi6L9H5gN9sOtr9yoO32qb/+1lp6tI1UjclFg4R/S?=
 =?us-ascii?Q?Jz+/P63f7yANID31yn5CPx2kPT41W6LdNh14DMt2A9tD08CpP4hwsusK4LEL?=
 =?us-ascii?Q?B0W9ZH1x6DerCAVKbSpvaVpjJQJpC1XT9bcUHfnKklIRtnkwTI4evRkzXmrz?=
 =?us-ascii?Q?ONG0/1qUOR2HwycfZ9v1jziJ4wTlYQp50vHW6d2Jh7z2nN+haPjZKIZo3Z0d?=
 =?us-ascii?Q?uiWjxXZxrhztlsvkFfstdwY/HrdE/siMnmDLo3JXCh09Cvzm5em2QGPaRxV1?=
 =?us-ascii?Q?QI7NCpK/+riopSMIWdGhVaHtKMVnYUtLM8OuVQgGTjQKFvJc4wGP7nLdTl8x?=
 =?us-ascii?Q?DMzlQm0hlp+bTXYRlTrLCFD+Y39L+nIgkkLhWggfoXP90bo9+qAi8lip3Gzc?=
 =?us-ascii?Q?+Lrd+qFhzukVbRb1fyGVs0SifbwZmJexFxTGB/SxBnffsj3+xpZyK8/CdjFg?=
 =?us-ascii?Q?9QMPSIW50I7NV5bQAVn4FQyLasSuN7WsB9sxrD+YQEPuwmaJeUu/M4drJsIX?=
 =?us-ascii?Q?Hv28JhlbcTDsMM/eqYDKBUvwlojjnLuL9zk6gOkhiYqueJx8JcQdE1ynGGKl?=
 =?us-ascii?Q?qTEzBuplIWPvpTXseO1dwopxWMIPpghJ8U50+VwxTuTvnXeLNMiapiYqABmb?=
 =?us-ascii?Q?jQC3l4cnFXL2huyZz+acKIPIpwFDh+UpAjQ9zBGKQynJ7qu9RX4j6sJBdP/V?=
 =?us-ascii?Q?uPvbI3e9dQjQ2wua3WWrrwIxpD1aPxl4J93eLMt6D6/HVN2506NPZi05ly/v?=
 =?us-ascii?Q?VDex/0u3gronmZwGrgyO0UwKeo/+wmZoRpZH1U19gST6FJd+bvJnhHsQzcUT?=
 =?us-ascii?Q?3SsyaK/bvYlVpMGfXhDwAwID5tIHPbcd9+tTwimWA/1rGvwUWMqpqTU8yXCw?=
 =?us-ascii?Q?HuajagkGdIyyB3uKKGzdS+MgYh5WZF0gHkt9wHy8WIl5C04KuA9qFc94f1ys?=
 =?us-ascii?Q?Gy7SWfGjN5YpebJ5dbgR2y+V35lWCK0RGmXEZhtFnHkEkAyYxJ0B0DTvmI4x?=
 =?us-ascii?Q?DNTv6AVEkS86YLedNc5sRAmYnFmgWJV1iEaTs4P0K3WerUySrWsYaT/t61GJ?=
 =?us-ascii?Q?SiJmGMqOyb8j2wazYLN8SGRGBGhlzocnD/4JoWj3NcLDu4tZu9fcGsG5Hrht?=
 =?us-ascii?Q?DSuiAd8U4FK0GJPXZmObDseNCFl9eBXTqNgvTqT+6xuuw2DqX9BlY6e74Nzi?=
 =?us-ascii?Q?V5Q1QXWFlFJtVi6IRcIfx6vxlAqn/wPH62TcRQF87zzZBh696myoGF6MgxJ9?=
 =?us-ascii?Q?kzRIAYy4aOVOV3T0wBYjxOfryZnuWd3Yq5fwfX1u9/2p8NvarXePlRCPSvVw?=
 =?us-ascii?Q?ohOnQSsxyKT3PYEMGDqx1Trl4IcHbwrsihoMDy+hxTO64xx/0pDiQ/Jvsvld?=
 =?us-ascii?Q?WO+VV6QL0JSOmf9yDgG+sA41F+R4uQOz/x7CWJAEUlAnHGMup0yh20KpGHHh?=
 =?us-ascii?Q?YGjJ66gLrUUuFwFWICHiWa46xsD3yin6ZLx0XCg3UkorKuECTgP0W6h28+cq?=
 =?us-ascii?Q?CoBRv2y6Qpyq9cRe5aWhH/BdZHJgeYUKSoU9uofgWCu3AiI11Kh5ycgHhAwZ?=
 =?us-ascii?Q?1TRCj+zHP5ruY4QGDiHYJjWhBMwx8rVRKgTQZAqC8RTMGae2EhTlBCcZTujB?=
 =?us-ascii?Q?PK4aeSjhgJAZaIvOn4F1TbMgSHN2j+4D6SSHZrgl8ajEx06x72cFxDT+1JNW?=
 =?us-ascii?Q?G+0vcobKXL3S6PXsYVeACwIwkcOenBuvyUs3p1aFy/CEfO7M3Bp6CK9I//ye?=
 =?us-ascii?Q?se9oa04vTg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec2a2ed9-9362-47b0-8526-08deb47b4171
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 01:17:40.7609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8KW5A3eOjRk4opu7bQsYYcV3UAfnvxOoGOD9h36FXed0AMWQ8FKDGv30OQNkwbxpd9dDZg5le780niND+I9/lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8087

Hi Zhiqiang,

Thanks for your patch.

On Sun, May 17, 2026 at 04:03:01PM +0800, Zhiqiang Hou wrote:
>From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>
>The M33 DRAM view of 256MB ranges 0x[a,b]0000000 are mapped to
>0xa0000000 of A55 mapping view.

Let's add more details, as below:

The M33 DRAM address ranges 0xA0000000-0xAFFFFFFF(None Secure) and
0xB0000000-0xBFFFFFFF(Secure) are both mapped to 0xA0000000-0xAFFFFFFF
in the A55 address space.

These ranges are currently missing from the i.MX93 remoteproc address
translation table, which may lead to invalid address translation for
firmware accessing these regions.

Add the missing mappings to complete the DRAM coverage.

>

Add fix tag:
Fixes: 9222fabf0e39d ("remoteproc: imx_rproc: Support i.MX93")

Thanks
Peng.
