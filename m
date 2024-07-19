Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011036.outbound.protection.outlook.com [52.101.70.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702BDA35;
	Fri, 19 Jul 2024 05:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721368121; cv=fail; b=qdG8sSIzWXmWhd8F/MbsncNOOcwGHAwK6VdpQRYR3EE9qKuqisCufUy3wlI3mBhAdzNuh7tGaWsgDkIgtAQOIqyLdgLGxgpM4dHAaqzxRQI3UbynJr7COdqWfFcOF4YejhOOOWioUaUXBqwZxvGJrGjxh3TqqO1RaUDxf1aU7Dk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721368121; c=relaxed/simple;
	bh=T03Vemgybg07tldmukjvn95/IeuhRtiIH9qFz1w88q0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=utKcYq6mlyQyL4S7MkQg/Im9k/c9HXYP6ycb0EHQV+F3h/58itdSL48RcL12caAuvx5KChJQa0TUIRr3c0SeBZxlAb8h+RZ18GSHf/RGqxooC2vUibxFi6rGvORkTeogj6ZcfcXZDXr7pRO+UwFBcxhe6ix7H/LSZU00M2oOLr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=bPJoRZ+J; arc=fail smtp.client-ip=52.101.70.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="bPJoRZ+J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RzuaBqP7Gj3Qqi/VuInxDw8OpsdAToQucU4Se92LXcFCURtIX3i8+Aq8VuOlIJiKZdRdyyNe2cBflkSBN7fTtdnskzgwhAA5O1kzzgeg+xTU8ZYimYsqZLsPOAhO4wur26cV9J3O7XfL/jxdSmM/BRKVDddMPD/E3wIffNlPjwsF3OAKVfohkImREaSMH4ptZswJhP4Wu9bltQ1LQcr+n48uFnMMTt3GiFKAZXoROf6sMcSibtESaedl8nrb7UDoL0Ofje8AX7wDELf+7+gSrEp5LNrwwuap4RL7c3zUqdxc6Gzru7s8Sg/zuRlpoSi2VI2Tgv4Egmhf+NhH0XfzmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLQpVpV1r4viYptNqQur23vw3n+imgfOaOKO1F8IqxE=;
 b=KMwuGnaZlo5XKsyDsz6GshpT46NIJMj+H9oIVpsM25L0aT8trPHE4f2J613RNYm819l6fK8eP5jJIrcpO3KgaRjlNcyO6rHhiR/ZTd7ddD71L1cmiPhujvsRf++WPRsFaLoHvnE76o5yMIwU3izopR8cjpt+brwL53V3FJrBuuq7vVQ0LtgEYzN9TIoy+nOAGMdESkVmf1uu3Rbs5z/9pAl2kRVVFTCfcr1gB+O/M7rTS2X9wa+1A4iaJpCjpqF85Puu93d0B0T6EXONdL1+K0CPl+HXuE+GI2FPcVQ5DasOoP/rNNxeQWl/HMvCWsdRTM3rBV5wni3I+wwQevAAww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLQpVpV1r4viYptNqQur23vw3n+imgfOaOKO1F8IqxE=;
 b=bPJoRZ+Jpt7kZFO8znMjubkaCxMsQ7xPmf0ld3YfrjIXwfIFqMZOBHccm/exkFibD8vjpr3lq8smSHy2nDzqkesl7GXIkFEbyXaQqJTsY/iJa6ocdsGpdj3Ovv09lxC9+c7PQFoCRAU123c6P9BcOtmFZ2cqQteGVj/Lt+7hNQ0=
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB7013.eurprd04.prod.outlook.com (2603:10a6:20b:116::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 19 Jul
 2024 05:48:36 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7762.020; Fri, 19 Jul 2024
 05:48:36 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Hongxing Zhu
	<hongxing.zhu@nxp.com>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 3/6] remoteproc: imx_rproc: initialize workqueue earlier
Thread-Topic: [PATCH 3/6] remoteproc: imx_rproc: initialize workqueue earlier
Thread-Index: AQHa1DUloBGWaBHTDUOhmoFGgxWVuLH5hAcAgAQRsyA=
Date: Fri, 19 Jul 2024 05:48:36 +0000
Message-ID:
 <PAXPR04MB845960EFAE65F1D0555E1B7688AD2@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com>
 <20240712-imx_rproc-v1-3-7bcf6732d328@nxp.com> <ZpaT/Ioa9l5LBT5Q@p14s>
In-Reply-To: <ZpaT/Ioa9l5LBT5Q@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM7PR04MB7013:EE_
x-ms-office365-filtering-correlation-id: cfe38605-f04a-494b-2a39-08dca7b66ef7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?OE3mOqbWGuNEX++JOKqUwWtYxn4jLD784DQI30+rf7oH+pM7YUqAhXV0/z9+?=
 =?us-ascii?Q?cqwvMBlTh79bW1+I+Vv4UfuSqPq1HIZWXf3VLqfC2m6aGTPQItyPkPOT9OrM?=
 =?us-ascii?Q?casolSt0ZB1vqiIUpDrGD6NafgTFGBcu9e6GEkkO3V1Qpxp9E0UciKxoGUSL?=
 =?us-ascii?Q?yH5FAD5cTFhCYXqzlsiZcsPtD/qMnXulfoEZwn2DAhtCvwbXKXnu6W4+Qbi/?=
 =?us-ascii?Q?r7XdbMNSW6OveMC8MMMCwr5krni1z8Z0gvwRuwynyKRKnmDu6hChYtRgJrw8?=
 =?us-ascii?Q?TxiqbnKbjU9xF49f44OvDQu8mZtFGooTGJjYS/4pfYxogbw+uW2SEsD7KPvm?=
 =?us-ascii?Q?y3g+85uBEkaa6hvSrtj3WIbOizRoUgX7J1uF3DpPHzr05Xf6cILYKbpIMztB?=
 =?us-ascii?Q?fxM3jNaiI0Iwx/KXXjKkjCFP50AO3prO/LCsNTuYm0mHgGrGjdFFBanYANHc?=
 =?us-ascii?Q?l9yxoQcsWT6ktyfBG9/QXB469qXY0TtF9J5PArEC9nUVfP+8Dk7W3ZGhAAOo?=
 =?us-ascii?Q?yTp8PUxpdgZdi4BLIqEEVXU5uuLxjk8/Qq59BqaUjbBtI9kE/GyPBqm/iTKW?=
 =?us-ascii?Q?f3CVeWLjp493sF/w9Kzn5RozN0pT8cBJzLFXtF00Tn1xEXrWA+SkRM12GIL3?=
 =?us-ascii?Q?5qUxBdLDmYdYlY1nkFyZItkm0jYBVZLirKp5hIMxxcAL2ls0H4FoXe1KBDa8?=
 =?us-ascii?Q?jDuRelVVqRnorVU+jrAMklpwPxO/8NZJmYDruqXoR2ukEVR+j9c7PuUCIqKv?=
 =?us-ascii?Q?ClvZyCEasMc+MYsJvbBVKqrOn9OSGa6FmGrnDsHNlH8FVcb3QTP9KAFJZbeG?=
 =?us-ascii?Q?FtuID5VgrvnJjqShwqNu3FHqSJtbvAdqMUKsWtKa1yV0QzQVK1lp6RVpM0nV?=
 =?us-ascii?Q?CsxwTlANI2Xc83//y0uvwQgwYgIVrFPu5Q47B+oJrNMoOfMZnck5wFN6o/r1?=
 =?us-ascii?Q?ZeRsY5hnppNfyiQgvFsPSMQppw7LLqYRoTpdCVnbq03TnacaB12HR/CCPqow?=
 =?us-ascii?Q?cd6rsV3HPV9uUtsL/1WqqV+gKQAIYSOuMQQJbpG3Buf+7ckQknFTughuU0N8?=
 =?us-ascii?Q?RXebrN/6aP8rR+t55fBpzrEqtH66R5WkGwHV0e+eKFxmWr0LVIdnQSMFS9U5?=
 =?us-ascii?Q?kkYNX8PUi7/7noUCkmbILIzgRXtugirQ4FLBKwy46x8SVEFo/gRdJ0bDmuFo?=
 =?us-ascii?Q?pcwuVCBhV3vcxlMmaEix0hmp+oZPmUKubhAu7KjjbKARULomrMGkztwGF3gd?=
 =?us-ascii?Q?+vitsNeZ5LzpFNSK0BzDIxcvwOvMiquBj37IIW3PO/UsMGy9zixUyC8GYIP+?=
 =?us-ascii?Q?6buNNDmpJesRpxgi+yarpnhMr+AG8sKffFMLPsCI1ExX6Mma8/fZWYEZEaoq?=
 =?us-ascii?Q?VFWJ4F9K20IS1lKpL/rxjzGn/mZBZI3NiQ30+3hGmZWdz83dkQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?f1NnJkvtK2RGBVUZ7w/R6AaKipHPj55f9qLSoaArj0aCU8lZtPh6NtyOV/z8?=
 =?us-ascii?Q?gziPIcfNoS8wug64GlF12dF7SL1kfSNK8XiUQUlSXyueoM9oMffhi/lewt28?=
 =?us-ascii?Q?/iGHRP1CWsg2TvSFzP00fbM/36EuoHTTOxTbDtg27bT3MVbcdMbZaNg/zfkn?=
 =?us-ascii?Q?pS5I63RZBAhUO1Gj+sSOvMJRcL2HNQzWf+a1Sd5efYnRjJSdiaszMt53bGwi?=
 =?us-ascii?Q?e37gZiclVWgsQ1Wy7n1+WcHA6JLpCtc72PBsb1O0B13sJOF6HUUaKW9a8ZS6?=
 =?us-ascii?Q?00Nllv80KB6hFISKtNO3x79H4bt5eT42sgEGLI3utS6BPZQfk8UW0FWrW1Tm?=
 =?us-ascii?Q?GIRQyFM4nHGlNv17tnvMiSW1Xol3kUcNIczNOlGEidzcT/HLhJApIKL8Zn37?=
 =?us-ascii?Q?zv6I+ZqJtD2GRfYmY5A5q4z97kz9wguJ6ogKm10eMQ3pVEsGsXtb8OoQzMNW?=
 =?us-ascii?Q?hwmOrURxggbhjlf++uVQAfSoAR0ijKmb93jug0P642ET8VcD+8ZCDLPQNX2R?=
 =?us-ascii?Q?4/xm2etdnSUBVEDCGOJhQnPQ+Ed8vV6vOTz4mfoNGrju1fulMrX1QkiXQALx?=
 =?us-ascii?Q?GuZjLS65qwllr09DMLJWBululOEESSAww93OEDfko1NxhdyZcLymwLrE1RmK?=
 =?us-ascii?Q?6sEFd1wIPUlCQ0UJiCvCc2qY+Nj8MqBojFAUZYvybL0LaQ4RtQvWMOoKayta?=
 =?us-ascii?Q?NXKyjs3txSAE+ZGngDksHszZuvSSe52/5gXGe+x+kc2kcNg+rQYXjb3TWivN?=
 =?us-ascii?Q?Y1VZ2zvuRnsU1b2k/VlkEjRgBO0X4+1I5mv9S7dC1WPITbqKfmrKCulTIrwZ?=
 =?us-ascii?Q?ke16KM3yO7QcbeCysIawN5UFyCH3UZ9sFOumk+xXZJUp5skcSKEZNwFfraRL?=
 =?us-ascii?Q?HTJQ3my858XKERaX9zG1x9nLccU91hCRjlmpI+eY+VB2/f+dnR9jhnAiv7Np?=
 =?us-ascii?Q?ewn2cUttooZMQxTvy2UHDDBrtFHMCfT+TexZvVOLmDBuoyvkc513sE6gADgu?=
 =?us-ascii?Q?Zc4PqAZJ18SZH76d4w/Tab3H7jmQdd8kCgCkTjGemtLrVYGc3rnmhGAYGUuN?=
 =?us-ascii?Q?ZZWCoYI58wutEAzFH191WImLQks1JZvw/X7lCdXK4djHxW3nz5L0aCT85ZYU?=
 =?us-ascii?Q?Jk6Qf6SjwI2otX1Guqfd6BAHL5ULI0ur45wbKPIsf2LfOwfTzQK+LKq6iHAT?=
 =?us-ascii?Q?jmFeah+8PXNJx3YuXGw04nMKRa7oIuPB1ibQohQKNvKAVRUP6/iIxN8uxP2v?=
 =?us-ascii?Q?TiWivPggooczvMaUVrsgkXRz6fr4St8YOMPPfTcS0fF4UU0sV3YWZkGiQ17c?=
 =?us-ascii?Q?Z5VT2168MGP/GgMpLC0APRS7Gd3rU/nS199SjgQUkW55GYqnQ6jMUcgaLZ7E?=
 =?us-ascii?Q?mMbLU2qxh8Zj7+Tt+2c3Cjpc4nWv37OAl5d7V1p1yC8Lkzb98R4S+yM5PsOG?=
 =?us-ascii?Q?vW+OJ8mjcKeODTIe6DLoFSr7DgLJLo8AiPK8i16K3AgqEu0Odf3nWPHgiggG?=
 =?us-ascii?Q?KTIbYYYMaYYSriMPlJdb15Ayil5p1TgFKOoHcBJ6cEr1otC9i+nZd2avIxYg?=
 =?us-ascii?Q?1HmSRPQEc1VjzXLe55Q=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe38605-f04a-494b-2a39-08dca7b66ef7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2024 05:48:36.6942
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7OaTswAop+Q83CTUnw2edXDcnzmKDNZeDqkiwyWMTBSz44VL+KuB38OhDWex7M43gRL+QsxJpzM1Rk+OhKBBGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7013

> Subject: Re: [PATCH 3/6] remoteproc: imx_rproc: initialize workqueue
> earlier
>=20
> On Fri, Jul 12, 2024 at 04:34:56PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Initialize workqueue before requesting mailbox channel, otherwise if
> > mailbox interrupt comes before workqueue ready, the
> > imx_rproc_rx_callback will trigger issue.
> >
> > Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
>=20
> All reviews should be done publicly - please remove here and for all the
> other patches.

Sure.

>=20
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index
> 48c48b53a3aa..9e99bb27c033
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -1087,6 +1087,8 @@ static int imx_rproc_probe(struct
> platform_device *pdev)
> >  		return -ENOMEM;
> >  	}
> >
> > +	INIT_WORK(&priv->rproc_work, imx_rproc_vq_work);
> > +
>=20
> There should be a "Fixes:" tag on this patch.

Add in v2.

Thanks,
Peng.

