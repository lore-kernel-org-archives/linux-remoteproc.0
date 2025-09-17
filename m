Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010022.outbound.protection.outlook.com [52.101.69.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4012F39C1;
	Wed, 17 Sep 2025 14:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758119947; cv=fail; b=lRteEjtSL3w3Dkj3MEjJhHCIqBea6X6f/IELKRals4T2TIVWQUJ1pUN4hLB5SnrhgvnnG7fBl00vhFQAPTxpE5jH+zqHoVpcf4V9ssm/BFuFfLoTb+LX/Hk0WPuFv31hZJmKMRQTekrTvCBU+GRJgqIOzdHbKkV6T8pywBs08JU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758119947; c=relaxed/simple;
	bh=wUPs+yhVJbkABKM4ntwJACaMMlhbXAuD/1j+fmUnFM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t/RvQwfYMJdqU9YnYlfn2bgCYCGjo4UY4AcSByTjNaML16aYz0gyojsVkhLclGJ/oDUD0+SnEV3oLl7UdBhlaRZoegDDM4gz19O2ZEQapWqLaY8hLuXcrOXL1TmBE5dRDrr+qHWSq3ihvND/+HZ3r1NcdlU3HKyMK/JpiFbmb+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kdKI7dA3; arc=fail smtp.client-ip=52.101.69.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kdKI7dA3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6/xoIY8zCrT+HBo8P8QYruF438YGWlg5amu/jEygWm/6v6EErBPxqQ7E0t00QlzwyQ3crTrCVIt8J/KINpz/+NDnnxgCoIAWWbHN6+BF+2RgFbA2oFadlX8PnJgkyZhgIbh4vtj6t2tcFfmAoKz02CZs1EjqjIRxrctygTJz95joll9JUYyrA/5s7NRSlUr0q04xUx1/yRMLFp5vFeMsDJ6jWExIMsMoTqEDUkeHZjZh2aAvlrZX4Tt51BjyDiCKyJv3Iz4NnYH1ars4EsVUESXr48UHN4HyqagPuFB5/CEvtg62PXLIvuBMCP70M3TbIWxuZcGIjozfr/o3A3Q8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xk7LbCHuAHz9sYLYX2UR8hcdpnMrmhmh3sli36HAZhM=;
 b=SBIYCP4K8fPhjFn4PvzpFYx43/g5f1YtUbERke1g5bpalVurYqkAjRKPyjUKeMylifLb7TmS9DZNuEy22MO6tYA2rR1u/yvHcei3PevMRlMkUKvps+CSaciTNdlqBl9Rq+BKG3Z+rOQPHMCYAbdvJZ8Y1tfCPLmBBinJqlH1mzugzkhPW/pE9QMhpWyQjG1W+SvuWohF6GgjLq+l069Chh1PeB0jI1GyOEiyM2iB/0i9R/JUwHX7gB9D1u5Cz99wtAaQ4jQnnWoOm6F8va1SDgGg4nlu7PayqbodGqkBShmBZ+Q3B0tM4VFSCF/tE02dRL18UtWmN0RhgrpteFxIhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xk7LbCHuAHz9sYLYX2UR8hcdpnMrmhmh3sli36HAZhM=;
 b=kdKI7dA32XP4Yioghq14G9EDUiMmHgX0S6ZKWMn73dHfGN7hiVX2gI/gX4pwaw+ab31y4chjh335m+pVrN0rzWBoQt/ZMEVUuBUoTCYNGoJ2Dh38QOyjSMx3pbOuhhW//ZUWkE3On7ziQ6cNMbcaCmwuoZ162W6GEcBxjrMymXbKA1RdFB+wE3ZwQTCZ7FWSYhnBfo65nG0Xh76sWfyemaW1QAEZHesrApYXYnB2pM4DgOF5T6VSUssTesXNJ72Qwp8HFZv3ETUd0bivnHWVKMdwTkqoHw0pbOWCyWoJkiddkrZYUTJUAu8rKzR9/A67okP2/rbah5a1Hqqwfvm+nA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DBBPR04MB7628.eurprd04.prod.outlook.com (2603:10a6:10:204::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 14:39:02 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 14:39:02 +0000
Date: Wed, 17 Sep 2025 10:38:54 -0400
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
Subject: Re: [PATCH 6/6] remoteproc: imx_rproc: Use devm_rproc_add() helper
Message-ID: <aMrH/ic5wc4cyHCs@lizhi-Precision-Tower-5810>
References: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
 <20250917-imx_rproc_c2-v1-6-00ce23dc9c6e@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-imx_rproc_c2-v1-6-00ce23dc9c6e@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0267.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::32) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DBBPR04MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: 33cec598-40a1-43b7-6bdf-08ddf5f7f253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jhS7blzc5z/eKnWDvP/Nlo8FKjVqlAyE7dFxkjVSq6z6I3yrwb3gne2mdKHY?=
 =?us-ascii?Q?3w9cs+zaPwOFBEdeNVvu7jtJdPDC0Zxv3iAAIr3RoTs1DHHQ85i5gOEAhpqp?=
 =?us-ascii?Q?6Ee7kvaT2LWWyc9HaWXwL/YXO14LoXF6iNfZZWHD+nQyKGt9gFbL+aMN35K7?=
 =?us-ascii?Q?zECLvTR9FQy4cFRqrlaCaARMS5nsFQtdbg3yMAuBXtN/xpzDXx2jXV9zbOzy?=
 =?us-ascii?Q?SS+v3mWhtmKwoOllazYZ2cdW358ai6ASrfomUpdCv4gPeze4efP0yw/RYZtF?=
 =?us-ascii?Q?FSB693TSwChhuBEde4JR1Imh8s0zOAAgDxPKYmLw4jUmqvJZmrrrkOx8O8KV?=
 =?us-ascii?Q?ETulTMIWTqpGZvZRrEVjRtKBqFr2JIKmSIGs0E5CyWvpOW4DLHjgzwchQ8aH?=
 =?us-ascii?Q?5750K4UXHmNJL55oR1G4KZKVHFCd55hQDIT0i/VTazN+IKEmCKHARqdl9y8c?=
 =?us-ascii?Q?xKF5eIU45f9KIgCoIm2aIv+t6Efw7FD52FBB5vecjMXSGcgyfJzJk+iLy6/u?=
 =?us-ascii?Q?H69DEy8QCjWuHTOFxADIB9u1ThyCpgmbhYy1WxJuKQFY/flm0w/HYvaaC5ru?=
 =?us-ascii?Q?o8E8NN/DTgNOOhdb7F1+x1LaVxQAE7QQlPeHEDIZGX23NFb2uIimvsMpJM21?=
 =?us-ascii?Q?R/FD3l2FZKf8fVsp+9mlx361T5nAkp6DLxMjmwn3iUKz00xKtpWijW3miLsN?=
 =?us-ascii?Q?6A2acJx/4CWpkYVmDGgKqZFqwwiVqzuhckN6oG1Ecmy/bQTxY16ILBuk2z8e?=
 =?us-ascii?Q?LKTcBGs1xMq0wkk6nZJOfLK89OL72H7A7srJpAxOc83In0S9clal7DFCgN/F?=
 =?us-ascii?Q?POnvmrxqKbdZ+72zqwnW6LNiw6S1wqO0xP5S4g56O+UXbEsdDGO2g2QwZNsN?=
 =?us-ascii?Q?3Ky+LWAi8/gtSgHyDKrXhM88Rfqdgw2BLWwua2zJYNEJuBzBH9lSz1x3o2VJ?=
 =?us-ascii?Q?iSKNCP4eye2GZ4w3QL9ukEW8XBIFxxD72kgduISv3ExBOYDuEudWBMLAeTek?=
 =?us-ascii?Q?SM95TKLp6CyQTDSlvaxxXcZ4+KWE7UUG+Vmn795f1EJ2K0AN0VFhxfrMlz6u?=
 =?us-ascii?Q?Nn1pfUvRKfx233Igf2v+xMB0kJkjTSYKmLEcp9dNAZm2ds2a4gNMzXF87h35?=
 =?us-ascii?Q?UDjsr12tAfpZ51oqAnDlbXK48V2fSXlFLhgtBpAmDoB86q4lf8Ldlz0cLELd?=
 =?us-ascii?Q?rf7CIAE6Q5KXyeLFpu/fQONSC1XnFupZXl4ZbdcU1mFtJLrz2v3ZPotj0OU3?=
 =?us-ascii?Q?e/PyHa2WWUtoahRdDTzDCPmz1zdfk7JvoYcfv15bbH7/wkZrj6kQNzhK2gnc?=
 =?us-ascii?Q?YmSADRg4zrezvSGMo7I+ottqVIwMGeUvfMrf2OlU5NNeJQeh6EvX4p+PsDm+?=
 =?us-ascii?Q?7FP6g3bxLWMVC0wGUDQZhstecBnYAF7VGfYHkZKmS+zPD2gq/2EGZ3KMbWKX?=
 =?us-ascii?Q?PS8B5Mu+Mg2i2CJddDeWHLF/RRHNtpKJ7OUw0cft4uCbLXCenAm6ig=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PSWI6y4jAtGFzA+4stTLsp+XsjUpmlx6y+4TUnu8HLgn/oBe4s8/kpSRP/3J?=
 =?us-ascii?Q?84AYBr6z9GsXQaMXKIvF4vp8uKrRKbj+e9q9/k6PVlYjwmKv31xBchTU0r7A?=
 =?us-ascii?Q?B7nyPfGN62KcwwWLnGHROH0yQH5zENKlIkMtT/Ep5h+wpIgD+sMGivCS+WDF?=
 =?us-ascii?Q?7cXx6EvoU28D6hDBmoqckVup1Jt2gu/ULL1p8rHpMtvYwCyHfn7WzKeSuwd3?=
 =?us-ascii?Q?5A+THTb/D/ERHhFAX0yMXcadsTg2nPjqihXwj2ODO9kveos6PS8jLORvYVpC?=
 =?us-ascii?Q?JDxBgrE5dJdQAbLSeouj9fFugO12UNaMyvLGEWrL9uDsf3Rr7nAww0oSV+Vg?=
 =?us-ascii?Q?UQKdgILCpdzObMrBghQ8da9LBDKfSzLdmarelBiKb8Ctvy28wODKSJkJImqp?=
 =?us-ascii?Q?Lx0f4YQg9LMhyweH6/LpkrBXcbZZoCHQpUR+psZhkn/k5ca98o6W/8W/Cw02?=
 =?us-ascii?Q?rRa7nSKB5MG0YSEsF+tAi8FOY2ZpK+GvMq4k5sLTWVS0cUcZtz5sVtLK0CRl?=
 =?us-ascii?Q?hqPdOMPvYATjsbpqrJhCtsWyV91IwPi6pQcmVRKESaxbCuFqLC5sBGYlPzDg?=
 =?us-ascii?Q?Rv493DEKc7KyBi/Q9YkrYVl3kM3up3oHFh2h/betpZP5javn8/wxRv8PdoWj?=
 =?us-ascii?Q?zDHeeN1wYInYeU1mBQ3NwDxe9JOtHxbW9epgCmbXUZ3M0xOEM+2naF9yA/az?=
 =?us-ascii?Q?hnmbb1e6DXjMhutT4j8+XlyXPQ+ylk1NOq62R/cCzgtXQ1ZzAu5CAfq78uOf?=
 =?us-ascii?Q?Ch4Xi95yaxY154QoD11u/ScIARmsUIT/WSnXhIyZ+igIQWMWjXX1+zpL65SV?=
 =?us-ascii?Q?UrO0KspyARAb5txw2hjFDIo2aMuvRp+FBAjQHx4mWc2v8+xBwA5qVBpv1Nf6?=
 =?us-ascii?Q?RshnKpD0y5B6pmnA1h/V73donetSZXsmM2ZeoMVbYvtj9sR68bfOeSNvVLY7?=
 =?us-ascii?Q?rFsRwXPR6AjbN1RFDV9M2gSNo7dfyptfkoASDT1EEle48nR5/iKc6N+nJQ1Q?=
 =?us-ascii?Q?jRu4qnqadBpr9KxEcDob7fR1nefxY8Jl6dAJJDM18hOTc7Hq3xBh3W0g4agZ?=
 =?us-ascii?Q?7acef9FuBfuyTj2UQ6gILrqCFS2t+Ks4msBrAcm3VZneT/qF/f9ARwr2M8GF?=
 =?us-ascii?Q?gsP003CWo4mFdUpl8Ts8TWZTuFzzBnQSX/oAitiaLwvVZY4IdUSmOuGiuOZo?=
 =?us-ascii?Q?pvMJ2yOK7S7HmginLxv8ePKuQYPZIrgT10Vm/evN4GCcRViB94WX0n8TDu1r?=
 =?us-ascii?Q?3tmRYpWforlqVY/0KcwANRkufWz3lSsqJZziEYfOqiLv4T3tVJzCUrs1FaQI?=
 =?us-ascii?Q?Aditi34j+2FRV4Tov40asFPU+Kr3gorIanu1p5m55iTn7KJbjQMFBVheLlqG?=
 =?us-ascii?Q?ozmVVt5r/lmJtrdP++62eJ8edS5ctN1jT9Xv8UJo8cd2gWh+g03Q2BS2lpd4?=
 =?us-ascii?Q?Z2C2OCOYQr0pnnQPt6WrWhmrBuqIN/bgwIcMbcSJRJu9dbcCwhwvNLgPBFX0?=
 =?us-ascii?Q?9zgLScDRZUXzXyllhHkgL5UMObBwA7t748jqDh2qlcbN4ik/N3oFk0S2YrSM?=
 =?us-ascii?Q?CMte14QzxR+YeSOvOviy8FqOQNuCAXqkBPn43u00?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33cec598-40a1-43b7-6bdf-08ddf5f7f253
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 14:39:02.8818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D64ccE5bTA9ci+Pfk8VxCxWQrddnliDOdEAkR2yUDxT6P4jO1aSETSZK33VUnPfvzZdOOaOAdH4/jvYthMW4ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7628

