Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2087.outbound.protection.outlook.com [40.107.6.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB22C13C8E0;
	Thu,  6 Jun 2024 08:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717663347; cv=fail; b=XVj2xt0sDgCan1xOsY8ym58FMz++RjhvebseepArKjXzwwXnsmYLSxKA3TRZ+xjNx4qtySXUQ4qbuUmIAz2sbRtl/NRYrDrOD4Mi6cZkRVg8I90jXONOee5d7/PS/FlCkoHPnyxT8K0emmGRXP5hUjIHdciwjYgZ2kYT23wf3sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717663347; c=relaxed/simple;
	bh=JLStkJ5MO3v0mrnqZY0gnoSK2r/9Jub4akwrbT4Lxdw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Au/wvjzooaXPvJxW5kiVWlzPuLOa+9CX0v7sIAuiI4KdK/jpauIEhdvhLDwEC82kl2NonQXZCtNtZCmSxFf+snYl16U8G1XFbN2bq686+Gg6gu7taollkg64LzUMez8WOL7zxRaZVYjrCFKaF95eJUWRJRuOViCI+9NvXH8S/UY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=JhmyycjI; arc=fail smtp.client-ip=40.107.6.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="JhmyycjI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMBH/eXPbUwAW+HYR1O7PdCgZgbDiC6mpa9n0Vh7dJ06EwULceu9d4A5T4PWywl/doBWBWkhu3REjNIcRylf9v7GRr3n2dUYRlX6GsLDicO6DWNPj+3qHF9MU9xk9dLin3YTDtOBK1EjJgldENzWYhC1++edgx844VN3Ut2qyGGCE+pAItU870ffsC4cQJ/5yUVL36o8grFvaoE9Q5eI8vZD1s3bfxS83ARxr28uYLh8gox3+Go/cIbdKmSk9UY6lWZd3whz/GpQwCUABoBT6/bkdmDuzP/TUP/x4xvRpUDEQC5zg0X9SsGRza2xpIWlRhkuc2lm89+n3h4fZt+W8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JLStkJ5MO3v0mrnqZY0gnoSK2r/9Jub4akwrbT4Lxdw=;
 b=I6egzCVsiI2g0uGcJmGH7Z4bPihFTYwmJCmVsB6LBSo0AJ9GSRGOC65Ran+tw5mAYpQYP7vU8eKxluiNQAJshndFJMPUy8O9Z6HWtz6KZHx7TdKKSd+nDeB4F+jolELHm4NiM6fjJ2YVosWW37rypDVR3nZ7LVhRGkraYtSyRi3dMapiJiLhu3dMggwH8m71Obgo4LI3Z5DWoF2JfrZLgnjat70qSwItCa3IdzkC4OwfF9l9djtcLgSnBEHE8VtD6f4jiIS+/DWn9H8GfeW5+zG4Cle11JBSifCD8sK5lUMmAqyl9RuWEqnZ7doJN9xPn3Zlg5xtxN8XK/TuK5sdTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLStkJ5MO3v0mrnqZY0gnoSK2r/9Jub4akwrbT4Lxdw=;
 b=JhmyycjIvw7uHYyMJNTUcxD6uvmH5WtKpmtJvOj7pbHcz6WvPePA9ge04Imf6Z1m7gQfKOvKPlOcqnZkJ/nlzrWk8zf94g9uOU5FjZrqSCDoy/MKvVsdZX78ctyTQi1jRSOuufESYmOxivpCTic/hocV2277YC5jpGcGti7JTDM=
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by DB9PR04MB9723.eurprd04.prod.outlook.com (2603:10a6:10:4ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 08:42:21 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%5]) with mapi id 15.20.7611.030; Thu, 6 Jun 2024
 08:42:21 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Aleksandr Mishin <amishin@t-argos.ru>, Oleksij Rempel
	<o.rempel@pengutronix.de>
CC: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "lvc-project@linuxtesting.org"
	<lvc-project@linuxtesting.org>
Subject: RE: [PATCH] remoteproc: imx_rproc: Adjust phandle parsing issue while
 remapping optional addresses in imx_rproc_addr_init()
Thread-Topic: [PATCH] remoteproc: imx_rproc: Adjust phandle parsing issue
 while remapping optional addresses in imx_rproc_addr_init()
Thread-Index: AQHat+a79vxV3edsLU+70+T7X0ErILG6acbw
Date: Thu, 6 Jun 2024 08:42:21 +0000
Message-ID:
 <AM6PR04MB59415AC28EBEE2821142CCC988FA2@AM6PR04MB5941.eurprd04.prod.outlook.com>
