Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010005.outbound.protection.outlook.com [52.101.69.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66F828A701;
	Tue, 28 Oct 2025 16:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761668538; cv=fail; b=qS8D/tAJQDbqoL+lSy3Rys3o736DvdSuJNZoUKvd0lrhzU+aDMDJSW6Py5eiriJ6OlRxleIwyXi4ITfXIYBQljdq08UOMtp8SzGpvMrM1tO0amxgSRTX7hyEPEiICCuVnzyYEMC0AmW1wGKbc1SxEpIVA6WeC55XHNBBXd/QEyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761668538; c=relaxed/simple;
	bh=7qSKTEvQbzEe6Cyq2s3RLGyX7Z3RvMsc8ZQcNPk3vU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=h1ax+QvYiogxoYeyf+QYNxZiRodJBKCzGstFCxGoQEFK63dDxkpTHChPF2CozXj0VDUCZiSonUkEUp0vGxbspKmWK0l2jh6k5XYYbRpigY62vOQ//9vVmRlNQLZmOmkujQoGPxYB1pNhW5b6udBPFR8eEFOlCXg1m2RHJxlvQTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Haci8Xnj; arc=fail smtp.client-ip=52.101.69.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Haci8Xnj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hq9AoLGU3F88Nzp0RaOwmyJeaZjz3hjJGSUO7gpa/jNtFvULf3ensBSPOzSJmyQjo/6mwkJ3U+em3sChKJFLWg5qHS1nxk0m5dN/YnUKN+9tCT8hlgNoueVFjLhNC3ZgHFZRkafq8NV2x0EVA+/DHgYAkXQZXGlifSZaITTs+whJHnjQUi84PKh5jRHmIoxOpeGbwAMTeqdsiv8GDO/6runhRB7OKaAlhlY8r63ht8gy8UhEBpPG0aPn9iaOI6s8PeBUi70TvKHZz/0TV8JFcJOBhl5LnMbsnppgpgAmFjWXqvGP4z8SzJHTZmnAynL6H3D1LfS8r052YNJQvSLiJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfCzmifD2gI6DqXBuuvrTPAoM0UdjpNExZiVyd+TV3E=;
 b=pI5FnD+vl38wxhH1b5GUGeYIXEKzJxUR51r0ZYJ1sbd2sOovqwnRB8DOFeH+lwanmqCjriCuBnboz1yKPiSsdWTL5DptHnTgen1+ITxKbD9bdgbtfzZVVOP2xG7DfuHSynOAtUFwe4kah2lIWFkvvRcBEsS5ySR++NKIerwXaPVgFXNvsZHLlDrkubCjjz3HWxesgslkV9nkCX89Ahfh7qK9BVxIyKJI5hTXDSX42ab6izvjgDB+22Xbw2DA9QfPZrgsiN1MkM0c9b3lVvBUlNlD82jMp+NUqVFiSSym0ylGcBFF8oq/EU3vmHqr2a3X+j/SUadWC1DyCPOSCCyHpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfCzmifD2gI6DqXBuuvrTPAoM0UdjpNExZiVyd+TV3E=;
 b=Haci8XnjNrd3NMXzX+JjC0qU9hyUrHKHIW6y/gwUt4LKrBX82wlFFQXWOOMkF4pkrzuYYDwGdODpoq2DMChN94fNEK+9u/8j8Y+j8ne8K+4ftophYcdVfG4S0fKV4qtP5Dv1u4Y4Rgmiuyd7KOXwezAxf8thrXbG0/4gzk6wCRAqlzWzHp3dmCHTgGUppqphumbAtDBla2fMxCCqPVP4w2CE4VlmYhqb6KMpJ4AaEFc6+HcOZ60y2e/6kOk1knYzgj90ZmenufzwhICyNX20HGt91MYoq660bsD0GWYK1iT+CHTyrji4yfWm/b7ZzM8lBHDoeXpdPfX9bKoYa7cdfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AM0PR04MB7076.eurprd04.prod.outlook.com (2603:10a6:208:19a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 16:22:11 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 16:22:11 +0000
Date: Tue, 28 Oct 2025 12:22:02 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] remoteproc: imx_rproc: Add support for i.MX95
Message-ID: <aQDtqounSfCqPGek@lizhi-Precision-Tower-5810>
References: <20251028-imx95-rproc-2025-10-28-v1-0-ce9e7db9edcb@nxp.com>
 <20251028-imx95-rproc-2025-10-28-v1-4-ce9e7db9edcb@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028-imx95-rproc-2025-10-28-v1-4-ce9e7db9edcb@nxp.com>
X-ClientProxiedBy: BYAPR05CA0106.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::47) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AM0PR04MB7076:EE_
X-MS-Office365-Filtering-Correlation-Id: 3adb4082-0624-4f0e-de88-08de163e25ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TOr6purMs9+fZJVGn0gc4wW0HXdTkLp1ZCpQshpoQ+WDgL2CDf0aJN9DHxp1?=
 =?us-ascii?Q?vhCCLR6B/VcJi5JfGbZcQcb45eJUKkZsFuuz+padqpy8vB1zy2UFNdKRf/tg?=
 =?us-ascii?Q?eUIP62LGo6hxAkdOkqaZBg8hJAtz2W2ybeIRv1Dp0vOJ64E4f37kyfUuM/7T?=
 =?us-ascii?Q?fqVs1I2EfAKE8+3RB5z/qiwphbKPcxI7ZJEJQA9oeCuZbKkaA5ye+I+njYp7?=
 =?us-ascii?Q?qaIMEH2OAL01zGZuy91Etsd9nTdQFjibSUsifsjfqJGIGLuaRmYqUkb4+9Kg?=
 =?us-ascii?Q?D9G45+4E+A1ap7x0ML2Gh5jWuD8F+xK+dG9Ed6Niwf8knPsWBCnmDxjdmCIj?=
 =?us-ascii?Q?x7Fs5zkzabjcMUEt6ln/F5Eml96VLxq3lgGf9SMwB5RV9ctNTqgDwXJO5rev?=
 =?us-ascii?Q?FBTGe6gooOTNLVIR3I5IOGTrVVo0Rza2xoPP0eh/1BvEr5z5nfqqDOC7qJOb?=
 =?us-ascii?Q?czGf0gTHzxqGmFE2RbvoavGI0zjPsXsiYsJtnOV3271aS0gvHZYS9HS/8KUe?=
 =?us-ascii?Q?6LCkAcZ2VqfHOWEyPr+Gr6lLk8L1uByhankqyhmbdUf64a7qLTF0iPMIJX4d?=
 =?us-ascii?Q?HX2CYEQvFjN3K0LnhV0GFiZQP206y+tSQv43+L/XuKXQrQpoDIozMKDC6CVF?=
 =?us-ascii?Q?o7BGvJmdO2SjGU1aoF+6gJ6vec8cIGwMrzzJj8AlWtqPF5Yk4jXAlHbYBQk5?=
 =?us-ascii?Q?8zHib7wPCElpRN0y+j/A9GKOuyNCDquXQSRU0T0/pbc7RDEitUbJ0PmASPfx?=
 =?us-ascii?Q?cdUyhd1/0LZNX01VvxRnoNFKeZk7G34DzAxaK9rsDPzmuC/KRDHAu/Ogg/zk?=
 =?us-ascii?Q?jf8F9WkVIMPz+z9O18UzPX9Cf16HZBJzlbIcsQOM1SnyV14FsS9it+OZSxRm?=
 =?us-ascii?Q?EklmONWOXgU6f4vcNQkkEv/WhL6jdtQwj11ktRTce7+utrk6r2wEibAmHK8w?=
 =?us-ascii?Q?1nTtME4/rZVcgQLO0y2fh1IUTV5CNmynlIlFTH1DIZyLSFxBc7axwEwX4wnR?=
 =?us-ascii?Q?Ry23AUBlu7d6jfIZuUnHDR13BN5yygblrITL2cHh+3ne4SDmJ5F2iBW7p9vM?=
 =?us-ascii?Q?CKcV50b9hBAGoNZV0GjAPNjcxlifaji8w/9pPwSe98aTOL8p29IdrnMD8pgm?=
 =?us-ascii?Q?RHzaqHqk1RwE93MtvJOMz9/vymSfgz5WrHL1je/43CGAiKsRix1zPsgEzs4I?=
 =?us-ascii?Q?z2fWe45rff/z0yd82gM1mebqPO6mTIUrswZaO10jF32npgg7ZCrrauWJ4g15?=
 =?us-ascii?Q?pcxdy9RTCY9/EDIe0hG9ik4NX7UI3kablEJzsSD/ECG3ZlRyrJw1uo6HyeZr?=
 =?us-ascii?Q?Mtfk9LZL6XjhQztTQyInq/d0QtON8wyXkmcjYVvAYdHBuV13YdwsMa7+GwSP?=
 =?us-ascii?Q?CCGB4VQZguJmNB3oXB/OYqme5WjGIo5b3ht2rIJbV9u/T5ohVcCqRPhr1Fzh?=
 =?us-ascii?Q?cm2OCFRK8oRA0btNKTp6CY0CXcxmp84+eDk2eOOGjW5zF8B0uHR4op0AjB4/?=
 =?us-ascii?Q?9OaZUhDmbdsi/L1tV64vFkBOjw6eUvwliueP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RFiWeElQCYNqWyNPRtfQbCPULMtQMcmyY9NomGIErIDe49G17tlqpKo9AQXc?=
 =?us-ascii?Q?KYwCRLNk0T/8qVSAg4YBykgJuZ7/8v/CndPg1JSN0NVq68fIPWP+cRqjTsdE?=
 =?us-ascii?Q?MDdGTFxsh6J0jWLvzIAmQe7NW+d8dzz/Z8zkXHn27hz6aoZLOGq7/Ux+f6kU?=
 =?us-ascii?Q?hnkj+cuTEjWvKOMzzU/MBnjHxwTPUfalLbOyiJTtU1wi4Y0riVA1MlAtE2tB?=
 =?us-ascii?Q?p8utV8bbx4a8OLl3G5iRZmVnZpM/A7Kw7267o1kmLzL/DCzxfmYRHMh8aXhe?=
 =?us-ascii?Q?besWQW9g5NSUMv5rcIgghIlbTDNW2hV4SA693Qd/W8Li2NqTr5YIKHxMxHs7?=
 =?us-ascii?Q?6sNnoQHs9og+k6QLRwkLGroT2DUmw/kVKv71dbW4O2hg2atltKJszTh4XreF?=
 =?us-ascii?Q?EZFgQA7HOEDCnpdkAODO2ig/qlTAVTB4dv4+4xat89EbBLAo87AL3vWhDnOm?=
 =?us-ascii?Q?XW8rBVuYzI//+J0QpBBj5NpKMNRCg1jW3dpZHNgtC/x8RN30RnZwwc23Q81T?=
 =?us-ascii?Q?okxSWv/odjmfNPp7fw25nbUJ5W3ydWYIAPkeDLSrfMJ4lwLkx4MvWVtEND3H?=
 =?us-ascii?Q?9KoAvIEwNvVLDuS09P8pT3UXJTUm6leVZ64f27PYbj770piMhh+gNZKcsCLK?=
 =?us-ascii?Q?xaP/+U39NTyFC+qh+Ys0zk5XdH29Rt00JnTeK0GbQ/rIfZik5BuOwHDdmf/q?=
 =?us-ascii?Q?TvLmzx+8DbvSY1qqVY5nG5Ct9RlqgLgiYqDbyfwtAtmKWWHqeOXBfCBhiMFf?=
 =?us-ascii?Q?6/6dW+5QOMpHZyBTIiG7KwNSFfdjHb1gQZQXQr6aV2+jjAc4vdVUvvtLb8j5?=
 =?us-ascii?Q?fJEqF+VyKHyxhrwb7Y3GkI+Qv9MnBKo701npWVwj/PocYa0wxyqRjdUsCs+E?=
 =?us-ascii?Q?/oITkbIoIXTCETVxofdR5LxebmkPSzRoegCJJ+OuhQsGV4ZxVG1A4jevAZLa?=
 =?us-ascii?Q?2+R+p9vjg77YGu8f1ktu9ZoxO8ic0ZN/FWWdnmr+WJIj/y/VungZ91lCsfG4?=
 =?us-ascii?Q?DU1317V9IBG29g2VgIFE83caVi+3ewooHalkbdlgmZ1FtqGmdOVNV/KZf1Ln?=
 =?us-ascii?Q?2mqYc79PBFsDGFXZp96/tgZRWjkMx1nSOYnA6cgXbEe4jYlyy6cdVZXC0699?=
 =?us-ascii?Q?4N1A/yy66HDSFavQD9DbJ35bBpuyI9CczIoFMkjBVFEygUp7I4fWejlySXdj?=
 =?us-ascii?Q?NdUaDIXEQFhKOGp9J6tL3eyVdFR+orn10EYyMECoO5qfXmuvP61lETSjisrB?=
 =?us-ascii?Q?1NnS/kVHH/gPnGNQnv/4LC67BGqXc0VVmyHVFn9RWqI+Te8hQaYEgk/gzsq/?=
 =?us-ascii?Q?ifiu03s0ZUV57TlnrEElJ7xQn4iKSGZNA0/AakbaEn3G6CUsYHETaGlzm4kE?=
 =?us-ascii?Q?TGoftP4YRJQvTbTpkuCUEL7MkFWFankbTfVlMRUNgQy7VAiMLN7YV5MX7FVW?=
 =?us-ascii?Q?kmPlej1UlscunaGbrm1HQEcaP9e3JmtYYlAGiuA5xpiGYUhR7yDedD40zJRz?=
 =?us-ascii?Q?GeD3iIXJJjuqCIL4eAMSKmp4eP07PYPPfp8J4NqUVuQVYUcL4cesMH/djPw/?=
 =?us-ascii?Q?efI3V0R2MFTRoTWgcvgJu5Gsk2xOve6j1P6rARjW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3adb4082-0624-4f0e-de88-08de163e25ef
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 16:22:11.4713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bvU7/oOFisqgpWJb8AHY2WyU0c0xbc3OlbzXImGR9x0lmmUXL0ftskWOsQwDzj/74n43yMyQU0u/2PfW15HYaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7076

