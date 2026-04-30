Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013053.outbound.protection.outlook.com [52.101.72.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D281378811;
	Thu, 30 Apr 2026 06:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777531620; cv=fail; b=gPpaEub/8xUdU0D+qWYPvLSayhCwWq08uEnxtGrGuPdBa3UqJvc8/zW3ZPOrUv/yGdXpMNRueL4J+U/yXckdTBgVTxkhV3zguaxkMZYlpRkXLTKF1woqL/Q6Z26YmS9c/QkUuovSQ6B2iiRI6ct6KcmS9fzYplES2Pbkbjr3lhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777531620; c=relaxed/simple;
	bh=VKAOEV7dm74T2G6WgaCV3W714JDEIHTLvKAlZEWkqJ0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QHQGMgWdDZ3ifZ/vfU56twDM5cXJBbNDK8ZZ1mIaNchouNR9k9JUNjT1SJJugjWofgMKkYjQS40kYas+PL0cRmADFsD2JNFPDnQhHkSunKi+lcxiMA/VcKUgwC1dORbDp+wj3dEnPKI3HLvdk01lQ36VuIxKywW2huKZGXvLH1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kw4HJP4D; arc=fail smtp.client-ip=52.101.72.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kw4HJP4D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F2L6rJC9bdM5sWNMLkHG+XH7p2EHCAWZEqcyqS+0yktfJuYU7Q+bUh/+SmyMk6AchxinK3fA6/Je4Ou7OqUYdnZw1vXGIMHbDQDbF+XWxaW/L63S3o+ECmIf/o8bpm/5IGgpQzuClpbGAY8Mfa9Jul5ovK6xitVmkggQ4sY0fUBnMyCo4f7S/w5mfwEoT9q2CbUEQWXs8AApZuTY6pQg3+l9pmnrhKOnv9xmN8OXB3zL1DdlptxD7TIGMpwVMbhyeeZNSifoHyhdLZnVgpbxfgPFNmXfBnFZGUp/ZNho+hdHmLni/x8Ogc5P0+EvUR2kGs9UeVHegoiSSFc1NbzmGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HlViPHopFrwp27NYGD3asZKOX40a68ObMi7S2Jvn22k=;
 b=yDWlGlWJuiHQIysZ8D/ql+RLe6RrNjYxlClDJ/w4rS/FKXp0XhPFmeNHGEJEdDXwjoV6+zBxmbGCFXyyEu7poDjiQPndTklhPvoVfzkVztkrZgjSnNeSiriRIniV57o/SRcXYehSdyV8mKnsyrZzUWWDMABhbh7V64ffOi/uVfrpvcg+Zfv9XKFpbMeMQA7Y/3yINPPg/YdVTv+gGKasbCwD2bfTinMDPUOIs1s2Nw8z1NbN/5Essyf9u5dLDD5jLwpLZQGWTppTUgjqH/dTZvJV1Ok25/yTk6IFyyt6c4OT3vb7q7F+HRXYgyMro8qECkfb/bQJD1dVpdcVckrDkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HlViPHopFrwp27NYGD3asZKOX40a68ObMi7S2Jvn22k=;
 b=kw4HJP4DV+SSYR8dCBoQiZLd1X3hmuLT1r/WYodxkgNQUSVaIi7yLjgq8FXkh+yBNOVIwXk0Nf1Up/KYZPzOlRctc/kHGgEyeB4BVX64kdX/qWUEb68+yWvebOVMTs45ND46KvYElamY0rj+BPVL9VVv53QsbzdaVBWKXuAZMjXSkSW7vBBIw20b8+/1LWdfFIMElkp5yBfCtnQtaaL5EIbZHhDSVc4O6rDfD3I4ZepJ468iEIbTAdebQ2CqZXNvOy/c1RSk5DsXfnZHkKhVQWHcLt8NUctqrUtm4S4L3ld3XLK57bwox/7Av5U3s+foQf7zA1ZgOv3Xikx9CXY9fQ==
Received: from AM9PR04MB8196.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::12)
 by AM0PR04MB11854.eurprd04.prod.outlook.com (2603:10a6:20b:6fc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 06:46:54 +0000
Received: from AM9PR04MB8196.eurprd04.prod.outlook.com
 ([fe80::fddb:8654:17a2:b4a1]) by AM9PR04MB8196.eurprd04.prod.outlook.com
 ([fe80::fddb:8654:17a2:b4a1%6]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 06:46:54 +0000
From: Jiafei Pan <jiafei.pan@nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>, Peng Fan <peng.fan@nxp.com>,
	"mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>, Mingkai Hu
	<mingkai.hu@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "Z.Q. Hou" <zhiqiang.hou@nxp.com>,
	"festevam@gmail.com" <festevam@gmail.com>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, Frank Li <frank.li@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "andersson@kernel.org"
	<andersson@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	Jiafei Pan <jiafei.pan@nxp.com>
Subject: RE: [EXT] Re: [PATCH v2 1/5] dt-bindings: remoteproc: add
 imx-rproc-psci binding
Thread-Topic: [EXT] Re: [PATCH v2 1/5] dt-bindings: remoteproc: add
 imx-rproc-psci binding
Thread-Index: AQHc14VtKyR1QxJgvEuL+JOUfYEYYLX1c3oAgAG3LrA=
Date: Thu, 30 Apr 2026 06:46:54 +0000
Message-ID:
 <AM9PR04MB81966BB99A7DBCC5C2EE56DC8A352@AM9PR04MB8196.eurprd04.prod.outlook.com>
References: <20260429031047.30893-1-Jiafei.Pan@nxp.com>
 <20260429031047.30893-2-Jiafei.Pan@nxp.com>
 <177743718015.3571544.12237368801599782841.robh@kernel.org>
In-Reply-To: <177743718015.3571544.12237368801599782841.robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8196:EE_|AM0PR04MB11854:EE_
x-ms-office365-filtering-correlation-id: 180c1018-b124-451b-0e8d-08dea6844427
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|10070799003|19092799006|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 82fNVOj+HBjgI6A2ufncUwQOOU+Ww/OKIjLeyayEJ8NB+seMTW+bygxyBszbmh1mEnqgd/z6eRwGSWsDO9SPhiUQNviQYs/K9WuL0LWjPAlSUs9vpoK4Wv/ylL261XmDrW6cbNG/2LLWxnldEKNe6ibtGtUUNeDWMrgyrkp95xCxMU+KpF5Znqx1DkEWTDrGBuwDbDQQNmK9bYI5gGisEjnPD9I6zaC4me7nFu4cv7ioa7m7DwWhm7rVdKsY8zmYxf8YBSLzzU+2CuAVJJ1i+yKuLxA4YIZ6feF3jtVIJPZpIrOEVluSKco2Cs7/hSsrvcGuzw200HTFVS4B1fW36jAYbzaE9mxNG+l8mI8q1PUiaxzuGBm5md10mMqivvu2EbjxkR+k6+lDVe+eGAm8QP1DqZtVRHu+NxZwEGlFxWWXLKXnaTwgHGGrRIKiu+5vpuUzSyrOVVnMjx+nWtwdkb64g1RZ6TMS7Fw1DUnS2+dy9FJ4ZVUqCR4g3/uUIUROE0F1NTUeBi7KitQxrwMHig32Xg+sU0iX1M8nmxYN8TEkd1h/p7QkNdscBg1dUYvQeEdRtyTqT76Ae/xOmzGlA46WK06OcEBrqusV9c2VOTa1Lq/AdA9Sut5vEmm7hUBGlFCZOGDAnmbsQ+xSrjK2t4qZiLax7u8kF9l+0eQ8pR8+ZucxAoMoVrVMrt2V7Z+cwYPxj3f4lC4N6G7M18J4XMY+2iHLfzfluowkUTVxpsZhAFfe28rt23CCiu5PPCLlmzeRjSM88bkDBDiww5p90ysVdeMwqgNBjQ74FCFAlFo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8196.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003)(19092799006)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?wAChIBndP4uAou7DRR6dslCEi5tixFsQi4BRE2gCoBYL1/iaMDJSzU/mUOfd?=
 =?us-ascii?Q?/iXWQucAsZrVgxmjPxe9OBKOWG18dSu97p5odenAU2DoZXEkGiJhpeABSHQt?=
 =?us-ascii?Q?uGM3dm5dqzsYs5avnnqOQAwVrw5BMlRhfdUZJtHm/0JPPxY1nSPwysC/x1Rt?=
 =?us-ascii?Q?Hz3kJCV6N0R8qQSSCtAVhscNc6Yo0HlU+tsd3sqg3h1M0Los3LdQkOzAV0Aw?=
 =?us-ascii?Q?aGoQmk4coIDRd7g3CWgxhoyB6fv6QAm6XjUk8aEVh+FQorfBCNARPo8U73NL?=
 =?us-ascii?Q?ys+cXBh/k5DXC0kMqpP08MMrKSeAf9k6p0J6Tw3MC1K3COZ5ewd5xovB/+El?=
 =?us-ascii?Q?lsb0NVtg3Skt0jvkU1b8Zqxqx7mWFjtruqX86S1Z/8hZtfoJkpvti1oBOlcI?=
 =?us-ascii?Q?d4P249uFsqeuYdGFzYDIPD+X88ptEQ54e+tD0KI2+f2Dx1Lk6jnN1bhn2Mua?=
 =?us-ascii?Q?7gzYWk3pr62taFvYUNvRSnVG60+vouf3+WPNxqYCMiH1AbSnyyzLcppnR1pb?=
 =?us-ascii?Q?UpAOUXxZ3XaWx+pJrSykOAeRJrqi+Fo1Saosb4otXj5lybRODjdcFualR/tH?=
 =?us-ascii?Q?7PJSZG6wYCN7c4XgcLNAfK2TjpFIJrgLSSkZBZqmeoGAUSko43m/8KPTaOTT?=
 =?us-ascii?Q?cNlSVugDR01sdbXltCKwZlDdpeJWwDa9QXSKcnACqbSfLVfA+bydKXaFGAJa?=
 =?us-ascii?Q?WlesG96CPTvZKMd8pr8nac7jSrc1D+m1rYgwVmKkwGY+9hgcSVuZKgzKI3fM?=
 =?us-ascii?Q?Yia+K2wFQM2pTJh1OmstsWHxKhdvuxLN+C/K8X0wFLKtbTIhucd1GVMksQyC?=
 =?us-ascii?Q?WzbACR9ctYs08DSXsPEpUZSGaSC2hjSulIpssgw4XyI5fvsxTyGYyRcUlAcY?=
 =?us-ascii?Q?SH1lJ50MZnUFGeFcH7HQsNBDilueZOsYQEkPHLEPyfzhzroDs46INe1OMZtO?=
 =?us-ascii?Q?qL9GUfAwSaCIfAo0JHjdnr3f1Ej21D9Zrc2cpo8fnYqUZpTJzOOlup0M0CU9?=
 =?us-ascii?Q?Gpp4kgGRGpTRDtV9YBMcLNlH2bVRcm1jaPEX65JWsI4FlYKVOI7n3IV4CIC9?=
 =?us-ascii?Q?PV0BT4mC7ut64wnycSP6eD96puBTkaun6IdAlBUW8X5tClkq3gF2d86Y+OK8?=
 =?us-ascii?Q?lx8NVwVNJgFufL9qrnOYqATRE0I0pDlhE8ujef5OsxAcFRrNLka1c+2iJ/lJ?=
 =?us-ascii?Q?pA6kz+ldbLHkq1tshiIAiIUl1t+ciCoQecVzLoQ3yKOs6oDTuhmPd00eqsZC?=
 =?us-ascii?Q?LWu9CijjNSwTQONkTOAyH/N4xH9GJkOULja0dvF+YlfMlGgf/MI6qpNjjFkg?=
 =?us-ascii?Q?rKgvs69ggMSRou++aJabF8ZOyetDvl9nebXyOFqS7M+lEtH5N7+cZBU7Mvo6?=
 =?us-ascii?Q?BP2I17S7XWVPAsX3HtH53Ca/SiwfG3sJnM8MUz3zJu1bkDEBTCiGnKDD1vqc?=
 =?us-ascii?Q?FgJIAgDY9vvncrxqYfRmbiJFNI0sF/b/a6hlLn+pU8MknIflzD2X5LmtVzGi?=
 =?us-ascii?Q?KrXQjGE2FQeF3Gun4C2joxNP2keElciSOHcCfHUP07tkxH7SwnUup1Teov5k?=
 =?us-ascii?Q?s4uVGacekG6rlGyIJEDXcrUA2uy3MS4G0mOMlYCW/jHC8asXwEKt7Y4Ai7kY?=
 =?us-ascii?Q?4fQv7bpBHjukhYPaZrmS+6KiUeD5aZZGcdxG3r2QHMRQ0fNXluCtuXQpsNP+?=
 =?us-ascii?Q?QwBybO5ia9ZYF+Ro10eFXG+qrcpUjVjrvXLSCT9A/gptL/05CE/u2gWJVq4G?=
 =?us-ascii?Q?m3CEn0TUz7Lj20elYaRVrIot9OJY7297RSE5lshal0vfi1RxIn/D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8196.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 180c1018-b124-451b-0e8d-08dea6844427
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 06:46:54.2293
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FzaL/ztitlHmkpb5vFHV9pGrRq9qpTW4h67n3jaM6pkTBdKmW+RD67/NWHBLpjAtO6rAFCUeO0q9reHVcev/mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11854

> On Wed, 29 Apr 2026 11:10:43 +0800, Jiafei Pan wrote:
> > Add compatible string "fsl,imx-rproc-psci" for i.MX Cortex-A Core's
> > remoteproc support.
> >
> > Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
> > ---
> >  .../remoteproc/fsl,imx-rproc-psci.yaml        | 64
> +++++++++++++++++++
> >  1 file changed, 64 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
> >
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/r=
e
> moteproc/fsl,imx-rproc-psci.yaml: properties:fsl,cpus-bits: '$ref' should=
 not be
> valid under {'const': '$ref'}
>         hint: Standard unit suffix properties don't need a type $ref
>         from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevice=
t
> ree.org%2Fmeta-schemas%2Fcore.yaml&data=3D05%7C02%7CJiafei.Pan%40nx
> p.com%7C047a041815cd4324f05f08dea5a8672f%7C686ea1d3bc2b4c6fa92c
> d99c5c301635%7C0%7C0%7C639130339864199051%7CUnknown%7CTWFp
> bGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4z
> MiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DolcEFl6U
> HPDO%2FSIhOEekKq%2BEdROarh3zIvVm1oh0FKM%3D&reserved=3D0
> Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.example.
> dts:8.9-16: Warning (ranges_format): /reserved-memory:ranges: empty
> "ranges" property but its #size-cells (2) differs from / (1)
> Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.example.
> dts:5.21-14.7: Warning (avoid_default_addr_size): /reserved-memory: Relyi=
ng
> on default #address-cells value
> Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.example.
> dts:5.21-14.7: Warning (avoid_default_addr_size): /reserved-memory: Relyi=
ng
> on default #size-cells value
> Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.example.
> dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite
> 'avoid_default_addr_size'
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/r=
e
> moteproc/fsl,imx-rproc-psci.example.dtb: /: 'compatible' is a required
> property
>         from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevice=
t
> ree.org%2Fschemas%2Froot-node.yaml&data=3D05%7C02%7CJiafei.Pan%40nx
> p.com%7C047a041815cd4324f05f08dea5a8672f%7C686ea1d3bc2b4c6fa92c
> d99c5c301635%7C0%7C0%7C639130339864225830%7CUnknown%7CTWFp
> bGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4z
> MiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DnZOtCvf
> 57EyKj1cLd1TwW6sRJeAc67cOXgFG%2BSrVAX4%3D&reserved=3D0
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/r=
e
> moteproc/fsl,imx-rproc-psci.example.dtb: /: 'model' is a required propert=
y
>         from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevice=
t
> ree.org%2Fschemas%2Froot-node.yaml&data=3D05%7C02%7CJiafei.Pan%40nx
> p.com%7C047a041815cd4324f05f08dea5a8672f%7C686ea1d3bc2b4c6fa92c
> d99c5c301635%7C0%7C0%7C639130339864244545%7CUnknown%7CTWFp
> bGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4z
> MiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Dp5Qp6lO
> dpmNSnB1Deipk95Sx%2FtdU3cbhEZnoYHZqP4g%3D&reserved=3D0
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/r=
e
> moteproc/fsl,imx-rproc-psci.example.dtb: /: '#address-cells' is a require=
d
> property
>         from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevice=
t
> ree.org%2Fschemas%2Froot-node.yaml&data=3D05%7C02%7CJiafei.Pan%40nx
> p.com%7C047a041815cd4324f05f08dea5a8672f%7C686ea1d3bc2b4c6fa92c
> d99c5c301635%7C0%7C0%7C639130339864262531%7CUnknown%7CTWFp
> bGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4z
> MiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D09mohX
> SQe4bSnzh9WQWudNgLXQ6Hi1SwK%2BiQ59GLZPA%3D&reserved=3D0
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/r=
e
> moteproc/fsl,imx-rproc-psci.example.dtb: /: '#size-cells' is a required
> property
>         from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevice=
t
> ree.org%2Fschemas%2Froot-node.yaml&data=3D05%7C02%7CJiafei.Pan%40nx
> p.com%7C047a041815cd4324f05f08dea5a8672f%7C686ea1d3bc2b4c6fa92c
> d99c5c301635%7C0%7C0%7C639130339864282107%7CUnknown%7CTWFp
> bGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4z
> MiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DR85RHd
> R7SyFE8vutb1nTigpDMvYB4balwMQ1dwJvmpc%3D&reserved=3D0
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/r=
e
> moteproc/fsl,imx-rproc-psci.example.dtb: remoteproc-ca55-1
> (fsl,imx-rproc-psci): fsl,cpus-bits: 2 is not of type 'array'
>         from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevice=
t
> ree.org%2Fschemas%2Fproperty-units.yaml&data=3D05%7C02%7CJiafei.Pan%4
> 0nxp.com%7C047a041815cd4324f05f08dea5a8672f%7C686ea1d3bc2b4c6fa
> 92cd99c5c301635%7C0%7C0%7C639130339864301617%7CUnknown%7CT
> WFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXa
> W4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D0QR
> M5EVXEq2VABkbyBIVRxep0WGhG6aXe4ieI6%2FQAr0%3D&reserved=3D0
>=20
> doc reference errors (make refcheckdocs):
>=20
> See
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch
> work.kernel.org%2Fproject%2Fdevicetree%2Fpatch%2F20260429031047.308
> 93-2-Jiafei.Pan%40nxp.com&data=3D05%7C02%7CJiafei.Pan%40nxp.com%7C0
> 47a041815cd4324f05f08dea5a8672f%7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0%7C0%7C639130339864319641%7CUnknown%7CTWFpbGZsb3d8ey
> JFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoi
> TWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D0Aovvm3Wuu3p%2F
> 2hzjrhG8kUQiNS7cWZ0jIALpFQyfho%3D&reserved=3D0
>=20
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above error=
(s),
> then make sure 'yamllint' is installed and dt-schema is up to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your
> schema.

Thanks for your comments, will update the patch.
Jiafei.
