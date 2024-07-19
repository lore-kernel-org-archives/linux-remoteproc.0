Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011013.outbound.protection.outlook.com [52.101.70.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0639A35;
	Fri, 19 Jul 2024 05:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721368010; cv=fail; b=SUXa24IlS/PmXGpjnU5PCXeGm8aVb1PLjLy5lrPwV/Ahxbag7vcNbjP9ysHU9ztw4/4lLw5dhwv+1JpQZwElrHpCx/BHLjkzmbq3QZSkxQZDSC+oNsrev8TUY3Ch2Ls3ZQKGI7bZ4/FENq1USc6ChVMXlxsuVtlK9Fz6zumhVJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721368010; c=relaxed/simple;
	bh=i6RBH/QqZqC76oGpJhjUyharXaSYPkf20bf4KLrPN/s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z42L/gAdgiDoE1NTzE7rfXe3A6MoM1Ia4p5+obU5n9ABcVZw8InvvXYw2Tkrptf9AFOOj/55hzB+QmPjdp0wr/R161C7150zxsZBBTuztqtxKVGjQ1ngHSeT4m9ZwXVwCF9IIhgSIKTwDXsknuDjA5tCLg2KFXDJSIaLTrn8Ymc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=Wg7M+OXN; arc=fail smtp.client-ip=52.101.70.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Wg7M+OXN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4a1qHJzGdT7sCJXhrpMH9vN7043OScJyybEpJ6RHbjPGeDFOYsz9DqgAuD5uiPaIwNjPaQaN3V+ZKTT/wwQAoUHBpQlmL+w1zQwLgLIXxKYbQDWAjVpixSS2Xh5FZpKKz1PkmcAWHkdQX8vG73n4h7TIY/wD4JHbHp8BTpXiJDb+O0vcDlgV3nES/bwlEqEbKPlb4XOLO+s9J8z3pH3vW/XNeXpbLmNj02eXj7cI6BFaqSYy1uMrjItdienhRGsul/1h/L+xHcYyAF0cL/qsKM3KEORblH0Wg/JYARXZ4P5/3fW2AHbnXkIRzqkGXkkVF42AqpYWLjJ7gXh3mzStg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKKkT2Fq75DdePGSTJaSnccw+Eb6mSBmD3aooq2gASI=;
 b=JzoTz3+MWoDWd5TwcCp3c6piq/roRkLBlLrvqI3D8Bcca6GV2slZIwND5681i4L59KwX3M/XaEPYyPDKmyw67H9ihuSMfyaJC6TTqWjqctye96d1c1bxVlk/tc67S0Hqg29mUZo3jI/T6MQOymPu1Av175Ra8gQGPQeP2FBY1zhz+hfc+tqZtoQCgBGW8fpZTRMl/M21+W5qV1YqFNaQn+4cCUb4Kv7ZwnZV0nWTu0vnvCEs0mpdWfbIiOLfS6YLKnxahoE0m6qYqmNJhl/9wGcORRRvjaoRLMHK6ApBF9SA9NQdkSklExLwX6aId7nGwmvBW/9rB7DSZD2MB/cwpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKKkT2Fq75DdePGSTJaSnccw+Eb6mSBmD3aooq2gASI=;
 b=Wg7M+OXNwz2y+HtXj3esLyQ44MUEfsG99xRJnTUulZj2CWx8vVeZf0fiT1x8p9Iv4zPh5hBDYfSYMlyqin2rkeMbpRTGx/KFINHzEJCfl6zUQdiHjVUKP3Sso8a8IAkCxmuNm+g/+ka8JTKSvBdW6zTV6vTdYF4x5h4WAIX4p/E=
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB7013.eurprd04.prod.outlook.com (2603:10a6:20b:116::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 19 Jul
 2024 05:46:43 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Fri, 19 Jul 2024
 05:46:42 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>, "marex@denx.de" <marex@denx.de>, Iuliana Prodan
	<iuliana.prodan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
CC: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Hongxing Zhu
	<hongxing.zhu@nxp.com>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Terry Lv <terry.lv@nxp.com>
Subject: RE: [PATCH 1/6] remoteproc: imx_rproc: correct ddr alias for i.MX8M
Thread-Topic: [PATCH 1/6] remoteproc: imx_rproc: correct ddr alias for i.MX8M
Thread-Index: AQHa1DUhatlJ5eGpakmi5GfGPdrGEbH5ffAAgAQWBVA=
Date: Fri, 19 Jul 2024 05:46:42 +0000
Message-ID:
 <PAXPR04MB8459EE7C78F54CF5ABD5981C88AD2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com>
 <20240712-imx_rproc-v1-1-7bcf6732d328@nxp.com> <ZpaO4FDEYoA0cpae@p14s>
In-Reply-To: <ZpaO4FDEYoA0cpae@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM7PR04MB7013:EE_
x-ms-office365-filtering-correlation-id: 7e5f279f-aa22-419b-ca6f-08dca7b62b1a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?7sb3OR8f6Fp/zoVu2ujWVuGh7jtRw84Ui2ylsbAYh3GTpVPVY7gDQMOLUj3w?=
 =?us-ascii?Q?1Mj3W9GkwSBYXJK0d2NcR57BahTKayEdZTaHJrlojQ2RBjSPJvs3w401Y0WE?=
 =?us-ascii?Q?Jd7fM9aVxIJsJ8b9lp2tARJnCZ4g5XYVswD3fkU/rmvEHx4NbfWOlH2ePDQX?=
 =?us-ascii?Q?wwLgbG/CTQx+/h0RQOkrs+ayP4o2v9cynDcnXy4E6g+6ZIwyANQjp+2PpLdQ?=
 =?us-ascii?Q?f02wVp8dtJ/BI/DUNoVcRzxQY0ywFg637927HeVRGCnHFrKfYxzphI108zL9?=
 =?us-ascii?Q?8zq5fJw8taQ35X0ML6lgM4FBtG2MPO3w8mu9b7L9AQVmmtBLhSyBMr00SAMA?=
 =?us-ascii?Q?z0j9LKWJjsZBxkE1DTOMMv4DP2RMQo6Gg6hIBvHOpoxA9rX0902awcaswiRB?=
 =?us-ascii?Q?I8CWrZH36gTnoswUJo/f/nnP3U5zlTmO3tOmkAZ9PVXKhaApHwIEEIjeQukA?=
 =?us-ascii?Q?vbnmRwPlBe04jSWFQX06GKtSXN8hQKjvyuQcm7flqqOkHAywgbr0fu3kBeeW?=
 =?us-ascii?Q?ZaTvSLik2ZgJp5bUZq4aRjLZ/RJuxk4Vl8MKqNUHZin7+j4w2oy7XHm8g8pg?=
 =?us-ascii?Q?VLs/s0yhEbW+sL1IrvhdfemF2sIeW6vqHTsHarQtXiCuNfb67ZfoCQpLM8el?=
 =?us-ascii?Q?cOAp0b4YxwlKoI3UTp3gIF3qO8sa8+yerLyjENxNwp9KA2z3NVmbf/f5iKPM?=
 =?us-ascii?Q?utfS22rmomraNpvJWxiNgi2dt2EnnIJoGGTwFWhAt+fEecpSVdSKNb+pox/T?=
 =?us-ascii?Q?TTEcycF3++O57u+MHA2wRDmMMEuAk4fARmKx9If8pG9d+RyFzKPghhy22+IJ?=
 =?us-ascii?Q?t3SEcAs3SsdKTsDdMmkHOfS/niS1znX1Q986/O56MEw6dqaSMnbys6HL8yVI?=
 =?us-ascii?Q?5hIaglxkTHDC6jmvG53nbcm0urAAXligGr6uCsbVu7U/cvpQTVku+65F0lDb?=
 =?us-ascii?Q?ptQzExXEX0j/ev1/NVX57EnAm4afdfQFqUaocW9PvLGriE4sPE96cfMpO7jD?=
 =?us-ascii?Q?czvK1qS3aywgQYxDpem3OFXl2JP0LIITGpATUQMXrgnntA2z2/eNcHM10HCr?=
 =?us-ascii?Q?+1vCKCeGpaNEUV24badX8vvc1UkIq7xgwdLMFHYmc66FHH94Z/y5fxuI7Xj0?=
 =?us-ascii?Q?AJYkXQEmN/92MelriKKJInLU/C402RFpLrCjjIJAjS2XNsR/8YnFVtvbJUaN?=
 =?us-ascii?Q?Sb9eH+KmhAH/NGwlr3eWD/k+qUlgKtnz8K1WEQRJpTrm0f4v2JJAs4wMZIzN?=
 =?us-ascii?Q?pPM2x5VjZzadep94BmOCZk1SyFoC1MeRXWgD0DkVZHPnrp+MR056oYlUeGJV?=
 =?us-ascii?Q?kcuoySAEreNyk0PTPXwWTnfl310kP+/hxo8AlMHWCnxF4oP4I2G6DBaLMkFJ?=
 =?us-ascii?Q?63685Usl13Da1u3SHcU2EgYXWlIL0txD5bVJiv4fELNKZXsK0A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?T7e4sGdZFsre7bR3L5p5aokjK+c+xDkN4Idu4evsSfRbzw3xXrFsmE4JtRpX?=
 =?us-ascii?Q?lZLtnzOUK2ItcVxbUp5+mzSOXAD7MfzmfHDinvYbxTDWUNL0oEuNB9VBPHvC?=
 =?us-ascii?Q?IQGN6TP9wqIU4TgvUH0QMUuAcg6OosW7iC75D1dJAVDLIZHbVsB6QwSJfPgh?=
 =?us-ascii?Q?3hOFz2rzfjVn25saB7hjI/k5BFX/kuTdnrr0RZ1JgNmoX5CJR/TaFAbNNNIn?=
 =?us-ascii?Q?I3rYwSuV0RzkL6AyIrVhUNbytGDIvWt3KQCcZJpRHrLldJMew17E15ncLwmg?=
 =?us-ascii?Q?I8EXG4lg0cbT2nDC5vU5tpQQGQ/Twa1ipQ8oIUImBH0f15Kg2vI9tnK4Y2vs?=
 =?us-ascii?Q?kVfQrcL93CvG+31B7v77Isv9FSwyezx6vAX7ZOLu1s9GAiLPjjzLSDncxsdt?=
 =?us-ascii?Q?PtexXH/h+zyQrb9w+MKESolxr/b5lxIwS1nUeRfPgsJeFNbE+tDyU20oI1dU?=
 =?us-ascii?Q?VWs1bO5r5zVHjUWIsQxq7oHJ0n5L7CnYocGp4oOKNeQRx1GbR8j5QesHnmgp?=
 =?us-ascii?Q?uq8gOG/k8/GTfo35d4WUiuvjm1KK8TXj6TE+XwLzOCWrky9tpkOYxaZDSggW?=
 =?us-ascii?Q?wctNH3eBnf5+C0398eildee9NGhr9ovfGg8VeB+rgA/F+X0ABXcthP7HEC2v?=
 =?us-ascii?Q?HExyQKwG3Qn/90IYRNw96HwYPsW+30zwdAYeoLjJXEKpGzuLhXSYnnAwpvPs?=
 =?us-ascii?Q?ZxNu/QEgwZNXuUW/LeOKU0R+VRSp0D8Uv8HwpUWrztgaXmFhrBQ0cxQgg3zf?=
 =?us-ascii?Q?4JZviKDypjoIpVqlEV22hwMYsiBEZ4Foe83d5S9mkAJ48xpBI9YLwLEhOyQ/?=
 =?us-ascii?Q?WJ/BENPfWstYXAu6rbWZReb0UhcpkpUq5CkeLrdeZQ/0Y0LN2RP2t3XGSbVN?=
 =?us-ascii?Q?b3prRuiB1aeTKO2liZkgkv2rvx6fXq+VNc5lzON6KOVyM8IPH0YuOcXMlc2U?=
 =?us-ascii?Q?+ctAMV/94Z4K+fZQ/8BHCoduBH3cR2kWmWbYfeHxRWmV4o17B5TTbDQUTwPe?=
 =?us-ascii?Q?B3Uvok1MC9IkP6a2CYEWPFHuaQ/NBa7tKmvC7h3d0Txh1bKNIW54SQ75quJi?=
 =?us-ascii?Q?KAe8pghnaomZNYv+3Y8stFlSzPS4lfhcdiYRfwi4BTD4M/82RDsOE5Oafo25?=
 =?us-ascii?Q?h6KUDg612xwHazUUMk4xB5yt/hQDH1IXYJlE0hZabFw+YvtuwD2V4hNnqVu+?=
 =?us-ascii?Q?rlzzdNGYHkhKOI2cv9fbDjltvdk30p/O7eJedHGgcattCg2s2auuccmmu/tp?=
 =?us-ascii?Q?lc6CPk7psxoOQUzVfHjwoltn2MVzsHy9Lv9Qua2kDMzRs2H/rn1rl14oHzJf?=
 =?us-ascii?Q?pYDtHDW5lhNbFLYwOzoeXfSqYrmVCCwoPRFcZJcOELjeclxcZ6Ru1hZSc+NS?=
 =?us-ascii?Q?z+koHRaijGDHnPeb6l6LKUsRFGIHIUHCl3v57AFpU6jAjvTPhgiQjPDz/6MY?=
 =?us-ascii?Q?F4gg2ICrEJdrQcd2xkp6d1CLgEIVRiRkKdbn3V/Irqr+j54o2N9wzPaGxRD1?=
 =?us-ascii?Q?HF+ZfrWnJmS8UikfPmQwNsqKEa4afgc3NVcM5StjpCFcQWYmxl/x0iFqvbFv?=
 =?us-ascii?Q?iEoXXhV1OHFTsCFeJAg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5f279f-aa22-419b-ca6f-08dca7b62b1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2024 05:46:42.8369
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H9B8VkSsMnU+CgVop3wh5APC1RdhGYbXDiAWvRe16soucCPtHBI9XTo+bCNBKXWX+sQh2/4/PKCCx3H5GCCMAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7013

> Subject: Re: [PATCH 1/6] remoteproc: imx_rproc: correct ddr alias for
> i.MX8M
>=20
> Good morning,
>=20
> On Fri, Jul 12, 2024 at 04:34:54PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > The DDR Alias address should be 0x40000000 according to RM, so
> correct
> > it.
> >
> > Fixes: 4ab8f9607aad ("remoteproc: imx_rproc: support i.MX8MQ/M")
>=20
> This commit was merged more than 3 years ago...  I don't see how such
> a blatant mistake could have survived this long without causing
> problems or being noticed.

I got this reported quite sometime ago inside NXP. For community
users, not sure people encounter issue or not.

I am trying to upstream downstream patches, so post this out.

> On top of things checkpatch gives me a warning.

The warning could ignored.
There is no public url for reporting this issue.

>=20
> > Reported-by: Terry Lv <terry.lv@nxp.com>
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index
> 144c8e9a642e..3c8b64db8823
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -210,7 +210,7 @@ static const struct imx_rproc_att
> imx_rproc_att_imx8mq[] =3D {
> >  	/* QSPI Code - alias */
> >  	{ 0x08000000, 0x08000000, 0x08000000, 0 },
> >  	/* DDR (Code) - alias */
> > -	{ 0x10000000, 0x80000000, 0x0FFE0000, 0 },
> > +	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
>=20
> Without access to HW or the documentation there is no way for me to
> assess the validity of this patch.  Marek, Iuliana and Daniel - please
> review and test this patch.

I see Iuliana gaves R-b and doc link.

Thanks,
Peng.

>=20
> Thanks,
> Mathieu
>=20
> >  	/* TCML */
> >  	{ 0x1FFE0000, 0x007E0000, 0x00020000, ATT_OWN  |
> ATT_IOMEM},
> >  	/* TCMU */
> >
> > --
> > 2.37.1
> >
