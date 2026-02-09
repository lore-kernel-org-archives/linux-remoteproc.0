Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012028.outbound.protection.outlook.com [52.101.66.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115CD37D114;
	Mon,  9 Feb 2026 16:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770655022; cv=fail; b=Ar10PI/CS5OcBC4DJ7GS57IFA7TH+QiCuI9NZpWf7MGBrqi7qF3lDdOIbWltY8TfaZZndltJq4Pz1yzBfyTP2k2gAYrhapgxzJcyfeJLa6gt0XrrVt8tTsRTiVrQx5q/pCm53B9UzcHWYDiLgpeqcDwuuwY04aeTBbOvPSOZUsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770655022; c=relaxed/simple;
	bh=nPm5riVpcWpB+rEHx/O87a8G6agT7oc/9LQntPub4L4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EMWN5S2T3HIEoHQqGJEpUrL8K7dv7sHwD97ZU6CsQYvf44viKkgcNMk73UmPLSae3uzXT/qQHl/SEIeeN04LmtOWFFzYHQBlH65z5oozwatyfMWcmOi1FpfsZK76zn3cRyw6zNVhiLpyw35IEczl5ajHTdZ2D5Rpam8wkNyw0AU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FeFf5IJj; arc=fail smtp.client-ip=52.101.66.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FeFf5IJj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WdoM/DVbjS+ZLkGIdZJkJillsxFXPP3OXKa1W27gfbuV1Lnq1EqhScMfRkp7aYa8hWKx+JvdmWN5qdaeLdZZRDrArVBgTGcT7zMo3vIZmuVJ/baUbNopvYfPacWr8PTzqvO7RBWEJgQe4TSj6GtBML5m0gru8B12UNZx4DmIvjHf89fhjfFPFv4Af8GVbTvGL5nB7MwFZQxBlt0YnVvAt1SjFLLLGCpK15xDMs/brW4EHt66d3vLx+xqFdBTcbHD5tizJyaENvdJdKMC0MCMVGB/qOaPGNSj1s75Vu4ARUVhAA+vZAm5GrypQmzpcfbMiLWnua9WMYUOcL3M1xTY0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXOaBnSf98x3vdaWngcjqKYqAY33tB04nsRBQyrBXDk=;
 b=KY59DzuUn9JN3Lt64mUEdNbAGgvxnfTNeSaih53BET5uEjVK8tGoBPJ0wYUxEkjMEkjbUhA8wBciP/In/uUCNywRm8DguFwso6zPtcWeIrJVpCMr7qbg6ZYX3QsPCKor2YJ16+2Ki8KAK6zAhB2Rn44kjBJdg1b4vSnEanoXtUFglIv4kwr+P89gDxWjEj7hdORf34m8yoUE0VhhCVRFkTXDpx+dOo2FNTUlksPHbm95I03rbcCSbio5AnzqcbhB7RY6Lfi9yzUfv7biKfitJY7meRF+38SDCpx56MhpPtoTQW0Iyumcr56PhpXiEZGVnU7IvZxusLdlJMvEtHNE6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXOaBnSf98x3vdaWngcjqKYqAY33tB04nsRBQyrBXDk=;
 b=FeFf5IJj2rYQQ3fBrNHJx0GFwvx2T10x2jpoltUJalrI3y2EIfHHB3AJiC8ABr0F8eGkgXMt3e5pBY/3pUZhCKNtbKDwkCLPGOEanYv/y7hx8DMjXErBJPQTGDd0PFqp4XnbSAwpMqrbxWzaDyaTadkjusR4tS0NdnQDXHY058RbXygBMkYNxKP4VBLTQL7mzpJIvYd9Hn9NQGAiwyXeK65lhLyNCJzvT/gRmORU5fBL/QmfYYEJDNnMh9114oNP0MfKY8YHwvCWwp9E2QJ2u+KyD4LGtwItFL1INrJX0VxLKwdjty+wS6fyZzdvbejakhmS0kykBJiaNV/NSbbetg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB8363.eurprd04.prod.outlook.com (2603:10a6:10:24b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 16:36:59 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Mon, 9 Feb 2026
 16:36:59 +0000
Date: Mon, 9 Feb 2026 11:36:51 -0500
From: Frank Li <Frank.li@nxp.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: peng.fan@nxp.com, andersson@kernel.org, festevam@gmail.com,
	imx@lists.linux.dev, kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org,
	s.hauer@pengutronix.de
Subject: Re: [PATCH v2] remoteproc: imx_rproc: Check return value of
 regmap_attach_dev() in imx_rproc_mmio_detect_mode()
Message-ID: <aYoNI7f0OMegFBM3@lizhi-Precision-Tower-5810>
References: <20260209051407.1467660-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209051407.1467660-1-nichen@iscas.ac.cn>
X-ClientProxiedBy: SJ0PR13CA0124.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::9) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB8363:EE_
X-MS-Office365-Filtering-Correlation-Id: 49b36518-30b2-4f85-b761-08de67f971d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|52116014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p7/IJGtFMUJpfQU+fKBVi1bCl22c4U/a3/nf8j1WmO08wfd3UVRF1fWAPDZK?=
 =?us-ascii?Q?6Iq/N34aXFDXPsOdJ1RcldRTF/VXGc0fDdlXd5Qm4UD7tCN7z7NoxMdDAF/t?=
 =?us-ascii?Q?4HSvBwggitPzYzyNZZDBRBntMAgHBKW8RxuxFrIyD3o9Pi3oEg5/HWInv2EJ?=
 =?us-ascii?Q?YKuaRUrAXibztuEBoIGPH9svuc/3UzXH2VMUTBxwOzQh1YJN7Ya6os+4aTT7?=
 =?us-ascii?Q?oBhMFKpKWaYFNU8t/Q2HhuCBa4nmbNU2UOV2Rv1PwJMzZ3FeIhymalQSKldT?=
 =?us-ascii?Q?8tQeDyWJc1EoVIYGfIahGW2YDCIsoY99GuH2C7IYY2MifiIKhbWyOHZlpxSh?=
 =?us-ascii?Q?LivZ13duEOi9/c/rDBr3iLGn8LRcUWYyjS/jeOkW1tlJvnpLekY6+uuE4OED?=
 =?us-ascii?Q?/C4s4rw6S+eGzDUbp4SDYwgY4SOdJ5SHepSSe+1TLOw2mrv2pCyOrHEyybZb?=
 =?us-ascii?Q?ck68hkhQvFsa02rhjOa8yL0lZxRN2qvSMkU/5ceNcdb/BbX7XEUh22b+RmF/?=
 =?us-ascii?Q?wAtfaZWpy+O9gjuEardR7vY3cUaz/uWaR+94P2KgWt3/aFoB+3fM19I5C8hz?=
 =?us-ascii?Q?OiFx0goVe/uR4++ZtzZLwoot9kbIzmVTlOOYgH84jGpfdGlZlc32uU1u2RYo?=
 =?us-ascii?Q?9g4tJnCRDgovrQPC4K5SHreHg7LeKpleKFe9533LQOipgziHcOKwrXMrHc+f?=
 =?us-ascii?Q?PoJdGtDUbyxiBznOtmAkuvWAfJSXdCfgewhTAkRH5hbefYqVGOc1KeuTF53N?=
 =?us-ascii?Q?BpKfHEfmPtPBIE2LnCHDALLvBZrORKli9WCq1fKTRONAmllu0ssEEXnoAwXZ?=
 =?us-ascii?Q?1b9kZMfVrgQE6u9gQkh7Bq6fwQwuKuIhln97nuf3Yj0AUAjoiWxg0d25/CdL?=
 =?us-ascii?Q?FxzGgGokRpk7sMF2i4yuYWgdZg1wFXJE8QT8jnZEUvNQ5+hK5pNmtcQlfDVK?=
 =?us-ascii?Q?wYAfdYk93SsV65gfVn90xsJq9PJRe1WZ3VzZ/28ur0RngsnjaESNFadodzi1?=
 =?us-ascii?Q?ePJ7nUbM6cr5g/f7KiU4phoS0c1lsyk8wUzDZAd0rpSyeBq6BNPD6j1hmxoa?=
 =?us-ascii?Q?XFQ34siMBNQlrRQFrNaPxuDE6EUOijoJQDGS0mftXB0CV/quOU10H2UwybK8?=
 =?us-ascii?Q?KWw9SjtEm8vMXNmt3IsedfQLOrWstR/4u4kWbsx79SC2L7nKNO6mtxhHvABE?=
 =?us-ascii?Q?Tp4tTUeykcGqhZswty0rwMRujl3Vu93iy7jwiSxgqcOfTc6Lof17sIzhqpgi?=
 =?us-ascii?Q?DIx8n5cA3u3+IV7J8BpBEt9TcoIBUqJ0s+mh4yfr1V8czil3kFZZWgWCbCSE?=
 =?us-ascii?Q?cUsT59qZoOraPEBXI929u1w/j7A1Kr1pffCuowEBHOt0u9Pgkm8exYTFX+Xv?=
 =?us-ascii?Q?bN4VjgF5x0LK3uyyGAP4LqElqOtqejNFSy/4sras8G3LJLpGoPUJHa/prXSl?=
 =?us-ascii?Q?F6haZyPuaNC22Hd1acOqaCSPDVh5DapF3ciR+GM6Isg7ak4kN/BB/cXF9E2m?=
 =?us-ascii?Q?p0Y1QddRnxBWR2jZpazZT5MrjcYoscxkYZChrItqVlVQ0mvyihqvuyHcSh3v?=
 =?us-ascii?Q?BndQe5Jk5NziGA9edPwN1knlHBaMSfJl60h6uzeBsEg112cy5vspdoHI7RE5?=
 =?us-ascii?Q?BAYc0zZpppmKo4TElMcSylg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CkV9x+EJOg3VKIUM5tCGfD60g80imaC1wcwiFgO6pnaYBuRtBgnmpU5kUlsg?=
 =?us-ascii?Q?aSMqGk6lFbaeEby6wakZ36ax8FYJHydHd7oUVQ3/RyPBjBmJ82u/jGcYMj9Z?=
 =?us-ascii?Q?jTw6NcCTAgTHFqOh0/Wk9HPZZCyOBHN96nBUbb8KLJDfMNIHEPDfC5dlGNpe?=
 =?us-ascii?Q?qM7CX1DDfT9Sha7Ay1rv6vAg9yrKWhiYdmnV630MkFD3LrVECeabN3ne9hic?=
 =?us-ascii?Q?k5+0lp66K/sdRreYI5rOxzagbx6cC/X9hxy37AYV7mGD7nTlAwfaNoVImU9k?=
 =?us-ascii?Q?174h8Ulr+aH+fIG1fRs5BEWxQUY6rogWI+d3l9WY5HkCqbwQN8bTFPAK1wpu?=
 =?us-ascii?Q?ShhneS1pw3L9HGX2MMWcsqGcaz3VTDNVCVkl0vrrNOcflke4/01H9OTQeqv/?=
 =?us-ascii?Q?JSDRCak66fVREpBIRLuTPf0MZ63i7uxxr8tsRVSz0kBxdyhIicaVygwMEK9p?=
 =?us-ascii?Q?gSJrc6ARo6/TjDfzjpTYiDpoqFM38aWyDOGiBy3SRWKTGvkQi7I+nKGXwvNE?=
 =?us-ascii?Q?sQ9MUGq9vhJOhTkCNex80UrCJPZnEsiA9z8m+O9WMsrU2IukaomZaFjFbvrB?=
 =?us-ascii?Q?GB8S6dg6nCvaFcVXs0T+ozgIP7mIcoBPJyrIU/grfd+2Zv4SunGSY0t60+Q2?=
 =?us-ascii?Q?HBAuV1AmtBbqaMLJvcCczaVjKnEbTSRFz4EtCUVM8nGbgrULVRJhVLicEkxc?=
 =?us-ascii?Q?en/COBjSnZGMKEDt/xo+oqQHvNu8/n2ukS3K93hayGxYp2H0JO4bct1R50Ql?=
 =?us-ascii?Q?bp+9/7s4oyd1l5si1rZseMBIIz8bNKh0XaNwReUkYAkL9/8Fvg7UnMYH83bT?=
 =?us-ascii?Q?PP1rQ+zNziyFOyBwVVJACxzai1E2suqjZeJNpS10BaD9J/cAATvNIXVCuJuF?=
 =?us-ascii?Q?I/A1GafQToSFxBH91lf8vzA7nyE748SlR7uqQRDSODFXTiSLREHES6/GZTuM?=
 =?us-ascii?Q?6WbLUrISLRV6an9aWRETtScjqqPYuV1XzznAzv71av/W1upW6uSLsgzOdkid?=
 =?us-ascii?Q?AZT+mpm30GffiDEjlHlF0Vm5PYQWhkObcw+wZe+ci76Pv7HxDrZfyHB/Chit?=
 =?us-ascii?Q?qF4Y+6qnGF1H/H9IV9yAJDNwKOAGCB5EqyXu0h7zersJjyQzuCN96+IPDvPh?=
 =?us-ascii?Q?yir6P/ocW6fTQo31MuoDtRPk3uyZyXKH268kBCEbuUHafMUPs+vL5jN1KE/z?=
 =?us-ascii?Q?oCA9nZLwT4Z/+thbfzw85qoSfi5HtzrV657mKKz19sieNBrKy1nS61hdlegg?=
 =?us-ascii?Q?JgmIb9K8055uwkIrZZq5DuaQOHPa18wcptHNl54RIP0ZPvbT+uKvtRyn5z0h?=
 =?us-ascii?Q?OANlXorpkp5V0hysBxtU+a0HSlW8KpoIFdvF4rKparWBn6ZrprakQOQ+JC+f?=
 =?us-ascii?Q?KgGiVKDICWY8BF5UKCrElDSsIVTeNis5XMOStU15ymfoJcnBYA1Los0GzyAK?=
 =?us-ascii?Q?HVBxGr40feECsPkYCmtqwn+JLJ8+iopn3PPEnOJv3o+yL38WMq4lsKjlpFvv?=
 =?us-ascii?Q?m6oEP05gdbjb5vjklJOw38vBB6hi+w3va9dyOlprvzgxPVl5QeXTeXtXuIkZ?=
 =?us-ascii?Q?TMqRSEsQEdRMb8904tYhcdwdkx5xki3lifXSkiDAvvn4mCdhIk81NNsRLw+b?=
 =?us-ascii?Q?omaeb+lGVD9kw1+gttsw9kJlhJkEY0cShDWDfldzLlVDGC6jyyNpsOUsNxOZ?=
 =?us-ascii?Q?qONt5nXFd8QIS6b9/k74DeIm5FAevmjMupZmpOizCvbT/dNV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b36518-30b2-4f85-b761-08de67f971d0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 16:36:59.3060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y1tMR9dT36voCu+uaWYGB30QFGuBBOLkBIiEZ4A5MChIriMkXDMCukXF5qUVSmE06gXTK3ziyX7ZYPauBi5Tmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8363

On Mon, Feb 09, 2026 at 01:14:07PM +0800, Chen Ni wrote:
> Add error checking for regmap_attach_dev() call in
> imx_rproc_mmio_detect_mode() function to ensure proper error
> propagation.
>
> Return the value of regmap_attach_dev() if it fails to prevent
> proceeding with an incomplete regmap setup.
>
> Suggested-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
> Changes in v2:
> - Use dev_err() + return ret instead of dev_err_probe()

why?

Frank
> ---
>  drivers/remoteproc/imx_rproc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index f5f916d67905..75baf905988b 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1007,7 +1007,11 @@ static int imx_rproc_mmio_detect_mode(struct rproc *rproc)
>  	}
>
>  	priv->regmap = regmap;
> -	regmap_attach_dev(dev, regmap, &config);
> +	ret = regmap_attach_dev(dev, regmap, &config);
> +	if (ret) {
> +		dev_err(dev, "regmap attach failed\n");
> +		return ret;
> +	}
>
>  	if (priv->gpr) {
>  		ret = regmap_read(priv->gpr, dcfg->gpr_reg, &val);
> --
> 2.25.1
>
