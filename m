Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013001.outbound.protection.outlook.com [52.101.72.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76ED4C4F50;
	Thu, 15 Oct 2026 21:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792099392; cv=fail; b=AiCX3Y/3me1BDCriaFbejEcze4coINGoWNGFGuHEJcHirZ08Z+iT0w95WRwjfXT4kEY1hEOomjHrAJwi98zhcF0pqJAsTYKTdwzAQBuj5b45C1I4weFVZacYpBOy7Ye0M/UwZThrQgwjtYj20F23VgvMWmojoxwvv8UIHDLbYDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792099392; c=relaxed/simple;
	bh=pVZnRf0b1BefdL7qvMffCy7JbOlNWPwblPMP7Bxfr10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rOg+Rt5ZIs9DOsQsrZyYkRpVceigz7Tk8l7hmNCveL3h1q9YF2l2wabv0rhY40G87ODIre8TkekjwS8fVHOf6hJGhNxGs/Tkp4zwOHR/Xep0XDNhX+W5GUxvYraSbD7A992nyXEd52hWgpvC2aM9JvK73TgLEkzr9Rw5sTx+u5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZrRN17rJ; arc=fail smtp.client-ip=52.101.72.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZrRN17rJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z1VY4xAgVOKeyxVR3W4EMzjbVDeRBw6/78GiZ80QYT1FNYqL/zGsCy/hEyPiCGgqRQSqkQCOrpgJe9Vu0IRwY9we8OxeYQKrjgw96IkL1g1CLC8bQgkmc3qSEzsI9CjfnEbogroXtzewXtJIPPXvIqr0bm+dKSxqVT4Cu0YKVaZKIxfMTgcD9LQTQuxJ+gWmiO9bO4opum6ownywah3laYn9iBIkly/qZc8OSw4Me323Jboaf1TShzPa6MGE/rV3lysenF480dbaPypBiN/FFbA0PTfS86s0QSrxLTQGnAkllrgKPtd4Ona8sA3IPWZM9V2l6laUQ94KZcB+270zFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WiGS3jnSdR79JOvm5xaADu0x1QibdxSdK0qW4LSzXGs=;
 b=VCDDXBaf6Qn9ob121p/J1LomVrx0djiYSVlo1FvpigJN3mVEle0daBEUWWXm/nlgFh7K4My6vaYdqa6MUCb4K8Civ9+EoL0ivD91Xij6hMJMKixx62LOhvOuS1pE0Rp6nRdig97jvKs8CKdtF/IIzCc6VLItxHqncw/1FMdn2CeFlZPH+yL/grq2QkrPPGVNDWWl9zr77n8NqiybfjD+NhHxrd5NoMSCrPOoxDiia4AVmhRPvc6u66Z06veizsTyXFWqw28sDLNY/aSFS6hnlSgi4A7kh8vYVrMOzmxvXGimmWdmvPZDIH/OKi5sPyEi/RMqQZfWNzyHVL4HMxz3sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WiGS3jnSdR79JOvm5xaADu0x1QibdxSdK0qW4LSzXGs=;
 b=ZrRN17rJc2blosyz8RIIvOABxTOSaAsWjCOdzsmwG7yjR6tEUGs9VWBE3l2Nd1WgL1YpcRq0evOP4+4uzFDMI0lpqDAgTJp/BJv50wBEgejfdb4V7uvCTUdECVYmoOsW0PSLI2B9hsYSrKiU3jqiaoLdUBgMSyA6QJR8MJcvzfDD56fBLmymX6LneBZaVv6Iu+0L0uIDbI0OT1XyIYZjRuoF5vSluM/x8HhgX1E85vb49YXGmGgn2lE0d5LboMK99xb5j/Ni7hlBhaE11sopdgVEsUyxattX8ay69V7dWSIzUtA45COiuwMFa1nx4g2ASU74XL7CCcACd9ov65Ss7w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by AMBPR04MB382366.eurprd04.prod.outlook.com (2603:10a6:20b:815::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 21:23:05 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%4]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 21:23:04 +0000
Date: Thu, 15 Oct 2026 16:22:55 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v5 2/3] remoteproc: imx_rpoc: use memory-region-names to
 avoid hidden ABI
