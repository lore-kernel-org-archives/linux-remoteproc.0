Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011019.outbound.protection.outlook.com [52.101.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C820A4508F8;
	Wed, 15 Jul 2026 15:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784130917; cv=fail; b=Pa+Gp92MgNvoZq3dCR5L1rNuHUNyA4mY7mgkgjiLnU6stNVeonVEKGfUQxH96TUvbsJ8TGP1/CtSDYZozFB3Hi/vR4HdmHYb/hFkVGzN192agAqikrcqpmmjaGyztC1k52gTKmsr9gOKhaInra0QgKAJEcMaN9k5kVmD5Nfpaa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784130917; c=relaxed/simple;
	bh=vwo4hPmvBpTykMI7tgFOSHkTLmPMNX8a7LCtXMI+osU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VeV+OyDM8wtNr2JO+WaSvfoSxyoKM40p4eKK+GbbuOR3TySPSst68gWok/1EXVk0AwFC68q2DK8muykxnpL3c2Sr8u0LgzxSP37/qh9oSfJ6YH6on8/iYOuU0nZqtM8F1TbPVIavCc2aWAECBBPqnrrtibh175NYKSY3nZD5TLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xfVo1ON6; arc=fail smtp.client-ip=52.101.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xfVo1ON6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qu2q7VtsID9gOj8Zeuy81ufNZND1sGbC3Hf0HWF7zTupO7YCRDCEo7RfuLeN2Or7BcA0Ksqn6N91FqNVeKpz43e8c/fRWKCU16g+I/w+gMm2VGxUeA8+EoFOSub/F4+fWBuIgHKjMoA38VfXTni1qKulusjwSdf12SXOISBmQ49qoB8X7EG+7VLe8jVimysWBtP9tm6ndKP2Wc1H+lVb/c4T2ATZeajvfTIW+xvVk2ICP/uS0HR2tGSQ5vUKgZtLuJpbSF/62/Jww/iTToBgJXsm12ciO1Amh+jaGQlbQ1yuN2lxnOhYKEUkrpRXZTyRFVcpHnyZnDz4fn3Y0ZjtPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uj/D97tP66a6PhG3Rmx+W8XCDU1/jqzHgu3LhD/3zvs=;
 b=RVkRgXi83gJudVbGCvUwTb4fZdES87vjsY6ZvZqprZ3ap/tc4HUxi7oYpFJxBNYGRMEVJmzGNlzmqrNVQyGQDcM8x3DM8INXtNWBhEiRdGTxmuNRxm5rQonzue3o9wfxL29m9eGOqi2AryNi5Sa9oHN8lqjY/rDG/Yikd7ejn/+i+KGmXHYFhC/3BR+Q4kkTLTykUuYUWrehaLjcjYXqkApHo9xsDBa+3v0FXZKsSWPNBklAzBmaUhmqFKBxDaXtYioEo3tKSI1laOcXKttc/P6jArlR28Cwpo9pvTY6ZfWqcRCqqPBnT/fxH6W1RftDu2DaofqaJf6UrNPly/KWsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uj/D97tP66a6PhG3Rmx+W8XCDU1/jqzHgu3LhD/3zvs=;
 b=xfVo1ON6qyLizk7IKN2a5XR8x7V0JdYJCrDcNpVvoDdTcUoOA/OsVCOsVjgUsJS2oD4hV4CaQ32MzrkDKcPsURGv9OmfZfPFhDacnXHgxrAiuV4Oam+yT3HsFt2MXu7NU30Qqq9M8KvxIsLIhGtwj+mItlOS5APVCOOx4d41H7cF8TopJc9NE5zUlQbzaiwYFoHdSr0p4yAYeMFUQkEZ/jzp11sNSjEr8YyoSmubxjQ+kHHqQkhDL22pgQdo7CCu/JSNtXo+VBpzV9OKL3UXg0gmo2w7/0Yu8lXB2AcJ/whixfz0NeLX254GfNPcNLF7NAe/A+BoCq1GllG+FhfNrw==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM0PR04MB6834.eurprd04.prod.outlook.com (2603:10a6:208:17e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Wed, 15 Jul
 2026 15:55:02 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%5]) with mapi id 15.21.0181.016; Wed, 15 Jul 2026
 15:55:02 +0000
