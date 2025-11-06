Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010035.outbound.protection.outlook.com [52.101.84.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6962D33BBD5;
	Thu,  6 Nov 2025 20:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762461612; cv=fail; b=eRIWYCrZG2hA5IOF2f3UvK/OdhFnn0a+7U4yKzUakUN3n2iusJ4ET1f4HFVhfqwLzvD042O31ZwwYRS/r+B5QoYKJzBuFnFqL71s7DyKXU29l1LEB1HNzSzLRFHTwaTf8+Qa+H43FTIH9Z6FR1dzyAmv5LhlUct3tT8qdz3n5N8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762461612; c=relaxed/simple;
	bh=n1e6Y6YK4FNPIEcXPWTOj2DAUN/lOzuzrpPLcEhg3vk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VYJwQeqQQPfteNhJ3nagIRzC3Km+6l3gF0Ms3nc/KhhcV3u37kqoztidSrSnX1NquJs2uoi+Kj2UtlB8vFcyi1P6fk50m00CQZsHtOgxtsq4TsnseCLrd/c2oWhrIr6AJrdLwuBlmhY9z/rDyHnGJC0C4FPILYxq4bk0re7CTWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ubo9S/5o; arc=fail smtp.client-ip=52.101.84.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ubo9S/5o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5Jh1x0Mma7EvQSSEmRQzZyp1YU6ukx7GDYMoPSrF146Xhga6tH6W5ZmnGuSopsqYBlBFZt4+1bbdgFqKPbbDE0+sumt3X8qsFX9EvzUkkjJZAprlsgn+YLlEc5LD9dAbklLyX8BGL88NJ8HtLwzKHz4Bcbzel3fc7lFKV5iCmYFPSslAKTSgHZLsGG6+7vK8xvnj1v2pGACYp/HJ662xPWkmXf/ih9uTPvi24q7Qg+H1JtXYiK0rfEi2x9bNmZZThaKfJ7D67WEYvSGN8aiW5wfZm3hTQSa9fY9gtPb903teLxyjMU2w4fBldMMeYkTVMtE4ymrHrtJyYsTUmZE9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtyRNsvriBd/dk083GIqz9mtDdrB5E1V+0uuLeS/xM8=;
 b=pSlUTLsaIEzzvpV/H7dIY/HONGdlbnNLejV10Nx5WuoI6GS+R/Fg6+NP3RO33PXmm3QHIPAg9BA80A8KEFly8aF4Nd5P3qOLNgihhmpTXZqyv0vYAPbaGxGUy0DBWWMjNFOjjeCtOFcZHSIfu7tRIRbKJ5YAuQIzZEK9rEHQBsKeEGCo+10paUkeQi4GkXzqACme1cH12xX223paWkWSJZBVr5MuxObAnqs1Ohv6PM7pCXXUyFZ+K+OS3mZzglGRcRHmS0uj7wpnAbv2eq8QlUyQTJGuXfJtSi3OAGdXtZv9zSoZPrwwN/pKj/V46Ei63wlixd2BYbX5qAfEr7r9ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtyRNsvriBd/dk083GIqz9mtDdrB5E1V+0uuLeS/xM8=;
 b=Ubo9S/5oXBS4nWkP0SHPkBI1+98KjnEHUgcWvjC6PO7wdthbTm4Lj44pkIBXQfoQCtYjHQyyHPFo4+aUbJrCa4arUFac5SZJ2ih9xbEo7RHkpSu8jW5UsawfZZr2+zbuAWlWyDRj+kRRCWlOlMEvV8sVMlS0P+NzFg4z/L38rQEvaL1epcsh0J4rGp/AoYpCthvGO9Wavvax9lNQYHBW/DWxvzY8D8Jr68Ne6X3Nds9IQ4vx8iRf2RrP5mobDXtosDDkC7rwx99Om6DVOh38IIqu0LFieB1vRSMbamTurMNM4nEg3pjvC/AX37acwumtnRV92EaNjmGXF/70nSKgdw==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PA4PR04MB9710.eurprd04.prod.outlook.com (2603:10a6:102:268::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.20; Thu, 6 Nov
 2025 20:40:06 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 20:40:06 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Jonathan Corbet
	<corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
Thread-Topic: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
Thread-Index: AQHcT12IO/eL+GhPRU2oFpUsQtz5fA==
Date: Thu, 6 Nov 2025 20:40:05 +0000
Message-ID:
 <PAXPR04MB9185C4A4B91F863CFD49718E89C2A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-4-shenwei.wang@nxp.com>
 <9fd8ccd9-560a-43b4-a48d-f7a3eaa07eb1@lunn.ch>
In-Reply-To: <9fd8ccd9-560a-43b4-a48d-f7a3eaa07eb1@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|PA4PR04MB9710:EE_
x-ms-office365-filtering-correlation-id: ee3bceaa-d6e0-44da-8cf5-08de1d74ab4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?RVqb0U8APevdRKp+I4WpYPt5Nko5ECoSzo0+KDiGHewJiHJghAU7yd4Eqm4I?=
 =?us-ascii?Q?a09AjHQuoHHZfWhE5Qimdiv2vF3oosQ9XMsAWEIai2l59/qnqTE3DyxbI9ba?=
 =?us-ascii?Q?Nn8wXeW+hxozIreoPEsFKya0fbh0hvOWFUfyTGgFCDy+n+NB6+WtcrJBPCcT?=
 =?us-ascii?Q?9AIT8l2JJXrSQVyZ1y+XC1eKazSxWe9aVuMdbbloEGHporB3f81pjTYZR7uX?=
 =?us-ascii?Q?esmih2IjJDy/xWExi/lampRxXJQyvK1aCfLttaQduQMGsle3rQEoJ5Tx0jRP?=
 =?us-ascii?Q?igBeApCdlVUwEO7poWENtOQzHDqHo88CC9IXzfQZey2y4409nG2au5wnc/gN?=
 =?us-ascii?Q?YjGaRtAIo62h7FFBia1cvkLTwdARbiJ/3AZPeTZT83D3IYpmtTv3NXKSLl2q?=
 =?us-ascii?Q?9JZODWocOxMzBDabm7cUzoyvrIK7BLpgQ9WrO9q1VeJw2M0ZIUIiecc/35F0?=
 =?us-ascii?Q?4kHnwDVecTk/rSlegNDgS8IsT8PYOm4qrU2ygjBa+oiOWhtHU1Obh2ZVPac+?=
 =?us-ascii?Q?MQ0CEw/bxfkB2NyLPv0Q4eEeAsUXjoYQ0c3ZsduwVhLOrnt0fPOPf6JPB3u0?=
 =?us-ascii?Q?/Vzcez6lzwqMslHjL8pJxBlYvpmobpOEBNtml1Nu4ZrJb2dBfL+i2/myEn+o?=
 =?us-ascii?Q?K/KhCLrZprGuSbPobetc19p2A0G2LCoxMmsZXI9/zgGwRAb3MyxLME//uFL9?=
 =?us-ascii?Q?7uY9n+98pur2kCaV9E32bybLJt83C89whajjPsaHOtyIfAoUkp7mM+q+cvv+?=
 =?us-ascii?Q?VAWjOwSJHoNJfD+D6KAA9VcBWw3RKSgGuz4p7NqaO2xpfETa/4HQ2++EU+08?=
 =?us-ascii?Q?AxvbnKc7IL3Y9sMNMD0ZhooxYyd0jAHIfOgrrlz/QQQMedi/zmGhqJm5i8MD?=
 =?us-ascii?Q?9d3wmoslOB5OAssMbiZ8lW5FuRrJVN6BxfTz5E9orMyOfcXp3qxhliNhHALD?=
 =?us-ascii?Q?NWU/4QsA+Oldq6s2rMzEcCYNgObYmOuDb8Hy/F8nwGfaX6rnVnO+ch6pcj2N?=
 =?us-ascii?Q?8s3u0KtKp02+vqOFolJF6RRjwqFBRqzzTyQVskysG9fdaeQxd2ONunq8vnp/?=
 =?us-ascii?Q?ntwBzTvFciXmsnAaq2uKtnYuyCadB6slPD72DDgfqtXUpwnq7L2LOY92wZb1?=
 =?us-ascii?Q?cHMgZoXqdqchvmE0oohipWimX4UK0jL3Uex5GpsEPjNyGFG+wyRggddhxwk+?=
 =?us-ascii?Q?mPBxU//goeM3T/MxtOnNsYhihCPpp7k4rwKqqtm8Cin5jxuigzbAMBhcIR25?=
 =?us-ascii?Q?gnns9qG5LIcCj9ulFjsiL4STczueEhdoWvFI1s8FCAuSMHGZQUd5eyuiXPcZ?=
 =?us-ascii?Q?l4JRkQ4Ocn6zJVvxlfYFBcqa2bW6hz+OdSVI9DUFHucTY5Qwn3pME8wNi1L1?=
 =?us-ascii?Q?OV6u5uACXgVthsihX2a6yg46uvzuDzAPp3eVc4mBo6ltGEFrwKlPqAZMo5Ys?=
 =?us-ascii?Q?MuCFBVlmOulno+roRlHryNAUMrp/ggU1Lr3y5Pv7n6fCcfdMLEUulbdFbPmP?=
 =?us-ascii?Q?WfBxnOxUdqxouody7Im9tye9QI6uLmD2khB7?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?WzMpxkSj76McpPMqGGRPatQtGeOFIXw98y22gbPMi6v8Ef63O+SEZ/gtwxsw?=
 =?us-ascii?Q?EQRagPtyygMQSUuitO0agZF5i7h7DyR5JLI/a4MJ1vhL1ZiDykjiWekuXqx8?=
 =?us-ascii?Q?55YrIyit11ZkyMdM1Kt44+vtXxp6CqGztOVkfgbA1525x3uTgXjluBlgeTeZ?=
 =?us-ascii?Q?2mSGKXpnevQddd911p/bOd4CA3SzYkxO0bVnH8iZYs66Pbk5JtBiLci3R4Ad?=
 =?us-ascii?Q?6zRfhU1jVw+kiCBuHFvYXoTFLof42vi+Ya7nUTqEQzWhFPg/7uzZ7NADjVFY?=
 =?us-ascii?Q?3962J8YOEVv1SsJh/t0QPUb4x3jKYvpbwppS3OjeuvYqLHy7+nbkJTJgCU7C?=
 =?us-ascii?Q?EWqSQYzmNluza0CN9RK/RUlOj+D03XHm/oUejv/KTKXxp/U6JlrjI9+FzMy/?=
 =?us-ascii?Q?4iksD1fHXSN+lX6SWkk0Y5pwkYQbop6tEvgc/Wl8mQSTGHzTHf7k3fOwtvUV?=
 =?us-ascii?Q?xdVhTeDoz6ki3wM1W5uED20Z/4q7ucyfeFD5OIZ05vGomtt7Ev+an04O3Uoy?=
 =?us-ascii?Q?i+MF8o8r4rlnAJMFl7+dw8kluWC0RyzHx+HrEnbXRwKqy+hV4TwGD0SdgPtC?=
 =?us-ascii?Q?Y4a+GAH7M9TukWQntaTtyPDvHS1DDHKYtynF/kkq5KeLulPcY+/5ISjbSahD?=
 =?us-ascii?Q?vR3IBfYElzHYpdvuq5jJm7Aa0AJWQcfIMlfy9dGkk8EnfDXHges7pnI5eLwu?=
 =?us-ascii?Q?bEfWrpS7QUvkU7OFOXIxS7eYqiPLz0Lmcv0oJDqq5GOv7TrZbvyyVVimWHsn?=
 =?us-ascii?Q?dyTuuG7g1W5+OKLSEI5mcoCulesVOPcKvLaF3lOZjm6VG4HAMMyx6LoPpZ3j?=
 =?us-ascii?Q?v4Yn3UXzRmFaeajqDgkn3kwqdR6XgmIXAtoF6YhrcGJlukcxJlrmfmNyeNov?=
 =?us-ascii?Q?+lxYWrwN20YqKpBDRvrcf488NYeopkYi0OrEy0qSelM/BsffaH6O5tsEFbLU?=
 =?us-ascii?Q?Ey2AJ2pFoLUBDhR4E5izBXibewmLocdrH1cTgMPgpklpN4FK2/FvAmTMq/rH?=
 =?us-ascii?Q?WtkPv0vKUDGmDPtpYn/svJH6jKUzbVAyqfFaw0mF1UE3SD17dL+EbTd7zozU?=
 =?us-ascii?Q?BIbQ+BKh6rs2LXx9KcnMNh6GrTU0KOLvjBh4eEPZpNFROpTexBZ96OWepOMm?=
 =?us-ascii?Q?cOTiS9RKAqULtbuUhbSvvidtxfZdfPaNSp9PPaMyYzVx750mZez5NzBgIzHA?=
 =?us-ascii?Q?svncjw3x5ZulPHo6q34inkya5ngLtLPx8g6nr1qJumo5c8nBMEzO6T9VycNE?=
 =?us-ascii?Q?Bv9XBq0MLnwoC5UK2BB590lwqtiLy9OT6jg8KEtpglaxgHBQWUFCTiKgltA9?=
 =?us-ascii?Q?QW4LdMDCvAvVM+16aPXjra1soojq8cXvy2q0NWWlkNggUBx77LX9yC2Cd5CJ?=
 =?us-ascii?Q?pIcrDaJGv3M8KKFbAvGMdE6WYTVnQqq4mx4udEeZ1YCmuP1sn2wlwn8QNrJS?=
 =?us-ascii?Q?o/Le+AsjHk8eu/85OV4c9tngWcizqJx5jyJsEuc2sk/QFj1SNY0khRsv6grN?=
 =?us-ascii?Q?N/vv2AKAfQqDz+WcE8w2qllmYO8o7WyLPlf71tkKwUoXEvcuYakIzraJLc3v?=
 =?us-ascii?Q?F5ftByS6iAZoa1mKQnY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3bceaa-d6e0-44da-8cf5-08de1d74ab4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 20:40:06.0298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wIVcrUEtvjbWyGhFL6mydKtf4Ip8pg5lUc92GjLoKJ9g58MCf3eLUBM0lhYav/BNYsIsnXsImWedwchN8/mtbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9710

Hi Andrew,

> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Thursday, November 6, 2025 1:06 PM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> <mathieu.poirier@linaro.org>; Rob Herring <robh@kernel.org>; Krzysztof
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Shawn
> Guo <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>;
> Jonathan Corbet <corbet@lwn.net>; Linus Walleij <linus.walleij@linaro.org=
>;
> Bartosz Golaszewski <brgl@bgdev.pl>; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> <peng.fan@nxp.com>; linux-remoteproc@vger.kernel.org;
> devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> doc@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: [EXT] Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rp=
msg bus
> > +   +-----+------+------+-----+-----+------------+-----+-----+-----+---=
-+
> > +   |0x00 |0x01  |0x02  |0x03 |0x04 |0x05..0x09  |0x0A |0x0B |0x0C |0x0=
D|
> > +   |cate |major |minor |type |cmd  |reserved[5] |line |port |  data   =
 |
> > +
> > + +-----+------+------+-----+-----+------------+-----+-----+-----+----
> > + +
> > +
> > +- **Cate (Category field)**: Indicates the category of the message, su=
ch as
> GPIO, I2C, PMIC, AUDIO, etc.
>=20
> We know it is a GPIO message, this document is titled "GPIO RPMSG Protoco=
l". So
> i don't see the need for cate. I can however understand that your device =
does
> support multiple functions, but to make this generic, it would be better =
if each
> function had its own channel.
>=20

These details are defined in the message header to support multiple functio=
ns. For=20
the GPIO-specific implementation, the header values are fixed and do not re=
quire=20
modification, provided the transport protocol version remains unchanged.

Then I should remove those unrelated definitions from this document. Is my =
understanding
correct?

> > +
> > +  Defined categories:
> > +
> > +  - 1: RPMSG_LIFECYCLE
> > +  - 2: RPMSG_PMIC
> > +  - 3: RPMSG_AUDIO
> > +  - 4: RPMSG_KEY
> > +  - 5: RPMSG_GPIO
> > +  - 6: RPMSG_RTC
> > +  - 7: RPMSG_SENSOR
> > +  - 8: RPMSG_AUTO
> > +  - 9: RPMSG_CATEGORY
> > +  - A: RPMSG_PWM
> > +  - B: RPMSG_UART
> > +
> > +- **Major**: Major version number.
> > +
> > +- **Minor**: Minor version number.
>=20
> What is the purpose of Major and Minor? What values are valid. What shoul=
d
> happen if an invalid value is passed?
>=20
> What you should think about is, if you gave this specification to somebod=
y else,
> could they implement it?
>=20

Okay. Will change those fields to fixed number and remove the above definit=
ions.

> > +
> > +- **Type (Message Type)**: For the GPIO category, can be one of:
> > +
> > +  - 0: GPIO_RPMSG_SETUP
> > +  - 1: GPIO_RPMSG_REPLY
> > +  - 2: GPIO_RPMSG_NOTIFY
>=20
> Is _SETUP always from Linux to the firmware? Is a setup always followed b=
y a
> _REPLY? Do you need to wait for the _REPLY before sending the next _SETUP=
? If
> there is no _REPLY within X seconds, should Linux retry? Can an _NOTIFY a=
rrive
> between a _SETUP and a _REPLY?
>=20

Yes, the SETUP message is always sent from Linux to the remote firmware. Ea=
ch SETUP=20
corresponds to a single REPLY message. The GPIO driver serializes messages =
and determines=20
whether a REPLY is required. If a REPLY is expected but not received within=
 the timeout=20
period (currently 1 second in the driver), the driver returns -ETIMEOUT.

A NOTIFY message can arrive between a SETUP and the REPLY, and the driver i=
s designed to handle this scenario.

> > +
> > +- **Cmd**: Command code, used for GPIO_RPMSG_SETUP messages.
> > +
> > +- **reserved[5]**: Reserved bytes.
>=20
> Why are these in the middle. It is more normal to have reserved bytes at =
the end.
>=20

The reserved[5] bytes may be used for other type of functions. For GPIO, al=
l should be 0.

> You should also specify these bytes should be set to 0. If you don't it w=
ill be hard
> to use them in the future, because they will contain 42, or some other ra=
ndom
> values.
>=20
> Is there a relationship between major:minor and reserved?
>=20

No so far. Maybe it could be related if the protocol is updated in the futu=
re.

> > +
> > +- **line**: The GPIO line index.
> > +
> > +- **port**: The GPIO controller index.
>=20
> data?
>=20

Data is explained in the commands below.

> > +GPIO Commands
> > +-------------
>=20
> This is a GPIO specification, so i would only expect GPIO commands...
>=20
> > +
> > +Commands are specified in the **Cmd** field for **GPIO_RPMSG_SETUP**
> (Type=3D0) messages.
> > +
> > +GPIO_RPMSG_INPUT_INIT (Cmd=3D0)
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +**Request:**
> > +
> > +.. code-block:: none
> > +
> > +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> > +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
> > +   | 5   | 1   | 0   | 0   | 0   |  0        |line |port | val | wk |
> > +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> > +
> > +- **val**: Interrupt trigger type.
> > +
> > +  - 0: Interrupt disabled
> > +  - 1: Rising edge trigger
> > +  - 2: Falling edge trigger
> > +  - 3: Both edge trigger
> > +  - 4: Low level trigger
> > +  - 5: High level trigger
> > +
> > +- **wk**: Wakeup enable.
> > +
> > +  - 0: Disable wakeup from GPIO
> > +  - 1: Enable wakeup from GPIO
>=20
> What do you mean by wakeup?
>=20

The gpio line can be enabled as an wakeup source for the system.

> > +
> > +**Reply:**
> > +
> > +.. code-block:: none
> > +
> > +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> > +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
> > +   | 5   | 1   | 0   | 1   | 1   |  0        |line |port | err | 0  |
> > +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> > +
> > +- **err**: Error code from the remote core.
> > +
> > +  - 0: Success
> > +  - 1: General error (early remote software only returns this
> > + unclassified error)
> > +  - 2: Not supported
> > +  - 3: Resource not available
> > +  - 4: Resource busy
> > +  - 5: Parameter error
>=20
> It would be good to give some examples of when these should be used.
>=20
> Say the hardware does not support both edges. Is that 2? Why would a reso=
urce
> be busy? How is busy different to not available?
>=20
> > +
> > +GPIO_RPMSG_OUTPUT_INIT (Cmd=3D1)
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +**Request:**
> > +
> > +.. code-block:: none
> > +
> > +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> > +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
> > +   | 5   | 1   | 0   | 0   | 1   |  0        |line |port | val | 0  |
> > +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> > +
> > +- **val**: Output level.
> > +
> > +  - 0: Low
> > +  - 1: High
>=20
> Maybe make a comment about the order. Some GPIO controllers suffer from
> glitches when you swap them from input to output. While it is an input, y=
ou first
> need to set the output value, and then configure the pin for output.
>=20

These are platform-dependent details that should be managed by the remote f=
irmware.=20
In the Linux driver, we simply request the remote side to configure the GPI=
O direction.

> > +Notification Message
> > +--------------------
> > +
> > +Notifications are sent with **Type=3D2 (GPIO_RPMSG_NOTIFY)**:
> > +
> > +.. code-block:: none
> > +
> > +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> > +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05..0x09 |0x0A |0x0B |0x0C |0x0D|
> > +   | 5   | 1   | 0   | 2   | 0   |  0        |line |port | 0   | 0  |
> > +   +-----+-----+-----+-----+-----+-----------+-----+-----+-----+----+
> > +
> > +- **line**: The GPIO line index.
> > +- **port**: The GPIO controller index.
>=20
> There is no need to acknowledge the notification? How do level interrupts=
 work?
>=20

Currently, there is no need to acknowledge the message, as the interrupt is=
 managed entirely=20
by the remote firmware. On the Linux side, a single notification message is=
 received when an=20
interrupt is triggered.

Thanks,
Shenwei

>         Andrew
