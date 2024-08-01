Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013048.outbound.protection.outlook.com [52.101.67.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560571EB48D;
	Thu,  1 Aug 2024 01:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722477074; cv=fail; b=SMPo+9aceITn09UzNdpX5fsgpnjP7mAxFsWwrawr7Htq/J0UtcEOF0p0UZYq5cZRz7c0AuBowBI9GorWA4zWIIdf1NhSkWeaJTj6MKiHTvFY8UTKmW5q3QOGrfVI6kSSRlMgVzJIZefKww39G+zulobZVvrJdfF50LACntpPQzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722477074; c=relaxed/simple;
	bh=W5BVv1jNO5b7QNxEePMG1w8hxf5onDnkbKN77bgTqUQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CqCv8fse2ZDBAR1SqJbqUr2MC97k16yAUzOYtWdOKJgJWmsKjTeZvZuKIG7MG7GRi4S1e09aogo2qRZr3n0GAq0bB9htf2+kGDareeVmzfyerQQtdHRq/HhU7nZVo65Qf4ELsvHPqUWVc+tV2GaostFxI6bDRNRwF8CliRqKa9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GdNlWprf; arc=fail smtp.client-ip=52.101.67.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GdNlWprf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mL2FcUNZzdog0o91FDAXc62mukAx0f0M6mhSuVzWI+6taoLYF428czp3R81XIF0ejZJPZLQRCXOjbDh9x+HxHdREWe8GSYGAtFiKNNDkD2ia6++ubfo90VGbyFzJ5u7GyTL6E2I7Mma5OLqoQ08JASqRgmzn3meHzefK3DuvUb6YYhed4X55JTzzBlwDfS6ow02Oee0OpIlu1ZNJms1pw3orxDy2PBNVNhao67XQxvz2bMF48KPKeqhCvsSXFORo6ZgQoI5iKxx0sK6FN7I3tenKnCYwqjeiTaOj/lNySGtvCmXS73u/RV/0gHuTVni0KXWRBV2yc9G0X9mn+PtI5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btYT1JtSO6xKacMRACFO1dTB5e5/yl3Q+gILxq36uuk=;
 b=IJf2s9PaVdy5z787dJtVeyLbmXGmCU9aEjH649F9vOrLZ5rkFFRbrV8/YsLddaZxu2cRwEJxis5BNLvzweHsybYgcuHskdmR0cFwMNHAcNiIEJ3E3uKoQVLQmY0fzbXJotIIyS/azYM+UNwaoKosP4cl5nU8Org8PTXQJiITb6pgc0rosboSPJjqRuY3ECqM4CFdfEM6JBrKCjWJA99bK8pT/ikKYdRzNQ7SwsmbT839Dq9XPZYefjzzRlD4SYWL2oVfkr8uWOoKJGnXxaeqIlWOT+dr3I3zIQCZzlUjCdQMUOLRDOMEVJ6jXzsgsEHJy7XLyyX+HsdxheIU/xs06A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btYT1JtSO6xKacMRACFO1dTB5e5/yl3Q+gILxq36uuk=;
 b=GdNlWprfrAsONB38LimGjTNQ+D4aZtYLtGGfXcc/r3mj9KT2pMJQkRgYoYvl1+sQWENYQik7LzbL/0S0t8+PxGkmZCQWuJbuNF0nHIXrTOzPRQZ9jIXo9bZru1h/cqvpCJyCPbfTlIo+B2l0nzpbtpEBksZHdn4mlSVaQKNTBJNL9p4ZCBZT6T8mQV8L6aZg/ESkAW87Y5OrO8ReXzh6zwZDn/OGeb0hbz0erWwEIKtbYuudH1pFeqOVsN1TzXWK3+nD/SECz53Xi+GKzADebSp1c0yuxPntMCKJ1WWqxLRd39T/qQvYSk/pEydm7DMZdlDE/shtTlM009X9JGTOqw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB8057.eurprd04.prod.outlook.com (2603:10a6:10:1f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 01:51:09 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7784.020; Thu, 1 Aug 2024
 01:51:09 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] remoteproc: Use of_property_present()
Thread-Topic: [PATCH] remoteproc: Use of_property_present()
Thread-Index: AQHa433pfx+0a97k5kmZi6wrD2EVKrIRo2QA
Date: Thu, 1 Aug 2024 01:51:09 +0000
Message-ID:
 <PAXPR04MB84594563FC2438C12A811DA488B22@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20240731191312.1710417-7-robh@kernel.org>
In-Reply-To: <20240731191312.1710417-7-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DBBPR04MB8057:EE_
x-ms-office365-filtering-correlation-id: f692ef11-2b31-433d-2ae8-08dcb1cc6a93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?84T2WX5j0vpuO+4dfDtXUQ5E9F3CtwKWpz9WuIu7O1wetnwFcwBRb08zIluJ?=
 =?us-ascii?Q?H+8Lucqz9KQAwRHKR/S6/qLwX9rW6yzrlq3QUrfe67SEHnqFqqlZMGBLxAfy?=
 =?us-ascii?Q?/T3lz/ETgrsn5XkOvX35DNPNLZNTrtEog30Ehxjb0SXHIEk8cxVdzaBbmgMK?=
 =?us-ascii?Q?+Rceg5A4KKxb49Z8YxWLfowosW989ss/AHtR+y3SHXqs78cDDDyk78lCXOe6?=
 =?us-ascii?Q?Lx4JwWV4pX7e0MVhz6MBydbH4Ggm7oBau8WVkUzJFOQY/ITClApIEfV3Xqco?=
 =?us-ascii?Q?yMkwSeATVF0/Mtd6fKTk0r/66esHPmvd8OWkGfkTU25ptXP8y3LHQSRjdCPT?=
 =?us-ascii?Q?oJL7kJpxK5/6+AU+uYzqz5+3od4Z4DnMu5MTwFWdSem4QkASij61PsVzypXg?=
 =?us-ascii?Q?CRLQPXRyVvkM6q8Y+dylhdhpd0BUkmfbVPGnWVuXQJGZlro2YHRz4osYY8Zi?=
 =?us-ascii?Q?IPk6bp3DEAqgiXUOAiHQORDb5MH3NIl3x1YuuOojab6OlsKfydC5GGHvU4ZR?=
 =?us-ascii?Q?z8VLvA+rR3Y8jVIsDqiYpQ2WIszSPSJ/qOUrENkira8oWCeKxMxhnWeNRQFA?=
 =?us-ascii?Q?8VAdT3UOvqMF1fT/RuWJs1yr7E6D8gSqIVhBrivxXJ+kZ+xuq7UYtz4QOnFK?=
 =?us-ascii?Q?1t7OEUhovVSyWK4r7E2YuMxolkWk2ef6xjrWEqEe7bQcy3o39anWw13DZJ82?=
 =?us-ascii?Q?7mndzo54jV8NupuAOvOehG+Zdocz3UASOo2BHuuCSbN5Za7oPUtK/jwjyuhG?=
 =?us-ascii?Q?yzW5YBaEj0+C8TA4IO2fOshnCD2srAtQIzHrhkIfI3crwvbEs6VD0ggnzncS?=
 =?us-ascii?Q?0te2Xh/Oet6Tiy+UUuA8IgVNnCscI6fNWG4eu5u6F00YotLzjp39gg2wZP/L?=
 =?us-ascii?Q?2RnjCN5HzXZwbABNAcfiWYCMNkCe7IWrhXjisP3qkdW7yUbHi3X4p+XuvdKl?=
 =?us-ascii?Q?pW9q4NLAntVEK46t4Lbuw2aAE7oG+dqMe3eQ/YP+rKuqcdmgvQPiA/ZWpnfi?=
 =?us-ascii?Q?CUS1kodl4A6XrxSoQ3ifwbMT0+UJcrKRtHimUBwgxs8JIuSjQgNeOJVZSF+m?=
 =?us-ascii?Q?vvleREm0BdDTO7O3cFlrZgI72cDWAWlaZ4kZD3aDl4zlvRj5uj+BBSqxaEcj?=
 =?us-ascii?Q?7Q6NhQUm7wgcOopn8SAudU0C871mlfZukOll9z982bNKUBoTSKPpDt4LeTlH?=
 =?us-ascii?Q?k5SG8aH4NX+B9aFN/fEl7/dSSXPyPhmhU0oOwX4RNManFnOkIQSYwLOrwpDO?=
 =?us-ascii?Q?FI3uDmlqadsO/X1F95uyBjbgosUBN7Jri6NmgtdGoBWtCLYmghTrCGBlUyU6?=
 =?us-ascii?Q?cQSypGA+tSLOGmhb2YxBmv6T7AOlVBkvPa8M1XzjDIN3HMAWE872r7hZviow?=
 =?us-ascii?Q?5E07UhqRh7iqp25FYlR+CAqHIrrA38gygIsK8Z2EhdHeF3XyZw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?yMt7Mw49OGrHrPsKFpiYXXzGvVs9LsOExoDgKuANfYncs3BT5Jhd1f4wIuFX?=
 =?us-ascii?Q?kTsMJrrHek0mH/8kFpvnXXytvAaiFz1V+6LRyKfkFKiKpcp5HSd7cnsrcAfv?=
 =?us-ascii?Q?FHVxPKyKKmzoHgI0RlN5BS4l0gEhSj6eYtuE7danxxt6iaSgs2pg+11hGcEq?=
 =?us-ascii?Q?CxLQu8tFNANMOP6mlgO4/fXArdESLiRD4UFdrGTFaK4US9FaVu2GB12rhHve?=
 =?us-ascii?Q?+6EZUuezme8zl/z4XdIFdG10ygrQScqCU7fZxnho1rbSa9VlBcYksAHtqDlj?=
 =?us-ascii?Q?1iudnX70UlCIi6QC6qyWwkjA9K63McWzdsvysYU4CKDp6yyvgnpmUye/gKSu?=
 =?us-ascii?Q?uJQlMaIX8Vj0bSi2wqvRBdfhSzu8k/Y6QWrlDDfXUd1i7CuZEwnC8jqj7JMn?=
 =?us-ascii?Q?pPFv4v8Gq7sbOalcDC3CYJcHEVPCvd7zUyqcqjZB1RDWTumoofohq5GDM8gD?=
 =?us-ascii?Q?hB0m2BxCFalYE4iy/G5Cabk9JtuPkHf4br2E0vteL748AjtI74te6n6fMrSa?=
 =?us-ascii?Q?48/Xwpd17dbLOz5DsCaXQH88qckuEhP+9CqfO/2K/4tRNcwKGF2XIjAaY+nA?=
 =?us-ascii?Q?J5Zr99ZPPmmRaB7BNCuPrsbRAHsDhT+87TLxiV31oEP/3x+87oENGj3lcM/5?=
 =?us-ascii?Q?VY3QyIHzaUbVQlhbENFbm+zmtxrgeI8Wb0m4GfopsSW1lGAhBpQtxwAQyd4F?=
 =?us-ascii?Q?dC7H3I2Zg1Ii2Y4CQE8EKOZtAz3hyhTVbN3TjFD6DQO0kOuWekS9CAtDGEfF?=
 =?us-ascii?Q?c7mWM97gZswfQtDKXurhDc6DM5hRdoPn6VINseB7aBkblBn+Znv17rI4FX3M?=
 =?us-ascii?Q?BvKXMhvGhPy+n9IK6sdeW5SQ3nk7mnaJxbQzlvJ2+dyUcEb4kgBFlrqMC1fu?=
 =?us-ascii?Q?6yMf0xEXvuEM5ZbC1LqMmjw1NrLZQ84oUs3mcoynmKlgbjkMS5UWx6P8mVKy?=
 =?us-ascii?Q?mnBK4VfyiRPBeRZBC37lqDZFeKcZfjxJwab980ll0Sy/BweA4Afu5PWmv224?=
 =?us-ascii?Q?m3FbGvCslMz40Yf1AL72A39WSPvw096sjQPJpLzgU5s8plOo02LY+xJ0JyfE?=
 =?us-ascii?Q?aE6ptN0GJNQFnU2XYcxTOiHfRdjXPSnIzrqJYTuxFRlGFhaYqJyagXX9ypnH?=
 =?us-ascii?Q?SPkRAj8WjkUII4nkwSZBJ5biylNlhPPQR9Tlac9V8itKJ4yJZxBLJe36m+6e?=
 =?us-ascii?Q?YKkNH81xp9PgVEgnm7Vunk3dmfSv4pzKrbu/KuJsryMt9+rkEAr6rw34LZWP?=
 =?us-ascii?Q?KxdixXUNImdafqNV69v+6tntlPUqJU9TuyK7vE+C09ynH8CJKLjPCv0orzBl?=
 =?us-ascii?Q?LOERs1WiZj2mEwVsw1aJTd39FOf9Ma6k+BfiO2gtg49crb2om1L/cHWns2Xx?=
 =?us-ascii?Q?+Zo/nuFFXXmipcSLlvyNdTwkts+oGK2uiMsQrOY/ob22IHhfiaVp0tAHJllh?=
 =?us-ascii?Q?45BB7zrm/yNRfFxEOCz00iWcoCyqudIYE8L6KrFaUOc7ybaL53zQebJJV1jy?=
 =?us-ascii?Q?XRzVwEke1OmGhYY6oBnQexGimD8bNmOqU0GketobQjGhzpN6tsmL7nij43eN?=
 =?us-ascii?Q?eBbT0F397Hhloxy/1QQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f692ef11-2b31-433d-2ae8-08dcb1cc6a93
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 01:51:09.9134
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oPMep67iKFm+Eij8yYlPP1h6HLsL6PYKnT+ew+2yKpcX/ygxrLxLVSizOC2gui/km9quTupaxbLZy0eWDL5vUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8057

> Subject: [PATCH] remoteproc: Use of_property_present()
>=20
> Use of_property_present() to test for property presence rather than
> of_(find|get)_property(). This is part of a larger effort to remove calle=
rs
> of of_find_property() and similar functions. of_find_property() leaks the
> DT struct property and data pointers which is a problem for
> dynamically allocated nodes which may be freed.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c      | 2 +-
>  drivers/remoteproc/imx_rproc.c          | 2 +-
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)

For i.MX:

Acked-by: Peng Fan <peng.fan@nxp.com>
