Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776EEC4338F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 09:59:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 574CB61029
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 09:59:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240000AbhHEJ7b (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 5 Aug 2021 05:59:31 -0400
Received: from mail-db8eur05on2084.outbound.protection.outlook.com ([40.107.20.84]:1849
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239957AbhHEJ7b (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Aug 2021 05:59:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ctp/QLCxqsqjYgsDECMo4v5qp8dEalfdRytgWQLwN4pSuZiJwCEwDtfkjBj+FA1fZf+9ZSvpFyof/M9aGJExrKh5sh9degxG93uI+CDN4tRp31ic9P5ZB9GxDrpiyeoAur/TsOHkhzxbKRiQrcRDH8skYUk9zoydHdZFlNFZinmub1G6BjbqDxiHqWHOGay7KI7SFQQquBHLNpXmZ9/k7bYWFKLoPtxprDdQSZY2IROcU43Y766tvL9eAFpECx0uWCUAqjGhs9CUH1Q+fQ+vztkgsQNQDj0UyIGcRKzRkOFluRnkE4qw1WuVx+4M6xhbMtp4yG2BhZIVzUzPD0hS3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEt7lziLb0Uar3mCo5uHV4aC4B2KobXEAmzGe3Xq5iI=;
 b=PM4aUl0APERSYyR0vrXBOESLMmAXVDcZMoHWCbuhosUyfFwyhyA7TGy7HQ+km5BOxd+i0jnYtVBDgShJWnPxP8o7tVcsvExSITNCoS2WVbrm6gWCM3GWA3wJJ4DU390Udd5mX1BZiLzTp/UHafjcmbaB6o7YBJ9jWr10pdRj7xmezBGFHN9Ux5RPf1HjZx4ygve7lVzrxH/eKczUl1MUKRuERjUbLH67KaA8K0ZiJ/5ppxnJR5XZEPvkaYOaaNpANlIKmIReDL6dwUVidZX9GqIJPlDGmdFx8x0P8eArGvyhYIjXQvKwWFpfzcUewHw9S6yfzkFXpsbllhnNSpZ/UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEt7lziLb0Uar3mCo5uHV4aC4B2KobXEAmzGe3Xq5iI=;
 b=mMZ7wX0rmzXao/cEX090PyTfFfrPO5lJduEv3fOIYbrEbEqK/UlA4x5u3XA64N6G+E24otA3eibhdgCE4QUq/qJ//AR5dWEQrmc/1qpbbiFpzb1NA66elZFl9LyJW8cRoAX0qQpM5BduR2gG5SQ/SOcDu4TRDxJpV9Y7RhXBp30=
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 (2603:10a6:203:99::22) by AS8PR04MB7592.eurprd04.prod.outlook.com
 (2603:10a6:20b:23f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.19; Thu, 5 Aug
 2021 09:59:16 +0000
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::3839:217:6252:b1f8]) by AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::3839:217:6252:b1f8%11]) with mapi id 15.20.4373.026; Thu, 5 Aug 2021
 09:59:16 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "dongas86@gmail.com" <dongas86@gmail.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "cleger@kalray.eu" <cleger@kalray.eu>
Subject: RE: [PATCH v3 3/5] remoteproc: imx_rproc: fix ignoring mapping vdev
 regions
Thread-Topic: [PATCH v3 3/5] remoteproc: imx_rproc: fix ignoring mapping vdev
 regions
Thread-Index: AQHXiaqZDgy+XlUylk6F+oyFq7OEMqtkrbdA
Date:   Thu, 5 Aug 2021 09:59:15 +0000
Message-ID: <AM5PR0402MB2756ABF6B242CBB3F4FF10AE88F29@AM5PR0402MB2756.eurprd04.prod.outlook.com>
References: <20210805033206.1295269-1-aisheng.dong@nxp.com>
 <20210805033206.1295269-3-aisheng.dong@nxp.com>
