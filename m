Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011011.outbound.protection.outlook.com [52.101.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3413B1A8F97;
	Fri, 31 Oct 2025 18:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761936671; cv=fail; b=fEID3gDCXNMawEa6hcGXMb5BYZIMhDiBUwtsr5IcVycjhWq67FrfkxK+XFrVGaZcYViD+jKMJzG3GmA8wygtrHSBTImkAXDvtSxCaeNVyi1cqCAeXBKwmiDmclSopM9c4JgyiVac1282vsklLIKHv0rDTDZz5MQBvpP8woXG8fE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761936671; c=relaxed/simple;
	bh=MWkFUgjOIUwYMpuWNoxDWcRuTfQHoObUcSvrrfgyPYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eXp6helPvM7PgUxNAHlgVAWbILP9Kdnq5ZmCbBNjJ8zRgtmIeXkJV6Koob0JikVFi8llFiPVxr0+HzzISD6zDe3zInQyn1eyFF2LbYo6z0gMWFNfnhrazAvivVUozRcJIQG60C8qUwjKvjnPEFd04dblBl/KBryxskA5/jNOgP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EEIWq1UG; arc=fail smtp.client-ip=52.101.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EEIWq1UG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eb0FRlitPt7vti/NUoLuzmTnBlNKHnLw6nISCeQRyq8HqFE+mZNyAU7qJbU+vW06M7GM12cNQKZrlV0577s36FNa/mg/36EGMrZmMlXcySmMeMO4R6mZww9mRdALv4bbZLroRj+NQrHa261Xa0fOUGajTKtothLHLxyTyyYt1Cp3Kk8hqYA8z+6c07sXYAWX049GQYh960FI331XLR05rdHKw0bHfiDomErH+kQ7ccHDbry5JgIsUilzoObQi6o8UzBAnc6v8kr+ul3PObYfZgvdX/S3m8mdOJfCY5pfBIcwpb4KNfVw2Q9yXVjqQHBudKwNZPmPs1d0AiLhG78Xew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5iA/CFI8yfyVhNOsT54aaEmlxqzmtprUj89ZDXLFlU=;
 b=SAuCaC1h0LCShsNtwjBYLu1m3k6DfFntCM9uIKopEwvpAeEWR703b79efiTftegt9tJqbL2z9+BkpDYVmVyVubtv9eX2PBCw9KQ2bipO2+3a7OfNCn7mUEQlJMYAoNfwZ/yje3gJ5yyxxMCakTUeayZjKK0+dUkzHxSmcXcKHO+J7hhvzPN0m8NG3j2GdvfNBGt8TNaqky7m7z+7858XqrZUqdROD68bi0nzEpHtpz5FyrYLM5CwvXmB6RXM7ktMj8tiONCJBdO7ttKNKN8qQ6aRe/W7dJ93UTmXuZOCWZhs5ySKrGDlyWQ2ODEGzxcQiRLA3ABUZSQXmAVyF/X6Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5iA/CFI8yfyVhNOsT54aaEmlxqzmtprUj89ZDXLFlU=;
 b=EEIWq1UGa6YczE1Ez3jARP4Q8dnG2AWdJqUhhvCujO3oN+MuwwJ5NcQ1kze6PxyiyNon9OLKDYM0eHW/5THu2nHKxARPfyCAlmFD9073POL/bo5YcEYoBmwQXFRb4soJkQr26muQglyjk6RTngXIfRBNaS7AaYwnYsEjPL+9LMmcSW5/qDWlSxxGeukWhy4mK6ibEVA9av7HRzV1qgD9eaIOV1zwxtsMmSjtAPoOl6gQzEy3aQeCsmSc63igCl9LcKo7wlTDfmReOBthAEOF/4WX3n6J4dRAz9uxHXFa6z4hAXy8DmvkrsB9NYoGW6jc7bxuxXIYLyh00acGuEsCYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV1PR04MB9216.eurprd04.prod.outlook.com (2603:10a6:150:2b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 18:51:05 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 18:51:05 +0000
Date: Fri, 31 Oct 2025 14:50:57 -0400
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
Subject: Re: [PATCH 04/11] remoteproc: imx_dsp_rproc: Use dev_err_probe() for
 firmware and mode errors
Message-ID: <aQUFEXsiZwd2qQPF@lizhi-Precision-Tower-5810>
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
 <20251031-imx-dsp-2025-10-31-v1-4-282f66f55804@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-imx-dsp-2025-10-31-v1-4-282f66f55804@nxp.com>
X-ClientProxiedBy: PH8P223CA0020.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::31) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV1PR04MB9216:EE_
X-MS-Office365-Filtering-Correlation-Id: f5600644-4cf4-48fe-c4ec-08de18ae71ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p+uPbUk9afmy14piwR4poIB0nUf2CSdU6GbO0VYRb6COAKBkGAuuwpVOOPXp?=
 =?us-ascii?Q?EoMAe7y16O5oFWbCDxWM8a/3Onn0ikNB6fG8q6jNK5Oi2gl5Iv4uca+zGEKF?=
 =?us-ascii?Q?1Cq8naea8PKSl1QyUTu+2MvyBSL4CbEsgeqpWkDKYowD1XCFhs/0w1Tq03FJ?=
 =?us-ascii?Q?CxWmdSMUvnula+nQoGn/DCEvtBryK3hveXz1sKiGdtNMiJm9ySkzrExVTTYj?=
 =?us-ascii?Q?SDgfUck7FQjIpsjsJ0NIsJwknpJvaCzmYOqWaUrHCvdPzzrNopxGoD0KbTMa?=
 =?us-ascii?Q?Ra+ZHbPPNq6lYG9L1QPVUjgh60WGJC4pTWjcQc02x6+sLVEn9PMAqYq25nOp?=
 =?us-ascii?Q?NIdG44pQQ+LW0s5Kb24KaYGG+2Pmn9WFBYWTbl548ru+t8OZ1g+uwSbR3Vmo?=
 =?us-ascii?Q?5U48pxbn48/anLnzzuAZ2hUB160k3eW8KjlBuzHlibVblwaQIuPhUEBMPsDx?=
 =?us-ascii?Q?TDmXEgpjZPXJFaU/qoZT04Xgppw+w1kgtG25NuMF3kTbbX8T70RivR2y9qiS?=
 =?us-ascii?Q?d5czkelJHst7s06DkoOQYtcROvGoS9iIeoRfZ4BeVCnrQYsOYslxWmBMO0xZ?=
 =?us-ascii?Q?GG4xU5yZ7GgXWaEb26dvnuFjPsOsRbuWrQm0M8JkJV+Qn3Ffi1nROEorjcQq?=
 =?us-ascii?Q?H0XkLjMPv4VYh/wGgmJJ3VfiJuOZy1vhnTUjVi8K3Ig/xwK+QVKg6n3ztqmM?=
 =?us-ascii?Q?CKlnWa8qBA2RSVr+XcdVC5P8sGnTDK2aHHrgeEQ58NbAxX+bRTchTMDK4OM0?=
 =?us-ascii?Q?7o9lL2vMQ98/7UF+nmh5QSrwVGmF2IVgtCQy9+gYKgTxyk4BLGTWBPAmeHAc?=
 =?us-ascii?Q?l7qgW0H6orSwj18bJoaG2g/M5oBMvZWw3sDWsDQEBvdRmZEWXDvGZScC63Ai?=
 =?us-ascii?Q?TPxqGYBPhOtY4PBuX022w8PoWut1RkEZTEtJVuFQ+ZlT46uNouFY8FNu018Q?=
 =?us-ascii?Q?Ohw7kkiHlGdP+QZrc2d8X2qT0h2MqWwYQ6p/TykSObl+SFVLEnO1pzLbJl3g?=
 =?us-ascii?Q?jxsUUJvVpJPgzuZEi/VM9jS0mg9/eDrWLsavNZ3bur/w5iBKp7WGJOffZtq4?=
 =?us-ascii?Q?Vhnw4XnARdqUzSLf0Ulc/V/KSgLxHs8Wx7+v9QEAsMwH6z0chOfFiryKZuWY?=
 =?us-ascii?Q?Y4ailoUDtPr9HlG4MJvl4nk3dVEnrJx4gcoqm4Ptnpv2qU8cEHfzjrBO5utA?=
 =?us-ascii?Q?nRLJWSJ+ii2yPm4gQXgOn+DVgjCr0Ojah3gBNZzqts3OIDswEaL2zKVQr4mO?=
 =?us-ascii?Q?rM14lJQnXGpOo73w0HCmplzwR1ZNRa72mOMgZ+iVVDBPtgxEmeeDSziGDzM0?=
 =?us-ascii?Q?3TxsugHomjW5bWleFyKlkuVntWmcPCqRhXAERLgolodOVASPjAtsm3i9enFt?=
 =?us-ascii?Q?9yUDpZn81D5udqYXjTYdzsgBgPmSDf7GSLGsjkSG25WzW6jN5qhCS0LqZtUy?=
 =?us-ascii?Q?lYRmLEoJwBIKXzK7wzSGlk0JHl1Im78226OZXHBsCd4ycjQ1Yk6Dk3KVLYfF?=
 =?us-ascii?Q?/lKd+Eix/m56YqADMKBFpM0YKa/hJnZW55z2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WxKb4zct71YLX0bzBOy1G7Ko2EbXVUyyZAHKvbrkLf7ZU3ec4jzOBPMRTGal?=
 =?us-ascii?Q?n3Xf+J4DNMA8DvRQOrmMDMzQ4fY/p/9zTm0wYFaF28LkWoueHitccYcS0QCJ?=
 =?us-ascii?Q?CGf7fYHxL4O8HsPlO+b7vXcIaTDDHLI9v+84XI63KursHm+5nB9JPSdZmKgF?=
 =?us-ascii?Q?GhaSCq0cvg1mltCCJud5RPpI98l+zAAnvHRd8ChL6GvjvP6xIVHnU2vV6yMJ?=
 =?us-ascii?Q?f0Q69K5p0PDR70ghZSssWgwYXoyzGHutJyLGmzor1HjHVuIDnUw2D1UP79/r?=
 =?us-ascii?Q?pMKRodPuhkdPWF7pXcNq5x2vSRiUljE2t1ISYr31dLGayiiU9mpHaCUEMhUX?=
 =?us-ascii?Q?wpnk3tSu206OdHudfnStzIm1gMGSWML7QLQ8sH+wBSK0nszgvGCYpDg+CSH8?=
 =?us-ascii?Q?ny4tBhiMbzElOy8IPEmGojcPbNCycQLUVEwLzyWlzjli/OeJy5TcRBwuJS/c?=
 =?us-ascii?Q?+mwA1eYoMBnBzIt+radihcBWf8tJNl/6PVBI6tgO0S3Dx8fnbrTNxxXH8EQg?=
 =?us-ascii?Q?K403eafsndLOHvs46nuvTBS9sjm97plvYtxSKgwMvZw84Y8eZ+KvBXAaPn5Q?=
 =?us-ascii?Q?B8VkiyAbBEDSSs8vgnnZAZB2M8IXykfw3aUGkFJoRQtdWpIyUuyF+zjpVzMI?=
 =?us-ascii?Q?TqoHMoecW2fsGs6ZMl0kYBFIwiPMFShbR29xTFmEyiHjoYzzO8LbbLmx54Zt?=
 =?us-ascii?Q?Qt7B1tcFBH3kWvEngeJ+Qd8gZi79L9jnmg7RARi2t3phvE6hQE+QN0AVgfMv?=
 =?us-ascii?Q?nEdVkobGH6tAo+XaJXAnxM7VrJSmMrmx49/1pij+8CGYtEOguAEnHqXbjcFU?=
 =?us-ascii?Q?g2F0NgO2cIbPiTvFFxqK+bciUFs1D7QiwIYDT0FzRyC8cm0JJ/3SaA345nz0?=
 =?us-ascii?Q?nsmFLFSacTVq1FuaUqaIA5/HydmscG6zkaoeJEnHh1yRCViQ/jgKCD+znHn1?=
 =?us-ascii?Q?rJhqTyT8bzAHqsS1rW4rmtKPuCPbs/Ygy9QIiCB4uQagQphkmc7pYonxjxk0?=
 =?us-ascii?Q?fokxoQULT/2hhWYaP3Zfwnznkh0nWvDYESpgHxJSTLKiW4wsSALLxZBS4n48?=
 =?us-ascii?Q?CWNNl/wHYCKXtBr5AKJPzPcJyR2DpcHosuT9TkPIyaBpUHgbiXoSWzbM2Rqn?=
 =?us-ascii?Q?edfRsIYmiYOUTa3M/6DoPH+E8NpAqCJ0ti2791903u02dEFwSbeyhGwzqNzd?=
 =?us-ascii?Q?HcmcvRmiolCqJK8UPxm6Mw/SyS7FWWR8hkc6UmPjXMDUKRXpYxH3k2BswrQF?=
 =?us-ascii?Q?gg+SQRRFX/dwnkvDcHfJv1rhGtvw7Gh0LVFuX8ZAOyAZGkAipNGl49auAX0I?=
 =?us-ascii?Q?Mn8PXLSeU9oQywargjsZ13IEWrS2lR8Rwtr/PvS4jVD+LaR10WRZKwFISBj8?=
 =?us-ascii?Q?Hyr2mIiLnAdZAbPVhXD7xqhHNNnt3LRjrNDEGiLYTQP2M7BRjF6SxvmDCY0X?=
 =?us-ascii?Q?HjleW6JolgPfNYtZ5QltMShro7TU5N7U3tukGqt2EsF6I1x4Dr7Yx6GwMtPo?=
 =?us-ascii?Q?Nhi087XQK+myqIVH9A0q9lH62i95tUxKvmILTVy+P+lf6jmnT0m6hrRWwLTl?=
 =?us-ascii?Q?rQsRSIKkJIyPe2snF1u/wb8pwKN3xmUJBAPM7m8D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5600644-4cf4-48fe-c4ec-08de18ae71ea
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 18:51:05.0871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0PvcyPjSZ21xHNLiOtLTDfnzadgw8jlABOSBWxIDoXo85vLxouXVLhZgEvfdfKEC5b9+VOl/ZPbxVdYMzC/3/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9216

On Fri, Oct 31, 2025 at 05:08:33PM +0800, Peng Fan wrote:
> Replace error logging and return handling in rproc_of_parse_firmware() and
> imx_dsp_rproc_detect_mode() with dev_err_probe() to streamline error
> reporting and improve consistency.
>
> Reduces boilerplate and aligns with modern kernel error handling practices.

You can simple said

Use dev_err_probe() to simple code.

Frank

>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index f5d0aec52c56664d6074272e276edb0c4175c9ea..87f4a026c05fbf1c9371058290b2d33cb94b9e54 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -1150,11 +1150,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
>  		return -ENODEV;
>
>  	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
> -	if (ret) {
> -		dev_err(dev, "failed to parse firmware-name property, ret = %d\n",
> -			ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to parse firmware-name property\n");
>
>  	rproc = devm_rproc_alloc(dev, "imx-dsp-rproc", &imx_dsp_rproc_ops,
>  				 fw_name, sizeof(*priv));
> @@ -1177,10 +1174,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
>  	INIT_WORK(&priv->rproc_work, imx_dsp_rproc_vq_work);
>
>  	ret = imx_dsp_rproc_detect_mode(priv);
> -	if (ret) {
> -		dev_err(dev, "failed on imx_dsp_rproc_detect_mode\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed on imx_dsp_rproc_detect_mode\n");
>
>  	/* There are multiple power domains required by DSP on some platform */
>  	ret = imx_dsp_attach_pm_domains(priv);
>
> --
> 2.37.1
>
