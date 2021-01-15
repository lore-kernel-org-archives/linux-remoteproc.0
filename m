Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E10A7C433DB
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 Jan 2021 03:33:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9865723AC0
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 Jan 2021 03:33:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbhAODdL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 Jan 2021 22:33:11 -0500
Received: from mail-db8eur05on2057.outbound.protection.outlook.com ([40.107.20.57]:12257
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729581AbhAODdK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 Jan 2021 22:33:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KV3VrfpD0cZ2aQagK6Dm6+/yoYQWnnpytGU//drLHAuYlkn39L0rXKBv2vPR6DeUsts9UnQSCIQK9oL/PNhylJ7ndlx8y0fLW495s7CNCv+YchDuQkMdPehrKYU6tUxXv7zGb4jsBeKinzAyPfudVPfOSgTd8ntMISeix8BwOBZfrPyqefIzD4rIct8eC2M6In/rDNu/qrzMHXqcN8UXRellx46tU478cURVF1K1FmsiUSV00M5haP3RJrqbqqR5ZlBpftiHL+gUqV8rp71IhrANb5b1b7Lf0gV3eByOfZEowFYUqxY+X61TTuWcVbXL8XgExSgqCyd8DgrwEdCLoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lbmx5lWKTi/rRUtkWcJnZe8+nUqxVAqyRrO1fFike88=;
 b=Pb8rjs+Ot7wDjo8Wvp7hQiC7wyTnf5fd3X3Hy14OYMqEM+trhAHckWQYwjYTjmgeN/h0rx4OQxuTmAu0ykomWhhO1nFxMlzwwxPcNDzDLoh3bYPxEzJIqH8jJc2NojdYd1JfaIHLZ5cXyABhDSGK3KOOmZcw/sqeQbv8amBUZNVBqI8v7i4/cc8HHku4XOLbfbz+uADfuExVEWjv0kWcxw2V6YAtEuMQ9bDYeOCQSYzr1+H/k6NHeIoeM07/EGV1TaGojsRJ4+MXKiZwmoP++ntPxFhDApXAO2+yFqv35oBudtG2sZosdt3Id0ok9Y+vp76gmNMuoMeCCHuOsakfqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lbmx5lWKTi/rRUtkWcJnZe8+nUqxVAqyRrO1fFike88=;
 b=BiGfrcWZwT+uwGjT8QMCzZLdUqeL767sAk40A+i0eFbdN5sgSv9sdfLtxTq9jhhyVz48XStD6emOOnkO3QfivS9lPSgR0bd5m1kWdTzoCND1MdOQfZnBv0hjG9k+2HE5upRU3YT1l4iR7/4R+dDgfH0M/rXfOX24rCNPdAeWlsM=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0401MB2536.eurprd04.prod.outlook.com (2603:10a6:4:36::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Fri, 15 Jan
 2021 03:29:43 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3742.012; Fri, 15 Jan 2021
 03:29:43 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
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
        "paul@crapouillou.net" <paul@crapouillou.net>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "agross@kernel.org" <agross@kernel.org>,
        "patrice.chotard@st.com" <patrice.chotard@st.com>
Subject: RE: [PATCH V5 7/8] remoteproc: imx_rproc: ignore mapping vdev regions
Thread-Topic: [PATCH V5 7/8] remoteproc: imx_rproc: ignore mapping vdev
 regions
Thread-Index: AQHW3Y8IMsfD4HQjaUqOo7Zl/WNCSKojDGiAgADFokCAAJlRgIAAfjgwgADqeYCAASYtMIAAewcAgACsr+A=
Date:   Fri, 15 Jan 2021 03:29:43 +0000
Message-ID: <DB6PR0402MB27606B563E19D96EB89C6B1488A70@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20201229033019.25899-1-peng.fan@nxp.com>
 <20201229033019.25899-8-peng.fan@nxp.com> <20210111215023.GJ144935@xps15>
 <DB6PR0402MB2760F6F982C32B6557467C9188AA0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <20210112184629.GA186830@xps15>
 <DB6PR0402MB27602E812FD657F7EC81854F88A90@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <20210113161727.GA213180@xps15>
 <DB6PR0402MB276015A108C846FA77A6E05388A80@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <20210114171040.GA255481@xps15>
In-Reply-To: <20210114171040.GA255481@xps15>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5a4c9dfe-77e7-46da-b128-08d8b905ccf1
x-ms-traffictypediagnostic: DB6PR0401MB2536:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB2536175440E558F3F7DB13DC88A70@DB6PR0401MB2536.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3DoSBqh3a9b+fuad8eI8hDwWdRGg9JxamdGDDhuTwhNDQzRgDscYLx94pTKRnDePNlOSb0hOGj0N/I4HQhml6nom3OcLg8JGKCH2OWSptCvte0+RBLj2Qzr/i+8NG0r63tMlDTW4+yRA/lO7F/JX21brXrK2Hr2xB3acHSzkDrVuqlw4HqLCiLSPPa32A9BYCLbFxvekLKvs5ToEGZH4iDXHrsuz3Nr5IHMS2ETnBesPx/3giH9PJjR8MFwwJWPMzvNGt/q/3pcrUv7ETjfNygW+/7Tan0v/U7eSvbKnvR93o7iegNY3dtgRfjvZkIIKpC2Eu07PzgMY/av/7ZBxQ+Mr7d6sag+Oce4At9MSvri/gp7SbxxIo3egcVGXolQCxuQhig5mN322T2yC8TiHCJcOakWg2ec+59BKzEiMxuGfNvvn3nN/ZlTweCSuoOs95nhnn6rKmEBIKGYvPuHbKw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(39860400002)(346002)(64756008)(44832011)(66446008)(66946007)(66556008)(7416002)(2906002)(55016002)(71200400001)(66476007)(9686003)(6916009)(76116006)(83380400001)(26005)(186003)(5660300002)(52536014)(8936002)(478600001)(4326008)(316002)(33656002)(8676002)(54906003)(6506007)(966005)(86362001)(7696005)(45080400002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?tk+cTXrrX+ISvLPErHMIxZeCFz0txzsGeHnBRxM33dz2IT8eBKxwdEZgH6bZ?=
 =?us-ascii?Q?pY+kgKHpy0miRxDnMVYMFOVdd31DF31kHutkJnxr+Np4DZ9Lbclbu2pF8hX9?=
 =?us-ascii?Q?8WCD+XmDL1ZLCqgFY6gkhF/4nts2JK6HJRRBdOUqkBVpAjM+AvPI0WoI3ln8?=
 =?us-ascii?Q?w2KPmndD4PwKEfgZ8ae/9aI0eFQ/8etTLFy44WRXDw3iFC+J76njq69OiVi1?=
 =?us-ascii?Q?j/2ZiR2fUjFQgAVzfDShGfyYElSO4ZJb5Y2N5XRuCqu8/9ML24ip1xv6vofU?=
 =?us-ascii?Q?m+iAz2T5QTOZ0zj9pv5i/tLrCZctic/bydcka+Kyg/C42khXTM2lQA7J7TOQ?=
 =?us-ascii?Q?m9SMixA+DTgVx2jw/LhJBir+qxYHty3zPdFE0PkO0T6QeiNCtvaOKSYs/rFt?=
 =?us-ascii?Q?Hi2yXPwoIvYM/lEJiXMVwI280a1u2kSghWV1s+sZeW/31sZbCoWvOLGU/aoN?=
 =?us-ascii?Q?of5LQwqFzcGKFb363yTDltWoPP9mCNr+0fUrsHPp5rtjdjXsmeA3H82Tam7F?=
 =?us-ascii?Q?3kH8FF/zaWPUtkOjdF8lWveyDtMyQTPHj2001pZBLTzeDJf/DkgSDZMrbzjG?=
 =?us-ascii?Q?qyvaJL7FBiDSkRTfuWPtQp19wqo4moTYr70Ff+8n+rux+0AfVqcsLcHbNvvI?=
 =?us-ascii?Q?oR+V8kb+1KYGISUF8yTyA1rHfbPNdIr3Tlw/x6utOzmNIMgdEd3ijbvPcFmt?=
 =?us-ascii?Q?fOiXTnaaebRwjxlL9m9cCeiXmEmU3aVIfwgFXlLlmtlTw2nprmrYNHHb3ti1?=
 =?us-ascii?Q?lr0g9Qxig9YvpXwrSbLzoPakumcLveimY0AlwmhU++L6L6alOFin0l9HCoHZ?=
 =?us-ascii?Q?h+rnS9PvORbRhT7yZFhf8D9w9xNOv4iiIiVjB0KUblcV5xRohs960/L2nxaW?=
 =?us-ascii?Q?odfmVxqoU75o6tqvFxuIK7jzOIiIXnL3/Y8rDO8/M76hrGc71mGBIq4q/eqI?=
 =?us-ascii?Q?rZMdLeYvtsSSwhTulbZKxFqWHhsrMmHB8qeZhsa2nQs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a4c9dfe-77e7-46da-b128-08d8b905ccf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 03:29:43.6132
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7CXyrS4EVF+65dgR+4nw82mBTP8wizm/gYCprPF1cKBktJ4LkN/oF0WvHVNZ7UZ8bcarp/zenY5UMnFphl/ndg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2536
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: Re: [PATCH V5 7/8] remoteproc: imx_rproc: ignore mapping vdev
> regions
>=20
> On Thu, Jan 14, 2021 at 09:52:13AM +0000, Peng Fan wrote:
> > > Subject: Re: [PATCH V5 7/8] remoteproc: imx_rproc: ignore mapping
> > > vdev regions
> > >
> > > On Wed, Jan 13, 2021 at 02:19:32AM +0000, Peng Fan wrote:
> > > > > Subject: Re: [PATCH V5 7/8] remoteproc: imx_rproc: ignore
> > > > > mapping vdev regions
> > > > >
> > > > > On Tue, Jan 12, 2021 at 09:41:12AM +0000, Peng Fan wrote:
> > > > > > > Subject: Re: [PATCH V5 7/8] remoteproc: imx_rproc: ignore
> > > > > > > mapping vdev regions
> > > > > > >
> > > > > > > On Tue, Dec 29, 2020 at 11:30:18AM +0800, peng.fan@nxp.com
> > > wrote:
> > > > > > > > From: Peng Fan <peng.fan@nxp.com>
> > > > > > > >
> > > > > > > > vdev regions are vdev0vring0, vdev0vring1, vdevbuffer and
> similar.
> > > > > > > > They are handled by remoteproc common code, no need to map
> > > > > > > > in imx rproc driver.
> > > > > > > >
> > > > > > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > > > > > ---
> > > > > > > >  drivers/remoteproc/imx_rproc.c | 3 +++
> > > > > > > >  1 file changed, 3 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/drivers/remoteproc/imx_rproc.c
> > > > > > > > b/drivers/remoteproc/imx_rproc.c index
> > > > > > > > f80428afb8a7..e62a53ee128e
> > > > > > > > 100644
> > > > > > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > > > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > > > > > @@ -417,6 +417,9 @@ static int imx_rproc_addr_init(struct
> > > > > > > > imx_rproc
> > > > > > > *priv,
> > > > > > > >  		struct resource res;
> > > > > > > >
> > > > > > > >  		node =3D of_parse_phandle(np, "memory-region", a);
> > > > > > > > +		/* Not map vdev region */
> > > > > > > > +		if (!strcmp(node->name, "vdev"))
> > > > > > > > +			continue;
> > > > > > >
> > > > > > > I am very confused and because I don't see an example for
> > > > > > > the DT in the bindings document I have to guess what is going=
 on.
> > > > > >
> > > > > > V6 will include the DT yaml.
> > > > > >
> > > > > > >
> > > > > > > So I am guessing that you have laid out the memory regions
> > > > > > > for the vrings and the vdev0buffer in the DT "memory-region".
> > > > > >
> > > > > > The dts part will be similar as following:
> > > > > >
> > > > > > +    #include <dt-bindings/clock/imx8mm-clock.h>
> > > > > > +    rsc_table: rsc_table@550ff000 {
> > > > > > +      no-map;
> > > > > > +      reg =3D <0x550ff000 0x1000>;
> > > > > > +    };
> > > > > > +
> > > > > > +    vdev0vring0: vdev0vring0@55000000 {
> > > > > > +      no-map;
> > > > > > +      reg =3D <0x55000000 0x8000>;
> > > > > > +    };
> > > > > > +
> > > > > > +    vdev0vring1: vdev0vring1@55008000 {
> > > > > > +      reg =3D <0x55008000 0x8000>;
> > > > > > +      no-map;
> > > > > > +    };
> > > > > > +
> > > > > > +    vdevbuffer: vdevbuffer@55400000 {
> > > > > > +      compatible =3D "shared-dma-pool";
> > > > > > +      reg =3D <0x55400000 0x100000>;
> > > > > > +      no-map;
> > > > > > +    };
> > > > > > +
> > > > > > +    imx8mm-cm4 {
> > > > > > +      compatible =3D "fsl,imx8mm-cm4";
> > > > > > +      clocks =3D <&clk IMX8MM_CLK_M4_DIV>;
> > > > > > +      mbox-names =3D "tx", "rx", "rxdb";
> > > > > > +      mboxes =3D <&mu 0 1
> > > > > > +                &mu 1 1
> > > > > > +                &mu 3 1>;
> > > > > > +      memory-region =3D <&vdevbuffer>, <&vdev0vring0>,
> > > > > > + <&vdev0vring1>,
> > > > > <&rsc_table>;
> > > > > > +      syscon =3D <&src>;
> > > > > > +    };
> > > > > >
> > > > > > >
> > > > > > > For the vrings I don't see the allocation of a carveout,
> > > > > > > which means that you will take the memory out of the DMA
> > > > > > > pool and the reserve memory will be wasted.
> > > > > >
> > > > > > imx_rproc_parse_memory_regions will alloc carveout.
> > > > >
> > > > > They _will_ but for now they don't and as such there a
> > > > > discrepancy between the bindings and the code that was published
> > > > > in V6.  At this point you can either drop the vrings in the DT
> > > > > or send another revision with the carveouts allocated.  I would
> > > > > definitely prefer the latter because it wouldn't involve yet
> > > > > another modification of the
> > > bindings.
> > > >
> > > > You mean I drop patch v5 7/8 and send v7, right?
> > > >
> > >
> > > If you do that than the implementation won't reflect the bindings.
> > >
> > > > Or are there other changes that I need to do?
> > >
> > > If you want to keep the bindings the same way you have them in V6,
> > > carveouts are required in the implementation.
> >
> > ok. Could you share more info about carveouts are required?
> > imx_rproc_parse_memory_regions in my pachset already have
> > rproc_add_carveout. I am not clear what else needs to be done.
>=20
> Ah yes, I see now.  In your answer above you wrote
> "imx_rproc_parse_memory_regions will alloc carveout", which I interpreted
> as "will do so in a future patchset".
>=20
> I will review V6 - no need to change anything at this time.

Thanks, since we are almost clear and no major code change, I'll post V7
after addressing the comments in V6.

Thanks,
Peng.

>=20
> >
> > Thanks,
> > Peng.
> >
> > >
> > > >
> > > > Thanks,
> > > > Peng.
> > > >
> > > > >
> > > > > >
> > > > > > >
> > > > > > > For the vdev0buffer, what you have will work *only* if that
> > > > > > > entry is the first one in the list of memory regions, as we
> > > > > > > agreed here
> > > [2].
> > > > > >
> > > > > > Yes. I agree and follow this rule from then.
> > > > > >
> > > > > > Thanks,
> > > > > > Peng.
> > > > > >
> > > > > > >
> > > > > > > [1].
> > > > > > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3=
A
> > > > > > > %2F%25
> > > > > > > 2Fel
> > > > > > > ixir.b
> > > > > > >
> > > > >
> > >
> ootlin.com%2Flinux%2Fv5.11-rc3%2Fsource%2Fdrivers%2Fremoteproc%2Fre
> > > > > > >
> > > > >
> > >
> moteproc_core.c%23L321&amp;data=3D04%7C01%7Cpeng.fan%40nxp.com%7
> > > > > > >
> > > > >
> > >
> C581784529b1646b9d34b08d8b67ae8c7%7C686ea1d3bc2b4c6fa92cd99c5c
> > > > > > >
> > > > >
> > >
> 301635%7C0%7C0%7C637459986311799770%7CUnknown%7CTWFpbGZsb3
> > > > > > >
> > > > >
> > >
> d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
> > > > > > > %3D%7C1000&amp;sdata=3DQur6YiTWlak0ZRnrUZRzawfoO38EBrAIt
> qZ
> > > m66
> > > > > b4
> > > > > > > m20%3D&amp;reserved=3D0
> > > > > > > [2].
> > > > > > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3=
A
> > > > > > > %2F%25
> > > > > > > 2Fpa
> > > > > > > tch
> > > > > > >
> > > > >
> > >
> work.kernel.org%2Fproject%2Flinux-remoteproc%2Fpatch%2F202007221315
> > > > > > >
> > > > >
> > >
> 43.7024-1-peng.fan%40nxp.com%2F&amp;data=3D04%7C01%7Cpeng.fan%40n
> > > > > > >
> > > > >
> > >
> xp.com%7C581784529b1646b9d34b08d8b67ae8c7%7C686ea1d3bc2b4c6fa9
> > > > > > >
> > > > >
> > >
> 2cd99c5c301635%7C0%7C0%7C637459986311799770%7CUnknown%7CTW
> > > > > > >
> > > > >
> > >
> FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX
> > > > > > >
> > > > >
> > >
> VCI6Mn0%3D%7C1000&amp;sdata=3Db%2F8muWtb3yxKIsnXmKmRGYYV33%2
> > > > > > > FHjwA6a8x58geY7eE%3D&amp;reserved=3D0
> > > > > > >
> > > > > > > >  		err =3D of_address_to_resource(node, 0, &res);
> > > > > > > >  		if (err) {
> > > > > > > >  			dev_err(dev, "unable to resolve memory
> region\n");
> > > > > > > > --
> > > > > > > > 2.28.0
> > > > > > > >
