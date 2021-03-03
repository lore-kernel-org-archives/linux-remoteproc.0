Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D6DC4360C
	for <linux-remoteproc@archiver.kernel.org>; Wed,  3 Mar 2021 11:02:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 821A164ED7
	for <linux-remoteproc@archiver.kernel.org>; Wed,  3 Mar 2021 11:02:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239530AbhCCKbu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 3 Mar 2021 05:31:50 -0500
Received: from mail-vi1eur05on2088.outbound.protection.outlook.com ([40.107.21.88]:16129
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1355581AbhCCGyL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 3 Mar 2021 01:54:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mG8Gz1waPjdyWZFyT9hC+p38BeMF8383feinelq1mpbO7lt23w6yQj5I1kv2SwBxx0zE+nCYZa8KAOzAVLaFCN70Wo1zaL2z+4kuRiBoC1Y8ldfTwF2+GIFRyf0DSNw5In93ZncOdGq8Ld7MEHGuMTBmigXjqNpVDWqXexCfQaKNY81iVqBO7HVqgq4RvcSoxiqP1yk95iZJJWSztonKxDQ+9eAdCXaUYuZzMLKiX7toPX8zgvu4+BjClbZpdg3GHa5uZCpYaWe0bGI6tuWXFoDwsK/sxnPk9Z/XjrMBgIdhArw30jzq9ZU+8TfgzXMrHbQRUAYLZCfblf4eqi2e5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzpZKG+f0hBd/FY7Ge1sUwo1g0iScX5i/Z/T2NKcVXI=;
 b=L6EYeYFKmvjm/jPWgVp0WUQ7gC4F2ycL7Mp9BWWl77aO34xENxliA+z9b1Lni8IsbkTOS6M3f9u2ooQfHVldgXIoXXVaB18waajiCImIiHlDUtJHsxQm6VGUVkTFD/ip22HbCjPQQedzOZZN5SGo0WFA9oSDg+OAc2pIjamfrjc5qIa/Xv22NaYPR884F1bRia8GIktO3KiIXCuFUDyGwU3cEF409FtFM/0hVxEmIk7SzvKK0OHR7Fmy935KAoRReHMCpivgTg6QJ8jZGomyy/GtLQRjCZeMG5oc0FOnh4cU0NxuzpX5b46dhVnYo2s0p1JNk6E6kwvqHnfpi1N6BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzpZKG+f0hBd/FY7Ge1sUwo1g0iScX5i/Z/T2NKcVXI=;
 b=gYIEZ0rNPvzZuExaXbQxeGhltxUJrOUrbQi/2TNPoln4qbISzBWqAQd2wg9tnvThxzVVVrC2rNFlwmSQ6wqH88BU+5DwgwYyrfaEp0kYtk/W4qwlpjpycc3l44EmLpJv5v1MAsYtmlSKZxgnanGPOVqjtbSRcG0OQZQeDhuQWNE=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB3PR0402MB3916.eurprd04.prod.outlook.com (2603:10a6:8:10::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Wed, 3 Mar
 2021 06:53:16 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.049; Wed, 3 Mar 2021
 06:53:16 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "paul@crapouillou.net" <paul@crapouillou.net>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "agross@kernel.org" <agross@kernel.org>,
        "patrice.chotard@st.com" <patrice.chotard@st.com>
Subject: RE: [PATCH V12 01/10] dt-bindings: remoteproc: convert imx rproc
 bindings to json-schema
Thread-Topic: [PATCH V12 01/10] dt-bindings: remoteproc: convert imx rproc
 bindings to json-schema
Thread-Index: AQHXBZaNexj5F8BzH0O9WCmBOi8HDqpx6Jag
Date:   Wed, 3 Mar 2021 06:53:16 +0000
Message-ID: <DB6PR0402MB2760F2258DD869DC6001BD8F88989@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <1613611500-12414-1-git-send-email-peng.fan@oss.nxp.com>
 <1613611500-12414-2-git-send-email-peng.fan@oss.nxp.com>
In-Reply-To: <1613611500-12414-2-git-send-email-peng.fan@oss.nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oss.nxp.com; dkim=none (message not signed)
 header.d=none;oss.nxp.com; dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7461e3bd-caec-4e7c-87a8-08d8de1105c1
x-ms-traffictypediagnostic: DB3PR0402MB3916:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB3916542154A98480DEC8ACD9C9989@DB3PR0402MB3916.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IB+9365KlShDZFymxowQg6DIu3SbBiuevircDiVuBDe3h94UOmvO8LpFDrePCJy1pcZ8Ewa2AowD43bxgW8UGURaW8bSpesQlwRaSNKbwn+jLIZBs7S1AmRi7sTNsO2BJ5a/+fU6pewIKrNGdiQtbzaPy9EIBw36nnj3qqlB5M7vFBo4ytrR6Y1S084PAFdZls3B+gL4288zzg76V+4gMj2jQjAsM085djY48QG8wUVaBa6iKC5hDJXRHuD11KEpZogdS2XtokcyA0udkQQKEvqQPRjZdeqcyutZeelrdQ65oBqfV3qmLS2OImPSqriglG2cu/U6Jwn1lLmPiB/wFoufaW1DXHw7fCBFUZZzAwvX+jQalHu8cTAKiyPZvhEJWq8oXGfVgQSVi4vysbQ6+5/jVWOkzzhH8zR2GOsc1/nL4zSHSu/vxq5TlEsPCGXAYGzDZg/O8J4PQhKxj+qulnwVqy956WsGjh18g0ZIvrNnu0UQc066mFyns1lhLykVmCvhzvcQhrQGpvuu2pBvDM8gq9asIcb/fpxXQwNvC9rE57VB9K0b8a+RM7YGjaJ4eeLGaZsBBrGfnFdebwyQcvW33K9+wrBcvPIr8i5ntRc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(5660300002)(66946007)(66556008)(66446008)(64756008)(66476007)(71200400001)(52536014)(186003)(86362001)(76116006)(7416002)(8676002)(26005)(9686003)(55016002)(478600001)(8936002)(6506007)(54906003)(316002)(83380400001)(33656002)(2906002)(110136005)(4326008)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?2/UVdxogGTv2Exe3JrixG6NAbE2A+Lp/sqkzG2/pYv3Wedz9Ta/1z2YVKYwd?=
 =?us-ascii?Q?FRYHcjQOKdZ6Y5csjPX9xdK4LvhpD1PkSHXnqpUkSkZIjWmFlldlvNfmAVlI?=
 =?us-ascii?Q?hZYADez0XpWo8kXr1Wxa4e8bWBxoEFLv4tXCo7GikkL+r1t5cdoNQJADkOqy?=
 =?us-ascii?Q?lYb2V7o6PaRejZKKYfbmqjqS4EXfDIoam5OpyRT3+agbwi6eKdNhAqAwNZWf?=
 =?us-ascii?Q?Gpc4mMc7ymMlid+XbomLNkzRBRrOuW0hyhk3MWEm9nr88she+S1WlDBiMz4j?=
 =?us-ascii?Q?u/xKdHOzGwVQ+k6cyXqnTURA0hXKJ271cOsOOpnn2l80io+f2LJNx9rEmR9Z?=
 =?us-ascii?Q?cDzTzwU4NL0xzRW1WdcuOg2YFrzMhwzIKkDcGF/YN4i1+VHehY1mvAyhfMPn?=
 =?us-ascii?Q?Pbmw9MLOZVyMFDyW2uhz+ULXDK5JObtZMH4q75EYdDp5yJ9cfX44mF1N7ejw?=
 =?us-ascii?Q?ZASfqWE8mwmmmvY9GPyVNBp7Vt1Sh8sq5RNNpXPVZlpjzkO//joDPV5ozG9l?=
 =?us-ascii?Q?XuOKJzMHtyBfsg0TODhD+Z4/QCmJehUqavnRo/C7CeZjbBBm1K5AKtTwGyqp?=
 =?us-ascii?Q?99dlyZayO+9PJFhT3u72wv/7wgkJ2e5BqpA7GkuLsJMBKwAbdYYQHWOa/Tcn?=
 =?us-ascii?Q?FPRa7wdm1K93HY5r3TgZDc80Mv6Db1EMsxrlNMVd3WqKgMTmgre1tol71P94?=
 =?us-ascii?Q?UBwDZvEMhe7OEDoBDXDi1qwDsgP8VNl+xDYMREY3oPmZVQUeDT6FXgG8ScYe?=
 =?us-ascii?Q?p/XFs92Gt59wIh5/3RDyi2FYAc+oyaAau/LsQHrQh2uPLTug+AMLyYJTS7OK?=
 =?us-ascii?Q?76gOCgqy0iSzbyBp7hfjFpWRkvkvgJls1q96J1HjoDsSAKjx/UgBjaU4/qU6?=
 =?us-ascii?Q?VKAqxQhYz98QiiyRpez4gK0QxD0MpUPTOAjkBNVuoL+h0WdbRTmIQY7J8pP8?=
 =?us-ascii?Q?pCulWdoGvu7uch7v5PJQ7pQuFNeuEuBEcJ2USVkon+c/cuij6bk8BN220LjP?=
 =?us-ascii?Q?9RlzXzE1PRwkIzAMVPJVYmTWSAXhJJBnq6Pv0SNE6zMARopzH7TxWmWg3dgV?=
 =?us-ascii?Q?v2+0KMCW7FcrRhjRDGy6V9belIpn9Exk9fjmMPwEZRA+fu+x62ZbmzuNRl9V?=
 =?us-ascii?Q?Wu9pZf+OwyUUwl3WP+Px5B/vfgHalUN0gu05NSLepDfoDpy5EGo5u9O6M6HZ?=
 =?us-ascii?Q?tYvSw5JSyNpGklbVRI96mINB0ctQh/9ksYg0xlsZVBTr7zAOj2Gh2JSoYQBR?=
 =?us-ascii?Q?PQhJtHeqpjMZjeqYaOk+RM7TRQ75SWJwbb2EZQ9iughd8SF2utbxbmr+goMg?=
 =?us-ascii?Q?UHfdFkmTPR5IA3kn/rtoYuq2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7461e3bd-caec-4e7c-87a8-08d8de1105c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2021 06:53:16.3975
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4cW/xDFp8AEO6pJlKaUu9Z40C7Vptuv+Sv7cSqNdWtroaxZd4ETESidlAx5MD0y1nnp1vZQyDrnPTA7LzhDxdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3916
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Rob,

> Subject: [PATCH V12 01/10] dt-bindings: remoteproc: convert imx rproc
> bindings to json-schema

Are you fine with patch 1, 2?

Thanks,
Peng.

>=20
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Convert the imx rproc binding to DT schema format using json-schema.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 61 +++++++++++++++++++
>  .../bindings/remoteproc/imx-rproc.txt         | 33 ----------
>  2 files changed, 61 insertions(+), 33 deletions(-)  create mode 100644
> Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>  delete mode 100644
> Documentation/devicetree/bindings/remoteproc/imx-rproc.txt
>=20
> diff --git
> a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> new file mode 100644
> index 000000000000..54d2456530a6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -0,0 +1,61 @@
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
> +    maxItems: 1
> +
> +  syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to syscon block which provide access to System Reset
> + Controller
> +
> +  memory-region:
> +    description:
> +      If present, a phandle for a reserved memory area that used for vde=
v
> buffer,
> +      resource table, vring region and others used by remote processor.
> +    minItems: 1
> +    maxItems: 32
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
> 2.30.0

