Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010024.outbound.protection.outlook.com [52.101.69.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB0F26A09B;
	Thu, 18 Dec 2025 05:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766037256; cv=fail; b=tyNdW+LXUNUxYZYKJNtMpWGTd1cuW/zAIEqSIavKTxqmGhWvDLKStq3WJ5TWr0zOJFstSBvKY24d4R+U7TnETEhfEbLPw2WxHPcbw7Qdz8WQkhtnYDH6T4YZDmMBKh0ezCaCqc/jMmW5PQcraIAWL+1MaWh4+HCGNd9fTYSNgE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766037256; c=relaxed/simple;
	bh=2Z1gnl2jrWRhUly3+oLfH4rOnXo1Utc5QWsXubs/c5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f12qFFuPsscWSe7qRtbOFuHf7XbHyyxHe5FhaKWCBAzXG7XCoQmvgAUlpDAEXPPI/GVRWsT0DtMsFGwYNjibt8gVFoz2zPap6euBvNGcON+rvnZ9AoLvGW6rkg0AgjF2WV1oP42IA+CGdsErucJz2hR+yrVTzy7XOAsAKtZDaSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kRuOuvaj; arc=fail smtp.client-ip=52.101.69.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kRuOuvaj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHgNK6jLUcy6X5MpBHQeYbPx0b7Yp1SPRhJLeX2rBWLMamfvJRyHIzOq3qa8bniLhxsfxGxWovWfxQOSW8Xc8qntjlz7LwHcq++tBgWUyVzJMC73I5AGlKagozlQOUTcjnJd/3CokVmZJWf8GgmnxiHuMuuXA+SWZuydXtKf11+GgpW5tT5/TjWbB5mkeu5644hgwV8qg1GhZueaR/s5M5Dh/VkPNCYBvpaxKOFTSYLJqGpT2TiRUJA2/oJmsrameR/nzuLFz8YWud+fOTdmZNwI83mLe9rsA6Um/Xdy8O3B5q/0LMprr+BmMdEvhEcJSv5zG8a5B3TbqxYN/5Dfqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRWADJtCIPH8e8R0y8BiIR9UAWXtqPnRf4l6ZOK1pSo=;
 b=vupy5HnMaorYnQVYfUTj2TBK4rIjD/6eEE0b5g1ovgbvKRJxOhgN+W2RUsU/MRyKEPmVuJivECnjQzGJF7Yjj7s56kIoh7PXhr5cMj7VtYYYVV3O8ZZtucKHaWi63ID8+iuqcv2ceYtOEaEG0pDlPnSRnIkACcYsqNx6TDljhKcmTaTiBYwuhnmwLBcbioJr4f87Hbxu5ZShb3JC7JnoAvLw6FnR6NJpZYBqb4W769au951TswfUB4KQcO7ycoqd+hBLQUJD7gzInXGOCXe0z1o0a5IMIbIiuNyU1F40OV58g35o0158o0GC6C3pUtJKx+iFEYCPu+/REUvOowc/Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRWADJtCIPH8e8R0y8BiIR9UAWXtqPnRf4l6ZOK1pSo=;
 b=kRuOuvaj8sHoLaA3kB0GF755dmP8llhSSS73qNgDyidSgStY9TrOHrT2gKU7sMMZGcpxRClFr+aQVx94pQ2ADG+glCD9Lb0qiPylmHWCQ6UJwwDPdbdOAVCXgZJTZrE2SZumpT8lCqi4TLETa1LVbYJzxJbkDCFuWaQ0VrHgsy2+07rr9zSDY9Wk7Z/6kn1fnWQuEdcG+sG7ES5OfM4k69sdu5E2TwzsFwJE1RE4VlSE2r/s8w1cQtGFJjUj/1YFfVexE13Cpu9Af/JHvxK+Kwo3T0tChL7xiY2CfDfl2k503SlTO+fJlChNlLecvpj6mtEMp5aKiHBIZfLiKXnUQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by PAXPR04MB8320.eurprd04.prod.outlook.com (2603:10a6:102:1cf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 05:21:19 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 05:21:19 +0000
Date: Thu, 18 Dec 2025 13:22:30 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 4/5] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <aUOPloYtbZHCV6iw@shlinux89>
References: <20251216-imx95-rproc-2025-12-15-v4-0-bf1064ea8daf@nxp.com>
 <20251216-imx95-rproc-2025-12-15-v4-4-bf1064ea8daf@nxp.com>
 <aUM6aGbSH9ICOL5f@p14s>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUM6aGbSH9ICOL5f@p14s>
X-ClientProxiedBy: SI2P153CA0036.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::11) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|PAXPR04MB8320:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f2d426f-7f62-4600-507a-08de3df5465c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BwGWqc64wJ/cNfhhlOaj6ILZvKk8BTZb16IEvrdDZuiiYGQMD1KvWHhb8MRz?=
 =?us-ascii?Q?6E7Qi2Y54WQxGAfbmz0UT6TOQ95AlvrawrbR8m5udsXIi6URgH1Ap1U0JaEB?=
 =?us-ascii?Q?zqomZ/jfCQJxnKEAMHgbIc2MtpQbApBRwy3TgjrOC/GF1ssS7zclSpEqqd+A?=
 =?us-ascii?Q?wfuq9FaHB+GruBPgQJHaSghDxbGDlmFKOcymVGSOBIClwXSyy4zmOgwp7Pf5?=
 =?us-ascii?Q?5QffhRQudVvtskylsvrM+V7ZqhmTO8BBakrEHFlnuTtB7a6H/26yzarqX86I?=
 =?us-ascii?Q?y2DrH0IEDR1lLypx5K2VJbdrprXaWkBVONx47X4/idleuyR3Cgo/DeI/2HXX?=
 =?us-ascii?Q?w03JED8N5HjhG/5i1MAG3sIcMDuSHHDVclkQ9sP9x9J4qAmJGt35thH1kX7x?=
 =?us-ascii?Q?ZX8I3HiF7NtiPrn305Id98IKmFh14NaxnTThfjhrK9ljkC16yJT1lQGOsIgI?=
 =?us-ascii?Q?3ZHEnzZYBm/mOHApv/ZI0yQfSxdbfe48xpMc+KXLhshH5aXJJMzhp9QqZsgS?=
 =?us-ascii?Q?7IdGMRbk3JDP1S+/EOuSJjwuEps/BJzJUljX4VFCdivVvn1vHtdYl3khr2EC?=
 =?us-ascii?Q?QU+d02H6V+D5DVeqH1qYFpgx52Oo0vuxZGMlX5/O2MvcPZ+ItY11LEnkwbjL?=
 =?us-ascii?Q?hZ8vcLVHE49Sf+Y9w3vOZLhu9YKvazVT/xmqZCIhtjQE2OPtx6Nl/W7+LqSu?=
 =?us-ascii?Q?KI7EfkFDWK0Xa4UNj61PP2/TsqwAUWI8zeaf9OG8HNQ0OnoZXhlr8nfOmd1p?=
 =?us-ascii?Q?b6nOoLuPyL6fAOshB+lNkDbxLl9UxppF9OvAl/6v+1YaFfCM8g09ymJwcsga?=
 =?us-ascii?Q?jQd8qqcSn0eEJ8IkyiDS7MsCOPKiqMVqr0lttQ4jD44NUHrxphfnFPz98NXB?=
 =?us-ascii?Q?LIKtDHeTcSerojDlNPnpMLh+JyJS4L2U24U+pM1k3266diRqv9Am5jxtnVOU?=
 =?us-ascii?Q?XcTAvpYMRkHh5uTTKPjHvN/ka2tjif6h6VBFqGiyAD2z8gdTRI6hJgxLrvGu?=
 =?us-ascii?Q?dmAowUaGS7I5cZnVP9niI0EMi2v/udPmcrypz4aEK6Bfc1uta81RfOs5lW9Q?=
 =?us-ascii?Q?6wfZ4JguCrxurPlA0u7vGgmMr8kfS1ZHo1u0MHUDpRhAKZtD4cXqRxdzSga7?=
 =?us-ascii?Q?p9tXc9UAUciSQo1FAMMnTcWWAq7zH2Fa9ZvxV2avvdwaW6Fv+oa9tPOR3ZtP?=
 =?us-ascii?Q?p+BdZ6LuSSrJLydY7nFviwsJy0XYwgEKrRer1keBSrgA0XMN8n7MO1G5bMzI?=
 =?us-ascii?Q?tK6GIMfmJVE/V9eMndxfOOa99+6KNZdQ2qNIIi+zowmWqDE3K3MOwNDDvJx1?=
 =?us-ascii?Q?I5Xn0ZQG+I0o8taD0MrYPMySaqdp9UpkG/lbJ85RvM9FQg/QCbV0Vx9qjcpq?=
 =?us-ascii?Q?lzd/nyQ4/Pk9nQ/b9xTqoI5uH2DqihkQ//TdJQymthw9xJTpUgk9vUFHCpJK?=
 =?us-ascii?Q?TiCh33i6APrgxW8WWFPtW+Gi5YwCYA2ZhjszapB4pwUfWAp6V0wsGoI6Nwn7?=
 =?us-ascii?Q?MTLL52LiPEaPiFUr8zdJIVzYhBCZRQX20YSw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?odHBEefipvPE24H/zC5m3UPSkFx27Yssy/CduNVAYB6TAQm0Fq8qAfCbFjEv?=
 =?us-ascii?Q?lC/zymGIHihqcuRlMbM/+M9jnm3I6I7fCazjxQQB4KYur95qQyBzY9hbPFZS?=
 =?us-ascii?Q?MeG8naJKuwa2ed64uMk73eRdw3/LQNONHu01ZgzPfZhNdStcO9zJeEKLJmy9?=
 =?us-ascii?Q?KE1n4ucV8Mx4LIpteYQOCkEp9iFhQjfQGJIy+lsfZP7PsD8Cka8LrRPTZ3MJ?=
 =?us-ascii?Q?ViVuDl803scJY3wf0tQ0CioTdNydRSIuvnTRyI8IMvQCI4PViLy72o/6dxWk?=
 =?us-ascii?Q?O6V4oa6POPfvFjzlYjU24cnRnJF8gtliIH8Ty+26mvlL9yA1X4NX7d8AsqgL?=
 =?us-ascii?Q?ay3b8KZPaGbUcd26PK9rIp1BUtCsl6zpDM3JnOSM4V/Cu+3AyddfJCkkweDh?=
 =?us-ascii?Q?hT2BrlGlZ1l01dn5OMlI9jlfxYWQiqCxFpNUNEsZiVVXE094UyhOfxjZJ1Oi?=
 =?us-ascii?Q?Vq6gw9cn0oA5tH/LhYPK4/HbDSgqg9kfaxnepk1GuWN/AmlEf50u2bWs5IFp?=
 =?us-ascii?Q?pE/NZnD2KHFgFnXI05/mgOMqIuBh7Z0dLb3NJ+t+1ovZ7fk1uLwLQXGXHEJ2?=
 =?us-ascii?Q?ykCA0DQv8IlPXZ4eKKad+inEY9D9j9br/WbEVg+ucsZwfD1BqSXL7qBVbzOn?=
 =?us-ascii?Q?WP8cP1D8YmD0Yo/lWV/vCtFFe8wLGu4aUa8P0vpYfSQ7VFCuMqFCd4SKnBtp?=
 =?us-ascii?Q?1Ga3Ghfrhsfj+Wu5QKBn9ikGu703uHagdd/0aje3jZDx5S48l0asqEu8MW+L?=
 =?us-ascii?Q?iRNrI+JxU4VkVz5L+3w+7HSqzHZuAsM0CfHFk5hreZcuRrN7KrqleZgSDCJK?=
 =?us-ascii?Q?5ZSlODZS3V1AMSZAH5apGmgURca3USUDYcdDUqCrJu4NPULU3gH7Y+0+wmDi?=
 =?us-ascii?Q?Z4DPHiSRxfGETPyuBWI4k/33yTr8xQSgDPx7iI54j+tZHjDqmpwXbJX2rOdB?=
 =?us-ascii?Q?q2gt6daBCFc3hoD/CY7waNk9mQBpUF/PfRkMJpMMri7eJx3eGvvNfrByAWiR?=
 =?us-ascii?Q?WYqB7hwtUk1K9zIBdmNI+Sxtt9BiBMMsIVwNPFWeekrRYoLSELMe3bPBbsxW?=
 =?us-ascii?Q?pOBXFpZfwwZLM+0wXJ7gvnk3mCiz3TeM5eGTWd3VTyna/sLjUoy9gRSgCEXB?=
 =?us-ascii?Q?w0ec4WJndUX8DelNVwf8WnCtxyurB5Uy/A1Jo2//5awQY78DnRONwxqDao1z?=
 =?us-ascii?Q?vYZSdIgfQKK5BieIQoD1AIlX9T1HhnMYo0brjl8aLgAkABo+Qg96xw99EFy9?=
 =?us-ascii?Q?mbdwlyqjERV5pk+H+GXmjv2Twg6r4eEjwWpBLd63MfD1ay/af+Y9g8vv1PBR?=
 =?us-ascii?Q?c96bfuf/RSi/g9JF1DGB4qqye9ybe0ja+pNGVJkhISvyyrLpDJH9GuZJ+JmJ?=
 =?us-ascii?Q?3VbCA0YTcChyrtad0M3njBx7LYS9kJ/fPgugT1GXsDLJ0c++KlPYzvjpEGLT?=
 =?us-ascii?Q?OfKxNq/xVcrrf6G9Hl2BfzNXaIbP0VqIsgC9K+yCYSTGbkRthpjOcn8DLN/P?=
 =?us-ascii?Q?30ZZeGsAyE8noq6buTSUaO7rOY6Rlms3MiJrY0kcLaSp0YzbZuOrfDCd+lDu?=
 =?us-ascii?Q?Z6u6kRxjZfJa+ExvvmMahXnClomR7gRCP1Ar8W3L?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f2d426f-7f62-4600-507a-08de3df5465c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 05:21:19.3455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yMyyeKVe/wlxAfvJ6twSLkWfnpplWX3YNQlZdH82ZFkLiLHCBE9XVVX/oM5l4jW9lJZdWo7yiYjttzjM1RQLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8320

