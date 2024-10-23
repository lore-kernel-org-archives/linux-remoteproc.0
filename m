Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2085.outbound.protection.outlook.com [40.107.20.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6687912DD88;
	Wed, 23 Oct 2024 18:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729708719; cv=fail; b=JAQhqL+/jeY+d6+BQa6KlgRYCOqbMtjc9AEPCR4/8rn1qjzj46PbeQjBQpqXV1riBRqEX8tWStBiA88yRgemRhoEwgV3Zsqag9D1RL9m91VEv5Rer1VMqVwAmobP4r0uJKmBR6pEVab+gx6YJR8JzTvskn5u7OtaBOgCxn0zUQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729708719; c=relaxed/simple;
	bh=+o3VDSV4MaACveRXXosrSRPO10F1BkoAtm9nXXcmOfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jOV/beuODHowp+dDPxLraNTz6WudPlb0WUXOiTBVUktCS1KrFHasCvcTpbnK4i6RXiQ0z1xxDAOX/FYRZqW79GVisRIJtQJ3AP7a+ViJVYb/LX+4pbEyu9rbTiLMH8MwTtH6EfqVij4m9tjZ0szYOUbbXbT+/+A82ecUjbgyJAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WKFozdN8; arc=fail smtp.client-ip=40.107.20.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WKFozdN8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWQdLoeB0JV5FiK77X+JP5n7atsmC9xJL5V4z5wu8R31zLSci8zaPd40/UGOl9bgIQHHjf7mvdj+e/mtSdkwU/TUfUANgAFtIgVb9cPM9mrWHQPnX4MfN0fKa5On0HE07Jg4pAlzUF3xXoLOtTykvErEfgE8JCvVml6axulmkntNVDku4eiMYbDJuQ+CPz5KxF3pu1Rj346DJjQY225fufby9j2CPuu0hlgWkU9sgCeA8OaNFDFnEEfxYWQR1SR+xMIEpg2xtDiuudCKsHhk5T/4QvtLBDCho8b87tU5IYcsPdwB/4pJT6tsZ43IKwot4JZCOpJ47ttHUArj3LOIfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Dj414ttRumnjAQUaQwV0QHktpoVNPUtabinYhREnog=;
 b=iDUrbtyLVJUAa5+UFj4uV/7SS65MD0Nxv5ciY4KAK6+t4MIItGbTknbGgenaRpRiT3m8zod7H1heYsn8lhSC02zr56tgB03wwUtm8SE5TWQojbAMu351a3ryq4RFTdO98zVVcyWD1jVSzXEr+r4oFmMX0M373MB5atlzipwFPXNoNbl+rH5p5V4wKq8i4Ufihp2lmFTZ5kxmID4HCMoC0u2IwEM02rZM24xEvYr5O7mSAt96wkRjGX23vwiO0PpRAkMg6iceICyUOdRzbtUKE5PTrB7OHtq7Uqy5IpnRcb6z877XR2jZidiOTgwtQrXaqHxKA0wa8nOo9+SnVtpMPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Dj414ttRumnjAQUaQwV0QHktpoVNPUtabinYhREnog=;
 b=WKFozdN8uDNsppVocO4OVJuACLvXgQYyhQ1cwINVgRXj2INR5PC0g4WgNqUHhQ930ytSDL2uGnuhrGLdGbMZVboLqYNMTZP1OLC+C+R+vzckLREomYo+1ytURDo8VyyrCrkQmJMfsNjz0HDWlWk4h5nrYQplerTsG28HTTkUs4D9rrGMQwARURg39ovb2jSW/9WmvNboIiVnKfippCTfuY2SWAQhni6HXINgQ7yAMXlP/cGFVn52o0EvV5cWJDCf6fvhMFGZpuNY3gLOkYC5qgPFRuSmlu+QLJWQFLGkBoFsNTXZq3hzpB7IjH6xwnGhbGrODfWPPXYf0+tTaIllfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA2PR04MB10186.eurprd04.prod.outlook.com (2603:10a6:102:404::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 18:38:34 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8069.024; Wed, 23 Oct 2024
 18:38:34 +0000
Date: Wed, 23 Oct 2024 14:38:24 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] ASoC: SOF: imx: add driver for imx95
Message-ID: <ZxlCoOxpf47F+YGF@lizhi-Precision-Tower-5810>
References: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
 <20241023162114.3354-4-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023162114.3354-4-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: BYAPR11CA0052.namprd11.prod.outlook.com
 (2603:10b6:a03:80::29) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA2PR04MB10186:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a694cdb-b4da-447f-d05f-08dcf391e654
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hj7kt44gS7S9ygWlv9aGtyiwGX0gTYyVSmZbyJ5FJ7w7eIy1HyV4Z/AOgJw9?=
 =?us-ascii?Q?kdW1bSzJCCjpQwFtQjTvRhwwBj2Ahxzhm5RcS3qEdU5B5+DCgrUSBulyacrH?=
 =?us-ascii?Q?c1NKGY+lPzHFrv/wT4HhWeWw6YspAPUDcF+A9MuKlkUDgnbkDrkrVoK3tt1V?=
 =?us-ascii?Q?1Ii7X0Hdr2aVFidVgMc277zfeErgP39JgUxrGtRRtSux4SEtx8TWwP2ukZiX?=
 =?us-ascii?Q?sYzhsTT+81CUDayziA+Sk4K6dWjad3rKuswSfzvaSr3CWNo276Nx7zUSr34S?=
 =?us-ascii?Q?Jyj1oDPM4EVWM2SojJ9W1w3TDww+KnFFSAzYvDf6YLUzGBXBNvUZSely1GMD?=
 =?us-ascii?Q?HyLMqnjw4JY1THJ1AYAFiQKrmhxF4pUbhSaU35MDzDkrRlX11pOYzTqwg2II?=
 =?us-ascii?Q?5O0eQ/xuUAuAv7xtn6TOFpnjtPLKNyBZg9Mo8Q1M7eUwqrocGJQav+3/p39o?=
 =?us-ascii?Q?9ZpXukb9qIobrqzO96r8UybBLpZp3yvVIwIJHMgFTcmVHLUsEsMRaqmqzvxo?=
 =?us-ascii?Q?XVMMwUL28bm784Lj9ud0tNybUmEashe6x8vSwoMwIYuq/STOcpyP0wTWfKum?=
 =?us-ascii?Q?lZui1RS/ZPtL+eAfzWYpe0ct32BkeacU128Kv30fe7efdfkgrKv7wGaUaMXh?=
 =?us-ascii?Q?BpWWkfOXSJegYixl6zCdW0ZkPx2Y6k0j8kn6UI2DfUjTEjIRKWb45C/yG/lh?=
 =?us-ascii?Q?wHSOj7hFCCkA63gbvc7hhWSSIxmp3mior56SQXryjE3WxNsgDJ1DN4LWJQ0W?=
 =?us-ascii?Q?8GsO+r1w4tNjX+JRC+7wi/WdUhgAhMqs/V+b+U7sGtJ82YJ3tlS4IJbTxnuF?=
 =?us-ascii?Q?BCKfqtucmsZ8PdQIDJh+S+5vQtDcrz78m3EB0+i4J2FRykd56DzVdATq6O9X?=
 =?us-ascii?Q?BW3uxP4GhyP0V7b0kM49NAbwOZ/UX5GePhQgaEYV8ayJfasyjZ1GFxlKdxq0?=
 =?us-ascii?Q?0BRAoXgLEXkjMzTomhGrSE9xxT+szxH2ydo6MuqLFo3kkWFV5XIb6gcmHSF/?=
 =?us-ascii?Q?Il9guwkv9DiHNRajrP3otXW/akW55RPLqoNNKvm9opdfMEXVZwSAR8pDyJro?=
 =?us-ascii?Q?Hx32osxCphnTamsc6iAr3pb07T9nbR0G7zK5j3iaXo6UQD8NN4kVZnTdOMX3?=
 =?us-ascii?Q?gyWZhq+nrSrM4/ugpiJ2RTH9fTGpWC5J5PH1bKAjmx7G3Gixcs84MheYyrFJ?=
 =?us-ascii?Q?jkttOKSLLpMnYN8GIpGfOzHVlZPRcCNrZrgC5OeLX3HoeLlKfEIKCz6Qg3lg?=
 =?us-ascii?Q?W8jPlO0Wtchgsg6irY5rwNjpEPTkclWdvhgD1BCXN9QzvQqoyEnFAAD8liuO?=
 =?us-ascii?Q?4+POBVa1LYGQMj6nKXiwmge5d2K31iSWCGePIsBmoblmxkgE2LsGc4CosJyN?=
 =?us-ascii?Q?IxHhopg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?683HWISYKdnz4YDnNfP3nUSfrfnX5TCsAKoLOvSxU4pzzv2KCX285C4jClbG?=
 =?us-ascii?Q?kXRbzu1iWkWD79+5Naw2iomk9BDR9RkEd3YoQqQRWTevt/88tn9840IGtn0/?=
 =?us-ascii?Q?WnkCr3ArBE98ryhlEOvcO3ywCcFkYa1ThvolQAc5NAPhqv3ACYctMlhhtEX6?=
 =?us-ascii?Q?X3zyqixWy+giJ0839Ve1NVH+D6g+DzNeyDDrIrshu6yTyMkPLi01Tub4RAgq?=
 =?us-ascii?Q?vTV/A8iLi4biAY+lDHvAj/AuFZW5q6tjdd0M+ftXhFqEIu7g6lbxEn5xbpp1?=
 =?us-ascii?Q?iKNNYtkvRRgaUn7NzVgVi4g7yieGb06j34G8nCk73DZIyAlplxAFrAAngZgn?=
 =?us-ascii?Q?cistqmqjyo73VdQMmyzPHMZs3DjqaMtGwf9SuVL43hIwCOlz8rEq0rPNg/81?=
 =?us-ascii?Q?PoTn10g92w2GO1CtKf1lZVe7nEJZtq6N4q4OSH1Fentd2/+vPg2OHr9totCt?=
 =?us-ascii?Q?X5tT4z59xRfM+ZFzFZN/YvYyJNeS4oeHeAhL2kHQC9n4ZzRZuAVloEcute97?=
 =?us-ascii?Q?nRp7Vy3eyx4cshrvREVxpj6RDJro6QOYHvfiIbh7CLUpVjLsLIoCiFsrrPoe?=
 =?us-ascii?Q?IVv60Ua7/pLg51q5th3/4ZMlPC7kOw3Tkp4y8eGVvfbFSghB05aQY8ZvyY6l?=
 =?us-ascii?Q?M8LQR8lVyrUaM1T9rIcPFiB4C2h3P3uyb8khVz2to9zqHNBLCG1d0X3MdZyZ?=
 =?us-ascii?Q?cd/lokShTV41V7kYmq1ZQkO1nZqlUVMaI5kM+ldK/+LWHbaiDl7AjjsP/W10?=
 =?us-ascii?Q?X3pDoqrdlt5Oo7Y6pTG9UNUgZbYmaDDcp2MGtvlWCvz1W/MZjceRBG2mDtaY?=
 =?us-ascii?Q?s5c7e3pqoRUtEtPA9wTiaB7qmV0HAKz8qbEi+3GFuo9VaWQ4Stb7wVa7rjxd?=
 =?us-ascii?Q?UFIfTW2V0d1CRzE5o8fAt8hf9R0f8d4lPRiuRukm4hXoYs6fipVTNW/8oVwj?=
 =?us-ascii?Q?qH23XHb+LBTH+F7aOGu3zqQg7t9dcKBJUrsHxau4bVjIr9gzccnw3eP5EVs0?=
 =?us-ascii?Q?gPsPj7mKkRGzInkvzJySwESA0V5iPn85zLgHFPDmnlpRDZCJ6jGscaecHn1z?=
 =?us-ascii?Q?7VfYk8l2wu1UxrUM6JOVQzgOlBHQb6IJwavEVCyzFS4n/Eg9+WD+ObHiB8nr?=
 =?us-ascii?Q?xkMe1ei58SotCyBMkFU4T0A/UMZgOsBpBR18AEFJ5q6kqawfVLEQvt1fg3ch?=
 =?us-ascii?Q?mUEJNrDhxp8KZRgc/hv6VkNGq0Tt33XpT1uHuam4UWbc9yUg4aJFvN9BWxDB?=
 =?us-ascii?Q?aCILeCpDZL6PwBxiH04i99Fhj3GERVPzp5BxmRXAstWxIAgUoUFNNUAZ3lLg?=
 =?us-ascii?Q?78gRlSsS1ChrmwycJYB7L8UDrLQQgF6yIl5VwppreEi1cTe40VfWe/jvwKr+?=
 =?us-ascii?Q?dIGIrXXxhCA1Dxg4BWv8JEjzGjXEvDimjY6Gpj0JlwLX4PRBMuN7Jwb4w9fk?=
 =?us-ascii?Q?DqnPpqE9xCN5kpH9hd9E37HXpz2J9WqkcjxBoY6uG+fgQlTtMVNdiCzy+v2u?=
 =?us-ascii?Q?8VL76CXaKYTgbcw4wEaMI9xSsVHzX/J2E8Vq9IGjgnudpTvivos5kxlUPH3U?=
 =?us-ascii?Q?xMFlfbqZ47Pw1s8+4Lme96hOaiYaMa68fVcmsbnV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a694cdb-b4da-447f-d05f-08dcf391e654
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 18:38:34.2373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UYSqF8G7GmL8NC6XUQLPcBGCqJdK2IR7povwFy64KtB9HMihwaFvLkGBcayYKVkRX4WSKgTKIiNLVI1F3p3E1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10186

On Wed, Oct 23, 2024 at 12:21:13PM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add SOF driver for imx95.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  sound/soc/sof/imx/Kconfig  |   8 +
>  sound/soc/sof/imx/Makefile |   2 +
>  sound/soc/sof/imx/imx95.c  | 383 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 393 insertions(+)
>  create mode 100644 sound/soc/sof/imx/imx95.c
>
> diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
> index 4751b04d5e6f..51a70a193533 100644
> --- a/sound/soc/sof/imx/Kconfig
> +++ b/sound/soc/sof/imx/Kconfig
> @@ -50,4 +50,12 @@ config SND_SOC_SOF_IMX8ULP
>  	  Say Y if you have such a device.
>  	  If unsure select "N".
>
> +config SND_SOC_SOF_IMX95
> +	tristate "SOF support for i.MX95"
> +	depends on IMX_DSP
> +	help
> +	  This adds support for Sound Open Firmware for NXP i.MX95 platforms.
> +	  Say Y if you have such a device.
> +	  If unsure select "N".
> +
>  endif ## SND_SOC_SOF_IMX_TOPLEVEL
> diff --git a/sound/soc/sof/imx/Makefile b/sound/soc/sof/imx/Makefile
> index be0bf0736dfa..715ac3798668 100644
> --- a/sound/soc/sof/imx/Makefile
> +++ b/sound/soc/sof/imx/Makefile
> @@ -2,10 +2,12 @@
>  snd-sof-imx8-y := imx8.o
>  snd-sof-imx8m-y := imx8m.o
>  snd-sof-imx8ulp-y := imx8ulp.o
> +snd-sof-imx95-y := imx95.o
>
>  snd-sof-imx-common-y := imx-common.o
>
>  obj-$(CONFIG_SND_SOC_SOF_IMX8) += snd-sof-imx8.o
>  obj-$(CONFIG_SND_SOC_SOF_IMX8M) += snd-sof-imx8m.o
>  obj-$(CONFIG_SND_SOC_SOF_IMX8ULP) += snd-sof-imx8ulp.o
> +obj-$(CONFIG_SND_SOC_SOF_IMX95) += snd-sof-imx95.o
>  obj-$(CONFIG_SND_SOC_SOF_IMX_COMMON) += imx-common.o
> diff --git a/sound/soc/sof/imx/imx95.c b/sound/soc/sof/imx/imx95.c
> new file mode 100644
> index 000000000000..3f7ed6a16c42
> --- /dev/null
> +++ b/sound/soc/sof/imx/imx95.c
> @@ -0,0 +1,383 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <sound/sof.h>
> +#include <linux/arm-smccc.h>
> +#include <linux/firmware/imx/dsp.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/clk.h>

sort by alphabet order

> +
> +#include "../sof-of-dev.h"
> +#include "../ops.h"
> +
> +#define IMX_SIP_SRC 0xC2000005
> +#define IMX_SIP_SRC_M_RESET_ADDR_SET 0x03
> +
> +#define IMX95_CPU_VEC_FLAGS_BOOT BIT(29)
> +
> +#define IMX_SIP_LMM 0xC200000F
> +#define IMX_SIP_LMM_BOOT 0x0
> +#define IMX_SIP_LMM_SHUTDOWN 0x1
> +
> +#define IMX95_M7_LM_ID 0x1
> +
> +#define MBOX_DSPBOX_OFFSET 0x1000
> +
> +struct imx95_priv {
> +	struct platform_device *ipc_dev;
> +	struct imx_dsp_ipc *ipc_handle;
> +	resource_size_t bootaddr;
> +};
> +
> +static void imx95_ipc_handle_reply(struct imx_dsp_ipc *ipc)
> +{
> +	unsigned long flags;
> +	struct snd_sof_dev *sdev = imx_dsp_get_data(ipc);
> +
> +	spin_lock_irqsave(&sdev->ipc_lock, flags);
> +	snd_sof_ipc_process_reply(sdev, 0);
> +	spin_unlock_irqrestore(&sdev->ipc_lock, flags);
> +}
> +
> +static void imx95_ipc_handle_request(struct imx_dsp_ipc *ipc)
> +{
> +	snd_sof_ipc_msgs_rx(imx_dsp_get_data(ipc));
> +}
> +
> +static struct imx_dsp_ops ipc_ops = {
> +	.handle_reply = imx95_ipc_handle_reply,
> +	.handle_request = imx95_ipc_handle_request,
> +};
> +
> +static int imx95_disable_enable_core(bool enable)
> +{
> +	struct arm_smccc_res res;
> +
> +	if (enable)
> +		arm_smccc_smc(IMX_SIP_LMM, IMX_SIP_LMM_BOOT, IMX95_M7_LM_ID,
> +			      0, 0, 0, 0, 0, &res);
> +	else
> +		arm_smccc_smc(IMX_SIP_LMM, IMX_SIP_LMM_SHUTDOWN, IMX95_M7_LM_ID,
> +			      0, 0, 0, 0, 0, &res);
> +
> +	return res.a0;
> +}
> +
> +static int imx95_run(struct snd_sof_dev *sdev)
> +{
> +	return imx95_disable_enable_core(true);
> +}
> +
> +static int imx95_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
> +{
> +	struct imx95_priv *priv = sdev->pdata->hw_pdata;
> +
> +	sof_mailbox_write(sdev, sdev->host_box.offset,
> +			  msg->msg_data, msg->msg_size);
> +
> +	imx_dsp_ring_doorbell(priv->ipc_handle, 0);
> +
> +	return 0;
> +}
> +
> +static int imx95_get_mailbox_offset(struct snd_sof_dev *sdev)
> +{
> +	return MBOX_DSPBOX_OFFSET;
> +}
> +
> +static int imx95_get_bar_index(struct snd_sof_dev *sdev, u32 type)
> +{
> +	switch (type) {
> +	case SOF_FW_BLK_TYPE_SRAM:
> +	case SOF_FW_BLK_TYPE_DRAM:
> +		return type;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int imx95_get_window_offset(struct snd_sof_dev *sdev, u32 id)
> +{
> +	/* no offset for window regions - they are already relative
> +	 * to the mailbox memory region described in DT.
> +	 */
> +	return 0;
> +}
> +
> +static int imx95_set_power_state(struct snd_sof_dev *sdev,
> +				 const struct sof_dsp_power_state *target_state)
> +{
> +	sdev->dsp_power_state = *target_state;
> +
> +	return 0;
> +}
> +
> +/* no other resources to power on during (runtime) resume so these functions
> + * don't do any resource management (i.e: clks, PDs, etc...). As for enabling
> + * the M7 LM: this is taken care of by run(), which is called during sof_resume().
> + */
> +static int imx95_runtime_resume(struct snd_sof_dev *sdev)
> +{
> +	const struct sof_dsp_power_state target_state = {
> +		.state = SOF_DSP_PM_D0,
> +	};
> +
> +	return snd_sof_dsp_set_power_state(sdev, &target_state);
> +}
> +
> +static int imx95_resume(struct snd_sof_dev *sdev)
> +{
> +	const struct sof_dsp_power_state target_state = {
> +		.state = SOF_DSP_PM_D0,
> +	};
> +
> +	if (pm_runtime_suspended(sdev->dev)) {
> +		pm_runtime_disable(sdev->dev);
> +		pm_runtime_set_active(sdev->dev);
> +		pm_runtime_mark_last_busy(sdev->dev);
> +		pm_runtime_enable(sdev->dev);
> +		pm_runtime_idle(sdev->dev);
> +	}
> +
> +	return snd_sof_dsp_set_power_state(sdev, &target_state);
> +}
> +
> +static int imx95_runtime_suspend(struct snd_sof_dev *sdev)
> +{
> +	int ret;
> +	const struct sof_dsp_power_state target_state = {
> +		.state = SOF_DSP_PM_D3,
> +	};
> +
> +	ret = imx95_disable_enable_core(false);
> +	if (ret < 0) {
> +		dev_err(sdev->dev, "failed to disable core: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return snd_sof_dsp_set_power_state(sdev, &target_state);
> +}
> +
> +static int imx95_suspend(struct snd_sof_dev *sdev, unsigned int target_state)
> +{
> +	int ret;
> +	const struct sof_dsp_power_state target_power_state = {
> +		.state = target_state,
> +	};
> +
> +	if (!pm_runtime_suspended(sdev->dev)) {
> +		ret = imx95_disable_enable_core(false);
> +		if (ret < 0) {
> +			dev_err(sdev->dev, "failed to suspend: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	return snd_sof_dsp_set_power_state(sdev, &target_power_state);
> +}
> +
> +static struct snd_soc_dai_driver imx95_dai[] = {
> +	{
> +		.name = "sai3",
> +		.playback = {
> +			.channels_min = 1,
> +			.channels_max = 32,
> +		},
> +		.capture = {
> +			.channels_min = 1,
> +			.channels_max = 32,
> +		},
> +	},
> +};
> +
> +static int imx95_probe(struct snd_sof_dev *sdev)
> +{
> +	struct platform_device *pdev;
> +	struct imx95_priv *priv;
> +	struct resource *res;
> +	struct arm_smccc_res smc_ret;
> +	int ret;
> +
> +	pdev = container_of(sdev->dev, struct platform_device, dev);
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return dev_err_probe(&pdev->dev, -ENOMEM, "failed to alloc priv\n");
> +
> +	sdev->pdata->hw_pdata = priv;
> +
> +	/* map DRAM */
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dram");
> +	if (!res)
> +		return dev_err_probe(&pdev->dev, -ENODEV,
> +				     "failed to fetch DRAM region\n");
> +
> +	sdev->bar[SOF_FW_BLK_TYPE_DRAM] = devm_ioremap(&pdev->dev, res->start,
> +						       resource_size(res));
> +	if (IS_ERR(sdev->bar[SOF_FW_BLK_TYPE_DRAM]))
> +		return dev_err_probe(&pdev->dev,
> +				     PTR_ERR(sdev->bar[SOF_FW_BLK_TYPE_DRAM]),
> +				     "failed to map DRAM region\n");
> +
> +	sdev->mmio_bar = SOF_FW_BLK_TYPE_DRAM;
> +	priv->bootaddr = res->start;
> +
> +	/* map mailbox region */
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mailbox");
> +	if (!res)
> +		return dev_err_probe(&pdev->dev, -ENODEV,
> +				     "failed to fetch MAILBOX region\n");
> +
> +	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap_wc(&pdev->dev, res->start,
> +							  resource_size(res));
> +	if (IS_ERR(sdev->bar[SOF_FW_BLK_TYPE_SRAM]))
> +		return dev_err_probe(&pdev->dev,
> +				     PTR_ERR(sdev->bar[SOF_FW_BLK_TYPE_SRAM]),
> +				     "failed to map mailbox region\n");
> +
> +	sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
> +	sdev->dsp_box.offset = MBOX_DSPBOX_OFFSET;
> +
> +	ret = of_reserved_mem_device_init(sdev->dev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to bind DMA region\n");
> +
> +	priv->ipc_dev = platform_device_register_data(&pdev->dev, "imx-dsp",
> +						      PLATFORM_DEVID_NONE,
> +						      pdev, sizeof(*pdev));
> +	if (IS_ERR(priv->ipc_dev))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->ipc_dev),
> +				     "failed to create IPC device\n");
> +
> +	priv->ipc_handle = dev_get_drvdata(&priv->ipc_dev->dev);
> +	if (!priv->ipc_handle) {
> +		ret = -EPROBE_DEFER;
> +		dev_err(&pdev->dev, "failed to fetch ipc handle\n");
> +		goto err_unregister_ipc_dev;
> +	}
> +
> +	priv->ipc_handle->ops = &ipc_ops;
> +	imx_dsp_set_data(priv->ipc_handle, sdev);
> +
> +	/* set core boot reset address */
> +	arm_smccc_smc(IMX_SIP_SRC, IMX_SIP_SRC_M_RESET_ADDR_SET, priv->bootaddr,
> +		      IMX95_CPU_VEC_FLAGS_BOOT, 0, 0, 0, 0, &smc_ret);
> +	if ((int)smc_ret.a0 < 0) {
> +		ret = smc_ret.a0;
> +		dev_err(&pdev->dev, "failed to set boot address: %d", ret);
> +		goto err_unregister_ipc_dev;
> +	}
> +
> +	return 0;
> +
> +err_unregister_ipc_dev:
> +	platform_device_unregister(priv->ipc_dev);
> +
> +	return ret;
> +}
> +
> +static void imx95_remove(struct snd_sof_dev *sdev)
> +{
> +	struct imx95_priv *priv;
> +
> +	priv = sdev->pdata->hw_pdata;
> +
> +	if (imx95_disable_enable_core(false))
> +		dev_err(sdev->dev, "failed to stop core\n");
> +
> +	platform_device_unregister(priv->ipc_dev);
> +}
> +
> +static const struct snd_sof_dsp_ops sof_imx95_ops = {
> +	.probe = imx95_probe,
> +	.remove = imx95_remove,
> +
> +	/* mandatory "DSP" ops */
> +	.run = imx95_run,
> +	.block_read = sof_block_read,
> +	.block_write = sof_block_write,
> +	.send_msg = imx95_send_msg,
> +	.load_firmware = snd_sof_load_firmware_memcpy,
> +	.ipc_msg_data = sof_ipc_msg_data,
> +
> +	.mailbox_read = sof_mailbox_read,
> +	.mailbox_write = sof_mailbox_write,
> +
> +	.get_mailbox_offset = imx95_get_mailbox_offset,
> +	.get_bar_index = imx95_get_bar_index,
> +	.get_window_offset = imx95_get_window_offset,
> +
> +	.pcm_open = sof_stream_pcm_open,
> +	.pcm_close = sof_stream_pcm_close,
> +	.set_stream_data_offset = sof_set_stream_data_offset,
> +
> +	.runtime_suspend = imx95_runtime_suspend,
> +	.runtime_resume = imx95_runtime_resume,
> +
> +	.resume = imx95_resume,
> +	.suspend = imx95_suspend,
> +
> +	.set_power_state = imx95_set_power_state,
> +
> +	.drv = imx95_dai,
> +	.num_drv = ARRAY_SIZE(imx95_dai),
> +
> +	.hw_info = SNDRV_PCM_INFO_MMAP |
> +		   SNDRV_PCM_INFO_MMAP_VALID |
> +		   SNDRV_PCM_INFO_INTERLEAVED |
> +		   SNDRV_PCM_INFO_PAUSE |
> +		   SNDRV_PCM_INFO_BATCH |
> +		   SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
> +};
> +
> +static struct snd_sof_of_mach sof_imx95_machs[] = {
> +	{
> +		.compatible = "fsl,imx95-19x19-evk",
> +		.sof_tplg_filename = "sof-imx95-wm8962.tplg",
> +		.drv_name = "asoc-audio-graph-card2",
> +	},
> +	{
> +	},
> +};
> +
> +static struct sof_dev_desc sof_of_imx95_desc = {
> +	.of_machines = sof_imx95_machs,
> +	.ipc_supported_mask = BIT(SOF_IPC_TYPE_3),
> +	.ipc_default = SOF_IPC_TYPE_3,
> +	.default_fw_path = {
> +		[SOF_IPC_TYPE_3] = "imx/sof",
> +	},
> +	.default_tplg_path = {
> +		[SOF_IPC_TYPE_3] = "imx/sof-tplg",
> +	},
> +	.default_fw_filename = {
> +		[SOF_IPC_TYPE_3] = "sof-imx95.ri",
> +	},
> +	.ops = &sof_imx95_ops,
> +};
> +
> +static const struct of_device_id sof_of_imx95_ids[] = {
> +	{ .compatible = "fsl,imx95-cm7-sof", .data = &sof_of_imx95_desc },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, sof_of_imx95_ids);
> +
> +static struct platform_driver snd_sof_of_imx95_driver = {
> +	.probe = sof_of_probe,
> +	.remove = sof_of_remove,
> +	.driver = {
> +		.name = "sof-audio-of-imx95",
> +		.pm = &sof_of_pm,
> +		.of_match_table = sof_of_imx95_ids,
> +	},
> +};
> +module_platform_driver(snd_sof_of_imx95_driver);
> +
> +MODULE_LICENSE("Dual BSD/GPL");
> +MODULE_DESCRIPTION("SOF support for i.MX95 platforms");
> +MODULE_AUTHOR("Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>");
> --
> 2.34.1
>
