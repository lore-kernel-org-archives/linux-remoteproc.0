Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C643C433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Nov 2021 08:53:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 144A961279
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Nov 2021 08:53:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbhKJI4M (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 10 Nov 2021 03:56:12 -0500
Received: from mail-am6eur05on2047.outbound.protection.outlook.com ([40.107.22.47]:16225
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229931AbhKJI4L (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 10 Nov 2021 03:56:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtH4lBmm8nZnSzY0YU1qNpvx844m8R/Ei4IiY+zk0IAxehVh8o/B/FoDUCb6meoCSLQB+3nPMcf4nOiu7HR6gESBNDdlXNUeGS9L5skFqIRJKCY9RGB4NYv0Gf4FxUsd+BkGIDrrCX4kv53o7Rvkx5ui+oi/Xflqi1F/D0Jmcbk28igqUmy9T7h6TLjcJeuanJ1EICwmCeYnqvBqVKgZcwCNhTZCA7AyE6YwR6JKfWj9q2THVA/QHGPkLqhLLyljbCLjKDY6Szp3qBe3Osu5A+cFJLKQJ2EfC5SbISK+vQQvhtwK+KZPFOOFqWGj2XmqEFfaVk+8VeN25B49hY+hvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MoXif34hdIrIoHaBqKsFeLYrstXv3vRZHq95XiMpev0=;
 b=TIkKe8Bq/0v8om3h8u9HnMaDH1d+VqCdvG4fWO4UN83weNS588OOGZr40E3OGxcfW3fpqdoCQTOQ06h/UnYTXfIlhWFzb2DSnR6AoHXHEE/+jmqLurBp02Mxf51YIa+89IGkZ/7co+upj/3cEUyxtdzSG6JI2R++LvQcvNyBOAM2gPnWGp01YI7/J+6gHysfRz+cLI6DnjfSZAPwhyK51un7PGHT3sH4c79C4aRXxb7dKItgVENailXEypCe8MTjjUpclTCo+1/6PBWKHL60YtO/vCi2mKsOOc3RZb1dmIoB45CD2wGjqo5Kc66J1lI2ImD/y8kq4AEfqzen8Ur1yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MoXif34hdIrIoHaBqKsFeLYrstXv3vRZHq95XiMpev0=;
 b=jdjP3MoM8Ce7wfAjnO59F2jGV9n5ad4hr/huRm7tWv7nVrUzoCEGEHuahSv1FdIwKBE0N9YIJheF4nD9Dl1Bhj0AxJjK6p+rc6kEaB2qi7GB7LYFD3I3ZM/pCpGOVtOKiV3YmOiVEYylPHjIc9GWyBo8YwWXInhO0KNGuKGjFwI=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB8855.eurprd04.prod.outlook.com (2603:10a6:10:2e2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Wed, 10 Nov
 2021 08:53:21 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 08:53:21 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Hongxing Zhu <hongxing.zhu@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH] remoteproc: imx_rproc: Fix a resource leak in the remove
 function
Thread-Topic: [PATCH] remoteproc: imx_rproc: Fix a resource leak in the remove
 function
Thread-Index: AQHXwllGUAnFZVoMdkqW8DriEOlDKqvdwPEAgB7Y+qA=
Date:   Wed, 10 Nov 2021 08:53:21 +0000
Message-ID: <DU0PR04MB941768B7C12EA715D0BB553D88939@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <d28ca94a4031bd7297d47c2164e18885a5a6ec19.1634366546.git.christophe.jaillet@wanadoo.fr>
 <20211021174104.GA3562838@p14s>
In-Reply-To: <20211021174104.GA3562838@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1929c75-d1c0-4c05-0408-08d9a4278c5b
x-ms-traffictypediagnostic: DU2PR04MB8855:
x-microsoft-antispam-prvs: <DU2PR04MB8855464295E3946AC585AEB788939@DU2PR04MB8855.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D0xWndyF6N+inhyAhxB2g32j0Gq1JH4pxDVrwqiz5Yi3GMhmRsILrqlwd0bRTPebV02H7uAtTz8tCKMryTJ1rwtWQjMOoQom+sflm8z1RLpEtZYAbj+b6rctauaTDnAKFH/KU+YpxD0/M0I3IlPXi1NsGu8H3A21Sm1olBMhZlLY2fWfcHuKPZCcUUsv3C87ozwxT/6JRWtZl4+z2GjLnYOJ8cTtjY68hWezMQ5hvLWdxjwlbfsQ/7E5U5jKb0R84t8w/4Sfzx6hb/d+b8qbUU8RDpiPbhnsfZbYxyprYQNX0I3cN/n+5kiY1dIbKz7InjuI5PrJK+lJjIy1VPs5Ah7HbZoAeLJOW47Ob8y2xLo6muNH6oXk1wIhqn0RSzZUxx9RcCQNDFcfohmYhLUoJAVMpX0iCbcLqx44L7MLfy403xzbmy8l63WIUhu0B92SfLzCfrvutlKk1GRHA7CaGl9WuH2/SBEnZj9kflTBR/RLJqQde/0Rc6aiFGL6gxijzXcPybwuvMD8+6nGwR/0zLXrJeNiCF09b+9m2GPlMXmau/+NJRaIYJiteiFEhxzT6MSBn2wHv2qmY+QnZvOX0tkjh1xJcd40Db9jbnbM82EAuATJ4UEZJ1fR2FtlKYR/g6L/IaCkVcfSrXq+UCjMTgtZaT5Sy+xahoeUXttR84rfwjhak5ZkGivirs+NSs9TzaISd636HZbbeiQa/toiPg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(86362001)(64756008)(66476007)(38100700002)(66446008)(66946007)(7696005)(7416002)(5660300002)(508600001)(2906002)(33656002)(83380400001)(76116006)(71200400001)(122000001)(4326008)(54906003)(186003)(6506007)(44832011)(38070700005)(52536014)(9686003)(8676002)(110136005)(8936002)(316002)(55016002)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zx8OpoVz9cpeXGgczGE4nl7HyW/p7BshlS0Wm4pojVcpCNHZSav+bpptcto5?=
 =?us-ascii?Q?e/u/QGK2RcHHzYNGl5I4nCwI41j1USII9rPx07Lvni8mslW4JPrSZ18CWqnw?=
 =?us-ascii?Q?d3Lna/28GuSAo74M82GN6jPIROG5XhMKppSrjR+gCSrRKa2xnJeNc7/8OQAY?=
 =?us-ascii?Q?9zxrl85ZYD7fgpnvZbhfYfbRm4i2wUkDfj6TAEFaJ/WhVE9bZNQF4f+Kx1nD?=
 =?us-ascii?Q?yfeWxcsFd5nrljZs4Izvu95eZjhAOBL3DfjJ+66cLvGJJYkjVPx+1INhd3Mb?=
 =?us-ascii?Q?FMvn7JjWxkkVOkVenmEgmWf5RxXs2CSCfIz4BCMbwuDdPpDZBSimsxw9Gbh5?=
 =?us-ascii?Q?6PHyjaECMSo3kvp5lrg+uczdF1YFf4R3FDwnGBiukMwk0ifuozEu8GzafT5k?=
 =?us-ascii?Q?7iiY1jn33UwdEAQ9dNPOknP1LWTpiSK836OkunTC+AtYK4y2EQ7GNN63MYEJ?=
 =?us-ascii?Q?K6rP8ZM4vOYxc2b3tdece4p4+jozgXxDqRxxPybBu25Eey41WWpdYCDHqLCo?=
 =?us-ascii?Q?xEo2fEoktosOvKryHRbnKFOJIVI1iR+dLM7IpOWihGGKI65FHLabyCE82Sxl?=
 =?us-ascii?Q?Ej8Evdvaiy8o3hZ3blHeJYIuZZU3K7jjUIaQ6wo87IuZhW+rjsv07FhHVHwh?=
 =?us-ascii?Q?YTAQu2VSeoqNAn07/am09MoklFZ17goXnNRswLUw7XKmHyjj727p8r4DQ1ya?=
 =?us-ascii?Q?iY4LmpkfWLMszoW0P7PG/8hYKu/MyhGr4Bus/0V7UGbX+gFtmyQQTW6t1KCF?=
 =?us-ascii?Q?KtIKHMXmZWwOPoCMoqOtPWR1EAUCc4YZQqISds9Xp46ZQPytcYLKIhT56/Qm?=
 =?us-ascii?Q?y/JfjR56wxhxZ0OUjMX7Lj+UFHsUdsRHLJzk4YgsEAR+0HVg4LwIsYUiguqF?=
 =?us-ascii?Q?c6/V8lLfAQ2dNGE88vRw562XHd6tDfLUD9aoZjf37HPKyg/tj6sxdmzlutQb?=
 =?us-ascii?Q?gagNnJT/ZVK3Yl+HqG7k188aA489hbfDiplUMHIjVJAVWdw5/OHYQLPNwDUe?=
 =?us-ascii?Q?IjbvyXK7Tzc3IZxgCD+jl+eqFFZeJI1TfJmhe5o4NdRBgG1EklAQu4c2EQ0j?=
 =?us-ascii?Q?N3JuXjXft9cQgnFBOpUMncvQGzAIcr8y8GTFPtS6mQFUR+ARFr6hwXg4dXcY?=
 =?us-ascii?Q?5CXD3PIm8g4VsISx8HvlWU+O+B0vUUqGjLSJ6AcIREKHzr28q9PnQzLeh5h7?=
 =?us-ascii?Q?AzhooWLKdjOr2xGYEGzNt4J6deAu7Y6pMBtGtoKwJGy7JDAiWgYEU8Iv6h11?=
 =?us-ascii?Q?RVjVDmEAR75C6wuW3ddVKrSiBOd+R+dKvIn45nGkwRc5cnWLv71UcMQV09/K?=
 =?us-ascii?Q?DhCO/yNbTqCsp7uGWUapC3GNmo5a4y48gQCBu99/PlJ0+/6P8STVdlJSrRtz?=
 =?us-ascii?Q?krl4MDoQo5TO8zQVC6RMmXihIH8sUoso/S1Lu0iIUqYlNqKGpMtMWq8syO0v?=
 =?us-ascii?Q?tdW1hrke3Pdp0EbeKwGcmb9TLqqoZn4sLpHylbm/20qM2j+UfsB7OPaxHT6U?=
 =?us-ascii?Q?/4kWYmRMZfFrwakYQiC5o4YQeBO15HtKyAUZGwxQAuUmXhw+JB/NQgxTv6KI?=
 =?us-ascii?Q?yrEIg6mIYU5xs2GAGfeWvK42OgOa4BlpuHyfUENP42t3NRWB1mN5sn6uwLP0?=
 =?us-ascii?Q?CmCG375VWvoIS829mjnA5LU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1929c75-d1c0-4c05-0408-08d9a4278c5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2021 08:53:21.4234
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XFtvViQbzlWHMio+Tci2oaedzYgvVsPyIXH2/ZSw6qMHR4n2Tu12+mmUJAzDexmpMVHEmE8o7Z2yviciBBjA3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8855
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: Re: [PATCH] remoteproc: imx_rproc: Fix a resource leak in the
> remove function
>=20
> On Sat, Oct 16, 2021 at 08:44:28AM +0200, Christophe JAILLET wrote:
> > 'priv->workqueue' is destroyed in the error handling path of the probe
> > but not in the remove function.
> >
> > Add the missing call to release some resources.
> >
> > Fixes: 2df7062002d0 ("remoteproc: imx_proc: enable virtio/mailbox")
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> > This patch is speculative. I'm not sure if the added function call is
> > at the right place in the remove function.
> > Review with care.
> > ---
> >  drivers/remoteproc/imx_rproc.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index ff8170dbbc3c..0a45bc0d3f73
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -804,6 +804,7 @@ static int imx_rproc_remove(struct platform_device
> *pdev)
> >  	clk_disable_unprepare(priv->clk);
> >  	rproc_del(rproc);
> >  	imx_rproc_free_mbox(rproc);
> > +	destroy_workqueue(priv->workqueue);
>=20
> This seems to be the right thing to do. Peng - please review and test on =
your
> side.

Sorry for late reply, I built the driver as a module with this patch. And n=
o issue found.

THnaks,
Peng.

>=20
> Thanks,
> Mathieu
>=20
> >  	rproc_free(rproc);
> >
> >  	return 0;
> > --
> > 2.30.2
> >
