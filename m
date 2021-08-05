Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E1DFC4338F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 09:59:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C01D60F58
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 09:59:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240003AbhHEJ7q (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 5 Aug 2021 05:59:46 -0400
Received: from mail-eopbgr50075.outbound.protection.outlook.com ([40.107.5.75]:65187
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239957AbhHEJ7q (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Aug 2021 05:59:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVPZjaC3CjYcKLR7LIHfhqjvNB0HezfWlUYI/RZgQxppAQXowMuTs+ziTIGWj0FBpn9E5a5x40piavRQkeT91cB9ltX9lJTv5vw7BLomd4tVHXIEHXqF8CZubpW6pesQlgD07oWeXuCcdcJ5uPjACFBe/w+IHHjOV2VsR0aAa1v9v9C3dQBmd/00BidsGFRePy1tUEORj7LpgAb3tUZ4yuRlV85fy1+J+5W/uaCHFfBcU3rMMTTBugyAwfCp1urOKFFQBXUB2vrUpoel/DWfcwKov7LJyPgCrZqV4xgDNLYGrB1nf1CLIFiecFR/2IcIhqC8/AXlk28Z3EEm4a542w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsBIpHhwXE4eTcA0MuTl1hVZZtJITrEM85icS8PJX8o=;
 b=arwQKRkQMzOFoZ+9mlTDW1/AFPZiUrqfRnbOBbOYx7wvmAHHPEWIDeoT6WHLBsG5+n5pfwtB3W+7HKOl5YI4VZfODuHhHx4oRUrFoXEAFMiZ+T8qrKO4TZLHcmO8duHamhdDqyxrCUEXBbGAEDJ+K+2lTkT7yKGR6db5OylEoBheaqURv/m6Mck0FgslUog/+baRdIsTv+ROzLBR44NM6GEiR71yKCTkxrOSB52lnq3FMp1fJeISuiUOTH7WeG0hH9+ZRPhSKCUCCUqb0bSWe5uvbw0jNHxGcQ+EG8JyjBX5IMfosMOglA4b10+fnK5Z3Peh2G3D92hXbdEekZDclg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsBIpHhwXE4eTcA0MuTl1hVZZtJITrEM85icS8PJX8o=;
 b=K/thYfBAkjjwi7mX/+C839OxsPVTnXBW4lFKkCcyl4dlP/OwLPQUJTKFuDqPrcU1SqIg8jD7cCvdav0omiRVW9C38Ns0SNQ8430Nq9nxD6bWH5q43szTH9ahrtCIFYDp3YHgDVsFBrJqatnB7905fH9pLF7PgAT4RiVUlaYwyQA=
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 (2603:10a6:203:99::22) by AS8PR04MB7592.eurprd04.prod.outlook.com
 (2603:10a6:20b:23f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.19; Thu, 5 Aug
 2021 09:59:30 +0000
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::3839:217:6252:b1f8]) by AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::3839:217:6252:b1f8%11]) with mapi id 15.20.4373.026; Thu, 5 Aug 2021
 09:59:30 +0000
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
Subject: RE: [PATCH v3 4/5] remoteproc: imx_rproc: fix rsc-table name
Thread-Topic: [PATCH v3 4/5] remoteproc: imx_rproc: fix rsc-table name
Thread-Index: AQHXiaqbPyiITqJEGEunOqXVj6BTKatkrcWA
Date:   Thu, 5 Aug 2021 09:59:30 +0000
Message-ID: <AM5PR0402MB2756860A9D2C7C9D00447C7588F29@AM5PR0402MB2756.eurprd04.prod.outlook.com>
References: <20210805033206.1295269-1-aisheng.dong@nxp.com>
 <20210805033206.1295269-4-aisheng.dong@nxp.com>
