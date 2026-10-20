Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792477111;
	b=3Z7setdQqKE03dbHUbcdKr7I39pbTPJT9M72wmir8Sffu2GXyOHIyQAiXyZc//c5V3Qn
	 pu6Ved+FRA37nrRmDg3JQpTws9qidqr2ZKH1Xn0QJMf8mugztsLPsZvQFLkIeY/gpJzd0
	 pRtliycDPYyJBrWDFpS95EyrDis07SmqSgRkuCu7KsZ4HOq9Iukj8vDLi360Qzyol/skE
	 jyD06IXGnbnthdBK+EE+6EaQYv2krpKiBJJbB3KakLICsju756qogFv+I0ZgAkXW/iVAl
	 e8xh04/rXKVqiszBKVKMtGMxxD9fsjhFqJOVUkVYampViaYb6lEbxVNRRbPcz4RsTlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477111;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=TBD0lZviLPCDXI12kZ1L6DcovEnr70xYStj31jYkCZs=;
	b=QMftgWXqzf7XIzMcYY+qIMkeo+cS5GJD976pOcxbE3Fm4pyBrwWzIO6hlbZ3U6obUMqx
	 y6TKkmUDbLPQ/3IXd5oWEnY7Km1OWsc1aoiv/M1xqH+yziJxx3RcaZyND/9dSlROB7EoN
	 +decdLH6aPeu3s6BnDzbSsw+mwjHQfYRaUntU78eJsyUGM6/G299UELiMwTmAg8njKqX1
	 lmyKxf0Q5QEZ0XuZL23PMBLuQYH0K6KO9yXpjPDI1ZfAbCw3Ibcd6VXHFLg8BK5a/1NHD
	 Q5FLETgrp/7dpMEEwBd/un9NTks2cMTK+CMCesAXEm+n8OJrsHMfExkU0lMPhBpAp3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Gk4fp6Rr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.16
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013016.outbound.protection.outlook.com [52.101.72.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7143A606A33D;
	Tue, 20 Oct 2026 06:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7143A606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Gk4fp6Rr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ebFYsEeZMyuovt/tE/Tuo2PKoNJgSSxg6FZkzTOyGJ/+uVP6Ko8upQyVzAzJn0tYHzFKgLGE2kWs7hILX0PG7QbXaTARUT/A2v2/pUM+1LTjc+T/Bvs1hEhO2y0ViHC9ZQMndGVU2s31OM+f6Kv8CN85mxou5MNGxquF3S1eMI11LskW7AyF5YXmylIDxSHqLS55/TcaGAllbDIyGZU8LUORM8pwMLHxgHw5WUjJEbSPJW14WIaDWviJjNNUrLH6X/2GRZ7i8hAyZnFvCOcQtZOt53oIHfnbX1cLEdQaoFj3nwaWxZLI6DT7Z41voXQibm7DG43KVrIJBzgodxH5Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBD0lZviLPCDXI12kZ1L6DcovEnr70xYStj31jYkCZs=;
 b=xd2hvHxmPpqZB+Ab9jF1nBkCFU4XzuuwqpX+ABvY+U7rNaVqbHMzzxCgLaopUny+Rb9WxXY+7UHtZvCWWBwzqzchut6ICfO5DffOUj+P7OxG8zhxYMoEisg+x1kacmAfTYN8GnsOfEWKToXf6fLvsp/3MjKn1EbWTpTaNRUxb4fOuDLxjOjLqGnWvmZFR6msW0qRsDseTUfNbW6rCK+vmqdS9xEZp9l1kNgrTpLnofX8TjlJIkn53QRfxALaSUCL72BD9QmxfwOKIcPGAZwCrjlup6ixsXlcCbzCIM/49CFzgq0886ZxuPmeIppv6E/fOsJmhAI89YdehvqwRDXiag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBD0lZviLPCDXI12kZ1L6DcovEnr70xYStj31jYkCZs=;
 b=Gk4fp6RrMPfWYAGx2ccHSJmHiXIlJHA4K/98ozyAO6bi5lByLgp2cqDaQ40LUJ63BQNkBwIATInjsdFvXb6yu1weHGqy6TaKqeocKrL4bYoB0VLnvrvHpyIatHwV9QcMBpjzpRq8/kvjFxMc45aGEYGmXp3oxn3LO6TM94OO5IdfZihB4FgVnuPp2UPYtujY5ck00xAemHO0gYeEDuURMxmyjYCHG+Kg5xKmxBfJxw1KoE3oRH2oCmR4scGqpUX+AxplRoIyXe5/imnx9ETZZ2JBBP84cNUEbDMzMeorOshHCs4Ov3xKJ81dNulOgIvVWmS9NSA536KQ5I29Od87IQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM0PR04MB917899.eurprd04.prod.outlook.com (2603:10a6:20b:7fc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Tue, 20 Oct
 2026 06:18:28 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 06:18:28 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Frank.Li@oss.nxp.com
Cc: Peng Fan <peng.fan@oss.nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v6 3/3] arm64: dts: freescale: add DT overlay for MX95-15x15-FRDM RPMSG usage
Date: Tue, 20 Oct 2026 14:15:41 +0800
Message-ID: <20261020061542.188571-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261019-memory-region-name-v6-3-2e46b2e7d667@nxp.com>
References:
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:4:186::6) To AM8PR04MB7874.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM0PR04MB917899:EE_
X-MS-Office365-Filtering-Correlation-Id: 435c3652-c584-4ddb-13c6-08df2e71f47c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|19092799006|23010399003|56012099006|11063799006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	AQ4XpwASA4au0BexEUEiz/I7zfyAhGX/M6NsTIYdYzg6KxMfhdCFhDkmWliPX46D6xH6i7arBvzk9SClTQa5bTMwVsCUWdzuHV1vvNxqESCFX6lrcSOGC0al/uMrWbuCwH74YM3Se5SkyYVsnqPmQRBbvKsIeVAhvGCXeze2dacNX6rnSmCIb/UitD1qqkRcXBAxuDH+ZqO6oie0VGGXkcUlEaWWxo/72JWCI9VwljYoaJiurVeRx7FwDtfBGpyGHPq29j53MZ1XGX9IKcpX3Zx2ALnCL+fmzcZ49kxmWW6IAkqRwOl057mOIav9v2rTG5lqYP6+hH/p1hLfsNSYyofhrHEGXx/iqMQgCutXkjm3x7eh8oNJsC15oP2qYrvLWolKEPi86x+0KVRDP7UkUBt5Z88GOk9t7qsYNhAq7rivrQ7wQcAsOxHIKsCV6VvRP+6w6LL2dtexk+FkAhCNzAvmtoIv4+mz6SnOONmgJxfekM5Z/fuylhuge2mYeZFljCm5YGd6jGaZpyH+ebdvBdY7lRC7v8eZPsEGtHm1oIGGj+DQ2aIviJCsoEP1xF7zII7npILXT0p4oc+2qJN68jCWdjunIYsNv867TQAVwV6F4uINCgbYW87fZU3t8ERUg1YKZcozlaULDLd1QDwAsiY7w1CAwNk4YLNQ8QtbREs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(19092799006)(23010399003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4fAHymm9rATJJ4yXsQX1yXJSr4h5jyCZ5bHviXJUnLFUZ90tpcwEoDrQMtms?=
 =?us-ascii?Q?k2yPFnMXoVNp5fgmgb+Ve+imCMon3q9v9Ur7Y1m84MI4wSHvArDYvN2c3vhh?=
 =?us-ascii?Q?3yMZ/EnWAk64e9k0GJfu+0gfNWU+wBAbc3C+mKa6cvONdlMOF9SCH5nf+izs?=
 =?us-ascii?Q?dOi8rla+oKR/opStIEMMBofru2/6vY5rqJXUNuhL4Q2rQCJirg4K3HsdxnCo?=
 =?us-ascii?Q?blBH7bwopm6WmY/E1R7+spFPxeTxgLjIIFT6FI89XHr4zFqnJwo4MXeXdsUL?=
 =?us-ascii?Q?13Qs4qcJe1MxlqmlfgyAiBjP0DgJOSPEN3bFxzfCUUHa64tl3ByvDpgqdirz?=
 =?us-ascii?Q?IV/3oTCXCCzScY6IULML1gqkXuTt/pgxv5N5r8+jPtBAnUTUiZwGVmdTEzCH?=
 =?us-ascii?Q?o3zjD5hNvzyggq8bgjWFZFs8StHf5I5Fcneb/XtGsNIzCcReCdBWoETxhOjK?=
 =?us-ascii?Q?Bmkdnyva/zgjub6NtG3XI1LxUP+qHESOrFPgh0r0KBNbQkDqGsfsDmkgIj4b?=
 =?us-ascii?Q?MItUhyGnkUuCJStQk/5jF3J+f5u3Tkhs3ebycmENskiKJ1CXmGDp50J4WAYK?=
 =?us-ascii?Q?HH18rV2I7UI0zgkLVAl9BjEgSCAZxjVRatcM6EcFE9jMGtuw62MqclibgH4d?=
 =?us-ascii?Q?d2AfsSPK5ILs3yOIa2v9j897xWNOUpaE2bPHCSRl4b0s+kQK7lptdxaBEory?=
 =?us-ascii?Q?ukXUHnshPUPiCVY6xFEhUZzDRJ3zPAo1cfsAZQEuy9t5L58B+wtkz83PZXIY?=
 =?us-ascii?Q?UUeSf9EkOGqNV+wRX8TJEFJqgaOgf3fdcOEOQ0gfgQLL8OmAsmL6Q7jSaz//?=
 =?us-ascii?Q?aZtxcMG1acZt+fJX11PQruCWkzLSoyFF1rRUknfoj/T6djFKjMl3llwwdFcH?=
 =?us-ascii?Q?UqYjQ/51bAIf60zDQo9ZhsaesQ1Dh58ao53dY+CuP2d5NoOQ/cbT7NoiTXTc?=
 =?us-ascii?Q?qz4pnKpIVnt1fq407E+6ECNsZGCNIz4nU12D9eF1wsORmzme5evpLFfBKRC+?=
 =?us-ascii?Q?d3jrcK9Viyh4L9HLJ98S1sof7z1BCu+maN4AStXmuptbyONlCWohEV4Ps4TW?=
 =?us-ascii?Q?iDwuZszhzo2/WAVulMB83/5FNHwD1joqZ2Q0I8TZ2FtpEBWaoGad0P6fw1QN?=
 =?us-ascii?Q?n6vk+cLTzL6S6kb4J1358c+pMVfWtOZGoCDKEVIy7ETzOMWpn6JShKMdPIsF?=
 =?us-ascii?Q?JlSfBnlTt0HNlMStr8yUyc3WUybqfub/H+91Ur9a23cOVoaWd2LLEWEltIa+?=
 =?us-ascii?Q?4vMysdq1r2iGSwt10zu6P4dCgJhl0/iq45aIw066+r6giBrFU1BR0F4NtIyt?=
 =?us-ascii?Q?Mp9HXZX4H5YuKuafPpHp+ml+3tDKQgnDb3Sr8ca0UtVEyKo/VaLAAr/kE5sX?=
 =?us-ascii?Q?0CbB6UY8kq0yXjf8HayPOrty9FBmcwvGDCekh5m+7VILVKYB/4XAmLj/cZSM?=
 =?us-ascii?Q?4x4amryvFDw5We4MezTVS7Cd7mfHnU28VnEb1WtFydL4HnywznTPTBejVdla?=
 =?us-ascii?Q?Gj/Whk3nj+O7ZApvzhg6tpdjMAtS+euNrfKkJQu3WkBlpxR/slJ/MiY/EFTG?=
 =?us-ascii?Q?GOjA3naU0dFr60z0wb0lA277lK2M6i5dB60ZDgd4Nfnp/AKH2pcPZXyFG1J0?=
 =?us-ascii?Q?SzEoRlarHPvJmWXNpg475gNMVbKqvpN8Vc70GAjtJf2jv1AGqOfHvQzsBEUK?=
 =?us-ascii?Q?gfcjXLrEXKibC8Rxf2+uRkQRLcWRZJOAQrLuksSH+UyHlLTkNvEZZVTGGMY1?=
 =?us-ascii?Q?HThQS/z+IYAjdm11EcjPIaxpdH6QJLbcTk5ac1oiRgwfO/TfUUOF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 435c3652-c584-4ddb-13c6-08df2e71f47c
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 06:18:27.9635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xuZoFz4wXGAEPZQKDprVzhYRXpkFZy597rVm8uh9ZMUVJWX5efmrML0LJSAcazSZ8p46SDwXXspZTXAZlObM2C2dMQfOURKXUwO4uqbBtdb0Pamr4mIgaCqLFLxaGulz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB917899

On Mon, 19 Oct 2026 14:55:50 -0400 Frank.Li@oss.nxp.com wrote:

> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Move related memory region to overlay files.
> 
> Add RPMSG DT overlay for the MX95-15x15-FRDM board. This overlay is meant
> to be used with the mx95evkrpmsg system manager configuration for
> remoteproc and audio over rpmsg-usecases.
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
