Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD1BC4320A
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 09:59:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BAD561040
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 09:59:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239975AbhHEJ7R (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 5 Aug 2021 05:59:17 -0400
Received: from mail-eopbgr50054.outbound.protection.outlook.com ([40.107.5.54]:38070
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239957AbhHEJ7Q (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Aug 2021 05:59:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibdmxVOMWp0DNsZUy/O8E4CCG2300wMfkuU5IVCjHvVY8a7I+g4G1tIvMuj3VW1/8NA2dqKf9Ntys9aNO060DScuPNj46I6ijOgQduHv3cc6NMFIud/J3e2sHwGvzHpOlXzg1rVeW8IFJoxCGem/ljaQMkLVTJGeCaTnkbSUTd6o4Gw1H3WSWYkk9gl3Dta1cU/UGOi8QNO/6SkOOphXO77SDpOB+fzY3z9/QOE1oKVUbNPfbwEHdJjOUy9sC1lVzd4Sqru42GVDpComT8l/EyZnYT/yDrXh5r+kKuTZkbAMkp3hx/2v4YU7CCw+5Pdqz2I7440334k7mEALvp6i4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRAEVJ3tuFGrCJGP0GcA8OV0rOWjVt6b3rax2ivYUOQ=;
 b=GGzaUKPoNZrS17Xlo2545RRGRS4iUQ+zRfh0UR3GNJ30xvtkSib2I9xyX8B6Rfp+IbqgsKMITbN8RHo1eDvcTFQ2/uiWhBlcFh+FEJNrOWFnkg8Mp35+X/hZEZGEqPctCQHe0VprCy8fYUo6IRfc5wnbCAhuk72uViSWUhtVTs/alUkomkgsB/DUf9Mq6fvD/X34E28IFhvk+8GBuHvlThS1oXx7MLklo9BuQBvaFKQMW/+NkKWegbfUtzXPzV9Tp26yjwBiraGIm428SYzvxi7TNK+X/KwZHgL9lEkVOcboUm+ZRPk/J1+VVFTScFqhkyvxlVqSSIufdd2I5FjUvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRAEVJ3tuFGrCJGP0GcA8OV0rOWjVt6b3rax2ivYUOQ=;
 b=mmPZaPt97F/1nmGm9GmDJHC29Ho9TpDWWZCCpOKho8r5+4XPVSCpQBwpCtBhc+I1XRGIbFQvsb/ysKXNkBBJZbI+8++KjoQBhtmORgkKlqxFnEt15reXOtKSUR7nYw3UtCGiUCZAJT7IJdIPwactLCwDbHKwIYsASj/aQP5P06I=
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 (2603:10a6:203:99::22) by AS8PR04MB7592.eurprd04.prod.outlook.com
 (2603:10a6:20b:23f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.19; Thu, 5 Aug
 2021 09:59:00 +0000
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::3839:217:6252:b1f8]) by AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::3839:217:6252:b1f8%11]) with mapi id 15.20.4373.026; Thu, 5 Aug 2021
 09:59:00 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "dongas86@gmail.com" <dongas86@gmail.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "cleger@kalray.eu" <cleger@kalray.eu>
Subject: RE: [PATCH v3 2/5] remoteproc: imx_rproc: fix TCM io memory type
Thread-Topic: [PATCH v3 2/5] remoteproc: imx_rproc: fix TCM io memory type
Thread-Index: AQHXiaqXbUQvoi0tHUuPW0HH1jFNYKtkrZhw
Date:   Thu, 5 Aug 2021 09:59:00 +0000
Message-ID: <AM5PR0402MB2756DE75C3231A0A15F7742788F29@AM5PR0402MB2756.eurprd04.prod.outlook.com>
References: <20210805033206.1295269-1-aisheng.dong@nxp.com>
 <20210805033206.1295269-2-aisheng.dong@nxp.com>
