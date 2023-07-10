Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65633EB64DC
	for <linux-remoteproc@archiver.kernel.org>; Mon, 10 Jul 2023 01:20:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbjGJBUN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 9 Jul 2023 21:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjGJBUM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 9 Jul 2023 21:20:12 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2061.outbound.protection.outlook.com [40.107.22.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26ED1D1;
        Sun,  9 Jul 2023 18:20:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJo5I2hUlna3ssokhMuSiQ4+7hQsgZFqXGkEhsKxvS7PeYLOP51Q3zop2GUPpVEEVI0v5NOLblOoTdsMuP/ma2UCB8q+GVvjsy/WwuzvJZDSbsrFznfKlD/+S9B/QoURAIgw73AD/CoXSg3Sor1hPurxyeEsy3OoIoLEb0H48lfCCcUkZ25azxRNdvbXbhexKiEp4KzBvjG0pePfc3uViNVtKAGGIsEp+vCFUHESsgpSYqPPx3RWpFVeg3Qp55ZRlwwbAyEXKHbU5VLcMOJ8iyJf4IunAflRiYBe665GGDAG58SvVXWFwr5aHSWei3+nv67MiHSMCpjEm99U72mvzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqn4ZC2p444hbe14rd3cwuHsuuxCbw2R16cOdD6N6fE=;
 b=XhFfCEQD6+XD9jNz77+I3U/GaPwMLncFvbXNahDjzw2InBU2IutSYP8QsgEvdDzNo71VHszY0bNB9PYTuU0N7HaikjIW1kpOmNYsr1G1d1bH2TCONiHwT/oTaiqXQayn+hfWrtBDR9mJ3wLfuvbAGGHcXwXO9QCrryGylPv3h+/Kp2vMxpr+EU9zhIwoNIhsre7LopJG2Idk6OoWr2q4fs0C+ggsL4BWqv7jKUaPLzDXFU4zslr/JrVOHQtK0uKZpZTne+bZJ/vbtsq12//sKVcFdntT3D6zbOGzvksEi5ZCD1NVEq7F/jKtj+QJtR4Ks/ij+Suui9kHZhtCR22qnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqn4ZC2p444hbe14rd3cwuHsuuxCbw2R16cOdD6N6fE=;
 b=FCc9jDTaVib5IewVHkneLYb8uyygEPtGLzKt4vYU/DC6QKR83aoPk2SM2QcMJw5h5bzTZ62dKyySmm5XombRI/pZLh303Z4S+Mn6gDr21jl3+wuhpOL4ywxkn3UHlhgvMkX3CsL/wt41pT4ZpA5fRsMxUwNK3s+GSIUJysmJ0mc=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DBBPR04MB7707.eurprd04.prod.outlook.com (2603:10a6:10:1f4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Mon, 10 Jul
 2023 01:20:08 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::5c40:ed07:b875:18c0]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::5c40:ed07:b875:18c0%3]) with mapi id 15.20.6565.026; Mon, 10 Jul 2023
 01:20:07 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Marek Vasut <marex@denx.de>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
CC:     Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 1/2] dt-bindings: remoteproc: imx_rproc: Support i.MX8MN/P
 MMIO
Thread-Topic: [PATCH 1/2] dt-bindings: remoteproc: imx_rproc: Support
 i.MX8MN/P MMIO
