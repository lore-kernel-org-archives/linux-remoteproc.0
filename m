Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013045.outbound.protection.outlook.com [52.101.72.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4009D3191BD
	for <linux-remoteproc@vger.kernel.org>; Thu,  7 May 2026 21:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778188479; cv=fail; b=QEY7EEMrAIgb/techaZSq/gmg9laj98RYKmN1PPRHEcjHnhaERydFbv03exalvSm0wEhjydZ7HxZusglxBTJZ2p1VvTO1J4XuxtlEtJwuMbJ4kUNyVP7PV0NZB1bLAcZZnrNwZZWyl8AT0BRjrZTv+rhDzG23btdRd+DMcpGfSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778188479; c=relaxed/simple;
	bh=acpQEmQkhWYLVh08KKGSEFV6GisyLWjQTgd+YiNN90I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TNbZyUsk5MO+/HIRIwEjsZy9W1zSrERHf7mSx/YwilC4S2B7VjzGGVk9RxB1SMoaxaXG6lS+l52foBTTg+VWXQi4bkTtnhoX1nJ0U/BH/YhuHEJyv96hE/mfOVc1zdSdDn3j6HDAX0/8C4rmwY3GLhjYkY/A24KaYxniARIy2m0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ua3X0mid; arc=fail smtp.client-ip=52.101.72.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ua3X0mid"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uEhRtMTuIxwhIzGrK+efj/aVfcSNL62noMfwVAdbBkmmBsv2Gl1p23059raE4iqStwkjHJgXZ2Z3ZdAnbLbzCo5oparxkjL30bMar2CH6v41TiSTveIhJhkuoPVRBGaPsctJ/GEPHZLYqJ4FeBRCyxG1TFhVLRewyWPuXkxUOv7bD1DYuWlpsVrq01gXz3UvJb4GwhPNFey2kD35nr+hINl37vBtG1zfwLea7Z3hQ8QMBKNTiOmQCvK1F99VMg+9m2jmHSddviCxS0zZspGZwA9aqu7HnhjXUHoMJTTxj8STZHR8i3tVsZG3j3di4yMuejuKxFklVVfK2UOdCZCZAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3QGtCjQ1KlFJ4eDd7ugavyj6b2F1qkVWOmpP3bvOsY=;
 b=RwrmXrZ3cVLYIn69eLNVA5XfVjTvc53X7fawAQJiIlz048Lwy2dt3mpcpKVMbbiHuenZqAGfBAuMzses6inz24r+/pZbQOAruuHRyY4hR8lLcHXxSGno0iwgX1UMS5XZ515T7BkB54nFwSt6bHS4K7+fY2twSX1XjB6MY875L9FXHq+dK5UXul4ZEh71qa5dNjwx9nDSRXkrowiZrVmyuZn3odgiv/jKq8AA603v15vYd2wxyhzPDcikVbHQ+Pgh+vDTPXDcmPuk342/9dBdIoG4NSZFXPcdgIFR53FXBM20okD6BQ2aY9FpVYL6bvdxprcHVpbKhC5G1FGtRpirEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3QGtCjQ1KlFJ4eDd7ugavyj6b2F1qkVWOmpP3bvOsY=;
 b=Ua3X0midNAOzOvdUwgv2Fz6KsSa8x9zWw+zuLmrr2xCc1LaO8HjQEppFEejXGUYvukAOK1199ld2MUm358dco5Zfvb/I5TI9l1Cec3FUO1k6GVmdHqLpTUTgpZPLjNV6rUONCXg7t6YKD6NYVNKu9KcjfeTv9qrquSDvCXGoX1yoB+3k2UO09n0vIWTM4jdK5n5T6ORUPHVLEcPXEFhZcCjmvis5w2fbZPnyz/7IrreXr8cAHZQazvgqGPhiweF0381xUTyhRHgNY1p1DaPO+EtaGxNxKHvzeYe+bbueVJTbRHVXWMkWoNUl66trSCbSE6sL8tLa8vsdjvnA0UJYwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU2PR04MB8535.eurprd04.prod.outlook.com (2603:10a6:10:2d6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 21:14:35 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 21:14:35 +0000
Date: Thu, 7 May 2026 17:14:28 -0400
From: Frank Li <Frank.li@nxp.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
	s.hauer@pengutronix.de, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] remoteproc: imx_rproc: Fix NULL vs IS_ERR() bug in
 imx_rproc_addr_init()
Message-ID: <af0AtMrcHpSnUzBw@lizhi-Precision-Tower-5810>
References: <20260227091546.4044246-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227091546.4044246-1-nichen@iscas.ac.cn>
X-ClientProxiedBy: SA9PR13CA0082.namprd13.prod.outlook.com
 (2603:10b6:806:23::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU2PR04MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: ce67093b-077c-43f5-c744-08deac7da37b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|19092799006|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	dOzSG8v42VpaFpvbOe0vqag0it26OKLA1dYjfFK0hJQUYVblrLYG+ytG5F5pH68TdqhdQTQBWI12kYvPU8fHpeTY/m1XsS0e/mOkYKl0C5YW6TJ5RjRsF+TQeOTcZti4erP/jpMuIxhz5mz9OelPxH7204ZP0wzNUF/s2xrx1/T4PCUeCwr1l6n9WtwBoW6t/YUpMNCYsGEXLwPujqKl+i8awkCWF2e1Y7vUXXKQSh1S3NXv/6Lk3xGFeyVPwHremoGQH+L7tF0Lvza0O93rg6Y2m0Dig1Ma93rMLA7hQwTsB0/MWCY+CIhjKt6aNUizGX4dmweiiG8NE964i+ESAwYPxXxOw2btBsLEQKFsPMH1A3PVcYwc8PABQ5AH4mMfqE0JtPVPzoWnQos46+eIIAixAEXo13EA+gl//OmL8sSsNFztQEOlEmV+AmZWVk+TdYRipyVBcLESmJ7pN98TgU3P8nSTn7s5PDEnb3D3r3dYNYjP3VS9lnEG3vZF0DMeQH8r3RPkh+YLqzpoRKEDqNGeY7JF49+LtoVqkUqo69s2IagapIU+kmDaFGYR3Q3LJVhDzoCX4yKBsgSYGZXAWEP2+yCvZpF+7mR3iYthUHYs5dQJbdKZZq5jjBzEO0rGhK/jGiGFWce8CVgVHJAOSKNJc/YRlWV7H/A3qAYXTAX9A4aCA0lG87k3RTU+wVJahvb4R1losoUKcpy2z6iPb2tNSJi6ZIXJImeprHFxLwQBA+IBSyHuFUS9tcs1wAZC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(19092799006)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0KER7SZ9yHyO4T5n9Pq8zHWsVqvP+aIymrhvm+UTO/2QKvxz10Exes69NIRK?=
 =?us-ascii?Q?n2fs6fUqgqwO4+KIJ8vJ/w/5EwxGaYLrLlCNPrht6vf1+0vSBcWeqTilkYs6?=
 =?us-ascii?Q?JeCorbc+EshcwyAcWaes7/EzH6n7xTKV4zwBm9NomRfJogjjMAS/NU4GT4vJ?=
 =?us-ascii?Q?G3nL+JL8rOsfjzPQGnfjTLm36Fpxsmm+gMOgQC/ieD8Eil/6BOi6SI1Z3dWy?=
 =?us-ascii?Q?N6EFEeOfVcUYyq/AM/d9aKm4D8PlPY8ia+xyrxdbkmLBTRHlLQIU0ROyDCxy?=
 =?us-ascii?Q?zTCtq8LB+ieDBS7+uWTVuk65j2ZR3wJAST8Dy/hO1+MR+0iyRRf1cR5wiNjk?=
 =?us-ascii?Q?J5r0J+WD2BCwEe87+RwUc4lxyMzVlRRowP+uLMzl5jxPny7cuLlly8otIMhO?=
 =?us-ascii?Q?SMj+XnWDEQ06bmUuf0gKW6lJxLcrOglil64AWx+S1og1euCRnicjBaN8y2Gv?=
 =?us-ascii?Q?LnuJwt99UFeN7cR+yoZUF2m4CRfEBJoQ9FpWuS6ila+EqeyzG0rM3N5VCzfB?=
 =?us-ascii?Q?08ZRMK58M6rkBC1zdHoMNzFmgnvrH6Q+yjd4t67x7Upqq+XcvioLL3phgDA3?=
 =?us-ascii?Q?axfqQB8tFmJnPdj1yqsYPF2xwdLVfuzg11hboEPScTfDYNyQNj/2g059HJnO?=
 =?us-ascii?Q?Ftuuray2t4L9cRhCaeMba5UR8lEb0uOF5mWyneEs3KaTI6zxxZ3LRD6aPXAQ?=
 =?us-ascii?Q?CqNIcg39IsQjtVFPHiqd7oNw/2Fre6mK0twsMy7CQ/d7HXnhsRTxP8KkO7rH?=
 =?us-ascii?Q?T3+X1aK+kWu8qwA76stxRzlri1SGStJfVTIMtW+KTHJbTvd3EWzJDO8cn18O?=
 =?us-ascii?Q?nT4mN3t5gqSZg0m0qBXtLosXoPtJWHJVyS7UfVeHeXPBtPEaXpRXNZT4Lmej?=
 =?us-ascii?Q?BeGoPpE+JQ/s6yFWMBLDuxLI9GFElqVo9sVd0kAyMl6h7H0Qgf70zzK9irfc?=
 =?us-ascii?Q?fbNl7G8hi8PQ5NE67vrJv1DQ/0R1IBv991bC5rD+vpyMxNpOUFqInA1Q3MZ4?=
 =?us-ascii?Q?65FbZKS7Ok8Ty08fB3+p9fs25PzEM1E4tRcbkxXkllq4QidQsKA/iAw4Txqm?=
 =?us-ascii?Q?7TVkfLuRuZ4k8xab1MrBJDDNHx9Ya8mJKC2PXjZ/DsicmQOCFFnnaniQzsTz?=
 =?us-ascii?Q?K/2CcON7T5gAPow4ENijnfEPChtJ40JLDPabIjuIZdYu/pflyFFnMNmfvNpL?=
 =?us-ascii?Q?IYpbCDX93fJVP4pTlewAyLG8vmPXy/1gl6D5/EDAM3PFxYWCOvDbIaDqCx3Z?=
 =?us-ascii?Q?1f93nK+WS3CpJvuvjkc6VjH9wOs4w3+8zlvn+RXceK+H5uDfQpxbNtr4WK5S?=
 =?us-ascii?Q?q1j6tIrJ8GV/9MFsFoO/5eyzn8IVm1AUA7rmWI/xLtjEv85mqK1nuxAYMooC?=
 =?us-ascii?Q?CiZ7fD7o3EKbncJ9opUaS5FZorQyNsQ1sno7o5miN6ytF50ucAiGJv/3HDbc?=
 =?us-ascii?Q?+6si0RLMYbn18vMcEn0geFhd0dhzZBmXcjbGDiDposX5bmML5S/tr89AkwcS?=
 =?us-ascii?Q?KgSoVZYpd6enY0VFljM95Ww1rSVZrg/WP5OrVDmNo8Rn35drCY8MVGFNBWKY?=
 =?us-ascii?Q?pSJedAVD+Rq3JqrlfazGdIGn4mCtdjXrUVBOPjMMjNcoa4BQTaPXCuN1fdcz?=
 =?us-ascii?Q?oqZyxH0YmWPRhYaiDvNBLIWH5sabzgK9DXdIjVWcIeMZA34/jXwPchZcN9t5?=
 =?us-ascii?Q?Tl/8hAur3uMAhQntasOIDAeyCFnyMox0ZmCUWPTfvszuM67f?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce67093b-077c-43f5-c744-08deac7da37b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 21:14:34.8094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x5bdUfIzyYBjS6KyaYD6Qt+Nq4MfXYGmDQNWSxKk6njbuJalwHyzViO6ereXL1dyPHsAilWx555/q7DGdcCfMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8535

On Fri, Feb 27, 2026 at 05:15:46PM +0800, Chen Ni wrote:
> The devm_ioremap_resource_wc() function never returns NULL, it returns
> error pointers.  Update the error checking to match.
>
> Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/remoteproc/imx_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index d33d1e2c41a4..0dd80e688b0e 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -812,7 +812,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>
>  		/* Not use resource version, because we might share region */
>  		priv->mem[b].cpu_addr = devm_ioremap_resource_wc(&pdev->dev, &res);
> -		if (!priv->mem[b].cpu_addr) {
> +		if (IS_ERR(priv->mem[b].cpu_addr)) {
>  			dev_err(dev, "failed to remap %pr\n", &res);
>  			return -ENOMEM;
>  		}
> --
> 2.25.1
>
