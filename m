Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2082.outbound.protection.outlook.com [40.107.20.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073F918562A;
	Tue, 30 Jul 2024 08:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722326790; cv=fail; b=QrKCun/sAh0o073WJzd8C9J2z39z/3oM/Wfee3blBMclB07BvnmjDVvrPkoQ9b7OPruRmyw3oXD5anUjbtIIGCGGzC5CJj13LA4z+wPkqHobdRxSigsIkSwgbW6zm/rcRwq/UW0mONpfUicxdicLqWS7jEVkxvAzcsBZ/bQypGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722326790; c=relaxed/simple;
	bh=Jzp/7ZbcggecF+p3aM8ytPSwFiGfFlDNIiHID6a8yZ8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aeg9GllHxs9Lyo3WJKlx65Z7PPLNyX/LTdFEKEd+Ec+Ufqhy1V0h4axP2SGX7IgUnsMFV0PKQTKdCsHEiPZLVVbsrr7OYBvWSjVynJiNbVN2sKnB65hIOrw9RgQnYzVaQSPkNMJy/HlVH9MmoXAndKxtnlMMEWDZ9IjQervhnHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=A26/+D5r; arc=fail smtp.client-ip=40.107.20.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="A26/+D5r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ChVpztWf5NHemvNbMvAV3f30RKG+7L2IX4AM2TOKSJLkaY/eIdo8qIgNaX4zBMih7QqyhF8kTLU3Jq9GwubNVyPYicD3Oa4KwMydZp+RKkbGQqlyndlXBkOVKkSRvM4NGyMoe6OIxzffEJ8Zv6n/mJ8HKuD4LbB8t7uWDstZiIFV0sfZIG56cBaagE5dEIEjSfg74RkyBRtgd55U15biXkrRLFxfWARgR6R/6OevHrhPrept4krDX5YFLvT/fFoL5jI0RFZgPJ+f1D0h8ozWihb7GomWmMtYvLaUtCqGbuOBhqlX36eqBfiA6Q+5l8Hqy2EuQVn+FpA7vZLovnwt8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dx04NGiohApi6tHPoJ7HGxWcR9mW85G6IFxwGpGLvBI=;
 b=PgXud5mtVRi0pKqXGRzXgKjHdamDQiRI1OAlnVMV0X3456U7xBPvlOV628HL/o2jD9XsvFRUZl2xpHPFGMXlny8EyirgkvZwMkCjxvyrM4BuCLort326WTIPnCZWAKm+W7bLyRhDjTCsqB0Xb8jNny4rljDnHqdac2P++ieuhhouOMFDxvUyC/MJ/l6HjAgT+Ot1EacufGFTZ7qlPjLG02onEhSnQRWQ22EqCOcewKos9kHw2oSfhm3+jjPu9BL8D/lU8cZhqdbMIR8eeaOrC/sJNzQKi7OkVtpvzHBDcNNcM29Sgw0eMrEY0IGd5Zop363Rc6FJhYMKXH0dSnxh4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dx04NGiohApi6tHPoJ7HGxWcR9mW85G6IFxwGpGLvBI=;
 b=A26/+D5rq2gRm8/HIA6eG6rOFSl2iwOMO3g46McHg1gRCm44abXcCpMt2ku9Vza4F1bb1gJTIEV9X0Zh67GtGhOaECcgHXkR7UcGUMngoEqIKlJWgxh6pVy6U358VnOEi66ET1ToqLk4M+mhHPxhj2KzGHgMgjphQpYc08YAbFsj3Zh44tcAX9bBtPqPOMwr6DhPgnvRXzvsdWN5uEMDDhHS2Ez9semW3mlHnJ0q8f4TApqtHqGCJDk47jURvwLJKArbomILEiina3IcyJ3gtVWLYqVBjEwI6UVZoD25uijcX7zLDBiosCGUVMI4toauOap9VjKtjQHQRWEGEh4O9A==
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AM0PR04MB7059.eurprd04.prod.outlook.com (2603:10a6:208:192::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 08:06:24 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%5]) with mapi id 15.20.7762.020; Tue, 30 Jul 2024
 08:06:22 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Daniel Baluta
	<daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, Marek Vasut
	<marex@denx.de>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] remoteproc: imx_rproc: handle system off for
 i.MX7ULP
Thread-Topic: [PATCH v2 2/2] remoteproc: imx_rproc: handle system off for
 i.MX7ULP
Thread-Index: AQHa2bdERlEy/iUIMEm8jNjZj1/DHrIN5pMAgAESTTA=
Date: Tue, 30 Jul 2024 08:06:22 +0000
Message-ID:
 <DB9PR04MB84615384294C38EEA5B95F0088B02@DB9PR04MB8461.eurprd04.prod.outlook.com>
