Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010035.outbound.protection.outlook.com [52.101.84.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3153168FB;
	Fri, 19 Sep 2025 14:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758293538; cv=fail; b=rp7Aii4Ea/ZFkIOCvyrAr0Zt4vup5J+AZgZoOj3n0wwD48v4vLZKyHM/9OGF4dUdjOkB+a7TX9zb8ditslKusXnq4PKM/OsMvTDeJ0/IVxaFPvS3KZrQFGhTTK/P6u/h0H+as7AsD2/j4Z3RdgCGfKRyKlQzZDMYWELMmP5OaIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758293538; c=relaxed/simple;
	bh=7btwTV+vIXRpGuR/cK+yLFpjmLprddX7s7D8HmNAK2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dC+EyPEp6gAnkeQucCwM1nW3YBnObQ9Fy4ctIayXA0d0aIsQF0MiF+T3ANlsE+3IDkswH8WSTyhb2O7tzrUsoqpkCV278jSlrYO8YIiK+z2SxDcAA6lMgw0l+RgsEmJq9VjjwPpnWG5yGPM1J5pYPUv3xnLOxQY0yoI34jz7Udo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=X2DiJocT; arc=fail smtp.client-ip=52.101.84.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="X2DiJocT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JiOtsTkOw5S06XHk8xHmTiAFCtujBrCrtrEEZWGw7zrTrc8c9M2xlJYe0KsHmmFjpR7n9inKOPrH7g/SU4zLf4ozXitDcCjCATcWoCmL/JC1x6GGsLEAW+24moBf8EIWOIlFAmcjs0TxBpGPu9Fcs89uaNl4UdysNOQgPQ4sFY69IkLAbvopPGskIkZJzp84bkgTconZ6g65pHCV833ZyQEts37HRJrxrNyNQK2VtTDmKJsX23+e7IHPLjbweBR7BVhjFkx6ay5rd9mK6+oLRQsiYayi7UUWKnkjNhkKMt28eDeitV0Cf+v/DwzXxN/O7hvp3kuyYIeV1E+H5n1nUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4x2JrOasC15lGjTDO2z7N5KBQQ1+w5H1EGrZtZKx/Bg=;
 b=eXgu0iYX3bAHkgUEjW0edHkq/m082YHYMMVVpYxFTkqlQUfmZuK9rQlOyKzJcqzwnpG2NGLxUM9HfPpuSY8yPZxB+fZcT0qfemUSuzPtqtAfJmPzWfD3C/kPEp93J+0QM9cUY2PRAiUzj2tA4enxa4PJNJY2qKpqhKehwfUTcApzzN+G3Wyl4FUideldqMsm2SDiymQHzzIc2ws5mz5vpSUp2Atyik5ZOi9q4cBJH+2uurGPDdPjaDV3ZtAdUzT5RRg0idFvGaINkO+bpqhhawx/2K26FJ/iYxBFaj6xT4iHRma3nfZ9dy8O/1oxy6vFu1IALXDzo7BN2+rmFMOaTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4x2JrOasC15lGjTDO2z7N5KBQQ1+w5H1EGrZtZKx/Bg=;
 b=X2DiJocTDUOrHTQ7Cg+XXCc1072BogL2APz0lhx2RX/OyfwxABCr4yec/hHbOLEyxFsz8iQgy6FBGZ6iKN1RcYkIzMntB3mr/6Snh7XS+mHCxXegc8xulX8ZrQeL6my9UKUMy7Gqj6vfSfxtoBf3X8ed/71Xu1hjPrByCSSfp6LVMm4A2utH6BsuJwIEbYMvg65IIifaJvC/XF68mPaHPq8osUuulQINpmfVMlgIFYJDyVuR56QFI+oDD7G9bFrG10agIB5BzoDTmt6hAQyszxPInOLbUXf+dMEnvVu1surCD8jIbG/bKMBNeD/P3HLlFW1BJ0qO25yptcMr18MJYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 14:52:14 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 14:52:13 +0000
Date: Fri, 19 Sep 2025 10:52:05 -0400
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
Subject: Re: [PATCH 4/5] remoteproc: imx_rproc: Remove the assignement to
 method
Message-ID: <aM1uFcNmSAUw3+//@lizhi-Precision-Tower-5810>
References: <20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com>
 <20250918-imx_rproc_c2-v1-4-deec8183185f@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918-imx_rproc_c2-v1-4-deec8183185f@nxp.com>
X-ClientProxiedBy: PH0P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::30) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AS8PR04MB8897:EE_
X-MS-Office365-Filtering-Correlation-Id: 72e33d6a-6f06-4674-17f0-08ddf78c1e91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7y6qlQXxgAwgWwddDDzgL5IyqYEg4rPe3pJnJJYfkfvjxOglN3VrbxOjfYb+?=
 =?us-ascii?Q?cw/cMNba2GYAytpThdP5U/dqulSK6IClV1sg89iD/fk48O0fFtlpxzWkWNDY?=
 =?us-ascii?Q?/91pAnOcbmcTQ6+8fDVKSnmA1WPqPw+PQVh4npDDrENz5FqErGtrerWlxwyS?=
 =?us-ascii?Q?X00Y8RXhhIx73jOoKFrSUp3FNMDCmnZl0bT7q8MQmvrw234xWFWTHNznVFSe?=
 =?us-ascii?Q?cHaY5gE7deS77llNuRwSCp4Pi0KLEF79VCzyfsGoHuLa6sMjQ10IZfjOH6k1?=
 =?us-ascii?Q?YtMwVSTZecqPpluKjWzojOmYYLu7e6BmuPGu248uteCZbFVvIiJWa0cUcaVx?=
 =?us-ascii?Q?vswtSlJ5Et0rOcZYHLtITwNL7t+dDW5DnwP3Jk1EzWPawgkD5qamM0K08DH6?=
 =?us-ascii?Q?XSFbXhZvfxQXsnAhoH/zllG9N0mz6iLWKZZLCupoyP1X4cTHRuhWWtFCXKoE?=
 =?us-ascii?Q?NkUKl23/6ZVvY69w+1UCsvplHi0PF2iqfd47U/5MX4tqS1tC4Qf0WK/jwt3z?=
 =?us-ascii?Q?VU84H7VBBaqfBw0DGg+meh5w/6tm0S1K4HgieJQWb+QYGT52hkJIgNeC9ElF?=
 =?us-ascii?Q?qQXnfPDBrHb95cQq24bgsseZ8+BYLeWc4xiFKmgfdpT2JmfbLCHgGgTSO3uH?=
 =?us-ascii?Q?ZU7ib8/zG9soOmg+fbfdjSRM7gXDDLtZbzUf6cR2iQFg/+kWibVyaV4piquu?=
 =?us-ascii?Q?r9EU0qy8DXXpOsVLHZYJVF5lJk91IT8L1N+VlsUzHqzZ5tjUv+EM/bxzyPib?=
 =?us-ascii?Q?b/YLmcUbGQ7sH7cbcFCn5oTVhgaI+38S/BiRyqhfB+dA7ggE6fLo0MG7lb3N?=
 =?us-ascii?Q?CFXCDdIymzUxkq3nsco+gc6wHBk+mBLSZqfBoEh6fX8vwW1AoW9TaMjOCHiR?=
 =?us-ascii?Q?izSBpuluL4z8lGaR4m5ZG/N/+/BSmcg+/jIGkNOyvCPBXLuea92AmsHPp2Mb?=
 =?us-ascii?Q?C5pSoe1LDqSBjU+Kx4IAVhHPaoQ4tXx5yXRnPp8fN7kr50kt/DHxVdB1yqwN?=
 =?us-ascii?Q?NZN6m4lT0ETZ3VDkMdAbOTY8sIvnYPh8ST6jidFdfddK3I88SFhgUGKnx2P3?=
 =?us-ascii?Q?nE8XAOyEqxb2Hy8tTYpznN5me+T5xeWGM7p5gE/NlMzhRUUNaW3vLCo/CO+Q?=
 =?us-ascii?Q?aeS/88CF88YuSb6sbpgIzCMgE2+qSOHgqwqLE7rhdGkm4erQdwu9M2J2zh/8?=
 =?us-ascii?Q?bwDVVik4bnovDNy5eoz84fi1xJP+tM6wQ4n4c2BD0dLwwuK4DSOvxMAkZAfr?=
 =?us-ascii?Q?G9F9wl6Sl5ZDbCsiFgXW8khb+5MGiS0A9PJI8/TTqL5QwZFux+wHZsTxoqCs?=
 =?us-ascii?Q?tES7g1S3BQHCJ/VFco1K/S3Ft/XOyOUpsCgmTarKcPn7JE4CRwwm+qxT8hpr?=
 =?us-ascii?Q?8zcrCK/IHE//aEO24kSBoA5qM+4CGnaKrWOXzmYHGVr4BTX3qQfS1f56RUdI?=
 =?us-ascii?Q?VvNvFJnFnpCqMGOtFsXN4T/eJ1SjaZm5y7LWbN7bgn5Ny6gE4wIuoA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e/f/nyg3jNoB2o5wk2OnOfjxlrq/kz1oCvQbSxIMBhaq5E5unMLPOOk97QdL?=
 =?us-ascii?Q?630e5Od7X82U9iSSH8tKJkngkpeUCsnwnzdH3vGhzl8Jhrdn9W9dCp0j2h0r?=
 =?us-ascii?Q?6KrEX45gQpp8Y4GGFTv9X2kBRibG0pPZYH8HhJCAZ5e6lAQelmm/nV+y73l4?=
 =?us-ascii?Q?1RcsySdUSD0CGjYaIBEV0OhYFTYEwLd6e7NKGALTD4bkwxKwPm4n54aED7PL?=
 =?us-ascii?Q?tH5tLy0CJAnWWt6AMfZaP6D83X6A7BLCWcsBahwYILzX/gPSQsZFEgasVmRQ?=
 =?us-ascii?Q?JIHa0NObysX98PID1gAn8O4V2oQoPmSYxXS6k01Devx/m8TkiHYexuA5GY+p?=
 =?us-ascii?Q?LQJH+CvW/5WmFZpgdtl28Xp7BBovYhxyPYUWweDXfA7VL/JHs+9jaWhIvk9T?=
 =?us-ascii?Q?31VATwYChN1tGiv5Deo9YjBVk80TrcrNBHvv5lIr0VeONCCyaZKdbTYuqMHy?=
 =?us-ascii?Q?kqsDOVbUxpf4e+fhZm1X1aJNQSsCPC0dpPfMZFotudRW9L5SxNp54l+0CkK3?=
 =?us-ascii?Q?8qNhPFb73oA8M4WYPeBP0P5YtFNrne9qD+bVUNaGayrs+QUE3FEfpU2xtTtb?=
 =?us-ascii?Q?aNUwaa9b/m3fHYwOsEAZzWQFrxNhta3K3vYkMDQIayr1ymQ5X5HqH0TwNiu/?=
 =?us-ascii?Q?ILEdLzWqvuanClcub0R+5dYAE/DCkEgg23274Ifezd8e8U0zyYTDHOjiD0so?=
 =?us-ascii?Q?pj+NmQ3sKqd8Na2YEF7Uv98llCLEONyFb4srg5xY6bOkK9JpnNGacFFlJtW3?=
 =?us-ascii?Q?vuORJDASSn9qkMBXVbZdx89G4sij4pFNCK5S4r4GfgV9CRnL2ss0G+fn7VaQ?=
 =?us-ascii?Q?7Pjztz74fMEcgT+eRPu9+po5/r7e4eDJ5WWTfr/LrkG5su9VY5M12ejdTMwx?=
 =?us-ascii?Q?qcyXWCGH1SWLGHtpyf2CPx6R0qdPKZ03PDYTaM6xGDEY8DfNa/QhoLhNyEBJ?=
 =?us-ascii?Q?4HwzXdSSlu0hTpZRiD+YvikkfzPost0UZuyjnevWnVoFoBACt+HIqwRnmXrt?=
 =?us-ascii?Q?AvRB2Ci3ddRJsmQNom2RTNueAc54+6ggNMhCZ8bcoSaPstlZCDcsqSsDtGsI?=
 =?us-ascii?Q?wDbIaFAL0Dzmbb0wzxYPE9ZYO2yfSv6fH3BvLviTRkKjhsAlThA7vuAGNi7R?=
 =?us-ascii?Q?MoCh1m31Yvefm/amtrMCAuoyRSbYtvCsO1mCCZdczxK7O4Mksk/G/bf33OnP?=
 =?us-ascii?Q?Bsrye2yPSHTfX9gZeSLPsvT4UCOSeZA8I3A6CSQjsqmPAl4kpvcSkIt09o4c?=
 =?us-ascii?Q?Np2YaKWgmnCLAVNoyN2KIvzFB9IFgDTdiyQpMUA+dg5Ifu3vHQ+8Y0yVRRRr?=
 =?us-ascii?Q?WgGRhZZFw9BSCeS+74McJ0SOV2/DcRAmFFKVcHeKiT1P+NEOP9+x6pL/8K+K?=
 =?us-ascii?Q?s7EpnI9VvJ8yae9WdvM3VlpCo7U5QQ2Qs8TCFflsvjZhPYO8xKlXFcqKsZKs?=
 =?us-ascii?Q?i4MOHAr0ytL2gxyey247h+ya46w6X7vsnIov+IKWzhVk3X8f06ppd7gKPVDu?=
 =?us-ascii?Q?lXAB1MKRTg4ZGmUpJUJNiSOB8hRsIZQSplaPwOJHOp9bJKdrZx1ElhEDk3Td?=
 =?us-ascii?Q?KVJ+s9Jl/gnrZnWd/os=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e33d6a-6f06-4674-17f0-08ddf78c1e91
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 14:52:13.8210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mkWawUhwlvttYTp8JFyfstemqNdq404GtEaVzFYFbrxy6EN1iwFHSLtH8vXWtLPpx6pFoFc4BghsxOfo7ZouOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8897

