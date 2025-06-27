Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011009.outbound.protection.outlook.com [40.107.130.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17368BEC;
	Fri, 27 Jun 2025 03:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750994481; cv=fail; b=CksZQoZxKRJV0Aflv1s9kszOEG5WcMisP2Cy6a0paM0bUOm2xDkyAf67+knBszICctqzrBRhYWzEARVr8B/p3Gem3GIGvXnWwaW20TGMIoHd7UxLDe8gkXSi7dc8kUhD5zw9F7F6T07R83kV1lAD0sU9NSD30udfWSfGMrWDJyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750994481; c=relaxed/simple;
	bh=s3italhaabX36/SO3s58kreDhnIjLjN1OWWJytEyE1U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DhBWPQ4H2TNjlio4dYxiwdcEJFni/IUUa3k4L+Fk3QjFolVRtxQ7IvyyiB/uw6sZnZLVcV/Mnp9ofZPwMpAGgkhzoCV780EZYXVl77RjVbkLrP6HB4bF+WMsDNQepMPuW1fr3gzlm2qjuCYIextF8J70bUFQARWGKt9duXS7bCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CAQ56P0g; arc=fail smtp.client-ip=40.107.130.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CAQ56P0g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHdxuzCviKZZ3YARx1ay5YWtLoXyAnSIryiG8PU42aUsHR3AL4CtenGVRsLA3Q8VJf1j3iSCfb8QpfANvjVocJb6uHqMxWY18lmgSKHQ0d6r+wsaXfC8xQswOwwti9fFqhay2VkWN/sfsW6dVegPQD0rBElEYjKDxx0ZSDanI7IaHtEpDJACDr1LiR6W/TkF0P2ccLhHBpWv1cO5lTXhuvb7rnC7v3QLUK4omudVu9wY9UW3ZduCk9jHnb2FCfr7XgZifqaIB+8i6pIqeeosodQ3s7VlQM+PSi2CbV7NXcy0lDqYRnnr9i/CgJvAihY/CDujPtGhQqOckF6MN6R1yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9dHuDWy5AOogMBkhR6nQwR1RdmM+Y6mLe9fJhbnjMY=;
 b=Hsi8LDyEDWE3RASVRwxlEeImTs4MZPKSz3IbdcN6zjgcPSqZPQ4oMpzbh+FvCyZxxuJ6eqf3VmI1obHzpERI1GfvRwZvH+ufSVROKZZtjFKLu6Cwoih0YdfoQye/fGOlZ9hS2MgAOKZuXDJhKjhE8jRG3gi9K+HTYvi3Tu4Zs9vfq8ULtNgcodTjcWjVQnkEWqc++j0haBJcqoA3XmJW1VysPKEh1ks/gt3lKlNf1zJopCR2MikvFbR0JFuAA1aDmWQpSbtAQmpG/QGBOWNzrp7gCWcBFt40LZrdR+6H13DvMjYTYzHSi1oopzoyc5WdKr9eQ+uVlKyU90PX5uZXVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9dHuDWy5AOogMBkhR6nQwR1RdmM+Y6mLe9fJhbnjMY=;
 b=CAQ56P0g6J5wbt8gYzDdNKEqdSzq88UZLcfDPsYijmnUQWQZ1uCZ/MZA2C1WFHo6KMC7no0ba+YC6AJSTH9Fww1DU7vkLwJFQaA7/b8E3xzysPeAK+KQ4gkiPKNgp+Y15XXN6sNFpUr5+o+XBT/TUaFT+B3/xDgOV8hz6nu581QrE9qJFlJhXo17DG7EHk/Ga/2G18kqK+OKJtulTOrMuDMIRyHJWFl0Fko3Tc/bTlaoUgNIIiP8WoGgsP4jGqhLcmO6SVpA8y/4vPtJCfj880OS6NCg+6CSPjRRc5HmhQ2uy0Lf/XWeqfJO1lEnR5EctLcX7owMpb7CKZCwOB2qnw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7377.eurprd04.prod.outlook.com (2603:10a6:20b:1de::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Fri, 27 Jun
 2025 03:21:15 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 03:21:15 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Frank Li <frank.li@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan
	<iuliana.prodan@nxp.com>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 5/5] arm64: dts: imx95-19x19-evk: Add CM7 nodes and
 vdev related memory regions
Thread-Topic: [PATCH v3 5/5] arm64: dts: imx95-19x19-evk: Add CM7 nodes and
 vdev related memory regions
Thread-Index: AQHb5XhzuWHcqNd3PkqoVnPQw0xjqLQVzAoAgACNIGA=
Date: Fri, 27 Jun 2025 03:21:15 +0000
Message-ID:
 <PAXPR04MB8459A927FC2DDC583D41D2B88845A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
 <20250625-imx95-rproc-1-v3-5-699031f5926d@nxp.com>
 <aF2W+OG8HhB7W7Ut@lizhi-Precision-Tower-5810>
In-Reply-To: <aF2W+OG8HhB7W7Ut@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM8PR04MB7377:EE_
x-ms-office365-filtering-correlation-id: efee8735-0a68-4be8-27e4-08ddb529acda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?gxMLzceBUQLUgnOADGjPh3sClWZ16byvJg8cYCAkevXxAKMMEM9ejCDdbLE3?=
 =?us-ascii?Q?NIwkKq+YcLtlYseVRPrRnjiap89SY2J7YAtrN5RHSGeBozCkk+apBttgv+Jo?=
 =?us-ascii?Q?1yHvgwQ5szDAu/x1mjKUVK+j3IlM1jO0yAyyBtNnEP04m0lqxELD1lbzRwxW?=
 =?us-ascii?Q?lT6jK0xdpnWKEC/Vhb+6tW6L4QZ4eW/xEm1l1R+0nd0qAv8pa7Nq5nv/rF8h?=
 =?us-ascii?Q?m5c2xvZLbzCGouybGQZAPLhva/8zJ6tcFfroWYxA1Q5fPy8obavYu5Yrqhc0?=
 =?us-ascii?Q?aTddtUAUNNL3qDDeWCuDMxcQpr16RTzrwXaDMHdsk/0lvaDgpIBH1QmUPCnz?=
 =?us-ascii?Q?ITbUI9ZF1/8zETlC27QJju5/7wtbBdqPY7l1Qs4kGoB/Sh2o/rmFIu0xU9tE?=
 =?us-ascii?Q?x2QIs6yPRROEY8obsJI9oLKE1KTyPrjYAxFsgyMAiP4xDIeqDguqmCnuxK7S?=
 =?us-ascii?Q?useRsfMwsZMnL6jE0opELIdu3zm1ueBuLRkjpGwLKMFPxODPgxVo+7WBECfN?=
 =?us-ascii?Q?s3HXm9VhDw/q9x2Ww008LNzXf5PnaGA4IasJX4aMzNSK6BaKB5sPFltwpsTD?=
 =?us-ascii?Q?lCJF/ZLeE33spCeGpVHbX4sWmO+QqmwtBHc+AB9vuiVanLNFai/Z/PqmEOVY?=
 =?us-ascii?Q?8VecetWI3jXiZXU7NoIF9juTlbrIDIIj+ZyZl2CyODjnCLbcjX/Xf7kLyvd/?=
 =?us-ascii?Q?wLIplEgxY6AT6LtqW7DoVmrylo9MQAoPleee6DLzpkcgQSbhmm9En7KszBY2?=
 =?us-ascii?Q?vg4Z3YtQNb/4hamsSxfRUfsTc4b20tN+HFVwWPuW4dOG5cSh5HZbITThf+2e?=
 =?us-ascii?Q?9Ro1dYbWbX4DytrEen0vzoXgtRhNvtUsdf2yYpob6+12buwxYQ4KcAocLLTd?=
 =?us-ascii?Q?xeOGkyJnKI7X1RAqz1x3W06s39kMkLROT3LcXC9ACKOphOa46RIUF5A1V/VP?=
 =?us-ascii?Q?3UTRlIRK0F0I49IhS/RujV41sffD44BxQBf0R8ZnMvwl0f/vRpdsbaLp6hqM?=
 =?us-ascii?Q?vmXKckezkCewL+CD7L12OzeEjVMnGQ6aVlE5DpjaR+blUhWopUtifcHRWCcm?=
 =?us-ascii?Q?+5u8OFWzeOYu/wDYhXUBHmZLaHljmL5EixEHjOTtkhGYmXuFHCJAtapvkr3f?=
 =?us-ascii?Q?Lvr4p4jm/mfV7JR6D+hyGJvSZ9HE/X9HyARAUVEzwuc8zVgsr/eaBhg+FF4W?=
 =?us-ascii?Q?FfH+qbi9KJMgar38x0w6hGaOP4r/z4sunMXaN6YKYpr6+iusXkxdJAiAvWUS?=
 =?us-ascii?Q?nKr5srpb+i1QC/COWdJg5ZBCtxeHj15Tb5ZY/hrA6laetYCkHVKmBGWzDKZF?=
 =?us-ascii?Q?Dq6tctuta6T9NV1UQ8VuiZLgy4791uilu8c5CZtvIC6eT9n4Zneyj570fXqI?=
 =?us-ascii?Q?AxA9GDvfqKDe3OVWcj+eUI008QaJA5eOYZAYjUBQAPk5sTjr9/YCvtclSuSu?=
 =?us-ascii?Q?gjrA8h6NZ9JBEu2Njc3Jh0RraKAe4D+AlUGih+tJdes7h5VxCRUXoZnCa2jC?=
 =?us-ascii?Q?PBOdrgJCxGUtQb0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6k07KMCiNbMFaVBr/ItIBYiAcxaNz0hDz4NYisrRiPII4tCNTU4GkxG24VNN?=
 =?us-ascii?Q?VBFLLuwCoalynNjWlpBVQWkYKW+FPpnEd/7tEBO2pU2YQOE+d3qzotmVsH03?=
 =?us-ascii?Q?ks4egxhvkgDEgjY+BjSH4YedMBCjJCrkmVNz9cNXjdvwhG3hJXYgatvWXjVt?=
 =?us-ascii?Q?6oiVA27c1X1BL6cV5pdH31iFyDLTQZiQdXGo+ssoCGyhXtbklhhJ13QQkBk5?=
 =?us-ascii?Q?14rgW/bgf9WoBi3H/NTGrWTCSY4hs/7HGYELA1EFoUw4uv/TXQKXb7SB8ijB?=
 =?us-ascii?Q?fMs9oYzGkfpAsvj+vVONL0DSCXWdSKHG3grXCzQ8TnMk539jkh3VHDjv4vxM?=
 =?us-ascii?Q?+ZjWqwjQzwjll8ot72V46Y1sMmeSy2yxv67u2b+zp1PwBaH2myE6Fb/muya9?=
 =?us-ascii?Q?xMkJ2aoeK7zEjWYvl20YxIDiXnAhCAR/vpYskBhh3Ioiny5SZ75tB0UClhig?=
 =?us-ascii?Q?VLuP0UkfACiDzzrrr4khCFLnU53EGATctU1iDsRTbIBxDf3flVijHVV1JDu7?=
 =?us-ascii?Q?/+eJ/etS4/VAesnKACXwv8GXut5kH4ekwegrCMdePCNfjvJMuDufuWXvZpwJ?=
 =?us-ascii?Q?n8OP5AwLMwd1d7+LZDvV9FH/DVe67/7JdNegjHzfv4c3ICiVTO7zZwIX65CJ?=
 =?us-ascii?Q?IimW3c2+E/Qm4jiJSS6e2O8Cu3xKgYz9RBZM4qAZwiP7RZqxzdU6zM2ioCbU?=
 =?us-ascii?Q?G35dPeTGD8IAeQ2lzjhwaltvr3BmYxVeG1MAhgac8Cqkzl0jWKvjXEwbQrq4?=
 =?us-ascii?Q?twOvL7ABzu5MdL6x+1rQiM6HsYZyjBLItZvdWNkqKev3rZEGKRky3GA9YWgF?=
 =?us-ascii?Q?+flPRKbpyWqGQUm9gFjgOeB+ovEb1EWZZ4jqiGv4U4vpQj1Ol19vv2x0apcK?=
 =?us-ascii?Q?ENHwNA77OSCBAvBWS/5zVWy6vWzG5PTfm5BxOzFKgc+IQ20fDH+BMol46woW?=
 =?us-ascii?Q?NSPjNOTvQz473bjYDvNUeTVI1AIm5aasua8W3MbipGa5D8ziLZJoyOqUAhft?=
 =?us-ascii?Q?N30HG8+qZLm1KvzUXoGGpghBxuObDpOjHv5PCRftXMYNl+u3y6IsORkWvNx1?=
 =?us-ascii?Q?9Wo6apBvYewXh3sfQqt1lgBrapx5FfU0LJPDBk8eQ+jXRXht4naq7fnJ62Ci?=
 =?us-ascii?Q?pbV1MosBfk9/u49UQSsnOLIVw9U49i6+LgazxVjLNLS8vSNt7m0LlmMBzVDm?=
 =?us-ascii?Q?YrfXgIIrYOkud2zHIDeLXSrSyJNX1ziK0qQyT2WdsAdJB5gbG0nMQybhrD/R?=
 =?us-ascii?Q?lxJP303ob7RKbNAdfin+S+Jvuy9HLPKdJsUdg26GWmZeElgbd9pf5e0oKVon?=
 =?us-ascii?Q?BQFnd8ORytUsLem27MTCqJ5FMyXpcDBcEm+2dow/WCceoeAgussJvoQetteg?=
 =?us-ascii?Q?B4Pnq56cPXtaYII1dcoFwvKjMDZyZplEt7fMmImpV87lFZxvoOXFGPjQatkd?=
 =?us-ascii?Q?pZHWmkDCG5arennh4HmgWi+jFv7ZZPaAsVH6sA3TEAmyDUe+WsltAryYeo8o?=
 =?us-ascii?Q?SUeuXzGODlCCxCyKWzuf+Wy9rJzcVugEqK9sYPxmCjsAqkoYADKdlxfiSrZ3?=
 =?us-ascii?Q?l4pQCh1bFI3toBaqxYM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: efee8735-0a68-4be8-27e4-08ddb529acda
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 03:21:15.4454
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r+FRriF9DfXkFPRP6ogXAv8UbwvcHZ086XF0+BM+bW50S2lniJI06pDie2XWmaLsErsP74ZyUbiIvBOvGuyIzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7377

> Subject: Re: [PATCH v3 5/5] arm64: dts: imx95-19x19-evk: Add CM7
> nodes and vdev related memory regions
>=20
> On Wed, Jun 25, 2025 at 10:23:31AM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Add CM7 nodes, vdev related memory regions for remoteproc.
> > Enable MU7.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 45
> +++++++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> > index
> 6886ea7666550605d6c2aa3d81ff270164e5796f..70f000b1c4032a449
> cbf9ceb746c16c9f3062a61 100644
> > --- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> > @@ -75,6 +75,37 @@ linux_cma: linux,cma {
> >  			linux,cma-default;
> >  			reusable;
> >  		};
> > +
> > +		vdev0vring0: memory@88000000 {
> > +			reg =3D <0 0x88000000 0 0x8000>;
> > +			no-map;
> > +		};
> > +
> > +		vdev0vring1: memory@88008000 {
> > +			reg =3D <0 0x88008000 0 0x8000>;
> > +			no-map;
> > +		};
> > +
> > +		vdev1vring0: memory@88010000 {
> > +			reg =3D <0 0x88010000 0 0x8000>;
> > +			no-map;
> > +		};
> > +
> > +		vdev1vring1: memory@88018000 {
> > +			reg =3D <0 0x88018000 0 0x8000>;
> > +			no-map;
> > +		};
> > +
> > +		rsc_table: memory@88220000 {
> > +			reg =3D <0 0x88220000 0 0x1000>;
> > +			no-map;
> > +		};
> > +
> > +		vdevbuffer: memory@88020000 {
> > +			compatible =3D "shared-dma-pool";
> > +			reg =3D <0 0x88020000 0 0x100000>;
> > +			no-map;
> > +		};
> >  	};
> >
> >  	reg_3p3v: regulator-3p3v {
> > @@ -202,6 +233,20 @@ sound-wm8962 {
> >  				"IN3R", "AMIC",
> >  				"IN1R", "AMIC";
> >  	};
> > +
> > +	remoteproc-cm7 {
> > +		compatible =3D "fsl,imx95-cm7";
> > +		mbox-names =3D "tx", "rx", "rxdb";
> > +		mboxes =3D <&mu7 0 1>,
> > +			 <&mu7 1 1>,
> > +			 <&mu7 3 1>;
> > +		memory-region =3D <&vdevbuffer>, <&vdev0vring0>,
> <&vdev0vring1>,
> > +				<&vdev1vring0>, <&vdev1vring1>,
> <&rsc_table>;
> > +	};
> > +};
> > +
> > +&mu7 {
> > +	status =3D "okay";
> >  };
>=20
> can you keep &mu7 as order, at least it should be after &enetc_port0

Oops! I will fix it. BTW:=20
I will wait for remoteproc maintainers to check patch 1,2,3 to see
whether I need post V4 for the whole patchset.

Thanks,
Peng.

>=20
> Frank
> >
> >  &enetc_port0 {
> >
> > --
> > 2.37.1
> >
