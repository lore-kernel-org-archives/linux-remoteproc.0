Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013001.outbound.protection.outlook.com [52.101.83.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428162EA489;
	Thu, 21 Aug 2025 18:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755802279; cv=fail; b=fbBlTr1zurQTRZxM5LW1SdHIHAOZCvLYeF/46TYPFIfQjuZH5A5MFAFTf8xKD5+WMrfV5/MS+LTU+2wEseJxuqC2+Xye4aQERZKEFN7MQpouaP4FrIWIgUnfg1vWGgdep7Gr86S946YrLKxzDLeDCuDyt9teC0SYI3XLO8cxr9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755802279; c=relaxed/simple;
	bh=Xe1RPqId9kcXg/cRPz6rBYqx94qzCBjTetJkbgZ5DWc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QUfv8DydTqvaQxqao2W7fuakvw6z5z5uTx9wh0FNEBz5SwtS03wPjZa2PRXX02qiyMcFA1aIpmXscHkg09pqdbp9miE2hsl2MNAdCCjPQbGgwen9vI2jVNaqb5X2MQi0poKK5AhqPiZDt3vOoxLyBL6ogdc/EcQA6ATu1V1o6qQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RfdTez8l; arc=fail smtp.client-ip=52.101.83.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RfdTez8l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHmCO7YIjFv/tAAPz/qduRMKoeXHnNcI3K7cLaTr319rYqJ5nW6VIFhqvhe6L0iAiiXxHGmTzoHAxA2vvFzHdhl3Gz9g5HxjYyM3boZEqic0S0hOSxH50ObQmQipODy6ZD5FLXmfXSagbbp/KFCIDQbZObvVhsnq5AbE+3cQju8Ri4omMJgXDD37o4sRimVk8RyuqvwVHvEwyseDtIuRXi88mxhHZDYq3sm7lvMvsirG+ms8SbFiVhda+7jdDo1T2RceTWd+Ka6yX3NLf3MM/T4ZkxIjuT5AHW8lX4qlyACwADviF2wgDIXcEFUOYhcfyks4+OimhzYZwM3kxb8aAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGKY2hA5xBGtQjMN4MR89Aka15WMkb3ugNNOfDU1qjw=;
 b=Fg7pR+Q90ruh0ncXq6Nz6ChO1+bWHV6Iru9VnpkmCFSVP3NOmANSTwdBeVutLd7nOLQLkkZiqzMud+NM5k/WV1vIS1YyEnuQHfzMM1LBZ0MlOXgJiYnTa2glzPT6LHbTEGbgSmp0BOqhospsaQ3zxcX7NKJWR4S9774vGJ+LMD0OCTnhQjk1VfZ9QfHT1+DbCHXj9C1MrdMODTVHi784P70hZlychOTRuubeNhMoW3BDxqQxgN9TgS4/xBqIqWjCGxQZB+Nc+jM2RUYn9fvGhWbMLx3nZnXfPIufD2rrroleA9iyhnPW1rEqxap78yxK7RS+mtZnctCqFNU7RKkFWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aGKY2hA5xBGtQjMN4MR89Aka15WMkb3ugNNOfDU1qjw=;
 b=RfdTez8lfklr1/A5LOY/5fqAlSJDIYihaoyA8CJRKf8p/056PXzahw9W8oNnuWkw4UjbOHkIeyGUGw5p1RMNuSP/7GG6rN0kIDxjiIdmZC2Rcg4fnjmz11bhhtrpSYVI/qgIWVYESTfA46mZk+H0yDi+rL7SEMJOao+eFVvUANeT1BRJfcjJYdHaI0KgemVkN3AN6mXM5OT+Wdzpzm5OJsRhVpmV8mH9yCjVxTGxRgYX+i0wzcLF8NLXb9Y/EUMgW8fNI1rnWLkYtS7oshrd28o7PpPbfkgLflyCL8/WoPaJ6sMo2O5Orhq2zYV6+7RgsYlS8u4Lv10NbRdCNz8GNw==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM9PR04MB7506.eurprd04.prod.outlook.com (2603:10a6:20b:281::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 18:51:13 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%7]) with mapi id 15.20.9052.011; Thu, 21 Aug 2025
 18:51:13 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Linus Walleij
	<linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng
 Fan <peng.fan@nxp.com>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 2/4] remoteproc: imx_rproc: Populate devices under "rpmsg"
 subnode
