Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC02CC4338F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 09:57:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4FE360F58
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 09:57:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232868AbhHEJ50 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 5 Aug 2021 05:57:26 -0400
Received: from mail-db8eur05on2054.outbound.protection.outlook.com ([40.107.20.54]:18401
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232852AbhHEJ50 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Aug 2021 05:57:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mi53G1JjPEWJahgVO69Z66VihzEXQcFx4JKbcRl0VL+P89KRE14coCv5wGh58Jwi+jQBW2hd+2iCj7WlJGYSrVhEz+uZZ+5zVSkZ7fLf8R6+tuQsJDETQ1iVG0tDxc7TWA9uyF4kt9EgEUnFF34DKeGM+FKKfOVRlT/Pf9EZPBYBrZyu4CldX+qNzBeSxLkRwsdkUOkDcFkrtnt/jGBBtjzCFGzr1RlC3gVpEzeTJodKQLZjfcrtzaFlTQBqVPJve5MqjZCWE6xx6KeA93reqDI8tnedjtlEchU5BVPg7+BC3GRA8AalfJuxLoEvjG4Y12sJ5KqigBAEARHTFvqrjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NJKRiIKZCPmlw8TpuENGmhmkt9n3PKhWkQDNFw3+Tw=;
 b=Mcy3cG4SoUfko4vdKDMybXkcfQkNMklIOGGyu597Ip77Sa+av8POpLaUoVQYRmARhdOhrTtFnehCLGTb9haOfuYe6BwrZiLXdT3nBdLhyWlOMNeDeQFLFXlIYcSJVp/yr93GprNdoLOR3P9B0VlWhFGuaHeCgkkPDeVlrScvm8YTMArAUwJiAMToCiSPVg/gP8q5z38hGgEuSJmnifx1dpehoUsi4f6ExNtwJOsfa0t+4XUFza1G5UVv97P9ty3Q20t1xdphegcAaFXnKelaxFBEdrBzL7fIcdP/boSJyktSYlJidCIQDM0Z9vE7+rT6LgzRgy0u/4KHzWPBrR4b8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NJKRiIKZCPmlw8TpuENGmhmkt9n3PKhWkQDNFw3+Tw=;
 b=aGd+GJV3ZI/AdfW0RsO9f9uWp+ChDRfKQE7PPW7rmFQRnjIUbBXSdUR7sn86trnEC+f/RO5BVixkj+VFjQvVxgk6DRhsgMqpFoV+wF4eRiEIsOQlR9DguAFEz2faQ4noczzD942ZLUAIZ1xUdukHudMmOjEqy6CJpn2SsqQr+qY=
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 (2603:10a6:203:99::22) by AS8PR04MB7592.eurprd04.prod.outlook.com
 (2603:10a6:20b:23f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.19; Thu, 5 Aug
 2021 09:57:10 +0000
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::3839:217:6252:b1f8]) by AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::3839:217:6252:b1f8%11]) with mapi id 15.20.4373.026; Thu, 5 Aug 2021
 09:57:10 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "dongas86@gmail.com" <dongas86@gmail.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "cleger@kalray.eu" <cleger@kalray.eu>
Subject: RE: [PATCH v3 5/5] remoteproc: imx_rproc: change to ioremap_wc for
 dram
Thread-Topic: [PATCH v3 5/5] remoteproc: imx_rproc: change to ioremap_wc for
 dram
Thread-Index: AQHXiaqd7cYLytShwkSrk1tiAg3a+atkrQxg
Date:   Thu, 5 Aug 2021 09:57:10 +0000
Message-ID: <AM5PR0402MB275630A505C7828931043F1988F29@AM5PR0402MB2756.eurprd04.prod.outlook.com>
References: <20210805033206.1295269-1-aisheng.dong@nxp.com>
 <20210805033206.1295269-5-aisheng.dong@nxp.com>
