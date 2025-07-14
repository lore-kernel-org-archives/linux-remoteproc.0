Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010025.outbound.protection.outlook.com [52.101.84.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF8C242D98;
	Mon, 14 Jul 2025 11:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752493932; cv=fail; b=Yl621uHU72fVSC+6RUWknVVTWD+3gBgoxugaDUhRs2A287Ml6xdzVay6Yu2UN5lpg0dI4EOifp9bY+ER8S3BOTXG3U5Hh6+z5IWl6VCLuvlaSdHtnMdCSSNurwWBfAj6q5V3/OSQ5VnNbHfR5sT1EV+jFBQnQJ5ia1X2xFacGLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752493932; c=relaxed/simple;
	bh=srd4RdgARzzctZookAc61Vizv+sExuX1szwYPp5jjfQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MYj3G6asy9ul6fmyzBBnCehncE30TYb4WsMa7KUK+EyDUyIh8xmTLuWeTyMgq6WodPA0okmZlyT7A0ejAHP8rt7uppL9cLttqUZ1O8TOVJrT8A9sPICJfNEjQcPRbIVjBUP17uc5nkmBATuAvMLh1VAX2hEAD+OXJf9HXy7iZtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OLvT3kax; arc=fail smtp.client-ip=52.101.84.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OLvT3kax"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4m6BPplB3RN/Bk6S8r7YixHI0b6IAlGFAIz+6nJS6mmbmqzqEUIycAyar6V0Mgrq/e89TKNOjl7TlyMEUqujvS6NkLl9O2mhErcsqOcVzT+1++joh2Ph8c+Au3utqS2WzCsm1SddMV+PfB85hh+0zKvDnxuAYZksg65zJHihsovbHROUim1rcsTcrZA0TxlcjErfjdSbaljl0SXADjWeunQpQ6sIXS4D7obNmvWyxZ4bbVf+Vszh0ZpTxCsXU31VQ95ns2KK5vPbbk7JfR1uJMsf73lYxQGoXRNV+GNBnSCk316MBXDbZksk2KKpfwfzSAv1VfCsMz4BwPOgYKUnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srd4RdgARzzctZookAc61Vizv+sExuX1szwYPp5jjfQ=;
 b=vbLyRMmwI6FxAVa+YWiVWNQVnGYj77joCHTWbKQz6CyHt1DUgG6OoOohiiVjwSuygB874+mhlyW/tgo0ATMQfv8sGCYAwNFBE1Alcyn8ENBT1GU8Gw9F+cg1Jw9CU4aMtYtWzq5W47ZFSIDmGum2CSC580y4N+uVO+SLEE1yApCDOvHi8JwW7jLvKassXcDnp4N4EYaRcLl2Af2oY/XN6d5z6xt9Axgh26xplYu8Kr6TJjsZrwPh1w7zd6CRyZGXcQIABxgqNlcnPkFp31zEyxonJ2yd/E9o14l1OecSYXvNca8x7QIj0Z9QDr81dSI0oobt1Flul1BrOFDQ3b1YAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srd4RdgARzzctZookAc61Vizv+sExuX1szwYPp5jjfQ=;
 b=OLvT3kaxHWchG7VYz/AOp77xR03+79cV4guz32Hclw4Eyi/mF3WtAgWNfRmI8r3r2JIjoXuZMUav2DTWI1LaEpGmGx1jqmO0NOgMY6TFocvyQAONpJhULRZM6UD4C/c3V45ICceHsNJKGj2Y1kRQn1sno+mLf5visvSADAVAbGoV65BeF2ynIY7AseDMADzuO/UF2oVyp5W+kLu+WsVmMpSF0okGjgSh6iQXsqtaCOW6G1TUeltp/eJf6Aw8g2IqIJMLJ3gfL+4Sedv/RVE+/7Vf2dH3UtNoJaWRGKWthf+AnvafiRCm3ZGD2oSED3ozlPtsuZ2nii96cmUka/9zYA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB9563.eurprd04.prod.outlook.com (2603:10a6:10:314::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.24; Mon, 14 Jul
 2025 11:52:05 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 11:52:05 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Sascha Hauer <s.hauer@pengutronix.de>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Frank Li <frank.li@nxp.com>, Bjorn Andersson
	<andersson@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Li
	<frank.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Iuliana Prodan
	<iuliana.prodan@nxp.com>, Fabio Estevam <festevam@gmail.com>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: RE: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
Thread-Topic: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
Thread-Index: AQHb8ZOOjNSVtKFE+EOehjF4qQ8e2rQs/usAgASI8CA=
Date: Mon, 14 Jul 2025 11:52:05 +0000
Message-ID:
 <PAXPR04MB845959EF2767C96794EAE6DD8854A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com>
 <175224423523.783161.17907302929832941912.robh@kernel.org>
In-Reply-To: <175224423523.783161.17907302929832941912.robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DU0PR04MB9563:EE_
x-ms-office365-filtering-correlation-id: 567e9b56-f9bc-4526-a09b-08ddc2ccda7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7416014|19092799006|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?xgjFFY2XqHgcaPUuRiUJN03kjsZ749Yxn3KE92wfDewtafHpot/fbIeCBfRx?=
 =?us-ascii?Q?ZiGrbkWepSS4GdMVGw8/O6nKzSMgb1/AkyUoG49VUoWcby2sB112vEfrWbth?=
 =?us-ascii?Q?PMZmG4FcO3BHr/E++KFIs2jHdignIzqcKYqHLGH3rojs70S/7BnWtiOb/WG5?=
 =?us-ascii?Q?whdgyCKSn3FRcEnNWuBeYgIh4HIS4qVEz5JP+6EbSMc36awKjehBkQUTFQI1?=
 =?us-ascii?Q?7Wl6YoyMhFBcrZuzfYZ53/EGpuTbzdq31Kmwl4k0aFmhKfIySVthEQu5JcVe?=
 =?us-ascii?Q?1p74exE7AqbcCQEHMJKMrVUSzrH96Im+MD+Cz1ejAnJdMzu2T8KOqF6DmBXF?=
 =?us-ascii?Q?U0LSor9RxtgF4tVzY7C0dm3YsZAWFpsqd3fLUpU1ZT41zwWOvZ/lpdaG235p?=
 =?us-ascii?Q?ycVYWlykacYP92XL5VRQNLaeSzu3oF54CKUNFrYigGjCP6BbWwMRZkFfI5xQ?=
 =?us-ascii?Q?Fns59QsqwWIpyKlE8PRNiLrSu41w98axVCHrRQzxmhRl2E7QGnNa1OGEk8BH?=
 =?us-ascii?Q?+FO3jUBsucrpW6mMD5RT1kptAmww2xB4BTA3+t+aS2OYH73iPyTf8WxZMUnY?=
 =?us-ascii?Q?03TV8vg9juHF0euE/Tr0mtCfTc6iOVCBLnbzfIKoW5/XmEJImZ+1hod6c4n2?=
 =?us-ascii?Q?pCm2IBRbZ6E+pn9m8B0Qrj24ecBZ+ypBiig3Mxljt4H+PMxkcDaf3LS++Jmo?=
 =?us-ascii?Q?zahU9EcqWP7TnAe2S0Opd8jShh+lNpudEntORwPosbgkgQOWy/5Y1NtZxAr3?=
 =?us-ascii?Q?6gvTadr5XignXdCSCEcpVpQve/92DiejJmzukZHh2iCPA6HpIlRiDSNUaD9f?=
 =?us-ascii?Q?8KzBt4cm7fNJg3Y+M/TXMwfIroGVv5QcLdAE0O0m6WL8zYEOd38ySCO3W5TH?=
 =?us-ascii?Q?JSJ91tO3Y3Qgi/vXj6To9CG4TZpUxI+j4xXGuAF2qTzpsazrmRhw90iPr7VT?=
 =?us-ascii?Q?WK6K/5X+DL9DuaJCP2FkY5+p5YGTS9qMULLWdqpJxIxQZYK6x8oThEiXqPuT?=
 =?us-ascii?Q?MkTyZmWQ0cv4O5ZUbNgeXneIABfICfMBwxDb318UyQM9ubZzO14dEWEdCi3S?=
 =?us-ascii?Q?EVu8o1/hf7AxlPFCcZuaBilKc4eLcdqrVLv+tJsK45h2HTEa3PRsQM7C6I6G?=
 =?us-ascii?Q?tIyqYiBHLa28px+1Asg1vJccL/nGFRQvdxfFGxYMCyBAniJXnyb9CzwyiVpE?=
 =?us-ascii?Q?/VI80kAbumrtCVZQ8/b/XABAFhFWPWhQIsu1Lo2VQ7w/p/NDOk7s9w5PR2O5?=
 =?us-ascii?Q?2HF92QK6KN7jagbkbOFEkWRe2hz2ChZojnOCG7V0BPAY+DfmtHH309aPnKMG?=
 =?us-ascii?Q?vIeNmQyv3++LLPJ0r7LQgPaamKaueUQS9WR/TP9Pmw1CBvHawzprI25lye+l?=
 =?us-ascii?Q?Nd9z7Oe+fkxzLVQG5c9+wwoeXUG+AIZUegrssDu3UmrtV59CUDMrB0lJWwIE?=
 =?us-ascii?Q?iB1YKapJtpnJHpLtRA2uYVgnK243PJE0C4LH6AgdnOEIKOp2t8YtGV9qNo/C?=
 =?us-ascii?Q?JCiW2sh4Yskh10U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(19092799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ZInQGaNYeTPtnnBbRrx+SdfU9KXj8iUfrbE6/gDpd61vk0jGuSJ9gSS8FAdL?=
 =?us-ascii?Q?rySQVFvY/5/1i6nZ5gP7Y8ms9GmoV1d92BFluf9WFR2loXgoCarDTaLTzU0i?=
 =?us-ascii?Q?nbuyfKz8+VXQv0TH6KIzfZRW284WlbKULgm1otf9rPPme0Z18oLBuZhvMBoJ?=
 =?us-ascii?Q?j0SEn1jTrBUBvMeo0cUNHXRloOML8TDUTpEiygF7tmRG4G1+nM4SEw1JgmbS?=
 =?us-ascii?Q?4Tmw3iRJBMXgy/5rqH5mDfH1U8EdRTNRQybcLmJCIcZC2GUAH9m/kW2RYc2y?=
 =?us-ascii?Q?gIF+nl4dOM7DXYAmQVtUSbIrBZzeONL6rO2R6hJqtAB1K1mlAYvZoVg2pxza?=
 =?us-ascii?Q?P+FLz9HYWtsFDDNxEK2aJZiz4ZyGdbB01fo89xzv6q50aDs3H43ZkrVvMz+M?=
 =?us-ascii?Q?r5NW3omtyKGozNQWs8NSeQjsW/q/lq0XZu1Xb89oICKhckIZPVmttvweBsoh?=
 =?us-ascii?Q?1kYiqNLVsUy0p3SUZ8XaLQyYUasAMkND5ghe0bX8rWssGilM1OUC3/Mg0DnO?=
 =?us-ascii?Q?ImWCVmC4kb21/ROVDiAO+utXJxUXUik6Yt3odeM6uL/Kf1qg0rGbW6SofM2O?=
 =?us-ascii?Q?yvLYqb8W6LRS2+r1f7ChwsDNR5sGyufvytkpr90wKlmxf/1OGwj/EGbfS9Jn?=
 =?us-ascii?Q?Dr4oXvXDT16+Z3Lg4dRPpb/0mFQ2sc+0Q0SlAIdf94n7Li5i8FNIWYW6lM2V?=
 =?us-ascii?Q?sxMR6n6pN5ZDq+HyBVG7JrCbinbTi9EFUwBMROsaj4aVESajxJNwyXd7zDJl?=
 =?us-ascii?Q?d3ymQNvLdsxEUqchqOArkggfne5CDk/GsMyLfgBjYlpvwMq8s45RmfOd+Ryl?=
 =?us-ascii?Q?wgDXFi7XmSq1lCRe9vNuos0o0e8RMrh+zkk1dM6Lz9Aq/KtdDBaRI56Bi8x/?=
 =?us-ascii?Q?mhm/SClBcg55Uts07dLCf9kpam9ShAA1oLawQn1nUV47GY+3xxbwvOFFKEAg?=
 =?us-ascii?Q?gWSApdCcBMiMvoZU7Fbxlxx3FR6MZe/NWJ0Vk1szFNVVLQinKO9emz7l1D37?=
 =?us-ascii?Q?CYDGV8EyIpFhsrJZVbc0giIhnSzIDDgdkdQTEBql4qHy6nsDn/Ml4+Jomlrm?=
 =?us-ascii?Q?pIjA1SgmwnS4j07hFModFlV6+fyaJMBmm0O5Ml2WTYiwu5BKLix6sW2tk6m2?=
 =?us-ascii?Q?/ulf3F0dk33KibtYK44en6Em/TiOI+rajcGBdrzXaFptr34QT4Mhgtr+6sU0?=
 =?us-ascii?Q?y5lT0XMgZIrgIVkXlk1tq324an/8isJfb6aY12tl/HtFTL7hgdxLZVMaqHEH?=
 =?us-ascii?Q?vgXLDSd3BvAOgwf0O4CmeUuMXSLRQ028V4p0cT90oMRhuPOurq9Gd6Uj2lC7?=
 =?us-ascii?Q?Bw+Gopu/o6EkBZ99gfx+RQ7ikt+Fq0tG3mmmLCV095wG5VGSboSo2WGNcUuj?=
 =?us-ascii?Q?nra2lw/yPaG3JjA3gQARyHsvKgfDeqyJwSaOaYnCtvFyBoYtJePPV0Z3abRw?=
 =?us-ascii?Q?Wy2Cnp5Uk+3FzszD5MlZ+4XA84/GtBHpVnYNaQGXi1GztLoDvF5iqODvK1s+?=
 =?us-ascii?Q?1PqP9l9nIuQDZXmo7CCNo+3E21hg21Bysh0Q6SyP+jYc4aIHUBepWYLmKZzp?=
 =?us-ascii?Q?moWrhNGNh00MALL0sd4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 567e9b56-f9bc-4526-a09b-08ddc2ccda7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2025 11:52:05.0837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 86idhitC/QYhdNEO189SgphVTw1gPaPzPxNRVuKWItLp8dsPsL+v2JTzP5ScyjzUxI4PCOvYErC7jdovB7W76w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9563

> Subject: Re: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
>=20
[...]=20
> New warnings running 'make CHECK_DTBS=3Dy for
> arch/arm64/boot/dts/freescale/' for 20250710-imx95-rproc-1-v4-0-
> a7123e857dfb@nxp.com:
>=20
> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb:
> scmi (arm,scmi): Unevaluated properties are not allowed
> ('protocol@80', 'protocol@81', 'protocol@82', 'protocol@84' were
> unexpected)

Same as replied in v3.
This is because [1] is still not picked, not because of my patchset.

[1]https://lore.kernel.org/imx/20250513-whimsical-almond-quoll-e3ad5b@sudee=
pholla/

Thanks,
Peng.
