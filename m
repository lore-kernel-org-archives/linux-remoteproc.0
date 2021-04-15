Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E47FC433B4
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Apr 2021 13:47:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D73D6113B
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Apr 2021 13:47:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232954AbhDONsN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 15 Apr 2021 09:48:13 -0400
Received: from mail-vi1eur05on2054.outbound.protection.outlook.com ([40.107.21.54]:32097
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230056AbhDONsN (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 15 Apr 2021 09:48:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbbvW8CXncDTTPsfVadafP4svwoSe1F1TjUmQ5UE6fm81E36oAqJ9ZS8CUt4//zNh4p+5eSKKj59a1Dptf7tM/LhEcOEHEhWyi/SspTp1n1UshDWsGGcBB264I+pbZT5LgYpnO/2vam5ic5oU9gThYDaBOwFUkTXO9EegFAv9xBQsit9zwJ2njKCuEiB88AaKig8iXguTMI598T0DpfQ5a73zNm+I5VPVzooIyf8wcHyy9shgaiHA6gCsN1zJv71uoAxk7IFRTZUTPaCboarCrX8RoXxMBqPT0Sdq/xWpc4Ppn7DJR56/Cc2Wg8ntP552TS5brhkgbnalEHpUOTY0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnBWOdmyt9FN5EHIzFu1DBXi/vQyfkd5A9Tf+hfCsgg=;
 b=lh6hgDGZregdYu/Any3VmJ0QsTegS2xD6PLSUnZJ0Bd0RxWHvJyAKh9ghnzA1cfioDHHzBFhot3khetX3wYp/MJ6trMLVMRLrIkEZnwJ5u+ikIRhtvNspUoJPeFGShQ6bt3kKm6Xaq2wh7Qlm3Qw7rWkjklgcoB6xExfAAY7fJJ5C4m3OHvqkTD3RlFiEkcCz+90bJT3WFS3v4nYBte7xvb817mKfmy3gMtDa9SVmw6ObL4QGr/8pw/TODUwhjqs5nrRFKwzRaYuUP+j099rFDnp0VH4Ap1TPM0RKFMznRPDGetWQs7zwS6eqiV7vGf9+lC3IvaXi0FGeAd4L+g4pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnBWOdmyt9FN5EHIzFu1DBXi/vQyfkd5A9Tf+hfCsgg=;
 b=XQDbfmFQsu83P6xM1QbaFlE3z/v5KGS5JNHheYnk1rlbSB9rcpEZFgq2pH5dR8xLjQwQAdWoGWf61Nb/lWKqBSDeBQ4sekWnFRADM+0S8tg5ZkUyf9E1ow+s68a33sAqvLr2kuyOcBqbo9tRj/lz2TzIJm52V0PZIHcKB5hMoFs=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0401MB2534.eurprd04.prod.outlook.com (2603:10a6:4:3c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 13:47:46 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3999.037; Thu, 15 Apr
 2021 13:47:46 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V3 8/8] remoteproc: imx_rproc: support i.MX8MN/P
Thread-Topic: [PATCH V3 8/8] remoteproc: imx_rproc: support i.MX8MN/P
Thread-Index: AQHXLBxSOgXe8CiFckWJOp4I9j1v1qqyw1mAgALfmMA=
Date:   Thu, 15 Apr 2021 13:47:46 +0000
Message-ID: <DB6PR0402MB2760D408BAA2A781E02191B3884D9@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <1617846898-13662-1-git-send-email-peng.fan@oss.nxp.com>
 <1617846898-13662-9-git-send-email-peng.fan@oss.nxp.com>
 <20210413175235.GF750651@xps15>
In-Reply-To: <20210413175235.GF750651@xps15>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [49.79.253.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19b56635-1866-4ae1-e27b-08d900150d3d
x-ms-traffictypediagnostic: DB6PR0401MB2534:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB253409AD0B2272D9C7985753C94D9@DB6PR0401MB2534.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:639;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XdiskFOGEEm0B9JeEW1ummCBHpK1PJQP2jVVqSKQ18rIv7dF2mWi6mE6MP1dmwhhj5x5XXmry8qExvCX0u9biWaxexMMzq/h9rsUlGNqUcNyVbHDoV619x1Vn8hGiJeb/Urb9MbboyL3CYp/53R0eEKo5btBR1/dHZYYpZtsw8Mieh3RbzjL//F4Jg+u9bdGlNOu0hNkia5KkxN/lHwL3mXhfR8MjhNFhRvAYpNupSNK5bvDqQ6vTkA4O7jog+uKxPFvwYHhPHk4b1Q4jG2fEvda2Zmc7znoS5O+F//sjt9dzPRDAk+I8UZBDnV9jNRDKhPI2Rtxds6KElzy27OGW7wcN70cZ/53LKjAXGuMbdb9O8omL6oJcnUTl+NFxPV+Vnn0xcHnfOzERe/lzS3XTnKwLZYjtOfSQ1O6nYfobdgw/umPWaR9TqH2MtCvPkcdEMfvQwULgpQBiFbl+yvFEqgLISphYnWdai6dZE8Qxu+ijacw7YI7UqnIfn11jOYY2n3/lj9x3cPk0JuZp0AFCR7/6pcscfGY2WMDZiLSx9uDEuM/iIiQ2kfRS6HBhVynB47V725vop+PHg1VOwdD+H+uHmXktglCKFOkBcHbOkw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(376002)(136003)(346002)(66476007)(6506007)(54906003)(66556008)(66446008)(66946007)(110136005)(83380400001)(52536014)(64756008)(4326008)(71200400001)(122000001)(7416002)(86362001)(5660300002)(8676002)(2906002)(33656002)(316002)(76116006)(38100700002)(26005)(8936002)(9686003)(55016002)(186003)(478600001)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?GP3WCs/PoYyrvCSxZfITbUGuKvURby+DiSrBKaXJEpPGlPHiHbB95AXmIfyY?=
 =?us-ascii?Q?GkKKak0lN6oiEUnxrZdZAk5dnQeMCUGhCYGINXEUtOJWeob7D+sv1ymtCZz+?=
 =?us-ascii?Q?17ZRD1SwjLJ+UNNql4rc2T2MA4XI0tR05Gr7GQbvkfVuVGVaRQWmDWL9+Y9r?=
 =?us-ascii?Q?7qKpS4PWpaE7LIZRX6lA0h8825v6ftcG1KAQNnvo8KBOkt4gAdU6KH8xs+Mu?=
 =?us-ascii?Q?KAZJPpGGBW5ne2YQzyTBPBSRSgYWEH1OeuBshWShx/iNU+MgnYLOm6ezBsuB?=
 =?us-ascii?Q?pwnn3bSrTiMukhBuNYsW/U7xWtxiiRXOhppkgFrHAvE/Sj+ovqpFu1yjFRn3?=
 =?us-ascii?Q?i8zvAsCuvvwaTn6lm2GKe9ysrvUYTpuxD7mbJkBjd/pl2rxG9AhM6WYrcLZU?=
 =?us-ascii?Q?Mx76paDRYgHLRsA5uVgy0gZyokTQ7xIp0ThAq67zSScQeYEA6Y+SO1+UOHrn?=
 =?us-ascii?Q?Xn53l+A+ZkYGqmrqFVuCTVKa6tg2YxQSVOJRt+jNH6L/DvYbzqtwpdxbsOKs?=
 =?us-ascii?Q?2F+FFzAVRLyKiZwxH98b4VGkAcXlb14DHkVtxUWYhXpSrC5O3nJ/pUyEp+ed?=
 =?us-ascii?Q?QXf0IY1SEz07YWZOfR5RACYOLZ8QO49YepyynwQVdaf5VQghf4kvrupGSXFu?=
 =?us-ascii?Q?S3vy2TMQmKC/dTKujZ2/RJIOFCuZ2zXySAD/kkUj/ZjD2c+leJPpDE36O82K?=
 =?us-ascii?Q?sRhq0RjZkDlJJ+NQJXkT1eC1jYkIYFZdqwezYhMDMDCbx/d0/53Hvqu5Fa3I?=
 =?us-ascii?Q?hPVDQ67ZPKtMg+60l7i9eZnxHLd+RhagBo57QYREsB0beUYt1dE5okcfujYo?=
 =?us-ascii?Q?tQsXj6U/qZkF+VDma1VN3/XNnA2prHnXoMCVekfo1d3zwMOG51TIEVcu22HG?=
 =?us-ascii?Q?rwgjSH4qPzh/gKV4bw3yTedOX8+IpsKk64CgPU7cVY+hV/WutrLpw/XF3Oj+?=
 =?us-ascii?Q?4hffS9qBitKyjSfjE3EkREsSFQPLyiHAQmUiAcofhHam8HmI+8+V5Yl8fGMg?=
 =?us-ascii?Q?ehEYjVZ+bRKp6F5CxzR1LTsmFE3a40Vm7ismvNoW/w9HbQ9KI7JqP2JUcI8x?=
 =?us-ascii?Q?m8qBWLe6QCkFkUkbu2y/P5g0SoTJ56vup/2Yits4b7LHUElHwm7pWnpqhNrd?=
 =?us-ascii?Q?60UZIPu7xKJ+SfryuYij+MSyJpUPk9aUATHiZaJttUMWuSY4toptezh8AqND?=
 =?us-ascii?Q?3Y6wnJNp4lnJhAQ5+Qg9ar8DQ5EncQF8n2wIBH8IRloW9MRQ5m8MaiyYVcGR?=
 =?us-ascii?Q?ox1X1ZeKK3SJbDZU4yber6+TKauWuCWvOTOTHMqR02ynvwDLYEXJMhPO8nC8?=
 =?us-ascii?Q?4eKMkS0MQ3z9WAlVLkzZnpm0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b56635-1866-4ae1-e27b-08d900150d3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2021 13:47:46.5039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9xp7ZEX6OPqtJli/gX/OCSPQ3P9Gk0xR3Ex5++DdlXGaH7nycC3QbGEsrpjL3WODHPEIyX4Tep7tlUvmk3Mb2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2534
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: Re: [PATCH V3 8/8] remoteproc: imx_rproc: support i.MX8MN/P

Hi Mathieu,

Your all comments are good suggestion in the patchset, I not reply your
comment one by one for each patch. In V4 patchset, hope I have fixed
all the issues you pointed.

Thanks for your reviewing.

Thanks,
Peng.

>=20
> On Thu, Apr 08, 2021 at 09:54:58AM +0800, peng.fan@oss.nxp.com wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Add i.MX8MN/P remote processor(Cortex-M7) support, we are using ARM
> > SMCCC to start/stop M core, not using regmap interface.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 89
> > +++++++++++++++++++++++++++++++---
> >  1 file changed, 82 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index b911a7539897..9351626f09c0
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -3,6 +3,7 @@
> >   * Copyright (c) 2017 Pengutronix, Oleksij Rempel
> <kernel@pengutronix.de>
> >   */
> >
> > +#include <linux/arm-smccc.h>
> >  #include <linux/clk.h>
> >  #include <linux/err.h>
> >  #include <linux/interrupt.h>
> > @@ -50,6 +51,11 @@
> >
> >  #define IMX_RPROC_MEM_MAX		32
> >
> > +#define IMX_SIP_RPROC			0xC2000005
> > +#define IMX_SIP_RPROC_START		0x00
> > +#define IMX_SIP_RPROC_STARTED		0x01
> > +#define IMX_SIP_RPROC_STOP		0x02
> > +
> >  /**
> >   * struct imx_rproc_mem - slim internal memory structure
> >   * @cpu_addr: MPU virtual address of the memory region @@ -119,6
> > +125,36 @@ struct imx_rproc {
> >  	enum imx_rproc_mode		mode;
> >  };
> >
> > +static const struct imx_rproc_att imx_rproc_att_imx8mn[] =3D {
> > +	/* dev addr , sys addr  , size	    , flags */
> > +	/* ITCM   */
> > +	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN },
> > +	/* OCRAM_S */
> > +	{ 0x00180000, 0x00180000, 0x00009000, 0 },
> > +	/* OCRAM */
> > +	{ 0x00900000, 0x00900000, 0x00020000, 0 },
> > +	/* OCRAM */
> > +	{ 0x00920000, 0x00920000, 0x00020000, 0 },
> > +	/* OCRAM */
> > +	{ 0x00940000, 0x00940000, 0x00050000, 0 },
> > +	/* QSPI Code - alias */
> > +	{ 0x08000000, 0x08000000, 0x08000000, 0 },
> > +	/* DDR (Code) - alias */
> > +	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
> > +	/* DTCM */
> > +	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN },
> > +	/* OCRAM_S - alias */
> > +	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
> > +	/* OCRAM */
> > +	{ 0x20200000, 0x00900000, 0x00020000, ATT_OWN },
> > +	/* OCRAM */
> > +	{ 0x20220000, 0x00920000, 0x00020000, ATT_OWN },
> > +	/* OCRAM */
> > +	{ 0x20240000, 0x00940000, 0x00040000, ATT_OWN },
> > +	/* DDR (Data) */
> > +	{ 0x40000000, 0x40000000, 0x80000000, 0 }, };
> > +
> >  static const struct imx_rproc_att imx_rproc_att_imx8mq[] =3D {
> >  	/* dev addr , sys addr  , size	    , flags */
> >  	/* TCML - alias */
> > @@ -205,6 +241,12 @@ static const struct imx_rproc_att
> imx_rproc_att_imx6sx[] =3D {
> >  	{ 0x80000000, 0x80000000, 0x60000000, 0 },  };
> >
> > +static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn =3D {
> > +	.att		=3D imx_rproc_att_imx8mn,
> > +	.att_size	=3D ARRAY_SIZE(imx_rproc_att_imx8mn),
> > +	.method		=3D IMX_RPROC_SMC,
> > +};
> > +
> >  static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mq =3D {
> >  	.src_reg	=3D IMX7D_SRC_SCR,
> >  	.src_mask	=3D IMX7D_M4_RST_MASK,
> > @@ -246,12 +288,24 @@ static int imx_rproc_start(struct rproc *rproc)
> >  	struct imx_rproc *priv =3D rproc->priv;
> >  	const struct imx_rproc_dcfg *dcfg =3D priv->dcfg;
> >  	struct device *dev =3D priv->dev;
> > +	struct arm_smccc_res res;
> >  	int ret;
> >
> > -	ret =3D regmap_update_bits(priv->regmap, dcfg->src_reg,
> > -				 dcfg->src_mask, dcfg->src_start);
> > +	switch (dcfg->method) {
> > +	case IMX_RPROC_MMIO:
> > +		ret =3D regmap_update_bits(priv->regmap, dcfg->src_reg,
> dcfg->src_mask,
> > +					 dcfg->src_start);
> > +		break;
> > +	case IMX_RPROC_SMC:
> > +		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_START, 0, 0, 0,
> 0, 0, 0, &res);
> > +		ret =3D res.a0;
> > +		break;
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> >  	if (ret)
> > -		dev_err(dev, "Failed to enable M4!\n");
> > +		dev_err(dev, "Failed to enable remote cores!\n");
> >
> >  	return ret;
> >  }
> > @@ -261,12 +315,26 @@ static int imx_rproc_stop(struct rproc *rproc)
> >  	struct imx_rproc *priv =3D rproc->priv;
> >  	const struct imx_rproc_dcfg *dcfg =3D priv->dcfg;
> >  	struct device *dev =3D priv->dev;
> > +	struct arm_smccc_res res;
> >  	int ret;
> >
> > -	ret =3D regmap_update_bits(priv->regmap, dcfg->src_reg,
> > -				 dcfg->src_mask, dcfg->src_stop);
> > +	switch (dcfg->method) {
> > +	case IMX_RPROC_MMIO:
> > +		ret =3D regmap_update_bits(priv->regmap, dcfg->src_reg,
> dcfg->src_mask,
> > +					 dcfg->src_stop);
> > +		break;
> > +	case IMX_RPROC_SMC:
> > +		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STOP, 0, 0, 0, 0,
> 0, 0, &res);
> > +		ret =3D res.a0;
> > +		if (res.a1)
> > +			dev_info(dev, "Not in wfi, force stopped\n");
> > +		break;
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> >  	if (ret)
> > -		dev_err(dev, "Failed to stop M4!\n");
> > +		dev_err(dev, "Failed to stop remote cores\n");
> >
> >  	return ret;
> >  }
> > @@ -600,6 +668,7 @@ static int imx_rproc_detect_mode(struct imx_rproc
> > *priv)  {
> >  	const struct imx_rproc_dcfg *dcfg =3D priv->dcfg;
> >  	struct device *dev =3D priv->dev;
> > +	struct arm_smccc_res res;
> >  	int ret;
> >  	u32 val;
> >
> > @@ -616,8 +685,12 @@ static int imx_rproc_detect_mode(struct
> imx_rproc *priv)
> >  			priv->mode =3D IMX_RPROC_EARLY_BOOT;
> >  	}
> >
> > -	if (dcfg->method =3D=3D IMX_RPROC_NONE)
> > +	if (dcfg->method =3D=3D IMX_RPROC_NONE) {
> >  		priv->mode =3D IMX_RPROC_EARLY_BOOT;
> > +	} else if (dcfg->method =3D=3D IMX_RPROC_SMC) {
> > +		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_STARTED, 0, 0,
> 0, 0, 0, 0, &res);
> > +		priv->mode =3D res.a0 ? IMX_RPROC_EARLY_BOOT :
> IMX_RPROC_NORMAL;
> > +	}
>=20
> When all patches have been applied this function is really hard to read. =
 I
> suggest using a switch() statement like you did in imx_rproc_start() and
> imx_rproc_stop().
>=20
> Thanks,
> Mathieu
>=20
> >
> >  	if (priv->mode =3D=3D IMX_RPROC_EARLY_BOOT)
> >  		priv->rproc->state =3D RPROC_DETACHED; @@ -747,6 +820,8 @@
> static
> > const struct of_device_id imx_rproc_of_match[] =3D {
> >  	{ .compatible =3D "fsl,imx6sx-cm4", .data =3D &imx_rproc_cfg_imx6sx }=
,
> >  	{ .compatible =3D "fsl,imx8mq-cm4", .data =3D &imx_rproc_cfg_imx8mq }=
,
> >  	{ .compatible =3D "fsl,imx8mm-cm4", .data =3D &imx_rproc_cfg_imx8mq }=
,
> > +	{ .compatible =3D "fsl,imx8mn-cm7", .data =3D &imx_rproc_cfg_imx8mn }=
,
> > +	{ .compatible =3D "fsl,imx8mp-cm7", .data =3D &imx_rproc_cfg_imx8mn }=
,
> >  	{},
> >  };
> >  MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
> > --
> > 2.30.0
> >
