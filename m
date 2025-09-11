Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013019.outbound.protection.outlook.com [52.101.72.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8464A04;
	Thu, 11 Sep 2025 01:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757553244; cv=fail; b=EOYlZXqLGgD20lS/JI8ZNEXpK5HHWVyrl308TsmBztEVreBNXDWBUnB+J2S1eFt/dVYsy/wyMf76mSjr2zuGd71zAL/55cOjXO/t69U5Dnk+4eMc1MG291sy5U88OgRNJCbQ5LqUmj5J8zFrrQdXdqMwCbs28cseAezU+rUC+WY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757553244; c=relaxed/simple;
	bh=EntkFH/x+AdZbYdYwFaJ7bCh7KGIw5WooNKR0EGMLgc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NQzRblnYAC6553dEHnZqn6t8DQV3MuYlWLd1ubT6lkbvUa1b44fKk6DT1AKP/678kPcIWoLGn6A9y3h4CMhLm520Y99AILqP6Iu7wdNLLw0/AIcPhpk6YJhMoF6WAX2v7Z3USV/cyFpLBLVADwjGnmFFBR5bTCV+JVeb0aoRmjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UKYgjzNX; arc=fail smtp.client-ip=52.101.72.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UKYgjzNX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ioXYGbWjSbU/ASEhP7ZjaOdgrYv5fDiOx5JUkKUp2PTiqlUnhKvhYgIqPYXOrMFwOhYc0F4C4r6RmxuPwmrn1qHrMz/qcYkb+EWZipp/PWAKl6qeNEp8AsgLxcslhx9NF1SEdiesCeOOvAjqdcxl7ZEAdWK/jrvHi637pNDugmBBCQ8AFS5XteLVdmuo/Nvj6ISLdWPEIC3S8CiOSt9lc5xiIVMJ/nPcEB7h7R3Fk8zMxwTDZ1ApAqpGp4M4J5ozuELDm4IGDz/xXBeb4Ddr/7bmxX7eaPUIOsBBEoXYbHloG6XDfNim8IA+ulkulVQsBskpVODLuikomymYfaL/Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IC3AQ3BHB4JvNsxLaL6XLxXxCVpUyJC4cNjbYoezy58=;
 b=ZtH4JiStB+ARQTYZm7Sz0SvtEETwpv9lscIOzrSTALS56MJiKJsTsjVRZRc/vJ84AY9g5SBngTySq5cw2E3JZjfu5KfpwXXpaW7G4cihvUNgDFHhdGu4cYi1JuAYNACaoQMz2i+rFAxzRGc4wVcZkQTu3tJ2vVOHTdHYPvksXRLVE2TJfhgIjLK2YCV0PF+v7IyF+myKq8Ropp5/k/eq3nAo87YQZdiyNM2xLeJA44R9WH6/m+bURZQCZ41iFjVq1kD3x6i2ngYPudtPCljf+btncXjswg6Bdn5i+wuXQJnSbc3WQSLn6fzfZWM71U+Px2qogpjMOuZMcm++zo3V3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IC3AQ3BHB4JvNsxLaL6XLxXxCVpUyJC4cNjbYoezy58=;
 b=UKYgjzNXnkiFlXuC0Rt6cDswa8Vn+ncGAW/9r7HxfdE782mkAzOYtxAHMXu1LKv4oJnpS+F/udpcYL6Enw9Mva0M88jHNZLSPK8bqtlMlQPyAjd36s2fE9+cjMhvp6v8xZZAQ0Pml2AJ0EP6nSjUI1IEFVvWirOuO0tiVzztK071juV9f4TOvtb6CU9xMSwahTWTU9AEESn2D6Kf/RrhRA6i3SFVamsfUHgpq+Bjpl2kZKi7zadaWzyyx117UNveMdW7gP9N9E1spPxJ1udBJ77D5g+mVPIkoU0LBMrJlRW+UjyQf8WoiTQRBDTzayVAwUglbDk2YeftoGw+JQ0snA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10825.eurprd04.prod.outlook.com (2603:10a6:150:223::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.33; Thu, 11 Sep
 2025 01:13:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9115.010; Thu, 11 Sep 2025
 01:13:59 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 6/6] remoteproc: imx_rproc: Clean up after ops
 introduction
Thread-Topic: [PATCH v2 6/6] remoteproc: imx_rproc: Clean up after ops
 introduction
Thread-Index: AQHcIiJJkAW1qHO4IkC5V4VkTH7QZbSMkdsAgACbEtA=
Date: Thu, 11 Sep 2025 01:13:59 +0000
Message-ID:
 <PAXPR04MB8459CABA152B6C1C122B35F28809A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>
 <20250910-imx-rproc-cleanup-v2-6-10386685b8a9@nxp.com>
 <aMGe/gwmFqjoFszg@lizhi-Precision-Tower-5810>
In-Reply-To: <aMGe/gwmFqjoFszg@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|GVXPR04MB10825:EE_
x-ms-office365-filtering-correlation-id: 029d6aa2-1ef4-4e3d-d268-08ddf0d07cb5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|19092799006|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?s4588+yyHGFpmHNc/46qCOWxD29RdtMjq9XyW0nfMte/oLvjemgbdRK5RZvS?=
 =?us-ascii?Q?XYLjzbKIq4gTgRcbKd6iykBA31klSn0GTT4LgiHsh+w67hd3UOxzobO3gI13?=
 =?us-ascii?Q?SZiK1cbJH2leT07z9DjrK9E/JNpCadCxWco4KeTQi4Fvv64Yx+34TibT9Mg7?=
 =?us-ascii?Q?z9jsYzQZljLw3zzybDBdEiPXNEvpQ3/CWthZr+L6Yja+H56s56shm7Cm6QWS?=
 =?us-ascii?Q?CobnyDR6UE2Trn3FWfT8yq81IAKuJQzXtNEXwtI4WbPsHQh0wsGoM00vlCpo?=
 =?us-ascii?Q?2WuEXb+UB35CCkusaFcwrJZJ23L26ZJFKMhCGbGx5B2LOfkkC1359i/zmtqh?=
 =?us-ascii?Q?wJkvtxOF+vFc8fW9qEzD5sjxmgOl7MhD6+m6YHArubQw1H1wcUNQ5zsaTYlY?=
 =?us-ascii?Q?j0jz3i/yHy7K5MXB58JLGjxRVv+H16gI6fJYDKqBFwXhVmHZu3WoE3S5OXU0?=
 =?us-ascii?Q?c/QcMkYdOrYfpqQjwd7UoYbRnY7efiGxIXSQjFref/pNIiu8aBzlJO7DYuBF?=
 =?us-ascii?Q?EnrxFkru42p+FQbAj3YuVq11Pw7061EeOVTMhDOroUxsTrNGKuQW5OLGkoap?=
 =?us-ascii?Q?YquMzZSxakCa2UT+JX0UqY1+wUKdz5K9bzGYyUjMGV08R4szcfFDV0kzBZl7?=
 =?us-ascii?Q?bkXXZngl5oayqANqFBLf8A8Y98GS8RYL7jI9lfoPgjVEYLUttF4XU6lbyGgW?=
 =?us-ascii?Q?PWmLWwHtV7WcyBEglxW3gVopqdQhxF4KLtzmPNg9flvayVYoJP5HopTObH6+?=
 =?us-ascii?Q?5DbywX/BII+TPQP3oTTkT/l2RYHs9mdFLP9rsdj/m1dtw/YNSWLKnaSSr80c?=
 =?us-ascii?Q?0cFsfywVWQ4PhW6/NcZQ5bcAv3y1FxGcFYUsvQ9ncEgasM8WPcs8mzI4z9rE?=
 =?us-ascii?Q?Riunj/jIhLNOLgrdVIk/mx25uYyNE+C0rrr6ZYlvBqf3fsZh5bPDqqxd1f5K?=
 =?us-ascii?Q?Lm6VBWo/p33dAWlAJXzIj+a2x8+eWO/z0oDEBFM9nEBz/4J3/JLWsxoxPljF?=
 =?us-ascii?Q?e2HVBqexqWzElymLIGIWyH71AHCic6hcVQNxh00vQPmL+hh5HCmZozQQgkIR?=
 =?us-ascii?Q?zDrwhx74Y9zLA2HUgMTcgMP66rCl0nS8zL5XyYKDUNk6JCKHW+SAJf3E0U9c?=
 =?us-ascii?Q?e9F9M9m3XVUntkGgkFobr9o134Bqb3+1QFkAQXjwiJa6qMuasDYTtj+si16j?=
 =?us-ascii?Q?uG+4ff0uYTt4TpD+NGNmJAuINhXAh19QGyUatt8Jz//1+bIQofLMRU1kL40G?=
 =?us-ascii?Q?JwHkcaJ64E43OyHLHxP6Cbh1zXkyv5992ASiKW2mMskCcViSNz7EqZHNsntU?=
 =?us-ascii?Q?DiZa9I966eQA/ZUHwZfYiIYMQLm0OjXdGcbDSOPFRo+TWvsn+cR5rwcxVEPl?=
 =?us-ascii?Q?J3aRkUV7q1TbaSiF/x5ttyz5RZ0p6SqSuuXMjhjXIrXQHGIG+wJUOShvfbE7?=
 =?us-ascii?Q?mI8eUs0bjZcpMVX8ytNEts7ya7BMVME0lHNgAl1x36OC7aHj86fuPw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?piQzEZOADxWRvvVKjL1jYxs5GurNVyGsWm+pk8mPQ4j+Va0rV1S3QMz+sc8F?=
 =?us-ascii?Q?JwzSYutUUbcxStp6K5JDd9LS1vDIRtJH+m75rDwbTmoOlBN30ZoQtjwuHMC9?=
 =?us-ascii?Q?PFdV0cKBaMXc+kF58RCkZa0OfnUxb8vWP2o/hQSSRtqY83jcAvGpjhfixKL6?=
 =?us-ascii?Q?209BVtbj6vUahB3Fu2M04ORXE/1NgwjFngUmI0tF+Q2DKiHCREeCPepZIA5/?=
 =?us-ascii?Q?od3qopv0QjxWziEZCitiH1H1KHZRfUBLuz+Mg8JfnKcPTwnVJpVSCAl4rcSs?=
 =?us-ascii?Q?G6uBJVVcNaqIB1rAQMFEDv0MlkeQ0gJf8ZBaQItT9KK3hZ+rv2C+ABgsPBsL?=
 =?us-ascii?Q?HSm/POdmpeW2s1xSTFNQXwncOw8ougUgZUalxyaYn2H3QFMDpTdyatWX3xIQ?=
 =?us-ascii?Q?p4GdOOa6K/urPbetbZjDvXV5fAUcLQBHnr42NO9dgyX4aP9GsHOU2rc+xnTJ?=
 =?us-ascii?Q?1wAb/FDpSipgh44uTM7i/PiEFV1sSsp12VRBTYzOIjMXdkWtE3XbMzPC8viX?=
 =?us-ascii?Q?ZRmzUekEcZD9lQxBe13Y1zJjkJw2eixkPCXaHLQwCc4YGZyMteo/nnrzgdDx?=
 =?us-ascii?Q?Ly6jSoJBLBosDkjxhoykOxXPKQVlA709BtkzDAT9HjtNKvqP1IWoyWKdh8n3?=
 =?us-ascii?Q?EmViMA4sNG0NdzmhrkXbMJ0UgP6GaXgmScGEv1SLV/8j+URFntOi/kn8tui9?=
 =?us-ascii?Q?tdTRXzymaTjHZuzT67eBTG/9ZyTEpRSRu7X4q1cjl1VBZFMQOWirOoZhF+/W?=
 =?us-ascii?Q?IRQ2kic7BWVGQ086fkLWQJpDfU0dFNo22jR6OsjpraLkOL30MOSU+C/nsE3G?=
 =?us-ascii?Q?u8yA16QDOGoxt9pEjP8HazeOMUaNZwPj92wS3YSwBRIKT63S9/6RJ48om5ao?=
 =?us-ascii?Q?iHYi8fGNxpHIpBag/HpQ1bE7HzA4Q2bBIIFrZH+xklFLl9qkhwldNT+hbIF9?=
 =?us-ascii?Q?5hfY4mwSmN2IuzJ4LKc+B1vMZ5u5b12CaKBcLoPo50IQYoJlQ5LppgYjDtOK?=
 =?us-ascii?Q?Om9XYlDLh3ExcAT3SMWaCBVe56CgDws+h2c5k+0hZusLcqvFJWUV4pCJicml?=
 =?us-ascii?Q?vCecdhCsYJwUAwvv02EujOmgI8FZxGSBgu5mg/3j8LJSHZPZCb6D0xU6L1M6?=
 =?us-ascii?Q?yvlHFezPSpK4sFaK81lPTLO1eL2kkIemaWJbsXAcv6+SyeAuSAscfDPTHobq?=
 =?us-ascii?Q?Wr8jnT3XfTShOXSEzjCgTmriqMn/FWbY8SGGt4L05mSY51IWrofrPj+CZVHn?=
 =?us-ascii?Q?xrQ2/PPdGgufyytxE3xu7iIrYqa1ZbDQCARDLsSsCGH9a+Uv9vbeYo5w8zpa?=
 =?us-ascii?Q?J/lEvMKG2VUenNBt/lzkeUoseTvPWekfEoZF5zqS5jq4L1x1OU9OmCj0R4JX?=
 =?us-ascii?Q?uWEVD6Eqibrk3F2QZtV3PanjZR5n22j1et8WRxEponQfHW10RBhvoem2cjAI?=
 =?us-ascii?Q?i10PQJEnK01zNtm/fuFGnINqlOWRkVmKlnTk0zKvn20KBhUCbQUojQjILXaO?=
 =?us-ascii?Q?4ZhpfGhMbXDzhNh9iywxSqm1GKaeN0rJSNjd4J9cz7Suj+ei4s0G49OEFPR0?=
 =?us-ascii?Q?lxLfoLY/ZXgq8DY8IYY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 029d6aa2-1ef4-4e3d-d268-08ddf0d07cb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 01:13:59.2580
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tBSMkRnKc3apwJ9vp7K549pDg5D3jg1T5SDwCK8NUOd8tTRTALSKV1ZOFYB2E9gng5IDD4muEzNn/m9crT7eAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10825

Hi Frank,

> Subject: Re: [PATCH v2 6/6] remoteproc: imx_rproc: Clean up after ops
> introduction
> >
> > -	if (dcfg->ops && dcfg->ops->detect_mode)
> > -		return dcfg->ops->detect_mode(priv->rproc);
> > -
> > -	switch (dcfg->method) {
>=20
> Can you remove 'method' in data struct also?

The method is used in other places and other purpose, imx_rproc_detach
imx_rproc_put_scu, imx_rproc_remove, it is also referred=20
imx_dsp_rproc.c.

Could we keep it for now?

Thanks,
Peng.

>=20
> Frank
> > -	case IMX_RPROC_NONE:
> > +	/*
> > +	 * To i.MX{7,8} ULP, Linux is under control of RTOS, no need
> > +	 * dcfg->ops or dcfg->ops->detect_mode, it is state
> RPROC_DETACHED.
> > +	 */
> > +	if (!dcfg->ops || !dcfg->ops->detect_mode) {
> >  		priv->rproc->state =3D RPROC_DETACHED;
> >  		return 0;
> > -	default:
> > -		break;
> >  	}
> >
> > -	return 0;
> > +	return dcfg->ops->detect_mode(priv->rproc);
> >  }
> >
> >  static int imx_rproc_clk_enable(struct imx_rproc *priv)
> >
> > --
> > 2.37.1
> >
