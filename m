Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013010.outbound.protection.outlook.com [52.101.72.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487FB2F0C44;
	Wed, 17 Sep 2025 14:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758119756; cv=fail; b=m+GAAl7prhviKszmqXGHzzzxKiL2qHQ55OTPewZA63Rnf4XTqATOXMwbbhZW0tpQGyHTagUtGYe2G2bAXvxokDYLzFjloekaAqCjMdp/6ZfHNqAEIKlnwkJ0/FeEralMC76J0TJ372xfF3H1NLkA+hwNj7CjaAhhrcrdPfO7aTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758119756; c=relaxed/simple;
	bh=j67NS+IpoNTLNUNO4TgvBhq2mLgQ+rq3I2bJU7o2akE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VlalUNgfdmpNIV/qK+qyMCh6N1FqLAy5yDKcuOgLy/kr62WUO2PkL+gUN3KlzrhE/zJQb2jFzuDGiOd3Ou5ihXNg5QJHvs9p8FPeF/XcmUQdaQ00o1YIRDJcYOxA28QePYoQ5WmWQ/4eyJMn1O8dBEOnSk5l+/EVM6+B2eGK9KA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WokXE4nD; arc=fail smtp.client-ip=52.101.72.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WokXE4nD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WMg+rZbkOINYPwgOh4vsK7lBxlACvqdqMCnOlOvEwmSlqbSobhOp6wGMVTei32A38aZjhVj8c05mhtkETlVFOcpZ9sRYnttgGgtTVdpJCcKZMGO5Jh8gMQqJEOBReVIw1IiBB+0/UVdkNmNd63h7CUO+J/SF9P5SjQLNP/y5ACC/rxuVUh+tnSbaN9hYFiuKfGyQixsoNOfLvO2qPSX2j/zWrupj0brH+bvG+9kuIHjrke9DBFzJXgXeLPxPsDbUaKeY7WVkpV4Xfw9TDHaB7Qo37vI28Q/Tj77GB+DnZet1LabjEWc7dJwZGEkJVeYQWpiiIBR13v2SxI7g8x8cUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0vYdRHkgfKiB8Rtol41r7XWvz99m12b9iDC47p8p/M=;
 b=AHGZXwL2brhQGG1UZDmbNArWgrwMwnwS0KEPFV/Xxzn8axfOKqYE6qDCBHom7dv0VGvVU8cMHGX+04zk5NP0Qdmwbb6sg8g89K2Ybr1SHBK+nVDuGxGQ2W5G48fwrpaDczIYxGP8iKUWp+2yAZh2AZf7rD5hu5OgyiB6mSDnjNvIJCT54dltPdErRpIwnwXddr0M9UNqqd6RkDKhB7aTaPkQgYn7yh6EASahDQ+S2RfxJv4CWW6nCNRfrLotM/3kGCxrCbQH1QWZ/Hof9kJqyLkcqgcddTFt7Igj1NBhb4pxVafqOUek9Jv4Qkx6vz2TdKyDRxS4t93JKZDwWW1Kfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0vYdRHkgfKiB8Rtol41r7XWvz99m12b9iDC47p8p/M=;
 b=WokXE4nDNy8xz+Xr2Y2rb/+nRuSB572Q9W/RgT5M+mWenhAGdpM9L+TpeR2phgtWwhAGzYN/FR2J6YxntKdS09epI83/u9tLZXetlDlUYuO2yDhRwSTLHQFEaExY96Hq5GOR3ugYA+dEbA2q+uSKlE86K+g9cbFYXr+Fy8syHIG6l+a2V7fV50jqbpVlxfUWSYO1Wc++yiq0gDT+oJS1+1bbo5YFi7+cDGBx628v1SUd77LNPbGR/JUz1iRCnS9+N/H5OklQ6QxbcyHiscJzmbzq2VaHfmksuaqxohDw5xQwKbqMDqn70b/5uF8kkUZfLmZxu83lYrWE6Kk0/u8PMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DBBPR04MB7628.eurprd04.prod.outlook.com (2603:10a6:10:204::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 14:35:51 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 14:35:51 +0000
Date: Wed, 17 Sep 2025 10:35:43 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] remoteproc: imx_rproc: Use
 devm_add_action_or_reset() for mailbox cleanup
Message-ID: <aMrHP+CQywcHKSP0@lizhi-Precision-Tower-5810>
References: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
 <20250917-imx_rproc_c2-v1-3-00ce23dc9c6e@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-imx_rproc_c2-v1-3-00ce23dc9c6e@nxp.com>
X-ClientProxiedBy: PH8PR15CA0002.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::29) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DBBPR04MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: 89f27d39-e724-496d-f5ab-08ddf5f77ff5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zz95OcOziTqGPGs/xC9aP3xUimyZ2PAIjdTid1tWVXviuAXUFbjOJT2SJvJ6?=
 =?us-ascii?Q?qCW84MASxnxRm4ehj9v1udILeSiLRaeJpqma/lHWe6RI061316iTqrW3dpmc?=
 =?us-ascii?Q?/duae2gshobBXO54fiIDXcN/8v9/msVxWvnpooPboKRlekyjJv3XL7f+A6mM?=
 =?us-ascii?Q?yyC0lklSTR+zjR6JJ66wj2mhIHg1N66d8bzFDBqOGT9KB8B/fbdUBP5hQP8X?=
 =?us-ascii?Q?t3cMukcfZgeB43Eww4Y2WzUb1qUw48i3+1b7Y+lPWwEPdjJUGVxIox4YZR3Q?=
 =?us-ascii?Q?Guv3Bp5M1A1PdtDjnU34o4oisyB+Huo1fWUN/Y8S+fcAvx2JlEA9r5lt3cEl?=
 =?us-ascii?Q?kzM8fRuER031S4FnT56c8MShXs/z8nCd3Nb580exseYDuU3GcikqvtUn1/cW?=
 =?us-ascii?Q?jB78hKZGldszQQVx1cwOUzcn9XdZSurmD9X3FiFdgAbZvTyx18Nl7J5+2JlN?=
 =?us-ascii?Q?x1Nl+hWqirFemkmIzTvExN7Vsof0wMC+18Mlo27gw75PGuNugWPRNKUWN7lw?=
 =?us-ascii?Q?F4VlxwLujD0/OxNBilm0BKg24z14h+COR/Cj69hhSG8PeuwC65IVSTExkwk7?=
 =?us-ascii?Q?LMld4tWkesJhdVsMoQoShfA9mz069eYB3J4y1lfn81CY9x/x2zjoS5Yzm4lG?=
 =?us-ascii?Q?RnkR9cKCDmsJf9pcr8Dm7yQMTd2oiFaHJD3KZvennJ2s2uJLci3y9ju7qsZ9?=
 =?us-ascii?Q?vFlzfAUwej6hyzIVLkYbiLga1OuWJm/RkabHaRaForMpsJsnPwOdZYeHjYNU?=
 =?us-ascii?Q?o61kZ8Z6Hh4Tq/f2+r2Lvk17OQPFgkCjdA9NWPdUZ4w1jni8hrVr1xN0BD8v?=
 =?us-ascii?Q?+qHAyURkB9xPFVXtsrVSCD9jQ8EVAL13Tnv/LfwzPDo3brZGzam011SuP/M8?=
 =?us-ascii?Q?wAUQouH8G7FrBwZ5a8tpHuIc2oYEf5btzsmSyRcmR4DzcE2vzu3p3CkdbTQM?=
 =?us-ascii?Q?PqRet0F8hSium3B0MCE9oSYOCaAaQao4qe3sjNUw0XOzFdG0RxLCThp59uhl?=
 =?us-ascii?Q?eztcI6GIJ2x2q5+i8zkphHBxhkkxAIsSyg/l3LHuW6i1Fvh/8WJAEogXZTzM?=
 =?us-ascii?Q?tMtl2tSjG4Pm6kgkxzbumWr21L/IS3Bk0ADtZePdOYk15LrvALfrsxc9dCMs?=
 =?us-ascii?Q?6y47X6IVDc8I5UK6sezxM7+5ekLMOyXGP7nK+o9GV/Oth3L116b98jWkPNId?=
 =?us-ascii?Q?+j/JMwUnR10d5Htw6KlAaMizfEtKGc8Y+7X6NcnlXIMu107p4/othDh/FrGC?=
 =?us-ascii?Q?EpFKWqCaM5vv44CkgVOSStVeS0emIRG9VMInUNqgBqSk5I+O6jZ3Px0YzDFy?=
 =?us-ascii?Q?Fwpf3M+7tYHRiedak3rhJIOkJaYTKq57vSxqUF2K4y5h41AxwK+K4EmsZzwy?=
 =?us-ascii?Q?LxN0ueoKD0bKZeQS1Hj4FKyESKIWYcfrrtJ3/z0b5kNIp9e/Gr3YTL8fuh4/?=
 =?us-ascii?Q?APL/Qyg+LS0kthjBq6XS6fRofoWhXOL5dcY1qUKgK5sIwIK7WdcC6A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6xKDlwVgs8g6GPdoHpso+66Xy2RHwwPB4HPNIjtyVQpyv7QJleyJ+xr7G6Ls?=
 =?us-ascii?Q?xTRRFbIkwmAjkeJoGskPrh9B94RL8p+FyorlNlNExf+fDPefFTcxBNKht1Vo?=
 =?us-ascii?Q?GAVgbQHmTc+AO/RpxB8doi56auSEAem1AgFmbz0RuY78T26leduKcyXHskOs?=
 =?us-ascii?Q?8bm4YiHVraH/FDiEtKMnSZaWZK8hNE0p5gkrYegy0YMK6REmK14iApS8H9si?=
 =?us-ascii?Q?eY+7//z4h/A8KQf5I8qmDCatAi+T/IkbNMeLiCYSFlACJEDKQKh1ROLHIRHf?=
 =?us-ascii?Q?KlRfKUjr4T1IVlqd34QTnXS3N1YKTVZYs2eFQkE/PwPTzE3p+skQeRrb5X1f?=
 =?us-ascii?Q?UJbrlZUZK8BkHdEsxMC/jxMnVmKkCfTiurHG5DHQGDCI0EFmcFNr+5itvygD?=
 =?us-ascii?Q?T3IDDY64WxrKvDb3HoFkX7sss/guckbcVRIpM3SJzHA78PNH1eKSbyPuSeBI?=
 =?us-ascii?Q?gfhnhW+V/ZR08pe+EbZN1aDTHDWjfv02Gwp2K0LpP1sBZnF889iqRiciYwwU?=
 =?us-ascii?Q?7UdOcu6Kqvajd3tWoLKCGGVYMHo5tbEV9VOU4mCt60oQhp6sYkYoZU3jrKxa?=
 =?us-ascii?Q?/hgz/yspf2jISZNMIBEqzxnFCbAEw3TIaMUlUNrtABwQhgo3AHCNBCIAU4C2?=
 =?us-ascii?Q?hGRC66v+TLqmPCL6F1Tn2PPleVxPAZu6mOHbpZ1RAe9WZcVXsTmHhTR1UsTd?=
 =?us-ascii?Q?bL8ZAiXMOfS3pQp0+jCHSCSsGlY70zay9BNsf4k9rFmKJ4uGVbNgr69n2v3N?=
 =?us-ascii?Q?vMTm4VEtVHZVzOsMGfOvrvt5Gzg7WP6wgPZ6CDATHJEV+uv0HZGJaAdYPhGE?=
 =?us-ascii?Q?1nCwYoM9GuvWGLGj00af7Iuz+uzDpp4YVGKis+g2x7FqHl+OfkXjWiiR29fJ?=
 =?us-ascii?Q?P9MW9B6hxNqCcmiztVALcYrjO89XGrgygDvrPr9+TFIJv8A+f24Mrlq0b9bL?=
 =?us-ascii?Q?SYn+ALcbkYfZFGRE9/GG9fSTZWMNXsKW4v3NzpkTfxyNdUuHG8mtEebrgH5I?=
 =?us-ascii?Q?m2iVzi6VRO2NjdVfu2eGTIDj+0AkLXWhwuCpED9f4TZDK4nxQ4pKNwUmL0fa?=
 =?us-ascii?Q?hpqZOlwxrNzsbWbG7YEeMclUbvach5JftWYPx81+4KxsQtBLqoqze2o9LWTl?=
 =?us-ascii?Q?L231A7LlxoABi5PTfIqCOAjooZQ/d4uabYzzWKSEPfc+EmTYDJs5ScfHYnHE?=
 =?us-ascii?Q?A5BszL6JKzTL1YQr6YaVsXHC1VWFM11MauoYYET5SQ7QqCB+ZcCAtHErN5XU?=
 =?us-ascii?Q?a+WkrKvDwaq0VG0JuJTQsHoqxQphTb6JyghFcME1jVcvD2t48eEojIVx1lxk?=
 =?us-ascii?Q?qox0jRBNoMIIji3j5KimF5uZN0+D6mWtmCJ5Y25Ucst1rq5yZ+5Q0U5+FpoO?=
 =?us-ascii?Q?yC27mqUeMiHLoVtLnMor3pkXLzeaCXAMLe5ODQgjCp1FxqwRJxMmebSFB/6l?=
 =?us-ascii?Q?1NeKyoB+oLis81gTbLkEY15LoGl1W6kexouNqPV+gUj6z553as3N2IBG8dsy?=
 =?us-ascii?Q?rR46i5qRaFeRgvQhWm6KRWKfrYuuJgcbqlM9PlQ78n+eXAMcIoa9022UFzNb?=
 =?us-ascii?Q?6Ef1O6FJ1arEmENVQ/oSJ1W3QtYSMc7WEdx+dZh6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f27d39-e724-496d-f5ab-08ddf5f77ff5
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 14:35:51.2568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eej37eGaE656UFf7Mawr8VO+fB670CtcHh5MvW29R70QHJRF5coYUulfCH44Pwv+T9Ac0K4Q6Svmhbgp8eZFag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7628

