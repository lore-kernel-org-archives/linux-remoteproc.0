Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013013.outbound.protection.outlook.com [40.107.162.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A365526FD9A;
	Fri, 31 Oct 2025 18:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761936698; cv=fail; b=obCxwQDereKqQLIae3Yx5gVbBvVrPdj8B0/d3zc/zVM7JeWO84Y4cluQ/EsJ9I0H89KR81PULTFoY/zm1NXwp5yQN14sMsq+0ZIURxB8p90xNqOaXioZ6L19McKiaNJexkRGHz84nmrEAQVQKLCK83d0ZXxepZO25krqbxDFDow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761936698; c=relaxed/simple;
	bh=+PEHIOqqmclakZOzPsby3rjhE+A7xwP7RTOtg/jsvxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=duJy2O2BnEYdGT572r3sAikOw1AYy4pOTEQsJ+lTp7Zv0PXi/E08aiS/Cm6/7pluSmTrwiVBMj9p0k+u4jB2/DVtveV22qzTMxqC4nKE21YqZW69XGYX+S5UdP/phbuLcTxG4DtpbG+kgjhloOj+NkMVhtFitbGXiyYHOZSWBoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=f8EG09bX; arc=fail smtp.client-ip=40.107.162.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="f8EG09bX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iSMBped7QwQgoEfWN/TE3JPORD+KASOjwO7UG6koNBcVNCN3t7XA5uLX6XQj0lkH2WiL+orMIvzKbjd9f46X4CuXWi2bYXaTvW504jeZ83rQPmImKsCgkkSl8fwoYMPF6k97AU4ra76X588zOpp06IXtksX/Rf8kjRZe6iPW06Q1/Ap+DriI8fWZhQWgYRW34zqZumeiWGnWhaDMz/Mvrl0tDhjXpI3WfiRcO/SjQskMeu0+a0g5YdbjBUK28Qa9jZ81G17S36x6TwxS6ceMUrxRohJmTVpWtY8G/q/7+CGVqE5gq06g7gyCsglcXyNy2Q9xvg6MPYE/8a75AaNozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1LOfEXmmcyEEhVN/1FhQvCvR2mNG7hbQcOCKmW7Hauo=;
 b=oJr1BniIWlRfBv4CVFauRSt6dmOzHM5sPdrYsk60U7FqRxvB0TwNNndpg7z0JDIFLO03DmVB9t7+uhIvZb6OIFdWk76Dg/oIlwnVkD6s5rr0xV8fYeiwpUebxqFA+orLzNwsPNmcbpHaqwugj5dDc/VKaJ1IByv6q2tIcHun9TyIuudac3W+U0KFIa4Q6lZVAXKRO827jVjoA5+TSpECILUVIYLZHnQ/iEvVu4ZQR4DzYdYHkcq3Fy+as9VnGQeruajsHtgj5NwJzkEXI/wPTm+GN7gyIZDhRG8Xf72ncAd94ZsNFixhor7d3pHJIgWMPnh7KMy0EkDJabr5lU12CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LOfEXmmcyEEhVN/1FhQvCvR2mNG7hbQcOCKmW7Hauo=;
 b=f8EG09bXhPpbNnuALRRv74OoW59NKfM5PehFX+Ey2YuN8ZSfYkLjDGq8xsXND/VmWC4dkr01R/V4ZtdCWkscdT0w+a7TYPtWwi+/Xf9WXhnSQW/t/z3TryPvaiq8CnHQsDc+Ez3iymIW0JgMAwKJS9fmFKAoV/V6KqriGPfL4gE5DBScQnJ5HhxM0BTEO5b5ba3pDnLODoWSOcCYZKal3GQUNg0mT9uXDe8yA61N8QbeSDDeCzRzS37ZBHfju5IJAf0hXZtjzYO3BLQNtLrYhN0UJJNnglllc4hgsCP3phuMjy8aDyo7ZGn4BbroQ1EAzIdW9L/c3SEuhGy7qWIqhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV1PR04MB9216.eurprd04.prod.outlook.com (2603:10a6:150:2b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 18:51:33 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 18:51:33 +0000
Date: Fri, 31 Oct 2025 14:51:26 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/11] remoteproc: imx_dsp_rproc: Drop extra space
Message-ID: <aQUFLgJRwBpZ8UcW@lizhi-Precision-Tower-5810>
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
 <20251031-imx-dsp-2025-10-31-v1-5-282f66f55804@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-imx-dsp-2025-10-31-v1-5-282f66f55804@nxp.com>
X-ClientProxiedBy: PH0PR07CA0088.namprd07.prod.outlook.com
 (2603:10b6:510:f::33) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV1PR04MB9216:EE_
X-MS-Office365-Filtering-Correlation-Id: 910d651e-0f27-48ac-d227-08de18ae82fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6AzbsgFaDSnNxELKCnOUrPuUFxS+IDIVcwAWWD8QkoIgfwjmLK5ztvNkdSr8?=
 =?us-ascii?Q?c5/6nepylOZkGgUiK6YRYG7yiioJmnQAR75xpBvkDADeLewcci7i4+RyjrQf?=
 =?us-ascii?Q?6bOxpTPXUmo19SOYK5IXBJNh9RZOipiXRhafOeQTgbfKgakFfJ3rVnbJxXbw?=
 =?us-ascii?Q?oio2hHDtyPbZqqfWLZHklOW7TVd1d6HbpXr5qLbf7C+PioTCAYOuCOcXAOk9?=
 =?us-ascii?Q?CzVnMMKL2vhGBF4tjouUwHC1Rpyq93zf3QCrSv7hK6VKeRcHGMwEr/S4eyjk?=
 =?us-ascii?Q?Iw95f7e+KMeEZ/BK7fkXWSHZ6Rb2/RvRzFNwWTvCDu5ZUEkJYMtPSxeVSjxS?=
 =?us-ascii?Q?iK+FRqju2MtzYYZqSaxPqVKrAHcXF5lHfTIjWW81Ooq6i0cguVQi84lDI09/?=
 =?us-ascii?Q?m6Hl2WQg0ZuWIzBIWq1Wp+vXDgFJ5gYKzmbHvSTk8Cyttj7G217X63rOqAP/?=
 =?us-ascii?Q?wF7ira4HhIjTx/FOHEjoSGNRyaLwcBUt2ULxaOHF5gkwz+cNQPh6cA0cAzno?=
 =?us-ascii?Q?g4qHx6T5SglW+aNGhnjTErW68ulvY7FBNbN/A2hwPt4y+66KnYnVb060IqFb?=
 =?us-ascii?Q?Qx77S0vYhRL+IDzRTtmGwDynzXFFD6xtY/2RagHQsWy9FB/ZDV00KNFVvt9j?=
 =?us-ascii?Q?z9DaiPoEKtbWjoVylY93ZTrIZbBYfFUGkEbohHt3klUoi34HIhi0/hvA5X8c?=
 =?us-ascii?Q?LttVnRIxfyJT+wZIzkTn7r8Q6RLmbEJhYkOnRQXldWQ52WNfsC48M+Jj4dOn?=
 =?us-ascii?Q?+3IypWKrv+WusqP0mIDJRCf8GUvEEvp2oZSwSGVCItzmfETpIqQnXz7l6ocQ?=
 =?us-ascii?Q?sn0EBDAT9GDXhmcwXYwJWX3wSQ2fzMGOloC27miEIzQBGurUVbR1458ruyBG?=
 =?us-ascii?Q?EHqzIDfMlAJ2QH2yLWUV3mWqQh3XHF56YdbmLvgH3p43cLRn/jDgA8f/eiFm?=
 =?us-ascii?Q?S1X306i2C/ynXvugP2ztWb+dCGLrfSa1u7gLW+pp94Kh3t8YnRpw73vGlrx6?=
 =?us-ascii?Q?T09/HxTeYEUhEFIci+rlfb/Qm7/ZhihLkgOQBYbmc3Xch92lKPOVMYWCuJca?=
 =?us-ascii?Q?0oT+3FsGZ4ijC6QjQ+xd99AKP9b4kBwy256wsHQh2M/x4kfrTnJxR2hVxzqb?=
 =?us-ascii?Q?r6ooRDKa9alsZty5GSv8kEkx+m/D0hOWF2ITdEXryYovkH9rUGygPzg1eyvr?=
 =?us-ascii?Q?qEXFJTCef/bmDiNFXdN0Y6OA+kkbOwjJPEP4SmiyZ8oblgBbRTE3UBajzWSj?=
 =?us-ascii?Q?Zo9me1qyg6GsAiiN5lcEx4pX2V/8xpfa+VVMPIqqp3BCW9ZMq1tn6vUAVeMq?=
 =?us-ascii?Q?R5CTP3g6NOUKN48gwFwOgdAKnqOVhmTQrmgbM8C+cOc0MyXzOHvGndtxEpeF?=
 =?us-ascii?Q?hN+xXgZHMGA2lzsUjhF/W/4BOhOP8g5mUgWpsx2AuW4VIV6mZTM6jtgDtScK?=
 =?us-ascii?Q?FVbEDtxWD8a4tbqIKlldPuQBvu7nG6Xs+2aY9OG2oJD4rjJfc/W1y3Y7+HKj?=
 =?us-ascii?Q?Bqm5UdLQXWGXjbz73p0CdppMWd2kWhmVsEXJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3cXT6Z15p2vAbVItdyj012ivlfUj4Lfl29GlBY1A6kz91uzYT35tlJiJiYHc?=
 =?us-ascii?Q?1u8uR/TSbDMZ2b0CwcXZHeaca/0I7DuViPfT8c9KPlzMWHDUTHXO+mv3KrjQ?=
 =?us-ascii?Q?xKsmGBfUTSMwSlfE4l7mAIwpWNMX10lxnMHwFJCYKwptjiXKgg7FWq+z86lU?=
 =?us-ascii?Q?K1iSUTPlwihgadTI/FzB7hA6urgc7vTQY041R+WZYIfXz0GerDFgD+sqFXHo?=
 =?us-ascii?Q?wRRWlzkBct5iKKj9wFpmmrbvtnbJDB9Os3Zr5wAt3dSl16q4U7PanPMo0tHr?=
 =?us-ascii?Q?+nkiRTMK+gN8L33fm7Nff+Ej/M2lDy/eSPjQpx4uoy2BmZi+HwcgrZYEGOds?=
 =?us-ascii?Q?S5ecLQeV/RDQyECJxpdfnw1Av0fNxT9SovJOM0u1u9kE5tN8TDoLRsvzi6OH?=
 =?us-ascii?Q?ruOrFU8WIV+G7VHEPPP7D/j8DhLStRUMxyGnbVJi0MQFw+Yhr4lRC6bSt2TA?=
 =?us-ascii?Q?9ptR08usLSl4AyyWlASG8Li/NfwF0OdjXJt4OIJVTuEp3oKhdS/wmu9ITgYq?=
 =?us-ascii?Q?+qIxg9lNJhw0K9ix0J7U0jw5zRK1r5yaHL+56C0nmQVL4WL08NI2BDXTR/HT?=
 =?us-ascii?Q?1GVXCtlW0fZPBRmXuLQFXFijD41bt/94E1GjpyEAOVUqOKGPd+Ye9sHoLpHL?=
 =?us-ascii?Q?PLAu+HzI91noK/BpXsmABNd8/hqfoUsB2ySuNhpo61fsn1yDxUxQEHKgiX9G?=
 =?us-ascii?Q?EOS31DGMvTVAPl/KzuBUkMqDkAsu/9ZCjv/rLkmxy5X0kA2ZJKJ6QHPgs9cO?=
 =?us-ascii?Q?z9dZvowA1XM8LAYTvEhibLXUz5IWmcxhh0DJq+0EFeeXhLAWRV9wVQNKWlON?=
 =?us-ascii?Q?FIYoGE4yARe1bM22pdhM+u01m8BgeU7JDjELTos41ShDC6PDK7Px9+MbE6W+?=
 =?us-ascii?Q?mYnbV/+bfNvjAtU9k9jmQRxYFr1kardzJszQktwmy0eATUtIcci9dounrzcx?=
 =?us-ascii?Q?4KdiCZCnxOSZx0pAImdUElgDw4c1ui9ocKHTeCbvDZZK2GxxmXvSCY1c1XmK?=
 =?us-ascii?Q?N4NVkTos8szOWjn3KUKZ5MG+V5fSaf1IMV97u54lwtc5Xe5ZM3iUIvPdjyWc?=
 =?us-ascii?Q?XU/vh4AT1mrjToniM4woqZzTRd+s2z0O6/ZLrJlWTNWHEIulqxUf3g5GA0Wg?=
 =?us-ascii?Q?gbgfmvSVhhP1oZMPnsmqO4kgUiHT0yFnQhibgksjU/Zt3UtIJffPlVTg/7yk?=
 =?us-ascii?Q?wyVXLErI3sRG0gQiAVYNH5t8KXai4MKtMnadETXDGW66TJ7k9BD5u31ePFTV?=
 =?us-ascii?Q?/eXTJNl285o9B8/+PQbexRIZAh0MuWDDenYyM5JgC/NwI2+Z0eNpbE/PSd0B?=
 =?us-ascii?Q?ixsTuM9eij4TDEcAvAwXusLc6CCYdzvCKBlodnz7A3E0HKNm8+99yfRNxZTz?=
 =?us-ascii?Q?wUdsel1CRVd81xLcTrUFSIMKiQJfPjwKeiWWr7HhPSjPQ6IxEgHzG6gJLuw1?=
 =?us-ascii?Q?gY00NnTzNPCIeX2BYoMnhYm/zC2abFclfme8AUl05QSZMmIbwhz6WtKYwEKL?=
 =?us-ascii?Q?V8W3oUP5SWwe2vzS7XRj+C6oN+BfzLWhfp5ryQwSkKoQvXwc319lTlAep2IP?=
 =?us-ascii?Q?HAph/mZ8mniORsKUC8s8ZLcZ7eQbYLS5lQ8+Sv7T?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 910d651e-0f27-48ac-d227-08de18ae82fb
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 18:51:33.7221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NeapZv3eaDHsAb7XKA8aa4IyVOzsmI1TysAbQ8WlmvEIfqvJvjUBRb7T9CsOFMTUi3mZMnE67M5yQW5uOC0Glg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9216

On Fri, Oct 31, 2025 at 05:08:34PM +0800, Peng Fan wrote:
> Drop extra space between return and zero.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/remoteproc/imx_dsp_rproc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 87f4a026c05fbf1c9371058290b2d33cb94b9e54..1726aaa1eafb9ac1a913e3e2caea73801b86dc09 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -784,7 +784,7 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
>
>  	pm_runtime_get_sync(dev);
>
> -	return  0;
> +	return 0;
>  }
>
>  /* Unprepare function for rproc_ops */
> @@ -792,7 +792,7 @@ static int imx_dsp_rproc_unprepare(struct rproc *rproc)
>  {
>  	pm_runtime_put_sync(rproc->dev.parent);
>
> -	return  0;
> +	return 0;
>  }
>
>  /* Kick function for rproc_ops */
>
> --
> 2.37.1
>