References: <20240606075204.12354-1-amishin@t-argos.ru>
In-Reply-To: <20240606075204.12354-1-amishin@t-argos.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB5941:EE_|DB9PR04MB9723:EE_
x-ms-office365-filtering-correlation-id: 4e5bb1b9-49d4-4816-ecfa-08dc860494ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|1800799015|376005|7416005|366007|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?/ag+WIdb76gT3qMx7lJ6HWPCWRdduvmH98Gfam1W5GP/RxWULqb6hj1PXOvY?=
 =?us-ascii?Q?Vmm3nsN5Jss66dOc6LnuCfWVSIlXRV0paXngrvbVWFXJ2D0LVLO1OiB67aOM?=
 =?us-ascii?Q?dDxFyiLOvC+6kQiwbI1PbKAtdFC+fK7kJExY8gH3AKoxiDNisxne1ggwXAwA?=
 =?us-ascii?Q?/tQe2rrvDMTieluu+/XJ8oqIC251bJqsOFsYsZQsnsghfETGIDU4jQeERGbr?=
 =?us-ascii?Q?XiRL/dUPwSibYZeCPZdE9Flv3U/q3yRNbmZuRrkEpY9sZ/fbPMxDYlgWPhlA?=
 =?us-ascii?Q?sozkHPLnp+4D6E06vjtndpbSGNgN0ChogN10jiliTpbB8JIPITAR23EtyWwb?=
 =?us-ascii?Q?Td2YLF1zhAcQNDZzZ4uLBUoaQUbJ5/F2c2n44SKeP42ArYKiuX5z43ffpqF2?=
 =?us-ascii?Q?c2LrEhtEaOTMp8+CXko9wY46e7sM1xguSw2Ggxn0fnQ9n+NfPt2n5WsuunDN?=
 =?us-ascii?Q?6qQA4qMp0kEA02SHG2JUcze6Pos98tfjgwqY/xZE+hkz52dKIQthcYcP/eHd?=
 =?us-ascii?Q?Hsyj6Gtvk7ZR37oRbCRTYAkS2DbBdMpa+kIILD7yAVbRXFCjjYPswKnYtl/d?=
 =?us-ascii?Q?ZLMGH9zmk85CJJJWCsmwGWLVlWz1MKVrFWST+dCKgKgxzb4LO8E5M7RPOejc?=
 =?us-ascii?Q?x6qmQQkZutaImkj5h1Txf/xxyANmjNqjWNJrgvUHeEY616zzhYbsJI+VI7Ob?=
 =?us-ascii?Q?3ok+LnyDIwK9S61X/r6cD7poaVILrQKHmafkNtcrVfAJrj8CkrdaPJJWGYxr?=
 =?us-ascii?Q?uC2Qz1krIcKlwRlD8XguWtSDhhtuuZAv4vaZCJze1Px0bcTL9iYD0HG2e6VY?=
 =?us-ascii?Q?GGtQWV0oA7SpP6q1rAs3wO2RyXQZQG1CEh3XnJBFl35r2HmLp7MXJmTFthWT?=
 =?us-ascii?Q?BLGyW87FTZfoBvJMTSGYL4IEMfigsQqa+BFz85VKZQQiWtqB12PPmmkcvG45?=
 =?us-ascii?Q?trW2jnL3rDOjMrTtUKUR54syghXUtnBbg3hOqIdjJ2dV0wfsELB7xc4Zdw8l?=
 =?us-ascii?Q?jdNcNRkL05RSAkMEPUtqwxR5Dar3VZ1G+ZkxpI6t1NxEu34GCRJly86AuKCV?=
 =?us-ascii?Q?h1ZRRAk4vLxU3J89b1nWcsszUzq3ts+g+eUQEu2usfYJa+A6sumDx7luct0c?=
 =?us-ascii?Q?wggX3zy5ChpvuS6Llx5jl7kQy91ERkExpmwFZqXlFQMlwDt3ftvpCQ+hiQPK?=
 =?us-ascii?Q?0Kkoz67OIktT7EP5pmhxc2xqNZbWSByKz9A76xqLREJSaPVqrU3CVm9V6T8q?=
 =?us-ascii?Q?zDqNKMvLKowRBPRbrUni8WbOc28ny+sW8zQlARxNQGPWYbqtqD+uWI94O76N?=
 =?us-ascii?Q?d7nuUc4q4U2asKdbQUjxKA1zVc19DUQMDnjXPcz/d7uzd1nUXbBgF8OgjtTX?=
 =?us-ascii?Q?rTUNzss=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5941.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(7416005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4dEx/ON+AsoDQFPgVIMYLu09yHRkTLx9dlOxB570RffHZO1DQghoxKjNeha9?=
 =?us-ascii?Q?FTscvMEWpIUwTulZvwzieJWF1Wpoj9qFGu60tNh3DRFN9y18eh37hwenBu/l?=
 =?us-ascii?Q?SjxeyNttJyu4Zlb7zqEdNrXqbN02vLhUJcXMMyV35owu4ACKHenJy0rCZ+7h?=
 =?us-ascii?Q?xzt3M1bxZokgTiZuFSAa0R8WHLjYBPCJtZLQSYfWeolu0e3x8AZRBOFmr9Q+?=
 =?us-ascii?Q?A4KDW9tJly3jzzW+38LxGVM6hZiVe4udmMKKMEXv6mW7V4yAQqv5mRWF8lbW?=
 =?us-ascii?Q?v/8xkO9Ds0swLQFVRPhRQYyIH2c3rVhKfvsmkwj7N3791zqCIB8HxqKo6M5j?=
 =?us-ascii?Q?VrvPJmvT1fpYkOEljBrs5Y2J90/CCM+mqJ+GkMyCL6CePsoaD0in9ehYYhwC?=
 =?us-ascii?Q?dK6L6w+ffyii+L1eUX///1CvyoKbtJNpFBNkkzExrH8HTJtwTPPzIEaJDB+J?=
 =?us-ascii?Q?quGT2ZfbMBS53zZFzAyzV7HO81fd9gwPQsF3Dkmgo+ZjQt2KoeWBbyW2WHwV?=
 =?us-ascii?Q?nsNNOjzkWPJFVrsWDbjpghNdoekOax8AcN/hi2mI9C1hGVyHlzLdQfmDIft6?=
 =?us-ascii?Q?e9+ZaVKiMp0znDAIt438TY4A+YFci/A7HQrieNOuG3ye7LnvY/m3Me8hO7Pv?=
 =?us-ascii?Q?KLWp/Nqr7uCmdU6cZJePiIWuz9XHKpP3hEoZJm8pOun6G8PztVk2oFybMrDK?=
 =?us-ascii?Q?H6a7+RliUR4C+mO3QgbMvqdASYGkQNxoNxazEIzFjnpa4qpEqBLmmGMRINe6?=
 =?us-ascii?Q?w+No0b5qGTrAB4qzNimh3xm4XvMDeff5lIEynj6Qulu6bPmgfRoJNzr19Sqe?=
 =?us-ascii?Q?De4p7EZ/LX2Z8FWR3zL/yPd+wIRU6gGc5GRtZ0ZuhidGYS4DvV3xE3xfTbJv?=
 =?us-ascii?Q?Tbk54qD/AOyDo+VztTfkrr/PhlaAdFqvVyx/cJXSaLHyK3jdSiHLA4L4SnBr?=
 =?us-ascii?Q?aIRBbBf0mzSCZlu5860TVEhgcoBkkv1u+PUWDX1F7AezIjsYqyhwdljT+8GR?=
 =?us-ascii?Q?tGo3BpZJZ94BAIkfjA2Xt5tkjDdpqG4JEDx8jDUZ7CiJBlWgCZXi2+Ej/Rra?=
 =?us-ascii?Q?+yTQgLe83OKkalmtjCKy80QmJW+qXodCYd3hvVsD/GXgDfMTKVKlW1LGES/w?=
 =?us-ascii?Q?ESxXJTVBn926HcH204g7ZeRGvEL/mXnbOjlQe9kTx2MMmclzbQ9oir1ShFw+?=
 =?us-ascii?Q?eENqZsN3AlrluuFIux70441ZmZ91jTmONyi742++W6vGshDp8WLn5f8y25Go?=
 =?us-ascii?Q?iWgLmCvOtNBjQnlGRaQKDLFFqZsfRhnCCO17YsDaLRGKkoOl80oNpbkA6AgD?=
 =?us-ascii?Q?bmsr+CJ0hpblpa+kLNe6rYzFkz+be6L2eQomNQsRXyAKk9aa6TmcIdvslmGQ?=
 =?us-ascii?Q?PyguvGo+Z0T7nXwE3DBDEHOkQTq5xqaBOosG5/JmIVgDowS1rtcmz8RWzfMT?=
 =?us-ascii?Q?IoKkMhDsLFpEOXW/6BNO+0pUpByYicEfORx1Xw0vNxCCI46wRE/YSkIcG136?=
 =?us-ascii?Q?p5x6hsG4wMtu7kuu++2lgaFOJ47l4jc7tLgu9afi8WqGGjga1W0LRIsb/MB5?=
 =?us-ascii?Q?yC7NZySevv01tBgh+LQ=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5941.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5bb1b9-49d4-4816-ecfa-08dc860494ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2024 08:42:21.2109
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p8v1hFP2RfXh5xabcB0aRpgqtg/J49TrUMpuejWTsgkQbHA/7VxfP8j8Cx3a8RWF68ilWTVIdSyFnOEmGJmvRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9723

Hi Aleksandr,

> Subject: [PATCH] remoteproc: imx_rproc: Adjust phandle parsing issue whil=
e
> remapping optional addresses in imx_rproc_addr_init()
>=20
> In imx_rproc_addr_init() "nph =3D of_count_phandle_with_args()" just coun=
ts
> number of phandles. But phandles may be empty. So of_parse_phandle() in
> the parsing loop (0 < a < nph) may return NULL which is later dereference=
d.
> Adjust this issue by adding NULL-return check.

It is good to add a check here. But I am not sure whether this will really
happen.

>=20
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>=20
> Fixes: a0ff4aa6f010 ("remoteproc: imx_rproc: add a NXP/Freescale imx_rpro=
c
> driver")
> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>

Anyway LGTM:
Reviewed-by: Peng Fan <peng.fan@nxp.com>

Thanks,
Peng.
