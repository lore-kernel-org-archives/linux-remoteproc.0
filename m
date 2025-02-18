Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2056.outbound.protection.outlook.com [40.107.249.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F4910F4;
	Tue, 18 Feb 2025 15:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739893913; cv=fail; b=WvQKybC+HI7pyUrAKOr8Ao0vuKCUvozC8UruZoxCDmGH+0jasPBHAbcWwkH215G3sXeCzDTGNU1blXUVswJNsOeF9M/FGmvirKuPTytXaXRncLdGCpKtKMFe0J4OQxey8bFxvlbwsQXji+qkYDbhxfIdFfBZQuVgrjLbExGBwCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739893913; c=relaxed/simple;
	bh=OHQO6LkkZ1CZEysoB0u5VBcJKY5uyx79+EcrD6x9fsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jjHqwuiwL5bIjgaIKaM9Y+sZV/M9nzjjYGx6f7gP05bLrHQ8xq3mioNo3ezsUW0lx3pq/37FKfnV4GQqig7QQbXWffhdLy+ZL8LqFi6qWm+38aO3Ag8s/16NyUz216yiqCjgrSOrnn7UrjcIjAYQjcyIsqwTgRbfVs2V0vWSz1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IvkAXLt1; arc=fail smtp.client-ip=40.107.249.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IvkAXLt1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNpHuDQylhxsrYljHMRIspNNwVgE571b9YR+3ky6W+FXt9TrRdmAmnOIamdxv1d+IFgAD0cOP3mQ5wlm4PO9YCNHRdNNZoksceBUHbJEcJK0JQVWfCcDlVBpJEZQ/79Vt9mjghyOawRffX+9TTv6rQL10Pm+vrXYQSBv0CDRyBn1IvcfsfH1b3a+6Ker2S8PdSS117LloJ4CyOn3dDuKTTUUsvhBXpt5vWO5YLf8d/86ZyzcN7XxDnfsTZuNLiQr79AM546TjqXcXrTj6JjfRwA8yFFk89wGqLoFdqSUzWiKDvmq3W2bXtsC3UPNAt4bEgdNZqcIqeKy3f2xOCyHCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzzC2IDTc4ZdWjb35NrsWZ5bIpkDlbDmqIDWmIrp1Ic=;
 b=jN4VVYZpeUZbQOblngvaGEeqoHUG6useX9LYV2ePvvBDNiTC/LDSRMzKz5/A+ZsJh8VVXeGZk1BkUDRwckr1A5LmCHVmKxdy/3jx+j9QhJvCCtkXdZjqP52rZhwxoWrJHh5I5BgJfPzNy/zBvfRpIkK4lpOihpgdCLakIoWFuNBOHWJyvC0q7DMZ+s7nxXTmxar/6W+ncFc98f9xLsHw1wQXK18jfEJK06O+K0HljM49ziDe66Pd6l1QOdnp10CpAESMVb1dh0yaThIC4FTN29ds0whF9zP0OQP8IaYfhipfn5TVBWB1zeSuOyjYu14Ma53QeQncfzAemL/xSGRQOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzzC2IDTc4ZdWjb35NrsWZ5bIpkDlbDmqIDWmIrp1Ic=;
 b=IvkAXLt1uvWdOlDjhMllzf6Y8ZW38yZ+/Qx1rwP2/6eiH0bdauxNaUovLkPP9wxAZ6EplMF90OghoqPS43Tb0zO/BTJ7Z73yyYwUIXkJgxRKZcdbvzPBjvp4/rD6A+jRS1bn77Z0HcJPA1f+W6B2ls4fSn1bLqJj/I9ucf8QuSRsNDOGJ5Vx93PEEjcVYQxYMOHmaeFxruyhW966Qsc5gGQh/NDMCySSngR4JybnNku4ObfLfFKjRgPNk/fOHnl8R7DhnFlQ2rWxGEL9ot2Tz8yMdC4lYwPu7j39iI3fsecrXERLco/OHagf9GzoupG275jPz5yNd+1vXjAZRuP+3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8809.eurprd04.prod.outlook.com (2603:10a6:20b:408::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Tue, 18 Feb
 2025 15:51:48 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 15:51:48 +0000
Date: Tue, 18 Feb 2025 10:51:38 -0500
From: Frank Li <Frank.li@nxp.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: p.zabel@pengutronix.de, shawnguo@kernel.org, mathieu.poirier@linaro.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, andersson@kernel.org,
	linux-remoteproc@vger.kernel.org, iuliana.prodan@nxp.com,
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, krzk@kernel.org
Subject: Re: [PATCH 1/5] reset: imx8mp-audiomix: Add prefix for internal macro
Message-ID: <Z7Ssik/uGKz0nmXz@lizhi-Precision-Tower-5810>
References: <20250218085712.66690-1-daniel.baluta@nxp.com>
 <20250218085712.66690-2-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218085712.66690-2-daniel.baluta@nxp.com>
X-ClientProxiedBy: BYAPR08CA0026.namprd08.prod.outlook.com
 (2603:10b6:a03:100::39) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8809:EE_
X-MS-Office365-Filtering-Correlation-Id: 90e6bdc8-b1a6-4e91-c364-08dd50342727
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vb5HkmAUwBVzo83ffPgrGmOJFoAnI8lEwWKJblzzaXrsHqmQtczwgjwmA6ZR?=
 =?us-ascii?Q?pQ9SCBSj0iptBIg0+PZzC4fGAfUG7OoVRLYGzVeWNmWGqsDsSQiFJ7guU0tO?=
 =?us-ascii?Q?K2ekz3rBILsLcOBpSXkubPdUBfifWEWBFofqnqP/aStPBv064ko7yMt+181w?=
 =?us-ascii?Q?KlNa3cYVAfDtLe17KkRx9zrAzi0Cc2ztmWYv/UQ9yF51+gLrIu5gO/otXBUc?=
 =?us-ascii?Q?87cYD795aBsgNEPQsdhRq1FfExVgqmlBRaLIXZQgK4HdMIfVlS+EwGTjZR7q?=
 =?us-ascii?Q?MF6oRRdl42kVk0kiznx7M2ieAt0YFfxgrzo6vW5rRUdgNHyctnxgJGI4Vxgx?=
 =?us-ascii?Q?tsN3Amg22y4PrfcwnSOX//sAyHr3P392NTsoQyt3pnzOScveMCpfSgvl6coK?=
 =?us-ascii?Q?ohfCw76YPJgIrSTVXW+zpcFcyVzCu/6CE43E6hsekVNW1g/Fo1gppXB3HRws?=
 =?us-ascii?Q?2/1SGAa2LCLnoJCfYVrNbQ0bvwon2bQ699he281D9NjIMSCt/OJNIcKe6pXW?=
 =?us-ascii?Q?ACQrcqqaHAwUv5QvF2RX/PfdI8kr1VpGkt5tNZO3+PjR6iB6Z6AX8qfcb3bP?=
 =?us-ascii?Q?dMPvsgSvAoFey45SbBzl86zqUOhsKryvfLcYmXot82ehPrvGTdilo+Gds6Pa?=
 =?us-ascii?Q?5raSaAJMej/OFtKMLRmO7YxYK/OeTlg2xIScmWkZPRNNiGPZ3X1tgOhLH0Ht?=
 =?us-ascii?Q?Gu07JcNrQbdFB80Cxo/ZpDuKMQYSfDGrZv10ii8IWypaYlF1G+DqsefxSI1B?=
 =?us-ascii?Q?g2inAFB9tQLPR2uiwJjfoMVwRvkhN9mHf7bzX3i59vqd9eZpC5wyXiMOKn8P?=
 =?us-ascii?Q?csDGEVzTMdIGSI7eyre9D74X1GBY8NtQ7hGbo2/pV7cQU19Ao3R1p9wlcZqv?=
 =?us-ascii?Q?b52CqwvAQMKG7dRf3BzFLm4lNpA847F6baXW3JOtqqlOTiBmQ+n8c4HCYwy7?=
 =?us-ascii?Q?xklfeI0frRPML062pRDM89Scgaq93DWIFPSPECfNZv5FMaqy3HBqTckblTyA?=
 =?us-ascii?Q?8lXOVq8AGAWycudeWQXfHImY4JnTTV+5T+eXQPt/dzQuM3F9K4UfuKgXewqh?=
 =?us-ascii?Q?H4VHiLezTuX106ajyjwvk/CET0zxLuLwxzZk6Auyd1z39mOz3NqCafWHyyiS?=
 =?us-ascii?Q?7OZLV51lT2+ifcrxDc4XcBrcdVP6KZCOkaVFVrbJvQNJ/81/m++i1jDH68nm?=
 =?us-ascii?Q?k0SjHZGFpoPw/ycXKJnO4NbnW1LdrReL5h3Kf02SKIl3xaY+C3yMBK0KWeYn?=
 =?us-ascii?Q?Wk1JzRMoP9mVA8CeRL33QA4UdvlAPnPenZjcf/3L6KNPA6NJOa96Of0vSgM+?=
 =?us-ascii?Q?+JatbHudeJpniGcIFgXb+RPd0C9IicNlONmiPDQZLGyPVAupIS5P35kgk6UZ?=
 =?us-ascii?Q?BpAU5DT7ZqR8KTh4N7XcNCVOhr39c1e5ygLw3pQbrv7ifF4P2Mp35jZQiBMq?=
 =?us-ascii?Q?27j2wybJazrTzuDy0UytJcT3jeMOv9vu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZWiD94k8twGz3lvp8T4rCR+OSqxD2s3LssJcg8LUqEc83bFxem5l0aIIJerR?=
 =?us-ascii?Q?feI4MR57nYNFHK67gyt+yeCxcx40J5aYRLN6ZOOtLatpyNFybZ3xDNngRhwt?=
 =?us-ascii?Q?6a6qyBn5Y6TblE8k5eAf933GDSgh0QdJv4WQIE8Irn4/l5qgGlCJeKTphpYM?=
 =?us-ascii?Q?8G+Zso4kLUYL667feZfxqoN/aC0ZaXMkIQRrevc5Ss6150lVm0nmll8lq0ZO?=
 =?us-ascii?Q?RbYfIiC9YOfPAdNeQaUxOnaCazxnL79uIy6xg14hBGN1zQhXpu0y+qfEkfyQ?=
 =?us-ascii?Q?V7P6ZyAQafAYUE9ymBLZ7hAJM5uFlkyTSNqu6dzlrjUuLxLLlfD2L3gov0i9?=
 =?us-ascii?Q?1ykHBZS6oFhAE60f2fJ581es3jQKmD1dskaZ2om96vWDuUswTn/TOKywAxkv?=
 =?us-ascii?Q?ePj3rrSTridqfeCiRnvKAeTKQFKlqcijAAwgo+qK9+9DB8NBxXbUVTutvuHi?=
 =?us-ascii?Q?CxEbywsrpcXFy5rRKb/lhwdhO8Wy4yn5bLDmH+Y27+C5TpWAb9wz00rh7mN5?=
 =?us-ascii?Q?uRfVAkXGdYslz4Ql5tdKZuIfBy5QzDkZbRz6QwQSde9exKzI2t5yTLTffXYl?=
 =?us-ascii?Q?1OzbqxrTrtNaVIDPWJafUFbnd2BAWXhaREcVQjXOSTMTZEc/xOeD4Kimdkns?=
 =?us-ascii?Q?9/S2P3sNGZXrbmbwheEzWry3PUEr1QS7NHo0IqeOc5bBEIJVliEeQc8S6xAP?=
 =?us-ascii?Q?KKZb6fY8K6PGctbwbZZCLUFk6/MEcL0OgPMmWKyYvso8JuBWNXi6DFI45sOr?=
 =?us-ascii?Q?hlLBZumLB+1tkN4unxDXrXBwLV7h6AMnWjPEqZK3N/xXiie3G/jeoi8Xythb?=
 =?us-ascii?Q?jRL+PdBT5N67kF3QqP8S0C84B6o3jyNTtd1BcJZbxAn/CbDpNumQDCjDImds?=
 =?us-ascii?Q?AmksI65SuSgFEq3O0c7qHPL0t1FNswcbq8DePvU6m4rCMf3AVeONnUZHjit1?=
 =?us-ascii?Q?eu1aKP/tP5Gx3dgKXjvAT9QuiNTejDsyEQQVULguqe2t26UZJBHECyKaEyEQ?=
 =?us-ascii?Q?tpET4oSr26yzSIG0oeILxdjCc1hNUc7+OfLHYCkTyX8D13jut2oAIowQcmCX?=
 =?us-ascii?Q?1GZJMLnJ0p1cEuGLtDLvoCE32CnWJGJ+IWhzCfJIsOVSRas3lvzay7Mebb38?=
 =?us-ascii?Q?JTcryaszsSY7WzNWQocCIXkJ3ODM2IVd98/oIUfyAa72FTRTJYCDR+blqMD8?=
 =?us-ascii?Q?Ki/7NflkRBll/WLZJ9mvghk19Rw3ZK4Qk+iN4vWSuqqT/xbR0oLTJu03Ptb1?=
 =?us-ascii?Q?4t7lEZlSpH2Wz3rloX5KvGCiD3n3tbRpGuGAVMQNSFZxtz+ZoWoxi/211pci?=
 =?us-ascii?Q?v8yiUY/wKkP4vApCVCzrvWwd1mPfiIqOFjGoQcxq+x9PJSCZaWJp1Hqz8Vu2?=
 =?us-ascii?Q?zmvtfPklneLUFgyts/kxHqK0u73U4PF7MtyS5m8oRIwdQ5Gn6dGYx0NaDIrd?=
 =?us-ascii?Q?ZQ8gb9ae1J59xSgCsYztHYmHl2NondNslc8V6pzNFITnnr9TlDn8PdgNUsvX?=
 =?us-ascii?Q?4S/QKo7im9iXK8Ic2SwPyIU5oCG5G8Rymoys2BSa4q1ZEQkOl7yybr7nOUOB?=
 =?us-ascii?Q?KjoE6UTuLs9Hr5vb5+4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e6bdc8-b1a6-4e91-c364-08dd50342727
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 15:51:48.3735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o4WFj+iI8qUOUCKYUgUlkZlsFuqVHvOEwNMZtuDnU+gV8vKgzV3TczYXtAKgjD2ppFs0nsSd4I576WzHras2rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8809

On Tue, Feb 18, 2025 at 10:57:08AM +0200, Daniel Baluta wrote:
> This adds IMX8MP_AUDIOMIX_ prefix to internal macros
> in order to show that specific macros are related to
> audiomix.

nit: warp at 75 chars

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/reset/reset-imx8mp-audiomix.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
> index 6e3f3069f727..1fe21980a66c 100644
> --- a/drivers/reset/reset-imx8mp-audiomix.c
> +++ b/drivers/reset/reset-imx8mp-audiomix.c
> @@ -11,8 +11,8 @@
>  #include <linux/of_address.h>
>  #include <linux/reset-controller.h>
>
> -#define EARC			0x200
> -#define EARC_RESET_MASK		0x3
> +#define IMX8MP_AUDIOMIX_EARC_OFFSET		0x200
> +#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		0x3
>
>  struct imx8mp_audiomix_reset {
>  	struct reset_controller_dev rcdev;
> @@ -35,8 +35,8 @@ static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcdev,
>
>  	mask = BIT(id);
>  	spin_lock_irqsave(&priv->lock, flags);
> -	reg = readl(reg_addr + EARC);
> -	writel(reg & ~mask, reg_addr + EARC);
> +	reg = readl(reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
> +	writel(reg & ~mask, reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
>  	spin_unlock_irqrestore(&priv->lock, flags);
>
>  	return 0;
> @@ -52,8 +52,8 @@ static int imx8mp_audiomix_reset_deassert(struct reset_controller_dev *rcdev,
>
>  	mask = BIT(id);
>  	spin_lock_irqsave(&priv->lock, flags);
> -	reg = readl(reg_addr + EARC);
> -	writel(reg | mask, reg_addr + EARC);
> +	reg = readl(reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
> +	writel(reg | mask, reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
>  	spin_unlock_irqrestore(&priv->lock, flags);
>
>  	return 0;
> @@ -78,7 +78,7 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
>  	spin_lock_init(&priv->lock);
>
>  	priv->rcdev.owner     = THIS_MODULE;
> -	priv->rcdev.nr_resets = fls(EARC_RESET_MASK);
> +	priv->rcdev.nr_resets = fls(IMX8MP_AUDIOMIX_EARC_RESET_MASK);
>  	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
>  	priv->rcdev.of_node   = dev->parent->of_node;
>  	priv->rcdev.dev	      = dev;
> --
> 2.25.1
>
