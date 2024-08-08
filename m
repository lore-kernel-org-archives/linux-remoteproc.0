Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2051.outbound.protection.outlook.com [40.107.20.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953B5C133;
	Thu,  8 Aug 2024 02:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723085785; cv=fail; b=nsa5X8XdkW+exuJ8H4xYHLkE3VqZygxk3QoApmmbeF/R48yMOsWyGnRzPLuD2/2pXjEPSF2wXBjTEdGa/Pjn0JPPYTEORqtUngFwX+uNWYq+MK6TWvUnuWkUZODy54E+VyL11KEjHFQQ54tq+/O5l9hshLK+RR8IQi9GthUE22s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723085785; c=relaxed/simple;
	bh=Y0qihl7uiaDk44cy4LssYOH3EfcASHEwabMUKWvTUPA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WxVfWH6PBG2glVlAy82UBUI2a4WL4g3wfdcylf2SxYxObNyI2trqyDS29CK8Tqo5527/qnbjoD1UgfWi4S+SWU8391kr0OmpsNxuEFZa2pv0t65Dh3W/s960akLlFQ3wzGoybHl7KgxyVBwyj70P9YvzderJNekUYhjiwetv/Bs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ADtjyq1t; arc=fail smtp.client-ip=40.107.20.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ADtjyq1t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2sI8r2K/V1zu0lVCl4+MhWofLv85osZK3Z7gxWcFtSiFdXM2UKBaZ3T9ly9oyqBqoXwsq03yIy9WLvHlnlxcOEtpOApkk8v6rRuKfOJW47AB2/m/03UVqkYTSN7o4t/iGuu/X1QOCYs+XSfJpxSwykLuhlUPobXYAuIUUG9WQ7jbQKMVACeW/HilIGxeiWuzF+p7ApMATC23OF7IBnER8FD11YaLLGeMPTuOgRV9qbAF5CSf4uikPtw7ia9L8k14z5tp/e20yI3R+bLTy497/EblgRBYW86MKPPnVOGtnxtbT6eVz62vrjjIV+qIqyP46TI5xcwq3j4XoF75biGKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2D/xpM5aSsTHglW7M8kStLq5H2JjF57SbatiIvz3zww=;
 b=AC/gzj4Y28iFl+ennlSQ0O8VP9ImNHz2hDKfebyYxgUVaajgcxRAVVKpubmMGtA68wpKlG9UOcy2+Jo/P+OWfcboDimm9WXlAoZ7MMy7v9GoYHUxMZ4MEyjE2fsv6FPBW8w+rUfqwSMv6CsxhdZv+0sv53sdp5T5M8HAe4cOzfm3ewSwazA+AD0OfSnJ65R3KaDs09/nW5frVxNSBzV/ySFem86JU4XrQqkcKZ4p3fUxwxcVrhG2ljW2NZWV9BIrb2fiZqKfO5Z+1+wrDp7JT2+NbqDWRBLjO0eNhIDbNhkC4uXhSPA63/qVuoBwhpvA6aY97kcqIm3oor4347twFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2D/xpM5aSsTHglW7M8kStLq5H2JjF57SbatiIvz3zww=;
 b=ADtjyq1tOQsEQTRahWIz8MjaFdTi+1VBFJDtxO7E8BNNv9ydDWEQ1bHjGEXmQ0LRdsGj8bSjeFGeUpX5Io7BXhZjJZgM3u5UWjUsB3KZkrzqXxRzuUoq98VjJNcr/DiLBqrz79hCsUZ3ta/0djj7kAkifug6Vy0N1qxE3lzo4MnPnrSjsp8L6QL0ZhcqL+JPd6eC5rO3zYTZy09E5XCW0+4O7Mnm5hvevkEsJoXclb1rgBqfMw50rpr1rZa/ocPYdmt1okiBUiTT2sW7VejWiq+jPHqwnrp/wDaqFM9N+pnZpleMEdG4xFRMjP5iNbci6zkEtPrezwkrz8EdNOwSeA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.12; Thu, 8 Aug
 2024 02:56:20 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7784.020; Thu, 8 Aug 2024
 02:56:20 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Frank Li <frank.li@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Hongxing Zhu <hongxing.zhu@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Jacky Bai <ping.bai@nxp.com>
Subject: RE: [PATCH 6/6] remoteproc: imx_rproc: handle system off for i.MX7ULP
Thread-Topic: [PATCH 6/6] remoteproc: imx_rproc: handle system off for
 i.MX7ULP
Thread-Index: AQHa1DUsiY8DOm+RC0yDPuGDdRt/WbIZRm0AgAOMwbA=
Date: Thu, 8 Aug 2024 02:56:20 +0000
Message-ID:
 <PAXPR04MB8459FA9E502510F906D2880588B92@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com>
 <20240712-imx_rproc-v1-6-7bcf6732d328@nxp.com>
 <ZrE4Qnk2UOCGpFv1@lizhi-Precision-Tower-5810>
In-Reply-To: <ZrE4Qnk2UOCGpFv1@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PAXPR04MB8254:EE_
x-ms-office365-filtering-correlation-id: 0b6eca90-2141-4bb6-cfd8-08dcb755ae58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?efvbf+XMs4KBRh3uEh7vY8W9rbo3Ppz5PUkVqwSynjnsv8Mr94LYz+RCL6d8?=
 =?us-ascii?Q?Z1y3eODDaCje/M2gGZmW/faCgR/5uUoOTiTYlz9sEvTbwHujsBuqvdgG/D9m?=
 =?us-ascii?Q?WBfTfOeUrTTzY6X0SZzsr4g8YbnYiei/29Sw+Cz/Ch5lmI9jYbuii+kAn5HQ?=
 =?us-ascii?Q?bY9R/DnlyklnBVUpRBodGOllow8xUmPdTEwhK5gWY3wdDz9f27CFpQkCUF1E?=
 =?us-ascii?Q?oFCWwaqB5nssV/rz4xDkEnQToUsSE1nFjKjPNllseKulY0k4dnx4COCyKtnZ?=
 =?us-ascii?Q?UeSDiwXMOJVfXE0+kWQJl89LaMh0oJVk9IjYV3r2wE6y2w2KzU+EhCvqeZuh?=
 =?us-ascii?Q?6BinoIVm2ZHRUXjwM/nZD5Cyx/pCt8Cw5C4oMiaxNuKYjHofGwlpVbo/lkPp?=
 =?us-ascii?Q?zwQkYTc8uVBoKZ/xRyBp4U2a74tAaDxoc+I+QcKImOBiU8+jwhNEFUnmtt9X?=
 =?us-ascii?Q?ht7dXMyhDFAj5M1jqQqEyILZoTQBtjZme3D8zM9Cm82f7FcE6g+5Ol1s7BJv?=
 =?us-ascii?Q?3PdLdGLYMaUgZ/pw8Pqj4npvqwl+yLFGxgKoDZ+HAtB4IqO0f74PTKph7luI?=
 =?us-ascii?Q?QlLl0ifukUoW4uU2lYjwY7n61By++zxZFsc8kNY8JF+0zJLMuiImJdg/NVzL?=
 =?us-ascii?Q?HVvbajwYhBI6fc8v1XnK9g7eOelvBvwsxAg2rGYBePucnJMkA6AXy4Y8wZZP?=
 =?us-ascii?Q?+bFmE892Rs+92vQBgNZiC3QPTqX6qSIfQiRiL7kpne1hkT5C3WGL3uPFW1U8?=
 =?us-ascii?Q?PInKl1nJX40s7ialEVKE8MwKtfIREO0FVIkIup6T/Lbd4DReaxvJcAisE+Qy?=
 =?us-ascii?Q?kd7Tz1yuMM708nbGn6D54w12L9KyqfKcHD86nFUZvUmwb2zPrRaKc4FBjCzL?=
 =?us-ascii?Q?8NS8FuyWu3tyKluDrll7TTxEAJbpxdTalIm5PRzWyv34EyD9L6w+yMd9EqkC?=
 =?us-ascii?Q?sHO74EoQvYc++T51lWKROqMmfpGGfEuNqVNWVPpxX1JGJNmPoosFQn6FDfpc?=
 =?us-ascii?Q?pfb0NlDGiit0N54LHAhNi17h9r5QH+kXxLIPy08+9fq6+7WdF/HaT3T/ZuUl?=
 =?us-ascii?Q?/6PkyWvvZbnQb9dXUeFp9sgf3OCnnHGJL75zvMt3GlrV6Dl7Ohq3dDM3JTMt?=
 =?us-ascii?Q?OKHCuM5iE7g1VgJFeNZU3aYGLGznw5ToRBA/lNIk/01JFnnKMFBpR6h+835D?=
 =?us-ascii?Q?rX0OmUuJ5E3EkLLptDgQsTA6tu1IEuPY8lAJdg+mziMK62jWhs2CZPXaM5k5?=
 =?us-ascii?Q?h/9eNJCHnFBnaASJztZdnmQ1ceQWWpkXebMXpocIE0o2oH2fpHLI8Tb8711y?=
 =?us-ascii?Q?kJkNrmnyG+T8YN7Fo18MPU2Ie8aaa4hE7HkvBi/1HJH47rmw1kh42/+0bAFb?=
 =?us-ascii?Q?FZ46nTXtHIEDLTYgICxpgLuxwk4A5p4LU7htFMqd/1tDthw5aQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6J1Oe9xEmeE0zLmn0p31pnS6SJtuVfXAOajrtSTvHd8mQISM3aMcWUX2Fb4J?=
 =?us-ascii?Q?tBRJau3vVL1mYUH9vJD/nGpnW/Wq7NmFyOFpd4xRxEoAeKiTBvTbL/XsATib?=
 =?us-ascii?Q?keHx2UylXev94AWpgqimSpcOaTjtKnoepVeG0itTI7eTSMf1z4WeIwFah/fr?=
 =?us-ascii?Q?gGjw5SucTA2cd4Eyhgch26QKK03sBeFo1xu+k3tp5DSWm+kzM0OQGvPQw0Gt?=
 =?us-ascii?Q?Ogs8VOpmBopWoH+FaRIAtVvqrkeK3SGCehLclOw85xxSyBuQ36GIkfgIgAnB?=
 =?us-ascii?Q?HmRnMWqk6h4ge9z02BxlScSk4plL1wEYICb3RbPOf48sNPZrfr0OoAoV1R8P?=
 =?us-ascii?Q?H46hgnzChb03aMEaeam26OqCLf/lD0rLwVfJbz3DvqybqYiiOXotuIlnKKk9?=
 =?us-ascii?Q?IPzhBIijawaJw+Me7KhtRuLOeaNjwQ14X+2mug37vYnrcD8cxHaObpWenNqn?=
 =?us-ascii?Q?TB80pNwY7vkPHdaZ75rFxBVstoWmrB1CU4z+bRhbt5SMH59F9BK6lbUsfSvT?=
 =?us-ascii?Q?D204ze+i6nbJj18/+64dhee1/mN//Zt5V5ew+gyOcIsVQ+gq9gIgPV++c9Lf?=
 =?us-ascii?Q?2pNGJ8mhrV8h+TD/7K7/d5sG7Di5ivg3iQQDsf5M1zOxq1LgBa70I6zJegSC?=
 =?us-ascii?Q?SviT8OkKMX0e06xtuKAvbI6Cy1PfiXtv68IqlPCAvK+W1APKHOEGQ8LRbJ3v?=
 =?us-ascii?Q?Pd5clXj29v/ABNu9Mc9Kc5wL/S5W3BKQNL0lWyhMF+oHJ47wsp9m2Qwiqy1/?=
 =?us-ascii?Q?DK/Trs+zXviygVaiJwNu0qnKJr5syKRiMs0Ch5BjD6j0vwnx6y5a4pXYqwNf?=
 =?us-ascii?Q?LKuO3Gi8SrBlDkakuVpD9Dc+VNr7dohIL/n0aUS6ut/dGV8rBdk6z9s3923O?=
 =?us-ascii?Q?9EpM19CMdc6r9GM1GtBdESglFF/7I1TrcfAFlCAJ4uqdEpiSMacKszsW/TTl?=
 =?us-ascii?Q?f+IQwRoQWpRdf5VDexPntlWx/Kn5dg9MRupufUfzvZRPTS7LJkTncneYEZeR?=
 =?us-ascii?Q?mZtNXj4vTxlJNgimuvGQkdZUKx/JcouzkSpO+1J2DumPOG11zqeS3vQQEbz7?=
 =?us-ascii?Q?LZV/ABbalgZEDbRbmi/3/aKbZZJJNNTty8t5aNXbRR/OGw0L+ALuFVpA7OZw?=
 =?us-ascii?Q?LRab5q/DQiy1Q+GzGiTPOjMs0ZsEczMLZkTCxAhAOQvzIfq3G8F3J8KQhWjR?=
 =?us-ascii?Q?m3nDKECk0KMyJwV+vx06sB2YY9/I5Ib9k2JQkvEDMVtesgs7Bf9ZKD5iQPZs?=
 =?us-ascii?Q?0LiyoDuc1MpqYxQo4/qcsv2lM4kCajf4SDR1hnv14l0REldw4nz/ISrbbosz?=
 =?us-ascii?Q?L2hLs43D8FlSfPevjFr2HgKwRRMfyPjhoB3mBgM1SiubE0mJwggXzEhdl3/J?=
 =?us-ascii?Q?bvcY+xY2FCUBhVqACU1zfEc1IKkLIOEthwdFfXLxaOAvWzn+ipvcl9Fh1syi?=
 =?us-ascii?Q?2VbsLGOZIRwYQTm63YhtnOW3Om27eyxmv8M+nb+dq9jIQrWjuS+/s66IT+QZ?=
 =?us-ascii?Q?K5oVB9oqm7hhz5Ouh2ZTIC9CjUBWljq9QKorRc8N0L9wvluIqVD8ZUVjNIo3?=
 =?us-ascii?Q?5Nto/wZQxRbPzn0jbw8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6eca90-2141-4bb6-cfd8-08dcb755ae58
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 02:56:20.4368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dy6z5J/EttPoA7dwu6Pg3c2bm6WsaXHRNc3fp5NQ4uZST49T0XsHTU/C4udsyxm7e8OXKciGLV0V3Pk2PjwevA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8254

> Subject: Re: [PATCH 6/6] remoteproc: imx_rproc: handle system off for
> i.MX7ULP
>=20
> On Fri, Jul 12, 2024 at 04:34:59PM +0800, Peng Fan (OSS) wrote:
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
> > Reviewed-by: Jacky Bai <ping.bai@nxp.com>
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
>=20
> I don't suggest check compatible string. It'd better add a field  in
> imx_rproc_dcfg, such as need_sys_off
>=20
> 	if (dcfg->need_sys_off) {
> 		...
> 	}
>=20
> If there are new compatible string added, just need set need_sys_off to
> true in driver data.

Could we delay the change when there is really new chips need this?
The downstream commit time is " Date:   Tue Dec 6 17:10:14 2022",
In the past days, I not see other platforms require this.

Mathieu, which do you prefer? add need_sys_off or keep current
approach?

Thanks,
Peng.

>=20
> Frank
>=20
> > +		ret =3D devm_register_sys_off_handler(dev,
> SYS_OFF_MODE_POWER_OFF_PREPARE,
> > +
> SYS_OFF_PRIO_DEFAULT,
> > +
> imx_rproc_sys_off_handler, rproc);
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
