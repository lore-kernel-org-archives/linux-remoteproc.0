Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010014.outbound.protection.outlook.com [52.101.84.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14FD2D0C92;
	Fri,  9 Jan 2026 06:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767940303; cv=fail; b=f+bH98Az0lBpxy4yInYQey3l9yjXIyOWgKv2Fo4PB8s9pZ6wUwFmqg5WCCx165HNev+0Q0tLu8Mw7oYJP0Plo7yiBq71tjzCBcqva0a9qoKnzqjcobBZ9ERFOGUV3i9nRt6D1cZOEn+kCQj2kiYMXZTGCuYw7iukAQgwNZmO9BE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767940303; c=relaxed/simple;
	bh=cvKi8SOT9rima1ASNmy2aXelu03lFeOpmQHE5jIjoVE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fwdTR6VxWSji5bIrkcafeN7KDnYDw2zB4pmyGJys46kLPV3wLvePfwoLC0VuCjO+yldMOrXUAJziKnJrUHjh2kLUgq62Y+MCjx4fJvKJUhfLEBGWcBE0FKYHeXiWUW8+m8HXzu5m1h4BANr56cbHg7ToNqtq/8RpiS1InHEplFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dMm1K4IB; arc=fail smtp.client-ip=52.101.84.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dMm1K4IB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZ/HBLD8q/BDIXWUdRt2leqHx6JLZMQE5y2tOqFqa1/K8q7fCkMz2jGsKZqPQKJpbX8z3gdpl2MTOYqcoijLMvmTYJRzwtlQDub2LOKeJ43gzkpp7/j/dCiJMdjri2m0K0ogqa/mhjWc1IFrCkTjstKbZ2Ja3z325ScTSHRwkcn0QJF2WkPg+1Hto8QIuyFRDqUOaNXP1tUCb4yrM7h79GcKco8ovhFaxeT+pRhdu6LOADCn2mD4cDvmAQUOKde7wzvqFhlBCR2E+0HKuQwQ8SB8wWBY/dQphkREzjncjLcQHGZ3mtEf1v7N5kEeLQvMAbVxLypSTdKvgJgqDwaSSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XkLLjsRiDgA5g6tfEeefhWNKNKkr/JhR6SB2dNXlH4=;
 b=YwdaYUeHD+VqXQVquhJR+W7w6PARfr8DtukxNvdq8YFwfZeGyF3L/svXS6AMqPcC7dnvqehjhJmIFWN62pFaaiAO6vmKVTDmWT6j8HKRbP2R7RtgO601K4SLqcz5FxxydSz7fawIq6rsF01eYmqWa2Eq2R95c//xe7OO6unCfjBEFDAqZX7km9Q3EpApVXxBqWhwykc369Ck4QCjrcCiEaxyc2njlTwAOiK5LRAhuOdfcGsxXtrBEcCcAl+2I7+uTRCLySyZ/Z4Mm9E1BZXlLUfY8GhAKeBWRRoRiYbfS9CvR+WUWmCmpwu761SRlZJdXsn2E/2nc9cJwz6PdS96eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XkLLjsRiDgA5g6tfEeefhWNKNKkr/JhR6SB2dNXlH4=;
 b=dMm1K4IBzj2hNQeIIuAkdOkq1b90CaAC+Ptegor3Z9TrOI+WVidBiVdOMcU/TsekCorWC4Veix3Gtn3I4GXsEX+4H0jiZGB93dXzBe04JF96AFPS9yXDHtJPgjAPoikSTQnZ/QrZTf8ua/W0IbuKYyrnzQpUSS50atA8t4svcu56lIaFbbntVwDQzbmsKsZC/SsSSNlW8SKdbN2n7e3thvAJ379mS/VGYf0LDsDV97lLS4WDC1qUaE2BXz3zUyf6PC4cq3JkKcvOvxHRZCeLhETe1GXL3vgs1mEYLaCJt9ZEeYjn6T6AvMKaXz/DDmpk0RMXn6bjfQVplNhu3yrArg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7891.eurprd04.prod.outlook.com (2603:10a6:20b:237::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 06:31:38 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 06:31:38 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Frank Li <frank.li@nxp.com>, Daniel Baluta
	<daniel.baluta@nxp.com>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 4/5] remoteproc: imx_rproc: Add support for System
 Manager API
Thread-Topic: [PATCH v5 4/5] remoteproc: imx_rproc: Add support for System
 Manager API
Thread-Index: AQHcb928ti36/V6ulE6fyk0pzEPtrLVHKqOAgAEJAACAAE5kAIABAHRQ
Date: Fri, 9 Jan 2026 06:31:38 +0000
Message-ID:
 <PAXPR04MB8459A8FB2A2AF57C2F506BCE8882A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20251218-imx95-rproc-2025-12-18-v5-0-b56a27d4158f@nxp.com>
 <20251218-imx95-rproc-2025-12-18-v5-4-b56a27d4158f@nxp.com>
 <aV6ow9dGUNaPDqZg@p14s> <aV+HEAzwNSOCUx88@shlinux89> <aV_I0iGYt1lxEIUw@p14s>
In-Reply-To: <aV_I0iGYt1lxEIUw@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM8PR04MB7891:EE_
x-ms-office365-filtering-correlation-id: a678e539-6b33-4099-f904-08de4f48be7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?KgIZpnu9nZ7wxClytgmQdo5+r3e5dfcuvrlpOyaYNOzLDk9jkkcbX2kIxpo7?=
 =?us-ascii?Q?krO2/2q/92VxLMTWykx4EY7i/0Ng1lzBmrq9LFYJjZn2IpTuRf2OKIBLJNdW?=
 =?us-ascii?Q?KZgNyHHsID7XlkrACISSCoNZijGqTcHLz2t9LgTPK0IFad/08tOOBVuiBIY/?=
 =?us-ascii?Q?4Nr4X58Z3JU+c0I5G8M9p3mbdcHzl9vIojcgIUY+q3Q4Tg8tSff+HciwNIPK?=
 =?us-ascii?Q?umMTf+xVZW3/oiT3WVCCo6m672fzE1Wq5GdzsAFenkuGNRIECL+zkchXju65?=
 =?us-ascii?Q?3QKSyVubJ11iK2ma9ywr/T7+fHiblq1QLYKL1Uget0zgz7nxhASQNlW9tGoZ?=
 =?us-ascii?Q?TVLDWMjVgn7952PAmgKV+3dbml5cFkfYr43Iunqkw6jS6UMgyYtDvK/nyGtw?=
 =?us-ascii?Q?DRmsPKUWxL/CbZLV+iLEXtAJRwzGa/5Ps4XXdJxA64T99MeXLnr/pjPsSkHa?=
 =?us-ascii?Q?V4xmlFqcJ+sn5/Zq/rCFuk4xxULVBUxL/ibpDdWv8O8soZaSivtBF3JB0xbC?=
 =?us-ascii?Q?VDYwSRNxzvwgISQe+NrnTrsX0QaMTMGtO7joDTRLk9qFRi0UOAMz9aNswTbE?=
 =?us-ascii?Q?onDRUVNvP9axRQ6i+3s5kzwZIwHVzka4EtQJnwmihMggOKqVnlaeUbVMwV4c?=
 =?us-ascii?Q?JjAY2IUDzwOv/SY/H6rWMBLl/7rxz70YbEzqJ/ErKOexNgRIh7cUnvciyFCD?=
 =?us-ascii?Q?B8c/3L7nvFh6DEH7iUkOgd4tEYeMUWWmMsng2IOdNEzEvzhJnAkGS4blEvNZ?=
 =?us-ascii?Q?ApjZE1DX/n50fm20tlSI91N684AAeJ/1HDdAzwVFfAbqnTZxg3Sh+vyAI3ER?=
 =?us-ascii?Q?5sOnVSlom2fmu3lX7B3OAuw5UJJJYvbYJXo6QtbT06X1NWZnPoxvzVCQBo3Z?=
 =?us-ascii?Q?Z2cwNWBKaKWs3iM+6KaP8RU0b3Ez+Vxp508jUud0EneGzm0HAOcG9cRSh7nd?=
 =?us-ascii?Q?roZ+tDl92dr/+1aWJ3JSH8qnn6cpxs7kBUQG2OPBEnHrAxxP/Okkt0XOdQie?=
 =?us-ascii?Q?8uPHIpEh/Wxyja6z9WqxU+TaAiJMx5UpG4tvffZwM+uUH4uxsOqOU7jd8L/G?=
 =?us-ascii?Q?IFTL8MkTVNYCwfIVYBEqv2el3MbYDYvEC/JEVCU3HScPR35pZDRHTRm9k+gR?=
 =?us-ascii?Q?mAOn8RVQ2+x40CxjbJdns/txl8sojqcVGKsYU18jqp0TT8tWxxfUZd4kkKeu?=
 =?us-ascii?Q?eCniT0Yj7hxN6j7PtQpCpTCTw+VcNZf3uSo4QhAhlR0K/ZsqWzNlQpmNLmqt?=
 =?us-ascii?Q?rmaP/zatn62EDW1oGEqLMv/r4tyYn8wlFBPqWu9d7i4Gi6LPZ1JCM95aU8O7?=
 =?us-ascii?Q?UYtf/s017JCSpFVTDlihH5nqUz3ramBwyFBvzf5HwunQhmZEZHCam9g8cjVQ?=
 =?us-ascii?Q?+9I5wWi5EO505MTb7mBWRD0lxr+GFRH8RXsOr+lVbEUBjQw9G65MSt2LPvCs?=
 =?us-ascii?Q?0+m8Gg49jEClDIkL6PPo7cjppMqytsuADK7K1aUePiTOltFK79mq7Dy6Hy1x?=
 =?us-ascii?Q?lNnrL4ZkZpVvW1cRNZx6vXhLcoAUCAvEiLiX?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?cGNJbKfWKPIxJdxVP4d83YRxpnLmnW2JXSa//F2N+Yyl++ompRwQGv8CDG+7?=
 =?us-ascii?Q?UNkJZfqyb8FoKfHDMhJEiOpa5fk7vr8/tZokchB0oK1U1xi1t9VpTN27mPUi?=
 =?us-ascii?Q?CHswGV26gaYrWfTQHnV+dZQ1ttZkEZ28cnTu3IcEX8pI1OSEPCh9TwMfOZKO?=
 =?us-ascii?Q?i+f7/3MUxdAoWhOFSfnXhhA/htSYW/u4R09ja5va26H/9/lpDx91ZgnER3vX?=
 =?us-ascii?Q?Sxu1nq8wXU83Dmi6ivGplyw+pbCKmfXKr/l7lB/snDBcCrrQVNrkXIQplzJa?=
 =?us-ascii?Q?8xKi95ZdPS/zARyQgleh82Gz04uo28XQnZnI4tYiJtZOGADlP2T0iJE3HJe/?=
 =?us-ascii?Q?XQB07EgHGNcXxOyuRJZZT7ef2HjsMaOYhPBfqTRQfFQB98pfZNC8ZStiiqbf?=
 =?us-ascii?Q?DEHXhU4WMtmhGbSF+EmYzJS3a5nGHpHJoG6Wiys8NEBm2BJO2YoTLRNDo9U1?=
 =?us-ascii?Q?lSY69//IZ5UsKgZcQe/GGZTnLei/PySvhvVobAPTO4d7WPWBGOo0GwVpxwWb?=
 =?us-ascii?Q?3Z4tOeq9v4EdS3XIMeCGb0AF2ayjqUmekn7rPgk+ex3sq25IMq26vPkHg025?=
 =?us-ascii?Q?X8DNSxnjDOjhRUImnCcGgy9I5qnYIivOa2dNoAdmi5zsDSx2w/mudCQODPel?=
 =?us-ascii?Q?On3AXNA42Zv/srwQSDDl3L+gOZkXIEcMqoMA2cVrf6+RTDuYTstWXdQ0tSYw?=
 =?us-ascii?Q?nc8+mR2zIoSFUVuFPZztDJiTTmQ+P25UsBm4uMpNGbcHdD4mIzOvQpq+EDT9?=
 =?us-ascii?Q?/KhUWGHj7rjjGWiRxfOn1OxoGQKf6q6/N2KUUEPfIHXkl+yFj+3PpmTCYR8q?=
 =?us-ascii?Q?sYzkmnAhCGSBCh3v+G8ZbiKD0Tu3IGDwVv+p+PiLfhDABnjGj2mIqIfidAlk?=
 =?us-ascii?Q?F0eToiph2ZlAVW0lLX+M5wsY9ChZLAjFfgQouTWU3ePvA1rGByyUIuGxGGTd?=
 =?us-ascii?Q?Uo9jIO5pCKv6myLw96XwMup+6XA2zaH39wsPempMGFHuTmPJVbvC/6deWlA0?=
 =?us-ascii?Q?+kSUjXlqeg3BVESHnM/pBn2frl97sRjug5IUmGjwS3C+SKPjknauQbL/RiOB?=
 =?us-ascii?Q?QXlXeRycLOiZPN7SXFuqQo6tgl1VDLB37s3mFUupPnUM1G9o0U1YXG+dEJWx?=
 =?us-ascii?Q?MEgP3st9J+imI478fFIjVT1y4wiO9mGrbpI7BwWPbfIaDAm/rcg3uLVDIvgX?=
 =?us-ascii?Q?DoFKEnqDcU2S4XLv/IoF4G9WEBItWGLlBtOjFb1gxsnLeHDShTiXKcL0NWMO?=
 =?us-ascii?Q?nZxahhKP3sek6uV6th97JheLMnYqayHVOCY5mvf6+05xsgxxspis1UL8iC3s?=
 =?us-ascii?Q?A58+UlK6EgMQuJ3Pj4larm9AZNqWepyrlwsaLf5T3ZEAlotbKPR1pDRh86c5?=
 =?us-ascii?Q?A/ZiYidnRBrbTlFJmJwEck1HYjdz1dI2mVe8yhe9riDGMaAxTySx7xgOpkIj?=
 =?us-ascii?Q?byLW97RkvgUisd/lrZfqt7/c3pa1aOja17Jiwun2oSQKPlHsh/iKiKk+opKn?=
 =?us-ascii?Q?LedIbc45HITslFt2XzoqQwoWvTopsF6c7zzX+4yN42MZLcsttKhbt+NXA8yd?=
 =?us-ascii?Q?i9bNgxP+j6Jnu9x1IbonbsGNJ9Djc+LrHoetAg7Tso6hF2LJ3eiSL2KO3MKw?=
 =?us-ascii?Q?qOcf1tbk1hER70fPGffl3nWvl86fFTXUFYNG06XDytTh80zAjgK2BFXcqi2l?=
 =?us-ascii?Q?qax91VNdGT7gWpYRgEB4SVQKxuNZnJ7VPg98Z/2i/eHi6aIj?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a678e539-6b33-4099-f904-08de4f48be7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2026 06:31:38.4613
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k7rN3uB2MG51yYtD4cxwp7b4Rs/Y8bQuQTQQBBsMyovU0qGTUbqek21aZv+GOfhphoZnbZydB39wiUqQAGTbLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7891

> Subject: Re: [PATCH v5 4/5] remoteproc: imx_rproc: Add support for
> System Manager API
>=20
> > >imx_rproc_sm_lmm_prepare()
> >
> > Add in V6:
> >         /*
> >          * If the remoteproc core can't start the LM, it will already
> > be
>=20
> The remoteproc core starts a remote processor, which in this case is
> the M7.
> I'm not sure why you are referring to the logical machine (LM).

I was thinking to align with function name. I will use M7 in v6.

> >
> > I appreciate your detailed review and the code snippets you provided.
> > Please let me know if you'd prefer that I split the support for LMM
> > and CPU into separate patches in v6, or keep them combined as they
> are.
>=20
> Please split.

ok. v6 will have them separated.

Thanks,
Peng.

>=20
> >
> > Thanks,
> > Peng.
