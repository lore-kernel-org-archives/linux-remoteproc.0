Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011005.outbound.protection.outlook.com [52.101.70.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19F71922FD
	for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2026 03:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779766336; cv=fail; b=cqmCpgbGztT543gpzkj7T4OMWGeuLvLbIUPbaSFyVLmV2F/HOxphzRCmbYnRhd2j96QwUPsGPVNGjDdzmyLub/Q+VUGilMlaGEnkRQ6DoiHpue6jnrDUhrwhe8JAmSlFZIU3lOmyyHMwaZURbSI/3pwB5/QBbImCLPZUoWLXQSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779766336; c=relaxed/simple;
	bh=HB6bi5sX0klt2HeYpwbv8EW/fBkh2rJl3Ys4NOXdC0Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fCzsDfLWz2mWdxXW2+GPhHkrDQsJ5Pj8b3BJGfwrDWQG1FDtekd4Sq2Q2P1tgAb8rwrHnvxusu0c0ygUsxVJw7mkS65JZ/LzDvicwaCCL0AKrtMR+nyaImFe7ul//y0f9ZbNH/xdL3vrMDzuNJwxXuYcfYjvMO+3AqDpeDBSBA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IkSzKwyS; arc=fail smtp.client-ip=52.101.70.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IkSzKwyS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3maEw0pjiG1BndV9sJOcYptbAE634WTXbgZLHHi3TWX5473uPaM4KmIOXi2CS8mgStJYQhowed3DgIviFrqhrBH+Lb8Wg0AtrhItUpB6AvLWv0cZ7nB/KS2Y2x2WNqdV8Pwrg4iUSF8HbW/mLVZvsh+Z70q3ITCxFMEjbmELUF8wZRuNh2i9RC7zxhiwxIAuEd1pr5Vpr5Vj7EvBorE3wwI9K/85lagpxiB8oIma6eN7718Owsc+4KheLp+DoG8tuIPBA365f+h8nHDCfsQek5GYtmsj2EEl73Vu7KpGaena0B38+WhVdEkgTPgkruWI/b7JEZDmzUhEaZn0AWp7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gO8sgDN+FRAOo8xwiyIoUefW3Od+KOXtKiMDcG9Iew=;
 b=a7Qsbz+hG/nHdbRnK7U/w/MzGmVpCRlLQnPf7H1JoGmG3TMToZqDv6TIcSLK/Y2sn/wWPP23sAC72jrJgc6FbX5ytd9nd8ZEH6AHil6ZCr0ENRE8hiJT4YJ4dcnaoarn3kJtOlusBitDHTAsCXKfSw7hYYDIr03vAPoEXLyIGoo0odxihxQZD2OL2lkR+szldruwN5DEcZiCAkBMFRomB6BWHSLMR2DwfyOgFrR971B6W64QflL3tE6EEBEvTATGE8/+PwVtooyrOO3QGmmWup6DAcTCly2EijCuYW5213ggLg7mvYm8ElQKgxAyv0WzMKKh5KFjFLUHaQTeCZz9qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9gO8sgDN+FRAOo8xwiyIoUefW3Od+KOXtKiMDcG9Iew=;
 b=IkSzKwySLdoIu4ykcaaI16OvcjfPmfTPqEWYgaDd0JuLzEWXPrKSn5gpudP4tGbn/oMOSG3yBHsT3BY5IJoqtflyLnAVi3nlLxznIq6iM+bCpVbMfsSyxzMsKqHLdbLn2wn+bodJn1a62OcYryX7BMKqdmy3TYYOJ9vc2mI2hvrORJ1LmX0N0o04g5+6RxtSG0+6YPlWAdsQNIgV8W3wPk2xPLCvbeYXqJO79zq5QmXjYfwiZ6hOx3vFhNuCaHsFMy0u8qgYoCL6Zp4UbPDyWM6oaGFAjqFmLoCXc4H/U+Gq7cH8PBnYysSaJFt1p85pJsy6SiiZr7ZCyz7FOHY7jA==
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by GVXPR04MB11588.eurprd04.prod.outlook.com (2603:10a6:150:2c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 03:32:10 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0048.016; Tue, 26 May 2026
 03:32:10 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "Z.Q. Hou"
	<zhiqiang.hou@nxp.com>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"andersson@kernel.org" <andersson@kernel.org>, Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>
Subject: RE: [PATCHv3] remoteproc: imx_rproc: add missing DRAM ranges for
 i.MX93
Thread-Topic: [PATCHv3] remoteproc: imx_rproc: add missing DRAM ranges for
 i.MX93
Thread-Index: AQHc7A5WL88Syv4GuEOj/FRxrYu6brYe1BcAgADMZzA=
Date: Tue, 26 May 2026 03:32:09 +0000
Message-ID:
 <MRWPR04MB123300B1D7D310EE95CDD9183880B2@MRWPR04MB12330.eurprd04.prod.outlook.com>
References: <20260525062031.24725-1-Zhiqiang.Hou@nxp.com>
 <ahRiKmwn8YdHGCyZ@p14s>
In-Reply-To: <ahRiKmwn8YdHGCyZ@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRWPR04MB12330:EE_|GVXPR04MB11588:EE_
x-ms-office365-filtering-correlation-id: 9c6b5a37-8539-4a4f-d690-08debad75e94
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|38070700021|4143699003|11063799006|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 ju+QB6jsj4rzag24MMLLBmpn7gNfEBYxSQnhAjmFf2JKGzH5BcI/xXWCeG3DCtVyVpypO9c+aSv6Ht9VaK4dO5+PFVLBdxlL33Sh6uzDfkRIOp8QZXgO3Q6YrsvHoU9X/vjwaoOfilYvmIWHSK9gLwpgMy5GIbYLEBuixPBND+7ZyGR7rHMLG7u6xRv78/v2z+bRBiK/uV/vRol+gw0pAK9n5y0WG+Wn4jXFo+CuR072fXq4e+jX5aiqg8uwdDAUAuVMHFhTHOQITEEPTouq75sZq/RKxQtVCulCksyJdTPIJ+mQBNedP8TU5Y1UWTAqkcxnIvIn4qiswyZW+6OrEOxP6Xx1SD4XeSC2JDzwl4hWSmGditAhCl9JIjJJ5i+hcG7fUIC5sax6+HaTDNA0tDqNAfhGZ8Sn1JrcMvBeFLbYzUu8G01r82b4Kh5ARZmmzKSCsn2ig2TEiIqxxhGhSQTT6O2MCo2WQiezx3qjszqu0Wf5GRFKidN+lV5DYaEVEsFylxt1ynbMWVqKdgzBKEIRdYz5iqq77GcdHot2RVVxk9+jWBxIHbBwe4uW/ULTiCgenUnraVmENaNd/gbmPtRyMJIALBovfET530iTy7wzicOvFpYIkKzmwKmlJyJaDaKr9NpE2rSuOYVBkZeMZAKdd1JV8pM7o2grH/Mn/vpWxdV0UHfUnqqNqcKBJ9vhX03tk8+hMCgZG8hEU8xiEOJ9c5yKtzoe8h0B805FgzTUsrcHCdDACP4Z+XgBJl/2
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(38070700021)(4143699003)(11063799006)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5coaSkBeIinw+1ksEOYRBOKrtbL+/07/U7bP1kmvU7B72ZNJ2veKywVzkEsg?=
 =?us-ascii?Q?/vSsqiXvEycgzDS7lJi09iF775FMBkZu7mCwDQ7cYDdxRQd2qJFf/J6LyUxC?=
 =?us-ascii?Q?t7mQ/Nzbfdm4JJJGlpy/xfAsFAuoO1zm9CTsiM28gvsBkx8a8aPCWxvfweo5?=
 =?us-ascii?Q?ApmsvwVr3jlxZf428PrMIctPEx+S0mjOHz/2L5kELpkfPUuwFZvYXl8W5zu/?=
 =?us-ascii?Q?1adFg64JnRxEFSWc2ccqn7yo1JtdhZrXwZa0am5ghfvy94XNN/9hA6PtNTau?=
 =?us-ascii?Q?ttIP3SbkBt+/S1lz+Uw78BntsWdCdVCFRKj0jivFaGouVipcbvBgiHAJTUnd?=
 =?us-ascii?Q?gR3gr2TmE51UC98HibPGW+Q1il+Ec7Rv6o6px2gH8C/ttsPQcl/3SLwPnjp3?=
 =?us-ascii?Q?9KyP+MFgg7VuRyjUzi8tqri4AO+1++prJr5nR8Y93ILjEdZDVh8XlyAsgAkX?=
 =?us-ascii?Q?VVknTI9YtyfWSs00JO6OpbRLjCAcUmdLx9LTIdMpwUpvDR0adg7rMDXEQp+K?=
 =?us-ascii?Q?Mh2XLuUfMJ/AHWMOT0hzVvwmZB8PjWwMVD5Y0Sasbv6npRcxXOT2yMihJ/ku?=
 =?us-ascii?Q?hV2LBPWhmoqeMdK/7YF2e6x7JQ8evpeZ5c+3H0RrEVSura63y2Om9EQ2/mBG?=
 =?us-ascii?Q?RJwamrrfc+QdZerhaAUgwH4hGX0Pu5qiIta+AshiSWaEQdToWY6TiphXzMY9?=
 =?us-ascii?Q?huUUIE3Hyj5E1wqiQdXmYKIainxOxHg7K4XITBvRMe/GPG7ul36FSIjnF3m8?=
 =?us-ascii?Q?RS9wVAoHjdeudniYtzTkRB+XmmYb+R/+DDuTdLP574Pn6nWMd1mqswLdzwnU?=
 =?us-ascii?Q?Wtbxc0rVjPX0wPlGmOOFwopEjU30lrsNGkStNGdWU4IG5pBGIjwBlQR7AWxO?=
 =?us-ascii?Q?wt8DtHA6xpiTjk/ftOcPQdQ7Nn7kWLYc5FjxkZYth5lKd/9cSGka6YJMw7jb?=
 =?us-ascii?Q?PdOtCOFXIu4cp3NcCtZZSEgNlJD/M68S6wFFS2RttkJdX8qLLOknRFBixJ/v?=
 =?us-ascii?Q?Wl1jfWm5+HoYaM9KEz28WXo2GN7dg5GjNhWEpG1a/HMP/QEgI1Y8ocW2St8W?=
 =?us-ascii?Q?/fT/ykveAvPJfaXiEbdRM2fQmIPTLWJlWXofuKL5ByYBChA6tU90SA7IGb/f?=
 =?us-ascii?Q?JOaBhM9aTInZrFgKlUNlmjUCLmQMH+3KmVtk0WCG/J07D9GCgfJ+3otKDJn/?=
 =?us-ascii?Q?63i+bS8G/0pEkFU5OLnPllf/MBrZwuTDJOBSgZ8wj5IHC2ZMYj9mMc8i5XVj?=
 =?us-ascii?Q?Po/dwBTdD9ks6jPXufTmOs8U7k12u0ZQQNTfERdBpF6c7DI1VoAHpay6eAvR?=
 =?us-ascii?Q?iNzQx7sQ+ZzvVn5FXbKXpBBNUoYXF+QtuLl3MWfqBFLhGCURBuCKr3ThtjQE?=
 =?us-ascii?Q?VmrrLWkl+vrdtftfriJeiMwQTfTKhEASGSz25jT0c6kHeXek0mWn/NHCeVRW?=
 =?us-ascii?Q?DrTUN0BROujbWV+MqtKdrtt5LWG7vOBre+uZTrZ9gxE9Mub/DRKuq2TAt8bu?=
 =?us-ascii?Q?5L54kPXDX6pPGohpAbanzxbPcebhSJg4kw8NRWV5yxlgfXqp/RQvpEwenbUl?=
 =?us-ascii?Q?uvNBwMW5CBxfXpSrzX6Zt9fc6ksnEfNVX0Ij/Ooj6EIR93DgjOcJEIclNgcV?=
 =?us-ascii?Q?+iJF1+ZbhoOsjd0PTCJqHuiCUEw1o7/MCIM1/BA0/6bu2Eomq3Y7J6Hje1CO?=
 =?us-ascii?Q?VdObarNZpLw4yRS3hOsUeS0xRIqSxNHUZdAoHi4pQZ1nyDTa?=
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
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c6b5a37-8539-4a4f-d690-08debad75e94
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 03:32:10.0192
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jVjrjq3T/c0aHiQc4QJwWnx3+MABOcCXmVdOyIAZeoj7UIICL1NdtR/gBweF4UcnkskUbnf5TmxNLzD+s0SeaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11588

> Subject: Re: [PATCHv3] remoteproc: imx_rproc: add missing DRAM
> ranges for i.MX93
>=20
> On Mon, May 25, 2026 at 02:20:31PM +0800, Zhiqiang Hou wrote:
> > From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> >
> > The M33 DRAM address ranges 0xA0000000-0xAFFFFFFF(None
> Secure)
>=20
> s/none/non
>=20
> > and 0xB0000000-0xBFFFFFFF(Secure) are both mapped to
> > 0xA0000000-0xAFFFFFFF in the A55 address space.
> >
>=20
> So the M33 has secure and non-secure ranges mapped at the same
> address in the A55?=20

Yes.

Bit28 is used to differentiate secure and non-secure from M33 view
per NXP design.
Cortex-A55 cores has same view as system view.

 Are you sure it is not the other way around, i.e
> A55 has secure and non-secure address ranges that both map to the
> same address on M33?

No. only M33 use bit28 to differentiate secure/non-secure region
per NXP design.

       M33                                                                 =
   system map / A55
-----------------------------------------------------        --------------=
---------------
0xA0000000 - 0xAFFFFFFF (non secure)           0xA.... -  0xAF....
-----------------------------------------------------        --------------=
---------------
0xB0000000 - 0xBFFFFFFF (secure)                   M33 not accessiable
-----------------------------------------------------        --------------=
---------------


>=20
> More details are needed in this changelog.
>=20
> I'm also wondering how this problem hasn't been fixed before.  The
> original patch (9222fabf0e39) was merged over 4 years ago...

At that time, I could only test remoteproc with what our MCU SW
team delivered to me.
For regions that I was not able to test, I not included them when I
added i.MX93 support.

Even this patch is marked as fix, I think it could be put in for-next tree.

Regards
Peng.
