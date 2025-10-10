Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010060.outbound.protection.outlook.com [52.101.84.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64B31DFD8F;
	Fri, 10 Oct 2025 18:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760122729; cv=fail; b=BDGYrCqGXWjiRTu/MbWlPp99Cj1ycnyiZmjZEPTBPNrTpUZS5hOAwfRRi8CIjjd4YGWBYlwhJX5F1mKBOH2Q+6Yj8Z27yOrTnvWZ6cL4Za+dGTv/aZs2bW37kiNk86cIc3bFZ8BvCxoSGNA8+ZYdBPRdswAJiVtyrhlgmthtcIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760122729; c=relaxed/simple;
	bh=qeI76OIdxf6vg4OSokfk8MPAys0adWf8+Dh2J4rDdF4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cWJlSjkqF6NauGEB8ZpxjxOZU3E0wbtWKkmnTvU6MIVR+tmzHahnYcp0jqMluEzkMHUdROrwZXr+l4ikJXMmd3G4/UknQLY/mIQlvn40JEn8JSJy7CMmLy1mt119d41ff3Ub1gSvcyCI8qG4qYuMuIVCAXjV7aF2enYTBcXHdMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=H88Ej/i7; arc=fail smtp.client-ip=52.101.84.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="H88Ej/i7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DIlq3pr0JK2SXxOkRoz3UWZACd+CUm6hm1wpl46RxiTgBbtjhPSDGH5amcJqwB7KHLY0uRul1JTf+p0YLLPQiXAx1Do7OV7nahsAl3/NjeM7pfGFbv+e2EiCo4mEw67bhFFYrQDa0musWxr4tGKAAye66Gh0aNYycaCHRs/NHRBdKAyAjutgMl5kgBmvszQGPzcPB4OZ3tEUbwGhYEfptVmZmCSBfiZIxPpa2J8FuVG1TxTHYiP/Ktk/fHfU3xMUdg8C+6cks9BGFE8KkkWnCSU3ORMT27vGnZkZbfCOlscVxgoGuQTfFKWC5ssWQ/QUpN5YvuVEoHHj/klR+Ghzeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Em2YWuj5FQx+CfK7nyUCT8VNVftY41cVslxPeiuOe/k=;
 b=R/Tu4D3FkADsmaWZPMcKCTlMN5dXseEl+8piTTR53rOT3CLCVVdAIwTi8wogxsBDLuJ7cZCnBw0djClc6/chXIeKp6SF0lEqBvMPGY56+hXx/+WE3xwmvKSExhKzHX4Fdy6fLTw1wUb/SRTWhZ0+uAA1x/sgoDLZyjtgyXghX80s7j2jFho7Z37hf8Y1H5XkeRUEATeHWIkrTgukFcueWpngSzgdmD9yG0HG82G7BMiJnAZDt+WGJ2Q2Ns5Gp/liZkzbMWgW6V08CkPVcOMxKYJArAmb/Yp1GSmNWwRpOM3cr4pujderwiuUx9K4HX3g0TkAgk3DV3yZ+0FHysRk1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Em2YWuj5FQx+CfK7nyUCT8VNVftY41cVslxPeiuOe/k=;
 b=H88Ej/i7Mn/aJQ0QmEQQv5SfWMIMoQ6RvnfIr6BK6STBub20S/y2d0KXKKcqBGT2VRbctisAJ5vBvBEhMxnmsIkR5AXaO8svbAR8S9GOgEzcPkkquaByF4LhZdA8nv16jdG04YRo9OxX8Y4SYVXaWA+9zH3CW02Xj5G/BBVFWOVs2820XTRz0HLHYLwf6pK3AYEV/nDG2dEDYHblAyPUCEXo7T8NH6kksKMk9+zU1QicyC7OoKy0MZlS5ZrPXPtf9AxBKlLz0WwznY0IM/1G/2amL/G5evE8OCt6vuGefYnZDD+4kkQAPECX7Zy1ReWOk2d6EfxdBaqz8WaNukgoQA==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DUZPR04MB9948.eurprd04.prod.outlook.com (2603:10a6:10:4dd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 18:58:42 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%4]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 18:58:42 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Linus Walleij
	<linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng
 Fan <peng.fan@nxp.com>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v3 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Thread-Topic: [PATCH v3 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Thread-Index: AQHcOhflN6VLv6T0e0CagsDAgebblw==
Date: Fri, 10 Oct 2025 18:58:42 +0000
Message-ID:
 <PAXPR04MB9185A829534963B22D1C49FD89EFA@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20251009222716.394806-1-shenwei.wang@nxp.com>
 <20251009222716.394806-4-shenwei.wang@nxp.com>
 <eb99d9a8-eb96-445d-899a-6e1d9b6f6c69@lunn.ch>
In-Reply-To: <eb99d9a8-eb96-445d-899a-6e1d9b6f6c69@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|DUZPR04MB9948:EE_
x-ms-office365-filtering-correlation-id: 06ff6a75-6169-4bbd-18f7-08de082f07cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?GO0KxxVggCrrPm+LQo8zosKtAauktICeJSme2IPDsJFV6m+Elu/jMajztQD8?=
 =?us-ascii?Q?fuL8j0V1dW9BLcGSRiRz6yX60Wd8cFN/5lRefJKe4gy76iZnIqzE/AGqHuJn?=
 =?us-ascii?Q?Itce9Tb+Z0n4c8oikmGz+CbNTRf3Dqf/MEUH2H+95ervQbKD5FfTvOdidfSB?=
 =?us-ascii?Q?QEVHMxv/QN7jvoYVh1jIsFJujbEUeNFQW385ISwDVDQzqc6jNSkwLbGas8rx?=
 =?us-ascii?Q?EfGRyzcgbFlC+ORcblz5pvcTEonF6E9rBs8sHEhRzN6Vyy/65WEhillCFWJP?=
 =?us-ascii?Q?V7K7bU9YHaXW5R1PdjofpE7/FBZjxC9n5sw6A0AV1rbblUi2TNC+lqDbQouB?=
 =?us-ascii?Q?CIbHsUSH9v/OUv6Wbm6MNYH6AGIqKIUk5QwrMyOcFbjoeV1j+u+wNACe9kbT?=
 =?us-ascii?Q?YQJHJ1KDDvKS/Sh1sTC+KpiGLqBk6mHOR2ROoR6v3IraU1he1YlEVTKNAjaH?=
 =?us-ascii?Q?kxbueCmqZM6R+YkJkBn4D5P6k2/bxoCHa2bd0qgPtNZ1Hq/thswTMzLzP3LS?=
 =?us-ascii?Q?M/3CKb4efDWu5U/wkUezlS034NKtqxS4tDtFNrsvkyKUTgyHFuh7J0pjfFkw?=
 =?us-ascii?Q?p577ZNBEJTQMO+ki8+Jskqlvhq6s1c6/f+k3ptPea2jKplnEhAWP26Mxe8yo?=
 =?us-ascii?Q?HopSe1uNX9vVtucDpU/KOm5Vzp3g90xspfHEZXKtcPQZ1h5GE9gAqjBX8fjT?=
 =?us-ascii?Q?7V0zT97vN1TsW8fjKJWlN+I1VDABc1Lq6ak3XE/gbPCH7VX4eFpWt8SandNx?=
 =?us-ascii?Q?b8G61BWOGmoT/70sTOADeHxSacgObjoA8pwu4TZlyLinAwAQXGTEgeSWvGhf?=
 =?us-ascii?Q?INmXrby73CYDGEXdRhkbZ1NQAx3Uqh5jzMTteqE6Q16tTUKNhSZftRkbwoY1?=
 =?us-ascii?Q?ITrn7pRSst0x1OfApviaFru2y4cmR3pTChKdzAx5pQVMi686RhCTvSh4JbH6?=
 =?us-ascii?Q?D5bzoEUlEFr2mohJy1NQzvGQbEegkelaCe01l2UBYSyefHsjd6jEgQL8iCkJ?=
 =?us-ascii?Q?p5XyD85qxm8qk0AYvG7EHCL40jMCi07gh3g4Mv5v7WSYCCQO62GpO7Kk/Jey?=
 =?us-ascii?Q?m3K94RP8OkGeXIdYqsFwQWMybVTxfVst7gWivIwIpACUiLbkcCle/U+jyNX3?=
 =?us-ascii?Q?m5dUR21Ot23Puy6oyMXSrO+bv6g9L0QS+bI3741wLEOM/8m89G8IRe6KyKQn?=
 =?us-ascii?Q?bJj5FHmkIrBHq05zG2t+MBMl0EVLAjNDM4CFvsRQqVeIznd7a9/Y3HSr1aSs?=
 =?us-ascii?Q?Z+o5Rq0WzH7TQeLK7IXHOtggfu08LVJ9xdX/njFrDnPpNX2PC9+C43pByZlz?=
 =?us-ascii?Q?/m4AyMXZGY+lecCR9FJlBWTPVby1f569dHLHciixrj6PAsjRtHCipF8dVkD7?=
 =?us-ascii?Q?0qSw/W6MvHhHeHBFKbHP+0Wr6wUvV9uwYLhR8blznhGWKGN0PKWeqMe7VaZ6?=
 =?us-ascii?Q?O4FAmz7rUKm5AZauGJGQ+4vfbPmlVWPpJhJHmA97BfSQr3CDCrx6/7leZVB/?=
 =?us-ascii?Q?dFqTYExANpDMdUPhGyrczdlTt9XyvNBvs9cW?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LJZO7K7f1x+3pR0vDHTrXpTapX1yHl8UkQLhGF9dL9mHp3z0P8kxLSsIvcAs?=
 =?us-ascii?Q?HZ7+f2+Tr057nnUsl0hxaPnezywpw4x3Pt0ykxGZfykoUevHBtTGcPSKeD5x?=
 =?us-ascii?Q?DpOw7eiuTnXk6ApqnSemhYVPXOtMH/RlKJWTF6Q3TBhmwitsgvhWN1mK/7zE?=
 =?us-ascii?Q?xPWFTzesNdgpVBSrM8ktUvpBGgHTHDfv6zLSKiwtjXz0wjTfN7z22Dcdb4VA?=
 =?us-ascii?Q?ziVZcmGf7e3Rgy41Hgoj2dClB/vZF6KH43JSAU6z8ZJKtZ/ehBNrrKV2yUXi?=
 =?us-ascii?Q?UuxdYPlidHjHE4EIPO+gh4yVaxyWHspMwN9/OnkwHuGGJyk3vbuNSuF3eb4d?=
 =?us-ascii?Q?cr5zojRcFcXRrycRRU9KWKAjG8LUQjYqwBi4JWPiURDV7vh0Mv5F79EFbpyz?=
 =?us-ascii?Q?9wOPPxzFOzM0cLSyXOq2BliloKTXj4TP6LoLGdZUo9PK2hJBGkRXOeAGtqHI?=
 =?us-ascii?Q?t4u0hhaSsyre5S7z+EGf80zJy+tWb0ysDyDI+avQhOawyWf1be2aTz3OLV4M?=
 =?us-ascii?Q?awlL6qwkYtT/V+BVG5kmJzSaLQUMvlUUijUlOEcdth80R/IIyv4cDPa8K05Y?=
 =?us-ascii?Q?4b6vCPmXoSlwNgcGZCf0mpEoDYMjP+RPlDJFK/wScEd64UzjebJ/bQYcnhfM?=
 =?us-ascii?Q?cwzKCUvg1STTKofInXz4OUrlubgI06YEz+4Y0eC3H3pUk8p1H0GacOysKrHJ?=
 =?us-ascii?Q?dIquCJphCKch//p9G3o7AbdldDCcDeoRwpcIAP/I6MRJyWwqEO3KOsgKOb6q?=
 =?us-ascii?Q?vBT9jKz31zaRJ6Rba9RhUoxEXv/vqahcZlaHYmxaqsG00fJ1HR00FK7Gag4l?=
 =?us-ascii?Q?p7gX1NEo2dfUQMvbBzUHUksE5x0+zrv0NVdvVTkO9xYBtPHcGoAPyO8YiA9R?=
 =?us-ascii?Q?Fx88J09DAp/BgEfin8hl80hXp4+CphvSJmyGNO89lg6wmX/0VJg8nKANOUa5?=
 =?us-ascii?Q?4ZXFK6X1PculKtqkPqiNfTb7T/cBr/94lGCurlGt3U2BhlrrMNDuGJeNroj+?=
 =?us-ascii?Q?7hQ7bJULNxiiig9gEcuQEMsB7mIvYTnI3gTQkLbSeT4zdDuftnLBqrmxQ7p1?=
 =?us-ascii?Q?kFpyofvFjW1KNNvCGUFO1r2XZGH+f+kEg2uCx2aPirbyK2H68wp2tWFt4Zrh?=
 =?us-ascii?Q?8L+x+4K3pc1OCURTpj8b365exERdy1WtUi10oLlXC0XMB9vvfTAdH5TlxfYl?=
 =?us-ascii?Q?GWrM5y9hBHFJnxHqusLltobTu0VBZZgCkCOB8fkcbNrBv/TtvMiZ9BopzgEV?=
 =?us-ascii?Q?1pOWZwxZ4rwatLRwyBn+AnHKLKWT8XINmkTf42XOuJdSDJAMCz7ruQ3k3WSc?=
 =?us-ascii?Q?XORnBT1TSriEmshDbuQBnh0yenpf+vYZz3kFJAqldkMU13n2L7giUDxIk784?=
 =?us-ascii?Q?1R4Er8QmgIkANigdht5NL5Oxuvkj9YGGcvaDkBAsQRlG0s4m+jWvY8fQPjUN?=
 =?us-ascii?Q?mQCBnQ7uhAnWG5osrLBT/cF8cuOehGPhhWKV7w4n0SuTJLdGmBZOBPlNK0NG?=
 =?us-ascii?Q?TC0o3dOcAnq1yoWewOEvDNBdWGFFvlY1ftSwv3wx5IQaBVAr3NEh/O5PkkE8?=
 =?us-ascii?Q?yaA0mheESjHHVcsowsE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ff6a75-6169-4bbd-18f7-08de082f07cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2025 18:58:42.0516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9kiNfl0RXDNdBkk7t7hnpTIbmIV3e8kcFYH8hjL8guB4UIlznnEI8bUa8DUPBoauAKoq/LK1A8EYq16DB7zq4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9948



> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Thursday, October 9, 2025 5:59 PM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Bjorn Andersson <andersson@kernel.org>; Mathieu Poirier
> <mathieu.poirier@linaro.org>; Rob Herring <robh@kernel.org>; Krzysztof
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Shawn
> Guo <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>; Linus
> Walleij <linus.walleij@linaro.org>; Bartosz Golaszewski <brgl@bgdev.pl>;
> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>; linux-
> remoteproc@vger.kernel.org; devicetree@vger.kernel.org; imx@lists.linux.d=
ev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; dl-li=
nux-imx
> <linux-imx@nxp.com>
> Subject: [EXT] Re: [PATCH v3 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO dri=
ver
> On Thu, Oct 09, 2025 at 05:27:15PM -0500, Shenwei Wang wrote:
> > On i.MX SoCs, the system may include two processors:
> >       - An MCU running an RTOS
> >       - An MPU running Linux
> >
> > These processors communicate via the RPMSG protocol.
> > The driver implements the standard GPIO interface, allowing the Linux
> > side to control GPIO controllers which reside in the remote processor
> > via RPMSG protocol.
>=20
> I've not seen the discussion on earlier versions of this patchset, so i m=
ight be
> asking something already asked and answered. Sorry if i am.
>=20
> Is there anything IMX specific in here? This appears to be the first RPMS=
G GPIO
> driver. Do we have the opportunity here to define a protocol for all futu=
re RPMSG
> GPIO drivers, which any/all vendors should follow, so we don't have lots =
of
> different implementations of basically they same thing? So this would bec=
ome
> gpio-rpmsg.c and a Document somewhere describing the protocol?
>=20

The only platform-specific part is the message format exchanged between Lin=
ux and the remote processors.
As long as the remote processor follows the same message protocol, the driv=
er should work as expected.

Here's the layout of the message packets:

+--------+--------+--------+--------+--------+----------------+--------+---=
-----+---------------+---------------+
|0x00    |0x01    |0x02    |0x03    |0x04    |0x05..0x09      |0x0A    |0x0=
B    |0x0C           |0x0D           |
|cate    |major   |minor   |type    |cmd     |reserved[5]     |pin_idx |por=
t_idx|out:{evt/rc/v} |in:{wkup/val}  |
+--------+--------+--------+--------+--------+----------------+--------+---=
-----+---------------+---------------+

Cate (Category field ): can be GPIO /I2C/PMIC/AUDIO ... etc
Major : Major version number
Minor: Minor version number
Type (Message Type): Can be SETUP / REPLY /NOTIFY for GPIO category
Cmd (Command): Can be Input INIT / Output INIT / Input GET for GPIO categor=
y
Pin_idx: The GPIO line index
Port_idx: The GPIO controller index

For Out packet: =20
	if it is OUPUT INIT, the out field value is the gpio output level.
	If it is INPUT INIT, the out filed is 0.

For In packet:
	If it is a REPLY message, the out field is return code. 0 means success. =
=20
	If it is a REPLY of INPUT GET, the in field is the value of GPIO line leve=
l.
	If it is an NOTIFY type of message, it simulates an interrupt event from t=
he remote processor.

I can add above comments in the commit log or the beginning of the driver s=
ource file.

Thanks,
Shenwei

>         Andrew
