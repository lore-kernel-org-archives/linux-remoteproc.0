Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012037.outbound.protection.outlook.com [52.101.66.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035C11459F7;
	Tue, 18 Feb 2025 16:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739894443; cv=fail; b=dw+33gpcCW1JyLsgoiInyDnPfNPkJYz+2hz2OpSn6+Mzj+HFlOncCDmqvPhzaonkxdSGhZ0H0vCQBVeTEpNdcaBzPHHn92It/PpbsL78LyfEPw543IBjZfYVRu9ggihmmibn4oisu/GqBlMco8oGuMdFYyQKtfpLlDwQcuicS+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739894443; c=relaxed/simple;
	bh=1rEWcKzCgoeogf6BDDU/t+vag997u6IU+qv/Z8Qbxhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ATZ5+QDSctE56yMrhxqNrVtcPgX5fU4rT+o4mPAyI8Xk9D0R0W11+Zil3wKwmO7pSIa6+UsU0TSuGAkixU+ajn5mPs082hBjoEts81vwe6hjcY7rx9wAkuFHcAdH+oSgqnTUlR99UsVdKNSq+42WinsOBnXODauEsnc3MeV9LHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bL8RsrT5; arc=fail smtp.client-ip=52.101.66.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bL8RsrT5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UbSxgEguG2C+s9IMF7Y3KOyWTBCdJPuNvEpGzl0cw0cBwc8O6EPqZcfIlvEk1jXWaK2VhTYFjNUR+AUnk3WWBwT8lsSgwJaDF/0IVGdYf83LJ+Sxxf3wpfDRg6u4/K+uFWC77+qM3Q2PxZ6oauw4JVEA+z0ZzOf1PfT6rJJwYauQX0z3Rr3KnZwNTGAWWLXTdTy8CCcgSMppYkin8wjOCQQgiTrVgJ46Q1ohvjzgjSWwYqXT1WjeiJLS5jTkvU8mNdpGN5RS1psz8+2N8d+pN9D4ZTsCSuN9lcsc5ESEQ8wXBqOWdue9OY8LzA7OkzumqxZNGMyROycryMrUlYvm4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKQtRB9FE0zpG6jUYssMePdcfagCsrYwwdSc9FqElMg=;
 b=y+Jt8tavxIHgUEGprwKT22v45PuKpHZSJmP5UQMbzwa6RjE4vbLP9ybnRGPDAdjPrYCr1tHy4JLlasAs4I5dnPCdex5UzkB+IKXZOCvXrdKzQZ0oUJyMzBE6uhlXNosD84Sk+4Cfg74C/8vbZMvhrFsqX30f6QNLcFiEt72SGwubGjpqQb4NSB3RoMXXsTaY3k9f/XnYdCYGhwBkrNxJOl0lkXqiDiGVGRNh75NaHZ8VQ6D7mtWSvaYs1jXORO21c/yoYKrMAK4MH4FgKz2PgkaSXfjPnO4kacvRTm/HWKUjEjOEpzmQEt37Zsef0Ybrbr3a3CKhT98RSzg7AMmn9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKQtRB9FE0zpG6jUYssMePdcfagCsrYwwdSc9FqElMg=;
 b=bL8RsrT566uL5RQON9DfM71mELvVXDodJPetS3PtCrxwz/sGTZ+lty5y2K5nNNqvPwJP+9SJjZVsAHDnv/yQg44brMBAM0rwHegLjHA/o7AGp62H/RGxbu2nFLOyUNFHutrot50//cFkf5yWVoUbr6F9dxzLKOqr0i8K4B2mbVnD5Pl3GG6LddiH1lbbNQEjUKiYx/b9PY2huoRfBCCgtGh2jpPhk+s7GrULCFpz4yYdHu6DoQOtGCliZ5CBNuWnobTJm1iwBXx6kZE+BqjJRS6W3UIrsuIhFQy3WncpsZCy2+Jsr1eKvS7VHIhGfRkQ5UT+1EkSuC3bVMe3n5Fk7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU0PR04MB9299.eurprd04.prod.outlook.com (2603:10a6:10:356::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Tue, 18 Feb
 2025 16:00:38 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 16:00:38 +0000
Date: Tue, 18 Feb 2025 11:00:29 -0500
From: Frank Li <Frank.li@nxp.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: p.zabel@pengutronix.de, shawnguo@kernel.org, mathieu.poirier@linaro.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, andersson@kernel.org,
	linux-remoteproc@vger.kernel.org, iuliana.prodan@nxp.com,
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, krzk@kernel.org
Subject: Re: [PATCH 4/5] reset: imx8mp-audiomix: Add support for DSP run/stall
Message-ID: <Z7SunWjcc1ix4dOq@lizhi-Precision-Tower-5810>
References: <20250218085712.66690-1-daniel.baluta@nxp.com>
 <20250218085712.66690-5-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218085712.66690-5-daniel.baluta@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::31) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU0PR04MB9299:EE_
