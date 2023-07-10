Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D8DDEB64DD
	for <linux-remoteproc@archiver.kernel.org>; Mon, 10 Jul 2023 01:22:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbjGJBWc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 9 Jul 2023 21:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjGJBWb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 9 Jul 2023 21:22:31 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2064.outbound.protection.outlook.com [40.107.22.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75498D1;
        Sun,  9 Jul 2023 18:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvRGp/W4FgrU9ikHyRTRmRjJ1BSR9pcW9L3Z8OeuwAqiZRe8fbRKl2p09i4TiEVLYXCETaxtQLax3yydV0wweytSdqbyovCrQMBNxqWmLSrE2lOEYHmHuotOK3GpTki+39YZSP03BxQ4/LonnwHzG1KJTYszp+INsKCEEK39YuvANNgVqKvY4uPmwQjic2nNkF3DFHWI2NoTfkXNXKdKcjmGCfA9Kk31KOxKTFBpscChSeghFoFfMNchZIOesZQIczvhQrOyLaKvk1ermXwJi5/hZYsWfktjPRxVRCCcRM1OniyGKftLne1gtMkMu+w6eFdTfFVQQ9vekVc12SfSIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXGNs4NuJPFAXdwxwbZhJyoGF7qGqRfFHop836rwQ5w=;
 b=ZuJQf2yEJhBd9IFvelbIly/Ec6ONcAz/6uq9iEXGkqifo1wUd1P3TPWi7zoe7SwYO01toB62UA5LagpEP/FSgvrVGkLcm4aujho1IlxgHt4xrIlDjkck4TfQNhT9kEK5Z8nyQrmN5OGzIfUxLPTn8RdCXesPp3FgDp+Ac9h41xAGNB26v5Ng3/XOQxX9nwf4nv3w45Z5NZu8O0cGYGzvouh7IgLGDHUx+tCHZ7j9pCsAROntvBt2yuq7rmmyrb2/dPhI4cfcMGfgakD2smgau+XNa6l7o69xR/WvrK7P7d1j3uQkRRvbC9Q54ZnbYHA4vDM0qNMlFIJ9dfR+pVcNEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXGNs4NuJPFAXdwxwbZhJyoGF7qGqRfFHop836rwQ5w=;
 b=LXJ44HGY8Gh9bRIEsg5vyrAQBqGbN39xymyyIC0hSan6Waz+aBbY6VVcXI+zoC20enINpv2fBKBjIT9B1DxOJI8rDeCqOAiC9R+us77cgyW6Ilw7XA77W7VfhT+al48Bkhho7IgCQCES/MXFYlZm7cbDLUL008LTFWpEDYm3apY=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DBBPR04MB7707.eurprd04.prod.outlook.com (2603:10a6:10:1f4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Mon, 10 Jul
 2023 01:22:28 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::5c40:ed07:b875:18c0]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::5c40:ed07:b875:18c0%3]) with mapi id 15.20.6565.026; Mon, 10 Jul 2023
 01:22:27 +0000
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
Subject: RE: [PATCH 1/2] dt-bindings: remoteproc: imx_rproc: Document
 fsl,startup-delay-ms
Thread-Topic: [PATCH 1/2] dt-bindings: remoteproc: imx_rproc: Document
 fsl,startup-delay-ms
