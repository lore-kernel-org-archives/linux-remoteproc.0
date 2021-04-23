Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E414DC43460
	for <linux-remoteproc@archiver.kernel.org>; Fri, 23 Apr 2021 01:01:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0D6461405
	for <linux-remoteproc@archiver.kernel.org>; Fri, 23 Apr 2021 01:01:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239976AbhDWBCM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 22 Apr 2021 21:02:12 -0400
Received: from mail-db8eur05on2086.outbound.protection.outlook.com ([40.107.20.86]:43104
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239918AbhDWBCE (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 22 Apr 2021 21:02:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jt4yCfUXP3MdlS+j0nkHQtYv3ooHbOLzopL9RThPOcnXN4OvCNtZywCFdzo55KRRfSNINrzLxNh6r2HvAkMUJ9hDH927h11a7D204Bk2wnwwYJfu2lX0lZVH343o2V0INwrKcREvTXE+pRulTHOxQ2KXf+u57f5WgmKBt5vInOkssDNmH2Aqbt187BWSlU8bumrIHCa9yu5IgD4mf9PcbpoKh257SM+ragUfVs6ZG+YjTs4j0YTCoN05uU1vWlRswN33BQK0JPspdu7aq5FSjujLgLwInOoIDHDrg1yxq2Pv+x03U9fXr8Q6R/AQvw03e4CshijXPko70o4JYs87eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lz17lSOVMKNPBhs7RVvhrQyRHbeGMbNvij//ynRiVPk=;
 b=WS7LP6trZu4Je5boQHo6hYnwf9JlB6hJJ10DNPikodVT4Y9I2Ymly2CHxHLAxjQASkIexuOjF9PcSXQdYWWcdagTMNon2wzwkCtWP+hCqy/pQsW0b+KxBf3q4O//qoVQQTJuYSJuMJVa2eBVETORiBNS6jzgr8C5G5cuiLIhX0O7j8STnhzyL90BhAQZ8JpxKOtZcIyOgMe+jdAmNHOLjdeG0IafCH4jqepxi+3rK5Vtk8FAVaiVTi7KEKs14gqBk154bZUoLy+vr+D5jI2iLA0HGKU1AaTMa+1hXJK1OTsQkJpApfxGP4/nzBruySoyGYtwlH7LE43hbqEHuR9Ssg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lz17lSOVMKNPBhs7RVvhrQyRHbeGMbNvij//ynRiVPk=;
 b=eEjB1U6hwA2FQCWq5uv0hK32oiOSb8X0rPOpc9to24gul6eL/7nFS87EPIs4aYAs9X6E/BiP+HuUUUPXVk1H1AwrKP1WHjDFGKzpzFcBPNW//ZiFG/xeaigyDvwD96GsbvrpWxO8SRv5r4lqLNPZj2EiVwqlm7A9+qDvKkJUE1g=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0401MB2535.eurprd04.prod.outlook.com (2603:10a6:4:34::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 23 Apr
 2021 01:01:27 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4042.020; Fri, 23 Apr 2021
 01:01:27 +0000
From:   Peng Fan <peng.fan@nxp.com>
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
Subject: RE: [PATCH V5 0/8] remoteproc: imx_rproc: support i.MX7ULP/8MN/8MP
Thread-Topic: [PATCH V5 0/8] remoteproc: imx_rproc: support i.MX7ULP/8MN/8MP
Thread-Index: AQHXNlcHJ8Q3g7yLQEORmdDszDNiVarAxDgAgACGXzA=
Date:   Fri, 23 Apr 2021 01:01:27 +0000
Message-ID: <DB6PR0402MB2760E471A0391FF8A31980BA88459@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <1618971622-30539-1-git-send-email-peng.fan@oss.nxp.com>
 <20210422165634.GD1256950@xps15>
In-Reply-To: <20210422165634.GD1256950@xps15>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 670f329c-073c-48e0-1e9e-08d905f352e7
x-ms-traffictypediagnostic: DB6PR0401MB2535:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB253591BF1265F79438B02E6388459@DB6PR0401MB2535.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /8q+9afTIVH9vPxqY9Qa5xbkBeKPiQaK8wkaZT3pWEACVf5KHL3SvACYhX+0S/soX3AFKZaU+3CYCYcPOnLZImqnjOcSL1OlYzy5nMucp7wBvRdhik0WZL6kdMTbWFEgiCDjyXUG4SbpJHH/nE4g0peFM6u7wuPziuqMxugo6JJEmqSSnQIKwlrV5UvztcYUNxyy3qj0LcXv+ffAxdBH34+AGQCVI3GbIJBsA/CnV6dzUS0hEsFH1/U3SSdPvseDX6+XXDaOXUx4ng0KrlVU+PEQxDD54Nk84HUJ242UvZrCyjmZWuso0D207gDmKdhZN1XKQ91VVaMU8/BJXsxcaZZ80L2pooLDwoKCUAqU0qgqnB9evNGimHpDpsOh0IBRHCmNQvblwdoaGs7n8EeCSa4lcl3LHbzJSWzt7mhqafhoK8/bRp2v+hI8XbuiVISnZ+/JYsOxuYBH4yOuzLcRceV5CP+dpBoZqCHpfcSA21cZnARp8aF3kLy5BrYJYjkZ0tf8vw/UP54Gok8ntXHqvx1QJjecWL7Z2QmOIWKFzEQqk/w5BIGr4GzUZvMaIqBChRtC0l1n/fTuP+VniXYQp18+s8mu0vDGR0pEwhpYYsM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(7416002)(316002)(54906003)(110136005)(83380400001)(55016002)(7696005)(71200400001)(44832011)(26005)(9686003)(86362001)(66556008)(186003)(8936002)(8676002)(5660300002)(66946007)(52536014)(33656002)(64756008)(66446008)(66476007)(76116006)(478600001)(6506007)(38100700002)(4326008)(2906002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?0e6ZeD9TFMJXY/mbUl0piEF8e8C1eRT1O7SCxN9MCjWzDcZ/tVW7ucyUJ2Co?=
 =?us-ascii?Q?fCcmmYi56zLVEPmsEmFXNyArLWKqP51WM5Cc7UGKGZM4Px0amwoDgSj0vHPe?=
 =?us-ascii?Q?xZnvNL8LU8iDTDBlHkkdk0Sw59jKO4Qc/Hjccgl6Y/Ei1ys/0aCyYTBTK2V0?=
 =?us-ascii?Q?fp1HKT1ChpMR3FSx3cIG0NPRVsyFzQPNUiVTijMpWnZRr2sYjxpQ6XxISxn1?=
 =?us-ascii?Q?Xkl9SY46UjdcolgNpSiBwesA/4/LGq1jTmNJlemiYnFYixbj4kU1ZWo3zf6N?=
 =?us-ascii?Q?UF6Ol54QZul13il5wTXmKYyEkLVSwkj5UB6Ww0u2MmWwaxi7Os/p9dZ/byst?=
 =?us-ascii?Q?v2lbhWJCz5o1vhxfH4Vy/R9jOrf/pjU++WIk0KGczg4SEX2cb0GeTU4a6JIY?=
 =?us-ascii?Q?/iRRUWBVMckH8QE1cy//kBS5iP2xC2qZfRF0qO8vEjkFZdR5jwfrfFQv2UxR?=
 =?us-ascii?Q?7nPfkAVO2s7SaIB3W2P1rBkx1wpSq+dZ8hcMrod15d+0AL1ys4JcpQ43P2bM?=
 =?us-ascii?Q?jtwrQjRiz/8OxDqlQGdwrwvuYFwoDnsYa5Yr3FpoCbMekFKgFUZBmnSCZTij?=
 =?us-ascii?Q?KiKM8wF2Qrn5cNRcBlbl1lNyl8H0EKsV/360vJE6z4MVECwKcVp68ujRdCYE?=
 =?us-ascii?Q?hbuGwXXv6gpG/SHEL+HSJqHi/4N2xUJeae0BsR3yYZ/DY8GM0P9b/wFTfytg?=
 =?us-ascii?Q?GgMIdlfbv1/D88uHj0SE6Fcjiatgewldegdw248PVzlO2IQPR1zaPTlJl0Uz?=
 =?us-ascii?Q?0wv/UfGcI9n42MFtDbZ2axD3HxHaaY5pG0Jpwf/mgFYfZGc1azjdrCWytn7O?=
 =?us-ascii?Q?0ZqHDoKZvxouHpBVR9B9EyNWvdqhR+3rlMD+N1mOVQOOMF4gl5pYc7Ruw2Ta?=
 =?us-ascii?Q?8WEDTO6YJS1xVGBYxQtfL/fNOAmfQfhSyfp61ieNshWeqpab18pbpwgvWPv1?=
 =?us-ascii?Q?RYBsZoCdPE6t1KJxhJMsbtpEkx7cEYa0XfCTSJrD5YC8vg7/7UkTjCSIBJF8?=
 =?us-ascii?Q?aHwkzhyDmyEcnStBSQTDG+05XD3IupQdz5xSJxk/TwEzLCbK6FQUEj0/lXr+?=
 =?us-ascii?Q?RK4WwFeKJG9lMlfXX+97Zwe+Q6R3Dde7EBL0/KuSc0vuQqtQ9Z5d9MJq1qM0?=
 =?us-ascii?Q?SfQMMoUn+ut5/19ITS+hPPwFRYrN9lzMyxPXbl1BtBzTrE3iR9F5OJodNnGk?=
 =?us-ascii?Q?p7l8qBtyqBvUnGovkemaBgNMleFVkbZVANHayJFxfsNiE6I8OHNatr4ziLCG?=
 =?us-ascii?Q?+igyYTMK20Rg7QTXLYkEWjOEQOuA8R6ZKML3V6C0d+DSkz1Jdw8BgIKH9nXv?=
 =?us-ascii?Q?PcYiEn/JU6KD5j4JQiHPcAsW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 670f329c-073c-48e0-1e9e-08d905f352e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2021 01:01:27.4196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jrDNIAMXVCf9qgyMnM/zxWqHpTqt9n6MZ6Vmmp/HpbibvyjGLukF7boaBAguz7NsCykz5ypJr7rQkcGMjJ3O3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2535
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

> Subject: Re: [PATCH V5 0/8] remoteproc: imx_rproc: support
> i.MX7ULP/8MN/8MP
>=20
> On Wed, Apr 21, 2021 at 10:20:14AM +0800, peng.fan@oss.nxp.com wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > V5:
> >  Add R-b tag
> >  Move the change in detect mode of patch 5 to patch 7 Per Mathieu's
> > comments
> >
> > V4:
> >  Typo fix
> >  patch 4: take state as a check condition  patch 5: move regmap
> > lookup/attach to imx_rproc_detect_mode  patch 6: add
> > imx_rproc_clk_enable for optional clk  patch 8: use switch/case in
> > imx_rproc_detect_mode
> > V3:
> >  Add A-b tag for Patch 1/2
> >  Fix the checkpatch warning for Patch 6,8
> >
> > V2:
> >  Patch 1/8, use fsl as vendor, typo fix  Because patchset [1] has v2
> > version, patch 5,6,7,8 are adapted that  change.
> >
> > This patchset is to support i.MX7ULP/8MN/8MP, also includes a patch to
> > parse fsl,auto-boot
> >
>=20
> One of the request I had from the last revision was to explicitly list wh=
at other
> patchset this work depends on and what branch it is based of, something I
> can't find here.

Sorry, that patchset has been merged, so I remove that line.
I should mention that that patchset has been merged into Linux-next tree.

>=20
> As such I am dropping this set and won't look at another revision before =
May
> 22nd.

Ah. Is it just because that the dependency patchset not been mentioned or y=
ou
have issue applying the patchset that delay the patchset for one month?

Thanks,
Peng.

>=20
> > Peng Fan (8):
> >   dt-bindings: remoteproc: imx_rproc: add fsl,auto-boot property
> >   dt-bindings: remoteproc: imx_rproc: add i.MX7ULP support
> >   dt-bindings: remoteproc: imx_rproc: support i.MX8MN/P
> >   remoteproc: imx_rproc: parse fsl,auto-boot
> >   remoteproc: imx_rproc: initial support for mutilple start/stop method
> >   remoteproc: imx_rproc: make clk optional
> >   remoteproc: imx_rproc: support i.MX7ULP
> >   remoteproc: imx_rproc: support i.MX8MN/P
> >
> >  .../bindings/remoteproc/fsl,imx-rproc.yaml    |  11 +-
> >  drivers/remoteproc/imx_rproc.c                | 196
> +++++++++++++++---
> >  2 files changed, 173 insertions(+), 34 deletions(-)
> >
> > --
> > 2.30.0
> >