Thread-Index: AQHZsSp8fEJ5ILBUcU2lN5CwW1tWd6+yNnuQ
Date:   Mon, 10 Jul 2023 01:20:07 +0000
Message-ID: <DU0PR04MB9417DC184913F136EAD283FE8830A@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20230707232626.374475-1-marex@denx.de>
In-Reply-To: <20230707232626.374475-1-marex@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|DBBPR04MB7707:EE_
x-ms-office365-filtering-correlation-id: 67356a09-9255-449b-82fd-08db80e3cc5b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oLMo2izHMaLoyi1b7kC+8ZHltdduhD0ECr22PKsytZa8iUnwkDdmM/NuMlgun0mXA9cW8IdpLsX4c20fxWq5jlLIVFAPgTcL8Xx9eN5kbNRomIBAGGSzYe07XScHBRP/97FHLj72ZwYq80UgaIairJbnX/hUZB64TujW0vVRxzepifSXOlS5dXcpoSM1q9uaU4GCAMGSCsVpP5gR3pjmDYro0VNeAcqaRGev0rlk2s+NwwXGicF5dAUzAdYyS1gu7kPS0yhgvjsBz13TnHz3H+Sa5F/UcAF0KlJdLC0G/usRrdiurskWXs8zpadoY5lThVRXFVo0GJKBoLAHAj/337A44oCtOLYEwPckt/BSoo69RVebq8cJnVUtBoTEytLFVGGK3n+PcJnxFgqESvG1yjM0o7VIr/H26vJS4531o+a5tp78rPMeUtNUUuXgfJ/XXNTCsS2zUjfhXeTK4HfZfnZkce7A90sxcxWL5OScr05hBBtNEXb15uc3Xy+rFT/BW2XpL2jfc3kbQaBTCofCwQxYbLiro1M/ypWTIdpM+w/PS+pERs/kYiGog0We+lsCFerKclEOSC9/r0n3/KhlmKh+mjO0t4V+kzQD+kgFWBzfGoAiAib3RHVPyxkn3BeH
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(366004)(376002)(136003)(346002)(451199021)(66476007)(26005)(478600001)(6506007)(9686003)(86362001)(71200400001)(186003)(110136005)(316002)(54906003)(38100700002)(83380400001)(7696005)(66446008)(76116006)(122000001)(64756008)(66946007)(66556008)(4326008)(52536014)(5660300002)(7416002)(8936002)(8676002)(44832011)(38070700005)(41300700001)(2906002)(55016003)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HmE1IPVG/Yq3VTFllMblpV//Ys3b8VFb7lxYupHzwUyZ2LSodMrO4IINGeRf?=
 =?us-ascii?Q?GiJwJ1KlzqikaVoHD+oBF08eHLB8bT5yDfXRSr8bkLzTVH5vcog07FZgvg6i?=
 =?us-ascii?Q?WgomkSMnKDV1d5fqncg4HHSx95lr2pgcEUhoHjJaiwCKwC/HIKSwLCmosvwD?=
 =?us-ascii?Q?LLCKnxNvwzm3L32llSD9LBfeh4HMS9QJQTT5WHRMbsIbY3bu0vBtECWYzWmN?=
 =?us-ascii?Q?s+5PtZ+YGemYeMXYln4t+H7769NnyC//TSbQYa5MOcobFIDkR33etGCCgyT3?=
 =?us-ascii?Q?PihHxV6QbIm4M7XY1f/tw2mIsYdCzNJDrLyhOXiHZeI2XoeCyVka8tjCW1n4?=
 =?us-ascii?Q?HW2ihA+7PEGUK/2ogbT7+/swJKodyjkGRyCxXyaRhK/3wa3ecAXNI991sGCI?=
 =?us-ascii?Q?wMCbGDQH30FhAKr7vOmNvz3Lr6EhfoZhcKcms1XHI8R955Gy70hCXJYNZ1c0?=
 =?us-ascii?Q?aBdesHhI22dEZEE7NZ1ps18kzCOh2x4RWogPgp44rJwNASeTUAvMVa2r9B7J?=
 =?us-ascii?Q?uRxj+1d1b6MPRUHtpvzwCYEpXCyd7BULzjfmo7y3jByJT21BvtJJWa7v9jY7?=
 =?us-ascii?Q?YzHn7mf+RgmHPsSsoMRsxZbNuNLw8wVfPBjgpagT8qys6FrwEDxcfUuDDgeg?=
 =?us-ascii?Q?9+ad78JVT4pQ65BFRnK/wqCqUpc5YEyLyWi4dMM85uHa+fA+bhFd3CkwX4r8?=
 =?us-ascii?Q?vgceETy2dyq0qusSCAj+6JGHZmV5fjZMcMFDB5f60yR1p2WM81TwCq6V5J9s?=
 =?us-ascii?Q?h7fxhQQB4oO/4lTru6uIG7/bh+RI6eGWdYzUcpSiYoZywgTOAfeZbF+kQ58K?=
 =?us-ascii?Q?qD8mqIgKaT7yAnwiLzkElkbyXitXQj7JMHYgQ1hAOKlWCvk0HBF1KbZbszbo?=
 =?us-ascii?Q?9VzwtTAf+oq+K6cTY5Tv75nksaob8QaS/g6H8DUwKF0TmkWR6d1uphKq5s1n?=
 =?us-ascii?Q?mIvpqDVXwbtkJ+GY1OhPNO8EMyDEb+YOyKx7MoO3FMP3ad8gGicY9MkDNpKt?=
 =?us-ascii?Q?VpZMFmErojqIy9sy71Fz4mASkYFAwgPsscXEzslEQufpeFfC11gzvjHJFUQo?=
 =?us-ascii?Q?zTK88qIwsz6KbTpF86YgqKvY4VeSvQ5Oz3ev981ah0L7t7H8f6HZVKlNluXU?=
 =?us-ascii?Q?oSS4OuMQI8TrKo/pKFU+IjSE67AzmAnUZXGBB2Po1tLFYcgw9ozb8pc9/zLw?=
 =?us-ascii?Q?hd059g2hbJLd/CbW6WVpDKCkd5q5Fp1PtnuRvRhUzAa0I2m49JWoA09Mi0/l?=
 =?us-ascii?Q?XoNFkivh3AkYeD5GNhdd3ApwkVflg88Mea45wdVDGF+1jl5Ugu9ZNQP/Pdbk?=
 =?us-ascii?Q?3iSDF8F2SIXMMmx4Br3qAGVG5xryqhQCCds8byXRSrCvUKxHWcuCk4Y5Ntgu?=
 =?us-ascii?Q?I/YreBRiHE6wrkc6Pnwi0nq8XEZDYty18+cFbg2GEsEI/U2W0VYJbvjqtxsV?=
 =?us-ascii?Q?5/3ySfPWb64H9fom2oBIXkvQ8cyzULVm0su+yG5iidgBvvLSUzV1jCZZSuRt?=
 =?us-ascii?Q?kVwaRicyjzaGdxLQfzIsJm8XAiCaDv1joMyU9leYS5jkVet+bhGDKuLLFto9?=
 =?us-ascii?Q?SHExyn+F8Ty0YqlW7c0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67356a09-9255-449b-82fd-08db80e3cc5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2023 01:20:07.7326
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HvHmlZm+aO6dU4EOyZ5P+889DdFAY1W2eaKWnRuzj8+L8MijAcJA1bpz7+p6uvCUVRv11G0FXLvj5qAmjbe+Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7707
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: [PATCH 1/2] dt-bindings: remoteproc: imx_rproc: Support
> i.MX8MN/P MMIO
>=20
> The MX8M CM7 boot via SMC call is problematic, since not all versions of
> ATF support this interface. Document MMIO support used to boot the
> CM7 on MX8MN/MP instead and discern MMIO interface using DT
> compatible string. Document GPR register syscon phandle which is required
> by the MMIO interface too.
>=20