Thread-Index: AQHZsSpDUJQQvyJjgkGXxxxpcL2Cvq+yNzEw
Date:   Mon, 10 Jul 2023 01:22:27 +0000
Message-ID: <DU0PR04MB94172FD41EFCABAFE01CA7468830A@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20230707232444.374431-1-marex@denx.de>
In-Reply-To: <20230707232444.374431-1-marex@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|DBBPR04MB7707:EE_
x-ms-office365-filtering-correlation-id: c46c6ecd-5087-4c7a-8e39-08db80e41fe6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yegcXTcxzsuBksCZjCV2EHpCOuaBeOCv7sJZkBfUwYQ6bnFsa819kxUoAZvLmtDPlYvKJhO34ba2247E61yjs+I6uZXOKm/wSdJarUmKpSQQDxGwacsjYSSYfxbkiXtFkVIxn6fvFQTD27ZiN2TQusnnoSccmtcelSRrkOn7EVQjgs0zvxSudKF2D+j/byHJBHvY9y4xntKEJkY2oaOkMfXnpuWx/ciUx9IExi+D3D9kklOZb/zyK2oq8gBvJgg/p0D6012JU3tkkuNX1Cp/3NRwJlD7mHk8Y30qy7TCt5nNF48pNTTpmJo2iEHMdiNbnAzMSPcT4gV8PB1tR9JfhohYbzWwQ5QiEmFFZEZsXJZxMnjMpGVmJkvBAi7+xiLZRyYgUb0Fytg8YKOzoU0EDoN1PvUmAzPvgu2DatLKQ6px1+Iv0BRkf+tyy4lrivm419/dxIgHnWGySNfh3HQ4dyiiX/vSAOBBgE+f+sd63nHtqibCAdGLp2kkX/pbhAppVhnm3wcZeP9Yfi9Yn0Jsx1KSc8wO6mUHSLnQWnjJPW4Ry4ar4W35/7lmg88ZU+o3uBD1UwKqwK9lhLuosUfe2OIZOu/NQkPMTLoeA7WpuuS39QFlXQVPUdwIaDbPy827
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(366004)(376002)(136003)(346002)(451199021)(66476007)(26005)(478600001)(6506007)(9686003)(86362001)(71200400001)(186003)(110136005)(316002)(54906003)(38100700002)(7696005)(66446008)(76116006)(122000001)(64756008)(66946007)(66556008)(4326008)(52536014)(5660300002)(7416002)(8936002)(8676002)(44832011)(38070700005)(41300700001)(2906002)(55016003)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UDZ4uKEetKOKsXTHUgovWLm4ZggBt+LAIvQYhO5Hqvu06i9Lpc3t90izEUTO?=
 =?us-ascii?Q?YPaC4J4QhrrDrgEkspCaBgVxei2hJkkuH5FUUhG3XEhUaoOjDibZycRPXVHT?=
 =?us-ascii?Q?dvoChOJ4jxkB/iJbAqeUDCJFeyUKd34PkJ+QL4bHbSCNxukdbWDv2DKJCikt?=
 =?us-ascii?Q?G/jAG/6BKFxUGL2LCPtmuPxI3vUcSeWTJzdF9j+7MFJtusj+Db+m33FDZljP?=
 =?us-ascii?Q?l+C5uZLJrOMCCaN6gTEC/PXJU5pHAmwd39nt0L62r9C3tmBBqZ6jjqphwTQ4?=
 =?us-ascii?Q?iFnNtNTn8Ss38uDVs4f72JaxWxpNEG/eFaQlb6h8LnHnRAzf+fCxlbMQrhG+?=
 =?us-ascii?Q?A+t1fsromIn7fF/am7HG1z604nbb/bE2zaZVjwtFQgFxLT0mY3ZuE0ZFq4sF?=
 =?us-ascii?Q?0jX/6fh7ELItAxx2kbaOwHb7N1uOdr6fj1eP+LMnhdanJdbJ0csI894wDOcz?=
 =?us-ascii?Q?3SklrHhwoSnKH6jhOJGfBWpR4sqLWA02sO53tEL6OJ2KrU0zIuGHjNsgnhQG?=
 =?us-ascii?Q?mDTc0/D2sc8RnRaPh4fhPM2OhIb15IuqdkVwGBPe53FtBEfZ24DFDCpDubus?=
 =?us-ascii?Q?zpWXage8Hbq5PqQZxUj+lOXkoEnvbbJjPKbshj0kFhItY6buFSenG28s6zmg?=
 =?us-ascii?Q?Kztk1H0ePQzMXUMsxtoXf25aN0nNv2x6vXWdGMLQVEagy2n77DpZhST81k0I?=
 =?us-ascii?Q?FNiiuSK3Bb9II/KUUEhLnpqSvUiiXNV+nCljfEl2Auxzch9Fea92mWPwrLwO?=
 =?us-ascii?Q?ctrwvllDSEFlSRc0WqrD3mVefrkcbzGgMV6AEgMmUJxrbKN2xGizX+xJAX/p?=
 =?us-ascii?Q?x3E/8p8B6nl71EXzPIBvBvBLSWHhKM3CsUf2Cy+1RW/HR6s96Pj7I3/UEQLW?=
 =?us-ascii?Q?OhdlF2sC5B7SCCAG1yelZCCER1jfkTAilYMj7VKaJge+UQ9IC5HUyt1GiFcD?=
 =?us-ascii?Q?kuJ0GfIZCLPIKbhPVktZKNQsrM3KFxVy8zNK7azMkAGppho1rQEz1twNpp+K?=
 =?us-ascii?Q?Kyblf70jokrjXy7uvNzPJ8qBOcPOx4Cd6exRtEFAsL+gxkMOSeGRQnunXp1t?=
 =?us-ascii?Q?kBd44bTNlWrxXqqJ5Mb70Eu0QHJFsYVX5vIlOJUzRqzxR6DYAwgtEA7dY7v4?=
 =?us-ascii?Q?nQUueUSPRPEmitggm/m8j/gqouG1gY+uKlED5EogKrfGBtG33eCZwwJMpMOW?=
 =?us-ascii?Q?LxSdGb1VOheBGG+0p4TrJP9kfU/005PneWHRf0gNnamDL8y87uRxIfEUP0Xp?=
 =?us-ascii?Q?90pKFasyd7JcGHVvB+TkbKzvHNmKWvlmeecvzyKhEkuL0tdWoFxyMqa0Fcn5?=
 =?us-ascii?Q?0a8ecXlQX8l8LBgUeLJ9nJ5OmaAJRD4nkav7iVX4e4FXmg/00tE1dO6QhoOA?=
 =?us-ascii?Q?cU5uvck/+OTiofj0pd8yne2s1YX16/kIKb/eW2VdslCwNqJEu6VTOltjrvd5?=
 =?us-ascii?Q?yujA9LLjjdnjavSbs6yATJvqr7yiPzpEghIQjNY2K6TSbCPTkmN6XF3vhuan?=
 =?us-ascii?Q?OvH+nAOUAC/llBYI4HZQRVed338VCYo2x7KAhJXEyVsMzkQ7c8wiWm4Yh3cN?=
 =?us-ascii?Q?CvyDh9wZxJAVtHYy4N8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c46c6ecd-5087-4c7a-8e39-08db80e41fe6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2023 01:22:27.8578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ObU/rJPWKJHQG+yw7cGf0Myl4c2hR+r5Y8twtY7EBEePVvnrD8ZY1kaNx3Psy7GyM/1uBfmJaslrShhYS1rcyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7707
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: [PATCH 1/2] dt-bindings: remoteproc: imx_rproc: Document
> fsl,startup-delay-ms
>=20
> Document fsl,startup-delay-ms property which indicates how long the
> system software should wait until attempting to communicate with the CM
> firmware. This gives the CM firmware a bit of time to boot and get ready =
for
> communication.

This property was rejected before, but anyway I would still hope we could
get this in.

Thanks,
Peng.

>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
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
>  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml        | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-
> rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-
> rproc.yaml
> index 0c3910f152d1d..c940199ce89df 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -76,6 +76,11 @@ properties:
>        This property is to specify the resource id of the remote processo=
r in
> SoC
>        which supports SCFW
>=20
> +  fsl,startup-delay-ms:
> +    default: 0
> +    description:
> +      CM firmware start up delay.
> +
>  required:
>    - compatible
>=20
> --
> 2.40.1