References: <20240719-imx_rproc-v2-0-cd8549aa3f1f@nxp.com>
 <20240719-imx_rproc-v2-2-cd8549aa3f1f@nxp.com> <Zqe23DlboRPSXiQO@p14s>
In-Reply-To: <Zqe23DlboRPSXiQO@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB8461:EE_|AM0PR04MB7059:EE_
x-ms-office365-filtering-correlation-id: a474f3bd-14e0-4098-0795-08dcb06e8075
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?PM15qrOMV8YvruuLpjUABjbj/sp+Ack9lHu7uqXixT1KqsHFVp1S9N43lQrf?=
 =?us-ascii?Q?XZtlqtwzrmKZ5mgIhtw9uOtsSKv3N+2nPnbbWEIfxe2z1dh3nrFGG1cFbsb5?=
 =?us-ascii?Q?u+Fg7AkJDG3gUCTG4eeBaPiYEI0UaWWvIqkEHIDheiaJx56uKQ0Fj1GpCKOf?=
 =?us-ascii?Q?wnKL7nTjRLvpGOkOjrKl2IAEz2NMPhcBXDt/jCz1HAwbnnl5/3Y3wNqLoMLH?=
 =?us-ascii?Q?mFQkg/g1CpknZj+J5FKuA1Er99i8tzhEJ1WKMCIPurUVXI78B8DSY4+I/nK2?=
 =?us-ascii?Q?a0o1wHVSjAEVQia3LpieM9yY7NH+ijHL1ZbKg7kgRVxStgOUqBoGIdXkxFR+?=
 =?us-ascii?Q?Z8NEuvgNpp4qpsx/QQiLVF34eN1Azt7Q1bkFKMib9HQkyaX0e9SDU3+Zsz1m?=
 =?us-ascii?Q?c1JpkSx4CKt1OB4HViDn2y5PohSY4A35GE/II9HMFlyCLzcKv7xjpihbLV+O?=
 =?us-ascii?Q?x7i6F0TnBOeyj4rh8Fy4IUsc8ODyk+zG5CaojfWHzb5w2fc3gbxL5eFByL2O?=
 =?us-ascii?Q?B3OkOEThGRNJ5QQz+moeHx4zvmrDflbf86xwns/KPz06UVOl8JDMKx55fMyo?=
 =?us-ascii?Q?jPmLnoBbjKn60RiCwuQdEOyA/zqTVTfDy2sjVQt6l3v6xLVMRZ6uK8Gv0qlj?=
 =?us-ascii?Q?3DuVM1QabRO0YVMpDAx/xKTagoea41ct9pG2XkCRGLZU6OFpq4wOR16U9/yg?=
 =?us-ascii?Q?wOfIBPk1h2EQzu3ye/epS1FTZUMrT0tAnDksA+1lwCoXYd/iuuiq8jmZc6B/?=
 =?us-ascii?Q?s16xD445eL8xZpc/RWsyOvvwrGUUtBb+q+prYRmnmVDW6I7iDYvqDDSyHLIo?=
 =?us-ascii?Q?Kg5J+KRisdLw6SNnLGIWbq+V4kojjwsWpFo/JOHK1cqpr5m1nOIHxwGjagi/?=
 =?us-ascii?Q?1fL9AMUWItB9v5WdcjQdoTavyyyko2y2AkaITUb+Iqc9i9VH1CT/R7vs94G1?=
 =?us-ascii?Q?NvZhlT2Yf33foYnGTwT5HgTJpixnpuT2n2phnXjJqNru6M740qorPZffI9dk?=
 =?us-ascii?Q?WoTqNr3Kb+XC2em20WppK7X6kUa4DeGM37F1M4uKW4VmmnX95xt8O32Uv2bu?=
 =?us-ascii?Q?q3j3Z6+p7505p7e09D6ROCNsLOHbQUHM84fcz01jlXihnqTctVisQFMwbhMn?=
 =?us-ascii?Q?iF4SBAJkgo86JEubAkeNZzrfX8bHZKkM3RT+TBr1NTcQ8N5ec3fGW8ED2hkV?=
 =?us-ascii?Q?wXANRsLTo0z9Zfbg6heWTYK1GmM76IsIAJfbda1a3g+5/A0XTEj6r7GOe1ij?=
 =?us-ascii?Q?ZO4fYozmhGrcjCwWnyqkU1zVAtSymiFiDZdcxIv4ktAMpl8TavTglL1tJu+s?=
 =?us-ascii?Q?hyOmHTNxl2Jyw5DOZZU8ZVmwwFqs2QahPHAiIEY2pk/5TOszJ+ExkDUb0mFT?=
 =?us-ascii?Q?SkwHb+KwX87kSae5MxUg+1RnCoIcAXTG0/+cqePF9ekheG03uA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5PewB+6jTYMEEolddVup1Tce5WT5W7yajq+wD9QZM1L2dkgomVY7M3ZgrISy?=
 =?us-ascii?Q?aaMca1j/uQtBn82c2RGMGgPZPzHgDIbpaCdT36L3n5+k4fu4UIK3gF67mC5+?=
 =?us-ascii?Q?IEpB81iBotK1nUWED2lFecF6kmveOc0FjmZmxqH1DQf1pxOpNeWz/0+lA6vZ?=
 =?us-ascii?Q?Z/zzHqLnpaBVG7GFFTchJcfwLEFERDv1I4gz54REYYgI52kwyaLbYvA2lAir?=
 =?us-ascii?Q?uFJhS/2l6szhQM4hW6RfYq0hfHLXqMBI38RWr2LuxML+0svvIgkN7bU7UwiJ?=
 =?us-ascii?Q?J+Hj7AkdpTXkbQFvf+oXyyADIBj42ZAG5NA+j84mXVuBbVN2y12InAn3Dj0W?=
 =?us-ascii?Q?9S70ARTATakSDdKNPFQQ9SHYKJsDZpxX5fuVgQ9jN6kzK4BOPEkmD6vH0tSv?=
 =?us-ascii?Q?5lHiah7eN9L/3CALEVegmw/HAcX4ZwtSw1Go7zNWVlRn0LZkU5fX7c3zapBl?=
 =?us-ascii?Q?in1iyFXAZX6J7Mwgw0hbbFU4mPQCyxrsriMmv2+uQTMk4ZYJYOOwU02N+GwL?=
 =?us-ascii?Q?fQUKUULsCPKXzr2riT6g46TLzGIDYm1qNKdB3a9dMqilXhPu0YN/fa8/Qrrd?=
 =?us-ascii?Q?vFSTJ3YhiOJ7yCOzNA+qFM3MC5LI23Q3NM+kFUeKk8b5iyOBQJjZQcpjiI7m?=
 =?us-ascii?Q?FH1RIpBemg2sw4olMZWlU8wYi0RfhQkIszKz8i1fAgYkhc5pCHdO5IGH7SWG?=
 =?us-ascii?Q?zlCg9jU+bDfsQBaYf+/zTtmv8Y9G0K6v7f4KFP+nQ/ZFMtQenxi2iWH1QAL0?=
 =?us-ascii?Q?DKSe4ECQZNEjSaNA8WrxNjT/Z4s8towcRDwVP8Qx+IJgX7Q0oZgjZk4gMqY9?=
 =?us-ascii?Q?hPTC8KfUTlIy+ybIO7u1CQwaCSAcbOrGIKuhH7ZHKQK74fob5TMsRO7Qgotv?=
 =?us-ascii?Q?RwHWWltFnmptIu/XEi0Um0aVs1CckrMR19fDDV2fmFH/sm4qHuMNp/HnJh4D?=
 =?us-ascii?Q?gIunQnvy1VLR2RHOBc58iXrSkU7pPU3tDy6ItTJw/LNn4ihz50jt+d30xo8J?=
 =?us-ascii?Q?FZSVWYdL0x7PJOuBJxzhdtoJXjQklTUkT4GkQfjjS+MIu3iz9FjOnpOi3GB6?=
 =?us-ascii?Q?iGBla6ljNXsFhx19BTlpoTrz+KG1f0aOvY4uNZP/kJaivTcgDLNlKdti8elz?=
 =?us-ascii?Q?EkVRRkGjkt8tL7p41M3xoc1rMzYmLf1BG7QEkcpTIwvSWpB9l4PvwMPQsNHF?=
 =?us-ascii?Q?gziRtsjxanymAQWlkMl0a0RTq/ABafTNPWQaIm9cfdc+UqrQT9vmNH4Pf88o?=
 =?us-ascii?Q?KjM7jQqUJFGbEs3azI0wrx4ogFDSW0WCGXrehZlG3h5vnBTXB69K1LtZFt5b?=
 =?us-ascii?Q?ISTGwOcTfv9g4eEyBNEufedZfG+tWLi/UnOMYJKcYp4/rZLnlxcMkzrKGqn6?=
 =?us-ascii?Q?WDzQyBxsTZFqmTungYrJ9WEsXQly2XyhCZC1dVl4n9Jvu3Wth0aBd2r75ci8?=
 =?us-ascii?Q?fbtiepGZdGqaW5Wk/y5Zm7wkdci1YJ3bpK25ISz9AXU8VlvJR6v9tUiziA9u?=
 =?us-ascii?Q?+Jr2qFJTeCo3CLqWxn8YybrsOmWc9BiSXw1J5oE0Bm8rqaHm6i+Rp7waszkJ?=
 =?us-ascii?Q?dpFqxrUl7KffPMvYuoc=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a474f3bd-14e0-4098-0795-08dcb06e8075
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2024 08:06:22.7206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bjqXP/t26dmbLskQfv//P5XJpG8QnNq3PmMXHExJUcHOAnYLSToGdmJjYySvHw1aJiAWMn+I2D2ECFIe/6iI9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7059