From: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "Shenwei Wang (OSS)"
	<shenwei.wang@oss.nxp.com>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, "b-padhi@ti.com"
	<b-padhi@ti.com>, Andrew Lunn <andrew@lunn.ch>
Subject: RE: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Thread-Topic: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Thread-Index: AQHdFHJKYE+KgnspHka7JiCq8WMI9Q==
Date: Wed, 15 Jul 2026 15:55:00 +0000
Message-ID:
 <PAXPR04MB9185DC31980327326D289C4C89F82@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-2-shenwei.wang@oss.nxp.com> <alUdg9iTysXCFUa5@p14s>
 <PAXPR04MB91852808D2C7491AEF98CF1589F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <alZlZvQQwq-g6VL3@p14s>
 <PAXPR04MB9185B1A3F16D82E8C0C76EE689F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <alemgbM2ktRLE9wT@p14s>
In-Reply-To: <alemgbM2ktRLE9wT@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AM0PR04MB6834:EE_
x-ms-office365-filtering-correlation-id: 29fe51b5-0dc5-409c-5ba7-08dee2896d77
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|23010399003|19092799006|1800799024|10067099003|38070700021|3023799007|6133799003|4143699003|22082099003|56012099006|11063799006|18002099003;
x-microsoft-antispam-message-info:
 wwbSVvuCj7l9QdGd5kTkjXqQy7wnSht+avqBQoMkB4zYk5LSNPtDaJWKjAzq+kZ3uSuWjFF3ngzV/Xy73U+MtTNOwAT5GxV1oIghGEACYxMRqXLxK32DDky9VctDnHaACMZVq/6dWZdQxeqbMtid2FDzdN0QcLWQtEVcYH6/vdLq7WHFnWarrVedjQ7967UpSKk45fxPOgV8FXI2pvwyoNwjh8P6sg6hWlQrYu/dUxisY0iBW9CNIi4VUb+k9hV1mBChhaF8VgKphEkX8Sa1r1wPAS7pHT+uMfS2cn5PjELROPnMkVSH6zSeyzgWYj1r5e5yZIT8WrOdMFm3vwHfuUw+LHX+cJ+UYuHTb6XAbDa2VGC5ffFZuEZZNnrVbI+3D14fQJfPA0MpKeXprA4N+DGXBojMEHiviuq+bUcAGUDaexUshVnElMCM/Z08csVxjnxLSViiCMjfiaIKPNv/i+a/Aq0pjtwCftcDR6fYkdSmzkHAW5DnLULtmUnzlD0VGivG/QyZZHpx84OYWUm3hbIoUsX9MM42oo+6ezqx9pAL0Nast8Q7J4Z16cvACSE6NepSAaXRt9J6hrVSB+fvPTI15R3koBwJ8nfadIvjE2IXBIhAS/WEaBJwdLAAR2DHp4Qu62jwcysmOjgOZ9W+myRSqBNBBm5dF6dZNlI+NgIEkTwsfVJ9Je03GOgmHiKgViGnxTk0s0hOrJtAUZrAfSO0k2ne5JuUb+HcrRSK8NI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(19092799006)(1800799024)(10067099003)(38070700021)(3023799007)(6133799003)(4143699003)(22082099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9piLKfhogqz65zwDi4oOuu+2k0vfOeAk5ZBdj54nXW0zmYo4p+k8TGDOlP0o?=
 =?us-ascii?Q?fRgLYINiQmzZTTgf3GMEbF+Ebxlp4OAHz5Q88ayt+ftdDGQwuDQf/qrpnb9T?=
 =?us-ascii?Q?lilZpDnwIrgPhOnY3b8yP8mabL1wGnFSvYnx0VPlAd680Ok3UWlTSJ08OrsH?=
 =?us-ascii?Q?ojx1X+h73OF0JRMTrVtd1/lFY0n0pzhU5uVCFw05mpcw4cdo542EgFSgee/w?=
 =?us-ascii?Q?BpnPSLmhw9Bi2dGgh9Zprdp71AlwiMgTeu1tE+kp2NGQP7t9nZ5i989aJQlK?=
 =?us-ascii?Q?DSqbdprR3OKdyQJ02xZ1Nj2gldPp59+Sk7rGpCAwP4xO/FaMK96srTTwrlrH?=
 =?us-ascii?Q?0+oHaiFoGi0JzTMqUmvNlQ3CZCaMMoU8+yBiYSTn9SGWnGjHCJLp6HrzE6mv?=
 =?us-ascii?Q?RTZrVDlUi/yK1XLqlZoD9WbpLRSaiQrjueDTyXkHlWeFfd5qk3Ogj+YFVNR+?=
 =?us-ascii?Q?mahxI7tzP/VbjA9z+NONoaj2nrAhNGQqVur3FUZeYSWpWp0QPjWCL8ZLsxBN?=
 =?us-ascii?Q?MvslyZhTrriOnaBIpjGB4/m/0AorZPorgbXHCM8/08fdH1vl8/5WhhStN8QD?=
 =?us-ascii?Q?0JRsWnZOB5/XSl7D0Y63kIgMwJdB0Su4kETLGqqxLsN6wSxWsigYf4VoRi71?=
 =?us-ascii?Q?pYd83ecqbPiOeCz5/U2hrVvP/5v9Lz9cdMpOLFNq9NptAEbF70zDAjsReFPM?=
 =?us-ascii?Q?SkEWABRxyspbsRShTuhTEXimGM9TUd6Q6gHVo5S9vROJllJ0sjaNN7JSIHCm?=
 =?us-ascii?Q?nv/EEbw5LMJSmGZkLdrodkbHs+RrFpSK8b9Pkv0L1jXlWiDMUd61/oG5RTnm?=
 =?us-ascii?Q?xQty6kQJwI9WG8QxMUdX849eQFkgt8N08oZBxVVFAkLaIMekAObos3S1H0CI?=
 =?us-ascii?Q?HXwVHpwL4u5WcnMP2ckQztpmJCxk1ty0NXcpC1MTyD6xI8T5KurYrPKlW9+4?=
 =?us-ascii?Q?jjjnRyXXDqlPWS68cha2yXWlTUoPLQHf29Zoh2Qdck7VnYyGtlcaZ7zQc7Ei?=
 =?us-ascii?Q?bd6Bzz+iW3WEc/DAhmQTyQxLKThS7MSmoY74g1qn2zfxUJpD5hA97BvSC61N?=
 =?us-ascii?Q?atyNBff1EWGCSrMGdC6sGdN9aVW0KTOXsoBUdqv8P+drv/pgg8SvRbBLcjdO?=
 =?us-ascii?Q?KRTAKJVbC9CzaJObtl6iZjqYSg20CIljpZ8F3o/7u/zLynCda8Zayw2fjTAf?=
 =?us-ascii?Q?h6dfdYdgDbeIqBCVeJ3p/M9gkcEe74bQHlXQT8qJq0wixYbF2eToELz7aa4c?=
 =?us-ascii?Q?9jVmRxCWGjmTJbDOUN9ji7Mgc7iIXxRUrxCOJhttxo6vjBcQsRZe8sQfkAU3?=
 =?us-ascii?Q?Nty6ox1l8JQQDf46TxS6QiUtH/SR/Ar8z6WYKxn2d0Uowh17dPzKdAqItfSQ?=
 =?us-ascii?Q?vV49Y+2hAoQrb4k+vj8BAl+a10UQGFH8X4ibjc8BVCCs4mX51DR9wGCwusGS?=
 =?us-ascii?Q?Ipthd1sMG6fFtrdt/tN8FRh+iVwCLAWvr52o8wvcAJpa4cQjh/OPdAdLAb9h?=
 =?us-ascii?Q?grsvoNOEWknpaEWPgPUjfgGCXXBAtn58yKLypXDtRCu4nbuHM6eiztz234bH?=
 =?us-ascii?Q?cKxqwab5++Ndyr7mF/qnNAnDhiFzfxH4vCuMZHkovRFz0OQsIodTr/0/y019?=
 =?us-ascii?Q?zD/fRbSeY8NDjHDCDeNWItVUyhfqEcMNZ0I3+dJqjkbHxQNSDwjmhTGVduwz?=
 =?us-ascii?Q?4LfS7FeaJ15drGUL2gIyWlAISWsmV69Qz8/GyHfZww9Baer96gAZbdre6G8l?=
 =?us-ascii?Q?+qkqw0JONQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29fe51b5-0dc5-409c-5ba7-08dee2896d77
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2026 15:55:00.7630
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kUBEh5A23Ek8vcdH3QQy+Lb/BvTLDYqYGyydrRnhcQwuTpaonb3CzvMs3SstQTb8iRajJPEFnjqw80SGk6y40g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6834



> -----Original Message-----
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> Sent: Wednesday, July 15, 2026 10:26 AM
> To: Shenwei Wang (OSS) <shenwei.wang@oss.nxp.com>
> Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.o=
rg>;
> Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzyszto=
f
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn
> Andersson <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hau=
er
> <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel=
.org;
> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; Shenwei Wang <shenwei.wang@nxp.com>; Peng Fan
> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Arnaud
> POULIQUEN <arnaud.pouliquen@foss.st.com>; b-padhi@ti.com; Andrew Lunn
> <andrew@lunn.ch>
> Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver ov=
er rpmsg
> bus
>=20
> On Tue, Jul 14, 2026 at 06:43:30PM +0000, Shenwei Wang (OSS) wrote:
> >
> >
> > > -----Original Message-----
> > > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > Sent: Tuesday, July 14, 2026 11:36 AM
> > > To: Shenwei Wang (OSS) <shenwei.wang@oss.nxp.com>
> > > Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski
> > > <brgl@kernel.org>; Jonathan Corbet <corbet@lwn.net>; Rob Herring
> > > <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor
> > > Dooley <conor+dt@kernel.org>; Bjorn Andersson
> > > <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>;
> > > linux- gpio@vger.kernel.org; linux-doc@vger.kernel.org;
> > > linux-kernel@vger.kernel.org; Pengutronix Kernel Team
> > > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Shenwei
> > > Wang <shenwei.wang@nxp.com>; Peng Fan <peng.fan@nxp.com>;
> > > devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
> > > imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
> > > dl-linux-imx <linux-imx@nxp.com>; Arnaud POULIQUEN
> > > <arnaud.pouliquen@foss.st.com>; b-padhi@ti.com; Andrew Lunn
> > > <andrew@lunn.ch>
> > > Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio
> > > driver over rpmsg bus
> > >
> > > On Tue, Jul 14, 2026 at 02:29:12PM +0000, Shenwei Wang (OSS) wrote:
> > d
> > > > > > +  - 3: Both edge trigger
> > > > > > +  - 4: High level trigger
> > > > > > +  - 8: Low level trigger
> > > > >
> > > > > I'm in agreement with cmd 3, 4, 5 and 6.
> > > > >
> > > >
> > > > How about cmd 2?
> > >
> > > Yes, I forgot cmd 2.
> > >
> > > >
> > > > > > +
> > > > > > +**Reply:**
> > > > > > +
> > > > > > +.. code-block:: none
> > > > > > +
> > > > > > +   +------+--------+--------+
> > > > > > +   | 0x00 |  0x01  |  0x02  |
> > > > > > +   |   1  | status |    0   |
> > > > > > +   +------+--------+--------+
> > > > > > +
> > > > > > +- **status**:
> > > > > > +
> > > > > > +  - 0: Ok
> > > > > > +  - 1: Error
> > > > > > +
> > > > > > +SET_WAKEUP (Cmd=3D16)
> > > > > > +~~~~~~~~~~~~~~~~~~~
> > > > >
> > > > > I already commented on messages that are not part of the
> > > > > virtio-gpio specification.
> > > > >
> > > >
> > > > I don't believe virtio-gpio needs a SET_WAKEUP command.
> > > >
> > > > In the RPMSG case, SET_WAKEUP is required because it performs an
> > > > operation on the remote processor, so the remote side must be
> > > > explicitly
> > > notified.
> > >
> > > What operations would that be?
> > >
> >
> > The operation is enabling the line as a wakeup source. In practice,
> > this involves configuring hardware-specific wakeup settings (e.g.,
> > register bits) on the remote processor, so the remote side must be expl=
icitly
> notified through SET_WAKEUP.
> >
>=20
> As I said before, we are not enhancing the virtio-gpio specification.  If=
 the
> functionality is not part of the specification, it is not part of this pr=
otocol.
>=20

It's about the functionality, not the specification.

Without SET_WAKEUP, a virtio-GPIO line can still be used as a wakeup source=
, but=20
an RPMSG implementation cannot because the remote processor is never notifi=
ed=20
to configure its wakeup settings.

So both implementations may follow the same virtio-gpio specification, but =
they do=20
not provide the same wakeup functionality.

Anyway, if you want to drop the function, the command can be removed.

Shenwei

> >
> > > >
> > > > For virtio-gpio, however, everything is handled locally. The other
> > > > side does not need to perform any action, so sending a SET_WAKEUP
> > > > command
> > > appears unnecessary.
> > >
> > > What is "everything"?
> > >
> >
> > I mean masking, unmasking, and marking the interrupt as a wakeup
> > source. All of these operations are handled on local processor.
>=20
> There may be enough capability in your remote processor to do all that, b=
ut we
> can't assume the same applies to all implementations.  rpmsg-gpio is not =
about
> inventing a new protocol or delegating actions to the remote processor.  =
It is
> about carrying virtio-gpio packets on top of RPMSG.  It needs to operate
> _exactly_ the same way as virtio-gpio.
>=20
> >
> > Shenwei
> >
> > > >
> > > >
> > > > > > +
> > > > > > +**Request:**
> > > > > > +
> > > > > > +.. code-block:: none
> > > > > > +
> > > > > > +   +------+------+------+------+------+------+------+------+
> > > > > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > > > > +   |      1      |    line     |           value           |
> > > > > > +   +------+------+------+------+------+------+------+------+
> > > > > > +
> > > > > > +- **value**: Wakeup enable.
> > > > > > +
> > > > > > +  The remote system should always aim to stay in a
> > > > > > + power-efficient state by  shutting down or clock-gating the
> > > > > > + GPIO blocks that aren't in use. Since  the remoteproc driver
> > > > > > + is responsible for managing the power states of the  remote
> > > > > > + firmware, the GPIO driver does not require to know the
> > > > > > + firmware's
> > > running states.
> > > > > > +
> > > > > > +  When the wakeup bit is set, the remote firmware should
> > > > > > + configure the line  as a wakeup source. The firmware should
> > > > > > + send the notification message to  Linux after it is woken fro=
m the GPIO
> line.
> > > > > > +
> > > > > > +  - 0: Disable wakeup from GPIO
> > > > > > +  - 1: Enable wakeup from GPIO
> > > > > > +
> > > > > > +**Reply:**
> > > > > > +
> > > > > > +.. code-block:: none
> > > > > > +
> > > > > > +   +------+--------+--------+
> > > > > > +   | 0x00 |  0x01  |  0x02  |
> > > > > > +   |   1  | status |    0   |
> > > > > > +   +------+--------+--------+
> > > > > > +
> > > > > > +- **status**:
> > > > > > +
> > > > > > +  - 0: Ok
> > > > > > +  - 1: Error
> > > > > > +
> > > > > > +Notification Message
> > > > > > +--------------------
> > > > >
> > > > > "Interrupt Messages"
> > > > >
> > > > > > +
> > > > > > +Notifications are sent by the remote core and they have
> > > > > > +**Type=3D2 (GPIO_RPMSG_NOTIFY)**:
> > > > > > +
> > > > > > +When a GPIO line asserts an interrupt on the remote
> > > > > > +processor, the firmware should immediately mask the
> > > > > > +corresponding interrupt source and send a notification
> > > > > > +message to the Linux. Upon completion of the interrupt
> > > > > > +handling on the Linux side, the driver should issue a command
> > > > > > +**SET_IRQ_TYPE** to the firmware to
> > > unmask the interrupt.
> > > > > > +
> > > > > > +A Notification message can arrive between a SEND and its
> > > > > > +REPLY message, and the driver is expected to handle this scena=
rio.
> > > > > > +
> > > > > > +.. code-block:: none
> > > > > > +
> > > > > > +   +------+------+--------+
> > > > > > +   | 0x00 | 0x01 |  0x02  |
> > > > > > +   |   2  | line | trigger|
> > > > > > +   +------+------+--------+
> > > > >
> > > > > 2 things here:
> > > > >
> > > > > 1) You did not include messages that mask and unmask interrupts
> > > > > at the driver side.
> > > >
> > > > Interrupt masking and unmasking are handled entirely on the local
> processor.
> > > >
> > > > When an interrupt occurs, the remote system masks the interrupt
> > > > and then sends a notification to Linux. After Linux processes the
> > > > notification, it sends a SET_IRQ_TYPE message back to the remote
> > > > system,
> > > which then unmasks the interrupt.
> > >
> > > This is the kind of information that should be part of this documenta=
tion.
> > >
> > > >
> > > > Thanks,
> > > > Shenwei
> > > >
> > > > >
> > > > > 2) We are carrying virtio-gpio messages on top of RPMSG and as
> > > > > such, this whole protocol should be about thar:
> > > > >
> > > > > +------+------+--------+--------
> > > > > | 0x00 |       payload         |
> > > > > |  Q   |                       |
> > > > > +------+------+--------+--------
> > > > >
> > > > > Q =3D 0 requestq
> > > > > Q =3D 1 eventq
> > > > >
> > > > > The "payload" part is simply the format of the messages as found
> > > > > in the virtio- gpio specification.  From there, the only thing
> > > > > left to mention is which messages are not supported, i.e get line=
 names.
> > > > >
> > > > > > +
> > > > > > +- **line**: The GPIO line (pin) index of the port.
> > > > > > +
> > > > > > +- **trigger**: Optional parameter to indicate the trigger even=
t type.
> > > > >
> > > > > Not part of the spec - remove.
> > > > >
> > > > > Given the refactoring work that is still needed, I will not look
> > > > > at the implementation.
> > > > >
> > > > > Thanks,
> > > > > Mathieu
> > > > >
> > > > > > +
> > > > > > diff --git a/Documentation/driver-api/gpio/index.rst
> > > > > > b/Documentation/driver-api/gpio/index.rst
> > > > > > index bee58f709b9a..e5eb1f82f01f 100644
> > > > > > --- a/Documentation/driver-api/gpio/index.rst
> > > > > > +++ b/Documentation/driver-api/gpio/index.rst
> > > > > > @@ -16,6 +16,7 @@ Contents:
> > > > > >     drivers-on-gpio
> > > > > >     bt8xxgpio
> > > > > >     pca953x
> > > > > > +   gpio-rpmsg
> > > > > >
> > > > > >  Core
> > > > > >  =3D=3D=3D=3D
> > > > > > --
> > > > > > 2.43.0
> > > > > >