On Wed, Sep 17, 2025 at 09:19:15PM +0800, Peng Fan wrote:
> Convert imx_rproc_free_mbox() to a devm-managed cleanup action using
> devm_add_action_or_reset(). Ensure the mailbox resources are freed
> automatically with the device lifecycle, simplify error handling and
> removing the need for manual cleanup in probe and remove paths.
>
> Also improve error reporting by using dev_err_probe() for consistency and
> clarity.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/remoteproc/imx_rproc.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index cc776f5d75f1f614943c05250877f17537837068..e30b61ee39dacc88f9e938f8c6ffe61fef63dbda 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -93,7 +93,7 @@ struct imx_rproc_mem {
>  #define ATT_CORE(I)     BIT((I))
>
>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
> -static void imx_rproc_free_mbox(struct rproc *rproc);
> +static void imx_rproc_free_mbox(void *data);
>
>  struct imx_rproc {
>  	struct device			*dev;
> @@ -780,8 +780,9 @@ static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)
>  	return 0;
>  }
>
> -static void imx_rproc_free_mbox(struct rproc *rproc)
> +static void imx_rproc_free_mbox(void *data)
>  {
> +	struct rproc *rproc = data;
>  	struct imx_rproc *priv = rproc->priv;
>
>  	if (priv->tx_ch) {
> @@ -1101,15 +1102,18 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>
> +	ret = devm_add_action_or_reset(dev, imx_rproc_free_mbox, rproc);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to add devm free mbox action: %d\n", ret);
> +
>  	ret = imx_rproc_addr_init(priv, pdev);
> -	if (ret) {
> -		dev_err(dev, "failed on imx_rproc_addr_init\n");
> -		goto err_put_mbox;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed on imx_rproc_addr_init\n");
>
>  	ret = imx_rproc_detect_mode(priv);
>  	if (ret)
> -		goto err_put_mbox;
> +		return dev_err_probe(dev, ret, "failed on detect mode\n");
>
>  	ret = imx_rproc_clk_enable(priv);
>  	if (ret)
> @@ -1174,8 +1178,6 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	clk_disable_unprepare(priv->clk);
>  err_put_scu:
>  	imx_rproc_put_scu(rproc);
> -err_put_mbox:
> -	imx_rproc_free_mbox(rproc);
>
>  	return ret;
>  }
> @@ -1188,7 +1190,6 @@ static void imx_rproc_remove(struct platform_device *pdev)
>  	clk_disable_unprepare(priv->clk);
>  	rproc_del(rproc);
>  	imx_rproc_put_scu(rproc);
> -	imx_rproc_free_mbox(rproc);
>  }
>
>  static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {
>
> --
> 2.37.1
>