> Subject: Re: [PATCH v2 2/2] remoteproc: imx_rproc: handle system off
> for i.MX7ULP
>=20
> On Fri, Jul 19, 2024 at 04:49:04PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > The i.MX7ULP Cortex-A7 is under control of Cortex-M4. The
> i.MX7ULP
> > Linux poweroff and restart rely on rpmsg driver to send a message to
> > Cortex-M4 firmware. Then Cortex-A7 could poweroff or restart by
> > Cortex-M4 to configure the i.MX7ULP power controller properly.
> >
> > However the reboot and restart kernel common code use atomic
> notifier,
> > so with blocking tx mailbox will trigger kernel dump, because of
> > blocking mailbox will use wait_for_completion_timeout. In such case,
> > linux no need to wait for completion.
> >
> > Current patch is to use non-blocking tx mailbox channel when system
> is
> > going to poweroff or restart.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 36
> > ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index
> 01cf1dfb2e87..e1abf110abc9
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -18,6 +18,7 @@
> >  #include <linux/of_reserved_mem.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_domain.h>
> > +#include <linux/reboot.h>
> >  #include <linux/regmap.h>
> >  #include <linux/remoteproc.h>
> >  #include <linux/workqueue.h>
> > @@ -114,6 +115,7 @@ struct imx_rproc {
> >  	u32				entry;		/* cpu start
> address */
> >  	u32				core_index;
> >  	struct dev_pm_domain_list	*pd_list;
> > +	struct sys_off_data		data;
>=20
> What is this for?  I don't see it used in this patch.

Oh, it was added when I was developing this feature, but in the end
this seems not needed.

>=20
> >  };
> >
> >  static const struct imx_rproc_att imx_rproc_att_imx93[] =3D { @@
> > -1050,6 +1052,22 @@ static int imx_rproc_clk_enable(struct
> imx_rproc *priv)
> >  	return 0;
> >  }
> >
> > +static int imx_rproc_sys_off_handler(struct sys_off_data *data) {
> > +	struct rproc *rproc =3D data->cb_data;
> > +	int ret;
> > +
> > +	imx_rproc_free_mbox(rproc);
> > +
> > +	ret =3D imx_rproc_xtr_mbox_init(rproc, false);
> > +	if (ret) {
> > +		dev_err(&rproc->dev, "Failed to request non-blocking
> mbox\n");
> > +		return NOTIFY_BAD;
> > +	}
> > +
> > +	return NOTIFY_DONE;
> > +}
> > +
> >  static int imx_rproc_probe(struct platform_device *pdev)  {
> >  	struct device *dev =3D &pdev->dev;
> > @@ -1104,6 +1122,24 @@ static int imx_rproc_probe(struct
> platform_device *pdev)
> >  	if (rproc->state !=3D RPROC_DETACHED)
> >  		rproc->auto_boot =3D of_property_read_bool(np,
> "fsl,auto-boot");
> >
> > +	if (of_device_is_compatible(dev->of_node, "fsl,imx7ulp-cm4"))
> {
> > +		ret =3D devm_register_sys_off_handler(dev,
> SYS_OFF_MODE_POWER_OFF_PREPARE,
> > +
> SYS_OFF_PRIO_DEFAULT,
> > +
> imx_rproc_sys_off_handler, rproc);
>=20
> Why does the mailbox needs to be set up again when the system is
> going down...

As wrote in commit message:
"i.MX7ULP Linux poweroff and restart rely on rpmsg driver to send a
message," so need to set up mailbox in non-blocking way to send
a message to M4 side.

>=20
> > +		if (ret) {
> > +			dev_err(dev, "register power off handler
> failure\n");
> > +			goto err_put_clk;
> > +		}
> > +
> > +		ret =3D devm_register_sys_off_handler(dev,
> SYS_OFF_MODE_RESTART_PREPARE,
> > +
> SYS_OFF_PRIO_DEFAULT,
> > +
> imx_rproc_sys_off_handler, rproc);
>=20
> ... and why does it need to be free'd when the system is going up?


Sorry, I not get your point. The free is in imx_rproc_sys_off_handler.
During system booting, the mailbox is not freed.

Thanks,
Peng.

>=20
> > +		if (ret) {
> > +			dev_err(dev, "register restart handler
> failure\n");
> > +			goto err_put_clk;
> > +		}
> > +	}
> > +
> >  	ret =3D rproc_add(rproc);
> >  	if (ret) {
> >  		dev_err(dev, "rproc_add failed\n");
> >
> > --
> > 2.37.1
> >
> >
