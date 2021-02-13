Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DCFC433DB
	for <linux-remoteproc@archiver.kernel.org>; Sat, 13 Feb 2021 11:27:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36DB664DEE
	for <linux-remoteproc@archiver.kernel.org>; Sat, 13 Feb 2021 11:27:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbhBML1O (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 13 Feb 2021 06:27:14 -0500
Received: from mail-eopbgr80070.outbound.protection.outlook.com ([40.107.8.70]:10049
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229512AbhBML1L (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 13 Feb 2021 06:27:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqeKZnjvF9z50u8uDJOu58exi1JW569LespziAFWOYXKAxfLoMR39v5nW4pUX4c15fRFPOUe8/5K+T411lQq40Bzame2sjN/tThLgdxbcyAc5w0CxxQWSeA+x196EpylMMdg9NwH1DkP0BnKFrRGCfxpSK2vzMdVKSuWRirk35jpE5Zguoil0CgKfX8+BE9mFL0ePRGG9O0F2DFXnFvDOIwpW7jiMpGh0wv2dDVAFO3xtvYWQrug7nv0m8b6EFjvd1w7ZLgCe0RjNuD/RjlmSmuLWRJ2v8y19KlHG3LvvNEkkzqDpUZPEcsetvpphYQWmIz7q46AerXHN42U9LeWBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mw2BLd++O6UA8T22gDTHRo5WOn1n/rGGDwUEuIoiVxE=;
 b=YlVFrvN/sJRWinstCO/CsQBPND8Wa9w2HtgyjuAj5EFTdxMcWq9KOVR7qHG1u5Xyri7nJBJ8kMbTo/5mBAZUaVnmQ+IdPUDts+dtL3Ela9yPiGqUVWhwM8rKqylGnHNtb3rMhsjbNfQG8kYrrHNUqo342hSDVEyvDes9YUc+G6oVDAJs2n8SX6T5ZPxA8ZryAQwXmCNEB+3XypThm4EAWHqKf6RLPGacRNGQNFwaNopfKJov06g9y3twyP3e+Tns7/Qj24Iq8m6W4waNQcoXfT29yxYikiLH597GqhhHBBFlUvASZ7FVGSDrMoChIYsounWCivh61Y0kb0HQT8yLBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mw2BLd++O6UA8T22gDTHRo5WOn1n/rGGDwUEuIoiVxE=;
 b=oUQnrXm51kePLtZXSY72MyKDcDSVtxX+x9g6s2g2hkemFG8113mbi+YNRg+gLgEEjr6uPz7X52HT/95BKkVIhwqzoGVDquxLLbzhHxEsM5dTfp/NibNX9G3c+i2F/vsRVbsenss0YTdaHYOkWnQKLMXX5UwPLC7SL5+8aWMPIvo=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4235.eurprd04.prod.outlook.com (2603:10a6:5:22::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Sat, 13 Feb
 2021 11:26:21 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.027; Sat, 13 Feb 2021
 11:26:21 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Rob Herring <robh@kernel.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "paul@crapouillou.net" <paul@crapouillou.net>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "agross@kernel.org" <agross@kernel.org>,
        "patrice.chotard@st.com" <patrice.chotard@st.com>
Subject: RE: [PATCH V10 01/10] dt-bindings: remoteproc: convert imx rproc
 bindings to json-schema
Thread-Topic: [PATCH V10 01/10] dt-bindings: remoteproc: convert imx rproc
 bindings to json-schema
Thread-Index: AQHW/fncK4xdZs5SjUmixVnbxfum2KpRqumAgARO5TA=
Date:   Sat, 13 Feb 2021 11:26:20 +0000
Message-ID: <DB6PR0402MB276019999EC404A06EB9B887888A9@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <1612774571-6134-1-git-send-email-peng.fan@oss.nxp.com>
 <1612774571-6134-2-git-send-email-peng.fan@oss.nxp.com>
 <20210210173741.GA2378005@robh.at.kernel.org>
In-Reply-To: <20210210173741.GA2378005@robh.at.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8a65573e-8438-4234-f372-08d8d0123042
x-ms-traffictypediagnostic: DB7PR04MB4235:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB42353E1397411EFFBC1BFBEB888A9@DB7PR04MB4235.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jH4xvuZcZqDrehKEHT9+YlQJmb0PG9LXpgL7mfQ4IUp8w4jaRp8QfjSiZgaGjSbf1pSReez4s36yfh0mgzikc5cEcnsD0h5BqLqEk0HIOoQUvFJPBQvg9H/5mW/IF6inZ0Lw+NDeXlXbfDbPw47DQBBVFKPn1aZkYUIhhrFX9RRi4qGcfUydZGQzoFQWHKFcZzBdKfasR706cjeM4WcG3TRKd4gQyKomt+V5KqrC+93vWbS3R32MqsHzKzB/jnt1QhwTGrd01F17eO1iIyBg4ZoiGd0S7+FfeKVXuGecDSVUNq8laPSvZUEmu/NMiKJo/J/vt0AOMObTlYzlGmQXAQ5J3RuqSpo/vlaP4HWV/JSdyHL2fUFE1gR73isC2kwnV72GTAq5XvSvr/TNG7PYPQZRcjWmI7Cer0hAbDFum/RuAsocQ1N8Tuc/1sWLecnUN31ONFBrjrnc4zkk3kRHm7qlolaCJLd/FzEItOw/vYbKeipGE4TYl2wdILaFqAHigcvUit0nTDXSIC6jvpsEDLZGhoxAEVTVtfrmuNW3xx/KIRGsv13TPd0BYarEiQ7GVUL5DuYnGJxWob4O52cnF7W6shBPYOfO+t8+XlXRoRQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(26005)(186003)(7696005)(86362001)(5660300002)(66446008)(44832011)(7416002)(45080400002)(8936002)(9686003)(55016002)(316002)(110136005)(64756008)(66556008)(478600001)(76116006)(66476007)(54906003)(52536014)(4326008)(2906002)(71200400001)(8676002)(6506007)(33656002)(83380400001)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?qnROe4Q46yYLu8YI4UE9GkToER10cyo7weYjsovbaZ6L/GZB8QdFwQq0qXch?=
 =?us-ascii?Q?pu7NGZkAjjNpiLofUfkVJyO2eN5vMu73grKJZde2rekFFM7az5UCKCc2cSSj?=
 =?us-ascii?Q?6ul/iCqGLk5HdIRO6vnLOKo9XgVM1P0vkE5eTR3k58yAZZYkTSErRCb6MXFj?=
 =?us-ascii?Q?E52uMQB/ZNZ130NMshg5rQWeu6Ksc500e4+HUtRnnFmthiffSmXsOoOjhq6u?=
 =?us-ascii?Q?Ewd0WoW7Aw60SekEc+J+O+/vPRrO2ryNZhWr6vd0xzyv2Bc8fwFB/S8xE4sa?=
 =?us-ascii?Q?4BExtLjZ3OAqMTEKMnFEumr0pxadk+qUcVa/6lcWzkfEyC0rBR4fcTUFFsG/?=
 =?us-ascii?Q?oX4Catv2c8X2HZ7umfdn6tE5G4/SCMdTerYmZPbWPqCFvFIJapzq3C+X/3iz?=
 =?us-ascii?Q?mVnjajflgYmqFq+sEopFjFQJvwP8cu6WRuZiODQ+pR1UjaWwgBI4jOfAPnVH?=
 =?us-ascii?Q?JXmAY6lvpYR8JWrIIpV6jKBjOD3pA5OLsda86n2WcOFV8DNMdE4EGzUNMBK0?=
 =?us-ascii?Q?v0CHYbweQCEbytQ/izYVF+7pzcaC0+s1C+Cle8i9szPl3TP0gzLlmoBCfIXB?=
 =?us-ascii?Q?1gQ8H84Cbcnj5JjlPCLL/1+GWceIbkAV42+Kh3JXIf6aWtTWdVXMPBlaqV4z?=
 =?us-ascii?Q?MBWljKZ2CoDjkA/tdzpDiABAa+yCRFqr9rK3i9VyCNwda2dSLCdlk/bhZxRS?=
 =?us-ascii?Q?DKQMW8vEIwfVhV4bJ0ZkAZqJ5Q4sJ+7TTJsH/oVbXZRwSd+Xu/uAX0/w8aH/?=
 =?us-ascii?Q?3hYQJjn3MvcX5OpyEjRCFHyg1tvRIWhkbzO8AA3iF9yt+DqUc+fDvPKrBw3E?=
 =?us-ascii?Q?94MqN6BDR0i5IQQB7Xi09I9SVm/ebnDXo56wpK/Oc9IqGsnAmWYgs1B52AvM?=
 =?us-ascii?Q?UICUmS3fqcpMwgBmUUN6Rc7Xl4fBlG69qScjMyaAGaCOSEkOCnscu25KQ3sr?=
 =?us-ascii?Q?QJ6Nlachl+8gAtAFxlwpH82U5jVrF7Gi+5runnWfJLD9uR5wysFF878bBJrS?=
 =?us-ascii?Q?OZ0I4SSTQdjYFnacm05SiGp84mSPFbwMlu2anmGx2v8jFfmcKmslP3PLbbL0?=
 =?us-ascii?Q?lNmavK1Yvd++iGGWpu4Utz9XUz7lphHFd1c9VftqwNqmloIWtfCxN2SFL981?=
 =?us-ascii?Q?MlZOc80mPwap25JyQs5WcOfNMzeGEOubSuwtm2GPoW+YWxbEIyinWTdBiPBl?=
 =?us-ascii?Q?ZReQah8Z6GgVxcYo0V54H1otnh4wpIHgGJH/9Ezg5QHuvh/lxyHm2RPqr78N?=
 =?us-ascii?Q?c94DV8/4gH6mRYdBLCvJUy4SYdYcSY09FZx1QqIo25UMZvgpESWGVjfXlTPb?=
 =?us-ascii?Q?sTNbfHY57nIrnxcVokYrDNVc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a65573e-8438-4234-f372-08d8d0123042
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2021 11:26:20.9458
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1oQtFEPPS2xdRH1pNcSJ5E9DbRmeDD1DQYl99flpMCsZBAfoopzw1lbBIs3kaphxtOYRloSHGWKOaOrLL/di9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4235
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: Re: [PATCH V10 01/10] dt-bindings: remoteproc: convert imx rproc
> bindings to json-schema
>=20
> On Mon, Feb 08, 2021 at 04:56:02PM +0800, peng.fan@oss.nxp.com wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Convert the imx rproc binding to DT schema format using json-schema.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 59
> +++++++++++++++++++
> >  .../bindings/remoteproc/imx-rproc.txt         | 33 -----------
> >  2 files changed, 59 insertions(+), 33 deletions(-)  create mode
> > 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> >  delete mode 100644
> > Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
> >
> > diff --git
> > a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > new file mode 100644
> > index 000000000000..5e906fa6a39d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> > @@ -0,0 +1,59 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> "https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevic=
e
> tree.org%2Fschemas%2Fremoteproc%2Ffsl%2Cimx-rproc.yaml%23&amp;dat
> a=3D04%7C01%7Cpeng.fan%40nxp.com%7Cd1b06ffd889240a45f8308d8cdea93
> 40%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6374857546682
> 06133%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l
> uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DjTnFLISLpjJN
> vV4euhlqUvnj9YMk9YoDZWoxQi97kdc%3D&amp;reserved=3D0"
> > +$schema:
> "https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevic=
e
> tree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=3D04%7C01%7Cpeng.f
> an%40nxp.com%7Cd1b06ffd889240a45f8308d8cdea9340%7C686ea1d3bc2b
> 4c6fa92cd99c5c301635%7C0%7C0%7C637485754668206133%7CUnknown
> %7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha
> WwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D98u0FLfvAhOiYoT7Vvbqg6yW5
> wVEmLVrhLvCz83VRiM%3D&amp;reserved=3D0"
> > +
> > +title: NXP iMX6SX/iMX7D Co-Processor Bindings
> > +
> > +description:
> > +  This binding provides support for ARM Cortex M4 Co-processor found o=
n
> some NXP iMX SoCs.
> > +
> > +maintainers:
> > +  - Peng Fan <peng.fan@nxp.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx7d-cm4
> > +      - fsl,imx6sx-cm4
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  syscon:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Phandle to syscon block which provide access to System Reset
> > + Controller
> > +
> > +  memory-region:
> > +    description:
> > +      If present, a phandle for a reserved memory area that used for
> vdev buffer,
> > +      resource table, vring region and others used by remote processor=
.
>=20
> You need to define what each one is as a schema. How does the driver know
> which one is the vring region for example? Minimally, it's:
>=20
> items:
>   - description: ...
>   - description: ...
>   - description: ...
>=20
> But if what's present is variable, then it gets more complicated. If the =
OS side
> doesn't need to know what each region is, then you can do just:
>=20
> minItems: N
> maxItems: M

I'll use minItems: 1, no maxItems.

Thanks,
Peng.

>=20
> Rob
>=20
>=20
>=20
> > +
> > +required:
> > +  - compatible
> > +  - clocks
> > +  - syscon
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/imx7d-clock.h>
> > +    m4_reserved_sysmem1: cm4@80000000 {
> > +      reg =3D <0x80000000 0x80000>;
> > +    };
> > +
> > +    m4_reserved_sysmem2: cm4@81000000 {
> > +      reg =3D <0x81000000 0x80000>;
> > +    };
> > +
> > +    imx7d-cm4 {
> > +      compatible	=3D "fsl,imx7d-cm4";
> > +      memory-region	=3D <&m4_reserved_sysmem1>,
> <&m4_reserved_sysmem2>;
> > +      syscon		=3D <&src>;
> > +      clocks		=3D <&clks IMX7D_ARM_M4_ROOT_CLK>;
> > +    };
> > +
> > +...
> > diff --git
> > a/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
> > b/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
> > deleted file mode 100644
> > index fbcefd965dc4..000000000000
> > --- a/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
> > +++ /dev/null
> > @@ -1,33 +0,0 @@
> > -NXP iMX6SX/iMX7D Co-Processor Bindings
> > -----------------------------------------
> > -
> > -This binding provides support for ARM Cortex M4 Co-processor found on
> > some -NXP iMX SoCs.
> > -
> > -Required properties:
> > -- compatible		Should be one of:
> > -				"fsl,imx7d-cm4"
> > -				"fsl,imx6sx-cm4"
> > -- clocks		Clock for co-processor (See: ../clock/clock-bindings.txt)
> > -- syscon		Phandle to syscon block which provide access to
> > -			System Reset Controller
> > -
> > -Optional properties:
> > -- memory-region		list of phandels to the reserved memory regions.
> > -			(See: ../reserved-memory/reserved-memory.txt)
> > -
> > -Example:
> > -	m4_reserved_sysmem1: cm4@80000000 {
> > -		reg =3D <0x80000000 0x80000>;
> > -	};
> > -
> > -	m4_reserved_sysmem2: cm4@81000000 {
> > -		reg =3D <0x81000000 0x80000>;
> > -	};
> > -
> > -	imx7d-cm4 {
> > -		compatible	=3D "fsl,imx7d-cm4";
> > -		memory-region	=3D <&m4_reserved_sysmem1>,
> <&m4_reserved_sysmem2>;
> > -		syscon		=3D <&src>;
> > -		clocks		=3D <&clks IMX7D_ARM_M4_ROOT_CLK>;
> > -	};
> > --
> > 2.30.0
> >
