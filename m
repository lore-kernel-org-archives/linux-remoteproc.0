Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013006.outbound.protection.outlook.com [40.107.162.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0086E2FD7C8;
	Wed, 19 Nov 2025 04:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763526552; cv=fail; b=AZXA7eCIzKpotR15ksBKlSDGbHAhzXAod9vn91BbEDOPV9wiy7MXN0savjUf/IPpCKSj2PTsv4uRbZ5FppT4s5HCzWxlPv5dRs4X5tzm8a3lNCQ3PIOI/bGr3xF57pn6qZayP5CrrVrsxSH/sd6flWMtjcN6SzWC4hbf7YuymKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763526552; c=relaxed/simple;
	bh=0pqUB/MIGC6f7P5M87NOL8aQMQf3e16HQp3m+KaMD7M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rKigKOrLCvqpwekw9lajgVv4ubmkXtH7rH5yVeJc67nog2lC8H+9V/dsxPhhYArAmC+PW2OsZpOb48qPrH1zwIIhwzbc6un4Dg4KRG/NCkjtON7WGaNq4G5vZFpwzrQ0yb23lvvesv/ZQCJ53LghALDHd+wKzDEEcXftQL9pR20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PVcrSPTU; arc=fail smtp.client-ip=40.107.162.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PVcrSPTU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mUWC1Nk6Om/fvcGFMNyv4lC36K2yZj9Hv1rB79KVhHIbGyVJwyURkCqJ1TqaaGaehnB7syTNKW9T0pA2VQMVG+1yKQFxPRbqMNeP/pnBGjwYFMAJBL8jIvKisiinGbTbFUBFMn2q9hyaTbplaTG26MCChGMXU+Yebjp4HAoSJGI05635lMw3JYNsHpXfWmdSETbNfFZc8bDe+yHXp752ZpJcvOvL213WDiK1pQ6jzBmL/b1zwo0J64Td4117dxlX6dpXmStRLsFhDbJJqPOISqhnq40Vv2IZGr21RKsCWDdMEcft0lZvRl8JbXNvO/bx6hqmEuc97IH8hnyoetaLTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1H4oXqIFIz3tGiZRAIbndwiaRvjIAgejtxnNMpGoK8g=;
 b=AD+63WB/IFTicTde4kGN23vIBvyttjXdIoEObqdlmcFiEVFN/hJPlBTJEMkD3VOO1Pcb5q9U2dG9yBCLPGpK7zKWypmtQEPZfssHWhq5aP3F9PlmyGu3opqRGprqYs3vjMze3oEb0xTZ0W0ddtuob7b4shY3C/iwZ6Gr+MDChMXVzX1bJUGl1pvuluRJelVCuuvxa4qyTkT41fC1XHHYm6mPKS/PmoA6RyFAdWbUQBA9E4RYBX/smw5eUlqBm+pn6p62mKwA5Aa8axmVtDxYnWox/ao8j/hywxVxMG8nDjS8AaMQQa0LkZ4eI7u+5uqhLT0INiZm2i25gYuBRjg4hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1H4oXqIFIz3tGiZRAIbndwiaRvjIAgejtxnNMpGoK8g=;
 b=PVcrSPTUQ24FSp93j7g1UIEwnBPCyhb203Xg2vMfdXbbrw79uoyVZ+WYeY0JT2JrwrxbenbHlrl1fbnedLPjdBOgbwdHyZIsBGSNg7adUnJd5yVf9zOFH+DyGrEp9T5sGUD8VQqvYe/mYk0Ew40l7xzZk/W8dz4vTX7k9JlMeQuIxuqWziIH6pfmlAtd6q/kXlHUofXlYxcQpNx0RfYVMLSbCaOd0gRxA8IlV1N/o99fj1uktPhlXf2PTOBTn8IJezv4Ln6GNuiTlMNco7OV7Vyzuif6E3DcUVfGdRbKLw+1Y6nflX81MtoZkW8dTyhptVPy7EUltPsu1HweK/Vu7A==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA6PR04MB11949.eurprd04.prod.outlook.com (2603:10a6:102:514::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 04:29:07 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9320.013; Wed, 19 Nov 2025
 04:29:07 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Frank Li <frank.li@nxp.com>, Daniel Baluta
	<daniel.baluta@nxp.com>, "S.J. Wang" <shengjiu.wang@nxp.com>
Subject: RE: [PATCH v3 11/11] remoteproc: imx_rproc: Remove enum
 imx_rproc_method
Thread-Topic: [PATCH v3 11/11] remoteproc: imx_rproc: Remove enum
 imx_rproc_method
Thread-Index: AQHcUqxpBecd78E8oUqJFzWmtxgmwbT4r2mAgADEETA=
Date: Wed, 19 Nov 2025 04:29:07 +0000
Message-ID:
 <PAXPR04MB845998BE6BF90DAC6FBECC2A88D7A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com>
 <20251111-imx-dsp-2025-11-11-v3-11-d05dcba737fa@nxp.com>
 <aRyiC2m5z9M_vPOc@p14s>
In-Reply-To: <aRyiC2m5z9M_vPOc@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PA6PR04MB11949:EE_
x-ms-office365-filtering-correlation-id: 7a102a01-6498-4b03-8a60-08de27242e0a
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Cn5Qz56889lUhjcW5hyw08bTFSCHBQd5ysy51a2hKe1gcJs5ZoMvzZm40sur?=
 =?us-ascii?Q?PKTEzr/IYn7/oAkavm8mxjFh6zYLWfyFOYYBt7HvMh+Pvpjrx9AWSQoVaXSO?=
 =?us-ascii?Q?qEPT0LM53m3xeqXjxOit62irK24I3nuR6S15zLEe7C1uqZTk4r8JFQFqT38D?=
 =?us-ascii?Q?Or+WFvLeeHvGQYgq0zxnSAXuBiqH5DNw5Kg8Xh6bE6d6ivskJj4N8CKz/naQ?=
 =?us-ascii?Q?6hoUsIoVDqcoPS3sBEh/JaxwBnE2olENA23HMzHXM2wudLcByOsUlSD+a3Ow?=
 =?us-ascii?Q?5TRry0tGQxzbdp1tz4Kpyp3v050yzNT1DTw5gyUJWsSL4qIFOw+lAKoQ8jUg?=
 =?us-ascii?Q?xPe5DK61aFz94knHdnVon0g7aIVFeX/tnvvOXC694pMjU7boPqXykxmtQkpE?=
 =?us-ascii?Q?BpQ5bwr+ZwKh4TbgB+vynOps2GYPiGmxbSVi3GY2ofL2LRT7ubU/TJoVjLY5?=
 =?us-ascii?Q?258tr47e7oym+9/TSmXD2kPosxNV+5yX33K9d1G6rtOnv3I1kNsTsD0Ph/MH?=
 =?us-ascii?Q?IC7T6HBa+eUM0Ld334AddsinGHCQdRmg/knWi80cKyTt7YhRog2YytvgvTGn?=
 =?us-ascii?Q?Qd01IHb+GHfyUaImkJhttUfAjbPP7xWpHNWQDvyEdcG7KBuaV8moqFwydAAl?=
 =?us-ascii?Q?61ZbR+3vxDrwmsIbMI+Xc3nNclL5lDqP7edqR0VnqRIZJTHvbZLMKnphSru1?=
 =?us-ascii?Q?qEBW8MSbBlh2LRJScA3QJmU1QXnvVYac15dvg5trF17pjOXQgTH/s+fCgg60?=
 =?us-ascii?Q?CipNyU+jUszb/CPDBZ6Scl0+F2JnB7PM8e6LvUG1GDc83FQ3MOwNFkFuznOd?=
 =?us-ascii?Q?/clTB5Y9PqGA/CeC2uTOnNLufe/aj9IabI+hoDfpuHQ7MVPY2a8he2hl8CRt?=
 =?us-ascii?Q?5m193AlS8N1ZFb0hhj6fULEVYR0Tae1o+It0qh4n2oY4AJ4m+aYfnYS4GyvC?=
 =?us-ascii?Q?21Ln4FESYya9O8sNsBUL1m/b8jCTsqjlwdjsUa05dN2yBX78AnsH6FU7DhjA?=
 =?us-ascii?Q?CzaHhsJ1zr9AVW3qEOnWdfqUWNPa0Va3WiBhQlP2kMz96qvGr/Gs56kHRfsG?=
 =?us-ascii?Q?ZfBrLWFkeVkEk0TsePp2C0R1zNx3MxcgMvdxgzBOyr8XiXGemMmcoYkh1U+h?=
 =?us-ascii?Q?axSd7dhQy/tSMirTTP0Tuz0uNaeOB1ZYvnlvJOYSm5upscS31dbSoJtkdfnz?=
 =?us-ascii?Q?1DeCV4EMntv77NKo4W2OooFLPimOjBRqD1H21tIkv9joSaBHGgM0wAUJXncF?=
 =?us-ascii?Q?Vx/DTSXUvzNFWceh7luNc5qvIm5R1IJgqid5Llb9IFSdw6ZIf+qU9hmdBoE8?=
 =?us-ascii?Q?lS6IjlPcIlwV0DhllN7ZJXwHmIg23QtzhH4qWIZEix6RN9YIUtNPALAzQSUv?=
 =?us-ascii?Q?qD33q8UA6ofRhXlNiaXlwBCq9VhItS4Zb28IA5hJsTbSpXOBOKRqESccdpKU?=
 =?us-ascii?Q?KNGnec/9BJrM4tbL1t6dDY2ocLUBc2t1ZQKS5GO+eDjoFuiJc0NW5I3bgR5A?=
 =?us-ascii?Q?3CcN0HKja+1MBrP7PbnRmMV7GbXLlmCwdTFL?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aci9+NgL5w8wWjR2OByUlX2OysoXwdgk2E/kyS20CjPSnZUE3AqpLGiPVJ+B?=
 =?us-ascii?Q?4eSgfyEAvVjGiazS9glzJ0xUHGRC6Da7UUUZPRWJsgvmg+aou6Wad4NYyi/9?=
 =?us-ascii?Q?BnxIEzUiU6wm6nqk0j2T/29gMEygamWRGPn1PXYQ1EKfovpfhxIMEHSr4DZ0?=
 =?us-ascii?Q?qjGYTZvApL/Un31bZdqPqWW4Nhp9dq8mewOTyTiDWyy09GRtDOZ1eVIRuUBr?=
 =?us-ascii?Q?AyzUN6ki5kAqLoS4gnf9mavYyVhk9eJAoJitG7OKxDbW+7hZ/lmnn7FR+pyF?=
 =?us-ascii?Q?t29a5T+WDQGAz4vkkY0QK/5YWm2sEpUnVGwSr5dGYyXhNYMZZz8daCwzoszx?=
 =?us-ascii?Q?eQYlT/xdb/NghEncxFl8mvOiQhjFByIHYDV6IJKYVU013imixAUEZlcJVcQ1?=
 =?us-ascii?Q?H1l/zoJP3Ui1tYVjid4PnDC14v642mOJTB7/IHuswQOi7te8Q4aA26Xdc9BU?=
 =?us-ascii?Q?CDiWUwcN2EicFHlPe2tMwCl8uN5d+kh5UDfubdOoLcG7ieNQrxKwi25rPhqh?=
 =?us-ascii?Q?aCNJTJQ2efmNMRPj063X+E8GedF69mMHQd5eVRMT1P94KGGT1V4uEWSMZ33y?=
 =?us-ascii?Q?XPCv6+DswaDvwsTbgmeXghH+ZAK6Zut2ClKuXW7kFtvKFJlRrkvJP0wkeO8a?=
 =?us-ascii?Q?IWTbA68nf7obbqn3Xaxdm/oT95gshfWotrwSD6WZGauQR3jAxhs4RU6OxA9V?=
 =?us-ascii?Q?A/y1D+SFifcfzvjKM6T0j8GsEzY4DouyztBLg5KklulTeZxkPV05wyci4YBX?=
 =?us-ascii?Q?HRI92+OjYDXkYTo43fdA6ak/7oogIFhDgludUDed0qSCuXC1gMJ6dIZfwHbc?=
 =?us-ascii?Q?h1ng9iX3QGL2y9pSm53BT1662rWALV5G0l1vbF9rUjixLswkcZn8IYWc47RD?=
 =?us-ascii?Q?VkgV9l4iarKipD6AAOKHuh0gf0rGeVQFVE4ZNP6yYj7N6CN1nMNSxDHbzfdU?=
 =?us-ascii?Q?QwwicwbCwime/R400Rctoy6Wljb+RQGzG4ft/oAzfe3p0yCNolWhAEGeGWk8?=
 =?us-ascii?Q?5NePhlkIZQGdmWwLSXHCGqKh7XRvreojYO8vQQ3+VvOh+4f2RMKVHVgm4AL9?=
 =?us-ascii?Q?+OPUVBuBLYU07D5qUr+9f8YcoIc5KawoxaqTmcwjCegen+sdFhDiVhJEoV9E?=
 =?us-ascii?Q?S0cJKuOJlOXyADDVg682R/Xm2dXZQaSfoaBAD/v4Ua5Xg3Kkm0TcgjcuexE7?=
 =?us-ascii?Q?CNLcR7fNc0w5H68y7b+tiaTB4CRsJTrLQD4+uWK0FaeP06777wdDyEIYllad?=
 =?us-ascii?Q?Ut5XXsr844JRZGM7WBgBqe4/u5YaOT+kntbAngUfNisDQ4Vb8uw8zBEcIJpS?=
 =?us-ascii?Q?CqVgSI97XfTVfaEywakAjDxSEAQFwWwsU61RI/mSOjeCWDVq7v3XBGZsvioX?=
 =?us-ascii?Q?8YqTMShP3e1ES4XXp2J4PVEJ5woRzlC3i6qtxNUXOv3hZedjkjm1ti3DtrZa?=
 =?us-ascii?Q?gpl1dQnDRBO3jNmDoAORSUwZLnnju7WjdDe1wgD5GS30ZPR9DBz5MYJZ1YIQ?=
 =?us-ascii?Q?DCljeV0vxbK6AA2+CtnRHcupn/8xZsA3qUi26RNEfFYESWYiRm8sJ4yhNfAB?=
 =?us-ascii?Q?hKyIii4lIZdP3AxvQL4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a102a01-6498-4b03-8a60-08de27242e0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 04:29:07.7824
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d9GWp3HPjVyeWGTbvX2l2HdFNw0SJU02krPeASoxiYhRFwCQYP1J3Bvn+/+Vv9rSZT83R65O2faBSLKkt4u9Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11949

Hi Mathieu,

> Subject: Re: [PATCH v3 11/11] remoteproc: imx_rproc: Remove enum
> imx_rproc_method
...
> >  };
>=20
> After all this cleanup, please remove the goto statements in
> imx_dsp_rproc_{start,stop}(), as it was done for
> imx_rproc_{start,stop}().
>=20
> This set can get in the next merge window if you send me another
> revision by tomorrow.

Thank you for the feedback and the opportunity to include this in
the next merge window.

I have sent out v4 of the patch series which includes an additional
patch to remove the goto statements in imx_dsp_rproc_{start,stop}
functions. And v4 also addresses the build warning in patch 1.

Thanks,
Peng.
