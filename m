Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013004.outbound.protection.outlook.com [52.101.72.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491012D4818;
	Mon,  6 Oct 2025 14:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759761240; cv=fail; b=f8GGiGluSGDd2Iet8G2JsSqjWopgj0Ya9MWWzegf+4qaJJ5Xlupd3/JvaOeI007fM0R/uxANZwAmg5ig2oyh1FzYhO08M2lw/PkOEMV2reaeAXwOLPAh7HJL32nzyK2PwYHHKUjreZMVvH11ERNL5kzlSP5C1NXT8rwl6giZdPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759761240; c=relaxed/simple;
	bh=gkmRITcGCsEd00nK7wWMaTWnKvV8+jLxhmWQCafUG1c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iBzJQIcmcVE9axDpoSiVITWwi38MayXwj+iuYK3zHzQ+lYqwn51QujVhcrtzsP6Q8x+Bbtj3fHmn9giOl/8rZ2n8HZBLRaoXCOaCIlxnrmpOBwgiiz/DrznufQ7uCirKZ0MOYqI2W0YdRS1CwNtXGj5cDf7B4aVw0DepOTnLGB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gJlUlzXX; arc=fail smtp.client-ip=52.101.72.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gJlUlzXX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rzz7FYpP7smIwUDu4Wt8nj1Rkya+5F6r6hyniD1lsYbnfLKu28ixGpROwMJf/p/AP553W3FfyZeRSJyC6g1seR1JJAhEezK1jj9qC4Qmm/b5sMdRqWouPDOU/Do036R7+wJad4L8f7rflOUgDdFErUACRMxV7KBlrEaMIjuVwjRfSRLHqq38IynBmnJrcQGaHKnjSuZyaZfpL81IglScGqbPu90ek+r74z6udNqTY9Db2RrwCBHhv8cxYZF8S8Z7XjLnPXLWywWwKsUdqbGStbInmLhA04cy5ci0n1VgVSCYaGJBPWnK83QH+q++Dt88bl4Kx2J3bCbmoYOwrVr7+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkmRITcGCsEd00nK7wWMaTWnKvV8+jLxhmWQCafUG1c=;
 b=iH3xP1pj+gbrJO+MCXd0sNY3NOAlEZSc6Jkx3nPLZdfHWxKcNjXPBgau5ZrBPLmcw+J/E87Mwihtbu1fTDkIQLjt0DN/LwgXmqwB1gb+QAwpFM4BZafwM6xFGVO9SR0CbVJnkuMO8cFD+ACxzm6an5pq0WDR6Vu6clYJtCivSL/y9UQWBQGeSthG9daEIA8uO9te8vm5KeOER44YMdXXoxL50bvBTc4ugraA3yOqIQc4dJklMIbXMx2EyYEUgfljCHClu9VsUNK2D/Z8n9efaa6qQv5omDnFr1/VTcbkjfLC+evADON9fyrL0CHVslTYF8Y4Chru4tLElkq9Ewx3yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkmRITcGCsEd00nK7wWMaTWnKvV8+jLxhmWQCafUG1c=;
 b=gJlUlzXXPYk/InN68kAmyTeZ61P89B/enyeuqtJhadS8gP3rrARRab64l1DC7i1mc0FeYd24Co4as42ne5YEF3EWdLJrkzC2yBlX2ctrHOP8Qs1I6iVMJI7jTNwPuX6yG8RA8Ngi8qFnXmA+PZlT5HMQn9kUbOuyakbEeqb0kDkcqY15g+E/za4hcrNZ98ZUuDb4LRlXOvXNimLbIwBitbgUQZtQwCXys1wJaSIIKkydkkKqqhRRNlJSzp0WaGIR9RQ+N18AtW+tGYXmL1cRKyvNb/IRi9SFJEc4HcAbNuOt7r/n+jgGZm4SnVMBJw5SPWDKJXm5Tlt5NKE88Q6O1Q==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PA2PR04MB10121.eurprd04.prod.outlook.com (2603:10a6:102:408::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 14:33:50 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 14:33:50 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
	"openamp-rp@lists.openampproject.org" <openamp-rp@lists.openampproject.org>
Subject: Re: [PATCH v2 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Thread-Topic: [PATCH v2 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Thread-Index: AQHcNs47QlZV5Sbfy0motK7SwtSbjA==
Date: Mon, 6 Oct 2025 14:33:50 +0000
Message-ID:
 <PAXPR04MB91857A02029EB7F923C5767F89E3A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20250922200413.309707-1-shenwei.wang@nxp.com>
 <20250922200413.309707-4-shenwei.wang@nxp.com>
 <86bf1252-9b2b-4001-830d-2746403539e6@foss.st.com>
 <PAXPR04MB9185924ED129E87C77F34DCC89E4A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <5624965c-8d00-431b-92b4-cda4bf7cbd5b@foss.st.com>
In-Reply-To: <5624965c-8d00-431b-92b4-cda4bf7cbd5b@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|PA2PR04MB10121:EE_
x-ms-office365-filtering-correlation-id: bb2d9ca4-eca6-469c-e3b0-08de04e55dd7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|921020|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?NnuEq7kIfgNP+S3j+IUHH/5dfcO2EXajFM4Rhe5mAjqDxZEjUT2AWQJnXtAK?=
 =?us-ascii?Q?OkEUIR9WbHtXdpKnzRKo4wpFGR9mz3VuQ2FA+1gp0S/QeHkPGsVVQfhLqqB3?=
 =?us-ascii?Q?itGX2/7scOzbFtOf5FoGBhZtsePvY7Y3UkouQUAGmPc798I6/DtJPnNC8uel?=
 =?us-ascii?Q?Uo6FK3ovZlXSSjrbGLCYisJFLlZnqCWDcwvEj/j56MH3D7Yp/n9U/lsuYVoB?=
 =?us-ascii?Q?4dTQrqsSRRK7sdV2dDY1LswNRxR4L6ezhXglkN3/XfsxHnKMocqwgSCqwP4q?=
 =?us-ascii?Q?w0UCkBqDoDMMWNWksftEKzOyHJUe73kpXxdT4ykR7lxPFp7g3nLct7cxDf7w?=
 =?us-ascii?Q?0xF7wdyseJMdZDOMkUgIRYw5MtT5m2Tue/2f3x9r4wl7z0Q23Vs6F+a4tuTE?=
 =?us-ascii?Q?aHs1nCyTbn67TfjIbGiwODLY2ADedG0sIcda+HG8Wm49ae0OFFJOUhMnSjEc?=
 =?us-ascii?Q?RM+ZCT9eMgc6NzTFe49xDxIahSJ5aVAIppI8K3iYuefN8jw0XS+AIQR5eVqX?=
 =?us-ascii?Q?chQ1gK37KkkslXQqjcevxFE1xFSkL4dQHuMbCrPyyZoiID5d8jMUKu6wpvwP?=
 =?us-ascii?Q?NRg6NKKPP1P9drbFrbBbjcIR/9c5c7YcxqF8vxE2HcocQm4H1CotyFCAUAGA?=
 =?us-ascii?Q?amsk1zHQV2z2zWeevb5RT4wofhMzeqPfhP3pJCXciLD1N6+Kyba6RyGXLGno?=
 =?us-ascii?Q?eL4yJlb65kBXfaQq0SnBT5aueF5qLGsfibtSwJjd/erJxA8x3vJ0pqmEePFK?=
 =?us-ascii?Q?+GbuvuM5iIPmAAxRjsxxfIZjgTsClnrxJASX1VcFZ2Q1f3dtDmP46tRzYX+O?=
 =?us-ascii?Q?b8EseMJ6C7GgzF1+/yxMPpx591Nf30iaWMaUXrZraJsoKKZGrAnmqduiPrkb?=
 =?us-ascii?Q?C21sIxFDmRByMz0Zjqg6lJ4SuF8PDpKqQdlo77DIUKChHDVK6d+E0QMsR22c?=
 =?us-ascii?Q?PGQsE6f/8kqKQqvqej8zGhy6ewRjs20f9jmU3xpUcMEAi86aJU2wQm18VRGg?=
 =?us-ascii?Q?sP1ekzT0lNNXHqyZ//MUohHhDzgz2WatjTU5uX7BlaEv1/JZqs5p4aOBiMjS?=
 =?us-ascii?Q?JIfg3JJfcJ412abjEk5Fk/RFcc+ntD+x5ghKFY5EViairiKtWxxCdwtIrajF?=
 =?us-ascii?Q?x5XhXKUxDlKslwAsOZiOUJ9kTWA3n0dPwkXnV0B4zUa1mG2Qog9oG1wl74Cr?=
 =?us-ascii?Q?WQAmffTlDgH7uyriUuDIYWMT6tNwy169lVhMvK4DYCrdSLQKJxRHJ5xbkW/U?=
 =?us-ascii?Q?gr08UdrS7qYeRhi0EkKAs+33svdijqR2aeVwKSPzCDI14YoAD9BBIifSTkWk?=
 =?us-ascii?Q?ykEkJZTZcGr+xFfHeVpkp53xyXKwICSND29w1NADIvNstK2BxNHL468bP0qY?=
 =?us-ascii?Q?9xUhBWVdliNnVp0WOxFdjC+NQ1RqmVIzUGPVBr43VMPAiEuQYZTJWo44Qnsb?=
 =?us-ascii?Q?3Uu23v535KI1GGOVzd4H8tE2yafxKYKkRj6kV+RYg4eFPjf1M4VRMpPy0HKu?=
 =?us-ascii?Q?rD5TO6mVqx0K9syc5Edhh1COkWdHSo87zdLdqytddJ/kqmsqTk3nehCRMA?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?W9pJ2rErsgenyZ0ahBwsLmOl1V+5ViSh/fPnUdHnff35+t8vMfotm2IByH4p?=
 =?us-ascii?Q?Ba/AcGuwuV2y6uwfWJgy9dwOZkSqR7Nklh2EkREtxGGhslp7JlH4QsyCHv2p?=
 =?us-ascii?Q?w9DjHP6bEkA4QYZqmrofpFkkKJzxsMxhf0ZPOZ8osEOR5hjbMoNhhVg8hozY?=
 =?us-ascii?Q?zaI7XXJ+PKD+Xq0kCS8YaWZE8ADRtP6E6sCu8PZJmJVN7KYQGWqQsAgzuTB5?=
 =?us-ascii?Q?MTR1Vws5HctqznO091P3qnds3LKPkmmG8HGbrbXFzcF/RTqiJ59XtNm2Cmmc?=
 =?us-ascii?Q?AU04kpRXkZ9yC7dWNJiIndt8L4h+LrDgnoKU0pPZeFUGJjFSYNCSnGLzmFgA?=
 =?us-ascii?Q?OaX3gLWnurw+c49nKqP0l7qxHB/oDexyCGbgFi8bzzWFj+alP3dhYm2wppcn?=
 =?us-ascii?Q?NT3c95JVAvaaZdl5cNUAjWyCclG8k31OOn6qeE/nPrHhO6x7zvjIZmmQLbbu?=
 =?us-ascii?Q?H/LWjKAlgm8MwD/2FqLssgKzvjkL/2b6HPQ6OA84v+gleFkHiDVjRgxqChHM?=
 =?us-ascii?Q?1fSxvWlbCReEPm9HqKYyOj9lxZ+Q5STeQVZvnUQAZP1mKZnTJQiAOmwlETku?=
 =?us-ascii?Q?zjBs44kXcP60n7yDquP+dykeV6ifyXj9+3M4ciy320+/8cj+mF4SlfBQTEcA?=
 =?us-ascii?Q?Va+P/Th0PvXEQhAIpnCpQlcM5g8AXck5InWOnZIBlW79d2YTe49+M5ZkfueF?=
 =?us-ascii?Q?/RA8eKxR3dZOP770kWpuk+ZMh4rCljw3BauBQO3Jim7h+LqsNW/+2SQyxtvI?=
 =?us-ascii?Q?kzfWTEVXcirCWNGF6SY1WnLhITjPcu+A1JOUsmdugPRAOqwxnKTrRXhCwYu7?=
 =?us-ascii?Q?C52GuEN+QuETNkt234EcOrV2bBR+cVtTJXnusFyNiEIo6aoNBbDyh9awsQet?=
 =?us-ascii?Q?OnSAC3wwznpEemlDqmOGOLXnMk5LIlsQTipx2LxXB/Qd5ccM22+QLPc8me4w?=
 =?us-ascii?Q?W09yh8KsdQyhZu3Ubfyp8hH3I4p3fdtNJ/JkxA9+jx+DK/07CE7apA6nhHIo?=
 =?us-ascii?Q?0XAjbiDMxA/0OOuk4Ab38CAuGpnvSkonryeDY81Vg56jcrjYlO8DY5IGYEzG?=
 =?us-ascii?Q?Fk4v7q2rpkTTNodJIsTTGFqbJxKydu1ihX6axREHLjVrfTrNJH+Dlza1fqsV?=
 =?us-ascii?Q?jR5TRl+n7xMpGE921lmhSb/HHlZZmw0PGm9zii6F9hcXcfJsIGA4Ys5XP3Vn?=
 =?us-ascii?Q?00ogopJBwP0fMfFqcUedVvTjpwa7qdirj98r75CnLsDDlgzbwqbXwjUIx1Aa?=
 =?us-ascii?Q?xugNfYKMh+9db7BFmZuWDur+MwADIjCtwXvsDslqbkhVxDDHBwUYg8TvcJlJ?=
 =?us-ascii?Q?sb0yKKvNgQEYrcHSHa2N1wcA28NEtjmlOGEu9qWf2qrjIEVnj3h4l2bfoi5n?=
 =?us-ascii?Q?c0rs3V8qilqKtHlOuTGxXmP1nz13tysnGsVdwCuhMAjrNSlICSeBUhNVo4cE?=
 =?us-ascii?Q?h1CmDJde8+0T5K1mWczOlSSi3Tbgt7sEGOQ/ObJ4n2aHGb6iLX9VTe4dldRa?=
 =?us-ascii?Q?Bft60TPS1XZZu0fGlN0hptatKNeElqnAeboZxB05Q4QszVzSiM4t1bMxWkr5?=
 =?us-ascii?Q?rIqoFh/SFg5f5ypiCJgFUNrN0wvjU6BwDy8oZy2P?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2d9ca4-eca6-469c-e3b0-08de04e55dd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2025 14:33:50.1107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LGaFydN+rYzBdNwJ5TXKgDIHRGJkv+Le1aanxQiu9qLW5hzM2FMg3+b6AYaHvpm+D8zGl9SwUcdc3roH6dgTRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10121


Hi Arnaud,

> -----Original Message-----
> From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
> Sent: Monday, October 6, 2025 4:53 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>; Bjorn Andersson
> <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Rob
> Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Cono=
r
> Dooley <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha
> Hauer <s.hauer@pengutronix.de>; Linus Walleij <linus.walleij@linaro.org>;
> Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>; linux-
> remoteproc@vger.kernel.org; devicetree@vger.kernel.org; imx@lists.linux.d=
ev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; dl-li=
nux-imx
> <linux-imx@nxp.com>; openamp-rp@lists.openampproject.org
> Subject: [EXT] Re: [PATCH v2 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO dri=
ver
> >> Then, the RPMsg device should be probed either by the remote
> >> processor using the name service announcement mechanism or if not
> >> possible by your remoteproc driver.
> >>
> > The idea is to probe the GPIO driver successfully only after the remote
> processor is online and has sent the name service announcement.
> > Until then, the GPIO driver will remain in a deferred state, ensuring t=
hat all
> consumers of the associated GPIOs are also deferred.
> > The implementation you provided below does not guarantee that the
> > related consumers will be properly deferred. This is the most important
> behavior for a GPIO/I2C controllers.
>=20
>=20
> As long as you keep the GPIO/I2C device as a child of the remote processo=
r node,
> you should not have deferred probe issues.
> The|of_platform_populate()|function ensures
> that the I2C/GPIO devices are probed when the remote processor is started=
.
> Calling|devm_gpiochip_add_data|in the RPMsg driver probe should also
> prevent such issues.
>=20

Here, deferred probing is not an issue -it's an intentional feature. We nee=
d to ensure that all consumers of the GPIO/I2C controllers remain
in the deferred state until the remote processor is fully online.

For instance, consider a regulator node that references a GPIO line from th=
e RPMSG GPIO controller. The regulator will stay in the deferred state=20
until the remote processor comes online and its services are announced and =
received.

Thanks,
Shenwei

> Regards,
> Arnaud
>=20
> >
> > Thanks,
> > Shenwei
> >
> >> To better understand my proposal you can have a look to [1]and [2].
> >> Here is another example for an rpmsg_i2c( ST downstream implementation=
):
> >> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
t
