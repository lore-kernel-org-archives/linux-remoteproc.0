Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011052.outbound.protection.outlook.com [52.101.70.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5A0DDB1;
	Fri, 19 Jul 2024 05:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721368290; cv=fail; b=a4T8apTc3MxWRxpWbrII/C8N51XWaMg8tX8RpIjBZAadPq7C9j/xqXi9nRuFykb2l/N/46gdkHcW6nPIzRTBokXUzLL1dmMCGpQK42OfwOQ622HewGlnHCeX5HS6WpBc9E6wU06Nodu4nUt/uw8xoeBLymOj1y0aMf+9ZDaaBUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721368290; c=relaxed/simple;
	bh=BRz3eZhKCcBW8RK2665C9X3txkl9OwMS853Q2NjhU80=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HA5YtpMnymIM9johBYFyUlk9YOQaMc5Mqasfsoayr61QCk4JYwQHEG5zlNcb0rFBdS1voNRDd6SWiXbn3EivphT2Gu++VcKfom/Fqsv6JBSdDlIvYN1OMHVi3JIzJjXz6jzXEsSKdJpbyAsXacetWqROOF/FLNyV3jw0fvFHTXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=jFSKee/a; arc=fail smtp.client-ip=52.101.70.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="jFSKee/a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUenw24m+aFOq1DXKJqhyZ28rvwW+0DgHO04mZZK5T3zsZdnhUiSyGvHxumzxLwvOGYOl9pkOf66V0nv9q1KNFOEAfMgom4fo+qZnCapsPAsY0fLO9L6LVnSG/7KizoWgVUN1RpFvS08S9XuMTki3jBlOqgFpmOmmlMd5FKPQIRW3yrnqKnX4IEa1UFl2ydtKs5bCW7b0AgXkOsl9viTpVSvlagucOTqF4kzxR97hxxTdnfkWVQLTdmC/1xd7FL7xMY8wom4XVeA9PkKD0R38pmmNEBUWz7AqUttNRQFSabyy134bro+8fFmMNRb5kcKoe+x+PwO6rEFpIw5b8cnlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRz3eZhKCcBW8RK2665C9X3txkl9OwMS853Q2NjhU80=;
 b=zDgeHhfh2Y3W2ucxdleHMG/rlbs/GJI91nuPWvDF/OH0F1tX4yLiQy5CX3YB/vDTxGsnSUv0dAITo147EnVRrTMJWrpwfJxaDIui7bGLiKwlCYUKwkkC7pRvuJSmQhb/HWhAN4UL+wHUT+fcs4hGUXtKC8nhuD28FL+CVvHuOLLglX24eXmrY4G1Sgzg3p57JNHg53SE9A6Dxtqhyy/Bb5GIwatzEwmZHDqYNaJMGUoeQ/JpsS0vaXgmuHpsS1HoB4CDCqi9nhPVIZ6+MSG39rSdQtNoSlpKlKQmKC/rD1Hw+Hcn+QY2MSMpeiPdXadGHbL0Rm7rcJQWZX2pNNtZHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRz3eZhKCcBW8RK2665C9X3txkl9OwMS853Q2NjhU80=;
 b=jFSKee/a8l7UVRBgBUj0BNCu6YFmtULMf4nRC8baUQzjMdlufWgh/8UZTRGBcqvv9po6NvWstvuEc/XWREI90uwqhlH0dr+UGys4cGZ1yy/bQkT0hafocvql7CB0Wk3tA7TFB/kwWdAQB6vi/qV5nOf+BrZRUzPhXYP0mk5nzG8=
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB7013.eurprd04.prod.outlook.com (2603:10a6:20b:116::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 19 Jul
 2024 05:51:24 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Fri, 19 Jul 2024
 05:51:24 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Hongxing Zhu
	<hongxing.zhu@nxp.com>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Jacky Bai <ping.bai@nxp.com>
Subject: RE: [PATCH 5/6] remoteproc: imx_rproc: allow tx_block to be set
Thread-Topic: [PATCH 5/6] remoteproc: imx_rproc: allow tx_block to be set
Thread-Index: AQHa1DUqU4uYdGYqv0SPOpF6giZjy7H5hk6AgAQQceA=
Date: Fri, 19 Jul 2024 05:51:24 +0000
Message-ID:
 <PAXPR04MB8459999EAA5A46E80CE6AFD088AD2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com>
 <20240712-imx_rproc-v1-5-7bcf6732d328@nxp.com> <ZpaV5W94NvuJpvle@p14s>
In-Reply-To: <ZpaV5W94NvuJpvle@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM7PR04MB7013:EE_
x-ms-office365-filtering-correlation-id: 775c4e70-df29-4a6e-d68c-08dca7b6d30f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?rrzp7quPBfq7eW7NF7/sE3ORlEU46GCwkdp8hmd1w6uhhZLKF0uOq9WpD863?=
 =?us-ascii?Q?IRjSwp4oW6Hse43neP0bNl10mHO38nPXDYJc+VI1GoBouqXUD6dkcXNslrAN?=
 =?us-ascii?Q?nO76BR+Wkrgi8ufUpJEnPyFiCE6e2QPDHgJZRNGFixuWv9nZsQ+bWobA2aLV?=
 =?us-ascii?Q?1qFdBdFOQuXOthYeYFrcyKUm1UtzYOX2RcF5aQf5aMYVrmC6Lq5MSxcF6K9/?=
 =?us-ascii?Q?zTPoSZIQqTYwGV7KycB7tHy/c7hkUUIjwdV7Ggou5GY6ietyWgXEfW38p/aX?=
 =?us-ascii?Q?cRXxBPHIGlKfOyTmdveLJeaQAoaoBjEqC8Ggj9RRrRYXl2y/NVAp/pE0ucO6?=
 =?us-ascii?Q?HYKz2JyUMoNWEijtp7nE3PFuCdaixoEQ3kAMzmggLnzNjeICYq5+SikchZ2I?=
 =?us-ascii?Q?Emlw0hhpbj6UiMjb7OemYab4gRTxCfvX0PnczxHjjz2WQARdGfRrRlmXlLKd?=
 =?us-ascii?Q?uJqjx1t+S0gTaVmozEuID3qNFBaGStyy1HILEjc8/ZSvIEilKXW66oS50Tvw?=
 =?us-ascii?Q?UFsj4qR4sDTROy7HGNCAnBKU9Tk1jiCVi/VMgfNNIpme8e4VUKWOf3c7/C4+?=
 =?us-ascii?Q?c3O3GU2x6rZKhMh5wjnG+LjVHahSjRdF/baF7SbosOKN7EgIhzBU7RmNnv+g?=
 =?us-ascii?Q?vf3wpHYHz01+lS8WPl3VQYernoIJnQCI6LfseW58W289AUG+MxSyyCjbA4xG?=
 =?us-ascii?Q?xNlO4iSWTufJToGaEWNQ9h9AnjjsyvHhQf6flQUpv7rHmHB2oFsAdC2TDp5l?=
 =?us-ascii?Q?URB6xAqpX+J12Y7VJ/IUxIW8TXFes0BZIvQ10n/HJuN3DDCtE1MXA3k/vimg?=
 =?us-ascii?Q?9tdpuRVeAkzlBN/RMeOD03p3f1dJB+tiuD6fkcFQ7XVVpqMqyemBgY2s/C6Y?=
 =?us-ascii?Q?1ZFLQGQ2BLVpcaq4jZVzUNYxXgFo5v/og9GaHRQP/Gfgwu641BDdoF3sBbIs?=
 =?us-ascii?Q?LKWx5lIaF8Ddp9kScHFfOQOeayeziOP5wh/hoKMBzkvCqXjAojLXwXuGCF1t?=
 =?us-ascii?Q?2mUzJ1saP8NybFD1vYVhuG8Z1ydalOYkF7DE9y4RGZ/PCA2Gj3nFF/e00W6S?=
 =?us-ascii?Q?fd2lXFQ/bsWgvlcgx3Y1rBQwSN8mayhd7s4x3YP0xdU6X6mHSdKAZkZ9Ez0m?=
 =?us-ascii?Q?0004R6SoS9ZzYasrd8i4RL/ISxHwnUxYSbEnLsRNrj9OGTCwWVbY5EfJlJF5?=
 =?us-ascii?Q?Zi4SW/yN8KZaOG5Lt0JR9gRahMdvlCU2eJfXlWAVSS6/653jg2FOjXyoAGco?=
 =?us-ascii?Q?VAlNEVWuJnkSw05EOdijZwoIYXgMGdQP2etqv/BGqUheFQJ41HNsyKE7Tefj?=
 =?us-ascii?Q?Yr+8Uxcv3gfvW7EIkbksufRQVPPdJWsWpnUx00w97Mt6dI3iSefVeAn8PgRV?=
 =?us-ascii?Q?ZZNUy6UNhpXSq6DYejtm/SxLxFsxmNyBsG5nm+73wQDhVsbg6Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?vhKT81xUQbACuO/DmAN/t4/OJUBpB+xNKw5JMV5tLMFdvBhC/z9+1B7MtELU?=
 =?us-ascii?Q?W/Q5RqyMRtm55VU5h8h1e45tcf7kv0xrDPMnQV0L3lShBZNBS+6Ck42bomJj?=
 =?us-ascii?Q?vTpPmOiLLyR6LMDZyAT5KcNHNJLZ1cdQm05aYXk11NRyN6PzCTSDKyy1/tCg?=
 =?us-ascii?Q?joNezKeiYx14lNxMIrojc2l+Zyn5wXKX3IV609C0nc7zwaOJxcYcwsBBY8DI?=
 =?us-ascii?Q?8NJH6Tg4o1jktROlRwbQkqbNRDG+kIJ3vVA6Mp0iA4qwtXuP4wn1LW6YQJDs?=
 =?us-ascii?Q?PCQt3n9SQFUEtXUdJNADzs3A2WFZTJB+sj6Jmj7HCyd/azAWDDkmZtXAH8M2?=
 =?us-ascii?Q?t4CkxtMQWswVuhXz5LS339fd00T7tP6/q32jX76+lSJqHI+KLspL6B6KK/b7?=
 =?us-ascii?Q?9vL/+iFPFhEERfGbG4Qv3CrHwV0/TK5Pb8KFXQm23H1cxIeCaDtxabdqILF/?=
 =?us-ascii?Q?aedp1QMlbdLGBX8chuAa3o9UHI3CI4DkDH89aWchqmNmZ7CgCaRDn8xciEk/?=
 =?us-ascii?Q?AMLFFe9++Qnk+kYxxUZBMB2irIzIt4PN10hepF+tPImHgV3x2hxrYY6KNlpe?=
 =?us-ascii?Q?mLQemX5EOUrYir5RYK+Q6p2BHWLxswqAcAjHgF86JBCmK8u/g3tBQV6lQWNp?=
 =?us-ascii?Q?4tnBQkHY2E0yod4o1ZTVu6iaS/F29CDUdjsu3xT96LfGUow9vMIxlmeO9P9P?=
 =?us-ascii?Q?yzSQStCMBErHBha1rEE7tfI81AQSHmM+Xg5wOoNNehXBR7GBQ/QSPyO/nGeA?=
 =?us-ascii?Q?J59Ju4hkaAYvLpnB+lbv+zzlfCmU9D42gooIZ7BwTcLoxNk6et1mbpBplc9h?=
 =?us-ascii?Q?k/y/U5DtHeiNV44Q2PzAtsuusFK3zZuefI06kv/uSUJOXcEq34qdWlczpPiu?=
 =?us-ascii?Q?bLhCvnH3gqXdXzhqJ07QY5Hcrb2cM136IqZVpitT9NT/RBkrozBD8Pf0h4eF?=
 =?us-ascii?Q?uXsn9zx0Vxap4LqeJpssillMUkOmIar4LA+Ed0ej1KInWDkh0gYOtTaohAB6?=
 =?us-ascii?Q?o3csClvVwM+XRznZoYeXTeJYuSt+oeieryPbikyOH6Yjbj8mdCQHRcNDtMbM?=
 =?us-ascii?Q?HpTakSeO912ZlgnSebLa5WWfa9InFIKvb1i8BTcS0WnSUgmYOpcY+ZDWb8iR?=
 =?us-ascii?Q?BWtKoghPd7iUF3VjbCM41urvRYdgfo4O55asFKbcUKrCvzC2xFbF2xorGMQo?=
 =?us-ascii?Q?zhkD9Q7/Kcuia3M002JfyCLoX/yiX9JzMF4ECla0mBJUHVwRj6BQZGUGOTaY?=
 =?us-ascii?Q?b3OwKtt83Y5kknMngZZ8V713TwXqsqHgXkrn4SyKh0IMmw4Sx65Y9sUR2aMc?=
 =?us-ascii?Q?4G4HsLe+hF5aV4no0cZT38G7HYd5rrlJxMTm1qJryBzFSeGFW8lU/ncLtcyR?=
 =?us-ascii?Q?v2JlVkB8UGlrSnAHU86Gv6VeQ1p8YqM6T2EZUlMEdxOEL16ZTALv0S6rzYJC?=
 =?us-ascii?Q?xBck9g7bTk7wQd5gWvYh+taejdwwhdwvFuhX5PFwwRCo7sQSzkEMR+KPFCdF?=
 =?us-ascii?Q?34/HdB1Glv2Auo7M7W75IjpCRndFWDzoQi3UG3qa+6TpcVDwn6gGPnQpsHv2?=
 =?us-ascii?Q?YnQdhP0+AVGoPpUs2aA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 775c4e70-df29-4a6e-d68c-08dca7b6d30f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2024 05:51:24.6182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AunBQkosbKPPK9yWDx/Ep8HqcV2MT8fqUGSmI5aeR1dApeKXQly9uEixg89W2myqW7bIK/lyfdwZpCOfu8pb7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7013

> Subject: Re: [PATCH 5/6] remoteproc: imx_rproc: allow tx_block to be
> set
>=20
> On Fri, Jul 12, 2024 at 04:34:58PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Current tx_block is set to true, but there is case that no need to
> > wait response. Linux just needs to send data to remote processor, so
> > let's allow tx_block could be set to false.
>=20
> Ok, maybe - but this patch doesn't use the new functionality, i.e
> nothing changes.
>=20
Will update commit log to add:
"No functional changes"

Thanks,
Peng.


