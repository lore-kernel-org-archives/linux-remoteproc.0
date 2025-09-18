Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012012.outbound.protection.outlook.com [52.101.66.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0822E7621;
	Thu, 18 Sep 2025 16:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758213643; cv=fail; b=KC7sS1b7yElkuhU56mERwJMWbNxpSkKrwe3OriJJt+Gk7dayx2S41+ZBPOl5KkXU+veaM+RZliwky8s9SEFEW6azEF8tH+d+xkKqSZ/F/irr/+zrKwgFpZ58FO/fFru01+jh5uNbTq3BRNgsPIPQE+5DCIm8yBTdoObRZArAlPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758213643; c=relaxed/simple;
	bh=Wu7u8ufrKgQ6BWX7Fgy0FRthyjeB9I+KiOC3B+iwEdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HclzeNi/dP9ektqWhg6L67ZVgd06JeS0u8Arv8uAAo0F6hL3v8gwsvgsV1HUWY2NYGElPln7TOWC4mugEA4Y+KVrOr4WOVYmh28OcvbzrbKnnrZ3HjQWXYFsfMRx2acgpFCY0FNq3HJz/rXpU7pDWlHuYwLxG6NpWqBonsj2aKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DVotilUS; arc=fail smtp.client-ip=52.101.66.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DVotilUS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uGU6dNBCaRQaEDPbBaYumwOVBs8KezSbHjSAEquzZQ2kXYMEN+jbGBdottxNCjY6xphLno5So3mLlBNkm86+IrcsXDWeuVyoocp7K6OX5esgdPsS8IPA3q/vbT/k6q5bNDUFFBTlhpbpAc0khU1G99cD3gQ4wHot6X/6fj2nozIQviCMnPncJdBYPnR8iucPy7EuxLFVHxscf869ewhZ2NnrNaFpRiLCQrDcx/YPVYWZZQBzYg5H0m0ByYmkpsWHv5UGwrfHte6hhrACbA+jusraNFbxA3vPFmXyPSgRO16xSYCZrF/lVUaOrzC+Zh7r2wWMZv3zrKBYTB7HkNQh4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyJuajuTL27Tu8vpslnD7OLKKL1RuEYPRZ3ouFSNoGQ=;
 b=WpN645yeXWSYjQbKzgrwi8aJkf6BKYYkbnzPv84JMbOhvUVda+iSJfp6KmXZKr9TX6ifWDZiFjD5mVjZW5UzTi4aB7bCAIJXpvsrxWXagVTDGhjQM41AsExLhH9kI4uCjokY/mHmYmUXcnrCHliYskbffSdiNL1tBIYO4abXTYHAj9U5++Nw3mWUSEqMcXus6sd+oqIsdLvcg+vyPqj6yg7rq86pEPYy5Y+j4uZjnSEjkk7sDGAz4LrAAj3qksd2SzbHjYA6r6rV7aK7iTtWSLTsnUjPjPRpOR+OfuDUq5KbobV8qu2+YbXAj4k9T867smKLJZ0qHoByeYLuKPJPOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyJuajuTL27Tu8vpslnD7OLKKL1RuEYPRZ3ouFSNoGQ=;
 b=DVotilUSyGJgxyoCLG7FitV6ZPrizR8twHc50OXV5YugeI+qvbOJkLNxhCy8aUTv0DBCzB0/rxuHP2v4Z/hStZxeTLt4Dru9wMCfilGs2m8xjl6X+oLuLWLXINd77YSU669Te9Y7lJC8ZKEP14sGFmPXoHWo1YX1EgdU3O2yMjWDmZE85W3bOfpGtQhR7qYCvauQajG5NrijRLYnVVTQ2EhgIlSkomGiDRrFE+3tVyLJRCtnhwXidtyqoQ78h7HkZ0aSwdWPnJmqfbKRM/9fDO9Qy6Zlg94BCbU5QwjBD1QV70+2zTpzkj+Q2h515obK/6uU5gDK2Soqaf/SHJB6Mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by PAWPR04MB10031.eurprd04.prod.outlook.com (2603:10a6:102:38b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 16:40:38 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 16:40:38 +0000
Date: Thu, 18 Sep 2025 12:40:31 -0400
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
Subject: Re: [PATCH 3/5] remoteproc: imx_rproc: Enable PM runtime support
 unconditionally
Message-ID: <aMw1/38H2W8iya1P@lizhi-Precision-Tower-5810>
References: <20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com>
 <20250918-imx_rproc_c2-v1-3-deec8183185f@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918-imx_rproc_c2-v1-3-deec8183185f@nxp.com>
X-ClientProxiedBy: PH8PR22CA0012.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::8) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|PAWPR04MB10031:EE_
X-MS-Office365-Filtering-Correlation-Id: 66ebdf41-02dd-41af-3f7d-08ddf6d21920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?imkBBqZwldz3yTmIWt7lff1uNpErpDQ5M4m0UJJBLIUbbeH03pjQYPgye87v?=
 =?us-ascii?Q?nASlcP/NcIeATjR6qrCbozOoGHABDnzbA7DTEprdoeD+7PhR2PLkL13OLMFr?=
 =?us-ascii?Q?4bogR6dIVRJvNRUV6Vm1AW0Nqgis9c7cN0X/9pP/jlw7fG/6Kx30Mroqp6jz?=
 =?us-ascii?Q?Nd5eYqSFN4rr6JWjaZRidJlf3l2AYhNTWmf+3MwJLGITIsludPAYZol3BAfb?=
 =?us-ascii?Q?EvuiFpbPLTQmtyqvHBV8krNgROHns/KAXR4ZNVZ4pj3BO/pjktW2WySYZh2s?=
 =?us-ascii?Q?FP4zW5+Qh2RbCMAGAgYuuxaDvJTmKifite88kPKuMZgs9H1gtPtqiPqitcBV?=
 =?us-ascii?Q?TVcDHn/wB9o8RHagYYU9Kdb7zLY20DMzFFOB2hSyA3FsG/aNIBlxUxrn2k94?=
 =?us-ascii?Q?fQUXWSz41kapAL7E7cytSO9zlZE4msHZrF/YpCNbNIOkHpUjnwcFG+IOr3uV?=
 =?us-ascii?Q?oUuIP9npNp7Pa4+P5Q1MP8jh0uY0UN6J8dLEnSTaTVVxLdXOJqICoJhPOhTE?=
 =?us-ascii?Q?sJW90ygE+Fre3e0ONtOkn+PdRFnoU/+arJVwg6LDoYsaiOZ1r1JqetrnbdUK?=
 =?us-ascii?Q?QD2xWfNKExbFnAWfUKeGku1SbTodGFUlQRWiQUlv42vhxnb5fj7191xh23O/?=
 =?us-ascii?Q?cjuU1D4bNGMgn4C/cDdKg6VtKzNzFeDKrMIfv95PjkGwUwsAuMatguniFJ9X?=
 =?us-ascii?Q?OLdO+uvgdZdSybVleJb6eI2S1F0FVDfrzAgInTr2H+8tlYe6KV0PGcg9aj2H?=
 =?us-ascii?Q?5A0WcIF4oKhfiTJUpwuijl/Hde+ZbX1O8b9k3ncSma72xYbXJyVtyjaGWhrh?=
 =?us-ascii?Q?JcVo0CrDZMWiUMWFg/4/ODvCDf16Z1dNdb4LISFDbzwXRr8oVPwUQdfi+Z9/?=
 =?us-ascii?Q?C8L+yxsVOzEtyRFnv2xieFfgPFU/pQzmSl0XE8uaE3BnFacEcIRqcos5Ltjh?=
 =?us-ascii?Q?gKRZl/eh7Hti4iHjtPG5RX4N1RDJ1pbEY+CsEuov9j+Mfm5gBt6+yaNEuFqn?=
 =?us-ascii?Q?uHPI+f9o/vzNiqYtNEHZi69anH03Vv4vXkifVe0+RyVjAI3grVema5ogc9kQ?=
 =?us-ascii?Q?V4g112Jl/Ef2rm8arr0/tTnHV0T2nbusg8Qm0UD+vkT07nP1j1G5VDI63QHV?=
 =?us-ascii?Q?iHRG/v7OZ2kv7LDbD+bPOgTfAq6OMjC2n5KpY0KaqigOYT3EQhDvw11A5dL1?=
 =?us-ascii?Q?ge9UM22d5CYH7C5cnhsjYdxY3TcKIvTUkdgXBLMFwjC7hCskd+hfHQCR9d8e?=
 =?us-ascii?Q?CCOGuUriLT5ulno2suyaO0ZfiCntBwdgOJp5kmgOt9Pc2RWM0fHPDtkN/RpT?=
 =?us-ascii?Q?wetIj6IZNyBxLRsZVEBhbRD7JUrW+w5RH4t4TxMjTnvnGhkad5VnPAnWpM8B?=
 =?us-ascii?Q?U6va+vfTPZla9yzWhhiKtQ5ilKnQVq+d7DyssBR76+JNDEspH1O3QVl9xZip?=
 =?us-ascii?Q?P5x/O1xZ7tzMK4beVDNwPI9DHqcm4jzc8O6Q/eN7KKUyY1IHDBTeoQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?he0fyVPItw0h7iJKj/DY2KGqe9e7zVTZtJyec5gYTlc6uInjmDKUnMzDrWud?=
 =?us-ascii?Q?8iTsC+8QlewAe7WWSc60VDZsQLdLa5I3+mh2JY2NSrEpkI9y42lIjaJnyEU6?=
 =?us-ascii?Q?f9PZts/P91CqGrlgi6gQqD/9B53FvbcUc2VNLUG3afwXiA/ukO9ySzytGarJ?=
 =?us-ascii?Q?TZPwZFh2qub3Tx6U1fg5ZOqS5P1lu3WhQG2xruKqq2ZYM7N3UuTOX02ND4Qa?=
 =?us-ascii?Q?yNFlthL0dQqIUgBL8Rq7/61vA/2vYZWD/iqr0cbjJN/V9rgI6SIkBdTK4S1a?=
 =?us-ascii?Q?ZPvw64WUvLkhN+DMJNrjcG26stJiHx2LicXegMxKCyYxcY9S7bZrGdM6AX3K?=
 =?us-ascii?Q?KFsw+7+zYGvnPuUmTb2iDbItOr+dPYEIgOvWe/lPLxsw5hyq2z62ECUpvNHC?=
 =?us-ascii?Q?l9qu+Gtkq+FFKDyFPRMC4xiBdm8mxPQaDqSjQV+HaeyzSzL39idbjedEGV3t?=
 =?us-ascii?Q?x/eOKMRb/reMgXlejWaqNX0FFjW2mT5CFw86FKtJVPZaaYeVhXaMVjXwVw0k?=
 =?us-ascii?Q?ilGXQEpxMtqNYAOhLwSLDKAIFWGM0LQCHKBcAw0ZKm1jyFIBxw6Ymn+EYi1L?=
 =?us-ascii?Q?VXJyTEFXalwlyc6MbpeqHnKjb7qAoAmjL19uu9s2Z38uRhdjYkdJUZ7i+Kik?=
 =?us-ascii?Q?b1rOsesS4AC7MiVoBse76f+KO2dcytj95dsvDKLuIa1UdchvIpLVUqUWTp0+?=
 =?us-ascii?Q?pRyeIzvwvPTCvFe7IXzYPBkuGEtdDktdbYs4M/gywUIyUJaaAjQ2t0/6/5rd?=
 =?us-ascii?Q?qilVYAR8nvU39yOCVkouJ83Qz5Js++0rKvn+cD1enK/I3H2M22PJRZviwN8W?=
 =?us-ascii?Q?mB7uEbYXQ08K0iS08zn47rCx8JQlWwQCF8/UGlISrVApMe5Xv3X8RLKaIPEm?=
 =?us-ascii?Q?gCG7gmoXDc02qApIItn+QurLI6SN9RUaPpr1+4RoXJWC17YPlhEvjbxWT2qg?=
 =?us-ascii?Q?BLbvw/+o4Ed/TEUcfjc9Zbjum7sRbI8o2YiU0qlDpJtV34gaEUkk3VOJPG4u?=
 =?us-ascii?Q?FqB+Ldkq4N+l2S7qmTd1h1gPtlLhztV26JYVN4YD/aDEridZbX3rRWQbSwKE?=
 =?us-ascii?Q?VkKxi4ZkhJYugj9ZkOgEnKVkSwTXV0rZ90YuER1wUDOG676sF9lnUrW4TItg?=
 =?us-ascii?Q?IkVrlIEM/uhT6X5aU4AIkKFiKguadqWDNoJIRQP39Ou3I3kDowuk1dgpnypi?=
 =?us-ascii?Q?7Z2AeTFmJkGbYrESPRaody6z3r5sPC1EoNlW+hccG/Ewh/IPUjh0C2ooeqlc?=
 =?us-ascii?Q?stN9vzne3HBTomWYx0CIKT+g1IkFh0tfnypZGsYWHl/WyEz76gX6mzDpu45V?=
 =?us-ascii?Q?G0NfM9o3H8ihBLF9Hsb49k/qLGmCVJFg1SNir2Mqv/ncVYuQq/DQ+aKSDOgR?=
 =?us-ascii?Q?RAw7sjI3cuvabMt+A1bi8LoBTlUQXz7mgPVdK4esdWbgjS2NetpCHbyDyzSh?=
 =?us-ascii?Q?eriPeFf1tXfcnsbzI8FvBnfb1l+UBKmGw8FjVH9Fa23uFDows0s4sbo7QmZW?=
 =?us-ascii?Q?2pcQ/x5bjojb9Kf7Kb5fMeR+VBs0in1oZ2+fiMRMldTCBSD1cCm9zSk/WY/+?=
 =?us-ascii?Q?OgZ8uL8EPqV4xrI+V5dPJ6XERUDADurX6AOmxush?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ebdf41-02dd-41af-3f7d-08ddf6d21920
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 16:40:38.3654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HcZMqfk6XcSQlI8toD0jDjnsiefIeotFUKPwXFM07fdnWycoJK/2Ez7NGayqviuDdaTjcCCg1RySmJldY8ZbJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10031

On Thu, Sep 18, 2025 at 07:51:18PM +0800, Peng Fan wrote:
> PM runtime support is safe and applicable across all i.MX platforms, not
> just those using the SCU API. Remove the conditional check and enable PM
> runtime unconditionally to simplify the code and ensure consistent power
> management behavior.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/remoteproc/imx_rproc.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 74c958d44611b66e024180d69d71daac5a2f9e76..69b57cb4b251d9fb65a23e139a1960bf29c175ed 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1123,19 +1123,17 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  			return dev_err_probe(dev, ret, "register restart handler failure\n");
>  	}
>
> -	if (dcfg->method == IMX_RPROC_SCU_API) {
> -		ret = devm_pm_runtime_enable(dev);
> -		if (ret)
> -			return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
>
> -		ret = pm_runtime_resume_and_get(dev);
> -		if (ret)
> -			return dev_err_probe(dev, ret, "pm_runtime get failed\n");
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "pm_runtime get failed\n");
>
> -		ret = devm_add_action_or_reset(dev, imx_rproc_pm_runtime_put, dev);
> -		if (ret)
> -			return dev_err_probe(dev, ret, "Failed to add devm disable pm action\n");
> -	}
> +	ret = devm_add_action_or_reset(dev, imx_rproc_pm_runtime_put, dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to add devm disable pm action\n");
>
>  	ret = devm_rproc_add(dev, rproc);
>  	if (ret)
>
> --
> 2.37.1
>
