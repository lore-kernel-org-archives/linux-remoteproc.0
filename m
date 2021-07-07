Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C904C07E96
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 02:20:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FEB561C88
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 02:20:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbhGGCXT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Jul 2021 22:23:19 -0400
Received: from mail-eopbgr00045.outbound.protection.outlook.com ([40.107.0.45]:34273
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229873AbhGGCXT (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Jul 2021 22:23:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b26ThJuqW9NzLw0OfurovnVBgxHfO1YwdwHWQ55guypIVtDqhLQ/o2quhIgqSJ/5gH0B78SfpL55b1hcZtxWDuopt2Ts3i9ar5A48gL3ltCltFL+8Lhbwx4OGyzZzN4X3Mj/m2D9oiqGw/XP7CT7H/5WvIwy7hfPyg6zxJItTHzX+7wywzYIxZK7kyIciRqMOVmIaDvAMM5ljpplvwxlq7TBWXJd+X3XAGFENNusmav4Qvh34chSFb7fbbDN5t04dAnwhVIildS+5BdWH+rkd/MoFDAzgZIgtQsNU73K/gZioFw5QH5T8xv2iyMedDeUDRKhWhmczskXmj468qlUgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3CfQ9iBVbLKZHG0TaYSclI3wdtc+VDrpFcyhU4OGM8=;
 b=gXzehTePmJ9YXydCsjgfPpOUtSY7bKdtXz8hf16TMSOVNrIltM5vDVWqt1o7RCWrjQGajuGWNwo2efdcSBZD/SK6pvmKgohdYY3P7y/7S2+uIfBtBbEIAHCGhxkiBe+0hBQ2yTdfwmzJvNOEB1Opoz8ApRjJCpey1KtvGd40mV2Y0ieMt1XpvReLk2nptMu+ERJWuZO5sNiR+OxK9j+biSMuKnWVtQkSUmuHH8f1iP0C0KKqT5icvqKZf9+eNGtonZxfq8nnV8PKXi/WLThTdO6UvbSuG/5aA7FR7BlDBBWNxZlRKr9KTsWZkqV4C3+MntlOMHfPUcn5SNsw+gaddw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3CfQ9iBVbLKZHG0TaYSclI3wdtc+VDrpFcyhU4OGM8=;
 b=SykFpLf303JEzSYcdJfvkyhnJhcy1jSMUKF97EFljHJw4ZlTMouLsakvi0eRN/RCpFDYRb4CY+vrMVZiJKSZDb051IN9Fk/r9aJDc+YTELNoLMyjixAFZqzTklFYCyrhtnUBjLJKdniuxKYEY/FS3BD56MLOfoXccvav8PgQwYY=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4633.eurprd04.prod.outlook.com (2603:10a6:5:36::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Wed, 7 Jul
 2021 02:20:38 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd%9]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 02:20:38 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "dongas86@gmail.com" <dongas86@gmail.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>
Subject: RE: [PATCH 2/4] remoteproc: imx_rproc: fix TCM io memory type
Thread-Topic: [PATCH 2/4] remoteproc: imx_rproc: fix TCM io memory type
Thread-Index: AQHXcnKoD7Gz6S9cekGMd52dGfkLhqs2xyyA
Date:   Wed, 7 Jul 2021 02:20:37 +0000
Message-ID: <DB6PR0402MB2760779960CBC749DAEA6975881A9@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20210706142335.952858-1-aisheng.dong@nxp.com>
 <20210706142335.952858-2-aisheng.dong@nxp.com>
In-Reply-To: <20210706142335.952858-2-aisheng.dong@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8fc0cdc0-55fb-49a9-05c7-08d940edcf66
x-ms-traffictypediagnostic: DB7PR04MB4633:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB4633B1740F07BF6D1D06FAA4881A9@DB7PR04MB4633.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c+m40puCQOSciz7x2GULjzl62qvOHOYU76IkilyvAfLr/+81Bjry2fM5zeU/FRAbbL7xt33FUfp/0XijhO0WrRq1Ao6pY0yqiTnMjkz2efC2fqCFDY77iUzitCwg9ntDPdyPJuMyCv7ppcEf6kFeW3TjBVeGzDfz1drgKYkj6FTwRFbeT0hLQ0MySlTKcYs1r9KnhegDg9TfqDAmu6g+gb+Wqj4f3xg/PacFr5Zie6mwVmTEUnFxcycHw1cOnOO4+NxMWDay1tWMKnvBD/Ao8WrdOWWlhcpeCEOewTbyKmuE6v49JjDHwvMcHXOYcbh4pRueqlAtBRCPpx50IirwGZdgSeQ3kWnj6jevrgasglxzbMxGIZJLKr7AM5hp4XFpcSCum3N7bu6+sawiXG7FmxFbz0z6TyFi0QahWEbMiBpWgXEWrHf9rj7iXq9w+vGcWc6RHYboU0hFcmKqTVpgm3AXD9+NOxSFlFMzbVeiIPNYXAlKn5gJoDtLpDzfX0wftgAg/HUVP5TvqP1jGWO2lVIQlhOo7J5YGDAzj/QNnY96LkSWGYCALdlP/ZZv5rn6t/PyAm8lAw6QRQOLve6gw5KmX+yWUYQHGwd0hUPf89gXRctCTpsp8l9wi6cqKEivcyHsDiz5Jes0APYNP84Hww==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(52536014)(5660300002)(110136005)(478600001)(64756008)(6506007)(66556008)(316002)(8936002)(9686003)(55016002)(186003)(54906003)(44832011)(66446008)(2906002)(76116006)(33656002)(66476007)(4326008)(71200400001)(7696005)(38100700002)(66946007)(26005)(122000001)(8676002)(86362001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dcK9mgoITUFLojGASOyoPsyydCTU7slyMdImGn6aUYG1Ev9MDWM56UnmzdE0?=
 =?us-ascii?Q?lShNM1Gz+UN4kSGoIzchhb5cU7pRE0aLQpWr9WrPMQ6pbWuGiHxWRrmdGfvL?=
 =?us-ascii?Q?5/d5aDr/4fFp4zagrXLz2umMoZzxjGf0vB/Ubs6t4A8c5ZG0RH0QPBr1vXx0?=
 =?us-ascii?Q?msNYcLREkAcKpXj+0Q2VuKvBDLySmfZIAwocFmTN0GnlK/M0zGQ3IX8JoB41?=
 =?us-ascii?Q?J+PvjfiA5PZsbmWyu/MFbWCgP49pgPefvCKWLfKxVpc9nr6vFcK7toyfo85n?=
 =?us-ascii?Q?Bqpg7sWRcMZSi2a/CQG0CSOQAK4cVC5KlQdxvHbZfd/8MXbXWogirhZlcA3I?=
 =?us-ascii?Q?BFo8+UlIzt33KZs2EuQ+vBE2TnzpWugRnR+3LM0krp/RQjsRJtRN0ov9mc3o?=
 =?us-ascii?Q?kzyLpTTIvC26wYSZ00T4UYke3bYTjhb3a2sKm7dl1/gEMe4TwgnO3I40SLaB?=
 =?us-ascii?Q?iIkH3WQqUCUb9YQuwEwJw9Y4GtjiJYLK+DKOjsgcenm/DbLQjw57GHVQ4UIj?=
 =?us-ascii?Q?z8S6wfvQxpgII8DH+MqqlfgPGcdNLCqZ25zFINW51iodKsCu16Me1Mhg/UeA?=
 =?us-ascii?Q?Q3+oJ0AHoQigtemj5GqiT7wY0x2bsAU7mE+VctUxz+ByLZwolTKtqlpPRrpK?=
 =?us-ascii?Q?ED7NvLEELsCpenK9LFdAf/ahcU/kly0pZxFobEIr9dat4/11HmGalJejYS1A?=
 =?us-ascii?Q?s4w/KpMyx6exF8YhChLSkfUsVWIawGreQpoF23LLRi7myHJ0Ri9A2/T5LM5G?=
 =?us-ascii?Q?SuU5VGDJKHze9FhghJAZGMOL9+is1cLhY5MmToGPuxc8uTfnagoNDmHCCLoI?=
 =?us-ascii?Q?pkVmU2334wcQcS2Y4XZk/nAdK+YxhAKiFDtCetrZKJU7hcjjoTUeJI15PA1A?=
 =?us-ascii?Q?t3g15Xf4cHQVZD7mqKrSA5IRjUMEXLLERpcX65eWEU6vwZ+JsjGDzYQTCvwv?=
 =?us-ascii?Q?1S0bT4eLkulm93udC+HPEZ/9It2myZvzR8OMRXyMGVttQDPKcZBv9ccasjOV?=
 =?us-ascii?Q?+vTezx7JU2TYBxPvccrsI3SBI8OzQmS+hqdV+JItsbxCrM3i+zxLkv/AljHs?=
 =?us-ascii?Q?7GD6DnT+Gq0nTWxPHTH2OGVw8/tOo88aU34n+d/KIvp+QSzEVdwfQGSQXBRh?=
 =?us-ascii?Q?gkyzoHY97fFNkKlTaU90W6Xas3DNhgKOTSP80EwZ5LrfrarQ56AEL4OQXPxJ?=
 =?us-ascii?Q?4sx4M2mjArHw8l/9NCr3a6XoI7MF137kEPNZDUDcuEi1bSDvW14gjmyMtnbL?=
 =?us-ascii?Q?zg2Bd+EcyISLbYZyqzSlOZX9P5me6XCsIBhbkibyAMn2n+40V85tP2rByjM+?=
 =?us-ascii?Q?qEIMHNA6tUoBVi7TnssQoa9Q?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc0cdc0-55fb-49a9-05c7-08d940edcf66
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2021 02:20:37.9063
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I84IOkAGhmEA4MxkGriB2+VhZrk2yEvB/1AYcqocQ8R/ytAz86Gh5BmopqZyGw1vTHdU8zNcKaZ3Ph6/GBENAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4633
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: [PATCH 2/4] remoteproc: imx_rproc: fix TCM io memory type
>=20
> is_iomem was introduced in the commit 40df0a91b2a5 ("remoteproc: add
> is_iomem to da_to_va"), but the driver seemed missed to provide the io ty=
pe
> correctly.
> This patch updates remoteproc driver to indicate the TCM on IMX are io
> memories. Without the change, remoteroc kick will fail.

All ATT_OWN memory are mapped using devm_ioremap, so only mark
TCM as io memories is not enough.

You could force all as iomem or update to use other map variants.

>=20
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Peng Fan <peng.fan@nxp.com>
> Fixes: 40df0a91b2a5 ("remoteproc: add is_iomem to da_to_va")

The i.MX8MN/Q is later that the patch, please update the fix.

Regards,
Peng.

> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 27 +++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/remoteproc/imx_rproc.c
> b/drivers/remoteproc/imx_rproc.c index d88f76f5305e..752f8ab258cf
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
>  	for (i =3D 0; i < IMX_RPROC_MEM_MAX; i++) {
> --
> 2.25.1