On Wed, Sep 17, 2025 at 09:19:18PM +0800, Peng Fan wrote:
> Replace manual rproc_add() and cleanup logic with devm_rproc_add(), which
> ties the remoteproc lifecycle to the device's lifecycle. This simplifies
> error handling and ensures proper cleanup.
>
> With no need to invoke rproc_del(), the remove() ops could be removed.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/remoteproc/imx_rproc.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index a53ff186d218f54123e1ce740b0277a6fe95a902..694fbbb2f34061de22a3a815f8a6114159585f9e 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1149,20 +1149,13 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  			return dev_err_probe(dev, ret, "Failed to add devm disable pm action\n");
>  	}
>
> -	ret = rproc_add(rproc);
> +	ret = devm_rproc_add(dev, rproc);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "rproc_add failed\n");
>
>  	return 0;
>  }
>
> -static void imx_rproc_remove(struct platform_device *pdev)
> -{
> -	struct rproc *rproc = platform_get_drvdata(pdev);
> -
> -	rproc_del(rproc);
> -}
> -
>  static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {
>  	.start		= imx_rproc_arm_smc_start,
>  	.stop		= imx_rproc_arm_smc_stop,
> @@ -1288,7 +1281,6 @@ MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
>
>  static struct platform_driver imx_rproc_driver = {
>  	.probe = imx_rproc_probe,
> -	.remove = imx_rproc_remove,
>  	.driver = {
>  		.name = "imx-rproc",
>  		.of_match_table = imx_rproc_of_match,
>
> --
> 2.37.1
>
