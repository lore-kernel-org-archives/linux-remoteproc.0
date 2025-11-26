Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013026.outbound.protection.outlook.com [52.101.72.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA13531987D;
	Wed, 26 Nov 2025 21:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764193605; cv=fail; b=huHltpfjWKcDWzVpQc33NNuO+Ng+wl22oFVgMPVXnKQ8xb192GI2rrFzhF4ezSjERMgNrdB3dlDeWLNQu8uusurLt7Khi4XxVQZR2xJDj+0c8lg9jK67RrIjH1b7uQSz75gcR1lVFSOGLj1WHfv7JSzdV3VpSJs9knKxFz+pezQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764193605; c=relaxed/simple;
	bh=oHvwyyJ1NCdWGPqydKQ/iAndilJWpWqA7GxgM0t1jvg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CG63fpwp3e6y+UHZBBLCwO9HFy7ebZfDNNCsioDjgiBY3igzybnFg/4KsataBxRRWIL7146u/VjWzRRDld87vqPsQ0gxl0iiTeCRcB5PTvSuuC3sI2An3LN2QDl49iCFmNDnHnNsqQ6Svxzcit/9gJRHaP9FZver2oIhTijCXlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eEqoF6T3; arc=fail smtp.client-ip=52.101.72.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eEqoF6T3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uuZLKrMPY9qBb7qycHq3zp4kJ6R9V9XCFTGlyQ1T2HuUJ7FMo4LwW6a01ISlXmxu3TjRA7DiaKifqR4bPC9/9a7jrNiTf2oytgPXQgQSn6HHOcbb7uH66eW2o08JotlZnC7pmOOgjsSZuaRQiikl4uO/vrkYCNaLvbWY4D8bDqNQ2nmRrJaObJB7+Xm27qEvTnbS5bkxkAp/QJzTJpdtw1x2mo3SoAZt/J8+o5EUQBTCfYLgTLpO3jFCx7VtCWHokoburcXpp7AKmIwhQhnLa4yzGLpYRYgtM7sgGNgqitR5/L8iKEyoDbtU8agzCGLV3tVCKfj3txpL/uT3CndoRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DAH7TSllJqLzrSEto1R+ETCUq+g62co/0lC4UO36/ac=;
 b=n9E5ILGGcOczFJiRSLCVIXf3fqOI/LPR1TUkm/RqAI7QA4pJr6ZoFYR/QOe0xQQ49R59bR+a9vZNSmo7lxQ7sn4qfTebqyoFd9rmVP3MLpHW7qZHAH8eTU+s1IvR53kHAClqxS4ZchLkAvODwQkLYePmW1Q4EfpjSOycKtJNV5+plQTU6uRR5ZWJaYna6TvJ+zHciDnyueQEcZvzdyfPiw118hRxhjjVPp7BOuLgOBMOTEAFRUiq3F3YsQ15IalK4CaGXSMb1512RH/VVvNcf3L9P3gDGZzDT5mIpOMcbVaNPykNZ7Co6wkEkIOCWRAhzqLOMPNBiGMs0aNzM+Ghng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAH7TSllJqLzrSEto1R+ETCUq+g62co/0lC4UO36/ac=;
 b=eEqoF6T3r4BT2SqO2uwSRxoHLwXhp2gd5zhwZ2C5bdh09I2tRDqTKm5LvUMnOZpADi2ZPXfgMYKCsiEhfy3nfsHpxb0BWlBUtlesI72IrPi+rW4wsfBnNfw4tzaaBwkywmxaKlyuf/yLYiGbDE1VGDkUC2NqXnbDYhFLmg8T/Ew7GiWnr0QByXqaUBPmMWO32RUXSMsc+qavk2y//HgpTkuUON8kXehwNDH9UDrVY5o0/L3q3N0+vCSXQGcJ8+BNGThsh40jsBORuxe7AJJxMm91siOx8+07eP6GDtI61vkBGUzGhm3FNU2TRSjHMsg/9PpgFeRzEPBflTdqNg80/w==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PA1PR04MB10208.eurprd04.prod.outlook.com (2603:10a6:102:454::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 21:46:39 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 21:46:38 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v5 2/5] remoteproc: imx_rproc: Populate devices under
 "rpmsg" subnode
Thread-Topic: [PATCH v5 2/5] remoteproc: imx_rproc: Populate devices under
 "rpmsg" subnode
Thread-Index: AQHcXx4kXpDfv0IsNkKFKKfcxjW6HA==
Date: Wed, 26 Nov 2025 21:46:38 +0000
Message-ID:
 <PAXPR04MB91857863B163B3F38A26647389DEA@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-3-shenwei.wang@nxp.com> <aSdMufLCeqvVyKsp@p14s>
In-Reply-To: <aSdMufLCeqvVyKsp@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|PA1PR04MB10208:EE_
x-ms-office365-filtering-correlation-id: 69bd0c2c-fb35-4b94-8ec1-08de2d354773
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?bQ0ru9Oea48A2cbzCMtRmfxJLkEie70Upo67HO8fZTFrvplkzFSnI9+eVMG0?=
 =?us-ascii?Q?+6vz41NCyXRmf5U93a4I47k7Xc/3NuSJ70MULE007LezQLGsxpJWyq+JlBil?=
 =?us-ascii?Q?xFrocVgtIjD27VexQUj6X2plhav8Al3IELq8OenjAEW6DN+njA522i2a12Ra?=
 =?us-ascii?Q?vxrpUL5u4o3FIrhxH82a411ED7+XmduIr0bF/ZoBVfSFhC+oNusEPhDgWExD?=
 =?us-ascii?Q?rhZqxHqr02EpZBo0st4VcQpeJjTuT4Z683KATTj3fdgxGaMzZ/NKchJTgiwe?=
 =?us-ascii?Q?ZnT1gx0gbnVAp4fcRjgAIy71X9Ti6Md1VU7DofwjLrmNHxmrCZLnZnxmdJse?=
 =?us-ascii?Q?5lYfSIQ91H6BBxA/arf1/co/uyhJNQWsn2bDylLgV56GxsCXMrbI0napKc/T?=
 =?us-ascii?Q?bH+koVE6Sj/d/qloRSuxC8uinYiHJumM21RjeLYk+Xrdl52H1OJnOGHob45G?=
 =?us-ascii?Q?riKp0akZiW8cU/WmT1yWTRpYpiqZeL+jNsREF6HPuzRGyPn5Vuj5SiCufrVZ?=
 =?us-ascii?Q?6iijnWX/lDJmCIjp9b2FqmrYDmzheRVu7K4tC+s8aTLXRDmOFlnxYWLx8Cyj?=
 =?us-ascii?Q?rxLOxNjob0fmWrw0uCaQR/mqfQAW64uXMOrU2idB6boawNTWzvpEDO5pChOY?=
 =?us-ascii?Q?Ig1aS4wuwSLH9jv7P5YxhJCmnrYw+Vx/cnenM7by+a5xF55yHrTBIK3go3ru?=
 =?us-ascii?Q?MVmWndI/tW5W+3PNcnh4A/XEGoM5tkVdZ0ulO8XuO97xMz0WnkNajzU0RwIR?=
 =?us-ascii?Q?hfITML3EkJJ3WE6qJc0hquT9YOb/0YtULeKkdaEbvUVOIQEN8cuJ6PPpQhBr?=
 =?us-ascii?Q?KT0YgJHS2GzzsedzTltjGKX1tNQlejnz2zEYztHwH8e2R3qp6jsEnf+jltnm?=
 =?us-ascii?Q?mvqfSrEdMFZ3g3Qn/4KuefTWLPJSpxQVVlxetC/Al3bt8yUkbbkt85zURKKq?=
 =?us-ascii?Q?5FFzh5B9H5sIl5jWrnRNwfZmnuEfgevYqbq23NBP2I7da1HIG+1c+XwkO5wq?=
 =?us-ascii?Q?8tb0sR1T83aQgnn1XJC7QcNn81Gfz6pFyQJXSFueP3Lpax+xia9pW2mizESb?=
 =?us-ascii?Q?/26VMrwHv1xDwMjs41yup01s1w/1ug9QdMgJlHiocQUUgioDmxwkFJ73FfUS?=
 =?us-ascii?Q?vIDTlGoTkB72O3bt+G7OKgnRLz+0BpZmq7h1RD1QObXp/LBn18kTOh9tH4gP?=
 =?us-ascii?Q?9Cxw8Jw2u4NYn5ClRpx1J6esO4HzhJtDRkI1qlQL1FoBKnbhFiHtrfcEhieu?=
 =?us-ascii?Q?cXxrXmgPEcp+//i6DLwgQLqMjhPEk6KSfvC2Y9drVYXb/VAFXS77WJbaKZx4?=
 =?us-ascii?Q?+oEmucsN7h2Zhh9oqxL0+IOcuP79G/zmMs9PBQgmVkWIgqHgmYsjbZt8BwN6?=
 =?us-ascii?Q?GVSidz8fQH5MqF/qxuJr9qaHbSsdleyAMrIYJ4eUj8/L6rJxuXVWM+Pe7MOW?=
 =?us-ascii?Q?vGHIf5tFRCt0ZZTz68GL/wvd3/dA6chRLtVCjCHUsB+xgamuRVoY9b1j0RCq?=
 =?us-ascii?Q?ardqQ8HVhkeHTmUFYCBALHg0t+ebQ01sr8RQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?T5Dn0gC2Na07ul9ElNP9mu3R3I7ikTJwEEpinzchu+OcT2JU3D0++5iopEP2?=
 =?us-ascii?Q?P9PNqG+8yahrZJNx3JoFofPVvwbdKKq73mN8zcXDWKbUYM9G69aMmUIi2dF3?=
 =?us-ascii?Q?fYlAJa6K6Nuo6SQQjmRxzaek9HWd3SN61Gf16kDCxvL5G4WpJqD7nNeyTHKl?=
 =?us-ascii?Q?Qfh0JpKA3rzUEfMiv+IWZibN8oVTfFjFAMaucXGwLZtx8iiLobDDXQhRsahq?=
 =?us-ascii?Q?WW/i5vwO9HCi7wp+fsvXxqJXJml3vPN7Ew9DyikuagYnVN9vbooGa/Hw3OD1?=
 =?us-ascii?Q?Uw/FET+eHmBywd24M2to8HuZsyRYX06YBN6jqt6FW1w16Z4hpnhU7FJMmaa9?=
 =?us-ascii?Q?93dL2aqV7ngoDPf9kAHGPXpOY9xEQjWn9mDHx6G4o1/HFYQvYjV0MNbMgj0s?=
 =?us-ascii?Q?pJ32ElntN05i/lAJToa70S9a75nJoOEKvKWgLpCaolyEQ7BuNFagBm6ZbiOV?=
 =?us-ascii?Q?T+OfaMEvKGg8TCVNibhqkRTOuWcJBRgBEnJmN9RJ92qcG1u7qQEQOOlMQKTl?=
 =?us-ascii?Q?+yANptRhtn26Klg1KG+U8nf1jJlc8Lp4ygDD1owkoffVy0EewOMfiqqn6mp0?=
 =?us-ascii?Q?4f6EG3buuceAl4v0J1n9z1gzTT+uJ5FiU630uaeUw44EiwW/MqvnECjI40vt?=
 =?us-ascii?Q?ofkQEnACzsX/xhp4ynbKAU4YJuE1dESPb73jX3E1lAq0qcmIoprRAnoXfYtE?=
 =?us-ascii?Q?CCO8QBWnt2WN/C+eIg8v+FOJHryZYvzQNnWdp2FUToDFJSy0o2gVCQs2WUhh?=
 =?us-ascii?Q?Jhsv4qylS/mP3jmgbUCZCeqqRdwF/7eEvHSPwnkhgmRsTG7Noab7C56Vriyr?=
 =?us-ascii?Q?FsUaAyMsMYBZs48LPGV3K/pZqC1IPF2Cr9SjJGGNwga+EXxHToJlzE/rvhU1?=
 =?us-ascii?Q?rIxcoBsy1MsOx0C4DOe9giL88hbJhKYeAUmQ5HddH4b0shm+9JkD7KLpuYn9?=
 =?us-ascii?Q?P1G8SJr2Zu4VfVzBiO4hp2N8T03BuUNcoB0nwBd5Pr70Kb1IqAg/MATueNU3?=
 =?us-ascii?Q?haMzZTaeLfJhahbadbFO8TWnGn54JeegH1cAuDSHWiHDtDZuMgub215iHns8?=
 =?us-ascii?Q?H96zFEZWiiIdxMdh5kQEvh9AkRPyjIii4OPVY8wxzX8nUTuzoErULwd96jhs?=
 =?us-ascii?Q?gJxtLiEvJwNokDkAs0A78TThoE7vL2BqNujMWypLtRXvXvGvEJpLcnhuYrDK?=
 =?us-ascii?Q?J9F03IQco9m/YHkXdldVib96j+fnXU7HMhbfc0k/VpPhBaJ+0wuy63hb+vL7?=
 =?us-ascii?Q?wtspR7kXsYO3a3/xoJ/gF0mE9vyDYjkM3g/fIOLhSww7xlkwZPSQnbwsXNSm?=
 =?us-ascii?Q?4oWgX2F3zyzSJk6AhD4p1cOIsRuZOeuADj4Is7oH/Kg15aFLqLGLNcX7HOuS?=
 =?us-ascii?Q?9l/GtLlE5TNoCwQ5gdeq4aio7dKfCENEjXBg96RrrnMtM3Cwz0oFdvlzjoc0?=
 =?us-ascii?Q?hf3SsVCWlXi15OYH0NzvGzyBP3PXlOHDY4pBz2dNGabAXE2ryBLl9n/ZJU6y?=
 =?us-ascii?Q?okTbBJfdk67zsp0W2dAOstm5th0auXfQTYFkwfin6O9O5ekMvI9LMradcDi5?=
 =?us-ascii?Q?VlHb9iyWw/dmGpXfdO4l7V4MFGtt/7FEbb30n5hI?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 69bd0c2c-fb35-4b94-8ec1-08de2d354773
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2025 21:46:38.8021
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OeZhsfyH0kXhqoQyGncFY9xXPufnjbCkYaUvFzHFDfQ4P+fF7zz7QJWk/IjzVcO/Un0cmTwBIt1AfK1iHGBzMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10208



> -----Original Message-----
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> Sent: Wednesday, November 26, 2025 12:54 PM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Bjorn Andersson <andersson@kernel.org>; Rob Herring <robh@kernel.org>=
;
> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha Hauer
> <s.hauer@pengutronix.de>; Jonathan Corbet <corbet@lwn.net>; Linus Walleij
> <linus.walleij@linaro.org>; Bartosz Golaszewski <brgl@bgdev.pl>; Pengutro=
nix
> Kernel Team <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>;
> Peng Fan <peng.fan@nxp.com>; linux-remoteproc@vger.kernel.org;
> devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> doc@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: [EXT] Re: [PATCH v5 2/5] remoteproc: imx_rproc: Populate devices
> under "rpmsg" subnode
> > +
> > +     drvdata =3D dev_get_drvdata(&rpdev->dev);
> > +     if (drvdata && drvdata->rx_callback)
> > +             return drvdata->rx_callback(rpdev, data, len, priv,
> > + src);
> > +
> > +     return 0;
> > +}
> > +
> > +static void imx_rpmsg_endpoint_remove(struct rpmsg_device *rpdev) {
> > +     of_platform_depopulate(&rpdev->dev);
> > +}
> > +
> > +static int imx_rpmsg_endpoint_probe(struct rpmsg_device *rpdev) {
>=20
> Where does the rpmsg_device come from?  Usually there is a call to
> rpmsg_register_device() and I don't see it anywhere in this patchset.  I =
also don't
> see a link to the remote processor.  I can't continue with this set for a=
s long as I
> don't have this information.
>=20

It is in the function below named imx_of_rpmsg_register_rpdriver.

Thanks,
Shenwei

> > +
> > +static int imx_of_rpmsg_register_rpdriver(struct device_node *channel,
> > +                                       struct device *dev, int idx) {
> > +     struct imx_rpmsg_driver_data *driver_data;
> > +     struct imx_rpmsg_driver *rp_driver;
> > +     struct rpmsg_device_id *rpdev_id;
> > +
> > +     rpdev_id =3D devm_kzalloc(dev, sizeof(*rpdev_id) * 2, GFP_KERNEL)=
;
> > +     if (!rpdev_id)
> > +             return -ENOMEM;
> > +
> > +     strscpy(rpdev_id[0].name, channel_device_map[idx][0],
> > + RPMSG_NAME_SIZE);
> > +
> > +     rp_driver =3D devm_kzalloc(dev, sizeof(*rp_driver), GFP_KERNEL);
> > +     if (!rp_driver)
> > +             return -ENOMEM;
> > +
> > +     driver_data =3D devm_kzalloc(dev, sizeof(*driver_data), GFP_KERNE=
L);
> > +     if (!driver_data)
> > +             return -ENOMEM;
> > +
> > +     driver_data->rproc_name =3D dev->of_node->name;
> > +     driver_data->channel_node =3D channel;
> > +     driver_data->map_idx =3D idx;
> > +
> > +     rp_driver->rpdrv.drv.name =3D channel_device_map[idx][0];
> > +     rp_driver->rpdrv.id_table =3D rpdev_id;
> > +     rp_driver->rpdrv.probe =3D imx_rpmsg_endpoint_probe;
> > +     rp_driver->rpdrv.remove =3D imx_rpmsg_endpoint_remove;
> > +     rp_driver->rpdrv.callback =3D imx_rpmsg_endpoint_cb;
> > +     rp_driver->driver_data =3D driver_data;
> > +
> > +     register_rpmsg_driver(&rp_driver->rpdrv);
> > +
> > +     return 0;
> > +}