In-Reply-To: <20210805033206.1295269-4-aisheng.dong@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e926aecc-b191-41c7-2a87-08d957f7b81a
x-ms-traffictypediagnostic: AS8PR04MB7592:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AS8PR04MB7592407EF560E16FC89F9F3C88F29@AS8PR04MB7592.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iHn3NEUMNwdEbnXH7aHvO2k6C60Ajm07GSZElS7i1KTfLHbpxRQI2ye1IfSOoAUpsVNDmou6wF+Csgie1Kkndhc81FA0K+NWCplwVL+yRbpVGfHKjki6+xQ+/S7IbAMGqkJwX+l2ddeXaxZ3Z534YOj2IyanwU9xmRg4j8nfNoDRJuKYLQl7o7fFSamAcXpNcxuMSydFrjs7AipVaOCm4zPXTlrGG/8cf64FBlBDgiraK3XXg42lnDaK6Mhq60ykps2L5FNWVHp04BxB33d6PhoaNHn3psr1cbZ+gekh+d+g2aVTcURS+vkrFXN9caAh0AG/lZFnyAfYVRKnr0rKMzuOCEaLR0gGAjpr6/19l+0XPL9ioP9m7UO2V7ABtqrIiB7Cx+xURA48shd4Uu95nGxOpECeO8cXt/Zkh6HRem3DYe2KNKIf3Ks93iatRU+NeZgjnuFkpq/zz67rZ16Xz7FZ2HzB6d0ODjFNWO0Wkq9MVCWOqlBUJt1oahAUgDOSe256La/edeetfBIwbPx0vyL9ilPjINisYv23bh1cUCmnMfnDpQVm39BQKSLdDaVSF4d8yZuXkFXpf6Oa6Zv+cRCTzAj1AKsV0FqT8HOhaPcl1gQ2KmI+Rs1Gf98YYGI1spzBy9fGNGl8rcoMiSzbp3DZ6qgYT1Ie6fk2LfKTwVEZO2EJ7/L9CEOROKFk58w1NqFepsJXCEdY8xiEXupcxw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0402MB2756.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(122000001)(55016002)(7696005)(5660300002)(8936002)(52536014)(71200400001)(478600001)(9686003)(38070700005)(38100700002)(6506007)(86362001)(26005)(186003)(54906003)(83380400001)(110136005)(4326008)(44832011)(66556008)(316002)(8676002)(66446008)(66476007)(2906002)(66946007)(33656002)(76116006)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YVqcIb0J6mQ3K+7QUBBOa54NjOqVlfrwYOY0N8rcYr6VzTCB7I2glyChg2zL?=
 =?us-ascii?Q?dvyKKEfWxzgUgMuqjOgyJmvYhWIwwOGKgOSkTlWUfb5vvXjyXPSC3APcAqLa?=
 =?us-ascii?Q?Rld1jfahh6fYZUQgXTbuFdPzEtW+/c7jkVBw60Czkby5sQOWhxieLUJSa+7f?=
 =?us-ascii?Q?UZZA89OAewI6MbLMYMhNBktxY+ej2jelmDPyjh3ZCWMr0AsXSUzwySDl4f8O?=
 =?us-ascii?Q?RGY9apXYjrcKjXhsxo+U8PiW62NedaWi4a6Y/EpeGKAHqjKOzDypTaxBTEDr?=
 =?us-ascii?Q?cKUdbTtG7q5YK2cSyxG3qFNURKGKMzXS6mdlLLf8X48BVZD9an9Aw8tQz4w9?=
 =?us-ascii?Q?uAECTr/y9chQUZllCB1eFmF2Zz+Vfz3SUIDWvzcTUt5D9mvk/I7FKGb7MWGO?=
 =?us-ascii?Q?zamid2BB4QhlZaxBqfPEbcN9zB8wnkYZ9BU9aAjs1JQkqtQNk5w+zORGLWnV?=
 =?us-ascii?Q?Ulbl6fnsggWWThwtF53BJmG+Y+M/rCGazNBqoEJROxCx3G74rpFNTegfkZBt?=
 =?us-ascii?Q?5ol6w4Ex9ZGwHw5H17MMNvYF3eWh1MZTF7DPpRlCa2CMzsEL+JxWkWsF74EE?=
 =?us-ascii?Q?EB8orqXj82+uCL3NRfdqJgeHIuhPHf/BJnHlpfc6deVwrJX/s/eoajG9pBdC?=
 =?us-ascii?Q?29WwwMw42/L+DlK6gEmbLhQ1mYCbRjIoazY/Ms0cjtDXFSLbqK6dwjc/CBzE?=
 =?us-ascii?Q?QF/5Lc/QXgkJmXBHATzUkG2kbzAWViAQC/K/MHxg0bj6BWK7gJvJ9sL3kCno?=
 =?us-ascii?Q?to2H1VdVImfN/Iv6fHaysqH/6JrSQnjlUhh4puca2ZWn8GU86P4JjtNnCtJd?=
 =?us-ascii?Q?HHSYo5Ra3YbxlvdHhqdza0V3ME6D4WGAsffmsk6wXTZ6Q9Ai8g3vT9yAmsMI?=
 =?us-ascii?Q?nbP2fzEz+Mv1aSDfBztBaFgYWFaWS0BAb+zDJuu5JgpgTzsaXT5nBVvss5wy?=
 =?us-ascii?Q?sQvZbNElw0/oUcfN4A1NJilNOl27ZOUpmOD7XVPhkrxxbyRlm95kh6HGDaSj?=
 =?us-ascii?Q?L64OZyWD0cK2QGk45RAESEEEm55Xt8AVaw4LWNzzZer3IGn4kd6zcL8eGosE?=
 =?us-ascii?Q?Xm8c2E0VB4KNqBCSKvwt/2kn96lp5or4wCzcLz9BGmroDm6lbMJtTywzOS6K?=
 =?us-ascii?Q?R07njNuYkRUap3AA8KZ6PP/cXtbwKecyfQ4XxDqCSISHYI1fhvLWU63alp5s?=
 =?us-ascii?Q?I0pVGk2a8v4hvDxjWCSQKNfShkILQvsGY3WFuFO0qrtTmRX6YikQf5eGKXIs?=
 =?us-ascii?Q?7KhwgO+6xCY4V72B/I4tNhSCD+PmEnOTQLLu4uLHB1keNcyKO6yxnBxncIBp?=
 =?us-ascii?Q?9CVntLMVIOvNu/5QgTKCzb1J?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0402MB2756.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e926aecc-b191-41c7-2a87-08d957f7b81a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2021 09:59:30.5987
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fNSxiARQjWg8Ytm4teWTjBL9/Ph+0LHJbS8X0DyKprKm811Pks1sXX4RM/3WXLyC/Rf/gEU+le4RB712sLXkNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7592
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: [PATCH v3 4/5] remoteproc: imx_rproc: fix rsc-table name
>=20
> Usually the dash '-'  is preferred in node name.
> So far, not dts in upstream kernel, so we just update node name in driver=
.
>=20
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Fixes: 5e4c1243071d ("remoteproc: imx_rproc: support remote cores booted
> before Linux Kernel")
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Tested-by: Peng Fan <peng.fan@nxp.com>

> ---
> v1->v3:
>  * no changes
> ---
>  drivers/remoteproc/imx_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/remoteproc/imx_rproc.c
> b/drivers/remoteproc/imx_rproc.c index abfeac0b1738..ff620688fad9
> 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -604,7 +604,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv=
,
>  		}
>  		priv->mem[b].sys_addr =3D res.start;
>  		priv->mem[b].size =3D resource_size(&res);
> -		if (!strcmp(node->name, "rsc_table"))
> +		if (!strcmp(node->name, "rsc-table"))
>  			priv->rsc_table =3D priv->mem[b].cpu_addr;
>  		b++;
>  	}
> --
> 2.25.1