On Tue, Oct 28, 2025 at 04:18:04PM +0800, Peng Fan wrote:
> Add imx_rproc_cfg_imx95_m7 and address(TCM and DDR) mapping.
> Add i.MX95 of_device_id entry.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 8ecf95c81b598bbe38b721808878e5427339a08e..45eeb5d61d43c9ce72e840611e93af067a4296e7 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -74,6 +74,10 @@
>
>  #define IMX_SC_IRQ_GROUP_REBOOTED	5
>
> +/* Must align with System Manager Firmware */
> +#define IMX95_M7_CPUID			1
> +#define IMX95_M7_LMID			1
> +

Only use once, you can put 1 to imx_rproc_cfg_imx95_m7

     /* Must align with System Manager Firmware */
     .cpuid          = 1,
     .lmid           = 1,

Frank
>  /**
>   * struct imx_rproc_mem - slim internal memory structure
>   * @cpu_addr: MPU virtual address of the memory region
> @@ -131,6 +135,18 @@ struct imx_rproc {
>  	u32				flags;
>  };
>
> +static const struct imx_rproc_att imx_rproc_att_imx95_m7[] = {
> +	/* dev addr , sys addr  , size	    , flags */
> +	/* TCM CODE NON-SECURE */
> +	{ 0x00000000, 0x203C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
> +
> +	/* TCM SYS NON-SECURE*/
> +	{ 0x20000000, 0x20400000, 0x00040000, ATT_OWN | ATT_IOMEM },
> +
> +	/* DDR */
> +	{ 0x80000000, 0x80000000, 0x50000000, 0 },
> +};
> +
>  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
>  	/* dev addr , sys addr  , size	    , flags */
>  	/* TCM CODE NON-SECURE */
> @@ -1440,6 +1456,14 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
>  	.flags		= IMX_RPROC_NEED_CLKS,
>  };
>
> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx95_m7 = {
> +	.att		= imx_rproc_att_imx95_m7,
> +	.att_size	= ARRAY_SIZE(imx_rproc_att_imx95_m7),
> +	.ops		= &imx_rproc_ops_sm,
> +	.cpuid		= IMX95_M7_CPUID,
> +	.lmid		= IMX95_M7_LMID,
> +};
> +
>  static const struct of_device_id imx_rproc_of_match[] = {
>  	{ .compatible = "fsl,imx7ulp-cm4", .data = &imx_rproc_cfg_imx7ulp },
>  	{ .compatible = "fsl,imx7d-cm4", .data = &imx_rproc_cfg_imx7d },
> @@ -1454,6 +1478,7 @@ static const struct of_device_id imx_rproc_of_match[] = {
>  	{ .compatible = "fsl,imx8qm-cm4", .data = &imx_rproc_cfg_imx8qm },
>  	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
>  	{ .compatible = "fsl,imx93-cm33", .data = &imx_rproc_cfg_imx93 },
> +	{ .compatible = "fsl,imx95-cm7", .data = &imx_rproc_cfg_imx95_m7 },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
>
> --
> 2.37.1
>
