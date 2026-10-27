Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793070081;
	b=cc46SncHVXL7zcWPBMesIQCIPKzMR1hT8o2HvoU7AJgLVHZ4X1s/jQlgouyi/SA1g/A+
	 GAPL5Su43OD3zOxBzdSvXLmoYjvv4nLSDIck8DJQbNJEdLhQEec8YmRI+brk0WyBLg2/o
	 t/dDUKTybQk55Yda4ZUfcfuHErYtzaZBoDhldrSMHDD1Oxwzd9n64vUbX+TpYriVDshdb
	 KeptPiLuHPggaZhfyE0b7sV2HqjWgkGP/I1Y7KuuRU1tR7OnzBIMOgtZylXr28p526Esa
	 Hj3w5EFI9lVUDnjK68mmGC/Y5nKWtk+y63AXl6qzueNR9yyPa3jLahz/JVlDCbC60zg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793070081;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=xfsj8J6DRrAk6IdySR8zPkAcIznHjqGA5j2wFtnTo48=;
	b=CEa91EfNqMXSCAGJRfvuEnypYPn+lzjT87QRqJJT+SAm51jk0L02b3WXkhnSKA4KFG/e
	 QSCJYge5KGfr0xNSFcH5jd0YM9f57CD4VayDXEM3sBW4pDwxdsrtF8j9lkueOzAzYOETr
	 /mKoRYi6S3hoYuDj1NegNcPkvYSJS5h3y9DNJNTgRXs0Ak7rvSElAL2eIZwwd6VDu/BLx
	 h3K1t27Z77LE9KMT4K6lT7yW702s/w10CnKpitJNv5AuYMNB14loHsAid4Ei8aKZJL04U
	 Qi3Pyy9fCiE0vTMTgjAZ3OtZUNu891HIr/A0GYL39fXC58DFJ4kmV9PzNLpAotOXB6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="puqCT/IC";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.7
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013007.outbound.protection.outlook.com [52.101.83.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDF7606A31B;
	Tue, 27 Oct 2026 03:01:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FDF7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=puqCT/IC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5GUo+WuRSRxnKk5S8Fi6apEG+F9WPiTlM9X07VsVW/7wIFT8Febr1vENmZzqM5T5c0IWc6VymqFzptpDpiFAo5oAUKtUjf+0Oprr8jBUuVybJUD2BCp757DZ3xUGM343Q83pkJhQmerIANHbqe8U8OZBfRGConJ/P6kcI2RIIaryDRfY+hOjtB8U2kEElebeipzEYl0FPfZmyIBtDHDbURZlpFhH1jlbe77+UZAI4mLdklqPGwA7E2Vu23QT3DHjhMfns/95ATZeG8RqFY7+zJw8oLzzmZ3QTxvqqHtA75HbjE3Fgcozpd+U6aQme5UpVgpFng4V01mH3iu2OXb4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfsj8J6DRrAk6IdySR8zPkAcIznHjqGA5j2wFtnTo48=;
 b=YQ+GJWEvMmCzeQ1AUiLc4cj2V9CkNSMhv3CP60W73+D5LDfeS8TGGkyJufUAyTCL2EoQHpviMxy4iUe3AkuzwrDsGKBPfK9FfYjNKZBOqnjOCkAfsmvoZuqrJ7cATa0vU2KzglyboBzCYYA80stSg3J/a5P1fapOJQ3moqNSVEbJcfOS+VecyPgsEfbkO9IPiToPRk4jgIZuuEBIF/fYzhngXD7PV0xSXj06+0Y7xVsL9+ksNRUjIIZhsqX2jfdbPcDrGwO2Dj076/jrxNYH6x4IsEfb6ooklgyBlGxKG7WcoqTzKgl3xBbQ/o4PllHeydBCwl8TDKK22MzGyAe3gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfsj8J6DRrAk6IdySR8zPkAcIznHjqGA5j2wFtnTo48=;
 b=puqCT/ICpdfcjOQTrRm7RneNr1SDdPeMVPdGbdf+XqXKwpEGDmXHJR/YgWdvauJh9Pf7GGn6/Aq3vq2RUTCgzK8OYstQozgPC/FuepBkRDdBV/sjY4COTEw2bcyMXis3uo0MdoPmFmt8kcL4cCniZ3HAC/yszH8vwmw+W2BFji9r60dxMZ1nBVLbIuROAbQbzpYU/X1vpRxVvlGwmaMY1N6LhChTxpIeXuD8JTZtMnV0gQ0v5P9x5eyifcOoXWjxX2jwc+nA9AC6i/DSGa7LenYynK086CWu8WKc/EekMegAY4KV/6pi8/ri9awsIsz4ltljDS3jEUoPy819RhIG7w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB10193.eurprd04.prod.outlook.com (2603:10a6:150:1a4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 03:01:15 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 03:01:15 +0000
Date: Tue, 27 Oct 2026 10:58:16 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Uwe Kleine-K??nig <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: elf_loader: Create new callback for
 copying segments to remote cpu
Message-ID: <auATSNiJH3LauMNL@nxa18884-linux-1.ap.freescale.net>
References: <cover.1793008847.git.u.kleine-koenig@baylibre.com>
 <4757287789726692e13b141b3b2af5245ae17e30.1793008847.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4757287789726692e13b141b3b2af5245ae17e30.1793008847.git.u.kleine-koenig@baylibre.com>
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB10193:EE_
X-MS-Office365-Filtering-Correlation-Id: 92d428dd-55eb-4f62-1988-08df33d6907d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|19092799006|366016|23010399003|261021121427099003|261026121527099003|4143699003|56012099006|261021130227099003|261022115727099003|261022105027099003|261021133027099003|261022113327099003|261021135927099003|11063799006|261022075727099003|10067099003|261021123027099003|261026135527099003|18002099003|22082099003|261026140227099003|261026130827099003;
X-Microsoft-Antispam-Message-Info:
	KMyx8y3h8E414hrF+IkuZB1YB0xNUcpqa89TN6mVIwAL7YKkpWMEgjJcgzk9RfBMR+pBuhOyMg7kj1qriKNVpsy0R+eCz9+MpNp/I59a1+27lbEyefDJCkZr7ItWSEqO6Nd/sqLBASBABju+mOfd5FEoyTmRcrCp6I7rSvDDwar/uEivC25UpLavNzkli1wDktna53Bhl/fkSYO2wDIH09mJ16nLHCRpasB5m/9X2WRljjCUL0us37qwl6uVdb0BlX4RvI9KUlmHNjY1YAa0nPkNZSjUaPqLPideKFeRgpC4g9nnRPCU07L+dRqRBeIcM9vyTei8dZf2mg7ipQq63Yh9Oi5OAzQ8Q3hwVwBw5NrMpJtxnPq5mP42oh88uzJt4k88LWcP7V/Ul4eg7SJAKu3lBd4wlefjWsgoHiIPwgk17n9mDc6AEA3hr5qbIFsFagcetkIjW/pXsGdR9BzVHukteEYvLLwb1EG5iI8/LXuyDcF+wZ2bqIMd0OR0RdtFKdxkslBvRhZtviJN0k6GZt/1iRDcYdXr4W0dCQliMmJupztCStsxFWU6ZzQfENXalmpNQqIAj3GLOH0lzlJK2SKF7XC9UcKLhlcsvg8lGfy9dfkuo0rT2Q1Lxyiprrtf51dmNfiftoimRlw6C7dAGBjC6OIkCfb+W5rqbA7a2Tw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(19092799006)(366016)(23010399003)(261021121427099003)(261026121527099003)(4143699003)(56012099006)(261021130227099003)(261022115727099003)(261022105027099003)(261021133027099003)(261022113327099003)(261021135927099003)(11063799006)(261022075727099003)(10067099003)(261021123027099003)(261026135527099003)(18002099003)(22082099003)(261026140227099003)(261026130827099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1/06qhCrGPt7aslw9h5DEWRTlwd6AP6fJ8MAST0fWY910OiJN+o3FUvDyHuy?=
 =?us-ascii?Q?9uuteVTcEIWI5tW49Q6BJSDsaDI2vdcaZMcXhNdDPPqb5mZRkrew5gfoiBah?=
 =?us-ascii?Q?X8eoTdjP9iO1ny2uQ+l3TW8o8mNhv556WQBBY6nkb2Ijd9rXY/I/FDMTmadI?=
 =?us-ascii?Q?cbWqmVHf9HujQb6uxuIVTaod/oxmtqRVutdp8GMFjnoi68geTP9NiBjwOpoD?=
 =?us-ascii?Q?oy2/rXHR0sWS1Fn+f/Lvya/tld8sKWj6Wxql48asWUqkT5RpF42k5PDl1NgC?=
 =?us-ascii?Q?S2SH55XbQQQPPpGmyBMosH/xT8vgqUAenDx+dGZS/vwtzP0VdUsfEJcd4Cf9?=
 =?us-ascii?Q?2IAjbuBDpVEdicO3TrajSfUfA4E09IuFzTm3gCEHjpRLt2xzFfnrEMCKgwbj?=
 =?us-ascii?Q?PCxtSaKQlVOzG78sLrCEulQ/LPR0Kl0dQ7uxVKIX7qHOYR/cGTx+ojvfpAfR?=
 =?us-ascii?Q?rCZvoY/qtSjEoCkCUUL42OIlHEYsS3ZVmVQbCsreGuF56gdmhuem5dEzq6i4?=
 =?us-ascii?Q?28tOUxUaEbRkGXFncsn0op48ng0E+FA1AkROmfQJzuNLnm8tZAe5x5f43B0g?=
 =?us-ascii?Q?8oV7llcK4HbAPV48XAIzenyIz/kTzysjB7uM7DMTl0E2sK08OSM9t7aydwUS?=
 =?us-ascii?Q?mvt56ep6Nlnkc2lUJBehdBZoZYwg52TwP4CTbk3E0iQENtUmVmfProNJTRhU?=
 =?us-ascii?Q?Q2WYcDY8zBTL50UGnztObidEeFdeTl9BDcSl0dUgoUFxh5mEuDTTWnKbvq8C?=
 =?us-ascii?Q?hIa1FQnNX5IibwMXAv+qnHx2B7hKhn6BNCrXIA4GEYlPxgIwzDuZG4T3KU1M?=
 =?us-ascii?Q?R9Gl37SsrsvQrZppNTPj3toPKGaFHkHEyrhekXd6af7oct66GlaaJNzN3Wh8?=
 =?us-ascii?Q?A9ZSJ9OkwtWJKz1aYg6QQX6XrDZQNs1XPdRx5l5+uwekdMToY5ZvnA+jt/c5?=
 =?us-ascii?Q?HPY7Xc2kuEqSJHyLIPbwF0TcYx5QeEsw7Cecvdmby48n7e9uZPkqnWkQtulV?=
 =?us-ascii?Q?SvJBD70cNOzi//2eLkLGgri0/wO5tBuBOfglsXwC3TQkNuKiMtRNtd5vRZnN?=
 =?us-ascii?Q?+lZaERVJY2YdwEgDimZ+rFNYanyaYcCTWW2e7PoHxyWvUOGrnzffgMKx39Kr?=
 =?us-ascii?Q?N3/bd6zdZuUm6Hkt7JHtpR73i5CoKg4LmESrMv1aEvXQ+DWQoSM1mci4VgTv?=
 =?us-ascii?Q?xA/CwNWXq1dGT1yZHt9IWwi2ZdYdllThZxVW8oEw0+5Jz2Zjjxs0bBGSOfxf?=
 =?us-ascii?Q?WRL7TJ1pT0EpOI0DRd4DtqJaMCymN5T5ANYFA/6Wvm3LwvAIwijqLlqMtZdJ?=
 =?us-ascii?Q?XNvtPkxdbL1PtTp/BjE5vdp10FKUzijTo8QDa2RC9MMfjfJhy7RyhQTQYU3v?=
 =?us-ascii?Q?7wMgoF2EAXM7puZ/1kCC6nwyZd0L+ZUq/Ou7r0/qkWzvHzDH1ls+AddOEVKE?=
 =?us-ascii?Q?55hF10OpL5Niye864zDO9D5juEmBCmFkjq4XVZgZ6JJVQOEKQULRzlGQu+R/?=
 =?us-ascii?Q?jZzyAro9fZKaDEtbieuvwDYiRjcF1x4aRf0HhGK41l9Ks0KmztywnHnM/8qk?=
 =?us-ascii?Q?ZxjIzFeQjz1DcEOjv4QyI8LgdS7P8OivU9bR+WvycrMdqYHVtaDzGTjaL+De?=
 =?us-ascii?Q?WjmO29OKOypgRrPkEn/YdQNK/RWXU2JCMFyV/SFQICkCUERRW7ad7pefaPDj?=
 =?us-ascii?Q?O59ljaUOSZ1f5iLRrLTzc4jHgiPkXQo1vik8FBRn8Oko+O1w32ce5uShER25?=
 =?us-ascii?Q?CuCTPWyxHmKNo3KOPiJl53yGWzC4qeYQq8MLCbUpwVOrgVp5NJy1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d428dd-55eb-4f62-1988-08df33d6907d
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 03:01:15.2946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: to1KkXdiLX4k9r0LHsgY6aXwUF+qg836MrH3a9/rLnm8wiL9cTK6ABXFVvdlv+KGYiR9G4fJiY5vm0bIShjseU/GIP3CkMpQEZggpQBn5fojNm4kFvwP4N32xURkM1AH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10193

On Mon, Oct 26, 2026 at 11:09:30AM +0100, Uwe Kleine-K??nig wrote:
>Some devices have special needs about how an Elf segment is copied to
>the remote cpu's memory space where the default implementation using
>memcpy_toio/memcpy and memset_io/memset isn't suitable. An affected
>mainline driver is imx-dsp-rproc which includes a near-copy of
>rproc_elf_load_segments() just to handle the IRAM only allowing 32 bit
>accesses. On (not-yet-mainline) ADI SC846 the respective memory isn't
>directly accessible at all and DMA must be used to copy the data.
>
>The new callback can be used to implement just the driver specific
>memcpy + memset to increase code reuse.
>
>The patch only appears big because of indentation changes.
>
>Signed-off-by: Uwe Kleine-K??nig <u.kleine-koenig@baylibre.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
