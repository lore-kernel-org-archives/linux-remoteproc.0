Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B765BC433DB
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Jan 2021 02:21:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78F84230FC
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Jan 2021 02:21:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727635AbhAMCU5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Jan 2021 21:20:57 -0500
Received: from mail-eopbgr00061.outbound.protection.outlook.com ([40.107.0.61]:16453
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727559AbhAMCU5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Jan 2021 21:20:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4vrs/lWPJA6sEozeqq2q5qn9TC0HxCvQC1KF+DGysicaSfnjgzdbuhpevKMmRKxaGzLYZSo+lJv1P5htG8eBXy5FZZwco4SGJY30Pw087BIu9uUXuYqGRVTJtuw8SaX5hdCZGWMPrkQnWWxPPEGN+k1JTQrUo1S+STL903sGUI6a80oB81Mz0cOvRT12K/DOmVioZt2Fja1+PpZfKgUAUnjlaYPceRmK9xJrwMN58LTwboncnwckssoxrQbxeEMcz1HWNU/a3DyVOjLOsj+oFvLJVxIYUD7GMeViO7xN7lah3KJbUJvLTt6R+g41y8gitZKVvMuWv7BppXQDgUb8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vWbx1YTqMWWGTmiDsNUx2y2TkazctAWAnuA2VN/LGs=;
 b=H8TzU2hrYQVu3N/TKdMimqHDv1nqWtpbptQoDYwauolbSmUgFie862gHuTaoyjrHaICb21LHG/Ll7Y9y41N51/mw2RsteudlCHkHROR+S7o8goCDwB3u3rkO8BJBcuD77phMTW8W7lclmxDQYyQbuVPtxLo/liASoLm4jvfvJwIPw4ez8D7i2/VbZKGmZIqAcE8U6sjJTwWuEGY/MG8eQ+H1U0ZjC9VDVmF10LpjbmG6gw+UsF71bi59wtagiswXrhGxEZ7pXEpwNyDvZ9ARWHMUFABUPRNQp/YJw8CxnYLWqt3UTIYTF2C0YQOzwX0jnzWB/rt2xEeTxiRg1dNqYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vWbx1YTqMWWGTmiDsNUx2y2TkazctAWAnuA2VN/LGs=;
 b=sFXHqFD1kjVypUBBJTi33oNZ/o+BmZ3yeAiw+RhlxzkhKa1LqrB+c2EuMb67jGHG18udV9eyFQvBMDeUZjid9AkEhQg7bCVnEMnUEgP15FQpEvJ+XysWxurVv6u5x5r/Cx3qgUk3W0WDiF8OAlYdAKSny5DbmL/hF2wLoNNonBc=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR04MB3127.eurprd04.prod.outlook.com (2603:10a6:6:c::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.12; Wed, 13 Jan 2021 02:19:32 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3742.012; Wed, 13 Jan 2021
 02:19:32 +0000
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
Thread-Index: AQHW3Y8IMsfD4HQjaUqOo7Zl/WNCSKojDGiAgADFokCAAJlRgIAAfjgw
Date:   Wed, 13 Jan 2021 02:19:32 +0000
Message-ID: <DB6PR0402MB27602E812FD657F7EC81854F88A90@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20201229033019.25899-1-peng.fan@nxp.com>
 <20201229033019.25899-8-peng.fan@nxp.com> <20210111215023.GJ144935@xps15>
 <DB6PR0402MB2760F6F982C32B6557467C9188AA0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <20210112184629.GA186830@xps15>
In-Reply-To: <20210112184629.GA186830@xps15>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 54d80d28-ef39-478e-87dd-08d8b769a9e8
x-ms-traffictypediagnostic: DB6PR04MB3127:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR04MB3127B5659279E4ABB975EE5488A90@DB6PR04MB3127.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b4zPJc0IOXL1oKR83k0dsSbGPOh3dA6oyQy6w+9GQBPpfQsS38ziGWk16+T7wXX/P2wkX2TSJe+pJKxosP2P5t7zfbRkepjV9jckqLRYj5GCR5N67ZBshNZPds9/m8kx+hRruByt0Oi/onQf5HkWhevJHi7K/h+BWTW/yEEdUydD6pNJ3lZl35+jdmlqd8kcXzzkVj9AgttIGKM78tY2BGzxxtMlBRMNPjeibGDpdoVKfj9BvpmLQnDgF5ey4/BYCFdWb7WLf73LCZ85owXhSGBFGvvt5cC0Tkp2XCHA74ZxdxsGB5b1AdD359ZALa4iFoBQYVpDrECz+5qeOq2eOH0r2aycCSOg+dtWokzxy54lfgpl2mUNTvRBT9qAesLoDOiH9EOApvIi34KLua3jiPWuc31XUiSmfb+vlIukE67WueqnFuNBLa7rmQXQ8RmV5OfiwGf7ZmizBnjoszUlug==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(8676002)(2906002)(44832011)(186003)(66556008)(4326008)(7416002)(6506007)(33656002)(26005)(83380400001)(9686003)(86362001)(71200400001)(5660300002)(52536014)(54906003)(316002)(66946007)(966005)(64756008)(55016002)(6916009)(76116006)(45080400002)(66446008)(7696005)(8936002)(66476007)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?8qrr1XMnEGbmPAdSCkIYjV2GTUYeWyR9nUopogUISpje7yAFF++7evLFKVDk?=
 =?us-ascii?Q?8PTn7KH4BP96Ut7khrMLBFr6VVEpXK2wAZpiQEJod9RveZneqxNowYpvULI4?=
 =?us-ascii?Q?aAPsC7+y6i3RPTfzo4MZLUQH508DJh6+3wEQ024leuVN1Xj9mvv+VKXRwn8H?=
 =?us-ascii?Q?7qSe9afvp5VvHw7oNIuwZwSMxPnfS/McmcWxojY8XzLoFK0dMCm09o3sQ182?=
 =?us-ascii?Q?tnZpEwMQW2ZtQuwd+qMEW9ju0nyl+tg7qfCJ5+LNgn7gt7LkwZln01dMPqon?=
 =?us-ascii?Q?3JtCkoUhPBlAmfVSzWBbTFQPDD6LpTT7gtpQMpCMQbYYEIkFIEjT5eLJEuXe?=
 =?us-ascii?Q?S6KC33y112Er1IRrptZIJx2oGZN7rWWDl/z2KPEm673ynQ+ba0YvSxea+wu2?=
 =?us-ascii?Q?3pz56wHSnN49pt03W7Fk7ELi1ITvq5F4UQ4mVM+afQAxb8YG+99PVggf1UIG?=
 =?us-ascii?Q?ZYDw96tpa8gCg8xMqEZIcGQESAVBPvzWHpUvbHp70LcR1Dfsx9zzx48Qk9FZ?=
 =?us-ascii?Q?uYce09jDuYTSKR9Ff48iXVeCKAyPjY1fsrLKrGUYvCdfp98o0VAzkDdOulpE?=
 =?us-ascii?Q?Qux6lus0HTrMp11InF2e2pJRiueLgva3VnHBPvY4yR/nATE5ZYayUcn1RpG2?=
 =?us-ascii?Q?jWqT+ZbnZmvjEON2Xf1gRt9T0BEwGlz1cTyx+UIFQbALGUxXr3rrUmqEJ/YR?=
 =?us-ascii?Q?jx/Zc8fe/o6QQBvH2gq9FdS5+XUmXpcILRJ3910SQ2XHPAQh4ouHmxd/+/ll?=
 =?us-ascii?Q?ZxpR9kHg3P1zFPxKT9WrSPTLj2+JXOdayWimKBpKvUsd7Kj2SPcs/JYPHcll?=
 =?us-ascii?Q?7VWZhobAQwSBRq8u22v82dQ4ovLLRPn64PxGzO8N5BF+XrUNxGVvcTkrBhUp?=
 =?us-ascii?Q?enChspspW0i05Oq35zhttNMenBY0zyLY+2NvBOMf3XuXbon834oOivE/iKWU?=
 =?us-ascii?Q?3YvFkCNJWpvn1He+0lFi2rD9mr5ubKmBvKxWqF0WRnc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d80d28-ef39-478e-87dd-08d8b769a9e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2021 02:19:32.1293
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fr4GIsKIJ1Yl+7PpaBZ5dPDpu5tkXpeqBbv2HnieMqqXAEfdu4v/be9RQ08SRMlSkLeWK44sL7DOmWvDYziJtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3127
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: Re: [PATCH V5 7/8] remoteproc: imx_rproc: ignore mapping vdev
> regions
>=20
> On Tue, Jan 12, 2021 at 09:41:12AM +0000, Peng Fan wrote:
> > > Subject: Re: [PATCH V5 7/8] remoteproc: imx_rproc: ignore mapping
> > > vdev regions
> > >
> > > On Tue, Dec 29, 2020 at 11:30:18AM +0800, peng.fan@nxp.com wrote:
> > > > From: Peng Fan <peng.fan@nxp.com>
> > > >
> > > > vdev regions are vdev0vring0, vdev0vring1, vdevbuffer and similar.
> > > > They are handled by remoteproc common code, no need to map in imx
> > > > rproc driver.
> > > >
> > > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > > ---
> > > >  drivers/remoteproc/imx_rproc.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/drivers/remoteproc/imx_rproc.c
> > > > b/drivers/remoteproc/imx_rproc.c index f80428afb8a7..e62a53ee128e
> > > > 100644
> > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > @@ -417,6 +417,9 @@ static int imx_rproc_addr_init(struct
> > > > imx_rproc
> > > *priv,
> > > >  		struct resource res;
> > > >
> > > >  		node =3D of_parse_phandle(np, "memory-region", a);
> > > > +		/* Not map vdev region */
> > > > +		if (!strcmp(node->name, "vdev"))
> > > > +			continue;
> > >
> > > I am very confused and because I don't see an example for the DT in
> > > the bindings document I have to guess what is going on.
> >
> > V6 will include the DT yaml.
> >
> > >
> > > So I am guessing that you have laid out the memory regions for the
> > > vrings and the vdev0buffer in the DT "memory-region".
> >
> > The dts part will be similar as following:
> >
> > +    #include <dt-bindings/clock/imx8mm-clock.h>
> > +    rsc_table: rsc_table@550ff000 {
> > +      no-map;
> > +      reg =3D <0x550ff000 0x1000>;
> > +    };
> > +
> > +    vdev0vring0: vdev0vring0@55000000 {
> > +      no-map;
> > +      reg =3D <0x55000000 0x8000>;
> > +    };
> > +
> > +    vdev0vring1: vdev0vring1@55008000 {
> > +      reg =3D <0x55008000 0x8000>;
> > +      no-map;
> > +    };
> > +
> > +    vdevbuffer: vdevbuffer@55400000 {
> > +      compatible =3D "shared-dma-pool";
> > +      reg =3D <0x55400000 0x100000>;
> > +      no-map;
> > +    };
> > +
> > +    imx8mm-cm4 {
> > +      compatible =3D "fsl,imx8mm-cm4";
> > +      clocks =3D <&clk IMX8MM_CLK_M4_DIV>;
> > +      mbox-names =3D "tx", "rx", "rxdb";
> > +      mboxes =3D <&mu 0 1
> > +                &mu 1 1
> > +                &mu 3 1>;
> > +      memory-region =3D <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> <&rsc_table>;
> > +      syscon =3D <&src>;
> > +    };
> >
> > >
> > > For the vrings I don't see the allocation of a carveout, which means
> > > that you will take the memory out of the DMA pool and the reserve
> > > memory will be wasted.
> >
> > imx_rproc_parse_memory_regions will alloc carveout.
>=20
> They _will_ but for now they don't and as such there a discrepancy betwee=
n
> the bindings and the code that was published in V6.  At this point you ca=
n
> either drop the vrings in the DT or send another revision with the carveo=
uts
> allocated.  I would definitely prefer the latter because it wouldn't invo=
lve yet
> another modification of the bindings.

You mean I drop patch v5 7/8 and send v7, right?

Or are there other changes that I need to do?

Thanks,
Peng.

>=20
> >
> > >
> > > For the vdev0buffer, what you have will work *only* if that entry is
> > > the first one in the list of memory regions, as we agreed here [2].
> >
> > Yes. I agree and follow this rule from then.
> >
> > Thanks,
> > Peng.
> >
> > >
> > > [1].
> > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fe=
l
> > > ixir.b
> > >
> ootlin.com%2Flinux%2Fv5.11-rc3%2Fsource%2Fdrivers%2Fremoteproc%2Fre
> > >
> moteproc_core.c%23L321&amp;data=3D04%7C01%7Cpeng.fan%40nxp.com%7
> > >
> C581784529b1646b9d34b08d8b67ae8c7%7C686ea1d3bc2b4c6fa92cd99c5c
> > >
> 301635%7C0%7C0%7C637459986311799770%7CUnknown%7CTWFpbGZsb3
> > >
> d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
> > > %3D%7C1000&amp;sdata=3DQur6YiTWlak0ZRnrUZRzawfoO38EBrAItqZm66
> b4
> > > m20%3D&amp;reserved=3D0
> > > [2].
> > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fp=
a
> > > tch
> > >
> work.kernel.org%2Fproject%2Flinux-remoteproc%2Fpatch%2F202007221315
> > >
> 43.7024-1-peng.fan%40nxp.com%2F&amp;data=3D04%7C01%7Cpeng.fan%40n
> > >
> xp.com%7C581784529b1646b9d34b08d8b67ae8c7%7C686ea1d3bc2b4c6fa9
> > >
> 2cd99c5c301635%7C0%7C0%7C637459986311799770%7CUnknown%7CTW
> > >
> FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX
> > >
> VCI6Mn0%3D%7C1000&amp;sdata=3Db%2F8muWtb3yxKIsnXmKmRGYYV33%2
> > > FHjwA6a8x58geY7eE%3D&amp;reserved=3D0
> > >
> > > >  		err =3D of_address_to_resource(node, 0, &res);
> > > >  		if (err) {
> > > >  			dev_err(dev, "unable to resolve memory region\n");
> > > > --
> > > > 2.28.0
> > > >
