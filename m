Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011048.outbound.protection.outlook.com [40.107.130.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D99D2FFDFD;
	Thu, 18 Sep 2025 16:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758213510; cv=fail; b=OTZtJMAbcN5wvbiasp/d2qjfkPzNqFrxECAF+xh6RrdPGjxnNioMQIa7bl+xtOkMbaC4QFY9GXyHVc8zP3EBMwXP0re+BcxVJAN5KZmaAm+neeAvNBzBhGeBgF0J5q9c3/uU/lVJtip/gwD/LTtuPcExBWq+2swbG8jPluWHZnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758213510; c=relaxed/simple;
	bh=+CIMPviRXaxrk9dCDTawDEBWvzmYREHveAmM1Mmh5Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Qa8f9HawybtK/st7dtt8fRuxxmw0Z4Gpb7RD3KqnWT1h8LOoi7z1zwPJWgEUpG2Ht2Ygzb2rbS/QWXXdi15LeIW9wTLsVPrs8uscgu0SezjetBfHZQ9YIHIRaetH2VPmtD7/GQmdb/mGzdFd17l0L1OJtHzJxaum3OWwtcFFURQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=K2O9dZLW; arc=fail smtp.client-ip=40.107.130.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="K2O9dZLW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCWLELKeoDlaQpQY7xcdcvUlE+G5j/kQmn21E71U87U1tdyuE2HVcHxO6udGcz1psICr2jX+07UdKkpDWV6/cgNo8LsRjlM6tvVUEug8ksxhnoq72h6XQ78hPeqsndJpYbNsXerYXybUcukTPP9k8540F2QlGUPO+pBME6y9zTIOo3WEPSghOb0S/WNVksH83uLQXkfJc7/NR80V+G1X0SwniytJiCmye4pbsgmPuKsN1mso8saIbUy8oOEjEYTRbwuigNNoboaY2203pW4EB4k/cP2k/J9rQwgDjjdBS/DUAfnmq0eZ7M1neby2QW/K70VwV3mOPB30mlbMO6iH2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zND1LWLGGe/jRDRaP6Gr/vKmUaQ05YGeICYgRIdMRNU=;
 b=J+aaKlzYK2VOou6WZ0XfPf/uyeK9ODGW85J4/caLtQ4tHixSAr1CSpHganz5/YRxubsqLWCjiM2xRn6v4J6chH+s85ontURckiboBAK4ONxoncn9X3VRmeslwKqa6Jef7xntuGnLkvKBFyD6DFmmkk60QDLBHd99fGKULDh8z2SOS5CdghpcwVbiPf670+S8RZ3opUVjDo58jPOEnZB99O1Dd1t96Fr7VDc4L3PERd3H5VgK58krc9+rGR+0OK6MRbhEyOrTqimBFN1yk+rBoYSedmWTPSybBcfeUPx5rLHZ3KXeWXBxZ4EiHCI8QUOebkrFUqub2k2nzmFpo+ZscA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zND1LWLGGe/jRDRaP6Gr/vKmUaQ05YGeICYgRIdMRNU=;
 b=K2O9dZLWhOmzcLuCDH3Qi1/JVi/RuxjgWjpXSAZaaOG1s7CPj/CGvw6cHFT996RjkhGPIgv6dyug5FHzl5FJbEE/T4kpMyyzko0tsw6SwTm/SiGb77l8E7kKbKJx32SKiiSALb/WIBRmcm6atuP4hMqZHwTyuXhIFB9gkK2C3L7ksHFE1jGjKg6LKxyOLfwg/uZA5msrwsBXPGhd/LPg0k8gO9nO4rvRSIpaX2xQxWxyXAHEK6ZuqCsO9XDxNELEu4RGmxU/1T77IEBGkofLHtYu9WMUj3HjcEX4Lpv2MLdICNLSaWbOSdbScrY/Ohjlh2Cv9/tzmxCthvRITQkZcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by GVXPR04MB10271.eurprd04.prod.outlook.com (2603:10a6:150:1ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 16:38:24 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 16:38:24 +0000
Date: Thu, 18 Sep 2025 12:38:16 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] remoteproc: imx_rproc: Simplify clock enable logic
 using dcfg flags
Message-ID: <aMw1eACI1VhV+CzP@lizhi-Precision-Tower-5810>
References: <20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com>
 <20250918-imx_rproc_c2-v1-1-deec8183185f@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918-imx_rproc_c2-v1-1-deec8183185f@nxp.com>
X-ClientProxiedBy: PH8PR22CA0002.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::26) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|GVXPR04MB10271:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dcf809d-131c-443a-32de-08ddf6d1c936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n02+gmI8i1bNxGem9SBznSWHFQJ+ArR7kABYqjmnFaAaN3BPQ18qrUjY5MtZ?=
 =?us-ascii?Q?wPV5HILtpBgP8koNJWjXMF6xy5LH5pEFLxMjQdYMjRVoXkqI6e2pBuQiBl2Z?=
 =?us-ascii?Q?SL2Ers2keVP9twOqtjXsDOrp+oQ15esBxECOnVqFl7CeS+7y+DpDkJCTgNlT?=
 =?us-ascii?Q?fHzgf/Xrhc4iZZnflLCXiDFw6u0aY35WoCGBqqIaO3ousV4VyZg73bSTJ4fk?=
 =?us-ascii?Q?kW243BmlbUwM98+krLmAB6iYEzcMq1j71iO8qY5CS895cy9RP40qDwkEWT+J?=
 =?us-ascii?Q?VQoL+vDhkPeKX2HJGZRzafwzcFKeCBdNkR8I1F3ukJPTlNGRn18pbWZyQUgU?=
 =?us-ascii?Q?ePWWumT8+dtIxe7zG2BdMVnJ4p9VNCrzQapc7VXkvxNr0qfXbvy8wkMO89PO?=
 =?us-ascii?Q?xsGwQdcsfipLdoEMYlDl58snP6jBjFvCZXHe9C9y/Nwf+UJXi6q3jX3myzgD?=
 =?us-ascii?Q?o1sauGPiQqPJC0CCZD35PFW5t9nfjvv7iveVaAhadTyczapn+A1DY94KFD7r?=
 =?us-ascii?Q?f8d+IGp+LNBdXe7kxXtSs1eCvKCr943uj+IUvwMD9fNLEOt7kHzk4xioLy8z?=
 =?us-ascii?Q?iE/wA0EGEoS5cwq7NKrpy5JZb2zhjL9qbi43nBsOxGqtHghajQ07UJ+s+dN/?=
 =?us-ascii?Q?8Ekrt+egNNu5fQ0xVgMa6Ymyh0KoiHyHFv8aMu/2I6Puz7wEK8ocLPN4mu9M?=
 =?us-ascii?Q?ICEqH77eWHYw8wNk38RzwqSMWMKv3aVS2BB0DKiZ6+iARQkzq7LdwU0qgXuV?=
 =?us-ascii?Q?v/1KxtMuSvWOyi7m1lwPaQ+1/pqIoKoyN10C1uQhmU9gPsMSrIKtjnLr40IF?=
 =?us-ascii?Q?+s0iBMyrcAUco9cBOyCz2WETJlZGWVJYUAImfOZLieVlqikmqlbE+CuuwuQM?=
 =?us-ascii?Q?wL9xSeeoD2y4J51E9f+JTg6oYftBDLiLItNZQ1f8ywJIoZZIlNATNQ+5ebY6?=
 =?us-ascii?Q?ZJ5G/kpned7/xuKy1/8+boF8id5/Wphx/4cNzTPiyi50+sMnr23hmvL1ZVuf?=
 =?us-ascii?Q?TUUAGm05x2M3SR5Vfm7n8pkiBf5/AE1kaZkWSfd3azltXE5VfLJelBnjE3JK?=
 =?us-ascii?Q?m81suUgXyUHbbzbUEEw5SlBQEnaUBxwKUCXhE9Ti3rB/1ylQRo8N2s25N9j0?=
 =?us-ascii?Q?blVddlZgOMvdPHvF0sYnSCAYy9FbjO1Y510009ZvL6FTSOWmIypm9DZRg8WF?=
 =?us-ascii?Q?wxItrrr1Sc9hasq2uP0xfQWS3EVwB9edR8tzTLb3N1wrhS3bRuDCHHjdtGpy?=
 =?us-ascii?Q?EvL8snhREnyqA14dF3du69yTdB13pa1ACQihDIx1YTC80AhORhUXyl8CfOIC?=
 =?us-ascii?Q?F8S9TZf9gPbFJv8XZr4a9mcU5f7eeBhQa77tUtvEBf+RD1AQeBACAMhfKzgW?=
 =?us-ascii?Q?bNzFOSo3hU+XwIZsKodDS9uuVVyyZ0Xg8xQs83aGeYzaVFmgtidqrwfNvbYA?=
 =?us-ascii?Q?qRP7Hirlf8do/DNxSqleIixB8DawFsW06Gk49o/jh5uA/8bIXTas9w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Dxg3SzqX83n/kC1kWT8QCuzORd+ITMTupZAOXQX3m6EWXUxKfBOI27MK3kbj?=
 =?us-ascii?Q?lxL54FMDrprXuo5g1AUxnnXpTa7PA17lquAiSueppuM1HrhOUTAOZGzrgyDU?=
 =?us-ascii?Q?no5/Y9aUoMHhdqB8z+Co+lXr37Vxswny/yL0fiXi2y94bW03+QYeDcU6v3ZI?=
 =?us-ascii?Q?+6yDNwUK//iECPJREiDfv4yJuydfQJDKIGZxkO+QDoZQG5IQFpsuRxuvPM9c?=
 =?us-ascii?Q?KtxCIaei0NlBXNhyV5kAOlkEYaIgWw0dRw6vVonHjWprI4g4Iy5lGyzbEEnf?=
 =?us-ascii?Q?CBH8VOfjdBcKtMymtlvtykUJQ0U5UgDQGnWSQXr/nmF9kytYHv2PQdFtKQeO?=
 =?us-ascii?Q?DgjCeOMf690USI9yb0bLrmmPpOIkPlniRBI1ZfzVwIWfeTBxkRi48j3aODYR?=
 =?us-ascii?Q?sPFpNA5KD1oCvciZebMVz79HWmVEz/uyNNFdJ5d8d0QNuFjj79AHCtu87f50?=
 =?us-ascii?Q?10RqwlkqzmfCcZl3VoiUT4l4U2FWusERiFFqsPmRU/4BwkptuIupisN33Kft?=
 =?us-ascii?Q?YuV+WfKmTnN5W8GLD3JvKaKFJ0MW58XMwixlP67SgQC4vdJLWFH5v9UIf1r9?=
 =?us-ascii?Q?2Um7Ba3bVAgcIzEPD9f5h1CFlMHThDDSOhG9GId5geinkDpxck+tSxIkYVTg?=
 =?us-ascii?Q?ivE8X8ZSvjxzxLGzBdoLP/CY2XvCKHXt5GhNRqPw7NjHzD5KG+6qPSOCAs9+?=
 =?us-ascii?Q?AkQvNFksM3VxO7kp+6ol48b1xluF+upJ9Hc+tDGeIwJhaqO5I7igyR6t3O5l?=
 =?us-ascii?Q?7OGhB2r0sPd7F2AzWT+pKULphvxTa8wQEJtQdzoBWOdIyj5Yn6Z1mE96GFq3?=
 =?us-ascii?Q?/52JEZMq9cawurZfwayLPc9Br02/syYwv5A5PZ29TBblAVyWQrR1ciPM2Ip+?=
 =?us-ascii?Q?QK+G1lGyPS3t7FSClxk6Ivy4gDtQxeVS8VX4emnMZrq+u3LjvHZBEnnmtxZ1?=
 =?us-ascii?Q?lUP328eCwvB253lnbYcyKwaUonBIm+3RwwIwCMrhPQtAd1tLPCaYTpkr1kHb?=
 =?us-ascii?Q?Bn0fMrJPf6pylrItlGNxpxrZ10+URY8SW1DrMnE0l/DfdKK7np+82wwyGr2i?=
 =?us-ascii?Q?R9liwQawp/5a5pwklHMosrkETIcoB35UGpLbNF+Xdo9fP1R4vHfiHiRdenqw?=
 =?us-ascii?Q?LdSYewfJts2UpgFCy2Dyk4ojJQHEFioDqyHA4Xyi+s6N+xHMx2PZ8VGSgYe9?=
 =?us-ascii?Q?9qPG6/nGg6N+gMbsYz+fhCWHR7xIiQWWZA1uu4Blfi65pMDX3GQxYbYh/i1Y?=
 =?us-ascii?Q?FvUVSGDf1Z8Hi0SC1Z7YdKdHLFmaQ4Cg36FNzIHrMHQkq9eMcIxqWPTSKESY?=
 =?us-ascii?Q?aRyHZPeQCiivCBtn+MfMSs2qtVAbSTkO+zxtxbFi4sqG0XdvG6besNkQrjqy?=
 =?us-ascii?Q?/XfQ+08gsqhrZW9Z+7cqvDAqiHPykJyoHreGLAfPfNFeEo73oBlnV93QL4Xl?=
 =?us-ascii?Q?l1tYrI63oYElIxKtmAqNOjYIFSqX5T4VKW+vrOkVwh5y1d+xIW2sf8+leRIp?=
 =?us-ascii?Q?897ewtDSuL9w/AsmYzAxCfQbOAeK8mVUXtOmkTplXYNwSPRBei5c5ZpbhTEo?=
 =?us-ascii?Q?Bg48gblQdGqVaEsWJEEaYBC3s5ddWIaK1bb17b1k?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dcf809d-131c-443a-32de-08ddf6d1c936
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 16:38:24.4334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQItRt0G8V3r59sr74kL5wwA9UA7JuWETK7CjUlWBFGnonITifXHS9w2d7snZaZr6TMGe91lE/q0Y1Yow/T8Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10271

