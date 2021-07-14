Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D34BC07E95
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Jul 2021 01:12:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61D7B61374
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Jul 2021 01:12:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237275AbhGNBPJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 13 Jul 2021 21:15:09 -0400
Received: from mail-vi1eur05on2050.outbound.protection.outlook.com ([40.107.21.50]:1907
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237198AbhGNBPJ (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 13 Jul 2021 21:15:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eu/bXrid03p2baqVJQLXxHgA6rIfLAT1fTxmtChi3aWZNvnGGVeOYKnzOUCnqp+h8+kuSB7mH6lcw8dQbX7KJTsKpYnDnAuRnUjvMYyA36f5ALZ/R4gPJ3HVplMjzPVZ2adxVgqHxXj0Xju3qwNOZrDK7tGSNhzHEqdu/MYEK626JZStxetQEYZQpJ+DGfDhHw2H2t/SVub4crEF6YiTc+wfddpH5D3moFtv37gi3Rh6HW0bvhsa34iPMfEHPYyrdD8V/FbullLDHo4vxrO3QGyOFt+ic9vTxZOxmDt+YiNWQ5G5zA/oDTcWg5o7cU5/hv96YOKf+bhjEPFYwYhJAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyg8My9ADwBGpdj9kKAi3cGEcP1mPkctuLrBWwuUyhA=;
 b=bZqNrXm/GDMwJtd4PDfaot6ZiPbMRPFJ/i1kbq0AUu529GhafO6RFFWfiWmmOLG65IF8eJ/P68nzCafcBTfM4u6EgK4IMpAkfCRoGXWkJEIwR2uVJZOL8eQnLgioUX7ykFH84hDwo1MRvRM7DInIxsqKD4NZXltkFYm4vuSpgflu/YdrfUNwtn/wvJRAYdrW/7O6I3AXHwhalzJsiEpu/e8y9F9r6Rs0oiT8e/fe0jpkqGNZUOM3yVw0WTYWk4v6RHHarsUAWahGJVIQcN6Yq2WGbTRvi8K3olrn2fAm9jqbBsOCEAwg/PBT79SruEeHVlxxmvzKCQNIG6VcwrciVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyg8My9ADwBGpdj9kKAi3cGEcP1mPkctuLrBWwuUyhA=;
 b=Dwl8THZPALTmLG/P+oHC1Wtyf0/DuYZ5Hu9daL1Al/V20wdmGiTrU22l8pfeUfQjMgOE2w/FNkwTxodpUn79b4swUz5hURSWYjA5Yrh4ITwpzTDZ9mfAroFTttMCLZgnJLxMTbZgQeayZ201gO8UG5qWgw2HRAfYAFerFmlj1vM=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB5660.eurprd04.prod.outlook.com (2603:10a6:10:a5::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Wed, 14 Jul
 2021 01:12:16 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd%9]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 01:12:16 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "dongas86@gmail.com" <dongas86@gmail.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>
Subject: RE: [PATCH V2 2/5] remoteproc: imx_rproc: fix TCM io memory type
Thread-Topic: [PATCH V2 2/5] remoteproc: imx_rproc: fix TCM io memory type
Thread-Index: AQHXcxREqgBl0IqrBkWGBgpwMzgbWKtBsfKQ
Date:   Wed, 14 Jul 2021 01:12:16 +0000
Message-ID: <DB6PR0402MB27600B2B114AC2FBE6E05EBF88139@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20210707094033.1959752-1-aisheng.dong@nxp.com>
 <20210707094033.1959752-2-aisheng.dong@nxp.com>
In-Reply-To: <20210707094033.1959752-2-aisheng.dong@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef589b6b-86c2-40b9-c905-08d946646b69
x-ms-traffictypediagnostic: DB8PR04MB5660:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB5660FEE2081663DCD65C9FF088139@DB8PR04MB5660.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f3QOp9SiIjk5ua65GQdx0Z3+R/UOsdkkNo+SxudnNjjYm7KHrvVDcbYuGoOzO61AU7BV5LK9wm/3un3cpITZz7ylkjFAZMh6tOLhXstI4SRNMXMyCytmXsd1oaulU/BuXpFSJxUMaUokRCFvoW7MuO4X7Es+XkMXdUpa7p3wwmEw6E/5GhX5Mf8FXRxsplVBuAlmReD+S+U3UWxjpKDUNicssppAaLHH20cK+J+TfTKvHVGrz793KRIyET2uoUk6123VX46bKmg4QqMRMuGczUZU3Ugv1pOkBBLG4BWzHnGmomPT3Og1LmPt6e7Z9hSOTLxx+CxLtwWfsGfsfB6g7+CEdKR+wUje4Kc1NvOb9lckTVZqRKl40N/mbrlktBvuIzsbppWj/Nmt4yoJaUmUj6/mhuiaABoYemQQnRPhwYDrVzvIm4jvM/tmkqt/C7NQ4NHnPJazPSZK9fyGMjNLH7eFH+lXys8r2PuwsaBI4mklRuqv9fwm2IPtvJY8+IsDgiDoPPmWtUXuec14oZn2xvRxa/CgI+RGtUON1ojgGIA9/yAotZCBlC7BLRg5aYgGaSEPJ41PHh1DigszGQ0Lk3dwQOtYcm2QlbpsXGYg2QNaT9kB9hKyNAUMHKzJ8YygZYwactO0WYZmDMjjZ9HKwNVPeVNiMA2WaODn7FLfADNytvSB2sU5yxLeq5YhDvHB8xB1ryyKa2JZxj2EcIxgKA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(346002)(376002)(366004)(2906002)(33656002)(4326008)(110136005)(86362001)(54906003)(64756008)(55016002)(38100700002)(9686003)(83380400001)(8936002)(8676002)(71200400001)(66556008)(66446008)(26005)(52536014)(5660300002)(66476007)(66946007)(186003)(6506007)(122000001)(7696005)(44832011)(316002)(478600001)(76116006)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iU+omyMhhGYfVo5XZn8wAAVRww05/zwwsRG9PtMUHLjawtxPjn78oFv2Z7iZ?=
 =?us-ascii?Q?YH6AYiKcbLddbUr4xNu2Xs710X9hg+V/ggsXWsHwGC0RE2s8I1A/yLiVwmkl?=
 =?us-ascii?Q?D+fgsjjXTZtrl1ZS7ovgxslS45TcmyxZQ8UdfxcdqCUE81e4IXM6Ht21dmS9?=
 =?us-ascii?Q?URLvg7qwxEs2Cs3ArF2X5G8qiRKWxpUP50R4z3Zz36dIgWk2mAajaeU+WCi8?=
 =?us-ascii?Q?Gbj2/eZpW+Y0UT4S/r9ksOpPsA9Ri+sD+GVFulfPfLd8ourzseoxLiCqgclw?=
 =?us-ascii?Q?R36yyJYqjsP7w+/MdWfajkgrDequy8X/3+NsMvRBxDlQ6SCi0+s6X3DP2beb?=
 =?us-ascii?Q?rlpk/sLyVONgbz7nrVRm2hi7pnjRIwRxoE3ufiTkrV0y7wb4Owut/73nGStk?=
 =?us-ascii?Q?WkJLZlWqmPbtFpHhDVlgZU91KqQ1jcg3AvSpcRCIpZgnYRG4c9ealbQWKYRd?=
 =?us-ascii?Q?+7ur/0bX6NfBRiEMkxvxZ+PU6pBbZOtavopFCcRGrJzlcAzaKKOIUwn+QT/y?=
 =?us-ascii?Q?M12ZNPqMOkbh9hSgiqpLNjaVHubQSrGbuTrjzkizlUTgb+lFt0ZzNj76sW7X?=
 =?us-ascii?Q?qaGHBN4Ut+QHZramVnj3Bx0IyXE4GSgpHT6n4UYCepiCeUIPMTyFkhKfMXCk?=
 =?us-ascii?Q?gWjQMCmQUeDopk2NEGYwFK/mISGVzDhU4sxBNaC0Etm6/WLG+lseyd1Cm7W2?=
 =?us-ascii?Q?0Ay8NC/fD7OaJv4JatltiOt+aAbvvGrcOdi97fM3tQ05Nvy1WltLXDijZ+jz?=
 =?us-ascii?Q?B4aE4KtBibkFj1f+I3Y2Ub5E45iHlmLFedBSPHsqv1sGKlUTojP/JBFTYmE3?=
 =?us-ascii?Q?9FDHajwgp9E/4GKt7n0aZcUxkOo+mxb9uai04WkmInhorrywrvQhr87NJ2Uj?=
 =?us-ascii?Q?kPPSeYKsHOF/O9hOAdzHajptpQPkmkd8eKvJ5UzN/2hGnhWXWTDu9ZKT7dOZ?=
 =?us-ascii?Q?5S5eFLVW/1pHczvjlvzYGgbdHzq2VLOxx/GQl5SR1WFNw2Yk8+cRebp6NkkE?=
 =?us-ascii?Q?vUo6z5Wp5mt9WKuheS+sCwRFdh6kAJ0H+Qcs+Bc/KWirZMFnpkuX5YPmafDj?=
 =?us-ascii?Q?FBmbm7baw3dYzLsDU1mJz44qw2fUZ6wQPEBPR9zpNrzvkgVHq+GpihbHTxHf?=
 =?us-ascii?Q?ccLekwIDAlJD12sJ6+8AgZmd8NL1WGuQX9Ns1p0M8d6BWjBf5QtqofBot158?=
 =?us-ascii?Q?ugjRv7aqKMTwVY7Hx3UUknvbONhNlRjAruJTYp/Ly7CCrjnxdHVoWOke2Ev7?=
 =?us-ascii?Q?2w+toR6cGvxVrLGfPCZUF2hJAqvlt1CnmTNXx2bUGXpTA3HRaWu9rAdKacTr?=
 =?us-ascii?Q?ImVGcRkq0umxbTRj+BsKUFPB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef589b6b-86c2-40b9-c905-08d946646b69
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2021 01:12:16.1335
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JB2nBb6ErqegJtzEc6EGViSpaCnGKUk28CvtZXGACL5VUCH/74v082zMlacyX12aML+CS/d30azmX1Y4CEs1ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5660
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: [PATCH V2 2/5] remoteproc: imx_rproc: fix TCM io memory type
>=20
> is_iomem was introduced in the commit 40df0a91b2a5 ("remoteproc: add
> is_iomem to da_to_va"), but the driver seemed missed to provide the io ty=
pe

missed->missing

> correctly.
> This patch updates remoteproc driver to indicate the TCM on IMX are io
> memories. Without the change, remoteroc kick will fail.

remoteroc->remoteproc

>=20
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Peng Fan <peng.fan@nxp.com>
> Fixes: d59eedc0e408 ("remoteproc: imx_rproc: support i.MX8ULP")

Drop this fix. 8ULP only support ROM loaded M33 images, no
chance to let Kernel load M33 image.

> Fixes: 79806d32d5aa ("remoteproc: imx_rproc: support i.MX8MN/P")
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> ChangeLog:
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


Besides the upper comments, looks ok to me.
Reviewed-by: Peng Fan <peng.fan@nxp.com>

> --
> 2.25.1

