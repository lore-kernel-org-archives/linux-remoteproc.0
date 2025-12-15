Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010003.outbound.protection.outlook.com [52.101.84.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08456329384;
	Mon, 15 Dec 2025 10:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765794049; cv=fail; b=G3a5jnI8XRDeFH+NuYB8XDNFj3tRXFuWO4HVSycMbW08qa2VcXLAI8AZvAALDhviD/DAKuQfzc+s8QYL5vM1qwn69ZTGrI50gdWGHZZ7WKmuhi3gWOB5QGoXXLijylV7HqPIT5p9PzzPYaBgntUgcuwKtXwbaNIGklR+ZYFCix8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765794049; c=relaxed/simple;
	bh=HcMF1guL1IFkfgoTdFI/QfDnJeB4MQDlojA9+djWUNk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SVn1URg+2qXetqeozlQpuQdPkhziRHNb/YAoAZ1eQdmywbbmO19kj3sPykdakB7bk8WsNw1U+dhFDOORzPL0zU2LKNtY29YdSdGtzoSPQ9TU0eeLkeLmZXJIIvaztLFuXZLni22VcSOHjxsawKvXry96R7dwI1aOmSqO11XbioI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SMz1ColV; arc=fail smtp.client-ip=52.101.84.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SMz1ColV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sscuDosUNXp31thYVg9PaAefjD6xEBrFgQqQDkSpbsBAAJNZcAEQKrElCLDy2CD+MlvGoNouOWcsczladL3O0u4VyToCnzEEv8iz4r34UEosD2Y88Ds2HiQiQykAC37R+Z4C7XGSlkhnbCfrXsI/WWkAvPy6PJtcGv/c9UQEK488vqbArA4jTKugEEtjHCeChxhdkhcjShMvb7KEIYdpMPzPZN8yxEQb2eynSoSfuZqfJsQLiOH5TC6QuV0+mKElcvrVCSGIkELigw3cUvytXrOnZb5pMXf+IsHUPFOz2ZI+p3+aZCJwQWt6uMtN7H+ytH2xNAvnaIvzfAIY8uKxAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxzN3aiY3DdD0G7xCGQJ5UVLzyvlmS9JMliSeUp60sg=;
 b=YlBUAK+UHyJ2vs+bOxGNCxZfkjv90xDH5QCavJG466TqZz5UPLz3v7d2WSDyZ6TjMSUjPM23hLR+TbEt3GbLLMsNqDaCjxTs2d3682NHW8yay7v4pImxzBvsHKMqRQIZtDjXTS7T9YYczwAo5Prv3BN7MPgtAcVDRsi6twFZwbENzmv+auzZWw/RoT1C2EmupMDyyF2PRjsDrxo4yhVh3B65JUaze7nnQyr2qQ5SGFRRm0vLNhs8lQc8/OPMVvoBKEFZmkviBuIxFOcuMlaQGnFB7jmzb2eTwC/kMkAs4VWw6eLmMYbhMS4B0JntpC2xy7BbBHwvKZ88daAZpJN5ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxzN3aiY3DdD0G7xCGQJ5UVLzyvlmS9JMliSeUp60sg=;
 b=SMz1ColVuuYNFHHLDj9BSYHjZ3YG/SI7u0W4K8k9FK+iX1WlK8vM3GVy5Cf4l8IH/0QB31ciy++4z9n7eNNz9AXxXT2mwQJfIqzVFcGMXMTPBU0TUfxiI1fvwijmcFbly5XPxEvofcmo1ZTpuKpQ5MqzwQPwH1cF6xHNma106x+oljXN2t4hnf56ep/2myK9lut55ERy/n6h/EKORAvu6dAVOsJp6k797Bp3mI2FSZPJdJ24WD9jHOrj61PMjRfBU8EjZ8erWDNlult5JjnFEkGs9+wrndvrkFa5r1n2kyBjTPfi5oQhXu49X0kvXhFiHitJ18UkF+xhH23uw2qF+w==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8866.eurprd04.prod.outlook.com (2603:10a6:20b:42d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 10:20:42 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 10:20:42 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Shenwei Wang <shenwei.wang@nxp.com>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] remoteproc: imx_rproc: Use strstarts for "rsc-table"
 check
Thread-Topic: [PATCH] remoteproc: imx_rproc: Use strstarts for "rsc-table"
 check
Thread-Index: AQHcaJsRpvSgZG43WEGbv/V//qPUhbUihaIQgAAB0sA=
Date: Mon, 15 Dec 2025 10:20:42 +0000
Message-ID:
 <PAXPR04MB8459D21BF666688CBBE92AE188ADA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20251208233302.684139-1-shenwei.wang@nxp.com>
 <PAXPR04MB84599C141E28B6B83BD62C2388ADA@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To:
 <PAXPR04MB84599C141E28B6B83BD62C2388ADA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS8PR04MB8866:EE_
x-ms-office365-filtering-correlation-id: 95a1f1ea-0a63-422c-99ce-08de3bc39a5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?RQzIYGc7Yv3KW7ghrYyH80Qx3z/IGmsRUxSkNmnrK6v+uk92yGb/6klQpW5z?=
 =?us-ascii?Q?M//TxPoyauCH3/Ndzt+juOXFkc8qFkOU03fprZEhn3T+dMkDKO+efBgkbvln?=
 =?us-ascii?Q?RaBMcDTB/EYrUP9mhMy85l31UIYjSr5YSQ4dKcEQVm1IsO2AX3uFHaUulzEk?=
 =?us-ascii?Q?V1AaMZO0qMkKKsCCuWUerZKLpOQ+vpPTKyeRupaDmRSnf1O+ParcMHJo0x5x?=
 =?us-ascii?Q?m7O7bUlA8Z0mjXN6F7C5hOYetbbfeWQNsH8Rgt/gDJkJXbYd+LcgjFc79qda?=
 =?us-ascii?Q?/wt5BBq3MHihqpERfpRchz4dhRCIxY5QMHIrtZ8zqbrvKBqYRijdFTLqq+uE?=
 =?us-ascii?Q?zkSXhXJ7dYnMxWoKb5r16BcUDMmGmkDKb41man+4IOsKKqFGJF+4Cn7Z2YKi?=
 =?us-ascii?Q?u8n7s6KZEjixyDyZvfj7YevtXeVjQ2+O5tPKldMYz/k5n0hTKwSNqn/gIfoL?=
 =?us-ascii?Q?KkbMyAIhOYd1o8QVGvKT77L/ITCnFXvKz931R3gK6j1kkD5XvrvzbZLYyqq+?=
 =?us-ascii?Q?H5r6d1k+2KIoTVSti4/OcCyEN4ZBC9dsUuj02EUrQMzKj0MvyX9S63Goa8kB?=
 =?us-ascii?Q?xReCgjLxcTNKrybNeMStcoHz+jkH0murBXf/gw3OgJe7g/wn5S9yvyIcxCEK?=
 =?us-ascii?Q?Dppk/WXsWl79W00PH6cjmiAOwxQnKt8tRrcMwVuQfTUGT6ROBW0+F1YH03xO?=
 =?us-ascii?Q?41tyfZKb86wbw7Isipu7Abry7s+h56upYnr8t5evuYAafHY9hpDeaAJDsK/C?=
 =?us-ascii?Q?r/xylIYPDW3fePlRjXbJKXISav/6IKOG7AoBZez5N6IGhd589fcfUoJXkZK9?=
 =?us-ascii?Q?N8GDpiqtPoZVMa66o0y4oRw/uKGbP9Qd2Eggf/OCvseoKwyA8bfyLdVnhwuH?=
 =?us-ascii?Q?43W+uPScMo+mEiWd2luvqk9hY4bJ6hys2IinWrf8Oe74Av5d3iq+BSyrtnbs?=
 =?us-ascii?Q?rCviSXpgrfb0Q5O/AhuAUejoEHLErlrgdBgT4ZNULYg3QxY24lNi8W7V1Xzu?=
 =?us-ascii?Q?nKE6pZaXjj9Iidt9Ch4khzuL2srCbvxiBW4bAlRR0lRw2/MO3u4uoXmXv1Y3?=
 =?us-ascii?Q?Bd3QX4s2IFhMG1HLCD0+uBb671XVLb3M4UeMVAQagqpydl4DW3HIyeBeXSpC?=
 =?us-ascii?Q?tOHiGmE3a8kQfNyKBZ5a3ugKaFAPVQGZM2WYDYFqe+l8pAudumHirNxCO2j3?=
 =?us-ascii?Q?z/GhbQzjm6Vtvv13HxRNy5DoeoNzbPonqSbaO/xVYi6LEK2GAxKba2Qi2kcW?=
 =?us-ascii?Q?EA5DVjlMHL4fdqeVM3fjixpBFjMDwztSk3RWK4vc6U7fs1C7dByox0SQAkQX?=
 =?us-ascii?Q?nawboGbDirsP1RwmnvMpI/AYYxZd6nKsvxyrC9HWX/z38Nam+I6ShmhwSCbN?=
 =?us-ascii?Q?+2ayPvRgwK2eGLEvXVf1apXmQWTkcyQwIMKU1Mi1KzhRXPm6puaCZCciLYi+?=
 =?us-ascii?Q?tQKKQcaS57V3mEwoL6rE+KOfrkeC7SnoddlPbMcjo74T4pqTHrsjsafwAtb8?=
 =?us-ascii?Q?zF32/hTks2SSDVNmaFm72cN0gZANqQV6qQ8K?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?AN1/4cwzDCkOKHGDalbb7AKeVgJBcZ4SfopHjFtd7du7O12V7NcZi5E9SATt?=
 =?us-ascii?Q?R7SQHOi/2IZwWCECqQp07ZbYLR9K+eEASxUI2+eUjsiqlsfJhPBdpVpFWqbI?=
 =?us-ascii?Q?d8oCyOku1Z9Cqc/GvivP2wdTOSBIpLmrtG5ts2Pv7cZSTIiYit5nYzgxMnWG?=
 =?us-ascii?Q?DB7aeYcF4fpfo+U8Fty+kJCeDuyNxzD58uYGXydKVedFrf/bJipaaZLlr7bX?=
 =?us-ascii?Q?4roYhMrwAUnW8HdVJ4d+CBRkZBcJJmB6gNEGf/2iFdgMBwstksPkzjJd8/PE?=
 =?us-ascii?Q?e39QPNlo101veJnwbsPf3Th13C7yFiFE31x4xRDbaTrtaQEcvhtsPkKiQPPF?=
 =?us-ascii?Q?N7JV6xmqFHh0mwMSPi5RiCVBuDFdE9fG06QuaPi7RbXJdAHxWlllzY38fLao?=
 =?us-ascii?Q?Aqk39Obeu2CO9ht79M9XQAcJB8i52g6erRA3uTcc7ZWx5mySyoLRip6tt5wC?=
 =?us-ascii?Q?u8uVwowS4NLOM2X+U8EJVXg1o52U1PFKYiR31EDlcnrTbA3Avl/Y04Bo3jEH?=
 =?us-ascii?Q?aVKwtYkzZ79gjkloByUpUhZWMYObQMvTt7wsZDfJ5j1WxMHRdM26yUi8iTQF?=
 =?us-ascii?Q?FLoJJCSkalplZ8WaA8pOB2f0iEZFsHE97DvkGSM45zoo8B3RcVBoV8h9KTLQ?=
 =?us-ascii?Q?JrPhnVzT9/dQ0KV4CxCU9qtMaoBQ21bMO+hELO5ebker7CS8rm2TFze82NQf?=
 =?us-ascii?Q?4a3shoJt3TgxcGZboX1zBFhSZoCzPgo0sDdbUT0Xym0JFMV4TmOtrN9xHDFi?=
 =?us-ascii?Q?5RZAqnKu/nSLN5BRTR0EsKn+P8wCFEvfY5NWsrl56ZMgiLgjG4kcte36Nn4W?=
 =?us-ascii?Q?qCWyUNNKwJSZrFOiR5FwA5vN7uNORRL+A2M6ED7jq/aI/RLVn78ebEuKzHRO?=
 =?us-ascii?Q?+WWwiHrFMPv4w4XqliKjLogq5U3d3GdOMqVLaojiAIQnm2dkSvrOoEy+Jx3k?=
 =?us-ascii?Q?RRy884qaANWZ+DVYNVCBJGbRMU95Hbav0XOXgBU77BiV/HKcfPtuTAqcYkn9?=
 =?us-ascii?Q?NV5RmDlK/flo8QphM/17ArZkKQ2rlpPWTtepjmB97MAmicxg7QEQFbdpQ0Yj?=
 =?us-ascii?Q?qb5dqCOGmulDhLAx+DFv2XjleJHw/LN/tkcS+KVYR6p3QEIZe7+WHsll6974?=
 =?us-ascii?Q?HA3dsD8k0jBBAEtPkhfjpGGe/MkVdd51VxOJpT0Q1KO8pmKhWEsg381nKJMs?=
 =?us-ascii?Q?kJonzYD3xJBf7w0/OsTHcbuYGjSm8jy4tuURCB9vz+OUSejVLmEhsk3kjubs?=
 =?us-ascii?Q?ZvdzFrlaYYd+OBCAHf1u1BPgU9enPiT74RyqvjJFUNg83MxEQ4SJ2HUoNQ7g?=
 =?us-ascii?Q?3gldKt2AdFetY6YO9rOS0oLi/3IQkjFMgx8SwrOaXQVcqQGYHFFneqB3dIfo?=
 =?us-ascii?Q?A1dHhHZPuoPviVN0ThMx0dAivtkgtDuNxglTp16IGHF2M6voExIua1biyXUr?=
 =?us-ascii?Q?dP7TTbmKbHGO2jPpGiV208106/wCSYKDtO5VnidRsapv4OCeyNJWR+jshiqw?=
 =?us-ascii?Q?hTqv6RsEO1aAhv1ie8QeqS2J5WUgFJ3HNl1ELh2Eh0Sb04u8eW4pwYl6bJU5?=
 =?us-ascii?Q?9yapv4ZeTBbiIviOKMU=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 95a1f1ea-0a63-422c-99ce-08de3bc39a5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2025 10:20:42.7606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LDcCkPuN/F9FW/WKQCM/4k7UHKT9+NVDbl5gIf8bvny5DPYt859hdeEa6S2uhisHChxuR5NdcC0GUjIfQ86p4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8866

> Subject: RE: [PATCH] remoteproc: imx_rproc: Use strstarts for "rsc-
> table" check
>=20
> Hi Shenwei,
>=20
> > Subject: [PATCH] remoteproc: imx_rproc: Use strstarts for "rsc-table"
> > check
> >
> > The resource name may include an address suffix, for example:
> > rsc-table@1fff8000.
>=20
> device_node->name does not contain the suffix "@xyz".
> device_node->full_name contains the name and "@xyz"
>=20
> Do you see the device_node->name is rsc-table@1fff8000 in your test?

Ignore above. I use an old tree, just see this change
"remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
use res to replace device_node.

Regards
Peng.

>=20
> Regards
> Peng.
>=20
> >
> > To handle such cases, use strstarts() instead of strcmp() when
> > checking for "rsc-table".
> >
> > Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index
> > 3be8790c14a2..33f21ab24c92 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -694,7 +694,7 @@ static int imx_rproc_addr_init(struct
> imx_rproc
> > *priv,
> >  		}
> >  		priv->mem[b].sys_addr =3D res.start;
> >  		priv->mem[b].size =3D resource_size(&res);
> > -		if (!strcmp(res.name, "rsc-table"))
> > +		if (strstarts(res.name, "rsc-table"))
> >  			priv->rsc_table =3D priv->mem[b].cpu_addr;
> >  		b++;
> >  	}
> > --
> > 2.43.0

