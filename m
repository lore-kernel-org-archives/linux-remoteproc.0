Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2044.outbound.protection.outlook.com [40.107.22.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0E71A08BC;
	Thu,  6 Mar 2025 05:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741239115; cv=fail; b=SgDjgY5f1QiEtdBl5QE6lnCTFxADrw7UczuTV+f7wSEZog0uLzjpN0YvmWt+yVpboImgsCpeGmHJCYm6dsq18ljcT0I4JUW6+v6hOgjUez1m+0iZOVu4FpkAtqYPHAaclu1eGgxok2fzMlEYbc3YqmtqVVjT7pE/8zCOswP87og=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741239115; c=relaxed/simple;
	bh=AaXOcgMBQGy2MctQjpSwW+E4ZZHZtnV/N32HFmb8wHg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OJ+NycemLiA9wH56IhHIvSxQhqwt1b7U1xNpfZzEU63T1u/PdQVitBjZCYX1nEYn371dGdP2OiwIJ8pDi2KmkNcHIHNKeI4G8aIZPvLxZmXGk3Z05fozZ46VNxLSUsxpGTdn2p+CX5regdlfdeMcHMRp885CrSiw/RrJ9nv+LOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ig8hPWV0; arc=fail smtp.client-ip=40.107.22.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ig8hPWV0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/ueg6udUEi4UmNV8m1cK2Za9P4F9gZxA9paHvzVn5Ey6Z4l72Rgujy54r8n7SnAsQzyDb/Qcpc6WfiyZJFS/gRwR5njfUQWtCLxzZHbRCwFVw6LIJ5p7gC4marlyAgcYqFSZdkEBKQRaAA4dX1dvjescRPKxESnUNkr6b2dDOhXzuPcqIrEJh7eeXZ6RIhWUOKf6zHDsOd+EZXp5Rwrx9QKWDx63q8etra7paziQ05cTUnhydmhacdxJqIQ788+9VDwBNUGa4m8GYVv2Dtny+Rhv1fuZwsHSyubuNHTobZpUorD77Eg2K9EHJ1/yYs+wvfCvRX1jYRqEM3Osp1E/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaXOcgMBQGy2MctQjpSwW+E4ZZHZtnV/N32HFmb8wHg=;
 b=KXobQ95j5O5lRQzr0s0TL4/4F4bahgpeauOOVXzoYnlHCXifu1BJOvHBCNUfEQgLWPTqxokHpy06lLwgw3y/sC8LUfAgZFybdP+Bf4rM6uITD/Pv4rGXmTAm9lEgebCgqEIbc/6qK5oKP6nbHHvPSEreBUr6z/Bq7AyMogqYMYITiuPjFxNfRs9wodG+pZ6g879VjOxnHovg0bm1jHZyS7z8kmRIJDRrM2MpdO4zrfGvdVBOTjOE+zW3GgSIZSkYzBYOlGov6652oHrGDZYsNncTLMMb+UbMo/T6DOJIS75BC++CZwWkC60HRfbpXnh680j0ZL6jysqViOaqnsqAXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaXOcgMBQGy2MctQjpSwW+E4ZZHZtnV/N32HFmb8wHg=;
 b=Ig8hPWV0W2zCxkmPrX1CDI997lkrXH27EBLC2Zkj2RR/DFjFpPITqZSbvIrizZw77tCGaUpfdWMlERJ6en6lf4w0gagR0jlFP0Lv1T+gOAEvxJX5w1iti3od9F5Oqwffe8xadUTLHSJgy5XpwW9QmqtS+UZPeC9nwYv4xwO5SHnfgHuIXN+t9De0toNyTsRDdxMUXU0XmCgYMJJFxZfjyFV5f/7K0QmUBFsNgT/aNda4wf7pwqpEl417kqyYX4Pwx/wgi8g4/zpk/pyrfj2QB1Zo3ZNKn0MiORrYD8Pr+flbOpLqLfXQeZtWO2EGDfJXGNL/iDnoIYSllkhC5RHtOg==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7987.eurprd04.prod.outlook.com (2603:10a6:20b:24d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Thu, 6 Mar
 2025 05:31:51 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 05:31:51 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Daniel Baluta <daniel.baluta@nxp.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "mathieu.poirier@linaro.org"
	<mathieu.poirier@linaro.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "andersson@kernel.org"
	<andersson@kernel.org>, Frank Li <frank.li@nxp.com>, Laurentiu Mihalcea
	<laurentiu.mihalcea@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, "S.J.
 Wang" <shengjiu.wang@nxp.com>
Subject: RE: [PATCH v4 7/8] reset: imx8mp-audiomix: Add support for DSP
 run/stall
Thread-Topic: [PATCH v4 7/8] reset: imx8mp-audiomix: Add support for DSP
 run/stall
Thread-Index: AQHbjbWJELB3R0ooykG5nIPuqJvAobNllqEA
Date: Thu, 6 Mar 2025 05:31:51 +0000
Message-ID:
 <PAXPR04MB8459A76403E76253B3D4010F88CA2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250305100037.373782-1-daniel.baluta@nxp.com>
 <20250305100037.373782-8-daniel.baluta@nxp.com>
In-Reply-To: <20250305100037.373782-8-daniel.baluta@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM8PR04MB7987:EE_
x-ms-office365-filtering-correlation-id: c96ac4c6-9c84-456b-316a-08dd5c703294
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?z8AyyBQ3715U5DlLAGjCnc23I1PdTNa7Jsgv2R8vzCrKyt9K2aoMmiQ6O/cM?=
 =?us-ascii?Q?LMTbugCUhDIQxQI57yClTxHsha46FLG650UEXEvRjEhre5hqI5rUYQk82kOW?=
 =?us-ascii?Q?o54sCYDdbmtd0aO2mMhVJbWfsVhn+Oza3GvmA65X4W9gwGTdDV4PDuJ/dG5w?=
 =?us-ascii?Q?XbDcFSR5nGrFCGlr7lweGMpVA3K8TQYKILqfLawU1u729aCuiS2oQHyW03BL?=
 =?us-ascii?Q?6Lm8EixUF84/17Z2f7hYmoLblwzkR84djUPeZrc0vjYH56YbUwWg+JvnZFV5?=
 =?us-ascii?Q?zFRaG9Wvye60YM3OQu27Q01JOQDP5CS31IrDikPwNLnusiwEsK0DPcPbgT76?=
 =?us-ascii?Q?pdimaVvlcRwwxyuyBh+3xW7YGjnn9VJvu4ylYgeB8kBiOili/30L+Cjh4esB?=
 =?us-ascii?Q?tVi09mGJOygdSuA77/6CSTMjieE3H9fvEEecelpJMp52FD0AX4nNfpkt6h2V?=
 =?us-ascii?Q?M9PGHQYmmKBnqTU6BfXmf3hAUkpkvrf/NXRLTIprZwlryCFoOJb6QWAknseK?=
 =?us-ascii?Q?S5BjbXCa5MGPHsUzkriIzjFSVyTQBs+PHPbUKnAZRo/ZmWIMTfByjMMCDP1A?=
 =?us-ascii?Q?ddEMXJNJzTQ1t3V9wZo9YNH/F+f9qjQLyTpXkUtGVtyhh/IRv/9W9jbdFV+c?=
 =?us-ascii?Q?hTiPbeWumLopalPdsLTwt8cxFCMwqhViCN3iQFjxnvz24spdm1+Z5MeqMP+Z?=
 =?us-ascii?Q?Wle9RgaLKocvQowwlc9SqK4u8PbQ8qgf4d+NXsNXOFEVg60g5rDIig9jNorL?=
 =?us-ascii?Q?SNIfVayzufjjtg9QyIPFZC+p75rGjzF9o0nfWdt6rv5o8D5Z/kFIIPCNN/Ph?=
 =?us-ascii?Q?9+S+ggS2bP8ScXwtzBgTL8snST5Qen6mKjJ6Nb/lwR9i6eb+Pm8vWmrLpDEc?=
 =?us-ascii?Q?km2gtK+jYM0wEKMkxqfQxRafMrIEond3CXzrkOH75t6h/iIz5xPhj209veGf?=
 =?us-ascii?Q?VOcg+pDtCnVMcaJRwkyHhtuLLL6czakitojS5ed0N4JVOOhpSO9Cws9O6LyT?=
 =?us-ascii?Q?FKLRWB5DCk8mU6+aEkFO8MwWXRV11clf994ANwqnuqjQGuAOzYs8YwSp/+kV?=
 =?us-ascii?Q?dZpwwErBoycg1T4TdY8wg8k5h3Smk87xazqaXczp4Tb0reMQObFyP0Ed3tTK?=
 =?us-ascii?Q?HRP2rGbvqnUouh9RtbA0dNRHOu0V/q0v5z61j2yVp5pUyWSQG/Pxe+QqKtKq?=
 =?us-ascii?Q?+zmN8njf9OyqgvKsszYX/aWz07fUA/yQCEVDYBW6rLgYMj8R/k4t7WJHqJLO?=
 =?us-ascii?Q?YXkFt4HuiyqkrZMFk+VDrhx5Mx+39xx3PtwLaG1PhhLB/fR1X2SXg7pxQ4Ps?=
 =?us-ascii?Q?IsriAxuPBAyoZBA0dDC8AuTfFhxV0xX95/ag1LC70Tn/wSY23xwjTN4mHCxn?=
 =?us-ascii?Q?uwK66LnTPllVHoGixTv/wJKBIW0Q6e1+VBNAeUil3TJnbeu2rAc3afU2orE+?=
 =?us-ascii?Q?noZceoIpdcZ/n8ry2hQGg9F034LOAN5S?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?tg6WzbvzUv5o7cdvOlNhOw1fHLBeXRJVW5KlQ8usQgjNoTGVDodw16ahCS3I?=
 =?us-ascii?Q?dkewyMNJhxiwvthTD1N3mpcg9iwgcbnEIQjP0u8HCG5/iOYiLCNwCvfIpd5Q?=
 =?us-ascii?Q?s48F2DH28Dgzy6/r+5y7souO6XuJ+WBtjyJtY3Xp5QhDd7ha57gC2pxm08DC?=
 =?us-ascii?Q?OT8OXBQ7w05b+T7lv3npoKRdH7wuhZMYJnoZGsXAb3L+4cmQmY+RM3CoUQCY?=
 =?us-ascii?Q?4iNAJ5kMVjsHvgKRt2eQ8cAhlcNbA8MPgjwwmbGvPjx3ouWbjJKet0aS9zqS?=
 =?us-ascii?Q?L3xS4teQgXEG16y+s6fF76Q4wRsZyktjhpU0c3OQBBoxWYUiyOhYTXgjRvPx?=
 =?us-ascii?Q?Qj3erEROWh0kQpPW4YtCE8VwcbyEDC6GsTfDtNtBCPquMGKXrQK70cFfJeZS?=
 =?us-ascii?Q?PgEqGpo4mCIuFrOm5aWLnwhu3njkOP43RqGLEmvG5vqAeM12r/cEMqURDXQa?=
 =?us-ascii?Q?DTZWuT73cYgwVFn5BBedjWBg7umMVrQNFXhxNGpyR6Im+ZrhCYgmJFFkJ9v2?=
 =?us-ascii?Q?MnWhz7D4vvb6kkKcsVls1RKH1CHOwdg9bVOKu8lPoCz+C2HAv2JrWIw9DtZU?=
 =?us-ascii?Q?LpQ2YuqqrLTVmKk68R8+Be5tx22saoM0XZfs0AOh2AR4pGEfz3klMS5YWGUo?=
 =?us-ascii?Q?Z9PqR1EDF49n2AV/XjYH/KWoAubqWK9v0N5/8gwrXm1xte12wkQs4cImNm3y?=
 =?us-ascii?Q?oMLC1M0i6wKnzwGsAiAfC9KEtKii42DeGq5XPClWSCPPpWgH4XIpwiawLaZA?=
 =?us-ascii?Q?l0QvghDOmtCmuwAuEuccATuVEEfAQJubam2o2+y8zHqhZ7ztE4SRz0dzIfPJ?=
 =?us-ascii?Q?Wu2JM7nggMpcclpm5bdjkzbgC96UZuk2jyIM/AFB7vN/UsVJJiUVnM3dosWD?=
 =?us-ascii?Q?9jXJwj7PqNuwRsnm+F+bdls9dtsTAqi5XL1jzX+fpU1pI4fgWjB2HpxPH7uF?=
 =?us-ascii?Q?BYZ5MJ0ylEukSn0rNgrQkj2sk5LPDILjPDuMjfAIAewBxEKCNjQ3YJV1Evnx?=
 =?us-ascii?Q?qcQoEMrLRlwvQod1eQ+TR17mRUBulFWHHbcBnhXkmUKxQlZv/3thdhcKpwA+?=
 =?us-ascii?Q?gA19t4PpyUBaP3qjHIWF/huFjqJVGqnaEolt0P24AE2maUO2wVq0bSs56dzG?=
 =?us-ascii?Q?IuO8LPRc28h3Dmymrg6kdJ3faMT+UjXJkzhZ22+Oyt4/WrF86Ro6GLphPlXD?=
 =?us-ascii?Q?sMGAW4fugVJgP3d7qansnwVUgLX2RGwMjFwbvdd0wizJUeZFSuMM8mIwGsC0?=
 =?us-ascii?Q?mOLqFcyv5e2qgd1KFVF94I5egHy3ogU9AM/UEU0IedsJ/5+4bjcv24vrs5fi?=
 =?us-ascii?Q?nlWfywAIl/AtseDuRsJ5hgXPSDGGNT+Tp8Aq6iluYnmlEZ8asOSCRRrpW5VN?=
 =?us-ascii?Q?k11RTDgkI0X60x3hX54edzCd7QQwFujoI9TI8KR1tDurLcoW2pYb/lsHdUvB?=
 =?us-ascii?Q?pcRevWQQICdVVzZWsPzrzpt2dk5BscE7FETdL407oLs1UQIcfSVf+PgnGo0w?=
 =?us-ascii?Q?FXqrZbJYpi+hFhjKWexzJFnuq675rjvE+Ke4FEV5I6bMrR7BhAGPDnIcZLCy?=
 =?us-ascii?Q?8ORzYLUJcok8QPogbBA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c96ac4c6-9c84-456b-316a-08dd5c703294
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 05:31:51.0525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 81Rsn+IEB2zzQOMDTLPTmV5YwzCDcioUDLK0vN5LrvUhv59fyw9cM7ZwtNE+cznoRF97xHEeJHnvFm+UCCXayA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7987

> Subject: [PATCH v4 7/8] reset: imx8mp-audiomix: Add support for DSP
> run/stall
>=20
> We can Run/Stall the DSP via audio block control bits found in
> audiomix.
> Implement this functionality using the reset controller and use assert
> for Stall and deassert for Run.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

