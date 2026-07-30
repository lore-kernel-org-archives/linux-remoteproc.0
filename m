Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010037.outbound.protection.outlook.com [52.101.84.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CBA3955CC;
	Thu, 30 Jul 2026 16:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785430702; cv=fail; b=eMgs/HPMnYjWfMWHBp/YOPjp+RRcO3fGplCAZPZguIv2L2ASmYMdoV/+ICMmBFYG7Zi0a1BoGCDgVpjihCCsEgwT5do+UZ+R8LggSdyrG/iEp9ALs9Mc2ag4pJ+asKMmfgz+jQsBgKEFJbadmOcRdNC+WSU2+/8K5BS1WQHEJsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785430702; c=relaxed/simple;
	bh=QOjHtu92sIxmNI42PeKM3nls9kRr3A2wJAEYYTQPddk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kllvx2Az+7j486FhizbtZuaZey/3+4bgOMzAXrwcRFylIPVQdEJN3mvJU6OWNmmK2N1PtpyKbWvJ1i4kldJUoN13xUCE+w6gLvuD5oGhvoRpc1BTW48jYQ9OetR2++moRyXCJD7f2yyiluxUrHTmIrjbHv3Btw52p3lVKeeYr3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qpK1GxTp; arc=fail smtp.client-ip=52.101.84.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qpK1GxTp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S47E6I9piv0y+Cvgd4CFjnKVGJP23A2tNPxkgBNSECyY9aHdScZJt4hA3XlunNDIHhrrBwrNAIaE5oidNO3yGNB70lyo1nAp+ssdSk3BMmGvobjGd8DGfv91lwJtdV+M2R+kzJTsQICfe4DzWoZFRKv81PWper7JOgTwMrr0s2aLwgfZb/sXAyr2/IGlmNhljw9oXVgADS/rwTQyzRX5p7O8O4hk5BjnWprYAhiwQy/Uf4UmTFfK1xotj2rfk+8GszNSJEfnfO4bhWSnm83W5QmiKfUVxtulwCcdtdkOui+FTeI3pxNIv5uAwsuhV75atarQ/+id0liZ42DpG9fHzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjW0aN73Wmx3W92aDzD54SahCB7G7pe7DMHTDo+D7Co=;
 b=hXK1VBGaoZoiwdH/UTGvTyaNC1yWLowuavwSbSKLBfN0eYgObcALT34RbXgVkVtwRySAOI1FYKJVLNgTCxrm8amMtkhb5TTNJETZ1Vx8J0VZ4bjasYDEszFCwS3tATaWpjuis+R7zd5WQTU3hiVFWzDXW9k8EbPumI9p83q/XSpTLpCPoMDINDIW7GJQUf004VUTjmGTkaDIRhSABIuZFp9muoetA/BAsz/+Sdal6+x0IpurLtgs5sIpLTTn29gy3AiRr4PUu9TkELjBYgLI2KA0GUj+JLIlJ3tALqwsIgBN/7CLEQJ+h7Lk1cD4uxoAonmXkIdy6BSm6NQfhqFzWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjW0aN73Wmx3W92aDzD54SahCB7G7pe7DMHTDo+D7Co=;
 b=qpK1GxTpETIfbCr5CZHhigWY7PiSaujrCU9Fxo7wkUitZ7H9PsCHCt7VaTyaFFqbXHHiUSfG2ycbzLuPg3vLGyPuA/kFT4JVI08YpGKDPtNxc22X1bqeP3f1jwEOUrSFYGXysD7y7xlYw7SQbklLDbKFxXzDwdgBRlDSq0dvhNE4k4Sa1y+jmbzTZcN48qPLC9KRUgI9kel+j/+Wu61LUdh17wmOKgWxMa7SCsP9woC2iLrCwKbmIKKx8UiskK2USGkRAiQQft6LSPy7yBXGRlgb4GWVbvGLw2Nrp4hx4yKgfLB6rWRENSrbKHet/kqZi76ejZoEC/a5N+4tR/J9mQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA2PR04MB10412.eurprd04.prod.outlook.com (2603:10a6:102:41d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 16:58:17 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 16:58:17 +0000
Date: Thu, 30 Jul 2026 12:58:07 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] remoteproc: imx_rpoc: fix carveout name parsing
Message-ID: <amuCn7IRqoKJbPfy@lizhi-Precision-Tower-5810>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
 <20260730163412.1145-3-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730163412.1145-3-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: PH8P221CA0039.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA2PR04MB10412:EE_
X-MS-Office365-Filtering-Correlation-Id: b7e905db-7f9c-418c-95a4-08deee5bc012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|19092799006|22082099003|18002099003|5023799004|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	EzGIGKm6lU63N3XdliRCVyh7iN5Lqp05okiaKqOIWuw23NQAEbfGte+vrQof2O4W00qlucL5QUmMPrHaxUlMfONzwbDIRB4o0ymp+E0G0TJ3FZkF4BNNX70yI2gDCP9Zio91ADU1Tq8N38haDj0XaS6s5/QBK1gkt2SmWLb5Bez+cFvFQ85cT6UgNkzjbeXyMe0n8JfpiAISFJa8U4lpBJ1t+QX2COqPec7gQiIHgYcCQ4EMT4tdtgFHRcKHLwcQsXxh9At6JvLC7WO44YVc/X0Us7Ui2fgZo6QRSSj2eUNGD0NQFIP/WgXA15CCAOQ1m8T6kRTbKC1JUHX7lc3RWLlnqevKX6oTc1a4UiNDMp89PtBjZJsVqXOAuxzSG0jSqzBR8k5FzwZYRRWPf7pVdEOBxeonV36xQ7DlKWlUZGyjJpVDmXoZBnjn9kds+L/gO0RvQGW+PYi4SsMszptCa4hYVKqfnykphSD8Imdy6oJP/9ofIlpIxQYdSsyMXujKfjsiORhIKDSi8YRwYL+d0StCAi/h3N43SrSmxRtsiRvNTTVLcE7hrHHF2svkYTCENc0pCWFiGod6CrPiN1DPAzeR2HuGL/969jHtMgGXR9gGwGn5mR2/P/tKKw37t3cGrkEA7qugm/fToaNzW2FkqV+gSiOwrzrqhQAwPXeJZcA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(19092799006)(22082099003)(18002099003)(5023799004)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o3fb0monHhQJuyS10qLMZA/fMO5dsecuUbqeFlgJZeE3iSrHUOsXy9KLFlU9?=
 =?us-ascii?Q?ZbAqC9AG7WanX+cpQ3tqPhKNb/WnynQPi3hSG4gbNyl81daumtqc5fWFnUgS?=
 =?us-ascii?Q?yqQLNy7vqHuIo4joTA5zcan1GfCF2ELTI2dQJTi0o6If0bBLO8HiZju+XdQ3?=
 =?us-ascii?Q?olvpdxf+zReynNvQt24I6SMj/bHMCZmjYvYpom3kbxJOeeqCMqbDciIL0/Uh?=
 =?us-ascii?Q?kguHvsahpnER9VTL8wDgdFx+AmOC3DgOqdIW0X4k8qun5f00zYg4Nxti2nac?=
 =?us-ascii?Q?I6OM7P5qLjHCg8iqjweJ9SgXeczvjT6FdN4LhnEh33q4T1suJqr/jc6gTruk?=
 =?us-ascii?Q?FADXgwbnfevXC27fvYl1VEvJXiq+Y5teFbtm+kEndMxUAJ5hrWWocv9PeufT?=
 =?us-ascii?Q?l2V7sg2D5oMaIcLFmnyv4XKIY3n55D+B9CoCjV38NhzxdPgZNQ1Qzkwfgx5T?=
 =?us-ascii?Q?UhUlV8OpzbLRwDaqrUdbWSkngU77KR9c9GAVOHRbhZt4LVlo7TCT5jNuztXI?=
 =?us-ascii?Q?cXgOMLQEMnAUKZkjsMk2n8xZxzixXP9SHgyByfkiH1xDkz6H1JPuPaPW6wF8?=
 =?us-ascii?Q?T3UZc7H+Tj0dfQV6YQbHnJWNoP9xrVWxHDnctALdR26pZkGkYXFcJ0+smC31?=
 =?us-ascii?Q?v13P6fpy7gugiUH8PLJEQEa7+LKfGOVb11izMcziahHU1xLyZVH4ac4/Dkt9?=
 =?us-ascii?Q?zU+TyWjiwyiYJsDvsnfxXK2ihJcGNdR72mBKFVHPKwgXHw2goAmGprKAGRHq?=
 =?us-ascii?Q?5XxYQ+iUQW0LAL+a2rGscUzZY56DavII+jAsXCnZIsLw1PWGjN2kTj60aadK?=
 =?us-ascii?Q?pnhe+aicmS+iYgNH9lwQf4uOCgfLM/zBI1MiMZhR0j5A7WmC476BQu+64JTi?=
 =?us-ascii?Q?xb6R65FqE0jCMvotzCGp/ajtDLBUsuTtn5aUSmgRrA7UALomL+UY4LNMBJP8?=
 =?us-ascii?Q?YiK/Nhh4t9IT0pPX1AYIYC7ijoYiQX5x9tBYNZIyGSqUbIWEvtMorHpMDk8u?=
 =?us-ascii?Q?pAkQZpoWVXdobADRdCRCa7wRbk3NBo5uUWb0DHrnB56Umob3VZ5A+gtpUeAQ?=
 =?us-ascii?Q?bGjTcndudSdB4/73m9bf8NwgNO97VuRYP6DEJ530SVAiaS1MIQEHJWBjjMn1?=
 =?us-ascii?Q?DEu0f4GwDuzzE8QjWvdjYn11xoK1VQ5ZDUeW9jsI0VmikAYA3Qvqz242/SUX?=
 =?us-ascii?Q?KM67WuJayZW1CUD4ljAkG8x3o0WaNxWRlftMe97uZGS9bUw0dOos0RvaF6MJ?=
 =?us-ascii?Q?yK5uUumB6qRuPcvzdavHTJchly82mW6w/uOfPqqwWkfFzPynzptZNLQwA+hs?=
 =?us-ascii?Q?g0kbS+yxVmIlCeRvS7SZiTPku3pFWnmWqoFjNo1w7fuYaf9ks59cuc/g8xRg?=
 =?us-ascii?Q?elYxQFJevmuHfTxaSyOCajnE/hUVWkn8gKSJ9nOk7IRN/SBBGsrlgLEJkhrU?=
 =?us-ascii?Q?xW035qU2FrdexrH/v1+xRwzN643gSQqOlWSyGExoveTNJrDKhOzubVZ+Oo2J?=
 =?us-ascii?Q?oPT1wsCzagdzEAem58HKHu9YPeWhAjKmtGq/Gnl9GWhjcnsMUOLAJhwkwQKW?=
 =?us-ascii?Q?zY8L55fGqt4nqVBg6cmxtBksvY4aKks3SNXXIGwUlMMI3dTE/O+aPxxgVMJO?=
 =?us-ascii?Q?6nO6VSxPLNLkL0S7PMV77xz8Spv/cf8zPfgGkx+VkB1hqU+Vb38TwqRv6oYh?=
 =?us-ascii?Q?bWxHhme+pehIyHMXDjOxhpNrcE1sbJI2taJUmoxXog1a5mbyeZRcQQOt2Acm?=
 =?us-ascii?Q?63/4QurrvOmOugK/ML9uDxOynMfJETCj02JKlmfCgy/MDEfe0xtv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7e905db-7f9c-418c-95a4-08deee5bc012
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 16:58:17.0706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t5DAxs+vRZ2N0P8bOXA2SFDewLyKyDM9oW201Oq9DVIkW2FRadDycH+qk61qfNvu+XO8JPI0OyQuUp9NGZyr5vRI0lI/MXYSaZrTjL0bOyHBgH8E501TIEgdD6h7CgJx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10412

On Thu, Jul 30, 2026 at 09:34:10AM -0700, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> The imx remoteproc driver assumes that the names of the reserved memory
> regions reflect their usage (e.g. "vdevbuffer", "vdev0vring0", etc.). This
> conflicts with the devicetree specification's recommendation, which states
> that the names of the devicetree nodes should be generic.

This relies on a hidden ABI by parsing the remote node's name, and also
bypasses the DT binding check since there is no way to restrict the node
name of a memory region.

Frank
>
> Therefore, instead of relying on the node names, use the names passed via
> the "memory-region-names" property if present. Otherwise, keep the old
> behavior.
>
> The definition of imx_rproc_rmem_to_resource() is added to a common place
> as imx_dsp_rproc.c can also use it given that it suffers from the same
> aforementioned problem.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 13 +++++++++++--
>  drivers/remoteproc/imx_rproc.h | 21 +++++++++++++++++++++
>  2 files changed, 32 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 745ce52cd822..ce9bdfc1fa98 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -643,7 +643,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  		int err;
>  		struct resource res;
>
> -		err = of_reserved_mem_region_to_resource(np, i++, &res);
> +		err = imx_rproc_rmem_to_resource(np, i++, &res);
>  		if (err)
>  			break;
>
> @@ -818,11 +818,20 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  	if (nph <= 0)
>  		return 0;
>
> +	if (!of_property_present(np, "memory-region-names")) {
> +		dev_warn(dev, "using node names for carveouts should be avoided\n");
> +	} else {
> +		if (nph != of_property_count_strings(np, "memory-region-names")) {
> +			dev_err(dev, "invalid reserved memory name count\n");
> +			return -EINVAL;
> +		}
> +	}
> +
>  	/* remap optional addresses */
>  	for (a = 0; a < nph; a++) {
>  		struct resource res;
>
> -		err = of_reserved_mem_region_to_resource(np, a, &res);
> +		err = imx_rproc_rmem_to_resource(np, a, &res);
>  		if (err) {
>  			dev_err(dev, "unable to resolve memory region\n");
>  			return err;
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index 0d7d48352a10..3632bc375c71 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -7,6 +7,8 @@
>  #ifndef _IMX_RPROC_H
>  #define _IMX_RPROC_H
>
> +#include <linux/of_reserved_mem.h>
> +
>  /* address translation table */
>  struct imx_rproc_att {
>  	u32 da;	/* device address (From Cortex M4 view)*/
> @@ -45,4 +47,23 @@ struct imx_rproc_dcfg {
>  	u32				reset_vector_mask;
>  };
>
> +static inline int imx_rproc_rmem_to_resource(struct device_node *np,
> +					     int index,
> +					     struct resource *res)
> +{
> +	int ret;
> +
> +	ret = of_reserved_mem_region_to_resource(np, index, res);
> +	if (ret)
> +		return ret;
> +
> +	/* "memory-region-names" is optional */
> +	ret = of_property_read_string_index(np, "memory-region-names",
> +					    index, &res->name);
> +	if (ret == -EINVAL)
> +		return 0;
> +
> +	return ret;
> +}
> +
>  #endif /* _IMX_RPROC_H */
> --
> 2.53.0
>
