Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013040.outbound.protection.outlook.com [40.107.159.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40AF3C4544;
	Fri,  5 Jun 2026 15:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780672282; cv=fail; b=MLMfxnUOJryXkqDmGFpjFZJdtVzNP4D3gh5OS2pSdddG3EHb2es8q0Gtg7/Dl4kRfNg9QtleoEV/vxLbYZNdGmOApPGqKyfeG7O8nB8B7nJF/hWNc45GdGEmZOZ5cMOqOoCc89rwF1BQBW4piUUkBB4aS6muk1YjbgwSg4A+z1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780672282; c=relaxed/simple;
	bh=NQgmCjPfuaC0zziKMS85oZB7r9lHIOApBVlDrvC5nI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=M98yDdTjynY1JCLXogMc/rkL6CSgomdUw4RdYgk43W//er3jTTrDdbqOXhzNkj/wQ7EVqDEqnPESLdoHWe7LiGkBejdT6O0bD4WzvGd1uSkIGoQ7bjVDo9UTkvg/fSa2LXgjt2xzr+CAFVRYIljBwg/zpYzCifJNj7avo72ly3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=buEq5/mx; arc=fail smtp.client-ip=40.107.159.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="buEq5/mx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=blp1Gs0jWYKfVtUQupEOB8BRsYBnx4Ggjh2itVDetQZWCDgiLosu2gKJ0jG6m9Ow8pFnKZ6WRQDvNtq5dM+0sGgQgnHbeQo2OAnWcipAz/R51HAwCSshaxU0cE64/bF3IK1an2wbCHVCkoS3HRM6Kkf7GNW6kcCZ7uisMf2lERsQu1ZMwn6twxaex5K8ItLga2l09lAIiCNQWqMt+R2CbxgLyPLUoP58KEE5IWwkRt0/VtTBWeD8mGe8eBmJBY22P6Kmm/ZQ4e0GGsMEHCaEKP5D7dzAM8ad4dS4X2Z8lYuPmqtpeyuQR3usk8iMh9fq6VZm8sIGl0xIDHpWibbqgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPu6v0jidQ+YHC9vqZFDvDFzh38B+LENFFijc7M7G+0=;
 b=GmoXGCkTcf/Qm3PgKbepbXQVj50VwVJ3yrphG1VO1goh3uXHZhCCYkrTZEXohfXxBbNpj3dLt2DAQCfnH//A3dv0Q8Y1ClfCJNY2tMX4p+8agR3HucBQG733kVCcepKTYSwov8a1xSoCtCfKScGcyBnlP6aIwRGArg2ZS3MSo3AMfTcNX418UsxPoNtqYDic7+LpnCDs6iY8ey5EVTDUU/Z3aBZaD26Wr0aupDKEmRFcycuviaejW0Zi1CGEM8nbGGJdi8sK2b4locttJaBN4DzX4yDyCQn09NTAJrM4zK4SPIRqvWt16pCGE+vy0DUdQoqP7+9OMlrMZw0qibwSLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPu6v0jidQ+YHC9vqZFDvDFzh38B+LENFFijc7M7G+0=;
 b=buEq5/mxYeotyHP/c0uM4d2njPfgY+k/j1eONtcczzkBx5jebzOFvhR+MGMQbthtJucod3yi+m3WGcIlm9xmtpYLn1zxdbfD5ObGN66AgXf8QD6vTLRHDxcDbCskIphiBvxNNi+oBCyQqeg+CVLVXPXWazYD6Fa9F5t0/d0XRRrpU1c4FvgafYXWWN4d85aOu6Tv8EkREHUQfjuO32oqdkwXfNj9BYtF1MNOjXkqlaLW95akVtlfosIRSi42RRjri5dWFMrhDTkhdVa9nes00vscFy/zi2pjb5i8p+Ph1gH8knUQ8sfSr3uTLakLsnBP8ja29MnM+AkcKyNurK+pLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10636.eurprd04.prod.outlook.com (2603:10a6:150:223::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 15:11:12 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 15:11:12 +0000
Date: Fri, 5 Jun 2026 11:11:05 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
Message-ID: <aiLnCVdJO5KTr3Mk@lizhi-Precision-Tower-5810>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
 <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: SA1PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10636:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f4c3853-7c62-402a-90e6-08dec314ae3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|52116014|38350700014|5023799004|3023799007|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lGH3tOCn5vyGhmvMMw0eht6LQ2CfK7HtaRhgWxjOE7q4HY7IB7maPx12lpogmp/6H0gm3D6bxDunD/gq9YdU6A8YBU7ur9Z7gltGobx5cJ9Tn9/h22/Qx3gY8NN3APXSiKXPJELEYj8vtO1gZwxf43thqOFH+UoktV06xXK4s2I+RhtvL0xyf/IvtsKDCYQwEotpHNfIENOvPX6i27ZmGfvGFH4MUmXF/FhwVeJfTrbds+lPrs7iXjUDuV8ZvsYt8d9BEafNbcW/9vxrwwUG2T/faxYKsmp8/kJRM1mdh7y2ZInpLAdq6nQRy99KR2z4ZXfwzaXRePIlMLRTFEKuSc4j2tG26W/Fzevc/B6XRM3DOnBaLZmEiqSQfdPXOTQCCnuiGUPmgDU8jNDTHAuQDbOcXgI1hB0UQ/DVNM0jpxHmMRx5i+8IgociwcweGKrYre3TbPJ9lKACoNAjLUV1DjDtDN0FQ8laPRQRcIBENoo0MnybnAdG+l0lx6RmX0m85WyDLFTrlP//Ky+cm4OUX3sViMZ/t1kPPYVT1pmYA2eq7BICRpx7opQxpEzdU3Bt60SrGVaslEP4AdSJm2MKtFlBsfpjDyzHRtfmLtuib9okN0+vpsxoBjawo1LvB9Cg9Nk+zVq0Llsqf28vIE+I70CmyO9hn58ebOHHrfVcA/b0amT5Xx0hOaus6v1k5hRharp09F7sC3SDGyqE6V6ArqlcmBPbOlbtWexdD1Zn+PtVr5pcOGadVdsYkFxmH77C
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(52116014)(38350700014)(5023799004)(3023799007)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h5XznRvcSH0lVhp/j32kw7AtTyxHZ3N+Ow+x52QjGIN/tbV4Gd0V6GtNz1an?=
 =?us-ascii?Q?42B7ozdbJXgzpKGol6Kp9KHN6zID+oA4qWXSlEfp3Wl26pQuDAbQoZYl51by?=
 =?us-ascii?Q?jUfB8POI1Lyxdd6R3dRR7+HkZAKqc2293+xKdhbZORGqOy8uEUcoUtg1LoNj?=
 =?us-ascii?Q?cbkXSQoYUq38reBJlJgg7XB45kWq2qY/DvxWJG8a+pMuYUkDSxq39zTCrlBO?=
 =?us-ascii?Q?nhQc0exozTQjt7QEXTPGsJLCJhpZ/tRG6T0LYtTAJFQLPNCLlTlPjIzt0Je2?=
 =?us-ascii?Q?+mnjBBGTv8/SLAU4c4Ky2rPblHH4ElO2PKXEfDNICs7YF4LwodkBa6X2EM3n?=
 =?us-ascii?Q?QxjnOKjbTwW0BwEKFQYvzopGiOTRTvmZdgRgM1SnjSuhqXyiQ1grQAruP7vG?=
 =?us-ascii?Q?sdeNUkrYxCzLNzKiCjjR1MJEdMK3hRgr+IX6KZKhR+X+XxXVIHUr0UXqi9RF?=
 =?us-ascii?Q?ptXj5efp5U+GmiHVgt5q8/1cZbkEeq4lAL//7KrQfUpF32S5kE3Q5yM8Jek6?=
 =?us-ascii?Q?fP7vjQ66LG7wd0on0iK9PyW0AR5HlqkO9fqEON6+nz8NP3tfqkPS4ZX6hXQU?=
 =?us-ascii?Q?gkUxR1J+/v75t4taOvGbg3owpXJOwWcM1VaHb5e3qcMRYpHJescBzmGCUFiR?=
 =?us-ascii?Q?Z2SmQ+GeEFPa6ytuKP9bjuafLVIWLzl9k2FQePI1bgYMMlhauo29maHnMJqe?=
 =?us-ascii?Q?hnLi8+/08QmQCohzhzhBaE+9t8ikd273wwsgEDK3Q3w+Nual1YHAua0U0nd9?=
 =?us-ascii?Q?YxmGh0nInHYeBSk5CHvbivDIiCIF5bqPQbrWUCLrB2bPTkx5pfqU3lJmaxCn?=
 =?us-ascii?Q?GHoON5be2VA5IW4guya9UmIJvgp1XPIJlRTKGFdVp9ko3qf/N3BSkapZdjcg?=
 =?us-ascii?Q?D7qoflJLBTU8w/MGUnC8i5E8nHPP829QjrNRWSUvEuFOFoIhVjV08/zLaCbl?=
 =?us-ascii?Q?DwBGvZVLlKiqrNqmWKVU8KDVwko7ttdWFWO9my3x+9LrT1sfYt12ak8/tyXc?=
 =?us-ascii?Q?XPtI5OHPxbHLj9EVcDKkrf3f+GFheFsyTP7ioPDPUEGHLstzOPlZGfKoc2+a?=
 =?us-ascii?Q?INK74QGv1MnmQdJnrYEX+/T7nlG+3Q4poAiufxvjZiy7cc7OARtxUcfZMYuv?=
 =?us-ascii?Q?mv3RpJ9LqlErSVJ0qOhK7GJcS/M0M2fP8wBIQy69cl0tzYQjX2bHzDCU5TkK?=
 =?us-ascii?Q?RB0syGNvEVaVC7jhwbvTddAkcE5ZjS8jbcbJgaINZ4A9ODU6jHowFEE+82IS?=
 =?us-ascii?Q?mJtVNpvy/WxBznBx5N9sXmj0jb/Fby6UzprrKjQtcn+6Nxo7bZHVEV91IQZZ?=
 =?us-ascii?Q?/deEDg16YD8IiClPkMgnwM6Lbh5YGBr3dr3AzIY6hYRpyw3Gwwp1FEPG5Lkh?=
 =?us-ascii?Q?6RgrAeSCZHFurgREtvLEbVHllnIK8wfaBiplD0A1QQcY1b/GLj+iOMGtkeXK?=
 =?us-ascii?Q?J8RxhOm242O7Gwa3mDs/SFiwINWx1aIQZqf0+epKW9IYonRmau43dTRey+EN?=
 =?us-ascii?Q?Vvwj+SZWH21VC30U9AzrgUrw098+SKGbTb1MeuTQ/zRPHF5BbeU7aY10SeNI?=
 =?us-ascii?Q?khjO76mK210ukLxa8Dk//s2JIXu5o+fxvUTeEc2HJYlWYkmGF2ZRCl+WKTtm?=
 =?us-ascii?Q?w82rmIisi5hp6Mn726CZMQE2bVuAdrYe9SWnr3TCjCZcDJ2EsQYZvmfeMwD/?=
 =?us-ascii?Q?iv7ofuKLHpX8TbR22tNGuW6Qm5kL73/qK6reBK/jxjq/o26y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f4c3853-7c62-402a-90e6-08dec314ae3a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 15:11:12.5848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhzoclQP/0zBSEo8NxhFd+29gnOSfqTw5+FGThbLfZi1OfkmkJwle+9xoCcdC7vWorqf3SkWUy1x+x5TThdIUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10636

On Fri, Jun 05, 2026 at 04:36:18AM -0700, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> The names of the carveout regions are derived using the names of the
> reserved memory devicetree nodes, which are referenced using the
> "memory-region" property. This adds a restriction on the names of said
> devicetree nodes, often bearing specific names such as: "vdevbuffer",
> "vdev0vring0", "rsc-table", etc... This goes against the devicetree
> specification's recommendation, which states that the devicetree node
> names should be generic.

Addition notes for dt reviever:

binding check can't restrict memory node naming because no specific
compatible string for it. So there are hidden ABI by node name here.
use memory-region-name can eliminate such hidden ABI.

>
> Fix this by documenting an additional, optional property:
> "memory-region-names". This way, the carveout names can use the values
> passed via "memory-region-names", while keeping the devicetree node
> names of the reserved memory regions generic.
>
> There are no restrictions imposed on the values of the strings passed via
> the new property since the software allows any name to be used, with some
> names (e.g. "vdev%dbuffer", "vdev%dvring%d", "rsc-table") bearing a
> special meaning.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index c18f71b64889..8e3e6676a95e 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -62,6 +62,10 @@ properties:
>      minItems: 1
>      maxItems: 32
>
> +  memory-region-names:
> +    minItems: 1
> +    maxItems: 32
> +
>    power-domains:
>      minItems: 2
>      maxItems: 8
> --
> 2.43.0
>
