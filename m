Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E19C433FE
	for <linux-remoteproc@archiver.kernel.org>; Mon,  7 Dec 2020 02:09:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BBCA22C9E
	for <linux-remoteproc@archiver.kernel.org>; Mon,  7 Dec 2020 02:09:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728725AbgLGCJN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 6 Dec 2020 21:09:13 -0500
Received: from mail-eopbgr140040.outbound.protection.outlook.com ([40.107.14.40]:35906
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726400AbgLGCJM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 6 Dec 2020 21:09:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VomkXUIcwJGHCAO1Ovc4eyfrGMZX7NDr7ThTalCex5cj8e4owCBd/OvFudSTYL6tfs26abLyifeEx2QfkcC9BvAZXBbUyYAxfSKtiUGU4yxdRSFCYYb5ANyimIaHu3Klzs2Z/r7dQIXT8AsgRlMaP1eDiAW4e0rkeLPHtPB3opPVQGpCQhwCmEU8u/Keoz2P4EcCmH76sRdWpmov5mavRmcRzhtwhv7lSULpPUhTOe3n7poW8PWoTDbX1ivIfzxiHJk9K+s0RYBlZn7f2Vv1z0BwUSMZtp09sbdjNXPGuVO3XKt8nnv9TlRD+Tv5oM2D1P2P+fv5u9ethw2uRMqu1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qn5reLNkcxH9UO5QazdUIvWonJMsFhLp9snIDT5UQqc=;
 b=Gjmnr1PehZypzsisCey96wyXE4vNqkl5JYOizJR6MDeY1hMqFA7Sjt3axwPfaeJTmpigs2OovHI5G5l2uHvyxw3TbzzxKH7ZVtd32Vid3aP/y6MSt1ZWoGgVg3vXXsVrtoUDcwdx7WbbGw2RxdxsY8xbg9ZWHYiz6QshWtoqemCX8oxam2VH6qcpLbwznmXHOUnTNAn1AH8JD70L+6sTwO9W2B0o7hH/GGx2AgRH+ZWa+g8zPr7eqylLEJrFO1WAlhsRZSBjrn14RyjL6S3p3muPmVhz+drsDC/6Gs0bqxuvhu7uALTskOoV/axqgM+tUj5wJTEPAmp6bRVlgScVKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qn5reLNkcxH9UO5QazdUIvWonJMsFhLp9snIDT5UQqc=;
 b=Oqt1L3IHmtTTiLLuno2vO2kqLFu78EudTBtCu+uk4W7l2txn1eZA8Yt9VpPG35nQ8ZcsKLBoiB6NBt4xroa9Jw6uhZHlQly15smCxBMyGEwRpgLx/5ajHYkXDw3XturSN2zgy3XcKNH4zuWh5l/07fqy8gXnkYRFCfondcKA9QM=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4633.eurprd04.prod.outlook.com (2603:10a6:5:36::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Mon, 7 Dec
 2020 02:08:29 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3632.018; Mon, 7 Dec 2020
 02:08:29 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
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
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: RE: [PATCH V3 3/7] remoteproc: imx_rproc: correct err message
Thread-Topic: [PATCH V3 3/7] remoteproc: imx_rproc: correct err message
Thread-Index: AQHWygzmKuzGPnaAGEqtlRtv96WXwannpliAgANBImA=
Date:   Mon, 7 Dec 2020 02:08:29 +0000
Message-ID: <DB6PR0402MB2760019ACC7558DC48BF98C288CE0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20201204074036.23870-1-peng.fan@oss.nxp.com>
 <20201204074036.23870-4-peng.fan@oss.nxp.com> <X8rTnx/lQIxcuEXf@builder.lan>
In-Reply-To: <X8rTnx/lQIxcuEXf@builder.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a9d187d0-c581-46b5-76bd-08d89a54fd85
x-ms-traffictypediagnostic: DB7PR04MB4633:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB463333B96580A9F25D70AA1688CE0@DB7PR04MB4633.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rQEbK1vSC+tUvK/l5/Gnjl+Nh8RThojclZFNHb4k0WMsYj6SqG6N9uenivZ1lgYcPKch1ICFzzitbQIIMUa4At+U6XEt6qUq/z0/DwIow679RiWfjwMRoUKLjBlEQi8Qe82nXJTFDo/gk8wXNEjNft9XtCdcQH4SuunMsaqQjoLPb21pr+DvMWFwMDs5YJL7YlzXB/7gIZGAXp4MqZjJvMxaxGlhi/4gH+NWYrpVypnZce1ztitCW6paoeYGVxCBpMp2XXD3y78rlXmFGD3MoVuuQ/GuLqXCZuQp/r5Y8waYVscAghV3ezuTRoVRZi2NqJsbJ3rgzuhAtx4n3mL74Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(64756008)(4326008)(66556008)(71200400001)(76116006)(66946007)(86362001)(15650500001)(8936002)(478600001)(55016002)(26005)(66476007)(83380400001)(52536014)(9686003)(5660300002)(2906002)(6506007)(7696005)(186003)(7416002)(110136005)(54906003)(33656002)(66446008)(8676002)(316002)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?cDCUMBslR14XpLGT2g0EAY4riKU3hXrPF3Giw6JRMymSd6VQoSWE6rjThEcI?=
 =?us-ascii?Q?9lOVr/0HbH87KUOloHCXMs1gpAY+p9zFQ0B6ZNSE0rO6Q5BdLLm8tznfUPjs?=
 =?us-ascii?Q?+9kPnuBJJVBY8qeyqZALW1Qa6poymeeu8mDQXZHJTbofXkCsFA0Crv+qEoYB?=
 =?us-ascii?Q?DCkPoSvRvIvUIZ1yRnPfiaKbK2XFDnUrZSpeRuO5QTmQdjvby1nkH9wyLUey?=
 =?us-ascii?Q?hKJ86ZAR+fUl+KdYrHlhT0v3bnplYsAflxOBnntclnL13aqmvQog2lNAh7m5?=
 =?us-ascii?Q?lIYrFDfRA2x+u6I5bGQY19n9Ng21PUK/9+w5w9eIqimk0NOWPNghOdoFr68a?=
 =?us-ascii?Q?kweMQK2XQcqhHNdg1lYyLgtTl33FNO52CwPBrC6iC73DE8leA9hM9D68ivaN?=
 =?us-ascii?Q?mR5G53p7sy0FVrrkR3DdmlClSXdMBc6rtM3Vph+AEkFcVHGVBM1LYO61WyqB?=
 =?us-ascii?Q?/f8PPV9YV9mcmiA9p5GRJiD68l1S+u1AQm45t9bp2UkTCZCM3jw4zG57OwoA?=
 =?us-ascii?Q?KCBNeQH+Iz1satH6HXMJxY6Togf4otKud9bNeAMihkLD9V6GYrRNs8N69c8c?=
 =?us-ascii?Q?v3i5oQzmAhHVJnfKmbGPn5HKD8fHeUVmfnF/PMtZfTeNmLBrAJpeOOsKyVrt?=
 =?us-ascii?Q?ayGtlfOBd79EFj85H1Q9x8dxZGBunD0Lyxsy6lt6p6yBFNNWkx9pYAuN4c8f?=
 =?us-ascii?Q?yFiSZkJOqMKh96CcOY5mt4R8D1owNTOttAkxlIK1nkVc4zSHwsC72qytD5n2?=
 =?us-ascii?Q?FqW27fge1lC1aI5Sun4f+YXJA96nWhBCqnw0lsQ3VzwhR+h2NyAfT2dXRuem?=
 =?us-ascii?Q?oHVYLN/Rnb/Ncf8l6lb/PGVFOQLs00wkXcqz3D7tx/TX5jrNztwL4Eg+hlXW?=
 =?us-ascii?Q?yIanxGNMLSVeGqDDrMdd4UqKpm04smxyNNzP1HPQxEKFtB7CbteadhbHWUc0?=
 =?us-ascii?Q?tCwn0IUeKHTv9Dt4Ws44sGTYMK9JphQ8bjTaw82BxO4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d187d0-c581-46b5-76bd-08d89a54fd85
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2020 02:08:29.3598
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vE38EeJPHfeEzL+jmGaNd+x0+j3cMrx1IoLERFIiqQcNFYfxHcVsIob0QsGgLvK6J5YqZahjATioF7OEKjQlsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4633
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: Re: [PATCH V3 3/7] remoteproc: imx_rproc: correct err message
>=20
> On Fri 04 Dec 01:40 CST 2020, Peng Fan (OSS) wrote:
>=20
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > It is using devm_ioremap, so not devm_ioremap_resource. Correct the
> > error message and print out sa/size.
> >
> > Acked-by: Richard Zhu <hongxing.zhu@nxp.com>
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index d1abb253b499..aa5fbd0c7768
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -270,7 +270,7 @@ static int imx_rproc_addr_init(struct imx_rproc
> *priv,
> >  		priv->mem[b].cpu_addr =3D devm_ioremap(&pdev->dev,
> >  						     att->sa, att->size);
> >  		if (!priv->mem[b].cpu_addr) {
> > -			dev_err(dev, "devm_ioremap_resource failed\n");
> > +			dev_err(dev, "devm_ioremap failed\n");
>=20
> I would prefer if this was expanded to a proper sentence, and I really li=
ke the
> second part of the commit message to be included in the change.
> So something like:
>=20
> 			dev_err(dev, "failed to remap %#x bytes from %#x\n",
> 				att->size, att->sa);
>=20
>=20
> And similarly below if mapping a memory-region fails.

ok, fix in v4.

Thanks,
Peng.

>=20
> Thanks,
> Bjorn
>=20
> >  			return -ENOMEM;
> >  		}
> >  		priv->mem[b].sys_addr =3D att->sa;
> > --
> > 2.28.0
> >
