Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DCA1C4708F
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Jun 2021 06:05:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E43AD61376
	for <linux-remoteproc@archiver.kernel.org>; Wed,  2 Jun 2021 06:05:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbhFBGH0 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 2 Jun 2021 02:07:26 -0400
Received: from mail-eopbgr80074.outbound.protection.outlook.com ([40.107.8.74]:23998
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230264AbhFBGHZ (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 Jun 2021 02:07:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJ66P6Fxgi7mcwxg9BkhKB3qlJqiz5ng5wLFJk+MHj5yVeGiT4HXjfh2wDCaLosNjEUT1Lk+IjC8Qm54Qo4FA63I8Wu2dh5VtwcKAZ2ecvZQZqy6qvLAi+w6YjcNGKIZovb839JhihZkuVtqTGlGgGVTN9P8qDSu3v/SxDOi7buPtwxkbIj73m6xLWLKBzgvMonG/cTgXOwGxkX36ScjDy35qsgkmknWvKHm2Baop3EuwzX5sBSqfFxYKB6x7RgEia7HSR/ndZGX6e15R8C4kIdm8ig4elgJnrLhAjbUbzo9jCVxIpRxF/MMqdtGICbLzvoQAxaTSTEudSaexS0LIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f090PyWOx/wJTqQ+FzdrWqpR+hllQ/LSdfsPRHoMiKA=;
 b=GSXXlSGKmLjT5jYdwUHG+QIcPQXiFBKcRiG+1sKzjD16muzX6G8yyPx8EqiTdSwkHXA/qBcWYfO5XQ/n68+gBdjLmAi8T/b8Kl7BQ9rFNIMFc1ZLIY6WQpk7Wr1vSdn7xop4oKIJB9zdhDpYLcX3B39HAtHGSq+x/ClpFwSY2E8mFqDC/qw5ROOtqA4V0FrTZeCLxKh8gb8CgqA+oYdJpYIhD5aCUJbzZF868RwlMKBt/J+NwI6z/SPKLe/zDa6gJSmXdLQ2awdqMzj1ZlnFrfX6+e2J7iodH8IBq8JsyseTWxo3gN+3W/L2mHqqRzqavetk1TFuVEJ2JvEMMTPZgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f090PyWOx/wJTqQ+FzdrWqpR+hllQ/LSdfsPRHoMiKA=;
 b=DV1vsaARtOcjIJoOnOdnG+ejmhVYo7lqI+I1Bl60HHQ6HfrDF3/PUVF0QexMJ63IV4tTlR3baTt0hJgQKfxyNCblmKGBTKUOddr2COYmYMO7WYEJgC3D9A38CLJ33X85iJUr74g6RsT+q1pejcS37C2RVNEOidKLKvG4zxssXW4=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4235.eurprd04.prod.outlook.com (2603:10a6:5:22::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 2 Jun
 2021 06:05:40 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 06:05:39 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] remoteproc: imx_rproc: correct firmware reload
Thread-Topic: [PATCH] remoteproc: imx_rproc: correct firmware reload
Thread-Index: AQHXVsxtVguSjVNZwky0S6J+D3O7h6r/SNWAgAAH9wCAAOupcA==
Date:   Wed, 2 Jun 2021 06:05:39 +0000
Message-ID: <DB6PR0402MB27609FA2992293A37CE521DE883D9@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20210601102939.16139-1-peng.fan@oss.nxp.com>
 <20210601153139.GB1759269@xps15> <YLZZinrEMaYHgsEe@yoga>
In-Reply-To: <YLZZinrEMaYHgsEe@yoga>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf0115cf-d492-40c3-0cf3-08d9258c72b3
x-ms-traffictypediagnostic: DB7PR04MB4235:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB423571A00391EE0216F63AD8883D9@DB7PR04MB4235.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OhZtxtjokHtQfZHOQuxiyMNRm5g1859SZqxivDpeA91tvktkHhseG6qOMmEmLvGI6Hd+R5/61Tehid0n4zTQf1xAlGTD9CERh7Uwr27pOtIe5Uu/zln2JhvWmeWifHak34jXJdoDBY0eUJn6eEnTHjehmh5B10tXtUnc0pvW9BitT2sr8NIuXOem7OtAOGmJEeIBcYK2Dghwo6h9Cn4/hhd0yctAXDMiwAeqr6fdCjHlTXiARGPTdpFyzyfNUShCKDXJeCBg/3lOfuCLjuRKHNOL+l9mnNclHIqoXPBVBJndQ96VbFjKbckjkJyoXS/ldHlGC1DMvnfKcRM/FtoMPjrd5RfXp7u9INbLUyFTvm5ACgzzE5Bz90X7yttTYr3GAsXz1CjbRrRKan8CGILg42JhEQ9UNioXPFqTmPuVyGgFIpB5xyie06CZ41oY69xhUM+lS8YgIDEvqWIEzkGZchRvWflffusdNgTKOnEsv9k/g1x1js+BXxW2Xem/+wkdDvGDeG5LhKKShOhpiaV/aevrDxS5LZM0U/F5ag/bgqZLR5p+WhlkjuIAbB1CNspc8Z542SKXy/liZYvVK4WSKQgLiTXpxV2rMrmriL5lbQzLNURae20V9aOwGKK7b02GwOxTxWKtbxRGEmcyBjWIaMMI7frrrumcPgDQ7ER/i+rypayUm1OrRx8y9KLwZvvMsh84ZdTjY0avSj5fj0yTIsVhAAeO7i5I//63rKNzu1g0QwcZsJItSu/hVJoVw/pu
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(7696005)(76116006)(44832011)(5660300002)(26005)(33656002)(478600001)(66946007)(6506007)(64756008)(45080400002)(66476007)(966005)(66556008)(110136005)(52536014)(38100700002)(83380400001)(71200400001)(9686003)(8676002)(7416002)(4326008)(122000001)(2906002)(86362001)(316002)(186003)(54906003)(66446008)(55016002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?cCm8iJ9MXFuftsK4CTIZJQK/ZaQY+lGWbm9uzJhbfugWmuwd/IT71Uyf7uj3?=
 =?us-ascii?Q?kqFnoA7+mDEc528kCR00xDNaTYrgRNKWPJuHDItC+Js2sVK/2278oBxbOE/+?=
 =?us-ascii?Q?mIvSP3J91KAVh1mL7Be0m5pcgtRhrM7Q6xQZx+GDOATWjijYBP+WvHVSgwwB?=
 =?us-ascii?Q?qp5cy1QhCV0aq4VQjaZT31pMClyTK2Jvb97BPKBifWJtKV7OSZRAfJyN+uiZ?=
 =?us-ascii?Q?LWAhQj3lwq8hmp3pRiR1pESo+2TfaQY8TPRIE3CXMARtG4vqYaoNmpENa8Su?=
 =?us-ascii?Q?DBeoGQPqhRCV4VJ32qymPas8Q0TCwLligi5dxQvGK+2l0pHfjcG5vbw/W50v?=
 =?us-ascii?Q?+E1ZThlvJ70mVPVrpq9bE1En75nmuPQwLMxRH8SGfOANpQQQ//Q9H64GaGAA?=
 =?us-ascii?Q?AsnSmO/KbZSIO/tzZKFbpt2K9+rRpMwY4uukUY0/q8GKjF0uNicpp6YYWy02?=
 =?us-ascii?Q?0HCqbv1jIxTQDSU6d6qkgBXy4svXW8qxMbW1Gze4JmiqIiE0q2Ge+KEzAGo/?=
 =?us-ascii?Q?LNJi34/3TtyzogffCbI0/5zi38p8874WIkdp895qNNjqt8er0YAjNymsxGsQ?=
 =?us-ascii?Q?feyE6zTftpcj8jIs6MBKFFSMPaX0vjGE0jAo9f0wzLof8AwIJtKKGdvUtZvn?=
 =?us-ascii?Q?rD7bsGgFQOb76pp66qxNoM6Fm4+mXMbgzj9Hr5MbBWW0QqzCoa5V3/Onxibp?=
 =?us-ascii?Q?a4/VDTCiU3842kVq37TLb5BqjBIsXmwGpXTM/+trkPZN84MauFPkb8KOVysJ?=
 =?us-ascii?Q?bPL4lSqT/gv4QLL9gfZlO6lj0UKDH2aLUYLvX6qceWAp7p/AV9wNfiUNLtut?=
 =?us-ascii?Q?vabMpiIFfA0u5QQzW3v7/R542VjjqiIiN6mj7DxKfvj2kaYb56lUdrynlAZ8?=
 =?us-ascii?Q?xP8aE9zxDXpjp+pv3LzijqcKC9cHPKmwzyx1yshmVCSqCcOgSQuYnu1bqhgN?=
 =?us-ascii?Q?pbZySLukTcHhFnQpfK01iJI+fHVw12Uv7G8i8MhussKwbNtcI1YiPSJuZbfd?=
 =?us-ascii?Q?CkWXxEPomVfQLbrzG+JyUj9RihjOUF1ooeZq4dmWHFDZITsxnQ42IXbhH+OV?=
 =?us-ascii?Q?96rocyS/r7iPhICQewMinbyk52sSPAR+3los5pEa06EgsyjGnIE9xns/RlK9?=
 =?us-ascii?Q?WsPX0TUrrCexrsL2sy/ZNG2C8oRNYrCI8ZsqnP54hco8sf4XzlzQKEVbvExi?=
 =?us-ascii?Q?KcVTULy/MuXGYUd/2j8SnXE3/nxVrGPOfZ9RVNKJsQsdzpvF2Kk/tc7jYVZZ?=
 =?us-ascii?Q?Glsn/5onUgDA9t6IXlKa5/NGPa//pskKJHeN6rwU7gT4s+kIML5O06BEpwos?=
 =?us-ascii?Q?rTpDsRGRj5peooL6H6pu7TQU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0115cf-d492-40c3-0cf3-08d9258c72b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2021 06:05:39.8172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qMjgH++fUUbJOsdYfJdQcdXztCAeGLI6O67m6TQC+yEZqTnyleydGCDzS3b/IEpitilHtgg8ETz7WIncugGcMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4235
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Bjorn, Mathieu

> Subject: Re: [PATCH] remoteproc: imx_rproc: correct firmware reload
>=20
> On Tue 01 Jun 10:31 CDT 2021, Mathieu Poirier wrote:
>=20
> > On Tue, Jun 01, 2021 at 06:29:39PM +0800, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > ENABLE_M4 should be set to 1 when loading code to TCM, otherwise you
> > > will not able to replace the firmware after you stop m4.
> > >
> > > Besides ENABLE_M4, we still need set SW_M4C_RST, because this bit
> > > will be automatically set with SW_M4C_NON_SCLR_RST set.
> > >
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >
> > > V1:
> > >  Although this is an fix, but it is not critical, patch is based on
> > >
> > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fp=
a
> > >
> tchwork.kernel.org%2Fproject%2Flinux-remoteproc%2Fcover%2F162027412
> 3
> > >
> -1461-1-git-send-email-peng.fan%40oss.nxp.com%2F&amp;data=3D04%7C01%
> 7C
> > >
> peng.fan%40nxp.com%7C471a7b81f5d44fc6f85b08d925165839%7C686ea1d
> 3bc2b
> > >
> 4c6fa92cd99c5c301635%7C0%7C0%7C637581600173592073%7CUnknown
> %7CTWFpbG
> > >
> Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6
> Mn
> > >
> 0%3D%7C1000&amp;sdata=3D5JerdzsSmjZ%2Flowd3AXo3gmr6bdHM9DCg55kv
> UmTWQw%
> > > 3D&amp;reserved=3D0
> > >
> > >  drivers/remoteproc/imx_rproc.c | 8 +++++---
> > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/imx_rproc.c
> > > b/drivers/remoteproc/imx_rproc.c index cd2ca96a30e5..ce2ce42bee91
> > > 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -33,7 +33,8 @@
> > >
> > >  #define IMX7D_M4_START			(IMX7D_ENABLE_M4 |
> IMX7D_SW_M4P_RST \
> > >  					 | IMX7D_SW_M4C_RST)
> > > -#define IMX7D_M4_STOP			(IMX7D_ENABLE_M4 |
> IMX7D_SW_M4C_NON_SCLR_RST)
> > > +#define IMX7D_M4_STOP			(IMX7D_ENABLE_M4 |
> IMX7D_SW_M4C_RST | \
> > > +					 IMX7D_SW_M4C_NON_SCLR_RST)
> > >
> > >  /* Address: 0x020D8000 */
> > >  #define IMX6SX_SRC_SCR			0x00
> > > @@ -44,7 +45,8 @@
> > >
> > >  #define IMX6SX_M4_START			(IMX6SX_ENABLE_M4 |
> IMX6SX_SW_M4P_RST \
> > >  					 | IMX6SX_SW_M4C_RST)
> > > -#define IMX6SX_M4_STOP			(IMX6SX_ENABLE_M4 |
> IMX6SX_SW_M4C_NON_SCLR_RST)
> > > +#define IMX6SX_M4_STOP			(IMX6SX_ENABLE_M4 |
> IMX6SX_SW_M4C_RST | \
> > > +					 IMX6SX_SW_M4C_NON_SCLR_RST)
> > >  #define IMX6SX_M4_RST_MASK		(IMX6SX_ENABLE_M4 |
> IMX6SX_SW_M4P_RST \
> > >  					 | IMX6SX_SW_M4C_NON_SCLR_RST \
> > >  					 | IMX6SX_SW_M4C_RST)
> > > @@ -691,7 +693,7 @@ static int imx_rproc_detect_mode(struct
> imx_rproc *priv)
> > >  		return ret;
> > >  	}
> > >
> > > -	if (!(val & dcfg->src_stop))
> > > +	if ((val & dcfg->src_mask) !=3D dcfg->src_stop)
> > >  		priv->rproc->state =3D RPROC_DETACHED;
> >
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >
> > Bjorn hasn't picked up this set yet so it is best to send a v7 of [1]
> > with this change merged in it.
> >
>=20
> Sorry I had missed that [1] was fully reviewed, so I figured I'll just ap=
ply the
> series and squash this in. But afaict this patch isn't a fix to any of th=
e patches
> in [1].
>=20
> More so, this patch doesn't apply on top of either v5.13-rc1, linux-next =
or [1] -
> because neither IMX7D_M4_STOP nor IMX6SX_M4_STOP has
> IMX6SX_ENABLE_M4 included.

I'll send v2 to avoid the conflict soon.

>=20
>=20
> Peng, I've applied [1] now, please let me know what to do about this patc=
h.

Thanks,
Peng.

>=20
> Regards,
> Bjorn
>=20
> > Thanks,
> > Mathieu
> >
> > [1].
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpat=
c
> >
> hwork.kernel.org%2Fproject%2Flinux-remoteproc%2Fcover%2F1620274123-
> 146
> >
> 1-1-git-send-email-peng.fan%40oss.nxp.com%2F&amp;data=3D04%7C01%7Cpe
> ng.f
> >
> an%40nxp.com%7C471a7b81f5d44fc6f85b08d925165839%7C686ea1d3bc2b
> 4c6fa92c
> >
> d99c5c301635%7C0%7C0%7C637581600173592073%7CUnknown%7CTWFp
> bGZsb3d8eyJW
> >
> IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C
> 1000&
> >
> amp;sdata=3D5JerdzsSmjZ%2Flowd3AXo3gmr6bdHM9DCg55kvUmTWQw%3D&
> amp;reserve
> > d=3D0
> >
> > >
> > >  	return 0;
> > > --
> > > 2.30.0
> > >