Thread-Topic: [PATCH 2/4] remoteproc: imx_rproc: Populate devices under
 "rpmsg" subnode
Thread-Index: AQHcEIEFT9JO9Uj+9kGFYXWYyzQfcrRs9UUAgACAxTA=
Date: Thu, 21 Aug 2025 18:51:12 +0000
Message-ID:
 <PAXPR04MB918572D8E2C4C085E4D8E43C8932A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20250818204420.794554-1-shenwei.wang@nxp.com>
 <20250818204420.794554-3-shenwei.wang@nxp.com>
 <20250821110252.GC19763@nxa18884-linux.ap.freescale.net>
In-Reply-To: <20250821110252.GC19763@nxa18884-linux.ap.freescale.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AM9PR04MB7506:EE_
x-ms-office365-filtering-correlation-id: e3705bbc-4f81-4405-c0cf-08dde0e3b376
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?I1StD768vzDMQed8M6aoS5DkJR+HevejW/bXH15I46L6T/clkDkZOo3n7jUq?=
 =?us-ascii?Q?fyXA4NbK5IDz4nhSM0yjvLcsYWFfFVFt/1jTdTmlkbuipi0mVT/XM9iAEx+H?=
 =?us-ascii?Q?psCrpFGt71NBOxkpQXgiNy6soLzb//n/V8oP7eU+t5Ek9wO+tu2jMTXpBgfB?=
 =?us-ascii?Q?o+e191UmipM2OnrfE4On/ix8JNkFqW2YyzgeZsyBPk0+aTctJDIAVr5kDRT0?=
 =?us-ascii?Q?WwsQNR5kgbkKSXlA0IyLEHzcd2G6dp/xNI5Me8NGUe5N+XsKobFWl1ZkUQ+K?=
 =?us-ascii?Q?19XoYMkJAg/jCYeN0SpRDXHYntWERW95Vrx9KamNfJ8OjQsEfjqmX/cbR62D?=
 =?us-ascii?Q?94PkIgM3S7CxnsxRx7CRfDMB+GI4uFQre6jiHzte5ZElfdrL59L0wTtTqQWe?=
 =?us-ascii?Q?guTVppFVENUS2C+z1oGZF3o1APWcEArRe4c09cnwrkEewruq+NBQCDVUBVTK?=
 =?us-ascii?Q?xxI20bk87HL3QXzsBbITF4fznIhmDqqr/iCUw1guFeDr2WOum1Pigxci609L?=
 =?us-ascii?Q?Fud+h34P9DSCw1YPjg+YuQ/BaAmgQyVJ801qysgrX+6dzVCEudE6u8H5po+x?=
 =?us-ascii?Q?HxGqi3pdpNq6R7vNay5d4EBubkDtuqm8tNyh9FRwVseuGa+UC4KbED1ZvBsB?=
 =?us-ascii?Q?aZK4+2h7R+drr6EyuRjDE+iSmyMxf0KDNzZKuAkcGFYij5ANmHCqz7A6/m2L?=
 =?us-ascii?Q?+DZb0sVofliL75SKBN7XxHfpXU8a5dAJSNIeRojB0C0wSeXIA/dIqNvYo4K6?=
 =?us-ascii?Q?/ec5ZtV/zv5xmphTsh0be1Ak35vudjgID55xGCKlTsmhpdgK4tCWKZdOqyjI?=
 =?us-ascii?Q?oLlK2gXeaZ3xlO/HxjH5HlbOCqNxXhsr9WCvM05IuvxPokrsbS95a7RPjmRJ?=
 =?us-ascii?Q?p+lk/3wqMl4Pejvv+EGDt4OQYxfafjAPnagnxCoWougdO3CySg+lLD2sB1p9?=
 =?us-ascii?Q?+VUWnMOuXckLadNOTu8odFkScsExG8EjmLxvNL5uEQv63JZJ+19AoO6BjpZx?=
 =?us-ascii?Q?6RlL8pkPiG8Z/afKzauOS3PBtMw6vxmJPsPz6Shfo/XTyABnO/T8XVLXtkYL?=
 =?us-ascii?Q?+ESc6fZDiZ4/xPFFHN0etZfu0twG1wqPYbS+xhRnXzVa/WItW6S562saonNL?=
 =?us-ascii?Q?Zv/33HfEGIPbVlGJJ6lSUJpmxfIYQnbUpllRWGh2rqpL1WoTiDST0xmWgUEM?=
 =?us-ascii?Q?O0oq0TTTMJccu2etmMuXbPXSGzkQYVNTM26ksnT+z+qcWWI8TIzQGxnt9NQd?=
 =?us-ascii?Q?Naao6f788ssuZpREu+Na1JRAt9dEzD4gEjN53ur1mVFcDcMz37te2YUt8EIq?=
 =?us-ascii?Q?izmVO/w7uyxD9jcZ9sZGt3GSIY//o5tyZ2nux3N3J2dlnI+LoeAO81Usf7eH?=
 =?us-ascii?Q?aJmFV3K6O8HsZRgnmV15IrliAOOqKCHGFLv1rron42OViwAyVSKxlAx51zng?=
 =?us-ascii?Q?aEPC0DPzewCaaN4I1L2N5yJe13Vvslvep6iFcyhNsWDYJEM0wYrnqw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Otrlw738U8ZOkaB+mQy8X4y411zxayIrnydypl139TnYlfCcrKhiJfw6UMi9?=
 =?us-ascii?Q?fDu+Vfv778mU3StK5v4LHjNM9RJpezn/8Z7hI76wYeNefnS72FAIvKs8vihl?=
 =?us-ascii?Q?qZURKkNlzUYlu6Jh8NfS8h1QXLXms4awZOPQX5UJz7T7BQ6Kd3KKFmg+CqH4?=
 =?us-ascii?Q?V5SIsKtfS7idtspVTOTWJgFdr2JtPXwBtaM9S3nBbRZIXSLVFlr4u9eN/bss?=
 =?us-ascii?Q?kwbfI9SMGgZO+am/jGPoZhRIT57dVtoqCPWfa6WYHzZjIds7cqkMBeihJr5Z?=
 =?us-ascii?Q?F5zNhRX1LWahOk8OffxAwGT9o+gCtJy/yU+amnxkwm5v6450ca3CiodzZuH4?=
 =?us-ascii?Q?rFddr2K0c9Uz+Azw+oW+1yngQ9ZplnvIG/E4gXrCbKLR2SiC+zCGMqe8kkpU?=
 =?us-ascii?Q?3l2xKCPECux4LiIBVKktTGk8F0dk86uLDpxJC5fSb+l2EkHeVdHzB2ahqKzi?=
 =?us-ascii?Q?9cIwUbv1Qlp4uUb6Ojm5/ZPnLnZkali1W983DHgvRTzeDU+ODlqzG9aeV/FK?=
 =?us-ascii?Q?s3vHF/qJHiPYR5YmM8hC7ssuIt6SNsdh8G9850BD2tirlu+jAYmn5Q0Alrtw?=
 =?us-ascii?Q?l5JyL02I6r5ZJq+Qnjs2HvSk+TeXLgj8GxuiuyEWzvTzaumdBkByuJsZwi/f?=
 =?us-ascii?Q?a4F6NkRvBCGSAU6EkE5op345yRnPrBb+X9BkYYQf5G4TAyBTanbYgdzWojaP?=
 =?us-ascii?Q?127UyR2Zn9uPL7HlqXU8+SS0v2fV0zdNmTsD+frQjadwEFPQOcrFVmndE5CC?=
 =?us-ascii?Q?F4YbSmKi35nLJiVc6H/TGCh3Aaqi5Wjdgceqmzqn6pg0pJDMzCF4CXz+cv98?=
 =?us-ascii?Q?oB4ptBTJoZG/P77lz3sA1FRbpzw5jimhWU2FuHfqFYRzsUgjpKrBVzFu5nfp?=
 =?us-ascii?Q?CeyFFJHKAk/TmPmN8iKB86pGLBF+nFF1Q7XpD2Qn+Bd09yclCW49VMZry+8o?=
 =?us-ascii?Q?dfveiVLdvsphvstOAnGvPSIZpNErZQOZpipLRrHl9yJd4B1PS1amJ1Y6oAxW?=
 =?us-ascii?Q?oyay/jZH0lZ3VsnAeo7KWTHu4ib5im+E/WDYL6sCL8QTZ4imWAs/AEnesFFg?=
 =?us-ascii?Q?Cab92pMFxgQqCOAzsPOO1ieL2l0cnF9EssdQjQR9Fmu16AlHuQzp5BGvo3vD?=
 =?us-ascii?Q?HklvnpKa2jiWkCwrL0T6yanFOb0hzUNa46DYnqKB8hMKjf/rLi67AYrG7LUy?=
 =?us-ascii?Q?CEVD0xnpr8i9pfjNhe5ItCmPcJniv+gS5iVP3wPvNrQbRmWEjUbUoZSw2XIf?=
 =?us-ascii?Q?S3fRPmCp25C8eU0aCOtC0mtKyGLLnOLCil629CTFV+Ks8lolvlaE+fEKmnk4?=
 =?us-ascii?Q?CkyZv5CM4B6qCs0fvTSbRmysrQnGe4sU60AjY/Xp7fQZJjazZOc9Q3pjHebh?=
 =?us-ascii?Q?Xe69FGvJ6U+FHo4tYjuPgj/AHvSG0cfd0Ww0+e1wjEca8p1OGcn+rKhNqKNK?=
 =?us-ascii?Q?N4LMzcLhIJ/afa96pUZ6iVJzJ31tJofA9KsEfwhxMwH9aWdj+wbE9SgUs9yL?=
 =?us-ascii?Q?AkeCJtbuql0t8yOnxl8eWaPSJmPAdfZkVigscmX8OL8U3angyAEz8uNciV8V?=
 =?us-ascii?Q?0RWa+5gt6XjdV9iEyII=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3705bbc-4f81-4405-c0cf-08dde0e3b376
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 18:51:12.9188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcCZmSNMYwjXusIpt4Ygo+Gt2PpYPO/nMFLUHrpbVcZ0KDdW6mJQr441s20FGQVfuexGRbmlx0TMhnQSN9K75Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7506



