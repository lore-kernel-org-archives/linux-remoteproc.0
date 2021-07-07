Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6F3C07E96
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 01:42:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77AB161CB2
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 01:42:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbhGGBpI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Jul 2021 21:45:08 -0400
Received: from mail-eopbgr80083.outbound.protection.outlook.com ([40.107.8.83]:56032
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229949AbhGGBpH (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Jul 2021 21:45:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRhQpGagvf0eStn9ffMvzVGHRLavF3u9cq3pacQ2/+CH0TSrIGWIkxMJWVHJ+e0ZPcMV1Y4XXVz4h7gQAgecmLKzW15cxt9IPncPMrHAOgmaVfMKwoYclit4e0nDG8Z7uxNeDJSaAYXhPkrEe1nIqy1GVtuJo9sQc/zV/UTTHfsaazyfIvWvVEB/UnVwoeP7tg8eRtj6bywTjTJV8B0HChenA4TmbS73oFww/4PHf6dZYYfj6044igFo5WtCwRAmewWX/LWf04KKUOOFBp1j05R99YIIq1ctcIDj4bV6zevkrsLSdSJoexIc7EWuAym/wE/SCVyP8LwfWhK8SiQ3XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6iuU1w6XMpYMLju4IgH4xP/qEa8+uJ2pwmDDL9M7Jw=;
 b=Ce5LF4Yj95bV8FeHElPOW03HD9zVVDje8cbp8bSdi6pJuAMsy9/IvGfw4dVounGjIirYS22FZ0DkEeLhYEe/0rkoAGlyTaEjthFJ/HsMzdA4mH/U0wnaVVqIoovrQzmAjvEpXPaybYcpmMixjc2juggHvhUMdDJVxVabdKmFIvknHj0QX5fnlcWr2Py9UlDAXFoN4Go4CpppYG4yM/lWSkTxzd0YZLJqs4jPtGau7jtvbaw8hK9M0+PRx4cQUXV3piq8+b+4f6RXUNYYetINFYNcSOX2163yQmvysOuAlVMR3UQLQy5ByrfRd313FfXBzoo5Cvousa2J8BYSuwfJaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6iuU1w6XMpYMLju4IgH4xP/qEa8+uJ2pwmDDL9M7Jw=;
 b=M2PoRYRy4Frjbg7Xe3BcjQrEiobhNqI6WDfPgTxxodOoKKmSNdYbvkF2Q/GoVoDXJl6dnOHH8WFsDs9Eg0Gl/hYwZD5j0rSDPCWr2b+ZR4DWBBmQVL+MbU+2pxbhb1uuwuYGFafocChtPVDgdUEU/3p8dZQeXGeCZj5AHtJ9a8g=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5993.eurprd04.prod.outlook.com (2603:10a6:10:8d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 01:42:25 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd%9]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 01:42:24 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        kernel test robot <lkp@intel.com>
Subject: RE: [PATCH V2] remoteproc: elf_loader: fix loading segment when
 is_iomem true
Thread-Topic: [PATCH V2] remoteproc: elf_loader: fix loading segment when
 is_iomem true
Thread-Index: AQHXbIQUQaXqWbo/LUWBYmP1lkd6lKs2yaEg
Date:   Wed, 7 Jul 2021 01:42:24 +0000
Message-ID: <DB6PR0402MB2760ABCF8451BFFE5E614E4C881A9@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20210629014752.5659-1-peng.fan@oss.nxp.com>
In-Reply-To: <20210629014752.5659-1-peng.fan@oss.nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oss.nxp.com; dkim=none (message not signed)
 header.d=none;oss.nxp.com; dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7ac41c3-c961-421f-6209-08d940e87898
x-ms-traffictypediagnostic: DB7PR04MB5993:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB599397B9F07A98860A7E972EC91A9@DB7PR04MB5993.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P1AmHtMIhk+cPY8tl76IAD62UGr0kP9yPOtfyv/PyqaKYpFnwF/8QIdaDkQdmwnDdqFZbdx21XLVMD0f7hkzMXeOMUjzS0t62smmUt7Zs286eLwviGFRbDS1Ei0Of9NEgFiAMsTc/jkXv3Z/jui/hPOrtSh97VFoZ/hszoFrEP8ZgK3kO75eBaBZ1I6eG2pMukToGX0zANSNG55+D6mpcuV7EyvqNHUM1nzvihU3B08DlhR9nAh9ophhbOCCbky8mL7M4CNKqUp6gv8DzX5xaVSJn45eN08+fOdXCi6m02BguIKaF/ibwqFiVeZXA+GXS6Vl9dSSkwKYfXBQ/arpViBBP5RclFcEkGOSQflZtcpd3TIKtc7oef8l2elDNgz1kk8rtKXBLe+kw2DWlROZheFcG0FHov9HRy0r9mjW4pXhRnxg8bHnQXShqw6WtR74LpWonBfeIFg1SckOOWeRPV/DlNoNDKXUIchJkaRAdEXuTlHUkxrfGoA+/GYExq39opNNTYL4MoOkirGEt8GVC7wzHr8XMapGeZsI4xmPS/fatkpH3nftUIL8YzK7yffuDJMhQpHLo1o9Qe/m+Js/wx48VrEPLW1dCU/PvTBD5SXFOUNGzJFhw87Gg9jA7oFcLFAcfzI3AZoyOJI0oaj8EQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39850400004)(396003)(376002)(366004)(38100700002)(52536014)(86362001)(186003)(9686003)(110136005)(7696005)(316002)(5660300002)(66476007)(8936002)(76116006)(122000001)(4326008)(478600001)(54906003)(83380400001)(2906002)(66556008)(55016002)(66446008)(8676002)(26005)(7416002)(33656002)(71200400001)(6506007)(64756008)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wIbwQQF3ibzW2dTiT9NYti0jnFi0F7SqX+sQlcHSfG9PMXavFtFS9LMvkCem?=
 =?us-ascii?Q?4TMQLcUrInDa+T4lxOWgkT/+AAb3T2gw8k9Mdtu5fvGIiC30kZybrikgjyYq?=
 =?us-ascii?Q?uWjI0Sow1eGs3SZn5ecyoPaK15nbz0cntgbI8ZL6OrsZ90O1HZ0S7GA+yfX8?=
 =?us-ascii?Q?BlgVTPxZm/he1qzCM+DIL6W5jb8BdTuLfE/y8gWARhhbjCHCmb5XR3Br26ZT?=
 =?us-ascii?Q?WJXwKm4fej6e3rCVFB/Rl8rKIuW5YGBeFqrU9gLbb/wVC4HnY/aNRy6yLAj5?=
 =?us-ascii?Q?hLcCgOZuzUSF/kCXw+Yv8lpf+WHhvuy+upNam2fLnB1auKJhsxU/F4RvxT9/?=
 =?us-ascii?Q?NN1eMqCT/6pqHri7u+eoXlt9qjSXgARZ9guWsvu8d3zgkccp+vM9zJDORmv3?=
 =?us-ascii?Q?FV3cCjqUfR6rJvowwVgZqmvyvJ7FcXI1scdLRo8zHZ5O8l3knmVV/wj2c+5I?=
 =?us-ascii?Q?MXpyXv6GpP8FKrjsb4aUKPXE/QBIkXAASKnNBR8jc1HdF+VyAHMiNlVDrHo5?=
 =?us-ascii?Q?WUqDwQX9upCwW8wuAjB6XHL+NtD53rGqpV0GC1KEO3nX9fAkLUAWOZVYw9I6?=
 =?us-ascii?Q?TYU8X6e/w2hSoo4CxwqCH8rDPoikgEjfRuwS5w4VyYGAEHs8oe+VNb6YVKlG?=
 =?us-ascii?Q?uz52eG5AS+1rR4H+ZTOLF4RTAmktlFC3XDdsCHdwnPimL6qE+PIuQ6v/P66f?=
 =?us-ascii?Q?tbebWoveridmN7PQW7GYjV8EAZq4Os7MjnJv95a8iHLuvI6v44RHzPyO4cR2?=
 =?us-ascii?Q?IpWEeteCiWLN3AbO6MnRveq5pO1SDMuKP/WZk0Jap7T9La63VuYT5cuKiXq2?=
 =?us-ascii?Q?kEq0LDF54pkGYja585oZTd0RjHFfnJLk/eM1T+na42y6gzfgp26JQ0gp20lm?=
 =?us-ascii?Q?x/3IlOPlM/93ZHmk2h5BFM/DG7VA2CMERvJy7+1YNFwCFrmx7O670B6lwLwz?=
 =?us-ascii?Q?OJpYtyF2ApPCZQO/hdgiypsJFZneGK3ycMkGNfXFYc68f9j9d6e6e2iJzrS9?=
 =?us-ascii?Q?Rtw7kbnyvCd2AzlqGw4XuDuD0zf11eU6I2HWfmxHhZmbm2x3DdQUtn8sI1Ni?=
 =?us-ascii?Q?FzUlZcHX1YBOgXEIVZr9Ig6v+dQ+X9l0QR/eAm6ePqHAFcQRijRJ0S8u2eBR?=
 =?us-ascii?Q?LrD68+gGeHgUmxvSfg2MsfDEd9H7qulrQkbj7OVCoQ0tzep6gh+GYbyrnEuL?=
 =?us-ascii?Q?iR1y0Y0+krwE0dTDdAVc99M6teinODVdIGo/adGXitkpXp9qNsLtL3naFIz8?=
 =?us-ascii?Q?6wzS2a8lqd6cBxwmk808PlwzmCxQs1w2orUtVTXtRmMsnTOrxGmmy64V+XMD?=
 =?us-ascii?Q?olWN2FjYmF9iQ9eRcAdn6O4E?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ac41c3-c961-421f-6209-08d940e87898
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2021 01:42:24.8189
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: If83CgV38aJRKyR31MHMhSh+ZQ7G7cCWBaS+4hU2suSY9SERAr/h2eLRr1iz7Q6fuR4ig7SrYPL0Uojqvj09TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5993
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Bjorn,

> Subject: [PATCH V2] remoteproc: elf_loader: fix loading segment when
> is_iomem true

Would you pick up this as a fix?

Thanks,
Peng.

>=20
> From: Peng Fan <peng.fan@nxp.com>
>=20
> It seems luckliy work on i.MX platform, but it is wrong.
> Need use memcpy_toio, not memcpy_fromio.
>=20
> Fixes: 40df0a91b2a52 ("remoteproc: add is_iomem to da_to_va")
> Tested-by: Dong Aisheng <aisheng.dong@nxp.com> (i.MX8MQ)
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dong Aisheng <aisheng.dong@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>=20
> V2:
>  the __iomem cast should be for the 1st parameter.
>=20
>  drivers/remoteproc/remoteproc_elf_loader.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c
> b/drivers/remoteproc/remoteproc_elf_loader.c
> index 469c52e62faf..44e7f9308f4b 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -220,7 +220,7 @@ int rproc_elf_load_segments(struct rproc *rproc,
> const struct firmware *fw)
>  		/* put the segment where the remote processor expects it */
>  		if (filesz) {
>  			if (is_iomem)
> -				memcpy_fromio(ptr, (void __iomem *)(elf_data + offset),
> filesz);
> +				memcpy_toio((void __iomem *)ptr, elf_data + offset,
> filesz);
>  			else
>  				memcpy(ptr, elf_data + offset, filesz);
>  		}
> --
> 2.30.0