In-Reply-To: <20210805033206.1295269-2-aisheng.dong@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e4308d4b-ca25-4921-d2ea-08d957f7a65f
x-ms-traffictypediagnostic: AS8PR04MB7592:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AS8PR04MB7592F2321EDB66E42DD7695E88F29@AS8PR04MB7592.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:469;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SFc6xuQeDyll0FcWGmEZYm/LYP6kgqAbC4O2Lz+FkE3YW/kN3t0TGu1hu+ufoPyhngtomE8NdPC7Wmulwbh2IUlV21lY4o7xqtQbut7vMJS/GwT4GI7HEvqz+RF04Z12nVjwVVjfY4uy/ctKf5p/ZBAsJiBD/QATAAObkvknwht5dbRq6+9sr81XfEYfbD7BQBh6y/2SFuW0zx3rHwPxP43c+PLUtnm1Zcxyz2AFf+IwqnWz9nS7MkdZ8/gxpaHuLVoHIBK/IwO4bepKvHMCczVbg621bBfB+3ottT6Kjiemf4fDA9/uLlTlud0JHmOE8nsYcC5xrZOhr8bmzISkgXbgoMPJ/3GIce165/AUUHDfTG70UkGYq9bEiJfUceovc0Xg1OR/lqx9aSpgdrtcHuh+h+L6O36ynH8joH8GHkaKvOaiutxf8Sm5SYfQxdkk4BPq30Z6DSta7N+08KBQS51XBk8iFl6E/KEwgFCksEAzlHPQQgUOgckaSwXLRv5fz1WtJVqLWWjdNqEembM3SISNmTRH3Vw1UiscW+PbxoVR1fi2b/13Frf4CRbuLo3lnCk40bAYS3LJvT2mpIWTPiqCxhtgz8N6OhHtUQp6SOXZFX7O/8aQbt/8tS7PKxh5EVQlT+UhqT+Omvbq9arCxB8gvZIclYCcc2iNWQuQfI1gJyX+TVNpLVlXYkTy6yZ4RgnD8sDr/e/v4OljxaNuUg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0402MB2756.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(122000001)(55016002)(7696005)(5660300002)(8936002)(52536014)(71200400001)(478600001)(9686003)(38070700005)(38100700002)(6506007)(86362001)(26005)(186003)(54906003)(83380400001)(110136005)(4326008)(44832011)(66556008)(316002)(8676002)(66446008)(66476007)(2906002)(66946007)(33656002)(76116006)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?u3jANDFV7KCM5XUDx9B2WSDoDciQSBNKqxTugh1VigA07GCbUmBNmUHg0Ngf?=
 =?us-ascii?Q?n4xxG7nhlAGAW6Sr1DI5NoI4P+aREEyh9rqnw9fQaa23Tem3Iq6l6MmD3d3V?=
 =?us-ascii?Q?5Y7eRvAKmYsuMimsBvpgvoARlxXnk42QgkOvbfYOgaslFmarfRSpvIGuO69R?=
 =?us-ascii?Q?LDvswbWh1ooCbmVoBKcgyDeEoGX1BPnqzBV3m5nx++NmhiFrL+NNbe1uwMJJ?=
 =?us-ascii?Q?dX6wfvwM8618VOgUdp7GSwx6HAI9BsFhNuvggwVx6Nz7ynHHMl5CLQ8w0XN7?=
 =?us-ascii?Q?EuJwPHgPOnA/d+wuNQqDvxwDwC80TKIhVXjuwXlX98pJ+0fQ084aauGDAzcd?=
 =?us-ascii?Q?Uj8gOPb07okvhDJaH3BLggiW9PfvY3lI8IEa7W0h9E1c/vlp+ltveTNPMqik?=
 =?us-ascii?Q?NCpqJriyirRr7dIcdW41DDoFFaRdCT6saTzo2LBga5tKiHTzHzRPyj+ze4Jp?=
 =?us-ascii?Q?iewVPDyvqsgKjrdckl5+4Dg9KBCpeo3yY9P0joPsjwHxdup+Vx7YmISUAqCy?=
 =?us-ascii?Q?b+E8GeXhknWMfltqMVb6dSkdH3p/nskSxG0J1xBi7QcOQtTTBnLe2cYs1z2D?=
 =?us-ascii?Q?wg8yHlOmapDStN7zGiIszMQbaJbwj3sqVp8Qpoe5K41Q5gBCmVFgqwnU1sEw?=
 =?us-ascii?Q?NtBw8//XYxeDaHDIKO2YmcveycKFkq2Ns6fkLrXOTFSCKWLq47npnpaQbMvk?=
 =?us-ascii?Q?6Aje57hE3yjvxXzcqG6kOW1NQY9TihfFEZl0g2DvYzEFUVZZlHlNDNInB573?=
 =?us-ascii?Q?yHgk5q4l3YHHOK1hGY3o/CMgSOHD5LU5+sUjj28M1Uy52EvCEjStMhL/d5na?=
 =?us-ascii?Q?q11xYrGMTV+C29wJCMYJU7lG1vQmKgvnZBC7EaRfziuCyy5Lcd+2vLAjAK+2?=
 =?us-ascii?Q?8uoRG1HfUMxIogEWqekHiAdvpA/b+CRztlPL/4mxYIbqtHMoKed13+bzAYNi?=
 =?us-ascii?Q?8fHVo2IXcfThfXlKdGVgIcwUsMMtcynugVHv4gmossW+EdGp+Ktq3yR2FmdQ?=
 =?us-ascii?Q?eFs8OGMaaEpGh6jEdEITdfgrpDeAsBgIq68zSqfkDS8Rv9czXlvsmRqYq5iM?=
 =?us-ascii?Q?wWpzrqN2zGJ2CVjVTPMNijHIAGxwv39qwtF+mGm0zcE6iEBqRTj+zOoETVxg?=
 =?us-ascii?Q?wtHsK7k4afP6re6Gf7PUNOFOFho+xHjQ5C6WGlqEyahPAeJ8DUbp2E9K/U6+?=
 =?us-ascii?Q?lJaMzGLw2BT2MLSAnYGQpbJhtuAyArIaHG3p3u9cQZH1RvTUR/6nGfCbk/ls?=
 =?us-ascii?Q?UP8r03ILO1hilKcIwVxmH4SyVy3cQUlKZMlhJz2D/GqF7/uWnuytmVOKvi3K?=
 =?us-ascii?Q?RgcB7b+kEuM62rxnEvWct/fm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0402MB2756.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4308d4b-ca25-4921-d2ea-08d957f7a65f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2021 09:59:00.8852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D31ZUAKOQVCnDkhNsXRo0pC9K+kCWmk9fEBlqM4wuUdAWcHreW9WPQ26VCXXg6lo71kFFYhIA8y9G1RP8CPV8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7592
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: [PATCH v3 2/5] remoteproc: imx_rproc: fix TCM io memory type
>=20
> is_iomem was introduced in the commit 40df0a91b2a5 ("remoteproc: add
> is_iomem to da_to_va"), but the driver seemed missed to provide the io ty=
pe
> correctly.
> This patch updates remoteproc driver to indicate the TCM on IMX are io
> memories. Without the change, remoteproc kick will fail.
>=20
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Peng Fan <peng.fan@nxp.com>
> Fixes: 79806d32d5aa ("remoteproc: imx_rproc: support i.MX8MN/P")
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Tested-by: Peng Fan <peng.fan@nxp.com>

> ---
> ChangeLog:
> v2->v3:
>  * fix commit message typo and drop imx8ulp fixes tag
>    Patch content unchanged.
> v1->v2:
>  * using ioremap_wc for non TCM memory
> ---
>  drivers/remoteproc/imx_rproc.c | 35 ++++++++++++++++++++--------------
>  1 file changed, 21 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/remoteproc/imx_rproc.c
> b/drivers/remoteproc/imx_rproc.c index d88f76f5305e..71dcc6dd32e4
> 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -71,6 +71,7 @@ struct imx_rproc_mem {
>  /* att flags */
>  /* M4 own area. Can be mapped at probe */
>  #define ATT_OWN		BIT(1)
> +#define ATT_IOMEM	BIT(2)
>=20
>  /* address translation table */
>  struct imx_rproc_att {
> @@ -117,7 +118,7 @@ struct imx_rproc {
>  static const struct imx_rproc_att imx_rproc_att_imx8mn[] =3D {
>  	/* dev addr , sys addr  , size	    , flags */
>  	/* ITCM   */
> -	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN },
> +	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
>  	/* OCRAM_S */
>  	{ 0x00180000, 0x00180000, 0x00009000, 0 },
>  	/* OCRAM */
> @@ -131,7 +132,7 @@ static const struct imx_rproc_att
> imx_rproc_att_imx8mn[] =3D {
>  	/* DDR (Code) - alias */
>  	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
>  	/* DTCM */
> -	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN },
> +	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },
>  	/* OCRAM_S - alias */
>  	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
>  	/* OCRAM */
> @@ -147,7 +148,7 @@ static const struct imx_rproc_att
> imx_rproc_att_imx8mn[] =3D {  static const struct imx_rproc_att
> imx_rproc_att_imx8mq[] =3D {
>  	/* dev addr , sys addr  , size	    , flags */
>  	/* TCML - alias */
> -	{ 0x00000000, 0x007e0000, 0x00020000, 0 },
> +	{ 0x00000000, 0x007e0000, 0x00020000, ATT_IOMEM},
>  	/* OCRAM_S */
>  	{ 0x00180000, 0x00180000, 0x00008000, 0 },
>  	/* OCRAM */
> @@ -159,9 +160,9 @@ static const struct imx_rproc_att
> imx_rproc_att_imx8mq[] =3D {
>  	/* DDR (Code) - alias */
>  	{ 0x10000000, 0x80000000, 0x0FFE0000, 0 },
>  	/* TCML */
> -	{ 0x1FFE0000, 0x007E0000, 0x00020000, ATT_OWN },
> +	{ 0x1FFE0000, 0x007E0000, 0x00020000, ATT_OWN  | ATT_IOMEM},
>  	/* TCMU */
> -	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN },
> +	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN  | ATT_IOMEM},
>  	/* OCRAM_S */
>  	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
>  	/* OCRAM */
> @@ -199,12 +200,12 @@ static const struct imx_rproc_att
> imx_rproc_att_imx7d[] =3D {
>  	/* OCRAM_PXP (Code) - alias */
>  	{ 0x00940000, 0x00940000, 0x00008000, 0 },
>  	/* TCML (Code) */
> -	{ 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN },
> +	{ 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN | ATT_IOMEM },
>  	/* DDR (Code) - alias, first part of DDR (Data) */
>  	{ 0x10000000, 0x80000000, 0x0FFF0000, 0 },
>=20
>  	/* TCMU (Data) */
> -	{ 0x20000000, 0x00800000, 0x00008000, ATT_OWN },
> +	{ 0x20000000, 0x00800000, 0x00008000, ATT_OWN | ATT_IOMEM },
>  	/* OCRAM (Data) */
>  	{ 0x20200000, 0x00900000, 0x00020000, 0 },
>  	/* OCRAM_EPDC (Data) */
> @@ -218,18 +219,18 @@ static const struct imx_rproc_att
> imx_rproc_att_imx7d[] =3D {  static const struct imx_rproc_att
> imx_rproc_att_imx6sx[] =3D {
>  	/* dev addr , sys addr  , size	    , flags */
>  	/* TCML (M4 Boot Code) - alias */
> -	{ 0x00000000, 0x007F8000, 0x00008000, 0 },
> +	{ 0x00000000, 0x007F8000, 0x00008000, ATT_IOMEM },
>  	/* OCRAM_S (Code) */
>  	{ 0x00180000, 0x008F8000, 0x00004000, 0 },
>  	/* OCRAM_S (Code) - alias */
>  	{ 0x00180000, 0x008FC000, 0x00004000, 0 },
>  	/* TCML (Code) */
> -	{ 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN },
> +	{ 0x1FFF8000, 0x007F8000, 0x00008000, ATT_OWN | ATT_IOMEM },
>  	/* DDR (Code) - alias, first part of DDR (Data) */
>  	{ 0x10000000, 0x80000000, 0x0FFF8000, 0 },
>=20
>  	/* TCMU (Data) */
> -	{ 0x20000000, 0x00800000, 0x00008000, ATT_OWN },
> +	{ 0x20000000, 0x00800000, 0x00008000, ATT_OWN | ATT_IOMEM },
>  	/* OCRAM_S (Data) - alias? */
>  	{ 0x208F8000, 0x008F8000, 0x00004000, 0 },
>  	/* DDR (Data) */
> @@ -341,7 +342,7 @@ static int imx_rproc_stop(struct rproc *rproc)  }
>=20
>  static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
> -			       size_t len, u64 *sys)
> +			       size_t len, u64 *sys, bool *is_iomem)
>  {
>  	const struct imx_rproc_dcfg *dcfg =3D priv->dcfg;
>  	int i;
> @@ -354,6 +355,8 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv=
,
> u64 da,
>  			unsigned int offset =3D da - att->da;
>=20
>  			*sys =3D att->sa + offset;
> +			if (is_iomem)
> +				*is_iomem =3D att->flags & ATT_IOMEM;
>  			return 0;
>  		}
>  	}
> @@ -377,7 +380,7 @@ static void *imx_rproc_da_to_va(struct rproc *rproc,
> u64 da, size_t len, bool *i
>  	 * On device side we have many aliases, so we need to convert device
>  	 * address (M4) to system bus address first.
>  	 */
> -	if (imx_rproc_da_to_sys(priv, da, len, &sys))
> +	if (imx_rproc_da_to_sys(priv, da, len, &sys, is_iomem))
>  		return NULL;
>=20
>  	for (i =3D 0; i < IMX_RPROC_MEM_MAX; i++) { @@ -553,8 +556,12 @@
> static int imx_rproc_addr_init(struct imx_rproc *priv,
>  		if (b >=3D IMX_RPROC_MEM_MAX)
>  			break;
>=20
> -		priv->mem[b].cpu_addr =3D devm_ioremap(&pdev->dev,
> -						     att->sa, att->size);
> +		if (att->flags & ATT_IOMEM)
> +			priv->mem[b].cpu_addr =3D devm_ioremap(&pdev->dev,
> +							     att->sa, att->size);
> +		else
> +			priv->mem[b].cpu_addr =3D devm_ioremap_wc(&pdev->dev,
> +								att->sa, att->size);
>  		if (!priv->mem[b].cpu_addr) {
>  			dev_err(dev, "failed to remap %#x bytes from %#x\n", att->size,
> att->sa);
>  			return -ENOMEM;
> --
> 2.25.1

