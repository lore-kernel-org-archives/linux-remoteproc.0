Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013023.outbound.protection.outlook.com [52.101.83.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B595324B23;
	Tue, 11 Nov 2025 07:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762845147; cv=fail; b=JqAxA8tSEjAVgzE6cGQrKMH3uVcwLEx4rVrcP8asYytquuNS6B5OIOByy37KNEvsilNvCourEjdk15b1f906DS+3+S0zvIXkIYEqQ1xGIeEAEpD+FByiGAHOxa+kq672ZI1K7b+uRZowU8BYyQvuemFGb3daVuVdeSbMPAHtSn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762845147; c=relaxed/simple;
	bh=vJndiIvS3/9h7kEEpltopsCyFsSQCdGELOHRBW9eE+Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hec082Ow4RWkzVC/+iWW+2F2bfmir5sXZ4f4ASpnQBn/a/qXOmcRctXBblOJgqORCPdyjMjADehmTj0OtaXfVKNUoCmP9ybMon+FscGsJCzUPhoX7g2A61mkCSNOWcrZZedqVPabNmpnxBRwKc6sCrwX5weihAtczQocf/h93jE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Zm4LkR+4; arc=fail smtp.client-ip=52.101.83.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Zm4LkR+4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJu8XNfvUJ/aGgf0YVu3gusfmQfAW45BVWpEZSKI8+WYL7RtMtkpCkhsbaY8RO87mjyrOa5TcYGH1WL1NscVzuLBDvM2dRGYRvAfrkHgT/6vKjEb9zbbGTplZVVrVLaSh18YMgX3Kacrl3z0Wfm/yN2xN8HuuJd/mAn8P5ajApq+nsSrR8LIyjHGYaFkq+emJFYyQD9G1QB03jmoVN7jL03WGVYsnbUBli8U8EdO25Bxru2pOr2Rnu48dfnb7e1m/VZU10lne//CevC7FzBUy/dPr3fl0B0cGpWJMGaBYYfBblfZr7BIzycR5IG+IYCosumEFZ0lKEtaxYp55FjNWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41m7eS49muItkPT0MGCAt4HQq0vu3460KyVl2NpTH60=;
 b=ssCS8WN3y6+z78SkeAFlnXsNDxJOE9tFjPSQThTbKKJYpY2JVqTnsUNQqRRHvBfIiGojsM96ZxHEtVJ+qKz0TnCUCFNm5dBCTkK+nJCZI30HoDmhT65na7Fm+l4IfK5zE+iwL9OD9ZgQ6ntFRiWta96hXjf9NzFy4e09J0D6tIczmE2V3cu5dQd0YeUsw6VMJSQrViK4K4JsV4dL7cUaWcikZBd+lTGZgthu2UhomrQarL37HGnsT5Gvm3hm3R2NTtcjEkfhvGU6OjPQcefoHLK5fBwKDqpPQYCapr+Nkm7Qfn3VrkUhVBoNqaFLHspnZcKWbw8zPy//I6iWznKt4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41m7eS49muItkPT0MGCAt4HQq0vu3460KyVl2NpTH60=;
 b=Zm4LkR+4Ns5xC4pVpqOVlonzfbyrdSuUDWhyR75nuSo7Ixdnnlldzz5iYb9Yu9lnVgN2dqQ2AqtiZGUfoYmbNWsatmOxWkRCsBUjg9UUQuhoJLKVm+tlSnfwce/hbCSO4T6X1/jNzxegNUpr+J048XnH0Q4UuPQJ+qHyXLDGyWyAIy+hRAyiAAiCDmlosF9GMlU3lVj6xsptrHMHYPhHtEIJkbcu4VJTPZZs82tE8fmNnTznPIynF1sr+rYAuB+JA1Y2wd9Vxl8cEVOe9T6dNhH3deZxuYanKPCmZy00RJZWkskUgI+Z2iAAjiAXdYGrxpNI/7/O5ve0Oah9P7uIQw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8873.eurprd04.prod.outlook.com (2603:10a6:20b:408::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 07:12:21 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 07:12:21 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Tanmay Shah <tanmay.shah@amd.com>, "andersson@kernel.org"
	<andersson@kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 0/3] remoteproc: xlnx: remote crash recovery
Thread-Topic: [PATCH 0/3] remoteproc: xlnx: remote crash recovery
Thread-Index:
 AQHcR8e8tQQXMytJOkC6502b/q68v7TYd3oAgAAOVoCAAUiegIAAS1AAgBIvNwCAANq74A==
Date: Tue, 11 Nov 2025 07:12:21 +0000
Message-ID:
 <PAXPR04MB8459029D7DCF4A6D2DDCB54288CFA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20251028045730.1622685-1-tanmay.shah@amd.com>
 <20251029032422.GA7297@nxa18884-linux.ap.freescale.net>
 <b9ce8b9c-6391-47fd-b7b5-be5cddf9cd4e@amd.com>
 <1bb3a121-614d-4040-9cbe-505ccb7a7fcc@amd.com>
 <20251030042124.GA18595@nxa18884-linux.ap.freescale.net>
 <aRIo2MUol09Onu9B@p14s>
In-Reply-To: <aRIo2MUol09Onu9B@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM9PR04MB8873:EE_
x-ms-office365-filtering-correlation-id: 4fda26d6-2107-4ff7-25d9-08de20f1a84d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?su3dVodJ8debG0PIoCetcD8oTKnoWQ1TkGiHVbqsJaPWEIshL4+11YPjlUcz?=
 =?us-ascii?Q?hADcLymHLnOWhduAseyQqPphdcbg9VQJmPqU5NliULQ2lic5Hc5qOd5BKf14?=
 =?us-ascii?Q?mxxOjbJUj4XHrlwxTbcZZ9GRNkK8SOMWSmiGlhubI9u8XRt4EOotdN0TSmEa?=
 =?us-ascii?Q?Bs1N2gyDmjRcKaiKtj555HMW3ZwiDq8xmOgYf8JpOIF6Gg0TV5/swOZrpbUr?=
 =?us-ascii?Q?bmI9dLdvltzQLx9iCVj555dADNXlSGqYYEmxMI80qNU6Z7ItSaiUUBv6MhYL?=
 =?us-ascii?Q?ButKuBc4bic7lGTd7R9k2eOu/Xk116d5xf1gEDww7UUlEbkzbOCeHtJtcmRB?=
 =?us-ascii?Q?v2fE3wkM9lSePvrJYXO9TFHzU0pbEsWd9ByXURqPAiITZKlWofnr/jli7vhT?=
 =?us-ascii?Q?BmIBx6SclNP1LNRsec0Mjx4AnqXQHgunyzazitS8jnc2Ho5qS4i53fRDBdfV?=
 =?us-ascii?Q?F96h3f9MndIxd8OYtgMEIvVIg5gmcr6m1clx3efhRffasgW4gc/gHRB0yhXO?=
 =?us-ascii?Q?RLAMo2Lj2ADt/4K2Nt66Gmwham7xxTQ8WRqGU4F+ZlYgUrm+N5PE0cfoPCi2?=
 =?us-ascii?Q?2rr00XCyJeQyJYpGPMYKrG6+QhGWTSy7uFQZtiSLfmVQoxSTuBYeARReEj4Y?=
 =?us-ascii?Q?xyqIpJgK0/T2kDBjRVyp2rxYVmpvj78aQHJGfdBHqFV/IwsZsWbHMvzBNVVr?=
 =?us-ascii?Q?qTUAWo56xHmn9N1CwImxxcewLZFckXJlizBzGmJNRE+OS8VRUvw3vZdmkaFy?=
 =?us-ascii?Q?aPIoFC78fyT6Rt6xpW0BcdeNAa+oKAwffqOgfTSsaxEXN+WunYefGpWDqTpi?=
 =?us-ascii?Q?V7+SNj12UAoIajXJ7f2tpSJQvhdm/yBZl8wRm+WKjMrI2Debe/P1+DGKvvG0?=
 =?us-ascii?Q?3FOVGIgEDmGV0gVT/6cEYEGP+E3V85AdvXhEZQlvfNLaRPIZHlz1k6gVRRLI?=
 =?us-ascii?Q?9ElkxUANpCnPt8eqhWJaDnZkhHrG0aHsE7XkHUh3PIHRaJAQblbZPEepT4Ze?=
 =?us-ascii?Q?zJkv389ql6WPM9YVzBBXQ1bdzIl7WIrASdCYwBb8KVp1ke/T5emKW3DeQ/iO?=
 =?us-ascii?Q?Kr6E+YlWjtOVu1FDETQ0iPF/OaF+raJ7f7hz/afvWu6JG1Kgxkw7EehYA7fV?=
 =?us-ascii?Q?19qtN22Ll+yjlZj9Wcg4TQkVGRC4+rKZyHQ8wwW3RId1TvWb7HY2Wi78YNUQ?=
 =?us-ascii?Q?CraNCVr+NUOGkpYHA/ZTm1jDhjz97uD0e6A1tlak+bGy5IttIg6YEX86Qg00?=
 =?us-ascii?Q?9XW7kTeNB8+Hr0FeQirPtNeK+50aWZXFun8732GMPINcgfpdDucBQ/n+P8fo?=
 =?us-ascii?Q?6KTaTrlGbJf/uSh5ZucMXQTzu/1ikFLHOlz7lDssSKWo5vZkIaqld9MA8CME?=
 =?us-ascii?Q?ycugkBGGmwhIh3MUeTufa5JrsCR2pUNNiU7DVkPV/1rgZI5IDK5M5vUvBoI2?=
 =?us-ascii?Q?W9QvTJjsVAkSWREe97wysytQyMQkqsLKn9X9OV5YgemZvp+aG2/x9CbgEpqP?=
 =?us-ascii?Q?8bVfSc99WF94r5wxRgIkaY2aWzvWPxtyNAHP?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?RPM6NPHga3vBQASIe6/aic8vhVqOocq9g4LlbCmY8G12ScCaCQe35B7EWi74?=
 =?us-ascii?Q?JBdkFfCdPTpoibV+AA8OU9txEI9ksZMC95glrNIBtXq3m421YJCNJgnH06s5?=
 =?us-ascii?Q?UdH+pWPcYNaWiki0PN3MZg0z8SU71ucFkCTZJFUdG3p47m5/8GSRiLjH4Ts7?=
 =?us-ascii?Q?1/5TAYkqXSEMUd7cb+kS1J5GbIkwYRE/erMV8KqpMH4/9/sGG/sArTMweiMt?=
 =?us-ascii?Q?W9Ljic5uoA6pt2cO9mbtafaT35WftqLHrccNfmAxcHz8oUG6DU23y7+KjoPM?=
 =?us-ascii?Q?RglC3Abw/Dwsi7IuIqJdszbmb+VJke7Je4ExFAd5dNWlqk7i7q4iCNQt7Btx?=
 =?us-ascii?Q?9fQnhnEqbsw87+acfEDBXTu9+pl1iH9Tu6HjNAJnLLQdwcVBIRtR6l69UnHl?=
 =?us-ascii?Q?gjFtKdOq4qmzXsQw0nET3GgZCHG2WpLTmgDU1LVZhROK14Y3dMYrRX0X6ZC8?=
 =?us-ascii?Q?OebtwA7Hr4aR5OsyjKD4TMtXyUuI8mKDvewJCKDCZVQ9jMGGVrYuGyw2rVq9?=
 =?us-ascii?Q?equIgB+58Nhq5an0TYvyE4wdiPRbNIj7j2uk1dSJX3GMxmkhh6VFBIHcbTBa?=
 =?us-ascii?Q?AeOyNeUX2YWNwiFgA3alD0WD+qPGHf+QaEmPOa0X1KePZDNwn4iTHpYw6dSY?=
 =?us-ascii?Q?m5iSntyEuVa1EbeA7TfuJ6qzRlzBpoxiiKWg6mNun3lbrQvi/YIQ2C5Gvu33?=
 =?us-ascii?Q?GRT/7UIhzSyHEU4kMoSFWo9DqWlaSgn5wk9JzXFPJ/qmfcDBkX/K3M7/I9RB?=
 =?us-ascii?Q?1cKPwepv2rMaWEOGFKPa7N6qNCAZB99mWtBQqvrZWUa8dXwDimWaZf5vgNnD?=
 =?us-ascii?Q?nynnzlf3RKcoUyStREIZ2qu8W7x9Ukp+1gRJ29EaPlp6/9cviWc893IJQCtv?=
 =?us-ascii?Q?y5s4PF2VK1UbD33v61gZJAq6koaR6y8UuifdjfYzLPo5U0yDZGfZnVoNV2IJ?=
 =?us-ascii?Q?hgu2Yw8gMCTd818Vkc+XDuLAt5022Pza97MIW0MKkF6fYbuy3JtpnsOQ0Kz5?=
 =?us-ascii?Q?ZTYnEIDHdHSEwTXDqDfr305o8Kh6IsTYzatc8QD4qu169Qlg1ZwdFcaUjz2F?=
 =?us-ascii?Q?tRJr9RPm9LWjCKf/o4o0uHk7D14B4pWAYCAwN4dOPtsIpj1kGOI5X8jAMWlV?=
 =?us-ascii?Q?t0CLDE3PbRq/CM0kvBNiZXP6Y6MjZ1tYVxOHB1bzstBlG6mjye3muwUNhVsw?=
 =?us-ascii?Q?yaux+70MyQIbLsKNvg7HgeExKNNZWEXUlvV7vcjlfYgb79zlLejZpp3eRrsb?=
 =?us-ascii?Q?B8Csm+oQ5uWRIfduHYAN1AZ5rlrix8X6w8uHy+t41SVbegN7iAa05uScEubR?=
 =?us-ascii?Q?jEkm3i5CGKiS7ehxDLWhB5seT4WlkoaUuXeNnVRD0idVH04gzFGvycWLzWZK?=
 =?us-ascii?Q?bOPXurK6LKO7YGW5RQRgtsZ9KvMewjDvtGlChnx3D6D4/LQTQXKzEcaAT4KT?=
 =?us-ascii?Q?WpkJlOU+8L5GMsMmEPC9x+Ae61yDIGZ1U3o6090JoZWY9wavWw70YH6EWWp5?=
 =?us-ascii?Q?xE1Xw+Dhz0xUIUE3wNouQuTtABZeZBEoCb6Vlb7rZ8ng9HJncW7jeMkVJR/5?=
 =?us-ascii?Q?8q8BvR5tEilRjfjKRCI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fda26d6-2107-4ff7-25d9-08de20f1a84d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 07:12:21.5645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uMzHVoKMbVXxX2jt7Y2VETXxtzQ6K2Ll1J04Q8DvUQT6gqfo05q3yFbv8xnDdWm8te2K2dVRTVTgy7lcJzr0Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8873

Hi Mathieu, Tanmay

> Subject: Re: [PATCH 0/3] remoteproc: xlnx: remote crash recovery
....
> >
>=20
> So what is happening here - Peng, do you plan on providing more
> debugging information? Tanmay - are you planning on sending a
> second revision?
>=20

Sorry for delay.  I gave a hack with below changes(at end) and it works.
The below change is just hack code to let me verify the rproc->power value.
The issue with current patchset is that after rproc_attach(),
the rproc->power will be 0. So recovery only works for the 1st time,
when it is triggered again, rproc_detach() will abort early in the if check=
:=20
if (!atomic_dec_and_test(&rproc->power)) {
ret =3D 0;
return ret;
}

---------------
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remo=
teproc_core.c
index a92c6cd6df67b..2b69304084d11 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1786,7 +1786,9 @@ static int rproc_attach_recovery(struct rproc *rproc)
        if (ret)
                return ret;
=20
-       return rproc_attach(rproc);
+       ret =3D rproc_attach(rproc);
+       atomic_set(&rproc->power, 1);
+       return ret;
 }

Thanks,
Peng.

> > Thanks,
> > Peng
> >
> > >>
> > >> Thanks,
> > >> Tanmay
> > >>
> > >> > Thanks,
> > >> > Peng
> > >>
> > >

