Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D82C433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue, 26 Jan 2021 13:56:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C30612255F
	for <linux-remoteproc@archiver.kernel.org>; Tue, 26 Jan 2021 13:56:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405356AbhAZN4a (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 26 Jan 2021 08:56:30 -0500
Received: from mail-vi1eur05on2041.outbound.protection.outlook.com ([40.107.21.41]:36033
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2405324AbhAZNt6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 26 Jan 2021 08:49:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDGOQQpmG1+rMPmNyT3U8Q/3UAv0wdpiZ2Usf4U/8rfAhC2Cty9qQ7e7x8daeABcrmHdTfrWkwZ8cO0cxeP1r+MZOQFyde4WBcsqo0GdAHsszayLrZrHulnotf6Cwj2Rv8E9NO3sIU+UgMVGUfAFbDX10DYHcU++45TCH+zH5pjQKe1Wa6v/sILaB6g6khe4dakgWjYxPN5cYMYaVMoFtdSU2U8JWChy9AbC7jybEC/twmgZlM9bvqMrqWlwyDaUKNS5YUp/z+BkuBt3cIOvOieS8UXX1+QZH6D4K4JIKliDh75DJAGf+lk4MJAxfzb0MsQBF3XxsIhoH1L+F5P41A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1JA0sJy9eutZnQlJ+efnB8pueuNZzGjwaZdaGFH5p8=;
 b=lT6Ckm5t5iVgClN1o1wBLIY+xeJ+siNqi8DKuBOLnvkegVxIFhNofLtXXr/Y1PKx9XX1dXhnZY6ncjPfOwQ7Z/F410qx2wWf2Ot2cUC2zaAJYC9LTK0DJ29eZbI24b+ShEfa3/bRhUfupH6rCffEJvrx7wMS+o7/K33HUVUbBp2OscxBwf8VE3nXR7/URRNJNSnFDHcA4Ardq1KzTToTuaH9DmMCcdKYCtH5NxkdFKuqt/9ghhtCaqysDGJf6NZyQP/HbjuGYbdEkZ3Kvj3g7LIGAtFt8aIVlL6oKt8VhCDJ4KxA7HZnzWr0ByvY65vzydH3hC7duWyvzpsOVJ9mbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1JA0sJy9eutZnQlJ+efnB8pueuNZzGjwaZdaGFH5p8=;
 b=sEnqeT4ZS3MsZ4srTuJZi5u1bWWU708SYerRPteL/HoDF2K+C2iWpU4Alhw622nl1zLgqv2pIck67gGTNTqCMxSn5aqoUmqpXEN1BeulPDsmuK7StPHv53I5kqQFAdJfGALArf+FziZsFgHSjwfmA0mE1jsWtOj8fr1Fnry+iLI=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7593.eurprd04.prod.outlook.com (2603:10a6:10:20c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Tue, 26 Jan
 2021 13:49:07 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3784.019; Tue, 26 Jan 2021
 13:49:07 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
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
Subject: RE: [PATCH V9 01/10] dt-bindings: remoteproc: convert imx rproc
 bindings to json-schema
Thread-Topic: [PATCH V9 01/10] dt-bindings: remoteproc: convert imx rproc
 bindings to json-schema
Thread-Index: AQHW75K8L0MhP7c9CUeTrDqB4eKp76o59BSg
Date:   Tue, 26 Jan 2021 13:49:06 +0000
Message-ID: <DB6PR0402MB2760432F84DC98247148477288BC0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <1611191015-22584-1-git-send-email-peng.fan@nxp.com>
 <1611191015-22584-2-git-send-email-peng.fan@nxp.com>
In-Reply-To: <1611191015-22584-2-git-send-email-peng.fan@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [49.65.215.117]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3c8e9e31-7c09-4962-a0a0-08d8c2012690
x-ms-traffictypediagnostic: DBBPR04MB7593:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBBPR04MB7593258F75E249A01CA00E8388BC0@DBBPR04MB7593.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0JOOZWF4Nz35AsUM9ZSZwW5kEtJXkGD/JYCbaObNtlvITgKorLRmPegkWHpIDk0QIBkf4p7fTLX+DFbr3EMI0HXtUajiuf+eoN5psKbiqpX72wc5TISCmaAIraJxHlBasE0vm6wGOd/UuOgueg6JQz2jbF6/2tSJ/Fq1/rAsLJCeXi3Ki4+7Qlfdw9cGPZv+SRpAuWl+9RPS6MyBgLTBYv5+q6GCKV5CCzmb8sjdW5GeKgUQps89YSdAhKLEUxCBprKq27kT+Lx7r+ZlVv2Un1qCSHeRj7Bm11ZJ8+Wze6GsZjINT6gblCbH9E3zWs5DNTNv2gWl9xrhPZJyanVf4/T9fWEtNsaAb+UXZKHvyY4bQmvBmOdLMCoCkK92wM58P/6WjoVCnJrEZ+4aUQYetRYHVbdDI2yMHFYl1z7zKogIKbRkt1KDMW3QPleJQvu9grDOXOsPdfubWXH+66zQiUlwzuYJ3HRwhbs37QM5XdEYNXVzJr5Oui4PgTZQWmlK33Wy6E7R1g3ngllg4X0Fz+liXeZqa0tylBmgs53quV5kmuZpuWqekY9UhwLv1l3v+BFGqSl5kGMO0uashKpI3sbInbvCYYX/kaco1iZLC/Y=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(376002)(346002)(366004)(6506007)(110136005)(186003)(71200400001)(33656002)(4326008)(8936002)(8676002)(7696005)(83380400001)(54906003)(316002)(26005)(9686003)(44832011)(76116006)(55016002)(2906002)(478600001)(7416002)(966005)(52536014)(64756008)(66446008)(86362001)(66476007)(5660300002)(66946007)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?5nZDlHUnn/dRg+VqAGGv6pCfzGMxRBMwhg7G2GeYbvYlZ3BGzf9aPzh+SITE?=
 =?us-ascii?Q?B/ZUj3cUjDrtfO5s6MCF7cq2qMP30q9Qqe05Rxu4Votn11/snjjP7eicmkpd?=
 =?us-ascii?Q?rDOKjB30ad02fiPgtmzMGNxt+gJYGQEO687NZTD6pVepCy9p1enXzAXX/oRZ?=
 =?us-ascii?Q?nI+o4tFtcO6nevI4r6o6Yo8v5IgCY7fOe2zx1HH4ahkIzl7CL61VjGkNRucx?=
 =?us-ascii?Q?w+7IXxgwtJ4kQScfWagMkH7GzlgNDYNdEPCTl2xAsryuTePwzWD/12Vqlemv?=
 =?us-ascii?Q?vB8CgY212j0uuHc/BWd3Mz1QfMXfpR6w17vsXW31/WR/jc72aNedISQuVSI7?=
 =?us-ascii?Q?s+CAbKFsJbbZybDP1JRnOWO5j3TuhIrBvCupnM6f++HinaBEiVp0zmC7phOh?=
 =?us-ascii?Q?YHBFqWnThC6hXidk3/9F8hnwehUuhx8eKmcc1xoKHWchmKoJtR8AUuxJr2gQ?=
 =?us-ascii?Q?fo+txG+bQIpeGRO71WMW+80NNjkF0jtUw4NeiksakroTYPEfrfDiGDPdLA+0?=
 =?us-ascii?Q?Qk6tTCSYMgYA1zPmCFlFAhfdEgdP7xHgXUcFwQ/QbHvjpyNWzv6VKYysqN8E?=
 =?us-ascii?Q?GGCMuNLZwOtCttx4DS8aEPI9+TbjoQZws/N4J2ncLWfgR2gs+Isl9sUj/O7H?=
 =?us-ascii?Q?lHTjONhNrRN7sTvhU5N3Eh6fgPxKqCXTE/N1OKKqu61NwZFVfuJ1M0KX+ryG?=
 =?us-ascii?Q?9neZQThPhVbuExIamKIwq6FvktCuM7xiIWf26nWikA7JEwHRVf2hbLb6AN7f?=
 =?us-ascii?Q?EYPNTLxPE2EGkRDdIWnXIQ4lKuX0paDB3hYLLFMntRi1N3RZFLls75/5tcWt?=
 =?us-ascii?Q?mg1diZxVqCbKkUekHAi1XN1B4hl41M6PfK1J/G4NcLg1Bu5w4hLREh5fxgEH?=
 =?us-ascii?Q?KNh5bG6zfsaQOEXTzr9IQ0J2z/uJJPe50lPlqJ73Bz56lsWeyRQjFmEQLoQK?=
 =?us-ascii?Q?7jFBRgAUIODK8b3emX390mI+G1voYJDxFZYI7J0ui0Qd9yriqzdGyVE+Bf8t?=
 =?us-ascii?Q?jrrvVF+7W381mh20wl27a+PzDVP3OlfJmDd4KSzwd8p8I8kKgRi5BZGeE3Ea?=
 =?us-ascii?Q?Nsyt4792?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8e9e31-7c09-4962-a0a0-08d8c2012690
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2021 13:49:06.8404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tvUThoRxXw/j+JW2s1W9p423RCMS3//lXhehtpbx0iDlgOUCeRcGkVd6Q0kVeHisRxqFE6fNgFFhuI5iw+4YYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7593
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Rob,

> Subject: [PATCH V9 01/10] dt-bindings: remoteproc: convert imx rproc
> bindings to json-schema

Do you have time to give a look and including
https://patchwork.kernel.org/project/linux-remoteproc/
patch/1611191015-22584-3-git-send-email-peng.fan@nxp.com/

If could get your R-b or A-b tag, we could have the whole patchset
merge into remoteproc tree.

Thanks,
Peng.

>=20
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Convert the imx rproc binding to DT schema format using json-schema.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 59 +++++++++++++++++++
>  .../bindings/remoteproc/imx-rproc.txt         | 33 -----------
>  2 files changed, 59 insertions(+), 33 deletions(-)  create mode 100644
> Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>  delete mode 100644
> Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
>=20
> diff --git
> a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> new file mode 100644
> index 000000000000..bce6ccfe1538
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) %YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/remoteproc/fsl,imx-rproc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: NXP iMX6SX/iMX7D Co-Processor Bindings
> +
> +description:
> +  This binding provides support for ARM Cortex M4 Co-processor found on
> some NXP iMX SoCs.
> +
> +maintainers:
> +  - Peng Fan <peng.fan@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx7d-cm4
> +      - fsl,imx6sx-cm4
> +
> +  clocks:
> +    description:
> +      Clock for co-processor (See ../clock/clock-bindings.txt)
> +
> +  syscon:
> +    description:
> +      Phandle to syscon block which provide access to System Reset
> + Controller
> +
> +  memory-region:
> +    description:
> +      list of phandels to the reserved memory regions.
> +      (see ../reserved-memory/reserved-memory.txt)
> +
> +required:
> +  - compatible
> +  - clocks
> +  - syscon
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx7d-clock.h>
> +    m4_reserved_sysmem1: cm4@80000000 {
> +      reg =3D <0x80000000 0x80000>;
> +    };
> +
> +    m4_reserved_sysmem2: cm4@81000000 {
> +      reg =3D <0x81000000 0x80000>;
> +    };
> +
> +    imx7d-cm4 {
> +      compatible	=3D "fsl,imx7d-cm4";
> +      memory-region	=3D <&m4_reserved_sysmem1>,
> <&m4_reserved_sysmem2>;
> +      syscon		=3D <&src>;
> +      clocks		=3D <&clks IMX7D_ARM_M4_ROOT_CLK>;
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
> b/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
> deleted file mode 100644
> index fbcefd965dc4..000000000000
> --- a/Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -NXP iMX6SX/iMX7D Co-Processor Bindings
> -----------------------------------------
> -
> -This binding provides support for ARM Cortex M4 Co-processor found on
> some -NXP iMX SoCs.
> -
> -Required properties:
> -- compatible		Should be one of:
> -				"fsl,imx7d-cm4"
> -				"fsl,imx6sx-cm4"
> -- clocks		Clock for co-processor (See: ../clock/clock-bindings.txt)
> -- syscon		Phandle to syscon block which provide access to
> -			System Reset Controller
> -
> -Optional properties:
> -- memory-region		list of phandels to the reserved memory regions.
> -			(See: ../reserved-memory/reserved-memory.txt)
> -
> -Example:
> -	m4_reserved_sysmem1: cm4@80000000 {
> -		reg =3D <0x80000000 0x80000>;
> -	};
> -
> -	m4_reserved_sysmem2: cm4@81000000 {
> -		reg =3D <0x81000000 0x80000>;
> -	};
> -
> -	imx7d-cm4 {
> -		compatible	=3D "fsl,imx7d-cm4";
> -		memory-region	=3D <&m4_reserved_sysmem1>,
> <&m4_reserved_sysmem2>;
> -		syscon		=3D <&src>;
> -		clocks		=3D <&clks IMX7D_ARM_M4_ROOT_CLK>;
> -	};
> --
> 2.28.0

