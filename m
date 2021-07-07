Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23187C07E96
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 02:23:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E935A61C9C
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 02:23:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbhGGC0b (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Jul 2021 22:26:31 -0400
Received: from mail-eopbgr130081.outbound.protection.outlook.com ([40.107.13.81]:40420
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229894AbhGGC0b (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Jul 2021 22:26:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4rKApxFFWhnoTm9kUb1VG33ZMFI4d1W7KxClrJ1V9WxqPwxERPTFzx3gg7BcOm3K7RcQWVVyyi/Ge3Yaqsqvf/h3QQch79aDp/QpxT8hTB1Qvrqi9YU5bBb36RimnmBbzsq+fTcUC6KTdEH+oDsKCHlUplV9KwpyZASq+x0RUKYDLr9c4IcJXooZo6I+tWviRYgaZWrZGG7mbERprhHIG/AYz+niSa7pevU/6V+uBdKiIk3Lbi9FopmbwZOtV7JrHWPUTeIXHq0HS0qWaQ5J32EaplBNL9/TGNv7M6ZHVr81gQ70B517CSzQpuVGeXcBMIZC9Jl3xQFkpkrVxLUSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLvHahYtw42q14vt30tRZfAHJZEBqubRjl1hjWg0B3I=;
 b=PrtR14Bt3h6v/2SnvzSyc9DM81N5dyOu8OMAJcoMCXpXyhzpKsZVgZk4eZI8w1AiA2wYIAmcFrnm2G1Nda0EW9JooTmBmNJDp5HDZ0tGYyMcuaygKuEtF5QyVOUBwdOvwVTS1vZKL/03qomUgg+avpLTLJ3C358WXmfI8rUt0F+e1IJjkxNNecRlj/oVmJidZmlR0nQSnpvFheTgGF6o6XNU05Z3IJQoasw4MNMpfC6M5psjLAIyj6URpPK/yk6PeBgwSS2I/Rj80XndlGpNVFi23NbaLjoykRoxgVOXEp5Ila0oQ2hTzDRfgzGg1QX60m1uRbPWv2WOLcvrPN12Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLvHahYtw42q14vt30tRZfAHJZEBqubRjl1hjWg0B3I=;
 b=lvS3+InGeXrxs5DUNKyiY6eh84pjV7/AVP+t+alPYyZM7ZxWOYfO30yGDtcLVwjjMUNMA25Z/HtSvT28Ff7IP/A/RPcITNDyzVHRzWBfvNvojlthaa1l/e43Si1Y35F8lcAVsuKkTcxJ1nC+0rEWIyJOAy3bnErKIyIDad9oiQM=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4633.eurprd04.prod.outlook.com (2603:10a6:5:36::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Wed, 7 Jul
 2021 02:23:49 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd%9]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 02:23:49 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "dongas86@gmail.com" <dongas86@gmail.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH 3/4] remoteproc: imx_rproc: fix ignoring mapping vdev
 regions
Thread-Topic: [PATCH 3/4] remoteproc: imx_rproc: fix ignoring mapping vdev
 regions
Thread-Index: AQHXcnVbbwT4txjTkkeojs4rKSePJas2yS5Q
Date:   Wed, 7 Jul 2021 02:23:49 +0000
Message-ID: <DB6PR0402MB27600E7E1D7D92FF85410630881A9@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20210706142335.952858-1-aisheng.dong@nxp.com>
 <20210706142335.952858-3-aisheng.dong@nxp.com>
In-Reply-To: <20210706142335.952858-3-aisheng.dong@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0daff5b-cb64-462a-9fce-08d940ee41be
x-ms-traffictypediagnostic: DB7PR04MB4633:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB46339C870C4D4707A30642F9C91A9@DB7PR04MB4633.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:398;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zpBTWMi4LRjwuScy6s7lTjlbiPfIhjs1iyNsWNGecam9j+VUdN8Dt08P+rS01lPEz+bm6mGRdFKLEaLN8SpbQieEz21FHD36M7ssa0dy5f4RD8D7r/UgWY3fckoDDcCOJ7+DkNFNVUIgcSvK50xvE/UX6GQc2JXltWRZorblJiC72XUapTx5T+HRByEH3K+SwByfNEdYvUHCLlUFql0yNpxLsch8mYn5lZx5xTWCBI4oDiDjlQFwq48x8AouW7m58YchaS4OeE9D64oXWcYZOCNqaWak4uhJ0eYEJbBGZvt8FRDVYQTgkKaUb4OzC1zKV7acIzKhsZIZnfJ5UeZfLDCsIMPfDwtPZYe4nudkw8LcnrFUAthQ9nWQTABS869G3uVd/Gj/6ffY8au97rIW5E2ZhO4vfLotUtjbz2cAaeG3Fr0AfJxJ9/w6Y/BTQqp5+dGLiUXG4qNEuAdHwGrPVSXtL/fO3j0UWVK/NymrnuCIxFa7J/Jxjyv7xmHNgcjKx1DNNDIF/ZR3GA4WobwpATpDKTEsqKagMM291bJIarIrZVwS1AOY+RvhEkryoC6WyR1ZJPgi7Q+CZdGrVSPv6x81U8T/1P6HbKIJpl2GXEX4ccrlazNP4nam3w8lik/36WHJOLjW4fFUsdieGPIx3w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(346002)(39860400002)(376002)(33656002)(66476007)(4326008)(7696005)(71200400001)(76116006)(2906002)(86362001)(83380400001)(66946007)(38100700002)(8676002)(26005)(122000001)(66446008)(478600001)(64756008)(6506007)(110136005)(66556008)(52536014)(5660300002)(54906003)(186003)(8936002)(316002)(9686003)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MKIF7btDOdXNjq08tQcSCxXxunteXuO5Ap7RRxw3nVTEKSn/KAi9Kx3D0AX8?=
 =?us-ascii?Q?C7ZyA0XGTnxvxLbcRZ8aJgLV6FhwhXz4yFkJ1ysLmdyT9tQowOfT+Nhw1W+B?=
 =?us-ascii?Q?bscE+0rUYzGowX9OMTKN30owo1NpBJ3MY4nAWSHUKZgPSYp3ehD4PZNDhkhY?=
 =?us-ascii?Q?oqKGp3MNCvkdFZZTLqNroAKpFf8AoZa9bcYid35w0Lcczd0hZyUTnWiArZ2V?=
 =?us-ascii?Q?LIbeuQe18owoxy2C1qimM/eAQzs1YVt/KPQbza3X5A65Rh/vdEPvMLH2yDVo?=
 =?us-ascii?Q?j5O9qykEG+nl+s+52nnuDqjxpftBYme4no5uSkHKBUiT1Gcbb6SUYaWvlooE?=
 =?us-ascii?Q?pC0W5tF24GtNxgJes4FHnizGV4RlMbUvoDo0BSK0CBgpOAeCzLIOIypmdd9a?=
 =?us-ascii?Q?+qjsC34rLGgluxbC9BucL8QOC5KJIXog5/day3klz3nM/aTs5I2h8CB5qgAM?=
 =?us-ascii?Q?aovDniGaSAJ1+52DlqVSRCGzF6XlP33clNYe1Kb1KcCRALjQdoNkqtyVOiLw?=
 =?us-ascii?Q?8pkCZUAY5VA98I7He5Xx7S036j+869TuIQaAup/gu0fxvKwlalUFtXDkGcTD?=
 =?us-ascii?Q?0i5XvKySNzyNnEmxsUBnPo6oFgtbp12LqiAHmd4gFYd0RtbtdiM6DawnW9UT?=
 =?us-ascii?Q?Yrig6ibTCA+p+SSgpcyESbLHxnzTmWxH7xM+8X6ZaFPBHZDeP0DoEQqAAno+?=
 =?us-ascii?Q?Sr8wmAwUc5oB5rb/w0Ut126R/qkKzsNAD4HnaJyb+gQDTi0wkYRXHYqn7E1r?=
 =?us-ascii?Q?6NTE12mYnuqHtsLyqVdRpWWSMHsOOUpRWANa3RPxSNsaUAgZRL49wYMEixAR?=
 =?us-ascii?Q?mpBoBKjgb7j1D9X6BhHyzBDDwizHHajU8JETNGRFo3V36QGWckLxLktNdESu?=
 =?us-ascii?Q?L5o63ZK8K3lnJAsamanhzHwtGiJLszqxGJNx9gh0B4hNQWKlwDk7GApCf/J9?=
 =?us-ascii?Q?ZvgIGlABT9AIuxRkBy6YN/tx+YkhAcGG57v/TnTOFjUOj7JIvG0/AsBenJKt?=
 =?us-ascii?Q?4GycFH70g8FDBU9xF834j73K1eev0vYt0705/2YV0WOfVvFEG49OgF7c3qgT?=
 =?us-ascii?Q?j7E3pUCb5RTaRKxIa5deSzySe5hfhqVv2GxtYjZzxfVdnX5BECelybLyuJWU?=
 =?us-ascii?Q?RJkq5q6eJRDF2E0Ta1uh6X7fegjDBAJNKhZcEKgJykltM+Dy1pwWFFzDlM9t?=
 =?us-ascii?Q?IVaRQeOTd8w+m+nRMgzGHC6DSxIQeUefwOiSofEzvlMclzX08qAw8Yh4MAV9?=
 =?us-ascii?Q?dWcKwT4t6vYcDgE0y+tr2py8HOieTOE2jNVbXcX/ag21hxIuPpSSoIOToUCt?=
 =?us-ascii?Q?nMRVjDtIjBlxwUJJfZuvzoUb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0daff5b-cb64-462a-9fce-08d940ee41be
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2021 02:23:49.8002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6nY6R/0JqkjppAWeVCpxfvjSWVYuU7GvM/vTv0sJqLR+1IPQlnL7UQ9zSUTWT6ybBI8rjYDt14COqAx7a+1/ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4633
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: [PATCH 3/4] remoteproc: imx_rproc: fix ignoring mapping vdev
> regions
>=20
> vdev regions are typically named vdev0buffer, vdev0ring0, vdev0ring1 and =
etc.
> Change to strncmp to cover them all.
>=20
> Fixes: 8f2d8961640f ("remoteproc: imx_rproc: ignore mapping vdev regions"=
)
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/remoteproc/imx_rproc.c
> b/drivers/remoteproc/imx_rproc.c index 752f8ab258cf..12de153abb2d
> 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -578,8 +578,8 @@ static int imx_rproc_addr_init(struct imx_rproc *priv=
,
>  		struct resource res;
>=20
>  		node =3D of_parse_phandle(np, "memory-region", a);
> -		/* Not map vdev region */
> -		if (!strcmp(node->name, "vdev"))
> +		/* Not map vdevbuffer, vdevring region */
> +		if (!strncmp(node->name, "vdev", strlen("vdev")))
>  			continue;
>  		err =3D of_address_to_resource(node, 0, &res);
>  		if (err) {

Reviewed-by: Peng Fan <peng.fan@nxp.com>

> --
> 2.25.1

