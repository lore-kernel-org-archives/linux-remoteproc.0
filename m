Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEDB9C433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 19 Nov 2021 01:09:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D678261A8C
	for <linux-remoteproc@archiver.kernel.org>; Fri, 19 Nov 2021 01:09:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232556AbhKSBMx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 18 Nov 2021 20:12:53 -0500
Received: from mail-eopbgr00066.outbound.protection.outlook.com ([40.107.0.66]:38724
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231391AbhKSBMw (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 18 Nov 2021 20:12:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9Q4Duymnt4MaADsimrv9aYe8FcbyrZR88ZRfzh36Rq4DEggpCw3JWKZTGbIFSH2LMMHDYAf598zkFLJykvJ4xnpN13RVO2H2Fz5Wrxv5VvlaDa3p1GPtpE6w74fiXxQ7dFtQN8OTvUAQ6YLp4LaSQKX0ZVHsBilum+2nrLIIo+nl0JSWzWD70wrk/Q69IMBU8GfGINjuAZErg8ANc6RbcKOZKCUXcITPxRzYIE3AK0zlECuxCZo7r9h+i7WPymsR5aB+oi8uY1xyAjO5NDyo55WlDi1lFfvkypvcgzRM7xQDK06vhiqHao8EBpHx3XxYsVfmEs6fSzL7e96uDavjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2r4a1SyAUl7IDniwsYIkPWVY38OWEMU/O2jyNYibpE=;
 b=G0jETdGRhLA1xrbdoSDUVdhBkXP8fm8XxppRzQjDnH72Kjq2Txy5ysCSiKmYb33K6f6+uYgWd0PY542gpaBAZXBP5TWhOAsCjZBbEMPXWWlxnfjS4eoqWirSl/aR/Ay+0LBRg9TwHWlqDoVzyPDvA1w2KLQcA3jG94j7e2sTj3Dq85eXbifE1YhhhJ05NVcrordT2GW8g8q+zRCilZsRVlJhYzqjUiB+Kb1pfcigLC67tBgpECdzG6tMsVHctG5czYojGw1nDrpiYcT55v7R+Ya8/AJfhUCiF/eQTvMk88hJS8Zb4ZgMqqom7adUq80DWrSL5fR0IE/UIlbqF8M9BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2r4a1SyAUl7IDniwsYIkPWVY38OWEMU/O2jyNYibpE=;
 b=sQ8pqGe1o24DeZpX8zcK5+bjKYncY4Q1mDmVh+Pf7+ade2cwugsC02cuyCYRWN+A6KCT6etCSqA1lFTe2i6EcDoha2306FdvtYOL1h7i+1O48OyBh1zmloyJdaIAVEWfawDRLDKpCQX6VVJhXfgrBUMKCKPhEhvNwvLIU9Uq1Lc=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU0PR04MB9225.eurprd04.prod.outlook.com (2603:10a6:10:350::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 01:09:49 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4669.016; Fri, 19 Nov 2021
 01:09:48 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
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
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] remoteproc: imx_rproc: use imx specific hook for
 find_loaded_rsc_table
Thread-Topic: [PATCH] remoteproc: imx_rproc: use imx specific hook for
 find_loaded_rsc_table
Thread-Index: AQHX149uJxrjcuAJpkyqw/T0XlmaZqwJpTaAgABsOkA=
Date:   Fri, 19 Nov 2021 01:09:48 +0000
Message-ID: <DU0PR04MB9417F2BB751C7C49B81AC88B889C9@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20211112063416.3485866-1-peng.fan@oss.nxp.com>
 <20211118182905.GE2530497@p14s>
In-Reply-To: <20211118182905.GE2530497@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02302ccf-1335-4c08-788c-08d9aaf94886
x-ms-traffictypediagnostic: DU0PR04MB9225:
x-microsoft-antispam-prvs: <DU0PR04MB92255F7205D86B206BD18977889C9@DU0PR04MB9225.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j0oK2rTXESgzoTuHyNXQe6ArMozHCL15PZhJCdjidvZrkObf6J5y6/D/CdlXYE2hPyrD7ZHSOcL5O3GFPFnFMcO48B/5G8Vm5tM6Wq5oThYKh6lKB19C91mfC1mNuOo/9PaLYD2r0hM3fOr9fy0EHR2vGmkCyT5aGV6M1gtarCBRnnX63X488+p1f24FxVMOswo/2RYpqQ8t1p+xbKfir/YXxDdJTIeYS3LPlVReP0OcPTVMEekIynYG8gNztAYrQY6rq1CSZuGfDtyCi7rybxu9EPXN+tRiTvVnDjAlSvlKtA1XCB/tGIdvautmHvenZrX7/M5NpLGyg2dNXHAbkARrgAtIqVsV/hCbltMctKEaKGj5pRuWJjyQ+ttPqFqyBdXfCwUvh9RfqZVm4Kk2vvxtGnOH0ns+z7ixvehv0mq2wUrjt0nvgsWnewXCJCkjLNJdPy62KjzhbBQRDjV5d0ijl/zxPuY8fm+CmCNTSWLsfPkBD3iIFVVjSxl7ws+Dv7H3LriX1Dq3C8tzDGtwtPZx36upw8FswE4a9qGcvG+lROIaq9rpeedahlzGirmft4BRoXgpHl1iZCza6ohvuRqWVRnPnesk7sRtkGnxXNu903mXlKaJpHxhXyGGo0kdqw7wEtR3zCudXM9Oi3TSp8TK22x4I4hL8qIHwvbv3r7HU0Cnc09V1Ha4drRHs9hM2enx9izmMRWlpsnvgZl+DQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(64756008)(66556008)(83380400001)(6506007)(66476007)(9686003)(7696005)(66446008)(38070700005)(8936002)(52536014)(186003)(316002)(38100700002)(26005)(8676002)(122000001)(54906003)(110136005)(66946007)(71200400001)(4326008)(44832011)(5660300002)(76116006)(33656002)(55016002)(86362001)(2906002)(7416002)(508600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VBaXIdcLqn55I8IbQPYbyGzB8js75igr5pImblHUXvfnD3B2PmHtPQHFOuvq?=
 =?us-ascii?Q?agdZxDKpsTjLh0/GQ0ogc/OfYJXXLBIj6GwowpAqrJCLuee19RchTu188zui?=
 =?us-ascii?Q?aVFacHqFr27W2H3KeDYDJzG+rtkHj8j0svo3PRL6pLc90tWCh/8jKzmxFVJH?=
 =?us-ascii?Q?7Ld6hdXxOqnnxSHf/ZZOssmRtIJdp2c+TTczV5u+0Fu714PNPdohfv4cmyRP?=
 =?us-ascii?Q?jOQS743g0Mu0Z4Nz4gxPj48aNQI7XpxtnHwX0g7ouDSqV29jzVDNmwoYoegb?=
 =?us-ascii?Q?iRjoQjUwvGhsotmP8Yuj/L+MqM316ewdjGz5q3daAhNMCr7G7Sk9Fnifi7+v?=
 =?us-ascii?Q?HmuUGb1QWjd4g8cz/+gsSv3gs2r3jKMnxw2yyIdRz3HktKOGooki9EvuOg1J?=
 =?us-ascii?Q?ha7jeN1YpxeebMT5eG/9IOBCktXrG6O7xAYVIWleP1cd455hoB1L5Jn3JZlr?=
 =?us-ascii?Q?z67AcqNnSGh8DW45IP3IhdvinjDbKxH7gRj75isWH2GLNuGrXsHNFpvgwSa1?=
 =?us-ascii?Q?VaPcW0j5RWnZOu/kjcsEBSQm9nH7xAt9saJpthCZhMLwP7u9AmFPgq7cxARH?=
 =?us-ascii?Q?1OpTS9LnP2gIm07zWOpuliReFMUlagflQ6eiUcsW0D6lSK+vK7rswhLbhFbH?=
 =?us-ascii?Q?bh2FPvroCoJfx8jAhDjXNyGDRnPISe8C0v1Ktxv2Hy2p3OaUgJPdiZjMdtbZ?=
 =?us-ascii?Q?r1oBJjnH/F1AMYrecH5GytEM/TWMB1tU0B35M0Qm5uUpR47+/8RBaF+51shq?=
 =?us-ascii?Q?RPtaaQOVLPsv7H0bJerB72/A4OeVJWUq3u/+IoNGiiCusWm9m3BR1aFMHyqw?=
 =?us-ascii?Q?kriZwNMKF627zAjaOlkJvlig8n5xVDAf1TfCSVN4vVF/0te1M0Ilp+DkL+gl?=
 =?us-ascii?Q?90yW5Luzad+dHR1b4pqkuANyhrMuVo6hBUuJ8oU72EmmKidbl0gx+FE0s2Ib?=
 =?us-ascii?Q?9pekPN2SpbT1qt3SgP/QLms+PKBQoTsZG+MU1T24YuIcmvzYNl0IHaMyo4NL?=
 =?us-ascii?Q?0kBkbTy2QAJX03XdVvnW6oru5/LIMnBaANXUfoWD73EkcY3JryAw3NLg7v8/?=
 =?us-ascii?Q?qDbD3ERGeRkfZGywOEtWE5V6Q404hCaf76K9P29gwOaKUp4y4zPl+L4jmxaC?=
 =?us-ascii?Q?nEvhcZfVGrwWbCv3H12z8IGTIAKLK1g0zPMHY2s+uIrudocSOS8s5Ejk+8bc?=
 =?us-ascii?Q?idfgkOhkSu8lkUqw+bmlGqyd+WLwKjEm8Ils27Sn8Do+/ruX7SxPmwjC2aNS?=
 =?us-ascii?Q?/rTevXnICdIgUkMfAzQszxN3Wlj7nfMavkEfLc3wwSIP6f2L2p5xtSx4ZCls?=
 =?us-ascii?Q?pvQ/zLHAExxHX7Oprt2ewbNsbw5KBV3I6+snyyFNp/n4D6CjniFbafYuMRDz?=
 =?us-ascii?Q?5VvOSot29euamKce4H93Hrud5gcvAv4p3MufpqCPhUWYYbvywvovOy2af0Zg?=
 =?us-ascii?Q?8AEsgejnfZTB2oHYo/JWvqaXABSfVk45hMyMbpVofFza6MAWECQgO9614cWZ?=
 =?us-ascii?Q?bKqGTO0/Leaflq7Y8u7hdymwHQG8MhVo26Xo+Q+nydU03oir978G90osqPGe?=
 =?us-ascii?Q?G2WY2Gs26YWy5n2Kra6aU+rYQQpPQgnqOKFXhpXillxsaHhoBD98rtjI/Dz+?=
 =?us-ascii?Q?NA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02302ccf-1335-4c08-788c-08d9aaf94886
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 01:09:48.8572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BONNXzparKRjtEs5S/Om6zwmZbIr2NzK95NPsuCziz5j+FCZ1GK0n1k1nz4QCYGxDM7nTy7W5TKjcxoM6QzWbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9225
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu

> Subject: Re: [PATCH] remoteproc: imx_rproc: use imx specific hook for
> find_loaded_rsc_table
>=20
> Hi Peng,
>=20
> On Fri, Nov 12, 2021 at 02:34:16PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > When loading elf and kicking M core from Linux, previously we directly
> > use the address of the resource table in elf file. After i.MX8MN/P RDC
> > enabled to proect TCM, linux not able to access the TCM space
>=20
> It would be nice to know what RDC is and what it stands for.  Moreover I
> assume you mean "protect" here when writing "proect".

RDC->Resource Domain Control

Fix in V2.

>=20
> > when updating resource table status and cause kernel dump.
>=20
> How was it possible to boot an i.MX8MN before this patch?  Why wasn't thi=
s
> part of the patchset that introduced support for the i.MX8MN?

Actually the NXP MCU SDK not check the status bit inside resource
table status. So whether use elf rsc table or rsc_table in dts, it not matt=
er.

Recently there is an update in NXP SDK, that enforce RDC which will
protect the SRAM that MCU uses, so linux will not able to write this area
after "->start" to kick Mcore. So update the status actually not work as be=
fore.

So we change to use the rsc_table indicated in dts whether mcu kicked befor=
e
Linux boot or after linux boot.

Hope this is clear.

I'll fix in V2.

>=20
> >
> > So let's check whether rsc_table is available, if available, we use
> > this address.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index ff8170dbbc3c..96a56ab39ccb
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -497,6 +497,17 @@ static struct resource_table
> *imx_rproc_get_loaded_rsc_table(struct rproc *rproc
> >  	return (struct resource_table *)priv->rsc_table;  }
> >
> > +static struct resource_table *
> > +imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct
> > +firmware *fw) {
> > +	struct imx_rproc *priv =3D rproc->priv;
> > +
>=20
> This is lacking proper documentation.  Please specify which remote
> processor is supposed to find a resource table address in the device tree=
 and
> which should rely on the address in the resource table.  It would be much
> better to rely on the remote processor model to decide where to get the
> resource table from, and return an error if it is not where we expect it =
to be.

Because NXP SDK not actually check the status, it not matter.

For others not use NXP SDK, I have no idea.

In this patch, I just check whether rsc_table is there in dts, if there it =
is,
use it. If not, use the one in elf which will load into SRAM. I could add t=
his
as comment. Is this ok?


Thanks,
Peng.

>=20
> Thanks,
> Mathieu
>=20
> > +	if (priv->rsc_table)
> > +		return (struct resource_table *)priv->rsc_table;
> > +
> > +	return rproc_elf_find_loaded_rsc_table(rproc, fw); }
> > +
> >  static const struct rproc_ops imx_rproc_ops =3D {
> >  	.prepare	=3D imx_rproc_prepare,
> >  	.attach		=3D imx_rproc_attach,
> > @@ -506,7 +517,7 @@ static const struct rproc_ops imx_rproc_ops =3D {
> >  	.da_to_va       =3D imx_rproc_da_to_va,
> >  	.load		=3D rproc_elf_load_segments,
> >  	.parse_fw	=3D imx_rproc_parse_fw,
> > -	.find_loaded_rsc_table =3D rproc_elf_find_loaded_rsc_table,
> > +	.find_loaded_rsc_table =3D imx_rproc_elf_find_loaded_rsc_table,
> >  	.get_loaded_rsc_table =3D imx_rproc_get_loaded_rsc_table,
> >  	.sanity_check	=3D rproc_elf_sanity_check,
> >  	.get_boot_addr	=3D rproc_elf_get_boot_addr,
> > --
> > 2.25.1
> >
