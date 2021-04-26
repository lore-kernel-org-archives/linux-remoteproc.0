Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F82CC433ED
	for <linux-remoteproc@archiver.kernel.org>; Mon, 26 Apr 2021 23:45:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12DB861001
	for <linux-remoteproc@archiver.kernel.org>; Mon, 26 Apr 2021 23:45:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234474AbhDZXqf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 26 Apr 2021 19:46:35 -0400
Received: from mail-eopbgr30076.outbound.protection.outlook.com ([40.107.3.76]:49096
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234275AbhDZXqf (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 26 Apr 2021 19:46:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEqReX12HApyyvzgz3mkMYzGrxMlXEhThucCVPlMLG3T/2cU2eRe2QofLBi1H8A8kfPAA7Lu2TFrMMGhe4bbt9QpYWQ9saGddHmHgXOgwldKJsRQ8gaK2pkS9ONcN/B3yKUYOLHQ8+MPIYZLa/NGpfkQoHv9tFYpp7XUF+PYxGo0GDYBPG5/fuYDkvKtgKiErIQCquxsyhx2B+78rlwXgCY1Swt4iIJ2ulcPUqNNqNIPVuPfzBkNswaHDEkCJ5Ecf+ArwtGupvsXxxtEhBKcLlUlHoC4EGwIy3B8NKjf9bc/bGVuz0W+n837bK2A94LRUPfmvPa/yCXTtpTjhnWOCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yCDHAawEPvy/KpykNSFz+lkrccadA1ixqk96ZKk0ok=;
 b=HRuc4ALuyXmC6/BG0ao4tUwrXzxKP73ri5X4skK+tMhU1tyjRJ+HMPOFACdD/FD5Ri0DSOHZ63buysPResQ2bvRGHFmG2HsqbrmwksdkeKRHwwz8wye4Zk8k7kGz/2nb7thuldS9YpMXEWBFPwGyxd9intaC8FF5PH4C/s9c4X+zoHY75NAcc7k3FRU8CXpTfG5C9ae4dOpRcUBk++kDZsbl6CcNJCQRzgYKmt2SF93PQ6cMyvAJMinRwDA8vOQqs978FwSLcCYE36q/Jh26nNPervhbdFNdjAZR5VJDeBWHZpOoDsy+4tHaTKUYcS/6VSyQMXWQqO8lZBApXa0I4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yCDHAawEPvy/KpykNSFz+lkrccadA1ixqk96ZKk0ok=;
 b=qI4MQilW20STKWKpcKk+hlYafPqdgEM56wXEIW3Og8HA8dAqXLTbup95i36otCXnjSr3dQAH8htlc4OVvNxMmj1V+pqbPYWM7k/O4NXAPjA1DSnihV9fSEtwIXtrkzgCTbFwNn+LmhTAQUwBpIR+A6u1uQZU+8+EhOkNA12C6Ko=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4764.eurprd04.prod.outlook.com (2603:10a6:10:15::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Mon, 26 Apr
 2021 23:45:50 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4042.026; Mon, 26 Apr 2021
 23:45:50 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        "ohad@wizery.com" <ohad@wizery.com>,
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
Subject: RE: [PATCH V5 0/8] remoteproc: imx_rproc: support i.MX7ULP/8MN/8MP
Thread-Topic: [PATCH V5 0/8] remoteproc: imx_rproc: support i.MX7ULP/8MN/8MP
Thread-Index: AQHXNlcHJ8Q3g7yLQEORmdDszDNiVarAxDgAgACGXzCAAOivAIAAjmMQgAQ4RoCAAIP20A==
Date:   Mon, 26 Apr 2021 23:45:49 +0000
Message-ID: <DB6PR0402MB2760B5F403FDA7EDED34B31C88429@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <1618971622-30539-1-git-send-email-peng.fan@oss.nxp.com>
 <20210422165634.GD1256950@xps15>
 <DB6PR0402MB2760E471A0391FF8A31980BA88459@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CANLsYkwoS+3qYq=FHRLMjrJSr5cj_PiHaU+a+M17C+8-VJ+b9g@mail.gmail.com>
 <DB6PR0402MB2760EA88942E5549BA9CC4B588459@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <20210426154623.GA1390475@xps15>
In-Reply-To: <20210426154623.GA1390475@xps15>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [49.79.253.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07ab648c-a87a-4edc-5bbc-08d9090d6c00
x-ms-traffictypediagnostic: DB7PR04MB4764:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB476466E88C75EAAB2B17057588429@DB7PR04MB4764.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k4+rpn/zlda2PWI1wxzTDqbmcJ2kpCCvwZDNwiL4Z9qqx6Saq1pMm3oHtxucgPw062yXNHYceDbTQxV4DsD3y9wI3r+ZRPRO1RAiGsoTfroIPt5kVbOMEVWA7BNLJfc14CgMtWmwBS7yT2NC8YIv/q3CxQfiPN9KN59eZTIb5Cmirt8xv+5cP6X0sQ9WWGnCZPookVQzhcalerIdc83V4I+eYj1u/5MUv064Wy1loLdwi18EpFN0mQpFSzDNbVSzFV0/Qno5cVIi9bLb6rNVbWQcX/aJh4QYU1rEvVj0+gXB9jDWAESD08rGVtUY+xxlJxOf5r09/t4ZWcAZf08NRYPvgbyF39RvnviX90OfJkR2h3NHve+BQe0M7ZazWUEST28y9OtSQ9PEBCHWS6B0ePIZ8C9GD90prP/fjAyFCo4qkMmNLTatjw8DUqPkRrUTE7T2kFKeohQD6K4mZBsnvBujDp05ATgwp+ZRLPdlluK1DxObNaau6Q494d5qJQPrQC99UCwk2HFSA4CGqye33YXFzN0GwrLEGkiF+Og5JcLbg3xSTYj3/Z3LOdL3ntAXg0/5/XOVK9b8SkwtLrzgamCWwqUmeFlwqrQbvu7NVro=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(54906003)(66556008)(66476007)(64756008)(83380400001)(8936002)(122000001)(66446008)(66946007)(186003)(52536014)(5660300002)(55016002)(71200400001)(6916009)(44832011)(498600001)(4326008)(9686003)(8676002)(86362001)(6506007)(38100700002)(7696005)(2906002)(33656002)(26005)(7416002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?mVtzlnTV5GeWLnkCJJTPG9b1ciPEY8DWrODM8/nroSToho5eCe272Osod52A?=
 =?us-ascii?Q?2J99s7sIH181UpDTW35IGev6yW6MorfMmkvKPGnl4Tp06mZyzGjyKvmD4bbY?=
 =?us-ascii?Q?ajga9DhGjVe/dbR9sQEBxQCJcOQQI0/dHzOzBCboGFPFuroLiMIr5pw+s3aF?=
 =?us-ascii?Q?5vEFQPCRj7sC1q70QsWPKW7T4nUpo763gOsoUXnyoGbqiDGyn4RXuG3twbzr?=
 =?us-ascii?Q?FF7LerLeNSNzS+8JskLl/dauy5sic73LgMKF900AU+yYuK7lankjo5izAJx1?=
 =?us-ascii?Q?MaYqhF8jtieTbWvslIZpn02VraIW62keqrk2pEZDMAvRhLuJ1cl4U6xJDkpk?=
 =?us-ascii?Q?PHAMAG1wjV+rr5y+66L4P9IEIYe3UtRwUh/kDQ7w247OU9+/NPbjnir9P55S?=
 =?us-ascii?Q?Rwqyhy6CLJ5XgrUnbn5rGUP7vP0hHhnT0E8FduWSi72AG5ATHjuL5v70VeVl?=
 =?us-ascii?Q?mF+CUEYU8UB6Qs5+9eEm/fr97Fo+LwXmETl3dGE0GUdpdbG8oMGiWTGoA8H0?=
 =?us-ascii?Q?RkxROdyE3fYpC0Cnh3wpk0NE/mqIN36VjVnQ1D7nyOFki95i5YIham7bZ6Kd?=
 =?us-ascii?Q?E81wSRoJR3K6wPZO22MeGCC6hMGmSkaULESPKinNU8FU0OVpXWT5Oqsf4eV6?=
 =?us-ascii?Q?K+CcP2vjnpZSToe9wLRu14FAmuCI+YesCfO6yvBHvfODp7EO/07Kuu1S/35A?=
 =?us-ascii?Q?1W462DEuzyc9172JkU6rNZv18cwRVhCcCVyIHU9bcB7Sl/foFwpeCKq0E4qc?=
 =?us-ascii?Q?NKHw7rIP0JE9wDcBRCFNGeHhzsrp5FUXO3N2v7hbSTISE08YKHkfewZqDr5h?=
 =?us-ascii?Q?a9xdaTi4tVd92XKGgawYCzUJb0490XE/yTv5OPRfZB0B4zZTZGASf/PIq6I8?=
 =?us-ascii?Q?Zn5xesusaxNglaAG/FRzWg4tovOCr4Cc5Yli3c5lFq67hjxRnJuFQz+2zjUr?=
 =?us-ascii?Q?v9E6faCE60WAdErnQpfpk4O7DCi8jxTdySwsiagWXnXeHB+SRp+UftCUX5LP?=
 =?us-ascii?Q?huOFroTUeqGyaxNzYSHLTdWFYetXBvh7HgiVit6Y9SbSTQoZpUMIiZpMm4Td?=
 =?us-ascii?Q?1PkrBN/bpI+mUpx7USrNT84NTvkDUt+I/114x4sAWZ9hK3O85HNlxLt9nA2n?=
 =?us-ascii?Q?yaJVTjzCZl3mSyf5CchrpK1p/n51PusucLzP0U5FtHGfMjSP+qEbedKnTf50?=
 =?us-ascii?Q?KMIhTSu+peYdYgw4eIlf9I1vah7TLnuZV0vy4tOqFjb/hmXMPA/YRb9k4dB9?=
 =?us-ascii?Q?G0Xh0jdMRhlRToaQAsMO/FILo4yK9EfkKOlC0lbFR1isgFV+6BjrFr3mIjm5?=
 =?us-ascii?Q?MFw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07ab648c-a87a-4edc-5bbc-08d9090d6c00
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2021 23:45:49.8914
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FJ+92gSAytZdhSEM/BH16XY444+MfxFHgtjHUuYkJYHLnVLs5JLeHXP68gIKX+Wxms3yt2sD55k8/vvvjOUczg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4764
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: Re: [PATCH V5 0/8] remoteproc: imx_rproc: support
> i.MX7ULP/8MN/8MP
>=20
> On Fri, Apr 23, 2021 at 11:28:00PM +0000, Peng Fan wrote:
> > > Subject: Re: [PATCH V5 0/8] remoteproc: imx_rproc: support
> > > i.MX7ULP/8MN/8MP
> > >
> > > On Thu, 22 Apr 2021 at 19:01, Peng Fan <peng.fan@nxp.com> wrote:
> > > >
> > > > Hi Mathieu,
> > > >
> > > > > Subject: Re: [PATCH V5 0/8] remoteproc: imx_rproc: support
> > > > > i.MX7ULP/8MN/8MP
> > > > >
> > > > > On Wed, Apr 21, 2021 at 10:20:14AM +0800, peng.fan@oss.nxp.com
> > > wrote:
> > > > > > From: Peng Fan <peng.fan@nxp.com>
> > > > > >
> > > > > > V5:
> > > > > >  Add R-b tag
> > > > > >  Move the change in detect mode of patch 5 to patch 7 Per
> > > > > > Mathieu's comments
> > > > > >
> > > > > > V4:
> > > > > >  Typo fix
> > > > > >  patch 4: take state as a check condition  patch 5: move
> > > > > > regmap lookup/attach to imx_rproc_detect_mode  patch 6: add
> > > > > > imx_rproc_clk_enable for optional clk  patch 8: use
> > > > > > switch/case in imx_rproc_detect_mode
> > > > > > V3:
> > > > > >  Add A-b tag for Patch 1/2
> > > > > >  Fix the checkpatch warning for Patch 6,8
> > > > > >
> > > > > > V2:
> > > > > >  Patch 1/8, use fsl as vendor, typo fix  Because patchset [1]
> > > > > > has
> > > > > > v2 version, patch 5,6,7,8 are adapted that  change.
> > > > > >
> > > > > > This patchset is to support i.MX7ULP/8MN/8MP, also includes a
> > > > > > patch to parse fsl,auto-boot
> > > > > >
> > > > >
> > > > > One of the request I had from the last revision was to
> > > > > explicitly list what other patchset this work depends on and
> > > > > what branch it is based of, something I can't find here.
> > > >
> > > > Sorry, that patchset has been merged, so I remove that line.
> > > > I should mention that that patchset has been merged into Linux-next
> tree.
> > > >
> > >
> > > And what branch this set should be applied to is missing.
> >
> > I take latest linux-next/master for my upstream new feature work.
> >
> > >
> > > > >
> > > > > As such I am dropping this set and won't look at another
> > > > > revision before May 22nd.
> > > >
> > > > Ah. Is it just because that the dependency patchset not been
> > > > mentioned or you have issue applying the patchset that delay the
> > > > patchset for one
> > > month?
> > > >
> > >
> > > Both.
> >
> > I replay my flow:
> > git fetch linux-next
> > git checkout linux-next/master -b master-next-4-24-2021 pwclient list
> > -w "Peng Fan (OSS)" -s New | grep V5 | awk '{print $1}' | xargs -I {}
> > pwclient git-am {}
> >
> > It could successfully apply the patchset.
> > Applying patch #12215291 using 'git am'
> > Description: [V5,1/8] dt-bindings: remoteproc: imx_rproc: add
> > fsl,auto-boot property
> > Applying: dt-bindings: remoteproc: imx_rproc: add fsl,auto-boot
> > property Applying patch #12215293 using 'git am'
> > Description: [V5,2/8] dt-bindings: remoteproc: imx_rproc: add i.MX7ULP
> > support
> > Applying: dt-bindings: remoteproc: imx_rproc: add i.MX7ULP support
> > Applying patch #12215295 using 'git am'
> > Description: [V5,3/8] dt-bindings: remoteproc: imx_rproc: support
> > i.MX8MN/P
> > Applying: dt-bindings: remoteproc: imx_rproc: support i.MX8MN/P
> > Applying patch #12215297 using 'git am'
> > Description: [V5,4/8] remoteproc: imx_rproc: parse fsl,auto-boot
> > Applying: remoteproc: imx_rproc: parse fsl,auto-boot Applying patch
> > #12215299 using 'git am'
> > Description: [V5,5/8] remoteproc: imx_rproc: initial support for
> > mutilple start/stop method
> > Applying: remoteproc: imx_rproc: initial support for mutilple
> > start/stop method Applying patch #12215301 using 'git am'
> > Description: [V5,6/8] remoteproc: imx_rproc: make clk optional
> > Applying: remoteproc: imx_rproc: make clk optional Applying patch
> > #12215303 using 'git am'
> > Description: [V5,7/8] remoteproc: imx_rproc: support i.MX7ULP
> > Applying: remoteproc: imx_rproc: support i.MX7ULP Applying patch
> > #12215305 using 'git am'
> > Description: [V5,8/8] remoteproc: imx_rproc: support i.MX8MN/P
> > Applying: remoteproc: imx_rproc: support i.MX8MN/P
> >
> >
> > If anything wrong my work flow conflicts with Linux remoteproc
> > subsystem upstream flow, please correct me, and I'll follow.
> >
> > Thanks for your time and patience on reviewing my patches. Sorry for
> > the inconvince that I bring in.
> >
> > Anyway please share me your flow to apply patches, I will try to avoid
> > unhappy things in following patches.
> >
>=20
> All I asked is that you list the branch your work is based on _and_ any
> dependencies, something you did not do.

ok, got it.

>=20
> I review hundreds of patchsets every year and knowing exactly how to work
> with a series goes a long way in saving precious time, time that can be u=
sed to
> review other people's submissions.
>=20
> I am not angry at you but at the same time I can't review your patches if=
 you
> are not ready to help me do so.

Understand. Since one month is a bit long period, I'll post v6 later to avo=
id
potential conflicts. Or if you could help check this V5 patchset based on
Linux-next/master, that would be appreciated.

Thanks,
Peng.

>=20
> > Thanks,
> > Peng.
> >
> > >
> > > > Thanks,
> > > > Peng.
> > > >
> > > > >
> > > > > > Peng Fan (8):
> > > > > >   dt-bindings: remoteproc: imx_rproc: add fsl,auto-boot propert=
y
> > > > > >   dt-bindings: remoteproc: imx_rproc: add i.MX7ULP support
> > > > > >   dt-bindings: remoteproc: imx_rproc: support i.MX8MN/P
> > > > > >   remoteproc: imx_rproc: parse fsl,auto-boot
> > > > > >   remoteproc: imx_rproc: initial support for mutilple start/sto=
p
> method
> > > > > >   remoteproc: imx_rproc: make clk optional
> > > > > >   remoteproc: imx_rproc: support i.MX7ULP
> > > > > >   remoteproc: imx_rproc: support i.MX8MN/P
> > > > > >
> > > > > >  .../bindings/remoteproc/fsl,imx-rproc.yaml    |  11 +-
> > > > > >  drivers/remoteproc/imx_rproc.c                | 196
> > > > > +++++++++++++++---
> > > > > >  2 files changed, 173 insertions(+), 34 deletions(-)
> > > > > >
> > > > > > --
> > > > > > 2.30.0
> > > > > >
