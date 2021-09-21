Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D33E2C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 21 Sep 2021 03:17:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B085461100
	for <linux-remoteproc@archiver.kernel.org>; Tue, 21 Sep 2021 03:17:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231672AbhIUDSw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 20 Sep 2021 23:18:52 -0400
Received: from mail-eopbgr30045.outbound.protection.outlook.com ([40.107.3.45]:27205
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1349959AbhIUC1g (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Sep 2021 22:27:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DyUoy8BJcSk0Hvk+t9ETcJxN2lJzZ0Gry+l3vyG28wjdhPim/QeKr8yg4QV0+Fgx4n/42TVu8rghbbU/PErQtL8wtIjldyrNyZgKahKnVyHGPt9y14TXExDdlaDsIbCP0jDey8MNdoEWHkepcTxJ2lmRli1sNXk76CtJHKeHakiH2yJt4Flyb6E1blbjq10hVbo8oa5mYdJabBZwEmJArHp2Hqf8vrOZh1e1GrClT5pzPS9jovTG3ipAwwt5skg0WGkvdOQb/VS9jFHSWpCht9Lf8eRnNpL2PX3KWOqjphbH6UUw6F1VU6kroCs43S2HpwJC456g2KXe7tdDBfca/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=OaqeCpI5/7t8t8Z0xYadewf6C/wHjG7f5CVY1j4m9yU=;
 b=lbj0dBDrsIzAb6Ft1ITE4deGKoz/d0NFbie0q4Nf2JrHcLW3SCu55RRzVJRpc1EW4DcFMpO/7EoG4lIS034QUYGja0G8OR2INYMvfVdy8fWOC74R9B3ybk0MT1lcAl4UCgsAWDzDt5Rq7j863smTYmE/GagU97Fa1V2iEZp1SruqtGwkuc1Itu7pOa7470RFFkZ4W/PjTG9aRYrPvO2eA+QB3JleaVuIK08lzeYKYycrE0RUN869kSVsYcHHyLudwC5bE5pMuG+fILKSybyvAbNua7xu+9riOswz7uydmK9nYUEOTQN3M9gxc0X4X+fhAZLZdnMdxnqnpwSNAI8CXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OaqeCpI5/7t8t8Z0xYadewf6C/wHjG7f5CVY1j4m9yU=;
 b=a/b3X5PmGIaaa2SPOfNiyBNrKiKeJYXTAhB3TBILxg+leDgQWCa8OMXVs43mRTikX5SrJc7ph3z3uUcrxYF+prKp0XWBjm6FSESdWs2cvISYOfLMsNaSzPrF5CvU5iI/ZYw2Eqj7BX1a3CZSSI73We4AX8pTbHig7RWyYh0k4HA=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2757.eurprd04.prod.outlook.com (2603:10a6:4:94::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Tue, 21 Sep
 2021 02:26:05 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53%4]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 02:26:05 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH V4 3/6] remoteproc: imx_rproc: fix TCM io memory type
Thread-Topic: [PATCH V4 3/6] remoteproc: imx_rproc: fix TCM io memory type
Thread-Index: AQHXpiNLpav2TrZrTUyk30ZyQJXlpqutNW4AgACcsaA=
Date:   Tue, 21 Sep 2021 02:26:05 +0000
Message-ID: <DB6PR0402MB27600380CD4EE9B6DC9DCE7D88A19@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20210910090621.3073540-1-peng.fan@oss.nxp.com>
 <20210910090621.3073540-4-peng.fan@oss.nxp.com>
 <20210920165920.GC2023964@p14s>
In-Reply-To: <20210920165920.GC2023964@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd8c1c7e-a5b8-4076-a56d-08d97ca72a1f
x-ms-traffictypediagnostic: DB6PR0402MB2757:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0402MB2757428C49E08B64495E3CCF88A19@DB6PR0402MB2757.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:826;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RkDV8fGrhR+gwjOTereK/6/EmoNwkSz6ZE6eHNyH1f9BB1TK5fW0qlfnLW2ZnkGHxfoc8dnjiekGi/Vnqd86mLBqZTPq0fOQ5cEIdvBbEXy3bXdiaDX2psuUpj9jr9J5/Iz08U+4bIgpb4fl3+BX6JhCjjjbc+9evZz7pPiE1whE8ZkXPOkbQ+N9U6xzO13CadL7sqb9sHoyh+o2Nh7dBbZmUcYKDqEENLdTw6BgQ4p/LGXTyGt41mFyExEZ/oWhOJSnJXerEEfY/SkKqB7a4+tL3QZjnkePgfCXC/fgkbjmwRjiqKJJlaDyKFIixrnctuUuuh+qctK/rrl28k4ZZ8mc0HXSgHuETjkHQfRlORFIf7IzurcJzWTquUjtnGRQweJwsgdg42oqn+mFl8JcHf+8i9QQL+raP6rlF5p2TbHgAJRwBVJoL+oQNsJwMRtUfrFQpqU7dkoyNvwFaDnfpLv1dNdmWt1826GJnd5vHlnn7H+w+/t76PdJ8VoBvLozB8Qj3W57SUZx5fWWecWMGu1dwrAwSc6eGV+nA62GQsdQzumxgEcNiQKUSt+4s2kAaXyvPLwSvU9l5l9C40CQZppfo1KSJHjsxxNhQXfN081/Rq3xuKoHoD2EXTbLRSPm3GV7urzbTcLWiBNyAE5j/1IUQxzJs7XMKN7vubsBV7DX6NdMg+Y5Em9iB1E1BFzV0HuNLLHIliXY/D35IrUwOA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7696005)(76116006)(66476007)(66946007)(44832011)(4326008)(66556008)(86362001)(66446008)(64756008)(6506007)(38070700005)(71200400001)(83380400001)(508600001)(7416002)(55016002)(8676002)(8936002)(9686003)(33656002)(186003)(52536014)(2906002)(5660300002)(26005)(122000001)(38100700002)(110136005)(316002)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0NdC5dQ/qFtrqYWsltTpjAMYBWTDLPaS9F8qAWAaXb0XmOSExsNiGiLu1VOY?=
 =?us-ascii?Q?qT8E3CZsYF0PODZNjaGfs2IqGdqsdlSeUEY1JFXj7ZD43RLgiOeS4/RjukcU?=
 =?us-ascii?Q?zHqzRbg4zcOTsS9wul5WDuzcm4055u6MbGLDUGMMiAF+ZleVxhiH3afmrwXi?=
 =?us-ascii?Q?fgXDmdzq1gTM2keVK/LmOVvRIHEp2PaRSGR0qaSIO4ZWPj71tIzLzlhjCv3p?=
 =?us-ascii?Q?3kEOd8e2knubyPVAbx19b3IpzYwiSluAOZN1Ba1ke2iI39K0mryapIPp1+D9?=
 =?us-ascii?Q?Y1xIItUWlQMCyGbhXGlwdBiL3PxRWitOrKQacUoSBzXa/OllD05gcumhsiIR?=
 =?us-ascii?Q?pnAs6n6VJAiW6DmeATr6QV1Bv8k2Eft8v9sVr7A942Crxsgxv5cYr1dWsRqV?=
 =?us-ascii?Q?f6B83lI+HDG9u80ADzN2QVr1UF/tZrp0JofBB7g79hBznMYKe9cgJu9Tt8P3?=
 =?us-ascii?Q?+QPvJ45JkSPmWPWENsiJ/I5oBLXqX/JrTR6AJmSzCW44zaGAfnrK7vmyFhx+?=
 =?us-ascii?Q?Z/iZp24MHIulSF16xOyFJxWgz7rqGLDuZwj2CFEPJMDg/uDhXh3bZx8NfGzf?=
 =?us-ascii?Q?FbSndHcw96Lii4k+wyuyBi5pVXsDmCs87slBiTgYEd7QMjRaTCwVbtkg0Jco?=
 =?us-ascii?Q?MQHWauq0i2aKbhcRtug5wkaec84HeCe7kHM50qZ7fW3C/zDBPROrYziod2eh?=
 =?us-ascii?Q?5KDqakSiHVHXhjge8Xz168dJYH+dblN1UD/Q/+99sEh18h7lk4+pbbo4KssW?=
 =?us-ascii?Q?/XeE8qgo7Q8qT0Pawkzs0h6+tIvY/1I33hEef01gACL9wqJ+BKPVAC+Yrcfq?=
 =?us-ascii?Q?4sTHpI4Cb784i4qnMmUPvyFMeG1cguY4RhyYCQfW/GgYoBql2HcTRPrAzPc6?=
 =?us-ascii?Q?fW203mcokU46HGXArTDAz4ZQTu0/TG2WxbgC2Si5Qy/3XJf4jrdDVXtP+F/a?=
 =?us-ascii?Q?stez0Bb49yaRX0gPlYsuQNz7d4/q8/fx/FzNoVCyaGcyh+aWaxPZLCQVtU9/?=
 =?us-ascii?Q?jZeSZT1n+7h3B8WS8/5H2hmGq6IZ0/FIKh4B9hkASK7MVT5X72LdRn7n4v6L?=
 =?us-ascii?Q?/NTjF/yRfZEopOQxRmjw0EvwsgYS+N3T00FgyCL5XhpmooYNLaZfff3BcF31?=
 =?us-ascii?Q?qz/Pr7ZF/uPiG67svVTJKrZb4GRMTL1MxHOPWkEQNk+nX6rrJ3b/KZhtDPig?=
 =?us-ascii?Q?NDsrRZ2DrcPrxuHS0R3H2tBPLhu+b80PCqAVDFAbRlm1u6GhQocj1+hYpUCL?=
 =?us-ascii?Q?P68uzuHwwExUqezxwW1DfqHM1FQA8aS5KHN/Dd1CkFKm6vGpOqMrLa4FnrKV?=
 =?us-ascii?Q?I50=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd8c1c7e-a5b8-4076-a56d-08d97ca72a1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2021 02:26:05.6516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UhnVmsL/MLfFjlQ8TDSNwgcLlOaXYkTw+55BspT6qOqdRaLo3HNoLTrKbdQVC1o8fy7a9zIwUsvDxxie1HKLnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2757
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: Re: [PATCH V4 3/6] remoteproc: imx_rproc: fix TCM io memory type
>=20
> On Fri, Sep 10, 2021 at 05:06:18PM +0800, Peng Fan (OSS) wrote:
> > From: Dong Aisheng <aisheng.dong@nxp.com>
> >
> > is_iomem was introduced in the commit 40df0a91b2a5 ("remoteproc: add
> > is_iomem to da_to_va"), but the driver seemed missed to provide the io
> > type correctly.
> > This patch updates remoteproc driver to indicate the TCM on IMX are io
> > memories. Without the change, remoteproc kick will fail.
>=20
> If the kick fails on all these platforms, why was patch 40df0a91b2a5 ever
> submitted at all?  To me this is a serious problem that should have been
> caught before it got sent to the mailing list.

I know any explanation is pale and feeble. It is shame on me that introduce
the issue.

>=20
> I have applied this patch but based on the blatant problems this patchset
> underscores, how can I trust future patches coming from NXP?

There are some differences between NXP 5.10 and upstream remoteproc,
some prerequisites are not ready in upstream, so I move upstream code
to replace NXP 5.10 remoteproc to test in the beginning, there should be
some issues in my test or else. I'll take care in future and build reputati=
on.

Thanks,
Peng.

>=20
> >
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Cc: Peng Fan <peng.fan@nxp.com>
> > Reviewed-and-tested-by: Peng Fan <peng.fan@nxp.com>
> > Fixes: 79806d32d5aa ("remoteproc: imx_rproc: support i.MX8MN/P")
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 35
> > ++++++++++++++++++++--------------
> >  1 file changed, 21 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index d88f76f5305eb..71dcc6dd32e40
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -71,6 +71,7 @@ struct imx_rproc_mem {
> >  /* att flags */
> >  /* M4 own area. Can be mapped at probe */
> >  #define ATT_OWN		BIT(1)
> > +#define ATT_IOMEM	BIT(2)
> >
> >  /* address translation table */
> >  struct imx_rproc_att {
> > @@ -117,7 +118,7 @@ struct imx_rproc {  static const struct
> > imx_rproc_att imx_rproc_att_imx8mn[] =3D {
> >  	/* dev addr , sys addr  , size	    , flags */
> >  	/* ITCM   */
> > -	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN },
> > +	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
> >  	/* OCRAM_S */
> >  	{ 0x00180000, 0x00180000, 0x00009000, 0 },
> >  	/* OCRAM */
> > @@ -131,7 +132,7 @@ static const struct imx_rproc_att
> imx_rproc_att_imx8mn[] =3D {
> >  	/* DDR (Code) - alias */
> >  	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
> >  	/* DTCM */
> > -	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN },
> > +	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },
> >  	/* OCRAM_S - alias */
> >  	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
> >  	/* OCRAM */
> > @@ -147,7 +148,7 @@ static const struct imx_rproc_att
> > imx_rproc_att_imx8mn[] =3D {  static const struct imx_rproc_att
> imx_rproc_att_imx8mq[] =3D {
> >  	/* dev addr , sys addr  , size	    , flags */
> >  	/* TCML - alias */
> > -	{ 0x00000000, 0x007e0000, 0x00020000, 0 },
> > +	{ 0x00000000, 0x007e0000, 0x00020000, ATT_IOMEM},
> >  	/* OCRAM_S */
> >  	{ 0x00180000, 0x00180000, 0x00008000, 0 },
> >  	/* OCRAM */
> > @@ -159,9 +160,9 @@ static const struct imx_rproc_att
> imx_rproc_att_imx8mq[] =3D {
> >  	/* DDR (Code) - alias */
> >  	{ 0x10000000, 0x80000000, 0x0FFE0000, 0 },
> >  	/* TCML */
> > -	{ 0x1FFE0000, 0x007E0000, 0x00020000, ATT_OWN },
> > +	{ 0x1FFE0000, 0x007E0000, 0x00020000, ATT_OWN  | ATT_IOMEM},
> >  	/* TCMU */
> > -	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN },
> > +	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN  | ATT_IOMEM},
> >  	/* OCRAM_S */
> >  	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
> >  	/* OCRAM */
> > @@ -199,12 +200,12 @@ static const struct imx_rproc_att
> imx_rproc_att_imx7d[] =3D {
> >  	/* OCRAM_PXP (Code) - alias */
> >  	{ 0x00940000, 0x00940000, 0x00008000, 0 },
> >  	/* TCML (Code) */
> > -	{ 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN },
> > +	{ 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN | ATT_IOMEM },
> >  	/* DDR (Code) - alias, first part of DDR (Data) */
> >  	{ 0x10000000, 0x80000000, 0x0FFF0000, 0 },
> >
> >  	/* TCMU (Data) */
> > -	{ 0x20000000, 0x00800000, 0x00008000, ATT_OWN },
> > +	{ 0x20000000, 0x00800000, 0x00008000, ATT_OWN | ATT_IOMEM },
> >  	/* OCRAM (Data) */
> >  	{ 0x20200000, 0x00900000, 0x00020000, 0 },
> >  	/* OCRAM_EPDC (Data) */
> > @@ -218,18 +219,18 @@ static const struct imx_rproc_att
> > imx_rproc_att_imx7d[] =3D {  static const struct imx_rproc_att
> imx_rproc_att_imx6sx[] =3D {
> >  	/* dev addr , sys addr  , size	    , flags */
> >  	/* TCML (M4 Boot Code) - alias */
> > -	{ 0x00000000, 0x007F8000, 0x00008000, 0 },
> > +	{ 0x00000000, 0x007F8000, 0x00008000, ATT_IOMEM },
> >  	/* OCRAM_S (Code) */
> >  	{ 0x00180000, 0x008F8000, 0x00004000, 0 },
> >  	/* OCRAM_S (Code) - alias */
> >  	{ 0x00180000, 0x008FC000, 0x00004000, 0 },
> >  	/* TCML (Code) */
> > -	{ 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN },
> > +	{ 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN | ATT_IOMEM },
> >  	/* DDR (Code) - alias, first part of DDR (Data) */
> >  	{ 0x10000000, 0x80000000, 0x0FFF8000, 0 },
> >
> >  	/* TCMU (Data) */
> > -	{ 0x20000000, 0x00800000, 0x00008000, ATT_OWN },
> > +	{ 0x20000000, 0x00800000, 0x00008000, ATT_OWN | ATT_IOMEM },
> >  	/* OCRAM_S (Data) - alias? */
> >  	{ 0x208F8000, 0x008F8000, 0x00004000, 0 },
> >  	/* DDR (Data) */
> > @@ -341,7 +342,7 @@ static int imx_rproc_stop(struct rproc *rproc)  }
> >
> >  static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
> > -			       size_t len, u64 *sys)
> > +			       size_t len, u64 *sys, bool *is_iomem)
> >  {
> >  	const struct imx_rproc_dcfg *dcfg =3D priv->dcfg;
> >  	int i;
> > @@ -354,6 +355,8 @@ static int imx_rproc_da_to_sys(struct imx_rproc
> *priv, u64 da,
> >  			unsigned int offset =3D da - att->da;
> >
> >  			*sys =3D att->sa + offset;
> > +			if (is_iomem)
> > +				*is_iomem =3D att->flags & ATT_IOMEM;
> >  			return 0;
> >  		}
> >  	}
> > @@ -377,7 +380,7 @@ static void *imx_rproc_da_to_va(struct rproc
> *rproc, u64 da, size_t len, bool *i
> >  	 * On device side we have many aliases, so we need to convert device
> >  	 * address (M4) to system bus address first.
> >  	 */
> > -	if (imx_rproc_da_to_sys(priv, da, len, &sys))
> > +	if (imx_rproc_da_to_sys(priv, da, len, &sys, is_iomem))
> >  		return NULL;
> >
> >  	for (i =3D 0; i < IMX_RPROC_MEM_MAX; i++) { @@ -553,8 +556,12 @@
> > static int imx_rproc_addr_init(struct imx_rproc *priv,
> >  		if (b >=3D IMX_RPROC_MEM_MAX)
> >  			break;
> >
> > -		priv->mem[b].cpu_addr =3D devm_ioremap(&pdev->dev,
> > -						     att->sa, att->size);
> > +		if (att->flags & ATT_IOMEM)
> > +			priv->mem[b].cpu_addr =3D devm_ioremap(&pdev->dev,
> > +							     att->sa, att->size);
> > +		else
> > +			priv->mem[b].cpu_addr =3D devm_ioremap_wc(&pdev->dev,
> > +								att->sa, att->size);
> >  		if (!priv->mem[b].cpu_addr) {
> >  			dev_err(dev, "failed to remap %#x bytes from %#x\n", att->size,
> att->sa);
> >  			return -ENOMEM;
> > --
> > 2.25.1
> >
