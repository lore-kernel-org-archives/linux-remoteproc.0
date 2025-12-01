Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011039.outbound.protection.outlook.com [40.107.130.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3632A32D425;
	Mon,  1 Dec 2025 15:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764604248; cv=fail; b=eIQNBVHQXqqMqxHQQGOBwvjs8p6Q56AFGsuRUici4wQPitQmZD9Kj9CSivzrOd0TkhgPUNSKRRcbodBE4SpowBNIvzOGNeVeOsrxrwBp3nmeYtodG8YF+AEO+og0qD8PYQtPmXeDNFThql89V7QY9UZ6oJCXxOVh/GtDACBCANY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764604248; c=relaxed/simple;
	bh=J5s9S7ltePs7+drKMq3bJj363XNLZT+JbiH9nBSVgQY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CK2k1DOSuw2XdgFYdAzOJ9ibsem0PaknqUnyD7NS3i96vYQT/7juORyIeJgVeh1jeJrCgmPQ+HIVYq+1PfW7fX2/Zj54QmhZ+Hfph24fTtRafbvv8l+MrzU0Xtl8HGRZt69M0DpthEx0IqCUhBZha0PykmJc9Wb6SLgj3SAcbVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RAL7dmVF; arc=fail smtp.client-ip=40.107.130.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RAL7dmVF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gkz7Bo8T+Y+qZhd+/548OnkUdxJi3KcYmO4Vef7Ledwg5Ieu2xkyg+SfncC8ZjzTLm7qN6EjfiF4XEap9S5OaAdjZ28MC8EhVS8GbkPfEdcqCig4//XvDUXxxy5zGg0Wdy1ocfdgCiXl+p9eo/w9Em/bcXYUQncW63Sl5snRdXAm0RvotLGvbvzXEbXxcvt23cN+KqAL03riN+p/MnspcfMyG+0+s/0U5g8JEXbQqaIFhmoewenqJjRy58VrEwomdCGW2SXPfFLlkDe9DrDLnLUf93YdCd7v4JEzc97uVdn5nhynl2L2AcOzTEMAj0FvMjpyK9rxvSdtL1dwxBQSUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+hPAXaXA5EWWuXS76KEIpzPXgtINiRDDqUrE720ivk=;
 b=JbBPSNxd2jpektzVGA8deuMrv3yWdmOzqM41CdskR2tsxbS8T+frDVm3qvnu7xTVrB/CKNWuKODgFeimowE4jR96S7uVPFwQ2NYrn6I2x5ii2HCP6X5HcXAi6F75pnZVq2+zP5gEnCOXnSK/Vzb8Zm+Q25cCD/l1byHeVcUXdpR2k5XW5BktY/uZM4hmnXHSrJL2Gc0GE996gOjCLSsh3LwID4MXeubnHrM9hR8Gtzc5TXLtyXhvsuRrsMzJ35fUkjMtUPPnLwgH72Enw7kHAFjDC7uJztqryIx8HHxdMws7HgYx/1nUrPuC5S7Lmc2GInhKOPPpitLW4ue8TQt8Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+hPAXaXA5EWWuXS76KEIpzPXgtINiRDDqUrE720ivk=;
 b=RAL7dmVFmuFRuqN7+vFMVqKhFuS55aEn4auQ9f/+HYYKpRxgzYuNbWwxisLw+4pIQNvuUd0/aWsVOsnGLtGLLR0HhxxqviIAO09DKgUKkuL8BszV7tsL7/EGPiXJVGDUlySe1QBpdK9Bzb+QBzchQCYxLGtM6keZ6lfIznnst9wwoPsVpJAX3+Y8HKdMWupXhQWXwLR06m5w8BIYd1siCEcL6UKGyT20sTM8lIsIKOpNlkW7/GUqojxfI6MnbFteVFUnf6f5SEomkvo1sRUZZeHlbobdcE/WdJCQbPLIg599ifEnM/dAT8/pE440BEjgahMdY/DdYs7g3JymvyttNA==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by VI1PR04MB9786.eurprd04.prod.outlook.com (2603:10a6:800:1e1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 15:50:41 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 15:50:41 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v5 2/5] remoteproc: imx_rproc: Populate devices under
 "rpmsg" subnode
Thread-Topic: [PATCH v5 2/5] remoteproc: imx_rproc: Populate devices under
 "rpmsg" subnode
Thread-Index: AQHcYto+jpS1cJwWJ0CSzeusJbSMPQ==
Date: Mon, 1 Dec 2025 15:50:40 +0000
Message-ID:
 <PAXPR04MB91853C6A0BA9BC556A09EB2789DBA@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-3-shenwei.wang@nxp.com> <aSdMufLCeqvVyKsp@p14s>
 <PAXPR04MB91857863B163B3F38A26647389DEA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <aSh67mvFB_00PywW@p14s>
In-Reply-To: <aSh67mvFB_00PywW@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|VI1PR04MB9786:EE_
x-ms-office365-filtering-correlation-id: b035d3dd-c45c-47dd-0514-08de30f16147
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?kotfLQ7jJRnPGTIoGH8ogt/95PtkT7UObPjVQhNmifRfvTzpmAGcGzZOWkA/?=
 =?us-ascii?Q?NZZg/lBHovFwmLylwQ4g4NBTXAfmHRS5jqcqJEkFZkeiPx2Ok7FJk9etwUNG?=
 =?us-ascii?Q?pouyUESwdyGfKE6d6uJM5VWhm6QTbfczCIIF3qELFO6UAaOL467CCUXf6Nh9?=
 =?us-ascii?Q?K3yM48k7LMH9Y+gEGZifoYl2Ty+bS41oquXsslwEqq0gp0pyg3eWkKDP1sAB?=
 =?us-ascii?Q?Qz7B4FhddsYTgzETKpeu5Ht4weQ4jNgda1p3sDCx6s3FVDKMklmClA4+KZBk?=
 =?us-ascii?Q?TPGPz1oYdkkbVE5csfMvBdCmiC0N/uzIs5v61Z/PksBNUXuwsZoRthyf4bHL?=
 =?us-ascii?Q?6bFgY4uK6EmlgZGaSiNOeFBSfNSppWMX0t/LEhb8MAoS4x+9ttmkvdDoPCOX?=
 =?us-ascii?Q?UGThzP8dfOq3lIK15rBMdVrZVOVdZg3xeVsPQTUdxGQexvDYtrSMGpM/4qbj?=
 =?us-ascii?Q?BTmm+EDhghhY5BNm2NQhgZoyY/3mpzt14vuaMzaSSa+Ah5Sxe8STPvqNVnSK?=
 =?us-ascii?Q?jccP0+AelvWqRablCF1glmYxobjZLxj4OKYZGxhE5/kcL/TOs8yMw1pO3B/y?=
 =?us-ascii?Q?ChuLYF9mMlH+GbcSi/1xuXeYxJfYIG37BlNoXMx9LVHEvZ+5krNRFGNkZhbH?=
 =?us-ascii?Q?EECFYg8CnnUhxKCrWPZQ1smldJ2mgb614BERAksBHSqe8dQhOz6jlIgt0wYQ?=
 =?us-ascii?Q?y6UiR92SSsGXUdhtu27GAUov2ncN3CQJTT6yKwj2Jno4VRjtU08/1HpvANk6?=
 =?us-ascii?Q?dmrFCf2AS+G5jdWgNmOwfugLlRL6ooubAi4i5Dwcm9Jh4d7c9wafAgz7eMBx?=
 =?us-ascii?Q?SZRGJuqL+c28wosJFBz8KwAQ8etEpOQmsy/V2NsaeusuQYduU4tMUGhs251n?=
 =?us-ascii?Q?hDuQ+zqdBRserv6Hq+2WX6LOTic+6Ju7SlwXIla7rKKDd00oiUfeWSk2o3iF?=
 =?us-ascii?Q?pmFX7/ENKgNI4k5GkS5IeG4kDgyWRhLKax22S9Tr57Qs0hCDE1iMHku+cLC+?=
 =?us-ascii?Q?G3L1tRiw1r4GW094Pc5u5xl3RPDxCuFp1EY9nP2zEZXUUZNzRtNDcu+gy3EL?=
 =?us-ascii?Q?5i2R91qfOmkpXsAZYdgX4/8gFbo3mcDK1pQyVanHnXpx7NL8Gz/BzEfwIF3J?=
 =?us-ascii?Q?20L0pyaFPNdHavV6/ZeOAnb3uL2RpFvIzbTc2fqtGhcVHmbzgYBdffv17Q31?=
 =?us-ascii?Q?ggTfk5ZOkZ/GzIJALlhKHOVoiMEPSwbjcjm5H3uQoAysc9XtG2MrmpWjIUhy?=
 =?us-ascii?Q?unGx4CFZWHD4kh3IDifIWdezNeFrQh+nVMhZdOGkGaNsOw8KXfpgquHwYVYY?=
 =?us-ascii?Q?2YSOiNZvfc5uT1KFmCq13URkCPt0nnlNrpmIPnzI9UY4TjQiRvF1bzfW2LK0?=
 =?us-ascii?Q?0P0Ye3nIKlNZMrrXqRQNVID2FDjoojenuNwYxtZYKmpWwQKBkh+MDqvDF0pn?=
 =?us-ascii?Q?bFMBvnwtLYMiNIfmax2G2uONadcTtJ3MXFJG4ApyZKFO38n9QtEbPrxXlGco?=
 =?us-ascii?Q?dJQ1Vyc+AzNGOL/N2hkLxZOij4YCPGzIq6cs?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?pJxftt97BmCxr8C6pAqGEGrFO2yd1u/e7Z2TQFvt/DkKxGQAe5sG3SDPFfir?=
 =?us-ascii?Q?2M+NGWiBMdDNG2nlTfTIjDexAM+tUGDkCCkaGe7F3AmHDRWkO6V14Wy+kaFA?=
 =?us-ascii?Q?bDxbz2nCmrVVF91BLF8MSzdxiLtK1+qU09ZKUpXeUpLg/49zhtZqFC1EpS0X?=
 =?us-ascii?Q?8F3Y8AImmenBpxYqjjQ7aWXq9KqoL6H0ZHlWq/tbo+3rP0PgKRyMwTzo6WC7?=
 =?us-ascii?Q?Y2M+b59kvotbQLY8FDjagSbPEBhY4KBSFZ7+r3f4ivkhS4LTKtKurEmagYHm?=
 =?us-ascii?Q?L8Y0xMngupDAGebqW3ptXhq+aBLF55N1b3HmLVWFqgsCdZXN9NFFdGccx4tC?=
 =?us-ascii?Q?hQJ2qeV2O3ULuvMMROPrzPd8l9phEQTTZqEfdjzjp4xYy6Rtqe51g+xOUJyd?=
 =?us-ascii?Q?MnHIZESHV+Ff944Fuytj0zYl8Ko4cjy8Aj77walTMXx2dd51HdjmHLPb9uSn?=
 =?us-ascii?Q?V0pvhXM1aOUuuv26VZkhJsymiq8EdP72JQJNl6LfqPf2HQwVWBsvnC6MOIfO?=
 =?us-ascii?Q?Jp/SB7QXQgrwwsFxMxqz6yBGQGz0j5DYNUCy+SdCSRYtTKIsyF8DGuL08Y6i?=
 =?us-ascii?Q?XqpLtGUAGVHNDO4sM53PLrhzxIG0LM1dgdQw5gm8Q/PCY+AtAluLpfX/c+tC?=
 =?us-ascii?Q?Cgsa0u2fnJtQse9Dt3cdIZ0aIViGCBVQ5Zf8THaS53olfQCkKuHXAjs0h05U?=
 =?us-ascii?Q?ge2vOL9jxLtGaPxKwJk9hhBPOBsbVqPWKSioZldNt7QFVr+VYIzOXm/08+w+?=
 =?us-ascii?Q?eU83zAp/MpI6hpX+1x0Rfa6E28wE+7QbuDUDBi7qMHv+dqCFXCrFuYAQM+uK?=
 =?us-ascii?Q?3uojexOmmn4c2XFJs0X3ZkmkFJYB9wUhRvOcizBIMSP+fvZkPwVVJa6Z6lfa?=
 =?us-ascii?Q?VeVPWVMccJGJGx1zLgmJXchiAX3y4GoEMiHIDxCmVirmPYz1KHoMn+O1gt9Y?=
 =?us-ascii?Q?y7uFqW3kXBKB0qm1WsMP/kqQVcqlhduIqh/i5yS6qJTjSo2vfxyPUf674eZv?=
 =?us-ascii?Q?HbonXGatSUFcd53o5xbrsntZlBSYqUCnOJRQqzSCsgVApWQztcr30eOM97Av?=
 =?us-ascii?Q?ula+Kv8n69xl4Ymvi3I/cw8xGjmM0WEFNvK/qpxQDhEhpi0ivL8kp1hIcIAQ?=
 =?us-ascii?Q?I7oOx+frFr3xHakdMnkdZ/8yZvibWJdOgOWUb/texvHoFdljQZ1+fTdc+MV3?=
 =?us-ascii?Q?Coe285ytDfTVYPxcPWWGfdHkZt/PmyTKYqWzhMRaGJbG6O3ZDSJvgcZzJe5J?=
 =?us-ascii?Q?ruRI36uRtL3XgN+2g+LQkhKWVejRxrsG92blWl4hlj8ZjJnXM6MFbHcsJYK8?=
 =?us-ascii?Q?tv34w7oWeyRAb+zHgPTwUMNA4/HQ4eBJsFcg9B1q5xkfOievwU1ff42A7nUO?=
 =?us-ascii?Q?vGp9eShoojDPZSKFTI/cOedidcGBtpUvcHaSp6iRzofS0xzqq7tj+1EcK+au?=
 =?us-ascii?Q?0KtMzu70s70WBtapltZz2wE+/IlmyJExN5OCaHPwQBtZe4sGD9AKRaFg/2Gq?=
 =?us-ascii?Q?dxDjYMxwYpgeZkQcdT1z1IN72rVbuqcqRN4v3OoJeK9oSFnZkJeGb22pdLfl?=
 =?us-ascii?Q?LmJvZAnjUDTzu7G3LBqxyjgTnFJvj6jQyggv+ByJ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b035d3dd-c45c-47dd-0514-08de30f16147
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 15:50:41.0352
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HfTr7iI5mpgL6Rr7lmcqY5Omob0gEgVePjDXE3krqDp9wBhvzPpZhGPfexHPTvRSeqJbufgqIXSUzFAdM3d0TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9786



> -----Original Message-----
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> Sent: Thursday, November 27, 2025 10:23 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Bjorn Andersson <andersson@kernel.org>; Rob Herring <robh@kernel.org>=
;
> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha Hauer
> <s.hauer@pengutronix.de>; Jonathan Corbet <corbet@lwn.net>; Linus Walleij
> <linus.walleij@linaro.org>; Bartosz Golaszewski <brgl@bgdev.pl>; Pengutro=
nix
> Kernel Team <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>;
> Peng Fan <peng.fan@nxp.com>; linux-remoteproc@vger.kernel.org;
> devicetree@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> doc@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: [EXT] Re: [PATCH v5 2/5] remoteproc: imx_rproc: Populate devices
> under "rpmsg" subnode
> > > > +static void imx_rpmsg_endpoint_remove(struct rpmsg_device *rpdev) =
{
> > > > +     of_platform_depopulate(&rpdev->dev);
> > > > +}
> > > > +
> > > > +static int imx_rpmsg_endpoint_probe(struct rpmsg_device *rpdev) {
> > >
> > > Where does the rpmsg_device come from?  Usually there is a call to
> > > rpmsg_register_device() and I don't see it anywhere in this
> > > patchset.  I also don't see a link to the remote processor.  I can't
> > > continue with this set for as long as I don't have this information.
> > >
> >
> > It is in the function below named imx_of_rpmsg_register_rpdriver.
> >
>=20
> The function below calls register_rpmsg_driver(), not rpmsg_register_devi=
ce().
> I still don't know where @rpdev comes from.
>=20

The rpdev device is created by the rpmsg bus driver. On i.MX platforms, thi=
s is handled by the virtio_rpmsg_bus driver.=20
When the remote firmware sends a channel announcement, the bus driver creat=
es the corresponding rpdev device.

This patch implements the driver for the interested rpdev device.

Thanks,
Shenwei

> > Thanks,
> > Shenwei
> >
> > > > +
> > > > +static int imx_of_rpmsg_register_rpdriver(struct device_node *chan=
nel,
> > > > +                                       struct device *dev, int idx=
) {
> > > > +     struct imx_rpmsg_driver_data *driver_data;
> > > > +     struct imx_rpmsg_driver *rp_driver;
> > > > +     struct rpmsg_device_id *rpdev_id;
> > > > +
> > > > +     rpdev_id =3D devm_kzalloc(dev, sizeof(*rpdev_id) * 2, GFP_KER=
NEL);
> > > > +     if (!rpdev_id)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     strscpy(rpdev_id[0].name, channel_device_map[idx][0],
> > > > + RPMSG_NAME_SIZE);
> > > > +
> > > > +     rp_driver =3D devm_kzalloc(dev, sizeof(*rp_driver), GFP_KERNE=
L);
> > > > +     if (!rp_driver)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     driver_data =3D devm_kzalloc(dev, sizeof(*driver_data), GFP_K=
ERNEL);
> > > > +     if (!driver_data)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     driver_data->rproc_name =3D dev->of_node->name;
> > > > +     driver_data->channel_node =3D channel;
> > > > +     driver_data->map_idx =3D idx;
> > > > +
> > > > +     rp_driver->rpdrv.drv.name =3D channel_device_map[idx][0];
> > > > +     rp_driver->rpdrv.id_table =3D rpdev_id;
> > > > +     rp_driver->rpdrv.probe =3D imx_rpmsg_endpoint_probe;
> > > > +     rp_driver->rpdrv.remove =3D imx_rpmsg_endpoint_remove;
> > > > +     rp_driver->rpdrv.callback =3D imx_rpmsg_endpoint_cb;
> > > > +     rp_driver->driver_data =3D driver_data;
> > > > +
> > > > +     register_rpmsg_driver(&rp_driver->rpdrv);
> > > > +
> > > > +     return 0;
> > > > +}