In-Reply-To: <20210805033206.1295269-5-aisheng.dong@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 217f371e-bfb8-470e-f7b3-08d957f76471
x-ms-traffictypediagnostic: AS8PR04MB7592:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AS8PR04MB7592A4696D8176FC0F3C47D6C9F29@AS8PR04MB7592.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KDaJftHgszegirvf/9oUhd5kGkycQjUCwlvhMmlpVEWaPeNWQbTVcsmbEK13wog+cCVVEsEvd1amNc8bQN9tm7Dpb/4rg09Y8sZ1qaM8Y1DfDV7hFrC8Vv34DiXFhuJqUVzzYCXbFKFe+bJEmzWgBVszsshfmouSQ6Hz59NXS1i6Cu1RDsomRnTMOXPPlYPWuOArJYKhKIBdSM4WYqospV6cD1icZr7CtvOlnzfr5FXPOwSSd+YwRMQLFRSkEc1TpsauocaZyMS5cLXkRqyBN8+JGO5JY9HhfFT4EiNcVuNU3o49HosUpQvXxUMku8J8mzgGHM39r4m5ftZDR93bLvk1iJ0vzctmYVG1lxMYD7IcZq4i0kF6e0FLHq6LYk2bh9F4yrtct+HHNEQK/AOCrkDGNluP/9vxQWgJJWHywYfNXvZdEV0FGVJVsCSMa0fPocxY3WuNvg5kTdDeGmNmDKQnAPzttAMX4Uf/iZGGGANBENm3JOzliP+Cps/UO58ehfU8/QmzV/F2oTM/Pf7K0DGC4SbW8fFFnD8hsS0BjQ324cX5OeBVvBBjE/EwMiZ0JfiQQbp89BQS1Gxi7exeKtXQHLO4b9v6HGxwR5humWd/FTLtMwf6trhYjvSFowKoTZKLmHGDeSTp69fM1bU4u8RLFD21lP6JdyXOBSehE8gdXxqIAlfSbcYb/h7VXC4gaKGIsOpZ5UJDdEPu/L3+Ug==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0402MB2756.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(122000001)(55016002)(7696005)(5660300002)(8936002)(52536014)(71200400001)(478600001)(9686003)(38070700005)(38100700002)(6506007)(86362001)(26005)(186003)(54906003)(83380400001)(110136005)(4326008)(66556008)(316002)(8676002)(66446008)(66476007)(2906002)(66946007)(33656002)(76116006)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yq5YbsZHae5HTvB258Fd4eLuto7imAOJuzJrD4EfQLrHRL1udyCz0+WdRayi?=
 =?us-ascii?Q?kr3JbmBkzSoLtJ/fhCLpJ+bX2zpnGIyIJ6KHMYN54e3sGIBye8c16BZrQZGF?=
 =?us-ascii?Q?u4Vf15aMP37Z6dZFXCdqpz7gV/FdVgN6poH23LNLlhFsHFBmWqFxIYognG0b?=
 =?us-ascii?Q?NrQeAJeRRO/FqYn2PMYqkun7dOc2nUaF7HIUxcMqkKrHE/fP2FDPxMJfQbJa?=
 =?us-ascii?Q?jQ58HsXjQQS6EqQuOt2kxmPB6uZnHdLHpLWwsclrSm95vPGjtEeVH4lqifsQ?=
 =?us-ascii?Q?NM0P1JVE2U56iWeOY3I7njruq9NKuBLugmSvvTqq9hiOX5ueSPQvwNRsT8FG?=
 =?us-ascii?Q?N58mdUQgwCzRHXEN2ASlgYKOC02U+oukM8SuU9bm0VmuBh3GFLdw5H6dvmOn?=
 =?us-ascii?Q?AginGKFvgcGH5eP1rxuktFw6Jr8jpXZDy8PjAxiCA5lvGjik4XTwpkYSi1VD?=
 =?us-ascii?Q?8qMpsGVeF6YcBOWrpXH868LzWhSp3IaDl7dtD00Edwwu4gSXV1kQWhrIn3U1?=
 =?us-ascii?Q?hTR22r/VFd+BBWC/bqJeAlTWGCVKq7fTpcERvmvM4WXyLhsGkFAJDbIViSfh?=
 =?us-ascii?Q?Pd68Le6vJu7CTeQVvtOaSC+W/4TT0tfcvEZeFm30TRktgUFk42t54Lc09d+l?=
 =?us-ascii?Q?MXx9e4h7a3CewGiaCfda2Eh8VANK+pY7hYavp8toKNHtej2ub15KC/tvSaul?=
 =?us-ascii?Q?19dt6tbARfom52w97mI6/eHeA/jmOC2Uh3lpG1OjvWMHTZspCjLeq6fxTTx2?=
 =?us-ascii?Q?Wx9A8KDDv5SpJMmUW4hKxorKJ8ELnijNOfBMRTZqIQ10WCMgjtxuD0Pgux7O?=
 =?us-ascii?Q?KkKS+Ex7ynlyQ1WClvnHvtagpbOVMRJRMeBp6voD4FOkthKVKgUp02nSms2o?=
 =?us-ascii?Q?H7Y0DkiY7Xy5V9eNQcpRInxzCV0OnahvCrqa2oSGJeCsbXfeu/yByhBDGJhy?=
 =?us-ascii?Q?t+Xb4XUiL0MLLgvtOafd2psaUAnVGSObZaKsU6Oo2AXBECqj4i3X5MVhF4MN?=
 =?us-ascii?Q?cgrrn/JNlfD/l0P7YC1cMzRl13hZFMNnbP5jaA7CK3fUfWMm7l6nrPckeX0N?=
 =?us-ascii?Q?1fPMWbcx1VLmCN/CrVGvd3YJ6i2JzI6L+vNghWbbrRNAXMKqxSAMwDQQGu2B?=
 =?us-ascii?Q?OQtYQcsZvec1BYKBcSexBJ9llfHsbohvq3EgZw0iYiBa6Qk94kVBx+jASx5U?=
 =?us-ascii?Q?i4hzYsKs5xvV8zJXNfD9ICsTTDTcbdFMhwZLadSebRAnNRWRshNlRP57B84+?=
 =?us-ascii?Q?E+KTtCgAnE4YHis1ul2fXMfdYz1F91EiIsH9NRi+blFSZ+ZL8q75EN+Hc5wy?=
 =?us-ascii?Q?rCa0QJmQAFb2Frubk/I95S57?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0402MB2756.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 217f371e-bfb8-470e-f7b3-08d957f76471
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2021 09:57:10.2305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qRTq2OMqsRsDAaGmyzBMFSYZINuttzMuZu73cuxUQGI6Sw1WZOhU6HLdlgywWQUkYXILOvmL9M2i7SNGKAGCJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7592
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: [PATCH v3 5/5] remoteproc: imx_rproc: change to ioremap_wc for
> dram
>=20
> DRAM is not io memory, so changed to ioremap_wc. This is also aligned wit=
h
> core io accessories. e.g. memcpy/memset and cpu direct access.
>=20
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

> ---
> v2->v3:
>  * patch content unchanged.
>    Only drop the wrong tag in v2
>    Tested on MX8MQ and MX8MP, MX7ULP.
> v1->v2:
>  * new patch
> ---
>  drivers/remoteproc/imx_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/remoteproc/imx_rproc.c
> b/drivers/remoteproc/imx_rproc.c index ff620688fad9..4ae416ba5080
> 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -597,7 +597,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv=
,
>  			break;
>=20
>  		/* Not use resource version, because we might share region */
> -		priv->mem[b].cpu_addr =3D devm_ioremap(&pdev->dev, res.start,
> resource_size(&res));
> +		priv->mem[b].cpu_addr =3D devm_ioremap_wc(&pdev->dev,
> res.start,
> +resource_size(&res));
>  		if (!priv->mem[b].cpu_addr) {
>  			dev_err(dev, "failed to remap %pr\n", &res);
>  			return -ENOMEM;
> --
> 2.25.1