X-MS-Office365-Filtering-Correlation-Id: bf0cba04-da3a-4409-f1c8-08dd503562df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YfouRy7OAhsNI+0MWl5P+4HSNE6ig1KeF2SvdhpL8kqA+zChrhM5xouUGXNR?=
 =?us-ascii?Q?4e5CuDBRte/ghkpJ+foU+7Hpbr3zQVjguymWX7B2bc4NPjPCeZyCqDyGrYgN?=
 =?us-ascii?Q?yBYtY5g7F6vm8U/8I5H06a4h7cQhQk2vVmptn+CdJmHA+1nbQ6AMxedRsVg6?=
 =?us-ascii?Q?9spwt5x2xTL8m3VS01TH89OlEaBYJy/M2E15X2cPbQ3zcwf9OMwV5FiauUYP?=
 =?us-ascii?Q?sycY55MgA6BEzrgjcHaeu2Zv7ZKC87bJrKz7gTCug5yNqQksdg8cDz86XM+C?=
 =?us-ascii?Q?60fr6XixWXhdW7mlhgs8LHvTfAqCvM/pLmjdNWl2N0Sb4TdK1z5Ib8bsA9GJ?=
 =?us-ascii?Q?ccTCtd08WsiNV6p1iweFMZBeAKv/5g9Wc6te8J+uRLYh7VK2QXwki4hbO0Pu?=
 =?us-ascii?Q?++vwks03wok70E+ZgUwiWe1yTRa4Una0quySfV+6irpZuRgXdfHVREo39Sdo?=
 =?us-ascii?Q?Q3YR4BXdAClz6AYl7gWDXxVwERJTHM+pKtS0ueqL6Daanf8HK5RcqBQgTXNE?=
 =?us-ascii?Q?B8LHaWB6wQevXFA0Np+6SW1Z8MOPhKt7jt//b8ltTMTXf1G+PwW5tJNnAEeM?=
 =?us-ascii?Q?cno8UI50gNE12XXeedqDTggf/RdmxlqP18Gm9BxP5vvFOUwokeya6/qzf/DZ?=
 =?us-ascii?Q?KvFtuqxBppYaC3l8jzPzSjeAtMIcGMD2SfRGzQFxT0ZOPMfGPBfaccA7lQ9O?=
 =?us-ascii?Q?VrIfuYYn2QYcHweKbQAuZpcYgfzBDGcRUiypGaK+lMuB5dtl3K8hPR/p0mES?=
 =?us-ascii?Q?e2JkCXfYIlZnIG0aXO39g8Dkkp82qCRnvqmsQbspT6AAYrtKVMM0XQKQeP7n?=
 =?us-ascii?Q?eh26+4aBJ8oNMtlaq/rXrI66fCRz93wq8HoVPpYa28qkddWKfCvKbMav6QG9?=
 =?us-ascii?Q?NqEcwTuU1ghp7ejil/eCB8bj2GjTCtoX1ibx8BBA9d0CXIwHTH7i5/EhACjm?=
 =?us-ascii?Q?WiHDYAmhg0Gtq0jM2xF8eii9Mo/i6CLUzviF0yLtccGkPrDnerGkuXUXT2Xb?=
 =?us-ascii?Q?haAFNyEyKqt+Q2CsY8fKId3mfcbVrScrOnCs4LyEZp2BFZP1jbI6tVxPKa/A?=
 =?us-ascii?Q?CDK3AU00p4GS7e3GWbSg2XuXS4VjE9r/JfSfWOjGlyfrqhERgFzXRUb6FhuZ?=
 =?us-ascii?Q?fsB7Cp+MjqjHyTZYi7e0V6TjQ48S11SrwG8X5wT4hZ3B3A9L4emiSQqZNtPi?=
 =?us-ascii?Q?wQchBcjE8DCjXFBgcCIGX/jLFkeixeUb9D394hvIDEFGkGFh8S5hzOjH0hC2?=
 =?us-ascii?Q?jWAORqY8/Irt++VH80vwS++i5tNE7SeVmRIDMT54W6h1nMAz8DXkpVT+ALhm?=
 =?us-ascii?Q?PiIAHU4kUun2UU+GSzO2++Sl/56WJP/NpQJQ3XQjH9honHb8J1w18xiDjNlg?=
 =?us-ascii?Q?CybIortswOTuQP5PhMc74Jwyg4+wmfcafhj9ZggNJdcZ+xhP2vIEJLAnRJGv?=
 =?us-ascii?Q?6dF/tHibE7EI10JQ30l1EHsDcNu/j9cI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?538G75TJ88yedpEOy7i8wGF9UAVJu1kkI26rMuT32ZLD6oYBDeLGmmjImxFU?=
 =?us-ascii?Q?AF1i3Bk5wxhP+UGnYCtfPQnpvgf69BIrXBmSyU+7weBGV/uwEbndtF3gS58t?=
 =?us-ascii?Q?JHIVXrVhtie3QpjO/yzLQPNBNbGVUxDjjpZOtcfbZ8iRGxBpv6ptByiFtIn7?=
 =?us-ascii?Q?V+QW4gXXBcyis8qY8GWRtmTLLRj0KPJO4u70dhJPMh7UUSJuOOIfn3G6Luwv?=
 =?us-ascii?Q?lsPMf/xljpe+ceTHtQ6YzbCTdYe327rBFetfD0FbvSBxHI27bypWNneIUsKi?=
 =?us-ascii?Q?cN6n6bDzs7j7uxHeUO+//wnbQkmN2vKRUH6DFA+tvYjeg6RBUMX9fmWDSOQp?=
 =?us-ascii?Q?Pi0tUhBv+mxExCJ6BATg1e79OEtzfhPtYeUTfQs+sq97/g0luLGjuE3D8ij7?=
 =?us-ascii?Q?5605WWllju63CL7fKDlrQaPQgJfk95Rjim5GA8Jo3K+WaK1Wc4Ht0G8TnUrx?=
 =?us-ascii?Q?PvSbMI9GnPewz5DrkgR5SwBhtRPaIhff0qrRA9UTxr6dzgGsT2hlKShB1flA?=
 =?us-ascii?Q?mn/t83rb1AgGMQQgQSs4xXEbx61kLHozBtmt0+aMDAuSYXCtKTd1AkKTS6Ko?=
 =?us-ascii?Q?bqCTjRv8o+NDSvFxVdEvJ/sjomvmtomYSzHeuA44WXBA0aZgmY4kBT8tsIfX?=
 =?us-ascii?Q?kiTRluidbp2TbF6XjSUK1mGc42ACjTBqglYjWtfLYGZy54BM1GzR79T0W3CC?=
 =?us-ascii?Q?3KmyTBtsqxb1XAvOfZwV5KQH+kqhpo7LZK8Q72kJotKoXuRxW0x6R9XjQUuO?=
 =?us-ascii?Q?bOpn1Uj2zzjC1ABNiudHRLPiYIMr+Ml11/FHt7ltQ7jMdDyu+yzYy1N3fMlt?=
 =?us-ascii?Q?SIdwFlEKxwEEj+/a+HeCP4RarmEkyaFU+ZcISc4eK1k2qPrRq7Q7g9q6KwO2?=
 =?us-ascii?Q?bw4zXINatEd1JKT6sJIxsqm4+25X8SVKzYwKsjKmSCs23H9V89muglr1I/Xp?=
 =?us-ascii?Q?3UyDx5jX/Pz4nWJnizlApfKK3fkCw1THkCqR/b7Dw3ZppEg1ZIGVswD2rtZp?=
 =?us-ascii?Q?SbJPosRgteANkd8Wd4y6W9wDvvNBAiqAaKkIqPrDpGPVpmhrdQe8SLlUVn4t?=
 =?us-ascii?Q?moNbksZtta9iXayMgk+FquHqVFfd+T74EZCBjdQyZSQ0lmdzPndEz/jNxNFW?=
 =?us-ascii?Q?uKQ/7Yj5lP+A6z2enATf0iP4B8j65Ev5k/+9HAZKAllYDubbjuI43/RFES6W?=
 =?us-ascii?Q?cDMhuQmszdXxcpQgPoWScYLmuXm+3eBaSu9VW0wcbgjVyz+3BHbFWgtHWlz4?=
 =?us-ascii?Q?HIuiiRwowvYU46SlW5xh4tZFV7a+0pdKqKjxIwItyHERKLM17wLLJbxULJGH?=
 =?us-ascii?Q?514Hsc/4CYO6+8bROJqam+yWCi9Jb/x4mFANW3kkoB4QoSt8wN2rnvV1dv5k?=
 =?us-ascii?Q?QjsWUOUspyyD2nosf1MRXXw6oW+oh2tIBC9iajgK3c6l/tM0CAi7Lgc1fQAs?=
 =?us-ascii?Q?QGXfTvgjpv5kypFyd2NgA/d17OllqunmDAqYrNz3tUM88Lu1BInig27QWQSA?=
 =?us-ascii?Q?OZbbE+5+NV0FrFUMcOOYLIY0XtK6T3kou+QcyF1ODvklSpZjJ439StkbOcpl?=
 =?us-ascii?Q?/unm2utCqAhEdCu/3DFDLr0kjwNyaSqLHN6Bs17A?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0cba04-da3a-4409-f1c8-08dd503562df
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 16:00:38.0839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oOFUnpAceKbJe0qnXqoL/U9zkrqsNqGDeK7SGL4p0RVG3i4U+L2qD2kzlmQuL8EBKF9l9M0jUwgSwvmqhJMF1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9299

