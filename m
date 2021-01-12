Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1216EC433E9
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Jan 2021 09:42:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCCEF23109
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Jan 2021 09:42:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbhALJmE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Jan 2021 04:42:04 -0500
Received: from mail-eopbgr10040.outbound.protection.outlook.com ([40.107.1.40]:19749
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726405AbhALJmE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Jan 2021 04:42:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rem9V9T9o38F5J+VVreE2Jm8bzbMu1pEmtfwQjXk04Ax5Z/vQqSpGr/HXRPsxtBt6ISrrlDwH9iWUiSzva/A4NgSms+p+mRZxOnfCT+YEqTc1rYp42mEdHowsO1fb2ZPthUZzxbiAsJ/xyNIn9ea/mAljMb4jAJbhbN6tFst90TpuJBdWoJJZACQbS6YMavsCLQ1PJ+kJkTpRvkCbaUnce8fJ0H4168tMGLWpkWuT8ZAWt36XjSYC9vhq+JdiD9JhG7Fh3tQIHgPLOxzY1v8m1LiqQ7IhJeiYd7Z5EochDXG/HIklQC3b9O0ZR6ZGV1B9wshxL9fJlK+7vDyDkt/Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uq2P/kWxPP01djnS+8PV2MqI9BRry6s6JT+T3JplBSo=;
 b=J9IW7fAL/bGxIiumzM21VzwsDvpBmZ6twB9TAcE5ZLJyxVmCzXK6mXFv0peVQ4nRbxieyxhY9Wl2selqCFtvz7L3LFf0BKDSMW0CZ7aifUJsb8UizP5bo/t9+e1Bg/ogXWYUO863G5sd4bTBZA9y9fl2jZeuQX0KKR9f9cfkG2DUYbKhyBG8o9m25D+o3YH7alCjQyqYbY0k/gTQh2sHwGiamI03E0IYbKboXmNw67RHa7/psxTr/qUMJeDLE/iCntrZY5OwCvtLCnFbzVQYeCFLTnRskpJCvNz0yvSRw15tIXr/jUowSZpzO9B5F9K31oj8OO5hLTSObNzvBQRtoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uq2P/kWxPP01djnS+8PV2MqI9BRry6s6JT+T3JplBSo=;
 b=nHu1fESXHyQY5MATi2GgHFIZ3qSzKYL/k6qCOE5MKoaHePbuAMdXhDnYmxh32wWKHyRMz86hH2Zq1KBkTy5KgA/RjZcr/zlPQVWXdvxbvOI50ngliszyKhhAA/k7CBXhvFfONUUOZkQKOKRhRVqxK1YwIb8PtYgmPbexQAbRPeY=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4089.eurprd04.prod.outlook.com (2603:10a6:5:1b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 09:41:12 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 09:41:12 +0000
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
Thread-Index: AQHW3Y8IMsfD4HQjaUqOo7Zl/WNCSKojDGiAgADFokA=
Date:   Tue, 12 Jan 2021 09:41:12 +0000
Message-ID: <DB6PR0402MB2760F6F982C32B6557467C9188AA0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20201229033019.25899-1-peng.fan@nxp.com>
 <20201229033019.25899-8-peng.fan@nxp.com> <20210111215023.GJ144935@xps15>
In-Reply-To: <20210111215023.GJ144935@xps15>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 56bd6a60-f00c-4037-b3e1-08d8b6de32df
x-ms-traffictypediagnostic: DB7PR04MB4089:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB4089649456DFBCE6E258609B88AA0@DB7PR04MB4089.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lvxUugbbzULk9ToXB9OINGJWZmbSctqMof67PjBOC19NocBGNPPZLFeL3piO+mfSd8S0FUf6cfUjBdTdXSSMNItigY0EVWcpERNpyyf+R79QwP/J4oioPbG9gyTKNNnlGVlWVKlSfQ9nEq1mFYRk6jZUOso801CKdTqGSPNDtfU9DP+Es6aysorzPXaNW8NLypo+5FA7v2TyQ9MBXOqRtg11YglScgSHFaTs0jYRlBMbztlHipTThhaVP3EH2I5TbS3ElndxB0q82ss7XFS+tu1kZAb33rtVRrpdCFnJiycemAMv2faB1UIA4a02DSyOJAycsT/xTSRWqpq40IcEdoS2eymAXFm4Fn9uq1wOO1Qg77pK+e0/Hc2Josq0mavWk2iK5x406BQJBWCfYsxAzPyfI5dohuf+4cqNULGN3XyMzhEF0X+oAYXYaqkTylRSsLuJ43l+2gABXjzRgxquQA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(8676002)(2906002)(71200400001)(54906003)(83380400001)(52536014)(7696005)(76116006)(7416002)(55016002)(966005)(66556008)(64756008)(498600001)(6916009)(33656002)(66446008)(45080400002)(186003)(66946007)(66476007)(86362001)(8936002)(4326008)(9686003)(26005)(44832011)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?yn7C1A5BkaMsJDiO8PyCp4V529A/xva1kdw1gUvCI01wIvdknuLu7FBFhrcF?=
 =?us-ascii?Q?cWM6g19GRQbjow8r07zryZaRAVdatBhLjyKxNGvOKadbp6eciMCQvtl2fT+V?=
 =?us-ascii?Q?M/dcovPqTC9XrZZL4Fxt5QKMc1/kC7ABNeeEBVWw51ZaaOBZFQHsB+X4EulM?=
 =?us-ascii?Q?uS+Omua9bgCZeGhUrh18nQW1cIpqVm18F5zRuCpH2TA+XFpbgqkd5FaFP/GY?=
 =?us-ascii?Q?Gujp3+4wNBfwCKvGfMfDt1pjNKwN2rseDTZx5HK+wpXtfJCMunSr6a7vVxcV?=
 =?us-ascii?Q?1yjgVKyg/Y9z04HMCJaLzACr9PIcYyURkFlit6TO2E0fQF5UPLmzyQ6eAmti?=
 =?us-ascii?Q?LpgfICN4IdKp4Yn9OHnRX8Da/nmw8UAxDkZG9z5VXw5JpYfn4DJZOqYl+CFi?=
 =?us-ascii?Q?Fv+KvHBUZomNPwM7fLt6XYXaVJU9wxCT48KK7tbSXVhbTnqH5eKFX76APmAv?=
 =?us-ascii?Q?ARxVtXfO24cjiCt37XXzSMjIpu/s1jbdMvqnRv/0mgmSyojwN25W/jLxheTs?=
 =?us-ascii?Q?HAVlZB3WV1Xr0ERNZAhPf5Z07QNEANzUNO/N6wJpSLLNIQX5m7Sz6I18eN3g?=
 =?us-ascii?Q?+s7/XwYp2T0U9tiXTqC+vl4Htv2mRXACc0VXUcaHbPJDsLsfBrvXX2qfzInm?=
 =?us-ascii?Q?J/NX+UnGquhiaw9Dyz05puoTkOqrm3ShixCOYyVc4m/u1xZzuNpdLY4Rked/?=
 =?us-ascii?Q?8vynikR/n/j5dBtXb7HBzagK72QAsD1wndr/kK6uIS+EGfClsoTD3zLq/PfC?=
 =?us-ascii?Q?w5CveBTAlR98QYgUvmsDvqwg1ShjKaiViPPGZP3bDQdzKkKXB9nMqW/Q1V9O?=
 =?us-ascii?Q?F1Ye6I5m7vY6qxEne7LhpJMbty8CnLbQ3q+qL60C/4ioZpyAqUIGlMmY/3vX?=
 =?us-ascii?Q?kL2Ep6DTAlK9w4kKebaxunSqBdrEPq5RPg9+iily1OzDd1fc6DYtWz6tqMz5?=
 =?us-ascii?Q?DwLVN+nxa9noMS3IJSUAr8dJGTqVMFZdwLMjbo7t13s=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56bd6a60-f00c-4037-b3e1-08d8b6de32df
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 09:41:12.4132
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AZLqx1Dem83RWPw/Dl7AQg137D6XdgdI5GbzRR1gxxqgFKqAxgaZUGQXyqOJbvqdsgVndA9pOnjB6wdQZBU5gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4089
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: Re: [PATCH V5 7/8] remoteproc: imx_rproc: ignore mapping vdev
> regions
>=20
> On Tue, Dec 29, 2020 at 11:30:18AM +0800, peng.fan@nxp.com wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > vdev regions are vdev0vring0, vdev0vring1, vdevbuffer and similar.
> > They are handled by remoteproc common code, no need to map in imx
> > rproc driver.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index f80428afb8a7..e62a53ee128e
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -417,6 +417,9 @@ static int imx_rproc_addr_init(struct imx_rproc
> *priv,
> >  		struct resource res;
> >
> >  		node =3D of_parse_phandle(np, "memory-region", a);
> > +		/* Not map vdev region */
> > +		if (!strcmp(node->name, "vdev"))
> > +			continue;
>=20
> I am very confused and because I don't see an example for the DT in the
> bindings document I have to guess what is going on.

V6 will include the DT yaml.

>=20
> So I am guessing that you have laid out the memory regions for the vrings=
 and
> the vdev0buffer in the DT "memory-region".

The dts part will be similar as following:

+    #include <dt-bindings/clock/imx8mm-clock.h>
+    rsc_table: rsc_table@550ff000 {
+      no-map;
+      reg =3D <0x550ff000 0x1000>;
+    };
+
+    vdev0vring0: vdev0vring0@55000000 {
+      no-map;
+      reg =3D <0x55000000 0x8000>;
+    };
+
+    vdev0vring1: vdev0vring1@55008000 {
+      reg =3D <0x55008000 0x8000>;
+      no-map;
+    };
+
+    vdevbuffer: vdevbuffer@55400000 {
+      compatible =3D "shared-dma-pool";
+      reg =3D <0x55400000 0x100000>;
+      no-map;
+    };
+
+    imx8mm-cm4 {
+      compatible =3D "fsl,imx8mm-cm4";
+      clocks =3D <&clk IMX8MM_CLK_M4_DIV>;
+      mbox-names =3D "tx", "rx", "rxdb";
+      mboxes =3D <&mu 0 1
+                &mu 1 1
+                &mu 3 1>;
+      memory-region =3D <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>, <&r=
sc_table>;
+      syscon =3D <&src>;
+    };

>=20
> For the vrings I don't see the allocation of a carveout, which means that=
 you
> will take the memory out of the DMA pool and the reserve memory will be
> wasted.

imx_rproc_parse_memory_regions will alloc carveout.

>=20
> For the vdev0buffer, what you have will work *only* if that entry is the =
first
> one in the list of memory regions, as we agreed here [2].

Yes. I agree and follow this rule from then.

Thanks,
Peng.

>=20
> [1].
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Felixi=
r.b
> ootlin.com%2Flinux%2Fv5.11-rc3%2Fsource%2Fdrivers%2Fremoteproc%2Fre
> moteproc_core.c%23L321&amp;data=3D04%7C01%7Cpeng.fan%40nxp.com%7
> C581784529b1646b9d34b08d8b67ae8c7%7C686ea1d3bc2b4c6fa92cd99c5c
> 301635%7C0%7C0%7C637459986311799770%7CUnknown%7CTWFpbGZsb3
> d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
> %3D%7C1000&amp;sdata=3DQur6YiTWlak0ZRnrUZRzawfoO38EBrAItqZm66b4
> m20%3D&amp;reserved=3D0
> [2].
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch
> work.kernel.org%2Fproject%2Flinux-remoteproc%2Fpatch%2F202007221315
> 43.7024-1-peng.fan%40nxp.com%2F&amp;data=3D04%7C01%7Cpeng.fan%40n
> xp.com%7C581784529b1646b9d34b08d8b67ae8c7%7C686ea1d3bc2b4c6fa9
> 2cd99c5c301635%7C0%7C0%7C637459986311799770%7CUnknown%7CTW
> FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX
> VCI6Mn0%3D%7C1000&amp;sdata=3Db%2F8muWtb3yxKIsnXmKmRGYYV33%2
> FHjwA6a8x58geY7eE%3D&amp;reserved=3D0
>=20
> >  		err =3D of_address_to_resource(node, 0, &res);
> >  		if (err) {
> >  			dev_err(dev, "unable to resolve memory region\n");
> > --
> > 2.28.0
> >
