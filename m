Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013001.outbound.protection.outlook.com [40.107.159.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33760340DA6;
	Thu,  6 Nov 2025 16:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762445302; cv=fail; b=iCDqdMtaczTHYbDBprw7O2vUJ/AFjJ8Y4NXx7hh0mCTRMA05RL/CPWusPN605Xms1bnFCdd/UOmFshIFx8bVb7nbXimdtFbaaKHHcVcc/1NT7Y+SF60KlECKk5jplMSfgRaZyRrOAfj3fzu16+sdeCRHVxXmPwV34/FvY36MQmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762445302; c=relaxed/simple;
	bh=d9OQApLPpbFHjvXDoKnP/pLJotRcq6+d7w7a/C/0AWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ng/kORsK8YWKcVNQwHwJe7AQLwVYMvX4MO7NzGZqV8w5E4yHkmePoHQzgwDYuD5aXU4y9ViMuZqfNqKPR6WcpY9nt9BSodyu3aYKr0k80FIWQO0DgVrEh3o6SZwrVioV5nZKRtDA+OM6FOs29z6R7h5p0E+1+NhauHChzO9xSNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dXzqQtAk; arc=fail smtp.client-ip=40.107.159.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dXzqQtAk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TyH+WtNFBJTQjiWWR8wzc0vHwOg++RWrk9jwngjXEkGCwe5mkvuhTHWzYyBW/W7cPb8j6A5cgo5l/p4BJFkQ5SeV82TIc1QIhU3gPEeeXy5B5VSeNtEfY3lxNXqRSB1qzvzLMtb/tot7TYFcymbOJv8lcfzTcXBbYPe/qL/IvJJMzHLGYjhZsGcCxlqTwacnna+EVNyDHy7vNx7f0cVzeBkY0UwHlXQAvkbBiEDND7/evkyoQawDkGP15doFYZ4L3DX6ASdjml7wNnFR+lc9V43lYvfD9cVs0uGGFAHTa63pyY31KWHp0rBCOAvo8iXKnCn9zOA0dmdSsmskMfu2LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IbP1KearppWvvqn0sMoFf+o4oP7lZ12WSv+DIZyMOSE=;
 b=AykKU1lUlIQ6Xu+7IWsWMZmwOmuOlBiMXuhYw29iPx9csIUb+EkDk3TBIMUwki4Rq+HRQSjfM8zDmPu7x+B7VehOniKk2VRDB5KmwMZN3xy0mkZ5pzawa+7+FVySdIj190c3UtctvDuUURXWH2HrC8H3AHbP/hsAGwFo0cVkv744JZxt9rerGC8zWjOzRmeMKH/AyZzOHsbZ1i+jMVntvf5SaEoRE7VbQE7vC5vUMBk/kGOcrnxa015v0wYCs0YeyHn3QncM2QgDlh2YfMf05F1W19dOgGV0L/ZfTiRJChI+8wVD67RZhS6zZhTdukGCXXL/A+sPA/ySzBA4GQ9iRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IbP1KearppWvvqn0sMoFf+o4oP7lZ12WSv+DIZyMOSE=;
 b=dXzqQtAkTJT7cCF7k4s88wdNQITPgYsDVFLYGO6InCQfoYQ5H5urKv8UTACt+GeJoS9XHpF7cVlb4DSO26pyuvXYSIbrdy3r3Z6I8eJoGAuOklsO6QksvRz2EjFGEaerxGW9wQmQ35TPGEIK04WddQAuLQfUMVZJ7Ylb94d2Z/vjtr8lS/TVmsw/8z9RVUpMECOP76eZOp/RwfFk1V8AMtd8HH0jqlgRaFE7au3oosrKER5ih6Evjdo/7IvlJJ6McieHd7ForgXFtMOD4BJbkRv6M/PJ7HcWIQnccd3B/Gn6vBtY3nRiX7gAVUaXsfgcRfkJctzYgzEKOJXfUOat+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by VI1PR04MB9977.eurprd04.prod.outlook.com (2603:10a6:800:1d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 16:08:16 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 16:08:16 +0000
Date: Thu, 6 Nov 2025 11:08:07 -0500
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/11] remoteproc: imx_dsp_rproc: Use dev_err_probe() for
 firmware and mode errors
Message-ID: <aQzH54KT5Y3WAV1v@lizhi-Precision-Tower-5810>
References: <20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com>
 <20251106-imx-dsp-2025-11-06-v1-4-46028bc3459a@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-imx-dsp-2025-11-06-v1-4-46028bc3459a@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::29) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|VI1PR04MB9977:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e7135c4-8959-4ff7-8955-08de1d4eb197
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1y0svSTdlRPprHDIcIEs42ZetLisLWYGLSbbXRluWfmNF0adjvbdeW+Qs6pr?=
 =?us-ascii?Q?gZPzS3IhgDVtH7TJDFkdL28UpbB2iBdsQbvwUcOKSxsBccnyl/TjwIy3TL92?=
 =?us-ascii?Q?gRMZR3q48FvpXr31m92KfNvPNHdhGC16IwbROSbTHGrp/PjTEJtNIcQ2f2yR?=
 =?us-ascii?Q?hW6fK6ykX+ZRsIW0+zA+dLPG/DaZdLZjBWDASBBb5zv2pJP7iwMMjM+G9I0I?=
 =?us-ascii?Q?0ha8AZyx3s1x2lRxvDWgamm2+KP+CrtJVPsnsK7jVhAC+sEn4wQvFFKtoWO+?=
 =?us-ascii?Q?TzRs6NE60BY+xgF0j/YOXlcK0H0Cd7V+uYdL0Z7D0YD5F/Iq0vbhymDYlY3v?=
 =?us-ascii?Q?mB7NSdVjWVa19ZquuaeJg0nEI+2Qd865YDaAN5Sp++E2sUDNR2qiP5wFG0xX?=
 =?us-ascii?Q?V4xf20Dy2Qwtb0c2zhiKDGp5TUozjR7JG6yH9sp+UUmKhZOpDb2JOEK84xzd?=
 =?us-ascii?Q?gtJmNChusUzBHXWMG3bb63grFLZtJm9+WKQfuqfioqS7Zf+zOQsS/2T/PydN?=
 =?us-ascii?Q?aIm4imXxTOSCBAnC/XWtUEb8I5T5u14o4chnk61Wc99ykvqlbinEkF409BkZ?=
 =?us-ascii?Q?z5NxWwYQAG3d5Js8x2XqSrtLVoZNx2DAdPSON9+j0sF7UcBsilqsPOvo/SMC?=
 =?us-ascii?Q?iv/uVQXFVXpf1laU/BLyc5FsY6bdVbj0yXhIX7ZXo4IxLZwKGlb36VVUAojE?=
 =?us-ascii?Q?U48EXEqumUuT5bFwJzhpTO00j8/YFOb9Kh/Zx8qnOa3VrMTFdITKw9ky7Y2S?=
 =?us-ascii?Q?ppEhcKcv7szD8aDKXT8r+NWfjPOf6b2A5UDo+Nk+bimnGIV1ngIxhGqlxYnO?=
 =?us-ascii?Q?EaWDRqn+/u9/d7Cds8PaXf/aKcjpcRoHA3GGSz0sN44vwbCeI/XSmKYV4rpV?=
 =?us-ascii?Q?2qBX0qyxNkbrnPa5DzusZ9w4QyLzhU7S767Flh1FZoNwIekCKYnMikw9VWEs?=
 =?us-ascii?Q?cGNn9ybrNpauumNUSuUo66c7zgLXf8tMj98bI275auJ/p/xQOmXQxDKAYv/0?=
 =?us-ascii?Q?0LyCmsx1c2CLT4qp+dVxqRmiCEWdWeKo9ETl5zGWNhYh2SZeFWXFp3m0UMjr?=
 =?us-ascii?Q?ebwSTznpDAy/q7yy+5rIfnt9WeUKdQHFfGjwp8uRrDxxLiqIr8juu0hq3fHx?=
 =?us-ascii?Q?BwJC89SD4k2MuSNJvrcT0CuQzl6jjWHtpsWkROK3KSFhQWIZETym/tt2uCuy?=
 =?us-ascii?Q?TqPDapdi8PTSfL86CVkhkyNhyHzN4E6XzxQWBJFJhJmOBnz6ZxR702Hy7FAr?=
 =?us-ascii?Q?KceTw+L3el/+26FVEgcYZwJqrxcDFXR2porLvLL7E58YQuQqX08GCGpAh7rW?=
 =?us-ascii?Q?8SNCTMlKKXKy7YKU8H4jHg8SCt98dV+rIFfRmA0oVox59izQJ9sKPVsVQkul?=
 =?us-ascii?Q?F8LtKSdrWZesWquvjADM2iJlD7//2djupSxs7COKgruoymN+GQM2cnZewmyH?=
 =?us-ascii?Q?Oel8CLFT9NUamoTnxyQ4IpyVFXXviPhLRKZpP9xaSoYNBK4YdhpWCQk4lzZF?=
 =?us-ascii?Q?oOGgf4M0odJmBes2k0AMYLg3B5z/MPaJSr0M?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iFC3eKDeCClqboP8MUPQROHhZlT1onqx1pqoZWA7oB5vXKSzjEiMzmtNboRw?=
 =?us-ascii?Q?YwbuQC0PrKr6K+UsPdi6PRQC8MttwzaEu++9w1Zf5v2oIDJp6WNFTjp4kUTv?=
 =?us-ascii?Q?xtmfKHS3NuTusyouItQcJ+sQY/Ds0eL56LGYSalPzqsW+M3WHVL7xXRup12C?=
 =?us-ascii?Q?9i4y2tzQtmxCrjkX0reqZ1CkWhyPz4kNsCcL22UHwX6HnfqhLYY3ZxZOEaax?=
 =?us-ascii?Q?eDYW7M9VNDP8I5XaFIEWkKV8b89986aqbfhPw08UUsQLSXLADh8b3ig1zSsg?=
 =?us-ascii?Q?sVFL0KpT8yVhq+m+b0Npg3474AFcwBKM0Meey0G8/7sBomlkdH8UJIs5WA65?=
 =?us-ascii?Q?nFMAxXEke1BHesORGBPsZQlFKKQJJpLBAnAjY9KcCvwsL5m1xyx29FHkGR2x?=
 =?us-ascii?Q?oNg7BA703b/SCjOid+Hls4koCgYhE65gEpU3OJmqPsI0NOkANuhslYjL/BYR?=
 =?us-ascii?Q?DgZCF2+4gspjuAIVCINnph5oO4Bvhf2oqQ3Wce6NaOy5WzJyooCzZvJY3tnG?=
 =?us-ascii?Q?qxkMMZVkC6g1XbnyHLYMTMIcxOeb8KJ1cYI2/19OPwmi8lLM9F7mGoGeia+k?=
 =?us-ascii?Q?R7NGpkOwyG9Qg9JXq482/RCUNHzmOqGq9iDHft+lAZ8j9DYueBB2TxZU7BOS?=
 =?us-ascii?Q?xRJp1rW3Vg9EzvV6aeUffC9eFYI0SR5TPKg2bQmLhIQCBtmHPvuf9id1axVC?=
 =?us-ascii?Q?F5itG0XJvR3HZ2BDzN6Jhobbas47w9nBffqSbBue5gi1dvX5Qzl8iCHRSeE2?=
 =?us-ascii?Q?YapPqOvzpQ/Y/3Bxcf+IkEXqL4TlugMqLIiTFmBi1k7ehRUN0fvK/cfLBfm+?=
 =?us-ascii?Q?C1VFnVNQxSXfLnhPKAzE/cpYGRCq9kGegeYPLSSObp4o0V835Ap7tlg1HSlk?=
 =?us-ascii?Q?p3qeX4Jmvt7/zQJSYPYS01AeDmbZ1eDIojetK/8wUVr28kBVnijFBFJpBHxj?=
 =?us-ascii?Q?GH+W2C5acG41PvbLuiZKv8uvGhdt8jeUt5a1fr4j7tF/Yrhv3/fRMGDHv5Vo?=
 =?us-ascii?Q?c51zuKRfWXvH2P8w9ZsxNF/FncT5NddbZjYkmWH0zy386No3do+Fy17I5GYP?=
 =?us-ascii?Q?O/I6f6gO/ee0WuFRAqL/BnyYTPvBy1jG0NI80AL/jKL588Y5ebPBXu+rNHc+?=
 =?us-ascii?Q?BZvJgEWYsLmPFLtitofqXM5FYHcwrSrxlrtjsvr010KVj/BvOMgrRP/rq6lp?=
 =?us-ascii?Q?QtVJ3S//lyay7OJh6nm5Y9AqAqMyGpb8nV3H827Wq4L8Dtbj+bF4zV3Bqtfn?=
 =?us-ascii?Q?QZHpPw09LxPx4FOOIug4eEsgbcQXFxDBstvzuJY9O1A8mgYE/fjBlN/fXzvv?=
 =?us-ascii?Q?JJE+N5LLmnqtRxKQlzPoPwQEA1j87GJBUBMlIGI2z3iBCPLoxVCkP+G6ndFk?=
 =?us-ascii?Q?Tdiszp5oTm3eheSvtSUlMYPtAUcKinE97MnNo5bC2zqwk/MOIt/j6YXxBDV8?=
 =?us-ascii?Q?A3ywRxO/rnLplx0mjHj3krQO7KrR4Jbaq1wHIxpq6WuiarQenNgM0PMsadyd?=
 =?us-ascii?Q?HOBxVuBD+aXOCNKd+npHqIT4QglgTz5BofQhRdVtYryLCaqHvcHETNjDlBy7?=
 =?us-ascii?Q?a3KqgjgdOmPpEiD3xqHKgipV9Pxv1gJih+GBheFP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e7135c4-8959-4ff7-8955-08de1d4eb197
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 16:08:16.0745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wr5rRSQ6A9PghoDht+tcjnRPFmhIQAPGsNz8UhjP69v10iXPOGB9Lc7tMJo6/fV0683SBkfOeWgoilnVCAbbtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9977

On Thu, Nov 06, 2025 at 11:30:30AM +0800, Peng Fan wrote:
> Replace error logging and return handling in rproc_of_parse_firmware() and
> imx_dsp_rproc_detect_mode() with dev_err_probe() to streamline error
> reporting and improve consistency.
>
> Reduces boilerplate and aligns with modern kernel error handling practices.

Nit: simple said

Use dev_err_probe() simplify the code. No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
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
