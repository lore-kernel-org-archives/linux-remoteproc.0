Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010047.outbound.protection.outlook.com [52.101.84.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC70218A92F;
	Sat,  9 May 2026 03:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778297378; cv=fail; b=K101c5LWz/IanY/33K/n/edXbWA5I0Y6actF5s9u0FsM5Rw/5qOhVk88uF+0iWEpMxoxhZlCqBNii7fwgDf8xR4J/QmlQzdjrQcovK9WEno6XTJ7Rav1c6chvhT3fBpgr+lSDVA6n5YHRcVyvkv/H0qJWnkU+S1XK/IYHn6M79s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778297378; c=relaxed/simple;
	bh=o6p60fdDtnOzmXx7pO234pupMfnTUCZ0iT4hGZGHN6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=empVzafQpzng0KVY8dtl/zXAYXvRRiifkd7f0qXsc1RiU8vqQtPbViedu0ATstA7EMOsm6Cy/DwOVeRUqs0ywVQOc1dv9SFKFX3B3BQKYbLslhorH0GsQlcn8tR2Tq+ERSQFM1zOKgmCQp0DCIRvFPP9UHS98GgC9PD+FHGqLAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rVm6KPf2; arc=fail smtp.client-ip=52.101.84.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rVm6KPf2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRgZwK4hAoWgX8O+lJuJr4yC1z7kF6YDwMxAZk3xiqx36LLHXdU+K3lS+o1xQ6TO3oDH3iHK+H/LRJ+4/Ab64w9Qe10lX2bfDAoaHbHmsNIs1ONPVbjpiJc8itpHrLTkh/aconInhc+CYfMmo+QYyuCDcran2o+sQhA8nDb6WoFVBCTBAzQpanj6Mc2ziK2QBEBcVCKXtVmik+4PhB6001RhFNeXUolDPywTAFVqi5WZjLihubwgUeLlZkfh7+GfJKWO6/Lz8+kpTWWcC4wBTZR4fMYADGl5TWOi2wOTn8q5inS6MXAQ4mKNb4E+dM/TNKMnmCpjUZ7C/x1iJ9FZyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+MrT6xe9/NVAluMgJJpH7mIxlbkoQNQVY6yAySGt40=;
 b=qVoJaRwjHIJa7W//GbjEd9qt66yooMibTdcK7PFyZiFe58i33YfdT+lvOGwkk+v8mr8ogscaeQ69599dPMwlMMAxfvb6z5w1cZvgHf2BGZO8WNHBBNhhM2BTZl2/ICkNc/w0fRU4punXylAm7LsZOpl51gTAip4D3aV0mLKjeqtWi6qK9dUiUnNWGqWT1ks1XbBiIaxkT1/9Rs0kxIzURKid+iTkTACJl5XHCHBuKB1eV245Hd/K3L7xXFFoP6mVH8WR2KKqPR/SnGaP1dXqhJOM6SwZrLcSN7ZwAAjpz//btUATXpCM1wbAGXsFgHjlm3fC/r5c4Qh9tvfEd7WXhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+MrT6xe9/NVAluMgJJpH7mIxlbkoQNQVY6yAySGt40=;
 b=rVm6KPf2vR9emjf2U+RdvISeORFgqOCG8fNcSXckoIVTmbMn6AoYm3wcUXL+yCp+nv4J2Sb1cINpb7RBO+8ydGTYKDenlY7qga2Hqm+fRgsDNRsD5gzlt6KcIITdCmCi1EsHD65o3s96L1qqyJLdoq8dZwTxEqu9C1kXvgr49vI65S3zRJVNrEZGVMIUN/LMiVYdWXgHkPlFSMBk2RlUm60NpNQSF/fup7iM6YgBAsiT43Ar8gk9iJwN1RqaOtPepdBUtHK0jxxWtuivdfqxAcGkDekx8MetpQgopcdWRoTGix6K7HxfcIukYfnIYpq7EDBVaOQ5oKzPJOlxGrSL0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by VE1PR04MB7469.eurprd04.prod.outlook.com (2603:10a6:800:1b0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Sat, 9 May
 2026 03:29:32 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.20.9891.019; Sat, 9 May 2026
 03:29:32 +0000
Date: Sat, 9 May 2026 11:32:13 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Jiafei Pan <Jiafei.Pan@nxp.com>
Cc: daniel.baluta@nxp.com, Frank.Li@nxp.com, andersson@kernel.org,
	festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org,
	peng.fan@nxp.com, s.hauer@pengutronix.de
Subject: Re: [PATCH v2] remoteproc: imx_rproc: Use device node name as
 processor name
Message-ID: <af6qvVOl5teiQH6t@shlinux89>
References: <830f0c65-faca-4843-a6c9-693db7562037@oss.nxp.com>
 <20260508032016.27716-1-Jiafei.Pan@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508032016.27716-1-Jiafei.Pan@nxp.com>
X-ClientProxiedBy: SG2PR01CA0151.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::31) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|VE1PR04MB7469:EE_
X-MS-Office365-Filtering-Correlation-Id: a3cd0999-0042-4fff-1fb4-08dead7b2f49
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|19092799006|1800799024|366016|22082099003|56012099003|38350700014|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZrV+lCtmZZk0Gb/YmaeUGqzFbTfkvBNgpojUovqS7GbrmUpF/mT4hrmMp2iDm8QV2GRDp+YhM+IIaGBoszDSyzZ77PTGvZ5On1SRp7khR23x6Ag1dndfPjCxOGs7wRs/65QSWikxIZl2vOiaSgJjXq37QikWnof9IrHldfvPUoyEY4AKmSOIJD/R8RrXLL2LpeVXePqA/rKUS4kn9frrdpgI+qxZzr+kO6p4OLO184G+Xb0YOSoeWLAmcpQPbsnaAbCt/nNE9wz5vP3ya8bXj2rUKJVsHk2+c/e10dcZL064XI6Iu39sJqrq4Yrr7kXyNqr5zOon1g2Sbc2W4GRZbqQGzKno/KftjhurE7C/+ODQ8bNVwBqZo8h4MU5KYo1BIj2TZDZDNqdkaRBIXEEWMwxTRs82/uJer+RINZoP5uTo0C7VPUPlM+XhhDJ1a5Srx/DNb2TRLsi/qL6bFhUxvvwBSp1cijjC/7YFbOtdKpcKKXD2pDp7NAwII2VhhLywGw6Hx17sbl8qgouvwwze+QZRj1tHZ0PavbsUi8hWRpF51jHiB9YyUWlJD00bfnL6l6wCjPVIm7IYs6cEarRDEKJLsHDKpbiyvSL07yOfQfjQDME9qP9I65Fhyl6fEbSC9YmOjaxWdoMMRn69hnpzbxPFqr4c2+GBsZP4ADyCtFDHzQqMDxPGoMwdMXZ13PsgCCt8NEg9CmH+cCNksjH9Ww==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(1800799024)(366016)(22082099003)(56012099003)(38350700014)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+9HnIhrbtr77Q63nYiiQ5ZaxfUjyjZ2KnbHjuIRsCavEv9XNfRS2mnP2Y9Gh?=
 =?us-ascii?Q?YgjVoO9cYTVG0s+bmlPSgF5xLdKnOc1pU0nu+tVA4hI47f5CjhYemy3tjqxy?=
 =?us-ascii?Q?xCHnvn5mW54fDwlVflJ0lFidk6RqBfvq5vBMTRKGzNGyRA7M+GV7L9uKMeNy?=
 =?us-ascii?Q?xPCAwayjbX/1G8R4AnEbjer6UxETPzdVxRL1s69L9ga3rKGRPS7qqaNJbl+g?=
 =?us-ascii?Q?0tZ2xBhH4dgMOV4QGg2AwcMhPmlpKGVCxxwFlJdGfHqcJqrqtipcypFs/1gr?=
 =?us-ascii?Q?oYhj3fT0N7RcGhNcadXncZJ74nEajKHHJTGWlLFe6TUmUkSY+LAyp9HhEJnS?=
 =?us-ascii?Q?/nnYN0yNMsWEbhg4pwEFTijcPWSCN9ttDtMnWDjT3KrAQYZnrvZbIxjQgr0X?=
 =?us-ascii?Q?vIk6Y0SxSIkSKkuGyA0Qru0pBbw2K/tXo4Eq7U16l5PENid1+8GZSmaWM+Zp?=
 =?us-ascii?Q?L1jmqRqTrFdiy9IGrzq4rWfYUeMC/JqBJCkteWMYDyTAth4evCFOTgzvwUBl?=
 =?us-ascii?Q?+EIzr8JFWAoA/1udXsx+F/xi4NWWcoDWJVuqoFSTneLFJ9RO4xTSvafscOGw?=
 =?us-ascii?Q?1vt4j3vpEOzs8Hno9zEAOr6dyOIw89rfPQQulSlofePooFsHaHbjj7le0i41?=
 =?us-ascii?Q?Yz80e7vdJb32kKjSOZAijGVJjpnfUTPKnwr83pyOnJlgSgnTmngT2GhBCxGI?=
 =?us-ascii?Q?4y+FtuLbM6znHotzbwfKKQtY21HgMOCwjAe5Zy9BdjAdQIZJHloXkvUn3b3t?=
 =?us-ascii?Q?mbKJyOTqjWiOGfxS8u4h3AuWphK4g8zPBhoZCJZoo7FCV60V2CaSurCy+TVZ?=
 =?us-ascii?Q?R3tMH/HHSirIkltv9d+udSwhicXbjNFovEtlABJqsOIG3cQr7CfIdvYDXrFe?=
 =?us-ascii?Q?Yk5dIc8oKkKuMkvN8ZYlR+Azgyef6YvYNQHjPfefHFUu2akMEYqC5cBxgJLU?=
 =?us-ascii?Q?LCuTL6LaxhV070VWBGohrXVHZWRmeEdjSGwqoTgGYqF+Br6pljbUxj/9a2/i?=
 =?us-ascii?Q?B/eZVyhHBFafyGNIum9GntqltES8rVebVaUnwQmIacTOzfzt4ezh3KiQiOpj?=
 =?us-ascii?Q?6NFWq2dDRdUm6fT4FFTC/NT8+SK+NUwsLZ8zZUAHO1Q5Rybq38tnz+S92tVS?=
 =?us-ascii?Q?5NvpUP0cGcU26AEiqmSnYi1k1XR1bh/Fjzm3b1s/996wfct4UCdIRIhYX1V6?=
 =?us-ascii?Q?+nZErs7G/w80W6+zpskgyUHq6oYC3W6VkhUhqDMo6mkduO6d0W6MbcE2tJaZ?=
 =?us-ascii?Q?viWLP+ew5IjSCqyJj299vCuPUdu2F8+EmSnZpFxT3jK/LCYvQjosNf9leKrP?=
 =?us-ascii?Q?Lf4+PbCEzx6esd4+rSqDWE/GTPATh7phN22nLKT1iYNWPknb2s/PmutC8zhi?=
 =?us-ascii?Q?9Wvh4ta27gKFT69UHuJE/xpZCKDyWKDLW9tA1vnx2Dy5ambWUseF4EfPiTnE?=
 =?us-ascii?Q?gyM51oo7zMB3L5eyW3X1DqP/+xHFNs76GHRriBtXEW825R9YKOloTOQ9B7uT?=
 =?us-ascii?Q?cPLlFokmCxEzGtFXAuJTXvtAXQMcQc4EQQzIksgFvNFzgvoPymIs+6EIGsDx?=
 =?us-ascii?Q?B3NT/sF20axmKFKqphEs3PaOn6dRji6t+J1v2JESWpciM86PnI6B3YrFtrHV?=
 =?us-ascii?Q?EWY0HGISJnoU/m7hFkppxFI+5ydh53PvtkVZ1YbIvOWQeTnmuESlqiUzd6Ox?=
 =?us-ascii?Q?NLqhg5Bwhro5Pj4I7AJcQq3wRKbqLruV6mdLeU7yCkpUDy/j+LCbU1sA+AHA?=
 =?us-ascii?Q?tpopVF/9AA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3cd0999-0042-4fff-1fb4-08dead7b2f49
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 03:29:32.0451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3fWsA0kGVAJQ3i8RmHbaNikOt5npdeRRlxrl09y0+H/aYWd+uHFcqF4pMu0wOkYTLNNLk7WI67n7qeup+3OBlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7469

On Fri, May 08, 2026 at 11:20:16AM +0800, Jiafei Pan wrote:
>As currently there are maybe multiple remote processors, so change from
>using fixed name to using device node name as remote processor name in
>order to make them can be distinguished by through of name in sys
>filesystem.
>
>Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

BTW:
please don't create thread with v1.

2026-04-30  6:17 [PATCH] remoteproc: imx: use device node name as processor name Jiafei Pan
2026-04-30 14:17 ` Daniel Baluta
2026-05-08  3:16   ` Jiafei Pan
2026-05-08  3:18   ` [PATCH v2] remoteproc: imx_rproc: Use " Jiafei Pan
2026-05-08  3:20   ` Jiafei Pan
2026-05-08  6:28     ` Daniel Baluta

https://lore.kernel.org/imx/ac390c82-91d9-4d8c-9514-b7cac0a4dd8a@oss.nxp.com/T/#mf211972b33053e6cb0b4adbe1002623d911e0214

Regards
Peng

>---
>Fixes sine v1:
>* Update patch subject to aligin prefix name with existing patches
>
> drivers/remoteproc/imx_rproc.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>
>diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>index e8d239bef5c9..38713f6f1c50 100644
>--- a/drivers/remoteproc/imx_rproc.c
>+++ b/drivers/remoteproc/imx_rproc.c
>@@ -1356,8 +1356,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
> 	unsigned long cpus_bits;
> 	int ret;
> 
>-	/* set some other name then imx */
>-	rproc = devm_rproc_alloc(dev, "imx-rproc", &imx_rproc_ops,
>+	rproc = devm_rproc_alloc(dev, np->name, &imx_rproc_ops,
> 				 NULL, sizeof(*priv));
> 	if (!rproc)
> 		return -ENOMEM;
>-- 
>2.43.0
>