On Tue, Feb 18, 2025 at 10:57:11AM +0200, Daniel Baluta wrote:
> We can Run/Stall the DSP via audio block control bits found in audiomix.
> Implement this functionality using the reset controller and use assert
> for Stall and deassert for Run.
>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/reset/reset-imx8mp-audiomix.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
> index 8cc0a6b58cbc..ee56d52a7278 100644
> --- a/drivers/reset/reset-imx8mp-audiomix.c
> +++ b/drivers/reset/reset-imx8mp-audiomix.c
> @@ -15,10 +15,14 @@
>  #define IMX8MP_AUDIOMIX_EARC_RESET_MASK		0x1
>  #define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	0x2
>
> +#define IMX8MP_AUDIOMIX_DSP_OFFSET		0x108
> +#define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	0x20
> +
>  #define IMX8MP_AUDIOMIX_EARC		0
>  #define IMX8MP_AUDIOMIX_EARC_PHY	1
> +#define IMX8MP_AUDIOMIX_DSP		2
>
> -#define IMX8MP_AUDIOMIX_RESET_NUM	2
> +#define IMX8MP_AUDIOMIX_RESET_NUM	3
>
>  struct imx8mp_reset_map {
>  	unsigned int offset;
> @@ -37,7 +41,11 @@ static const struct imx8mp_reset_map reset_map[IMX8MP_AUDIOMIX_RESET_NUM] = {
>  		.mask	= IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK,
>  		.active_low = true,
>  	},
> -
> +	[IMX8MP_AUDIOMIX_DSP] = {
> +		.offset	= IMX8MP_AUDIOMIX_DSP_OFFSET,
> +		.mask	= IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK,
> +		.active_low = false,
> +	},
>  };
>
>  struct imx8mp_audiomix_reset {
> --
> 2.25.1
>
