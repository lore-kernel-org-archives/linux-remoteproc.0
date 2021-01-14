Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09EA7C433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Jan 2021 09:53:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC76F239EB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Jan 2021 09:53:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727883AbhANJxG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 Jan 2021 04:53:06 -0500
Received: from mail-am6eur05on2063.outbound.protection.outlook.com ([40.107.22.63]:28096
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727174AbhANJxE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 Jan 2021 04:53:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwGw4F6fbcOXrmdho7pgOMaUOW/KDy6mvpgSRisVBwhWNEdP8kzXzdBtnHIDqa40u9zsiudqtBrpb0Q78cNpz/jAOLZjm7tU7H/gsIwY9ajTOv7asM4vei6vuo8z3z+bAF2CwdpKFWVXydaMvltTucbP41c2ZhFGAD3dpj51di7g1xtMOai3aT82NR8I2E7xs+6e8ClHMMziNW3rJxusSFWdIxnHJ0jg9npX946XEWiklshS/NeYG3+TDd6xrwHEFTuDYP2030VYnommxknaSDzCe4Xzhq2fRQ4DkDgfxW8Nr4A3DFCQWU28sRlY6pQLR+E1UouX5YowMXA7AcgzCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKYsEXcl/ly9IgyHaZIRtJN46Btcypi0PncifOm2sW8=;
 b=VYhjl01pYr433nWMsUrZfFuOzheNB82reQg5E8t2ZAXN2aQc0fxUZWvwT2cTR4irmJ5oRH0bhIR7/2P1pBVv80hHOqIBwQYdiPkN5K2DHMoVYdoeX9+Oz7XwufEjV5acrI8Fw6RxmZthXF8JERQtI8xzEIInM+SGtA5ahj9pCRlYFwwJt0nxn6m2BDngXSyseol/QmuwWO5qJfRJ2+jz604Uob98ONPNjP9LI2OiRLA+uOTU3XBb8Poc/CqzOqKVoQz1fUbaOOayOfvNijNJbySgMphlMPMQMSBwIVXo7+frnGlqE4SH5t1iKX+VNsoA/re3txsD6fwR89bD5OVxsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKYsEXcl/ly9IgyHaZIRtJN46Btcypi0PncifOm2sW8=;
 b=dWEWjq5bB6Ci68WlDen2mzK0KNTPXyOW17BoRGuMP3/HzYOgoOD+ZC2CMbAvyRWzQfcXt7pDod7slTznSo23Lx6KV1m0J+yn0429X0Lk3QEzYC5pZKfl0wqn5ot5emEuAI1z/bQLfJBY9uEiEKONPelwCbtKUDpA3rwoFKojrBI=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5466.eurprd04.prod.outlook.com (2603:10a6:10:8a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 14 Jan
 2021 09:52:14 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 09:52:13 +0000
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
Thread-Index: AQHW3Y8IMsfD4HQjaUqOo7Zl/WNCSKojDGiAgADFokCAAJlRgIAAfjgwgADqeYCAASYtMA==
Date:   Thu, 14 Jan 2021 09:52:13 +0000
Message-ID: <DB6PR0402MB276015A108C846FA77A6E05388A80@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20201229033019.25899-1-peng.fan@nxp.com>
 <20201229033019.25899-8-peng.fan@nxp.com> <20210111215023.GJ144935@xps15>
 <DB6PR0402MB2760F6F982C32B6557467C9188AA0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <20210112184629.GA186830@xps15>
 <DB6PR0402MB27602E812FD657F7EC81854F88A90@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <20210113161727.GA213180@xps15>
In-Reply-To: <20210113161727.GA213180@xps15>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 86be8a2c-9c56-4be2-708f-08d8b87211ea
x-ms-traffictypediagnostic: DB7PR04MB5466:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB5466B821BDF546A3112C416188A80@DB7PR04MB5466.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6B4MnNq9pkgEUrsWFnXKDcf+hKXMx4McpliXKvI7hz4c3ZQ0/HnDVwnwEqpcB2vrDVC7xXx1bVKjBiTqgHUQD7Q9H9NVAa3qmS/zBRZwExGxIwNnCO13cY4ITNCwOp7N9Vd2DSieh89SF0jDN2SUbO9qwYV0vLwD5ByAxEsOqThFldiuA2fggFe4SNPPKU9KOrrOi1VR26v7lkHU4cf5+AtwbDZ3Br1X9DB/o9fB14YCtltGZbRSYw8deK4Blr8UmZ/oKts7++T6gBF0o7h0NxR8uMeXWxL3GJdg1jtbvepcRcNw67tfD9/WCVothH22ww/42NUPCz0I7RxKUVWtcudXVrHDz9GyXfYnfs3UHS8c8GwXQu/YMk9ET/jCBNrjjaFy2C1bl+5rjukSep3RzPIjZ99ychH27H1npemz+aYx3kQrD1V/XbacgD/cGSYj9wLgKKiiTHBN2n2ofdZEDw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(966005)(76116006)(71200400001)(54906003)(66556008)(478600001)(66476007)(45080400002)(316002)(64756008)(86362001)(2906002)(9686003)(66446008)(7416002)(66946007)(186003)(55016002)(26005)(4326008)(5660300002)(33656002)(44832011)(6506007)(8936002)(83380400001)(8676002)(52536014)(6916009)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?WTk1pyCtvebxwXa10FAVtFhIc5z1y+azm0dnHEl2WH+eyLo8GyFsbR1iMQd2?=
 =?us-ascii?Q?lFs5kwSTL50tBuUcU/XVsbMAabJMwDyxMr8QpjnMpW5IPiP6hykS3RV9deQe?=
 =?us-ascii?Q?rxGM6wBGGuXzs8QTrGg8PNwNEe+kxQes4yhiEG84Sn7v6dfz91+oXkl2xv27?=
 =?us-ascii?Q?9xrIxI0VEKifdeJHBBCxYpfnJnX6jYatHBZJZton5NIQbFjZdYshlxVc7Q9y?=
 =?us-ascii?Q?0RmzDvcvuqLYQsAHD9VHfpLwl6U8hu8f1teCT4lqubaknVUq+hmHLKRYJWkC?=
 =?us-ascii?Q?IeM/61T/uCK8GXE3THTYTEdJcomyFqNvNC7GT96SLgvVv+qem7Z4oKozHvVb?=
 =?us-ascii?Q?uwFI29TuKLwLpoRV+lIF/3sKE3pz8CkW4jGMFTR9cQRSVVy0uGhNmdKZpNyA?=
 =?us-ascii?Q?O6mIlRDjQmyQlt2KqAUgfPWSNrPwCAhEaCTe4eaDJkxcm+alPOpdUJi5ph8+?=
 =?us-ascii?Q?gbpVFu7Qf+g7uJIGy5uHBGsIyt0CGyHxWowGhAQ4sc1fEpmwGn9rWBLp7EzH?=
 =?us-ascii?Q?fIt7MokJg7GbUTageFBAymXfrutNPHtsRsVB+vhpi43Cj8k9hkshN0XZC9jW?=
 =?us-ascii?Q?iqRPQaP2JfntHLSs+mVqDyiS+sBzq3PFe9IWTpQ3YiORTwpJbUMS7KCt1LJA?=
 =?us-ascii?Q?tQAFYY8IaYSD7OEbq7IeShDHBaKVcy8rTUuU7E8ji46DN0ScpNUL4XUUJlCj?=
 =?us-ascii?Q?ITuFyUS3jpX0SuNfLhMqKtpnPzG24bjVP1XSoHnOV6sPjrgsQ9yNARfj+V/4?=
 =?us-ascii?Q?x8KnEtGfb2K0djijQkCdIAutJAUAgEs85a6m4DPWn7ThIcHChVGsGo7/gtGb?=
 =?us-ascii?Q?IRa3i/S/+eG2vEkIkNDDoXLRShyto2fTL5ne/X4PkuwoI6zYxYUPMDcwHA3j?=
 =?us-ascii?Q?QF5GyiYCAfkpaNdXDbKlIyp0svePeyyzQyu4CpBVxLhCG0bX6cItZggjFef/?=
 =?us-ascii?Q?bRwMJhHNm9unUzF6AVv9bkDCgcGpH9PVPwsgQYn9ydc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86be8a2c-9c56-4be2-708f-08d8b87211ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2021 09:52:13.8714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cdk4U3Mmj1VTmQfCUoZXfe3uyrTtqrW0VAj9076aujkUZJRWVYsQ7fGqaa7R7+7QqFaeJPuz4bNbzv4zcvL7Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5466
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: Re: [PATCH V5 7/8] remoteproc: imx_rproc: ignore mapping vdev
> regions
>=20
> On Wed, Jan 13, 2021 at 02:19:32AM +0000, Peng Fan wrote:
> > > Subject: Re: [PATCH V5 7/8] remoteproc: imx_rproc: ignore mapping
> > > vdev regions
> > >
> > > On Tue, Jan 12, 2021 at 09:41:12AM +0000, Peng Fan wrote:
> > > > > Subject: Re: [PATCH V5 7/8] remoteproc: imx_rproc: ignore
> > > > > mapping vdev regions
> > > > >
> > > > > On Tue, Dec 29, 2020 at 11:30:18AM +0800, peng.fan@nxp.com
> wrote:
> > > > > > From: Peng Fan <peng.fan@nxp.com>
> > > > > >
> > > > > > vdev regions are vdev0vring0, vdev0vring1, vdevbuffer and simil=
ar.
> > > > > > They are handled by remoteproc common code, no need to map in
> > > > > > imx rproc driver.
> > > > > >
> > > > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > > > ---
> > > > > >  drivers/remoteproc/imx_rproc.c | 3 +++
> > > > > >  1 file changed, 3 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/remoteproc/imx_rproc.c
> > > > > > b/drivers/remoteproc/imx_rproc.c index
> > > > > > f80428afb8a7..e62a53ee128e
> > > > > > 100644
> > > > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > > > @@ -417,6 +417,9 @@ static int imx_rproc_addr_init(struct
> > > > > > imx_rproc
> > > > > *priv,
> > > > > >  		struct resource res;
> > > > > >
> > > > > >  		node =3D of_parse_phandle(np, "memory-region", a);
> > > > > > +		/* Not map vdev region */
> > > > > > +		if (!strcmp(node->name, "vdev"))
> > > > > > +			continue;
> > > > >
> > > > > I am very confused and because I don't see an example for the DT
> > > > > in the bindings document I have to guess what is going on.
> > > >
> > > > V6 will include the DT yaml.
> > > >
> > > > >
> > > > > So I am guessing that you have laid out the memory regions for
> > > > > the vrings and the vdev0buffer in the DT "memory-region".
> > > >
> > > > The dts part will be similar as following:
> > > >
> > > > +    #include <dt-bindings/clock/imx8mm-clock.h>
> > > > +    rsc_table: rsc_table@550ff000 {
> > > > +      no-map;
> > > > +      reg =3D <0x550ff000 0x1000>;
> > > > +    };
> > > > +
> > > > +    vdev0vring0: vdev0vring0@55000000 {
> > > > +      no-map;
> > > > +      reg =3D <0x55000000 0x8000>;
> > > > +    };
> > > > +
> > > > +    vdev0vring1: vdev0vring1@55008000 {
> > > > +      reg =3D <0x55008000 0x8000>;
> > > > +      no-map;
> > > > +    };
> > > > +
> > > > +    vdevbuffer: vdevbuffer@55400000 {
> > > > +      compatible =3D "shared-dma-pool";
> > > > +      reg =3D <0x55400000 0x100000>;
> > > > +      no-map;
> > > > +    };
> > > > +
> > > > +    imx8mm-cm4 {
> > > > +      compatible =3D "fsl,imx8mm-cm4";
> > > > +      clocks =3D <&clk IMX8MM_CLK_M4_DIV>;
> > > > +      mbox-names =3D "tx", "rx", "rxdb";
> > > > +      mboxes =3D <&mu 0 1
> > > > +                &mu 1 1
> > > > +                &mu 3 1>;
> > > > +      memory-region =3D <&vdevbuffer>, <&vdev0vring0>,
> > > > + <&vdev0vring1>,
> > > <&rsc_table>;
> > > > +      syscon =3D <&src>;
> > > > +    };
> > > >
> > > > >
> > > > > For the vrings I don't see the allocation of a carveout, which
> > > > > means that you will take the memory out of the DMA pool and the
> > > > > reserve memory will be wasted.
> > > >
> > > > imx_rproc_parse_memory_regions will alloc carveout.
> > >
> > > They _will_ but for now they don't and as such there a discrepancy
> > > between the bindings and the code that was published in V6.  At this
> > > point you can either drop the vrings in the DT or send another
> > > revision with the carveouts allocated.  I would definitely prefer
> > > the latter because it wouldn't involve yet another modification of th=
e
> bindings.
> >
> > You mean I drop patch v5 7/8 and send v7, right?
> >
>=20
> If you do that than the implementation won't reflect the bindings.
>=20
> > Or are there other changes that I need to do?
>=20
> If you want to keep the bindings the same way you have them in V6,
> carveouts are required in the implementation.

ok. Could you share more info about carveouts are required?
imx_rproc_parse_memory_regions in my pachset already have
rproc_add_carveout. I am not clear what else needs to be done.

Thanks,
Peng.

>=20
> >
> > Thanks,
> > Peng.
> >
> > >
> > > >
> > > > >
> > > > > For the vdev0buffer, what you have will work *only* if that
> > > > > entry is the first one in the list of memory regions, as we agree=
d here
> [2].
> > > >
> > > > Yes. I agree and follow this rule from then.
> > > >
> > > > Thanks,
> > > > Peng.
> > > >
> > > > >
> > > > > [1].
> > > > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%
> > > > > 2Fel
> > > > > ixir.b
> > > > >
> > >
> ootlin.com%2Flinux%2Fv5.11-rc3%2Fsource%2Fdrivers%2Fremoteproc%2Fre
> > > > >
> > >
> moteproc_core.c%23L321&amp;data=3D04%7C01%7Cpeng.fan%40nxp.com%7
> > > > >
> > >
> C581784529b1646b9d34b08d8b67ae8c7%7C686ea1d3bc2b4c6fa92cd99c5c
> > > > >
> > >
> 301635%7C0%7C0%7C637459986311799770%7CUnknown%7CTWFpbGZsb3
> > > > >
> > >
> d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
> > > > > %3D%7C1000&amp;sdata=3DQur6YiTWlak0ZRnrUZRzawfoO38EBrAItqZ
> m66
> > > b4
> > > > > m20%3D&amp;reserved=3D0
> > > > > [2].
> > > > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%
> > > > > 2Fpa
> > > > > tch
> > > > >
> > >
> work.kernel.org%2Fproject%2Flinux-remoteproc%2Fpatch%2F202007221315
> > > > >
> > >
> 43.7024-1-peng.fan%40nxp.com%2F&amp;data=3D04%7C01%7Cpeng.fan%40n
> > > > >
> > >
> xp.com%7C581784529b1646b9d34b08d8b67ae8c7%7C686ea1d3bc2b4c6fa9
> > > > >
> > >
> 2cd99c5c301635%7C0%7C0%7C637459986311799770%7CUnknown%7CTW
> > > > >
> > >
> FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX
> > > > >
> > >
> VCI6Mn0%3D%7C1000&amp;sdata=3Db%2F8muWtb3yxKIsnXmKmRGYYV33%2
> > > > > FHjwA6a8x58geY7eE%3D&amp;reserved=3D0
> > > > >
> > > > > >  		err =3D of_address_to_resource(node, 0, &res);
> > > > > >  		if (err) {
> > > > > >  			dev_err(dev, "unable to resolve memory region\n");
> > > > > > --
> > > > > > 2.28.0
> > > > > >
