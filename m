Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011064.outbound.protection.outlook.com [52.101.65.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E7726B2CA;
	Tue, 18 Feb 2025 15:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739894389; cv=fail; b=Q8p2NLo2o4oOYzqe+c1DOhJ99HNdd55ovpHqCpysyKVmmSi95LeS786ZgjKl4Z0hHBBA0obdtuim1lB8g3wtCJjm5jOyUKHL4nQpBBO6n6v2xGrq/nwKXwZ3KFvj2twUH6Njj8gNc0RjX68FylNBU2ycB2O8ag1YjEaGKqNTxHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739894389; c=relaxed/simple;
	bh=uAFQiVcUXEo0ZhCTP1QkcBXjy10TQlQEqwi02Gy7U5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=G55WBNtOEkgIfjZMLFZ1RUzvyGuv54qhHlzX/1kEkUdLg95R5gHBiRFplWLC9TDWDaayeZqoFHiV4hr3ag6Q914vqcMLb/XRPIisnaRS7w8Bqw4eMDrdKyo9wri2Lfv2fqmcWHxVkyS0sto5JCwt4ewVXmtB3/DCXMItmmlBaLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BN5PgCsT; arc=fail smtp.client-ip=52.101.65.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BN5PgCsT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RaD5QD8sGIso8yBnmDF3WlDKER/Dj8/RL1eUC2peg86YqHcKCrGA5oCejZLFFVNxnJNwnx/3MzsM/w4utkiAshjKbi/KrQgritKf9xAiJtK6AqHJiLToXuc+7omMYBXw0D/mBF4VDzYixo3RW8u3jkRSkuTRge+e8eip+pzzus9rsq5EgsMXNRnzug7slNTi9D3rnkQA2+cW8gPtt5itY+0Akqd8Dn2oBbF62+lPBd3IOTZSjIEcQPWj5ixg6mdBdtN27wyq88XhkjTqGuWDVoXoI4ufJSOTyNzDIZyB8LuA7ClJYFC2DiQYmDEm1xvQdQPCuPFW0uS/ogJpBOzfww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVMCHwa96mrRkJBmlhuaAjY0nMO21EmXUM1FvijGRGE=;
 b=HQgrQ/BStnxfWohs4IVxy6G6yLsDWZ+29Cq0RBpRdr7PcCcFDsB8sEaFh8R+XW+XMVR55VwquZL7VBp3wLzAzrz+RyTbBQeVdzHeJVMeEuRCTQnw7ADXrfxQH+xkvfkV0uS6d+DsP1Jr+qlhykZTSsh56L+nvTU8fGs+X1S+tc3axY2L2BIQSV09W/oWIDP8d1fgmdxVfXWDgUH+zMDIAtMhEVzbbHR1THlC72s91tNaiKAdM2rL5o0iMGxv1TJBrLhipE//Om72CrbDkFKyqtVBNRswM+xPSgbT1XVqFxeOJCP1AqY0zTjTRPdS+S/llYF9jXTwe87mq79x4VREtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVMCHwa96mrRkJBmlhuaAjY0nMO21EmXUM1FvijGRGE=;
 b=BN5PgCsTiqOWM+vy8FXYjvaDph+l8xQfm7IJIBNr9newbWz31Y7dmEyIU7vBEdVhSwFcy0yKm+Bqw7V4HVG+yuy7ZlU3rIUNxm58+jnqUdAXYyWt90FTLKJ83yUusF5ARDwDJMx80sRNsLg6Vm833aoIrLusEqveHgCmOay5GOw1d91r54PT3iGWogTywK6ozgvtLUQpfZkjsHlerICVESi+ed1p+ZNea1iWe6kcBpEa2AcAIvgW88+c3YNex5ta/qYeXxy82PC5hVr7mWdekBYaUyt/O36WdJPNky4tQRlRq3LFgP6CO9w/sfYzM4xzxVB3SWp1ytMhtT85QpoTvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU0PR04MB9299.eurprd04.prod.outlook.com (2603:10a6:10:356::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Tue, 18 Feb
 2025 15:59:41 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 15:59:41 +0000
Date: Tue, 18 Feb 2025 10:59:33 -0500
From: Frank Li <Frank.li@nxp.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: p.zabel@pengutronix.de, shawnguo@kernel.org, mathieu.poirier@linaro.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, andersson@kernel.org,
	linux-remoteproc@vger.kernel.org, iuliana.prodan@nxp.com,
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, krzk@kernel.org
Subject: Re: [PATCH 3/5] reset: imx8mp-audiomix: Introduce active_low
 configuration option
Message-ID: <Z7SuZfU8utauNxg1@lizhi-Precision-Tower-5810>
References: <20250218085712.66690-1-daniel.baluta@nxp.com>
 <20250218085712.66690-4-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218085712.66690-4-daniel.baluta@nxp.com>
X-ClientProxiedBy: BY5PR13CA0033.namprd13.prod.outlook.com
 (2603:10b6:a03:180::46) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU0PR04MB9299:EE_
X-MS-Office365-Filtering-Correlation-Id: 77800b13-a3c5-4fde-e83e-08dd50354111
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?++lPLDYdMo7E8v2yTorStloCkeAENb+SX3QYv7i5e3QM0xyiKdkIyuAe3hW8?=
 =?us-ascii?Q?7e+2j0tprIvBdA790t2lpIH6hEG2eYtvwnxoOhksAjKpFLoAbI0kgzcQNQ5e?=
 =?us-ascii?Q?qcuaC4KjlzaQLb1cBMX8ZJrQ566YOU4vDlgIwXtbZSBHmQA8E5BxSPjNlXm0?=
 =?us-ascii?Q?cEUYUkgV9M4SrMgnbRU/DE4wXPgfSE8ts+udfaHmDIKQ51a7lvjYLCcrs1fU?=
 =?us-ascii?Q?4m+284lr6/3pHEnyVs2gTJQQDeUerZIM/RkKNuYqlEBwjALs052XuIK8e9XO?=
 =?us-ascii?Q?+ATBoXRKstsXjQhZ6lJawwv+Kok4ZI9llKyDPAt+EeP2arfN2crx3n0gwGXT?=
 =?us-ascii?Q?834eWcdwy48coeM5hOOQVDPzUCGJqPcgR9a+iAljwhkI4K8R5v+kEdJ0B3Yp?=
 =?us-ascii?Q?VWF+KtcDMqH5BgqEQfIER0WHDy4i4s5ErZFkLWU0bbFD/SeZbHQ7A2dp1EpO?=
 =?us-ascii?Q?Z8I3mIGgtKYzpusXxacZRvQXzgREDlPFlP+x34blNNy9gR6nh3KswxVR0DnU?=
 =?us-ascii?Q?2SIo3g7XQkVuYhcA1M2VLhaK2Bte9LZVQX2dURJLeFeK7hii74ot3CcO1kzY?=
 =?us-ascii?Q?0ULJbCm+YKgmM0eEauH/8c+oEenfnCD7aKxmDTyFlCh7igARMY0CX6Nqvnij?=
 =?us-ascii?Q?KPLgeTdWtJyt8h3KnHWgT5gvPJmico03KMQ57o+7AhbFlU4e/mcExEzeIEyk?=
 =?us-ascii?Q?wW05wU0wPUVUyGxQGW0xgAU6IrQvjqiPOsFtZ9muaFyQhz2rv3Z3pNFJW+sv?=
 =?us-ascii?Q?gvs4MW85N4G2z1VB/1x64s57JRIdNej5oCFUrSTSWw5H9GbBu3ZYvg2PIOYQ?=
 =?us-ascii?Q?0H9jMmZoSOOAjQ60X+7OHU1HGov9KMrGgIzy3gHY4D4CAPaEmAoebJWhy8ES?=
 =?us-ascii?Q?fhbRh56Hsz9hqLU1sftVZqgbx6zvQFOIbkNcaTSFJTgSq6knlP1yymQeVB4m?=
 =?us-ascii?Q?73SQpUAyzDDLKIxrxJ3pSlSQpGbu92ifsBkBLqD/s2mjAI8mjF6pu4KNpJ3o?=
 =?us-ascii?Q?DvfC771FXcoiRnyhCriId/EO/rae2PE4JWTHHc3at+YqUeulJCFveJd9xOa6?=
 =?us-ascii?Q?oNPifq7qmcmClPg8kM8yVqlxHFhaM9/u16LUaSQdifSKc8nKtRmBqB5qDRtY?=
 =?us-ascii?Q?yINV3pTpRnjg5Phh1baNm9VbMBU9OuZEtXSrNaaAsRg1tSsp221hUBFU5/2T?=
 =?us-ascii?Q?fZnYt9Y1qjSB1b+BDU8LFCnQw28xPMRW6kV8n1/ptmBM8pA3Iawyd1j8Hym+?=
 =?us-ascii?Q?sGzBo2VLEx5ZO+1WM/zSRePOoInQDt7yU/zCHtEoaTVgE+9cAbo75uB+TWpC?=
 =?us-ascii?Q?t/qq7FHEc3XvF/7sRYnBof7pUCQxZVsgSPSCQb7ON0vRh7YW39/wAXwOYKV8?=
 =?us-ascii?Q?2tu9aGgICfuhJw+AtrO+RRX5IrrHya8Yi09xXcP9A8Nw4eFWfnRT4zFH0Kte?=
 =?us-ascii?Q?frPmgm5oQ4JQeHxpjqHzyxRYaD2UqKFw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r8YY/UwCGZXN6P1KGtkoPVd29czLzpM5As2T14RlZffnrEWbXMncGIPZA3FA?=
 =?us-ascii?Q?ssX5k1I1aklFquUx/PcYwrg8sAdElPfiInLILFoMzRg9IbysnCZC/2P3l1mf?=
 =?us-ascii?Q?YSu64vgWxSaBrh+0mUxCA/BF7fwYpjoR+Goi/MEOvmKR5fTcfYNntTiJiBlh?=
 =?us-ascii?Q?HbnRxG230KW8sjyzuhzXQgpCqeAtV0168VUjhV1UA/MxotwQzw6f/sS7FcQO?=
 =?us-ascii?Q?P8oAezVojDR42AQyfjdnCgYfGLGP7BZZT+V1Wf6inFmRBn8l0l8q7hQ+nzsB?=
 =?us-ascii?Q?t5w5mT2q7Fjg3QMJl/tu0Bm2Jg0/DBTwFiKSsJaN7bWcWZxEH+Qlc8hGqqBf?=
 =?us-ascii?Q?b14RcfJKmUEzH300XUmkNeSNsv5mQvCslRVnJ/dvOzDsvkbyUg/GENY6tPcT?=
 =?us-ascii?Q?9ETHFMD8IdQi+4+YWCnYfTtBmczoBDEOBYm9XuZ2D/mb9uZoj8Ka87x4d0zS?=
 =?us-ascii?Q?w21IoqyAVkCcWN9OHuZaW30oGiiTs/IRSnxxki6uxL1E+Nwk4adZsfocRxeE?=
 =?us-ascii?Q?0iDnmLj2EtM7/3DsjrbsAbUxDxpSTog8aWFE+0zC446I4h1J7L7/OP/96dPl?=
 =?us-ascii?Q?6r6q2wCPs0UPA6yUqfs2MdsAKr6Z5tGoDhOt0MJgb4N70GaFSK7j3+W2I3hG?=
 =?us-ascii?Q?GGemeuqAkMJj1nuRjcCVjoX5l22oZqNUYBHUPlHlymIud2Jd1aC4+ZajPSgA?=
 =?us-ascii?Q?EhAB/xsaflyFpRYSicUPapZdL8wMo6+CwvFvF3Q54PV4YDdgRbqbwBA+nJlV?=
 =?us-ascii?Q?0PyUm4tN+88OvRNmffTtEucyFxJx0IJ125uNHA54qaM0bHrAW9NiXEioCh4W?=
 =?us-ascii?Q?8RUzgYqIfO3KMLFDccqb2o0hrSy5IeZzxqWVqvKnvB/YImi0ND7JczPV4Oq9?=
 =?us-ascii?Q?aeZmw6ywtC9Tby9293ljNZf7t+/jkL32JdxbRBbu6cZ/uIX0eftHEGy8orcN?=
 =?us-ascii?Q?vfISPU0OC29FzZqECFbZE/t13516VuuKZQ+l+oAUSnyj+Z6zVEykwuH3vumy?=
 =?us-ascii?Q?9GaCvugrsdD1tG6ZCsBFfebRefBrmhUTFYWKa5uGxyiNmTBFesSMVLD7Wi9H?=
 =?us-ascii?Q?L1MoBdTQ2ecxZHk2FPOKtN2jG9/DoeEnCHYE2QhYzqhxSQ9Q3JLk1+cSrCuL?=
 =?us-ascii?Q?JRmeu0CWuIW5nfW7gRSo0gQKO8J+FgA4qw6spYZq8avynqQmlobpEHoVMXSD?=
 =?us-ascii?Q?HV6WOb/YcJqPGQBMOSpv5U1RE5u3pIZLG2g9oPsClnG2GHNyqrCQlJYytELc?=
 =?us-ascii?Q?gO7QnyarXPDQVWxzLMOoMGzPXZA/8T4R2lNSQgigeZ+fvbByFlcoNhqbMOOn?=
 =?us-ascii?Q?XIdQOoISEQk050lvCw6zNTWC1Ch0meeoLvcbfaVfclv2tDEQjaNVh5NTQ0Ql?=
 =?us-ascii?Q?tS1XDN2fQaRrdyV+P01wT9VYPyWTmpSSkLFIRWr/x2EW7mwr8gPvuFUlWNg4?=
 =?us-ascii?Q?Z3D6BUsusHxCK3cTOxajXgYezrLiGcQNgteFUEt4f40bzM+htUmj3bxpnXzR?=
 =?us-ascii?Q?P0W/TLXO1ZNkMInAKrKAu9948ibNSCzBTf5S4sXnQcfNFxUsHdKWdFZ8d+ZQ?=
 =?us-ascii?Q?BI3ZO6AskjZrT1OkkDU4s+srYOq0rYiupHp9rojr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77800b13-a3c5-4fde-e83e-08dd50354111
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 15:59:41.2788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4LgqwXiVypcm3gS0IZ481daK/wprSRmQYEujvHp+HvHdx0ivVGhpMmQc215chszf4FaT9Pg4mginA9f9yY8cvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9299

On Tue, Feb 18, 2025 at 10:57:10AM +0200, Daniel Baluta wrote:
> For EARC and EARC PHY the reset happens when clearing the reset bits.
> Refactor assert/deassert function in order to take into account
> the active_low configuratin option.
>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/reset/reset-imx8mp-audiomix.c | 45 ++++++++++++++-------------
>  1 file changed, 23 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
> index 6b1666c4e069..8cc0a6b58cbc 100644
> --- a/drivers/reset/reset-imx8mp-audiomix.c
> +++ b/drivers/reset/reset-imx8mp-audiomix.c
> @@ -23,16 +23,19 @@
>  struct imx8mp_reset_map {
>  	unsigned int offset;
>  	unsigned int mask;
> +	bool active_low;
>  };
>
>  static const struct imx8mp_reset_map reset_map[IMX8MP_AUDIOMIX_RESET_NUM] = {
>  	[IMX8MP_AUDIOMIX_EARC] = {
>  		.offset	= IMX8MP_AUDIOMIX_EARC_OFFSET,
>  		.mask	= IMX8MP_AUDIOMIX_EARC_RESET_MASK,
> +		.active_low = true,
>  	},
>  	[IMX8MP_AUDIOMIX_EARC_PHY] = {
>  		.offset	= IMX8MP_AUDIOMIX_EARC_OFFSET,
>  		.mask	= IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK,
> +		.active_low = true,
>  	},
>
>  };
> @@ -48,48 +51,46 @@ static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_contr
>  	return container_of(rcdev, struct imx8mp_audiomix_reset, rcdev);
>  }
>
> -static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcdev,
> -					unsigned long id)
> +static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
> +				  unsigned long id, bool assert)
>  {
>  	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
>  	void __iomem *reg_addr = priv->base;
> -	unsigned int mask, offset, reg;
> -	unsigned long flags;
> +	unsigned int mask, offset, active_low;
> +	unsigned long reg, flags;
>
>  	if (id >=  IMX8MP_AUDIOMIX_RESET_NUM)
>  		return -EINVAL;
>
>  	mask = reset_map[id].mask;
>  	offset = reset_map[id].offset;
> +	active_low = reset_map[id].active_low;
>
>  	spin_lock_irqsave(&priv->lock, flags);
> +
>  	reg = readl(reg_addr + offset);
> -	writel(reg & ~mask, reg_addr + offset);
> +	if (active_low ^ assert)
> +		reg |= mask;
> +	else
> +		reg &= ~mask;
> +	writel(reg, reg_addr + offset);
> +
>  	spin_unlock_irqrestore(&priv->lock, flags);
>
>  	return 0;
>  }
>
> +
> +static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcdev,
> +					unsigned long id)
> +{
> +	return imx8mp_audiomix_update(rcdev, id, true);
> +}
> +
>  static int imx8mp_audiomix_reset_deassert(struct reset_controller_dev *rcdev,
>  					  unsigned long id)
>  {
> -	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
> -	void __iomem *reg_addr = priv->base;
> -	unsigned int mask, offset, reg;
> -	unsigned long flags;
> -
> -	if (id >=  IMX8MP_AUDIOMIX_RESET_NUM)
> -		return -EINVAL;
> -
> -	mask = reset_map[id].mask;
> -	offset = reset_map[id].offset;
> -
> -	spin_lock_irqsave(&priv->lock, flags);
> -	reg = readl(reg_addr + offset);
> -	writel(reg | mask, reg_addr + offset);
> -	spin_unlock_irqrestore(&priv->lock, flags);
> -
> -	return 0;
> +	return imx8mp_audiomix_update(rcdev, id, false);
>  }
>
>  static const struct reset_control_ops imx8mp_audiomix_reset_ops = {
> --
> 2.25.1
>