On Thu, Sep 18, 2025 at 07:51:16PM +0800, Peng Fan wrote:
> Simplify the clock enable logic by removing the dedicated
> imx_rproc_clk_enable() function and integrate the clock handling directly
> into the probe function to simplify the code.
>
> Add a new IMX_RPROC_NEED_CLKS flag in dcfg to indicate whether clock
> management is required for a given SoC. Update probe logic to conditionally
> enable clocks based on the new flag.
>
> Set the flag for applicable SoCs (e.g., i.MX7D, i.MX8MQ, i.MX93, etc.).
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/remoteproc/imx_rproc.c | 37 ++++++++++++-------------------------
>  drivers/remoteproc/imx_rproc.h |  1 +
>  2 files changed, 13 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 694fbbb2f34061de22a3a815f8a6114159585f9e..71617b20f9d0ae698e7f655aae22e8895434f32c 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1002,28 +1002,6 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  	return dcfg->ops->detect_mode(priv->rproc);
>  }
>
> -static int imx_rproc_clk_enable(struct imx_rproc *priv)
> -{
> -	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> -	struct device *dev = priv->dev;
> -
> -	/* Remote core is not under control of Linux or it is managed by SCU API */
> -	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
> -		return 0;
> -
> -	/*
> -	 * clk for M4 block including memory. Should be
> -	 * enabled before .start for FW transfer.
> -	 */
> -	priv->clk = devm_clk_get_enabled(dev, NULL);
> -	if (IS_ERR(priv->clk)) {
> -		dev_err(dev, "Failed to enable clock\n");
> -		return PTR_ERR(priv->clk);
> -	}
> -
> -	return 0;
> -}
> -
>  static int imx_rproc_sys_off_handler(struct sys_off_data *data)
>  {
>  	struct rproc *rproc = data->cb_data;
> @@ -1108,9 +1086,12 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed on detect mode\n");
>
> -	ret = imx_rproc_clk_enable(priv);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "failed to enable clks\n");
> +	/* Remote core is under control of Linux or clock is not managed by firmware */
> +	if (dcfg->flags & IMX_RPROC_NEED_CLKS) {
> +		priv->clk = devm_clk_get_enabled(dev, NULL);
> +		if (IS_ERR(priv->clk))
> +			return dev_err_probe(dev, PTR_ERR(priv->clk), "Failed to enable clock\n");
> +	}
>
>  	if (rproc->state != RPROC_DETACHED)
>  		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
> @@ -1185,6 +1166,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
>  	.method		= IMX_RPROC_MMIO,
>  	.ops		= &imx_rproc_ops_mmio,
> +	.flags		= IMX_RPROC_NEED_CLKS,
>  };
>
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
> @@ -1192,6 +1174,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
>  	.method		= IMX_RPROC_SMC,
>  	.ops		= &imx_rproc_ops_arm_smc,
> +	.flags		= IMX_RPROC_NEED_CLKS,
>  };
>
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
> @@ -1203,6 +1186,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
>  	.method		= IMX_RPROC_MMIO,
>  	.ops		= &imx_rproc_ops_mmio,
> +	.flags		= IMX_RPROC_NEED_CLKS,
>  };
>
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qm = {
> @@ -1241,6 +1225,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7d),
>  	.method		= IMX_RPROC_MMIO,
>  	.ops		= &imx_rproc_ops_mmio,
> +	.flags		= IMX_RPROC_NEED_CLKS,
>  };
>
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
> @@ -1252,6 +1237,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
>  	.method		= IMX_RPROC_MMIO,
>  	.ops		= &imx_rproc_ops_mmio,
> +	.flags		= IMX_RPROC_NEED_CLKS,
>  };
>
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
> @@ -1259,6 +1245,7 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx93),
>  	.method		= IMX_RPROC_SMC,
>  	.ops		= &imx_rproc_ops_arm_smc,
> +	.flags		= IMX_RPROC_NEED_CLKS,
>  };
>
>  static const struct of_device_id imx_rproc_of_match[] = {
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index 3a9adaaf048b396102feeb45488cd2ff125a807a..a9cba623560c85ea37e47401c392c06dada500aa 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -30,6 +30,7 @@ enum imx_rproc_method {
>
>  /* dcfg flags */
>  #define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
> +#define IMX_RPROC_NEED_CLKS		BIT(1)
>
>  struct imx_rproc_plat_ops {
>  	int (*start)(struct rproc *rproc);
>
> --
> 2.37.1
>