On Thu, Sep 18, 2025 at 07:51:19PM +0800, Peng Fan wrote:
> There is no referring to the field method, it could be removed now.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 69b57cb4b251d9fb65a23e139a1960bf29c175ed..46fe7c147ce01ee07a610341b85544b79baadd13 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1170,7 +1170,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
>  	.gpr_wait	= IMX8M_GPR22_CM7_CPUWAIT,
>  	.att		= imx_rproc_att_imx8mn,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
> -	.method		= IMX_RPROC_MMIO,
>  	.ops		= &imx_rproc_ops_mmio,
>  	.flags		= IMX_RPROC_NEED_CLKS,
>  };
> @@ -1178,7 +1177,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
>  	.att		= imx_rproc_att_imx8mn,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
> -	.method		= IMX_RPROC_SMC,
>  	.ops		= &imx_rproc_ops_arm_smc,
>  	.flags		= IMX_RPROC_NEED_CLKS,
>  };
> @@ -1190,7 +1188,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
>  	.src_stop	= IMX7D_M4_STOP,
>  	.att		= imx_rproc_att_imx8mq,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mq),
> -	.method		= IMX_RPROC_MMIO,
>  	.ops		= &imx_rproc_ops_mmio,
>  	.flags		= IMX_RPROC_NEED_CLKS,
>  };
> @@ -1198,27 +1195,23 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq = {
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qm = {
>  	.att            = imx_rproc_att_imx8qm,
>  	.att_size       = ARRAY_SIZE(imx_rproc_att_imx8qm),
> -	.method         = IMX_RPROC_SCU_API,
>  	.ops		= &imx_rproc_ops_scu_api,
>  };
>
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx8qxp = {
>  	.att		= imx_rproc_att_imx8qxp,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8qxp),
> -	.method		= IMX_RPROC_SCU_API,
>  	.ops		= &imx_rproc_ops_scu_api,
>  };
>
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx8ulp = {
>  	.att		= imx_rproc_att_imx8ulp,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8ulp),
> -	.method		= IMX_RPROC_NONE,
>  };
>
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx7ulp = {
>  	.att		= imx_rproc_att_imx7ulp,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7ulp),
> -	.method		= IMX_RPROC_NONE,
>  	.flags		= IMX_RPROC_NEED_SYSTEM_OFF,
>  };
>
> @@ -1229,7 +1222,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx7d = {
>  	.src_stop	= IMX7D_M4_STOP,
>  	.att		= imx_rproc_att_imx7d,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx7d),
> -	.method		= IMX_RPROC_MMIO,
>  	.ops		= &imx_rproc_ops_mmio,
>  	.flags		= IMX_RPROC_NEED_CLKS,
>  };
> @@ -1241,7 +1233,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
>  	.src_stop	= IMX6SX_M4_STOP,
>  	.att		= imx_rproc_att_imx6sx,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx6sx),
> -	.method		= IMX_RPROC_MMIO,
>  	.ops		= &imx_rproc_ops_mmio,
>  	.flags		= IMX_RPROC_NEED_CLKS,
>  };
> @@ -1249,7 +1240,6 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx6sx = {
>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
>  	.att		= imx_rproc_att_imx93,
>  	.att_size	= ARRAY_SIZE(imx_rproc_att_imx93),
> -	.method		= IMX_RPROC_SMC,
>  	.ops		= &imx_rproc_ops_arm_smc,
>  	.flags		= IMX_RPROC_NEED_CLKS,
>  };
>
> --
> 2.37.1
>
