Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011060.outbound.protection.outlook.com [52.101.70.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3321F8BA6;
	Fri,  3 Oct 2025 18:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759516907; cv=fail; b=Q4QRuc8wcwzHpqBao9gUN8uPUa53eQrGiWGioKpio3u6TO/7BLMaXU/r8vOj8ZEVlMkjGUcihT95Q7DyqPOSsud3AoteB05I6hthdZQpZGdj+F9M8vzvt8hzVaTo4NxcyMIVn+nt/qGP/7MdoAlMtwMkhmktJG6H+tbsfrB+Wuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759516907; c=relaxed/simple;
	bh=Z6JfD4qVbP7aEoxtXYDUAoYha+jLS+SIw2+CafgWNLc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SYE/4AN6nRBQ7wVdBN2IpafbHY1KfIkvXCcElQMqvFpe2MOfCQAekVCp2bpKxS/0ZkwVH6m58+9iPNcamOV71P2eQJUNePgkMmHuAPknKR8VBmyIGS4F0BfWYHqD18Elb6RBOzzQjc24yxRGmoQUcC+YUiZafddM0O2vvM576WY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=D21Aw3b5; arc=fail smtp.client-ip=52.101.70.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="D21Aw3b5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWmeOxtYr0JAEWHOUjixQOYHOPUe09DnR4EPxXHDW9ZQX9ijJrBxRXvCOUhDKL8IwbiiAILwFAkb9WaBgGXusVzVMTxfAn6DbUrqM2A5xFwLJcksb0wwdnfSbCdkMDB1fD4c9zYZK12MwUUPMIVU82mHxO61czzlKAiuxSE+Yct1qVd+3NmCy8+uLbeNqfpQewW5TNlu759XSdgzcaH6Dv7/Ja+OYTgcQ5TXiNMJbiRkFwAl1Vwc4T8un+8DEK2yPv2b0un7gqD022SWXUTW0Fp3dkNBUcmnvVKvFZ+TRk8G6bwTVjTjPZSeZ+OMAwj9f4wLF5sZ1CdOlwPS0D7Kog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDsFgHX4qNibaWTYXFDZL/lMnF1+Tl/y9oHt9IaLkv0=;
 b=XGVBhmXwNaDMV1uiC62x0E3YCAMMAZJ6cx5cI8TihX8VHc4dchVPGSGDLTLa/eNmTx9M4WnfK7Y+pb/uVsSba1cbD0k5u2WRBbzOOV3BYo4dah1QTUbCOa+NYvf4ItFVEm08HJE9MJgp6i4epShS3lik+tiBe8eS4tEUmFHqAzsU74CRBQH842/XkNqOxM3L8o93QoqSQW33l6ILoYY3AMKAr/tlImMznPl9bGUfhIDehbrRku3qke/uU8t6v0FLaMWWxND5ymdoV1qTYuNhTIwAcrY9EuoEVwlkEI/SHiQyb0RzQgWd9ZBcAAB7763CSjwpYlCcENlJ0VxrAFHoYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDsFgHX4qNibaWTYXFDZL/lMnF1+Tl/y9oHt9IaLkv0=;
 b=D21Aw3b5Y5X5y9ynEQpKVd487qNoPTGTXVXykbGpR+hPfmW8G+LmyJYjHp8BrNVNqbvm21Evg8193kGKNibWX4x3tNpy1+6apAdeTLBvdZVX3srBIls/mH7hdCX66fccLM2Nn9vHS258V7TNXfgDWmwaJYQDZmtW8TSCc7/z5+893gfbEZUIiYRxTksnDeDwY4Di8ZlQ7d6o8vHt4gTLsW6UzI9OjI1luBnBIuOXkqmRpmh+N4fIb5L+32Gn3FR0EGblk7E57dMk6xybteR1P7Oa+uc9WQBwjX8TjB4InD1T63OsRW0s4QDUuNqfnqwJ/58ZSr2M0kzOV+Vqgmikig==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AMDPR04MB11701.eurprd04.prod.outlook.com (2603:10a6:20b:71a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.14; Fri, 3 Oct
 2025 18:41:41 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%4]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 18:41:41 +0000
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
Thread-Index: AQHcNJVbNnigz0O5AUywNKZI2ZREew==
Date: Fri, 3 Oct 2025 18:41:41 +0000
Message-ID:
 <PAXPR04MB9185924ED129E87C77F34DCC89E4A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20250922200413.309707-1-shenwei.wang@nxp.com>
 <20250922200413.309707-4-shenwei.wang@nxp.com>
 <86bf1252-9b2b-4001-830d-2746403539e6@foss.st.com>
In-Reply-To: <86bf1252-9b2b-4001-830d-2746403539e6@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AMDPR04MB11701:EE_
x-ms-office365-filtering-correlation-id: 2eb877b8-a7fc-42fc-0de1-08de02ac7e99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|921020|13003099007|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?rfAFUSMPOTKr8rLu+mDUPGZjW2Aqca8aAYEI98srd5adPstsmmXBV5kVLmXR?=
 =?us-ascii?Q?PmLi7QlLG+Ncg+96X+9pmsl0nALc+6w+QwxvEn7s1qRk9R2YpTaQXnvC7QaK?=
 =?us-ascii?Q?65bb121mg79+6YvHP1nM8JvsaiaIAc5CfScbEyUxofeOm5sEoUxXg01/4T7m?=
 =?us-ascii?Q?nmkRJyQTckMscCir12cd/uQquNyh8vCvljSPRTk0pjhmFFxy2rhPIp0Lx31F?=
 =?us-ascii?Q?ZqT+1YndC9hs2hgUOsxlhD+BPPns5UbNuoJrJ4b/sHbSxcjov893dZoUzDEs?=
 =?us-ascii?Q?IX0mM+KzUZ6JTc5s8jT+ETvc/t6Zjyccb7tFMulqRIJwb9ZxmFO3qk4vRCz0?=
 =?us-ascii?Q?mN6VN4fsgrDTH26ASJ3fzdA5m300QEMptOgYBaSW9JBAQPEhoig28iXwW6VC?=
 =?us-ascii?Q?6EWvjelxpTrcfTQJIEzTZdwdueF3DGUcIxUUIml9F71x0/y9n8Kyn5SLXXaR?=
 =?us-ascii?Q?icrrOJcnC8alPxi2a/Ysc+cOODSSZWszHlqBzAssduBHADmIlh2tAuzE96Ka?=
 =?us-ascii?Q?z5haBqWxxc2Ysd2kF4gBMIbRzKRk4e0/6JTgHQsQEyn2oGo4PYe84QxotR/D?=
 =?us-ascii?Q?t60cgTmrmq9YJpyR7m1VIGmM4fl+m+2kdmnVgsIiF+YCF7eyOco5oYdEEta6?=
 =?us-ascii?Q?L952wQS9nHu0NPn3HLX7BmzSnS2RoPI2Lo20maFXB8MTTb1hd5bGltSHujVG?=
 =?us-ascii?Q?CqjlYBfmm7Er/bxEpuAmsjjbZCU0eQ5pXJSR0sgkjyah7slppHXJsU+0GTn5?=
 =?us-ascii?Q?0mVs+MpDfy+3axKMVSaIxjyFBBPlv6ZLR4uJcgyM14N1ILd3RFDa6dbYwDfl?=
 =?us-ascii?Q?C3ijvAuOR5ZKAFp8+KJbOLONb3RzfOviXdneMBYqXe3TXCf4hCAJhzBmqDpq?=
 =?us-ascii?Q?u/LRCa/0K+69GqMaoE1GkKmVNS0OPg35B05HWWsaD+b62U0GaXEhKB35QGQP?=
 =?us-ascii?Q?6iAeBI1uth5cGMIegHcvsAm+tSu4s4EKa7TiWwnUustuFSbWr2dsZCQ1a4DM?=
 =?us-ascii?Q?l/nL8oeNbjwcvNVoz7R+2L/vg6VaNa7+nz6bnCjNz/KOjjE+gTs/WUa60u85?=
 =?us-ascii?Q?1q/G6iKZFuY8GLLdYvQFN4To5Z2Ap9m5hrghGFuw4V9QhAnfnsSRem9205eh?=
 =?us-ascii?Q?rE5t+RgSfwcghljwujTnNM8nv+k71Pe/eOJqCAuXFQoDhUpS+FHF0az+7YVv?=
 =?us-ascii?Q?I+ZLkkMduQsmoCTBdrslGmlXs6YOuvLAOhmDnv5me+tHTnHZyhbGWiFHokfh?=
 =?us-ascii?Q?awYhmrqNC8EFUk5OHqNUJEguwc4TnNDH3R0vf8lsPDI41f5HCEWgPiYigG/G?=
 =?us-ascii?Q?bM8zdm/Kyzib+RGoKgwRJJ5lswZP5f0Pt7U59jyV9Fqsgih/upUGvao9PwSO?=
 =?us-ascii?Q?crwZbFcBiYJ1cehGs9hYRh/RBaRSMVJamb1dZ5R6gemxopQLRz83IgI1KaJA?=
 =?us-ascii?Q?CCTObgd0lrFbDnzK9ZuV09b8KjqSBXCTxzoTymopbq+RNSQZG68S9g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(921020)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3vMTAc59BVHig4t6DXyEqpIqxsVzRwelyXO+LQ+Cbhtyp9nHAPxGLNDOSwnQ?=
 =?us-ascii?Q?SAmM3y2zidVeUztz5H5Fj3Vt1GG1BRF4zAdunmW/N6LqQ/NsmAQHQ0O2kbGi?=
 =?us-ascii?Q?gXyKlmqmCa/YRxLfQBWpMdYyQraZ8kPZ/a+i1I4d7zw1srl8T7fVIT5zCz7r?=
 =?us-ascii?Q?2vIThg9Odiwme0IkcwTLc1MMFF+Y4BgJa/ZaCAKe1veRfNGvsKJoMu/Azs9r?=
 =?us-ascii?Q?3ksp3608xQ0VUmijDb8D+wqcg3q0P15rOV6b99PLsHoBlTNaO5rzs0OCluCA?=
 =?us-ascii?Q?Eagb2sRhfxx374jGOJcemHmYlC3b89MoExbbbqgIiZqJkB8siBrx/qXf+s/b?=
 =?us-ascii?Q?BhKB9xvMA8NX51p0lJ/CV0HQtG62oHWxJQ7SmKsufMyd89TQwLnzWyNb70rI?=
 =?us-ascii?Q?MAhx5GtViUdxS28+bwbrnBO9Yxlo1Gc6znUjfSubuiCPh5CJa6KjB39IZ1vi?=
 =?us-ascii?Q?e7/wVTgWPg6ubLG2QqOyiw4Q1ei3Yxu/8ydYyPNI5oS26b4/Nv8WBxGDkIRF?=
 =?us-ascii?Q?0kryjWt+nqt4zaTMzneeBjqEVYbRG/3YCqFy4/94JLNjK71XxkJYAh8I2g0D?=
 =?us-ascii?Q?IcashvVkgMB0fK/zbq2/gh+CpPtFJtIBHQ9Ofnz47t0rJz6NdAk2KrtqFaQ0?=
 =?us-ascii?Q?+VvHHt295jh/UPeV9UGI83MdhYXyJrrgSXU0ItN3Dm11LdN9AvVxwDIbv7Z6?=
 =?us-ascii?Q?KGy7SMvHK+4fZurx+wlAtqX0suAitkISBge6id2Csw8DCaZZEJzUipmz8Gs8?=
 =?us-ascii?Q?bLYKYGgS2663GiuSRR9Kjwp+S7ISijcUusnzemy21zNO5cFPGf/2g3rKvOzO?=
 =?us-ascii?Q?iSdTxnwYQByWoX3xbftGFeLnuHGC33Bh10hb7+8nhcNWgFkcvGNsjW1pRxYd?=
 =?us-ascii?Q?was1BvAZXCaipe41+szPGU9DYvCUaELx5jFoxaUqSv5WLnOtGnH+JY2cchW0?=
 =?us-ascii?Q?hqgX5W0y4N0ZVJ5pzlGplH75blo2cKCz7g6YslwOWGy/yb1Sez4r6mpokxnw?=
 =?us-ascii?Q?V6oWQp2YtRlhte9FEHJmmkAgX00UEnMNA35BPCOrgu5uiY/XvELas8PLRk2g?=
 =?us-ascii?Q?ktDk+P1eLDr+Nq2Pwn6zd4hLyg0y1Hi8TnElQTwM5SzOgZTokLxXhCCERZ/F?=
 =?us-ascii?Q?60mxOrIYjs9x22nQvHnNEqsgu/ow30SOVk8/VsC4cGAva2vIM3zPlBikjPx8?=
 =?us-ascii?Q?t3M25jTLfdqM8vShpSoOpWAiE5B45UxTHcFl6CxH4zyLYyl6qZwaqPmYIeOX?=
 =?us-ascii?Q?p18f80/xNBPMDHnM94v4q6Ky5mXQF7C4waInjJRLDyBQ5s7KyAapVc+tRFh+?=
 =?us-ascii?Q?/f/O1iFMNv4yrgBLLTLLck1b8Uz8E4EjlCyer/7DDy5hxkQdeA3YnRF2UC1x?=
 =?us-ascii?Q?PmKIxN4HBQmnx5xYAVEnwYmA4V+jQccHVpuzVEvaULPSyYWEbtrTG3M/DJi0?=
 =?us-ascii?Q?4C1hxfJsQ30j54cUmBUqgfOMZIa3CNtuU7T4E83VoVJaIFYSo7AIj1Roe2UY?=
 =?us-ascii?Q?QG2HBknDeALXmBebaRuWN7e/2VxrOvOsG7oS37swAts/qGBFM24FfG29jvbn?=
 =?us-ascii?Q?iY38EDHmrsEUeJEPZww=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb877b8-a7fc-42fc-0de1-08de02ac7e99
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2025 18:41:41.4235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N6pEOui2BblHTzeP3R2Kb2C4rM1WCtBRMGvqygpoRM7c7EqTDn6uZk7YCalLc034RyHu7jfGZ0NdWGbv+o0CGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11701

Hi Arnaud,

> -----Original Message-----
> From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
> Sent: Friday, October 3, 2025 2:40 AM
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
> > These processors communicate via the RPMSG protocol.
> > The driver implements the standard GPIO interface, allowing the Linux
> > side to control GPIO controllers which reside in the remote processor
> > via RPMSG protocol.
>
> What about my request in previous version to make this driver generic?
>

The only platform-dependent part of this driver is the layout of the messag=
e packet, which defines the
communication protocol between the host and the remote processor. It would =
be challenging to require
other vendors to follow our protocol and conform to the expected behavior.

> In ST we have similar driver in downstream, we would be interested in reu=
sing it if
> generic. Indeed we need some rpmsg mechanism for gpio-interrupt. Today we
> have a downstream rpmsg driver [1][2] that could migrate on a generic rpm=
sg-
> gpio driver.
>
> > +
> > +#include <linux/err.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/rpmsg/imx_rpmsg.h>
> > +#include <linux/init.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/rpmsg.h>
> > +
> > +#define IMX_RPMSG_GPIO_PER_PORT      32
> > +#define RPMSG_TIMEOUT        1000
> > +
> > +enum gpio_input_trigger_type {
> > +     GPIO_RPMSG_TRI_IGNORE,
> > +     GPIO_RPMSG_TRI_RISING,
> > +     GPIO_RPMSG_TRI_FALLING,
> > +     GPIO_RPMSG_TRI_BOTH_EDGE,
> > +     GPIO_RPMSG_TRI_LOW_LEVEL,
> > +     GPIO_RPMSG_TRI_HIGH_LEVEL,
> > +};
> What about taking inspiration from the|IRQ_TYPE|bitfield defined in|irq.h=
|?
> For instance:
> GPIO_RPMSG_TRI_BOTH_EDGE =3D GPIO_RPMSG_TRI_FALLING |
> GPIO_RPMSG_TRI_RISING,

Yes, the suggestion is better.

> > +
> > +enum gpio_rpmsg_header_type {
> > +     GPIO_RPMSG_SETUP,
> > +     GPIO_RPMSG_REPLY,
> > +     GPIO_RPMSG_NOTIFY,
> > +};
> > +
> > +enum gpio_rpmsg_header_cmd {
> > +     GPIO_RPMSG_INPUT_INIT,
> > +     GPIO_RPMSG_OUTPUT_INIT,
> > +     GPIO_RPMSG_INPUT_GET,
> > +};
> > +
> > +struct gpio_rpmsg_data {
> > +     struct imx_rpmsg_head header;
> > +     u8 pin_idx;
> > +     u8 port_idx;
> > +     union {
> > +             u8 event;
> > +             u8 retcode;
> > +             u8 value;
> > +     } out;
> > +     union {
> > +             u8 wakeup;
> > +             u8 value;
> nitpicking put "value" field out of union as common

I'm afraid we can't make it common, as the two 'value' fields serve differe=
nt purposes-one is used for outgoing messages and
the other for incoming messages-and they are located in different parts of =
the packet.

> > +     } in;
> > +} __packed __aligned(8);
>
> Any reason to pack it an align it?
> This structure will be copied in the RPMSg payload, right?
>

Yes. The message will then be transmitted via the MU hardware to the remote=
 processor, so proper alignment is required.

> I also wonder if that definition should not be in a header file with doub=
le licensing
> that the DT. Indeed this need to be common with the remote side
> implementation  that can be non GPL implementation.
>
> > +
> > +struct imx_rpmsg_gpio_pin {
> > +     u8 irq_shutdown;
> > +     u8 irq_unmask;
> > +     u8 irq_mask;
> > +     u32 irq_wake_enable;
> > +     u32 irq_type;
> > +     struct gpio_rpmsg_data msg;
> > +};
> > +
> > +struct imx_gpio_rpmsg_info {
> > +     struct rpmsg_device *rpdev;
> > +     struct gpio_rpmsg_data *notify_msg;
> > +     struct gpio_rpmsg_data *reply_msg;
> > +     struct completion cmd_complete;
> > +     struct mutex lock;
> > +     msg->pin_idx =3D gpio;
> > +     msg->port_idx =3D port->idx;
> > +
> > +     ret =3D gpio_send_message(port, msg, true);
> > +     if (!ret)
> > +             ret =3D !!port->gpio_pins[gpio].msg.in.value;
> Does this code is save?  !! return a boolean right?
> why not force to 1 if  greater that 1?
>

This approach is intended to simplify the implementation. Forcing  to 1 wou=
ld introduce an additional condition check.
I'm open to changing it if that's considered standard practice.

> > +
> > +     return ret;
> > +}
> > +
> > +static int imx_rpmsg_gpio_direction_input(struct gpio_chip *gc,
> > +                                       unsigned int gpio) {
> > +     struct imx_rpmsg_gpio_port *port =3D gpiochip_get_data(gc);
> > +     struct gpio_rpmsg_data *msg =3D NULL;
> > +
> > +     guard(mutex)(&port->info.lock);
> > +
> > +     msg =3D gpio_get_pin_msg(port, gpio);
> > +     msg->header.cate =3D IMX_RPMSG_GPIO;
> Do you use a single rpmsg channel for several feature?
> Any reason to not use one rpmsg channel per feature category?
>

The current implementation on the remote side uses a single channel to hand=
le all GPIO controllers.
However, this driver itself does not have that limitation.

> > +     msg->header.major =3D IMX_RMPSG_MAJOR;
> > +     msg->header.minor =3D IMX_RMPSG_MINOR;
> > +     msg->header.type =3D GPIO_RPMSG_SETUP;
> > +     msg->header.cmd =3D GPIO_RPMSG_INPUT_INIT;
> > +     msg->pin_idx =3D gpio;
> > +     msg->port_idx =3D port->idx;
> > +
> > +     msg->out.event =3D GPIO_RPMSG_TRI_IGNORE;
> > +     msg->in.wakeup =3D 0;
> > +
> > +     return gpio_send_message(port, msg, true); }
> > +
> > +static inline void imx_rpmsg_gpio_direction_output_init(struct gpio_ch=
ip *gc,
> > +             unsigned int gpio, int val, struct gpio_rpmsg_data *msg)
> > +
> > +static struct platform_driver imx_rpmsg_gpio_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "gpio-imx-rpmsg",
> > +             .of_match_table =3D imx_rpmsg_gpio_dt_ids,
> > +     },
> > +     .probe =3D imx_rpmsg_gpio_probe,
> > +};
> > +
> > +module_platform_driver(imx_rpmsg_gpio_driver);
> This implementation seems strange to me.
> You have a platform driver, but your RPMsg driver appears split between t=
his
> driver and the remoteproc driver, especially regarding the
> imx_rpmsg_endpoint_probe() function.
>

