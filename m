Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5EE2C07E95
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Jul 2021 00:59:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A7936136E
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Jul 2021 00:59:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237186AbhGNBCO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 13 Jul 2021 21:02:14 -0400
Received: from mail-am6eur05on2053.outbound.protection.outlook.com ([40.107.22.53]:44512
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237180AbhGNBCO (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 13 Jul 2021 21:02:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmE8+FTysnssyGZQEWaPZe7rwEjn1WOH8xL1HzVgqT69QkCy9LWr8jX1PnTgQZ9IOmPacy+qWvv4d+IJHYXBrojTh7OUjaFcGuXQCUtAB0Ji3Fh91mKfP6hFjw+D/uk+nV1ej715mR1uv+x7yityXvfJ3wJt7why5M+XCK44Otaa7+3X0EfFZpi8ZH4gfwAbTMAu3r/ZYWh4+qLojtTdNGgVsR1zeFhI0viLOZBT5A2C1KUwK22QVhCCQFp385fqZG3j6xk38AwoNqgqf9lb9VGDLOaBxxGQbmF03IYHBdQ1GYd+Kp2Bj4odBF7F6I/JRE+6ccgjkZ7Y8wcOLvGE1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRdkpkeDL+c0+roWKpQ7de0LACB9vlOnAtwmEVX5oto=;
 b=caK2vcaFfYaR8wv3pMl/oHR0Dm6RWuGfUEmhugyQrANETTuUzcPzzuebNCPF11gL233vuV4yT7JhbXIUWMqVSPZdBFOccC0RHUP7aDLdWb8bapOjAhfjLMoCfME6Tqo8hzz3UnS09UUKYKzRpuPfJjn2FR/2H5Syx7UpRVb7xQUhFLlUEdw2wj66noIa4darRD4s8cXFQaOf14tuGhq1MQK2qjgK1syX8yaAMWlGRifZkq3lYCiLGd9U1uJ1/IE5Ij5RtvcDwE9GTaMBZYgWwhEQvT6QRCKYaApIoTiRClVw/JHKOvVUw+qxlgJnUDIVtnKrLDSoWrIq2xNr6roLng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRdkpkeDL+c0+roWKpQ7de0LACB9vlOnAtwmEVX5oto=;
 b=LdXMzLJmJv7ak7d7cukmfejXSjBbUzD2U2j2OWNUfhH7VGmsJK0AcPnhTJMYY7rC3pde11V5XiRRfO8PBmxOmXp6Q4fsdRBNYltr4aukkEWpcXsLPfV0pq9WDHE6P5Dst4bHoUFvDOPSev1R1vnZK8hpduXDKCjEIC8CBDqIG7s=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB3PR0402MB3915.eurprd04.prod.outlook.com (2603:10a6:8:e::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 14 Jul
 2021 00:59:20 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd%9]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 00:59:20 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "dongas86@gmail.com" <dongas86@gmail.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
Subject: RE: [PATCH V2 5/5] remoteproc: imx_rproc: change to ioremap_wc for
 dram
Thread-Topic: [PATCH V2 5/5] remoteproc: imx_rproc: change to ioremap_wc for
 dram
Thread-Index: AQHXcxRKYHWFG+35eEGhDbDigAC4nKtBLLkAgACA9kA=
Date:   Wed, 14 Jul 2021 00:59:20 +0000
Message-ID: <DB6PR0402MB27606494C59B5DEC222639B088139@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20210707094033.1959752-1-aisheng.dong@nxp.com>
 <20210707094033.1959752-5-aisheng.dong@nxp.com>
 <20210713170638.GA1816225@p14s>
In-Reply-To: <20210713170638.GA1816225@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 545b9010-cce6-48ca-c455-08d946629ce1
x-ms-traffictypediagnostic: DB3PR0402MB3915:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB391537CF9CC128D833589E5F88139@DB3PR0402MB3915.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p4blf5TIszVDMDt+ahMctVDMKzITktPlMCuviWBTWV1L3gqlAezXK51wQBjZnlIPep33rhuoP4pknUhrfxXtcE8vt6g8hPIrEjhW8GlNdMkclpVOkxhroPJ/E7PhTyvF79x46AfU8wTVO3vzIRDWUKwGAgD4v5dyL1y1vlSuv06w3XqZc5qBPm2x/oKgy2mubx/I2/kASjIApn+WMycEdNP1QFcy6q6lKKKLOYYUwHtBHrXfBWVAS6AbfFMKWYyQIBUsufMACKIQj5IWqRaqm8/zUG7Z0zZPhT+/k92VZ2/ODWI7ZKWB1OX6aUWyIjapkAYaHFk6bz0NRenC/+kTN+GgI8JM4ZOgsS6/l9HWMLaACey7U+qFgqv2qmZS5HZqwkA/45SH4uRL1qF+fZrNlzKbwTw4Ah+BgwqNRtySZn80qXFzDYIgkqwsThoTuWPdwleNEnm1AWFvl7L7pBOiiMHV0aBk+g3prWA9cDOhvi+DjjHq5Zli8RThzCxqSuwqfj3uBQwsoqM20jRXF7tfTRQSjQPSwhF4DuKXIsuFuo54hC6welNDfNmDSyChhSh3Su6YWpWOvk3tIRNzHtVvUBkSFtj6u6+1sTDbIQ7oJnJ6adL4lz7yn6unhQ4nJzNs4lzzPXHrbFwTZYLh4jabu/CI9tcgsQT36+UHgfmBwLIw/vkpHPMW1S/3TdXH4VPh9B62FVYBYJP9V3Q4Tjd6+Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(346002)(366004)(55016002)(9686003)(26005)(52536014)(54906003)(44832011)(2906002)(8676002)(83380400001)(33656002)(6636002)(76116006)(71200400001)(4326008)(86362001)(38100700002)(6506007)(316002)(66946007)(186003)(66556008)(8936002)(5660300002)(7696005)(66476007)(478600001)(64756008)(122000001)(66446008)(110136005)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PS2gNCLScRbab7xBvKPLQABn65YxxZFpouGvLwfhvtZjN9g0Lx1PSrTHFzOF?=
 =?us-ascii?Q?jpYX3N+DLhe0es+Ie0m/Hr2MDCR43w97btJ07Cw1oTOnaqilR8F5AkI6yx/0?=
 =?us-ascii?Q?v/GemHv5GUiXxA39Al7A+DZHhAz5xUOfRgRHkr32h9ag2dUiwRnO10Q0xOk/?=
 =?us-ascii?Q?pksA0mqe54cX73/Gksx10EDXFzxUI+DsY6mrEB0mnLg7L9dp0VTyLe4TaYKD?=
 =?us-ascii?Q?Q5xYAFvSxt1nj/OmEJb5mgpxCtX4jvh9CqJyBibtooo04K1CT6Te4ME+eY0K?=
 =?us-ascii?Q?S46zSAvc73X9Wqp0FdbwcmXYsZFahHZiH4ifwlahwUNHlJOmJ2VE5KZ4gomh?=
 =?us-ascii?Q?JzDXEAX7VMfBXm/HSI+3N5z1O23ApOL+6rzyFRyzW9rgEUeZtwZ4FtPGEMe/?=
 =?us-ascii?Q?XgeKAQ03hmLYqdQT7o3+te2JICr8jt3fDx7BgjaGQ5h6fiVuZ65WhCPEFGIl?=
 =?us-ascii?Q?Jg9HKo8eVa0dlql4HnVkJBhhKEk5aFWnwYTjRpEquZSBHnZ06tTcAkYmrJHT?=
 =?us-ascii?Q?3rHb415epkiy1ixh8Xx1f+1//kFCxbHjIJwtDcu7tiCNAmaOmp7zynamwKFR?=
 =?us-ascii?Q?QimcxR5DswAyxQxQ4oqysxcWWelQ4NWN2DhC1EkeEUJaFCLdK4/Pp9s1izgZ?=
 =?us-ascii?Q?FRf2xDSrCASVUq7hnV6GiLNqDoVP9YGvusN8RnszAuV5Y6QDNf7a7ZtWpeRz?=
 =?us-ascii?Q?KMbMSAV20W9vQRWuiHLQ+SWwOcQOKhBN9RpwNR72i83CaomheQrbhXMDEIzY?=
 =?us-ascii?Q?aVO/Li2uYLslKK/C9AASGkk3j4P4KY9ztOFp3cLx3tCwmv1cSl/ssl+o13OJ?=
 =?us-ascii?Q?oJ3Dk3qxqET9YrAgV87ITt1ERO/vQf2DH8KV3CWkX6Iqc4Ny21q0ogUG27up?=
 =?us-ascii?Q?g8XKUf/sr+KpJmJEUsTUzSUUjGigKRKcWiXzGjoenQd9yteQu0M6UovTT5NZ?=
 =?us-ascii?Q?dcSgQFbquI2bg7uPjSoW6NBVXeqwGGd7EbC/7k5kCHaYxV1j6J47Mbj2vhsy?=
 =?us-ascii?Q?21lj3eTgho0XhsLSoGB3SJw9QHNYe1ufwkBwLdnaEYKt58ORbV+fWvPqyqdd?=
 =?us-ascii?Q?qohZatnzMVjuv9BXcuMweqpbJrmKuXily2CorduhKI2oKD3K7l+d8tcQeEB3?=
 =?us-ascii?Q?/DfMXIQjG5IAsaPy8ED20LqLIbl/pmvOnMe30iG1QYrYUgOZPXazKfL5lQ0D?=
 =?us-ascii?Q?ZxIDRpNJHos6vQRmk+h1LW1OQmqTpMJvmnO8EmU7fhz6ERipthFBetpaVS6X?=
 =?us-ascii?Q?k3sAVssS2IIk5KfBlRysYzOqa0HyQF0Vy7+03SYFigEQSjAQRIlpLiHxWocL?=
 =?us-ascii?Q?43eKAg3PPQC6OYS4j0SedF5v?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 545b9010-cce6-48ca-c455-08d946629ce1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2021 00:59:20.1737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: slW6oFYgyCFqvrcLIt/MCFEsLY+12hF77YWUBztY3M19Z+WjhGkFZXEzX+3YS71x0c/hO8dTwRFU2jVe6oI0WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3915
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

> Subject: Re: [PATCH V2 5/5] remoteproc: imx_rproc: change to ioremap_wc
> for dram
>=20
> On Wed, Jul 07, 2021 at 05:40:33PM +0800, Dong Aisheng wrote:
> > DRAM is not io memory, so changed to ioremap_wc. This is also aligned
> > with core io accessories. e.g. memcpy/memset and cpu direct access.
> >
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Fixes: 5e4c1243071d ("remoteproc: imx_rproc: support remote cores
> > booted before Linux Kernel")
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > ---
> > v1->v2:
> >  * new patch
>=20
> It's a new patch and yet Peng's RB tag is already on it...

Aisheng's reply in the other email.
"
Above two lines were added by mistake. (copied from patch 4)
I'm going to wait for review comments first and resend with changes if any.

Regards
Aisheng
"

>=20
> > ---
> >  drivers/remoteproc/imx_rproc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index ff620688fad9..4ae416ba5080
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -597,7 +597,7 @@ static int imx_rproc_addr_init(struct imx_rproc
> *priv,
> >  			break;
> >
> >  		/* Not use resource version, because we might share region */
> > -		priv->mem[b].cpu_addr =3D devm_ioremap(&pdev->dev, res.start,
> resource_size(&res));
> > +		priv->mem[b].cpu_addr =3D devm_ioremap_wc(&pdev->dev,
> res.start,
> > +resource_size(&res));
>=20
> How was it working before? =20

we took all memory used by M-core as io memory, including TCM/SRAM/DRAM.

Will it really work for all platforms and was this
> extensively tested?

Aisheng may confirm, I not test this patchset.

>=20
> Peng - I will need an explicit reply from you that you are in agreement w=
ith
> this change.=20

I not test, but it should work per my understanding.
i.MX TCM area has limitation that not use ioremap_wc, DRAM has no such
limitation. Just think this not deserve a fix tag.

> I will also need you to review patch 01 and 02 of this set.

Sure, I'll review.

Thanks,
Peng.

>=20
> Thanks,
> Mathieu
>=20
> >  		if (!priv->mem[b].cpu_addr) {
> >  			dev_err(dev, "failed to remap %pr\n", &res);
> >  			return -ENOMEM;
> > --
> > 2.25.1
> >