> -----Original Message-----
> From: Peng Fan (OSS) <peng.fan@oss.nxp.com>
> Sent: Thursday, August 21, 2025 6:03 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> <mathieu.poirier@linaro.org>; Rob Herring <robh@kernel.org>; Krzysztof
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Shawn
> Guo <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>; Linus
> Walleij <linus.walleij@linaro.org>; Bartosz Golaszewski <brgl@bgdev.pl>;
> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>; linux-
> remoteproc@vger.kernel.org; devicetree@vger.kernel.org; imx@lists.linux.d=
ev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; dl-li=
nux-imx
> <linux-imx@nxp.com>
> Subject: Re: [PATCH 2/4] remoteproc: imx_rproc: Populate devices under
> "rpmsg" subnode
> >
> > #include "imx_rproc.h"
> >@@ -1084,6 +1088,126 @@ static int imx_rproc_sys_off_handler(struct
> sys_off_data *data)
> > 	return NOTIFY_DONE;
> > }
> >
>=20
> Just wonder could the changes be moved to drivers/rpmsg?

Since the DTS node is under imx_rproc, the most straightforward approach is=
 to implement the=20
feature here. Moving the implementation to drivers/rpmsg would introduce ad=
ditional complexity
and might be less direct.

Thanks,
Shenwei

>=20
> >+struct imx_rpmsg_driver {
> >+	struct rpmsg_driver rpdrv;
> >+	void *driver_data;
> >+};
> >+
> >+	i =3D drvdata->map_idx;
> >+	if (i >=3D ARRAY_SIZE(channel_device_map))
> >+		return -ENODEV;
> >+
> >+	auxdata =3D devm_kzalloc(dev, sizeof(*auxdata)*2, GFP_KERNEL);
> >+	if (!auxdata)
> >+		return -ENOMEM;
> >+
> >+	u8 major;
> >+	u8 minor;
> >+	u8 type;
> >+	u8 cmd;
> >+	u8 reserved[5];
> >+} __packed;
>=20
> A comment should be added to describe each member.
>=20
> Regards,
> Peng