See my reply below.

>  From my point of view, this driver should declare both a platform_driver=
 and an
> rpmsg_driver structures.
>
> Your imx_rpmsg_gpio_driver platform driver should be probed by your
> remoteproc platform.
> This platform driver would be responsible for:
> - Parsing the device tree node
> - Registering the RPMsg driver
>
> Then, the RPMsg device should be probed either by the remote processor us=
ing
> the name service announcement mechanism or if not possible by your
> remoteproc driver.
>

The idea is to probe the GPIO driver successfully only after the remote pro=
cessor is online and has sent the name service announcement.
Until then, the GPIO driver will remain in a deferred state, ensuring that =
all consumers of the associated GPIOs are also deferred.
The implementation you provided below does not guarantee that the related c=
onsumers will be properly deferred. This is the most
important behavior for a GPIO/I2C controllers.

Thanks,
Shenwei

> To better understand my proposal you can have a look to [1]and [2].
> Here is another example for an rpmsg_i2c( ST downstream implementation):
> https://github.co/
> m%2FSTMicroelectronics%2Flinux%2Fblob%2Fv6.6-
> stm32mp%2Fdrivers%2Fi2c%2Fbusses%2Fi2c-
> rpmsg.c&data=3D05%7C02%7Cshenwei.wang%40nxp.com%7C22a9c88be60b474e
> 391008de02502ec7%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63
> 8950740622597592%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRyd
> WUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%
> 3D%7C0%7C%7C%7C&sdata=3D6lCk20Qhb%2F0MTw0NFtto7tj7EFYwZ%2BlOR1F3
> Qk7kQn8%3D&reserved=3D0
> https://github.co/
> m%2FSTMicroelectronics%2Flinux%2Fblob%2Fv6.6-
> stm32mp%2FDocumentation%2Fdevicetree%2Fbindings%2Fi2c%2Fi2c-
> rpmsg.yaml&data=3D05%7C02%7Cshenwei.wang%40nxp.com%7C22a9c88be60b4
> 74e391008de02502ec7%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7
> C638950740622612512%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnR
> ydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D
> %3D%7C0%7C%7C%7C&sdata=3D4Gva%2FpqP2u8T57XDxSDaoHhvDeJ%2Fo5HtAB
> L9TY5gbDI%3D&reserved=3D0
>
> Thanks and Regards,
> Arnaud
>
> > +
> > +MODULE_AUTHOR("NXP Semiconductor");
> > +MODULE_DESCRIPTION("NXP i.MX SoC rpmsg gpio driver");
> > +MODULE_LICENSE("GPL");