In-Reply-To: <20210805033206.1295269-3-aisheng.dong@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f76f46e-472e-485f-6e5c-08d957f7af5a
x-ms-traffictypediagnostic: AS8PR04MB7592:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AS8PR04MB7592AC234AEB4758CF1DA90188F29@AS8PR04MB7592.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:398;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AEji68r3l4svgEGYMZ8TDy3rE4p4xPBhOmzGsfGUuIlOVlzvn6DZSzlCeHVNn1CiLCGNL3CzPM3EgRxIjt/fBn76YKu/ns8e9ESlltml8DvQtEpBdKxdKz6xRGjJpGYvrHyhowX7FM/11bVwaJVA+mSSDE06Z94LwRu1i0nAQt9lUmnftQ1CMgGNHrpJQXKJCRwfi1voWfl+obrZQ/5KVggeaMm2icQC4IEUQUyXdIK9jX9jWJeKhEajYjCI3JtiFM6ul3WWjjmmx8Z5+P/sLt1yCaVpb81ULg35ss3IA3yKZU2HTIaynZWCgoJY+MjoTHIIJd6skJiASfn37BNfXxElK9LJwIoauq6TQrxoAEqJZNlH5anc9oT4Y/x/bzSO8jIuW4rLvnhxwPiyAB5gGIqhWHJt2OaxGcYQCYhSGDV0l8zu4RUVfW3Zm5GQ5B9/4OCOLVopzXzm60rLOMLGKEqYYa5mjOulp7NpP/Ghka+WKU43P5gASIMgZ8hYVWk9v7p8NMtGDuvCd+ODGnwLPLpPpMj8Oyar5GX6VRKeGNCN4xTpYDDcl4fSL1ECxY+sW7CHNrlZ+zAfqVBwk/kpZR0fLztVGa6tY0k4lM8tESbeOZyqNiJcOwH4vlgEi3Kd854h6Dr1nKgT3+M8QAdyL2sQFq3EG8gaMwQW0KK6TcaC2MqJSdck91wI6XbrRQMbUQD2IrM+D5awwY0+CEW3GA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0402MB2756.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(122000001)(55016002)(7696005)(5660300002)(8936002)(52536014)(71200400001)(478600001)(9686003)(38070700005)(38100700002)(6506007)(86362001)(26005)(186003)(54906003)(83380400001)(110136005)(4326008)(44832011)(66556008)(316002)(8676002)(66446008)(66476007)(2906002)(66946007)(33656002)(76116006)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XxUm9ZH5bdDmzUeu9P5nfGQoW4sjlI5ImPFYoUYmCf5Aw14olUPqwBtRwk7B?=
 =?us-ascii?Q?X/PMkxXH+YavwnJ/jwEI0zSe0HYK0tonCKvnrPxkVASrKhmDplUgNdD8GxQx?=
 =?us-ascii?Q?8hBWLH5EokVcJLmpnXNTmzULf3oBSeO0IG668GoJJuPQO8xb+FfG3iqQoazz?=
 =?us-ascii?Q?ClHclrVvsB8o+rX72jsccm3mV2Ia6dhr2SBVDMH8KTMBhZo8fCMe4seltRAs?=
 =?us-ascii?Q?bWlR/F1er/4rVDpN4r2rt522yNTynmM5F9/+Nd3B2g4r8Yd9hOeEX1QxbNwJ?=
 =?us-ascii?Q?5PswPEaIt531+2resSQ0C8aOG4GuAnkJ1jjI062M9//czMxWwqB1ooKalkgV?=
 =?us-ascii?Q?KhZl2am7BRGMwNZplSGdfyA5E9ntukbcuezcEqo5VipV4cuLLeycA12kdJe+?=
 =?us-ascii?Q?UP8zShF/rNP75ogP3KH5+gRfxCSHXSliUAs159Iwy7u/4zhzWKSlA+7nwkFG?=
 =?us-ascii?Q?9MhmGqs8tvfHHgrrpABmtaK79WHOfshpPnfPg0QwMwXXJ56OJhOiCUdDDZo1?=
 =?us-ascii?Q?zTlMGcb/7ykCaNFszWjFCjqeQcodiYyliaei0QFnSrgC2hueHwGGV6jw4B9O?=
 =?us-ascii?Q?SqnSjnvx52MWh8VA7z8Y88It5UjjnuLyPQ6/vqfissJlSKu6/nRSsc4w5PZ6?=
 =?us-ascii?Q?9Ytedl78fFhBrmwYw9xE+5C6pMYzZchn/UdSIiCOAyBsfCOeHQlLtwbLiiib?=
 =?us-ascii?Q?JeImR9JHXhMcEqPQvY3jInHB9czW9w3xZoxIfw0T29hyNhtueAESObtrkAAA?=
 =?us-ascii?Q?RNIQ3iigOxmfvI0P4pKupqpdnTS1eEE0ceMYdToEfxgl/hl+yIGFvtfDAjuk?=
 =?us-ascii?Q?SBAxPkWJF7nvuE/FwMjfjWhjJP/YwR22DAqj74ykUe1gV6KDiJMekJ/6zps9?=
 =?us-ascii?Q?yC8ejR88y20PTTTcaUMoqcJU2qPMj5jW5v8/FNYrkBe8msKliSFXdtNrXL1M?=
 =?us-ascii?Q?K+hTUwx8fhrbuHfmYNkCFv/opMTNxMLVfDj3g0LS7XrbPJH17Cet9fl9o88N?=
 =?us-ascii?Q?cPeADJzvZCEPiiQ8T9w/KWKCV9lPJ6xX5rHwiKJ3gUh2rfED+eTykbyOYBKK?=
 =?us-ascii?Q?jlUpBZ1jnO7ZscxFQVhrpXIQDtriM6vUs/FARIt0C2cIwJdwDDxqD2qG4M9I?=
 =?us-ascii?Q?T9lrGsvySZQcAcpUoH+WAWPXgpcdjbzP2EKPxamwgTpykITDtKv/LVkVdk0Q?=
 =?us-ascii?Q?msnDF568/ixuO5DIuscBjHLvbjgvBNXwIBjfNrPMQGqvbGUq7+c65sx4NIq9?=
 =?us-ascii?Q?cE9VOoT9v7r1N95pXHCToXhBxGjzVbKgWYxdtSvq+m46nOf2BKNwcp/2D0V7?=
 =?us-ascii?Q?eSyPa6snv3O2iJyLEeCdUgtq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0402MB2756.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f76f46e-472e-485f-6e5c-08d957f7af5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2021 09:59:15.9084
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 195Ds1r3IdOd0BT1ryJAFvx7F4p/ZuFYpN0LQGcBm27v2UkYvQqzvO+FaS68zfK2/2vp0PanKFK0tKDkWPr0Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7592
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: [PATCH v3 3/5] remoteproc: imx_rproc: fix ignoring mapping vdev
> regions
>=20
> vdev regions are typically named vdev0buffer, vdev0ring0, vdev0ring1 and =
etc.
> Change to strncmp to cover them all.
>=20
> Fixes: 8f2d8961640f ("remoteproc: imx_rproc: ignore mapping vdev regions"=
)
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Tested-by: Peng Fan <peng.fan@nxp.com>

> ---
> v1->v3:
>  * no changes
> ---
>  drivers/remoteproc/imx_rproc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/remoteproc/imx_rproc.c
> b/drivers/remoteproc/imx_rproc.c index 71dcc6dd32e4..abfeac0b1738
> 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -582,8 +582,8 @@ static int imx_rproc_addr_init(struct imx_rproc *priv=
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
> --
> 2.25.1