Hi Mathieu,
On Wed, Dec 17, 2025 at 04:19:04PM -0700, Mathieu Poirier wrote:
>On Tue, Dec 16, 2025 at 09:51:02AM +0800, Peng Fan (OSS) wrote:
>
>Why are these not at the bottom of the file with the rest of the
>imx_rproc_plat_ops?  That way you wouldn't have to declare
>imx_rproc_sm_detect_mode() at the top of the file...
>
>> +
>> +static int imx_rproc_sm_lmm_check(struct rproc *rproc, bool started)
>> +	if (ret) {
>> +		priv->flags &= ~IMX_RPROC_FLAGS_SM_LMM_AVAIL;
>> +		dev_err(dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
>> +		return ret;
>> +	}
>
>If you move this call to scmi_imx_lmm_operation() (and the error check) before
>setting priv->flags, you won't have to reset it in the error path.
>
>Let's see how the next revision goes...

Thanks for the review.

V5 has been sent out just now with both comments addressed:
- Moved the SM LMM functions to the bottom of the file with the
  rest of imx_rproc_plat_ops
- Moved the scmi_imx_lmm_operation() call before setting priv->flags
  to simplify error handling

Thanks,
Peng

>
>Thanks,
>Mathieu
>
>> +
>> +	return 0;
>> +}
>> +
>> +static int imx_rproc_sm_detect_mode(struct rproc *rproc)
>> +{
>> +	struct imx_rproc *priv = rproc->priv;
>> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>> +	struct device *dev = priv->dev;
>> +	struct scmi_imx_lmm_info info;
>> +	bool started = false;
>> +	int ret;
>> +
>> +	ret = scmi_imx_cpu_started(dcfg->cpuid, &started);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to detect cpu(%d) status: %d\n", dcfg->cpuid, ret);
>> +		return ret;
>> +	}
>> +
>> +	if (started)
>> +		priv->rproc->state = RPROC_DETACHED;
>> +
>> +	/* Get current Linux Logical Machine ID */
>> +	ret = scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to get current LMM ID err: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	/*
>> +	 * Check whether rproc is in the same LM as host core(running Linux)
>> +	 * If yes, use CPU protocol API to manage rproc.
>> +	 * If no, use Logical Machine API to manage rproc.
>> +	 */
>> +	if (dcfg->lmid == info.lmid) {
>> +		priv->ops = &imx_rproc_ops_sm_cpu;
>> +		dev_info(dev, "Using CPU Protocol OPS\n");
>> +		return 0;
>> +	}
>> +
>> +	priv->ops = &imx_rproc_ops_sm_lmm;
>> +	dev_info(dev, "Using LMM Protocol OPS\n");
>> +
>> +	return imx_rproc_sm_lmm_check(rproc, started);
>> +}
>> +
>>  static int imx_rproc_detect_mode(struct imx_rproc *priv)
>>  {
>>  	/*
>> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
>> index 37417568a0ade2ae4d6a4e3d0f139ea52b185254..d37e6f90548cec727b4aeb874680b42af85bdbb4 100644
>> --- a/drivers/remoteproc/imx_rproc.h
>> +++ b/drivers/remoteproc/imx_rproc.h
>> @@ -38,6 +38,9 @@ struct imx_rproc_dcfg {
>>  	size_t				att_size;
>>  	u32				flags;
>>  	const struct imx_rproc_plat_ops	*ops;
>> +	/* For System Manager(SM) based SoCs */
>> +	u32				cpuid; /* ID of the remote core */
>> +	u32				lmid;  /* ID of the Logcial Machine */
>>  };
>>  
>>  #endif /* _IMX_RPROC_H */
>> 
>> -- 
>> 2.37.1
>> 