How about introducing a Boolean property fsl,rproc-mmio and only
valid for i.MX8MN/P?

Regards,
Peng.
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Note that the MMIO being discerned using compatible string is similar
> approach to "st,stm32mp1-rcc" vs "st,stm32mp1-rcc-secure".
> ---
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-remoteproc@vger.kernel.org
> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-
> rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-
> rproc.yaml
> index c940199ce89df..78bb976f738ee 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -20,7 +20,9 @@ properties:
>        - fsl,imx7ulp-cm4
>        - fsl,imx8mm-cm4
>        - fsl,imx8mn-cm7
> +      - fsl,imx8mn-cm7-mmio
>        - fsl,imx8mp-cm7
> +      - fsl,imx8mp-cm7-mmio
>        - fsl,imx8mq-cm4
>        - fsl,imx8qm-cm4
>        - fsl,imx8qxp-cm4
> @@ -30,6 +32,11 @@ properties:
>    clocks:
>      maxItems: 1
>=20
> +  gpr:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to IOMUXC GPR block which provide access to CM7 CPUWAIT
> bit.
> +
>    syscon:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> @@ -84,6 +91,19 @@ properties:
>  required:
>    - compatible
>=20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              enum:
> +                - fsl,imx8mn-cm7-mmio
> +                - fsl,imx8mp-cm7-mmio
> +    then:
> +      properties:
> +        gpr: false
> +
>  additionalProperties: false
>=20
>  examples:
> --
> 2.40.1