Message-ID: <atFELzfzzrhLdWhX@SMW015318>
References: <20261015-memory-region-name-v5-0-abc358b39a96@nxp.com>
 <20261015-memory-region-name-v5-2-abc358b39a96@nxp.com>
 <179209601177.660553.12335999939165725188.b4-review@b4>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179209601177.660553.12335999939165725188.b4-review@b4>
X-ClientProxiedBy: PH8PR20CA0002.namprd20.prod.outlook.com
 (2603:10b6:510:23c::6) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|AMBPR04MB382366:EE_
X-MS-Office365-Filtering-Correlation-Id: eabb5bef-c0f1-45ad-bfdb-08df2b027ffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|19092799006|23010399003|56012099006|11063799006|5023799004|4143699003|261009223027099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	++v0Ai6AwtpOJTMMtKAeDdiM/nShfyi3ZzaDJz8Yu88r+Glp2dqp1ZI1rzmmfCvl27h5mQeUsDvxJWIKY5y1yg8fCYADncg+OCBpEKnlQShgwlq/+jYTMWhVH4smNQyF/y2G0mI2bbCamXWGrimp7ItNi4NTskrYodFbm0XUuFjFR/M1FAOOOLWb3wO0d27AIKDfyvVvd3iiiIE8/JYCDf5HYVu/fydsHjZM7lmA5t4nHZUeK2SDF7WqwV5TYBziOb65jaR/nHbkxXWlqHmm1ZEqACbZii07c8z7AQEII4j8cCea3xI12uA9gz/tQ28fO9RDLjldoSkaMewZsZo/sP1FakdUHml6SfwSKzK0NBJ10Prny/6zsfI56nSnXdI2q6R1hp5GILZOmE1W/1mzyjJu9+q8fBloreIhorc2VlLWeW5Fs7T12kc/dxWkCLdLWVyb1QSGTnNdHNGPk+JgUOThnkPEoy8HM3HRsSjr934lHCpn4m/xYB8rwiXsYBcO6bbZfDkJC/T+Dg4KV8Cv7BjRJQrk7aPApW1XZeMtwVfIOvCtoXsWvThdupQ4QXGQpHGtM8ANU0TZDyg640NWF/F7YH8CeOhgifeXTu8xITE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(19092799006)(23010399003)(56012099006)(11063799006)(5023799004)(4143699003)(261009223027099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gKIU8j0fBFu9m9WkhZIVJR3KxQmpo9mhbR755MQfneA3RKr+KpwSq91F7cDk?=
 =?us-ascii?Q?JWr4+axAAJH/i2WH/tQ+c1bZcbO2iGTcwyDRBM1wwrpnl5ZDYTOxUJiCiF5d?=
 =?us-ascii?Q?zQK9hzHOc18rzgH13+asSmcK6cenovr4XDVXnsYq6mtDKZ8QxSdznZmodTbK?=
 =?us-ascii?Q?OyEVqcpRkBOEsCaY8racdqdNUNUWtvXlePHy9Kkg8PCq/L/dSpTEQr/7Y8Ee?=
 =?us-ascii?Q?+4LUgCYqM80+Pm9cqMbfG/G2Ca27QHugFbUY+1g1Je8FxNr4aVZ/zP++Gjg7?=
 =?us-ascii?Q?4lymH7DrnXvUpwinly2o7B2e/RvLZPudFp6eUNzTSpJ1WocdcBItu7HfzJV+?=
 =?us-ascii?Q?FoneHK1b3i4WlTu8EEH7NtgoPRovwoGQQnQKvhhIdV3nleossMIaNZ2LXQTS?=
 =?us-ascii?Q?HMzh8MyfaMJezd3AsgkIlwc9Lpk1YdcA4CmOmcLK1VFsRbvW1egt0zF8x2Y9?=
 =?us-ascii?Q?1rnbjbSF4yr03vbsGpd0FJCPk5fjGPpsz13MkpAV09zA8Al4up0t/jKrtzsv?=
 =?us-ascii?Q?G1fJpE84EiSDmTrC9XPw6ccGt7jwtWhvUnA5M7aW5LrK80k2FNq6GcphSBSg?=
 =?us-ascii?Q?AvS/cUk1XkUEIbnI3qwNdjtFp167CSam1biVkI8lbopWEdLV1dmBBKYlISAp?=
 =?us-ascii?Q?162jLir1lAOBM5zkYPjNn9WJiL7dIGWoUQzV0r/4tbsS36UoTNNXvlI3IyDt?=
 =?us-ascii?Q?VsVWmy/QTg+7rfEdqNY6b9A1rV8JeLxGncoQXuO+ruq4nhnAncNhRqzwR4Bg?=
 =?us-ascii?Q?zpkIWz8y97qZVyisIwlneCHEq5C0QLlcQLPyDN6ZiVYoYdlQJGkHVDR8Wntn?=
 =?us-ascii?Q?gtZzbHB9JVDTxZewe7OUbbVUNxvT0osraqPQUUf0raLVPoHqh1fgKP/FzaFQ?=
 =?us-ascii?Q?miUYqZbnKhLWf8gXM3AyDNh/5p3FK8rrlhjlSBW9ZRtK4NtxtwBY/3wJcxRQ?=
 =?us-ascii?Q?Cg6VTqB8FSUsouEk+eYd/4C+gplrk2q5Yl6F9oXcbcWIxh+YE3UQARXOAY9J?=
 =?us-ascii?Q?80IpGXxCOod7RXNZmSchW41+2BgJRXa9DYdYCRyfn9g5kFIAfJBh+u2jzr4b?=
 =?us-ascii?Q?RYotI8fN5nlS5+zrDTH5CkHIrDLP9ELymMKKOG50JLaU2T4363fKPPyxRb6g?=
 =?us-ascii?Q?sN/dr+22Hxd+IMReqyX7zBZpJj3HdNmcdAOIL3lzVNgrjX58XCJutc3h4sVY?=
 =?us-ascii?Q?l7EZjaI1LD47+cnqSxDnZ0qpb3UcybT31da5exOgeDUbYA1zPXBvO28riRr/?=
 =?us-ascii?Q?ob0LQjZUKMtAlEP+pVXxd5apfLwDD5aBegpGHDzLnd4rYadpr1GZB/6wBj2w?=
 =?us-ascii?Q?L2rRMVCt7oskTD2SMTanvWxHVA15BlaV8c710DobzJn2opaDiYBKJlpMjze5?=
 =?us-ascii?Q?4fzhzlnjJTmxgPt3ccZFAPaGd6vs4tKilYBGIs17Y4wbvrVdlYkZRTH+AjJf?=
 =?us-ascii?Q?p/EmJRJEXhK6TxZ1NVot1N1Go2jq38Lihz2oNcEwfNmq6u8a8y4t6NeNTMZj?=
 =?us-ascii?Q?CKQfYyo6HqOT4g4Dk6SMpqn9800HfxRjHHrGcFdArvE7iPSYCm/R4CIOqN3n?=
 =?us-ascii?Q?/hzw/0PNpInF3ANN/yXuIiZynyqqpqHc4X4sO80L5+/KQcDNJXzwP5cp7Pdh?=
 =?us-ascii?Q?H2f+WqVXs1stMZorDNjMbMjVsy3JBSZ7EsmIe5F/4qSqJsg8z00vYNX5VsPP?=
 =?us-ascii?Q?108bFUHFl4FyxVQgv1q3eLI3Dg3f6j6yqrexl3GZ8JAbFVZsPfvTlvXH6zVU?=
 =?us-ascii?Q?ZGYUMAIiAHTyB9V130G7Akmcvkdc8feuw0OJM0dRlZKK4eQHOAFP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eabb5bef-c0f1-45ad-bfdb-08df2b027ffc
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 21:23:04.9247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: agY9kS46xBIYTik+aXIoi4JRMFn7CsMnPE1sFSBHiBQ6xd9I50KGAHJ437SXjIBYJ4q1YmYCVO/ks3ucTnSDuvDRIQbjDS4WfjMN/LZXgW8I56rgolElnpEtRiG+cyiw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB382366

On Thu, Oct 15, 2026 at 10:26:51PM +0200, Francesco Valla wrote:
> Hello Frank,
>
> > The driver currently derives the memory region type from the referenced
> > memory node name, creating a hidden DT ABI. Since memory node names are
> > not constrained by the binding, incorrect names can silently pass DT
> > validation, as seen in examples using "vdevbuffer" instead of
> > "vdev0buffer" ([1] and [2]).
> >
> > Parse memory-region-names to identify the expected memory regions and avoid
> > relying on memory node names as ABI.
> >
> > Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
> > Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
> >
> > Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > index 745ce52cd822..ce9bdfc1fa98 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -643,7 +643,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
> >  		int err;
> >  		struct resource res;
> >
> > -		err = of_reserved_mem_region_to_resource(np, i++, &res);
> > +		err = imx_rproc_rmem_to_resource(np, i++, &res);
> >  		if (err)
> >  			break;
> >
> > @@ -818,11 +818,20 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
> >  	if (nph <= 0)
> >  		return 0;
> >
> > +	if (!of_property_present(np, "memory-region-names")) {
> > +		dev_warn(dev, "using node names for carveouts should be avoided\n");
> > +	} else {
> > +		if (nph != of_property_count_strings(np, "memory-region-names")) {
> > +			dev_err(dev, "invalid reserved memory name count\n");
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> >  	/* remap optional addresses */
> >  	for (a = 0; a < nph; a++) {
> >  		struct resource res;
> >
> > -		err = of_reserved_mem_region_to_resource(np, a, &res);
> > +		err = imx_rproc_rmem_to_resource(np, a, &res);
> >  		if (err) {
> >  			dev_err(dev, "unable to resolve memory region\n");
> >  			return err;
> > diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> > index 0d7d48352a10..3632bc375c71 100644
> > --- a/drivers/remoteproc/imx_rproc.h
> > +++ b/drivers/remoteproc/imx_rproc.h
> > @@ -7,6 +7,8 @@
> >  #ifndef _IMX_RPROC_H
> >  #define _IMX_RPROC_H
> >
> > +#include <linux/of_reserved_mem.h>
> > +
> >  /* address translation table */
> >  struct imx_rproc_att {
> >  	u32 da;	/* device address (From Cortex M4 view)*/
> > @@ -45,4 +47,23 @@ struct imx_rproc_dcfg {
> >  	u32				reset_vector_mask;
> >  };
> >
> > +static inline int imx_rproc_rmem_to_resource(struct device_node *np,
> > +					     int index,
> > +					     struct resource *res)
> > +{
> > +	int ret;
> > +
> > +	ret = of_reserved_mem_region_to_resource(np, index, res);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* "memory-region-names" is optional */
> > +	ret = of_property_read_string_index(np, "memory-region-names",
> > +					    index, &res->name);
> > +	if (ret == -EINVAL)
> > +		return 0;
> > +
> > +	return ret;
> > +}
> > +
>
> Shouldn't this be a regular function in imx_rproc.c instead of being
> defined as inline here?

Yes, will fix at next version.

Frank

> Keeping it in the driver source file would
> probably make the logic easier to follow, also considering that the
> presence of memory-region-names is evaluated there in
> imx_rproc_addr_init().
>
> >  #endif /* _IMX_RPROC_H */
>
> Regards,
> Francesco
>
> --
> Francesco Valla <francesco@valla.it>
