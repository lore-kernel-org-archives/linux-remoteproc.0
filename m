Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011060.outbound.protection.outlook.com [52.101.70.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC5A405C5D
	for <linux-remoteproc@vger.kernel.org>; Sun, 17 May 2026 08:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779005033; cv=fail; b=pdJn+DOiCtMKQ6vl7oOZpNyg9MTgFdX+lFfNSar9D+bD0MZlGAQ2BhEscYfop9vqlZP5iZJz4MMIOoACroJIZ9p2ndTdAR8DpOUaOaMct2ZhyuyXPg3o4FRBviov+dpz4GW1WiEQEpnr35h0u3hPUko1Ug0xbiO82StnW7f+VL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779005033; c=relaxed/simple;
	bh=qVuZNURY4jqYql45LXvpSbMvrUuvB2yHcyR0WnOGbEU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H+PWlrNC2+TELtaW3ZF+XOTkbNcCC4bd+ktNqNe0CQOEkhXwJOJuwk08zWo2gE0IWLzsXu0CAVue79tjMRn1Pa9pTxsWR2hJpn0UxLazl7TcnGEL7hnXpsoH3oFihYlO+/DMvDzk+pui4ZSazQxmxjFNfaMVBagySEkH0RhhMHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gUBkdUTP; arc=fail smtp.client-ip=52.101.70.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gUBkdUTP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+OXlt/zyGgTdKNRgSctVNwGtxCBrX3nbfN8IKyLRYRevs5Zm6RNZ29IIvn1Wq0F1Xij4A0v13E6Pvjab78KdegF5N27Gm01nj9kRzBB0+PSyOem6oFvDfS4tV0FraCSjJ7M1eLIwf8Elfo05s6pj/ER7+Ew5AIEZPpZYvr+Rh2BQa46J0GjGJsypLXDypNWBFUn19CHWDJ25Taa3lhhayJqsYtE4eqs29R1oCwaj5Wf4+bpJsE19ccCZX6LJBUYbSaK3s0Nr+iXkFe3+ANM84opYeeFmkzwyYTo1bAIkykdFoNpDUYvlYM2tmBfSIoQGEQQAHZpf8yIR0XMAGBdMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Il7PMHQGo/DCVnRCOB/AiLIsnwUpFXqqBHDSZopNLNs=;
 b=m4akz4lizgUBtSBrt7kOqpjnqp/smt/25DviFKKeC7AKiTDzRG5lX3+6W/Z+xcOEKS+aMDIyy0WxkKVtZo6jJvIP2hKpsXgGq0Adr6ShZV+GaVDcfmpPvbGPNEnhb6Po39qXArW6rKod2opIVTbjksaq+3h736oyDstZGGIHLngSqiOullPYoqdGdTqLbfPbd/UQpUXMDLNG29Lb+Hy262y6Kfn6imAUMMMdBPwnu+UHQ7TSzrYyRx70DkP8jgRbeqAC+p+wOLdL0sKs8pKW9s6XTJB19DNQonD2aFsj9kkjvFUKMMG08RaOHB5qqynOqveSD72rIv1doEgSnAS4bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Il7PMHQGo/DCVnRCOB/AiLIsnwUpFXqqBHDSZopNLNs=;
 b=gUBkdUTPHxzikPMX6bXyhvG+3WNrMiuL9nFfgRlpOCYQr52tU493iepAzd7WB7ef6LszJUCUjdoN3Yt7hnmwyhNBLfZpKPWO3GRF3Iff9nnQYQnI1hCsIJM5WwtFcvZPAUGo9bA9/dszYlBhSkkTbDbEglWjVAmVMzLWD6XUXdcaO/w6axPKGZKLCMrUAXaVoYKGR7YQnsYVbO4VxALQpc1XcunfY8HjiPGNg5GZffSs2FUVn95miRoIPFhon1FC6p0IGhuadQ9+mDRWoqGFQoO6qfm10ii3dr56LhPxI9RPbE3AJNPf1gHg4IIKq83ousTmvKW3puc2JgUAIl92ew==
Received: from DU0PR04MB9418.eurprd04.prod.outlook.com (2603:10a6:10:359::6)
 by AS8PR04MB8435.eurprd04.prod.outlook.com (2603:10a6:20b:344::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Sun, 17 May
 2026 08:03:48 +0000
Received: from DU0PR04MB9418.eurprd04.prod.outlook.com
 ([fe80::130:1767:2462:db72]) by DU0PR04MB9418.eurprd04.prod.outlook.com
 ([fe80::130:1767:2462:db72%6]) with mapi id 15.21.0025.020; Sun, 17 May 2026
 08:03:47 +0000
From: "Z.Q. Hou" <zhiqiang.hou@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"andersson@kernel.org" <andersson@kernel.org>, Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>
Subject: RE: [PATCH] remoteproc: imx_rproc: add lost DRAM range for i.MX93
Thread-Topic: [PATCH] remoteproc: imx_rproc: add lost DRAM range for i.MX93
Thread-Index: AQHc36qlLtAmWCuqUUmkEpJJMxRMW7YJEf+AgAjVZaA=
Date: Sun, 17 May 2026 08:03:47 +0000
Message-ID:
 <DU0PR04MB9418BFF486D6F543A8A0087384022@DU0PR04MB9418.eurprd04.prod.outlook.com>
References: <20260509115719.12546-1-Zhiqiang.Hou@nxp.com>
 <CANLsYkzB8CcJ-dpxPjkDYqVDxw2oz4p+xThiWQaDYbWAp__eNg@mail.gmail.com>
In-Reply-To:
 <CANLsYkzB8CcJ-dpxPjkDYqVDxw2oz4p+xThiWQaDYbWAp__eNg@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9418:EE_|AS8PR04MB8435:EE_
x-ms-office365-filtering-correlation-id: f72e7540-4b3f-47c0-b4c8-08deb3ead30a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|19092799006|366016|1800799024|38070700021|4143699003|11063799003|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 zSx8CWa/yFl8IgvteLLKP8ILZBsbHMEGFjJPKrpguNkONuxv8F2sYpkcAyBzBVrzJD0oLam4Wa1OE8k7kFdkEd3LviMbRpUEYkkQ9YDhPSltenP0ECd3M8n364bCOQ0QxU9pHA4kcpfB8jQlFYCGOVmQHBjefack4O2y2bKEQ6JYRf8fcJUn4UnIVkiSS2jjXNzW942g1lywWNxl3mmwvxuvmRCU3EeFDiZx73dFAo5yF8GssGrlVRJ6SgzeUb/8cuNKwL1i/yi491YeBfrDMy+0mZYKBCbOctJ4HETsczBNlA6Z9pWWDS2RbX3UFCWM9CGCLXF3fjOVyMT9hYtIyTLhsOXNPTRIsXObiBTAa+noldM/WRes7fKQDZsk/mxAdMjmY2SD/o7mjSI+k118NKB54VHa3i1PSjKJTY0Pxsqw6z/3bp5NRlxWrMJglOrz4vr/D87+szEpMNEPiTDXAGG3qGxTTWrEHCbLOiqA9CxMVhN874W2KsU3L8tRPA92/46GP0F/yZQgLWRwJFul2QdYYgWWHOf2Ftb7v508XR4vG0yAgld0k4tlpOHW9NerMmVP6FFmB7ITRH6iUTadiD7B6IegQmIMC1xd34QfysoGHRLFDBiYRRc+AM45yO4tx8jl8lkfx/DYxy83goFSxEOZdPf3YstIy2yf4aRWE4KM74qhrPvIPP1yxW6/B/c1ET/Gqvxb7K+uWcha0AKdc+z+fa2O6nc4IFJFAwck5QWh6ctD4w4upNu6bK1c4/RK
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9418.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(1800799024)(38070700021)(4143699003)(11063799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?WhkdM3+3E+yIQZ6Phpce5puS+yUH298IU68qi7kulQvkok/ox0nmgVkcZtcY?=
 =?us-ascii?Q?Ruydz3zKzFYYZrVVcaEuJwNcDuaeuWcScq00S4DfPB/C8THop0TZ73+n315I?=
 =?us-ascii?Q?xqR6gLKDlwO7dCPNS4o0JJEnqTOG+GMj17ubrl07b1r9j4Nyk7hGl9KABo4S?=
 =?us-ascii?Q?LaqVSmbbQ8hZRKL/0bKCot6j66ts4N60sPnfIfu1iR9w1hGyiBBnXDp1bZef?=
 =?us-ascii?Q?g97f+H8BWnSevDIp8c2H1viozCjJt6ppJyp8fKJtEncKIlxRsCpGZtkLvL78?=
 =?us-ascii?Q?1CefFB27OUEWIXhLZsdbJhST0IVZ5Ixj2pDFdfGjkOUY0wIUPlUbbhHXlUD4?=
 =?us-ascii?Q?H780VTetLKTQVd5WVPb0qv+5Uiwuazw7llHh7eSxoE2TOZR2bnEJqs1CDGIC?=
 =?us-ascii?Q?TqI+Ljg2xNVfiWh3IMZwkFmeSSegVHY8c8Lh8kJf5CCgsTJpx6frQuKj8rbp?=
 =?us-ascii?Q?iep8s+YNORu/IgLBz6Xx2UmqWMdkSB5Gm+7JkepDAkOhIlFbCl3LYHjqXjXd?=
 =?us-ascii?Q?OiA1crETzdduaBMkJQ5QAuJQFUnbMc3qDIf2D7VhREhXwWY+16jCdVm3NswM?=
 =?us-ascii?Q?Ik4Wgk+6pmz4A4YRvcEwM56EJBr5fKQqu+nukruNFaXlxXPCZFqFRmQIJmW4?=
 =?us-ascii?Q?Qdc+zMLidbKA4vNdBguEp4UXww2BKmMGp0RANkrK2u3rjtAy0l3wAKw3f7J/?=
 =?us-ascii?Q?Usl3FpqB5vb8Tv0dQ8qvMTIYXreUwP7OS+LugZc8YsTe1QLdCzLKsOyPhH4n?=
 =?us-ascii?Q?EjRRNbanf0AWiYpsiIrXFrzJ3vKYqldrJ8O+/gEHlI1r4OwIQ1lBqXeyyqoF?=
 =?us-ascii?Q?vCziLK+z47HQye5KU+RQmCnRUwcAe7FCLb8IkDWdGqaf+Tc1GKKzpl22jql9?=
 =?us-ascii?Q?IDy6NyqzDGhRHdhaHMKJSpcSn1YQpJQphVhLUGGcYjEtKoecZ9uefq1Dz2I0?=
 =?us-ascii?Q?goiXWRUjA7Q0eXQ+mZndgTTDjJBDd6a2yh3r5FvVBxylM9OlwAltv1MxOrza?=
 =?us-ascii?Q?D44TDB/6pULbvz2nqXFx0plF/84LO/0mfOHfya9xSMIX4kleY0fsR4kUXCIm?=
 =?us-ascii?Q?3751ZXS/uLufbKIlxQtSWmiC/Kc29qnw+niVIVrFahb6K7BkUZS3CaS8m2lp?=
 =?us-ascii?Q?nXFpWlYJmtXc/e6R5fobcAEV5d45rLk2qa6LpM8m3VOGFa5aYuNpiT3qEMEl?=
 =?us-ascii?Q?aUdHjZU4hjoAcq0dlwV4M5tlraqTAMQ+Ksde46V8ZvLCrUVeE64vmeoE5FML?=
 =?us-ascii?Q?tIDVmis54LnNfYqftsruNRk7MjKGjY/eKoQgJ5LkQfPdE7DauNS4fyowiKDo?=
 =?us-ascii?Q?FirK3WYI+ZrFAsgao5UE9L1iOJu5I0WZWlByP6XsXJNsbIE8RWJn5Wji9lkJ?=
 =?us-ascii?Q?ujYgubLbDMf2HAleLIRHtG5mlsD3/K0z3DzmE/cNR+sE7qQxVQ+pmbX8Y8RU?=
 =?us-ascii?Q?r+Xh9Jgnl0cWeDWcPZZqrBlayVkEVjgN9c/SsQnCKsMa6hCXzRt0ATIG7k1h?=
 =?us-ascii?Q?lJ3oX7QHY6ZTRHsOimbfPpEu+kHuZfjWXn7ut6BXwLB9m1swYY1GLDHzgQgM?=
 =?us-ascii?Q?EDK8uTJLWCp4/Czxioad1eBb8Xm4Faoauf+ZgsuOnLV4dA7746nMLVvOpQPV?=
 =?us-ascii?Q?LqMPy06OobTjcuxfpKM4Qu2olSu9OpPL/XXPWRLfBbV7aA9Y5EE+bVhxNI8+?=
 =?us-ascii?Q?G9ot0m97fzmdNgND4pJbLEn5cA/wxTqmUj3spI2mb0+r5Ta7?=
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
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9418.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f72e7540-4b3f-47c0-b4c8-08deb3ead30a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2026 08:03:47.7560
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X+4YxQcU11JH5p3nfKaRex/ifGdMqHmzD3YlZFSxdIWcpi1akeMZhnR2kHIotMs6aAMjJT/i0U5lqCm8dDrFsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8435



> -----Original Message-----
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> Sent: Tuesday, May 12, 2026 1:08 AM
> To: Z.Q. Hou <zhiqiang.hou@nxp.com>
> Cc: imx@lists.linux.dev; linux-remoteproc@vger.kernel.org;
> andersson@kernel.org; Frank Li <frank.li@nxp.com>; s.hauer@pengutronix.de=
;
> festevam@gmail.com
> Subject: Re: [PATCH] remoteproc: imx_rproc: add lost DRAM range for i.MX9=
3
>=20
> [You don't often get email from mathieu.poirier@linaro.org. Learn why thi=
s is
> important at https://aka.ms/LearnAboutSenderIdentification ]
>=20
> On Sat, 9 May 2026 at 05:54, Zhiqiang Hou <Zhiqiang.Hou@nxp.com> wrote:
> >
> > From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> >
> > The M33 DRAM view of 256MB ranges 0x[a,b]0000000 are mapped to
> > 0xa0000000 of A55 mapping view.
> >
> > Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index 7f54322244aca..175c2d3099794
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -198,6 +198,9 @@ static const struct imx_rproc_att
> imx_rproc_att_imx93[] =3D {
> >         { 0x80000000, 0x80000000, 0x10000000, 0 },
> >         { 0x90000000, 0x80000000, 0x10000000, 0 },
> >
> > +       { 0xA0000000, 0xA0000000, 0x10000000, 0 },
> > +       { 0xB0000000, 0xA0000000, 0x10000000, 0 },
> > +
>=20
> Based on what this patch does, I'm not sure the word "lost" in the subjec=
t is
> accurate.  Would something like "missing" better?

Thanks a lot for the correcting, updated in V2.

Thanks,
Zhiqiang

