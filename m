Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013029.outbound.protection.outlook.com [40.107.159.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C5024BBF4;
	Wed, 29 Oct 2025 02:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761705605; cv=fail; b=jXKbU++tpuyYCx+NZLU7cJxbotlnGN+6uv4pNmBNnyBWuA2PlB3ycNPfAB1iOlrfEoPmCCcIlZcIwt9jC8HisXwK6nBzjcH4pbIQXRmUq3JqNChooe9XVnxFaHSpY2JLG4++AhDaMd160pImCrZOG3xiNuRdZHtPAUwrwLeVKr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761705605; c=relaxed/simple;
	bh=K8GrQh4HaMHU9XJs2rLtUQ0PmQhbU1L9H4pewmlg8cI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LIrpCjhl8RyxPd9UGnmBPi3QOOCU3gQhLLwdI9Y57bexZwaMOzbQWJAguxA9OY+ojPOBQFuFsOVQhqlSvFcMbniLr1XY7b1BfYGWywzQCBFHj7+sUUHluGv9D7N6fNZqQB0J2qndBXi+5Q0MYwOS77zeCCsGzrrcm0opO0UZ9dw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eDmJumEQ; arc=fail smtp.client-ip=40.107.159.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eDmJumEQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFxJPNMnTXlLlrYkPiHgDCY9nTrVqL/hsB4Q+ICyb78zyUsXbEA8HCbqtekSvlDbRH4umeEu7yY+1Bga1Q+2wfVC4oEj7KBrH1dT9Efrj9aMyGSlSIg8MyxGI3XwGaFING6PrAV3YGEBP0mhUZZkeDkq5XWeKJEZLqA5zts1tCw/Myx7Dn2RprchTh+ryRDy4Xk0bFtOAQcNaZnDLmJqvBvjmTiShsv+Wd7gkJ8hZl1fgsI9qMcb4gP+6j0PShJ3ga5mPU3gIm85H9iZA4Vfx3DdPSBjTy+V5d5JT4TJtzJGz6yxUdIjz/Jvto5sQecOf1oP3q22FbjeTBZZkcW/bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlCPBzYsq+pknKgQ9HE85GjYOETHfPJCU/JX+aBt6Fs=;
 b=iO9bcCc6hwW/Sx0qXf/sZPy8ImKCqLZ04MylUexuLdzTDJjYCZPeHW2h6RSl/DhW7AXKCiCvI2fXwcNoUYKyX77xPtjrDKG4MGMZqE9togcbQlTrVL4GtpEe56GWlYLrIDOwPY0G48Iz2tirLHlyRaXcdYMhpqEkpWo8KWw3b2oHpDG6Vt4P3CGmtIxUiwNER6KDopj8fTgWVzCUWMlZFEmGaQQ9YjmONrkhtaGCtheqVk8qfq9Q1+Jo4elOdrLl2QZMx+BFiJEg6wS1ErgU92VepBFKNFBVjLUqAi309+JSuBZ+b68qqlxLQAeCFMeO0yCRilcHoBAb97m2uBYT6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlCPBzYsq+pknKgQ9HE85GjYOETHfPJCU/JX+aBt6Fs=;
 b=eDmJumEQoU2+H6G3Silh5two2E/x1MTTrHRGhvlQ2b64W0B4xjy6jy95q4MhLUG26rBUxG8XMUOCzjj0DpYUzORaDLHqclSnPhWEiUMFZrT2R6SX5IcU0IF2eILuxlXBLB5rLWU3Eb28XnEoPIfClU8uZmcPXkhwN8so0arFFVgDY1zYZu6XJTgS3JUh4Nu/Hdd9xuN2qVLBrbafIbNGAqcyOHWb5NrHgPj43xB7mwkXDdDqGEjvlzE1EvduKxC+Ei2FsVfsd2dx2QO6DuR58LMp3jsETEH2ByHPXWfwhRrY9ujsnFomIxI7eZ6zHOSfi21xOGaMLDvGYYom4vww2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8159.eurprd04.prod.outlook.com (2603:10a6:102:1c1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.20; Wed, 29 Oct
 2025 02:39:57 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9253.018; Wed, 29 Oct 2025
 02:39:57 +0000
Date: Wed, 29 Oct 2025 11:52:21 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <20251029035221.GB7297@nxa18884-linux.ap.freescale.net>
References: <20251028-imx95-rproc-2025-10-28-v1-0-ce9e7db9edcb@nxp.com>
 <20251028-imx95-rproc-2025-10-28-v1-3-ce9e7db9edcb@nxp.com>
 <aQDseAYDhvZ01NI8@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQDseAYDhvZ01NI8@lizhi-Precision-Tower-5810>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8159:EE_
X-MS-Office365-Filtering-Correlation-Id: 51412a43-c085-410c-2e85-08de169472e3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|19092799006|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bLsTNH3A3ZOrLXOTbR/hMJkf9bDKKxc2YRUHeH1PjNx3yj+HMTSoP9+jH/1r?=
 =?us-ascii?Q?wpsI2gG4jg0kpeWlbu5FuaSbTdoyfVvY+0hcRkhqZ+C9oaU1Hy2f+qliqJ56?=
 =?us-ascii?Q?zmFsssshfaN6K4jKKblShsJ3n4zRzvXMj9pRGK6pkm79+bO4os9eTfKZkbOw?=
 =?us-ascii?Q?0wuoJRZ1aZG2d2yhDgvXzF/NOdc/vEbgUyzuUphsi5I4GSHBtxhDsOXkcylm?=
 =?us-ascii?Q?xkH6daDr0UH0sYDWZ+Incz01EW2UQ9KtLW4SLdO2Qylxg1FTn9OX2U1I4/KV?=
 =?us-ascii?Q?IgC6fdD88yhw9/nN27wMlqzeH8r8mStmky+RKNH+ziiQacpZEK1Z3d2X2Agz?=
 =?us-ascii?Q?dIEw9zSNqmKe8IVU13rjNzo4A+YTqPo1plf+NGYdf04d5Xa561rvUKJ9sxJp?=
 =?us-ascii?Q?4H3MxxqoOypOwqv0ihHI+f3yad83VUj8b+j0fPeGvqTGgDJvhc+aGIbjG1J+?=
 =?us-ascii?Q?wVOYS5KR1wScGcvKts1FYkEmrnPnkBW5dnlImFW+buRsdpagWxqQA7+u7uWb?=
 =?us-ascii?Q?3nv+FeXwMshJh+4+lTzbUxIaURosguuZi2HuCNJYY2fRoacjuirCt2qaofMg?=
 =?us-ascii?Q?9A4er9KESeznYt/kc6XaLYJRT2aO/AKN0y+ZuK1kD1Xou+XvGnSn7AGxbocf?=
 =?us-ascii?Q?6SCV9xQXQ/uN+tz7aIcTkxfH9CRkNmAK0+xVtZRNtbET+2SsPnCdi93IJ6j5?=
 =?us-ascii?Q?Na19cwQFskYrApyAeZUvkxKjyH/7msAF0VUbzITXZyciTeK/Dutb1trjMw6o?=
 =?us-ascii?Q?lczJ0gt1f0zYdX7awFmYqeoU0mp+YW58penFc+lYsQgZfUMjQA/clJ1a0IZz?=
 =?us-ascii?Q?jLAqJ+9Sg0QOMwxvkwUr8H3cLs0YKnDi3z599zNxG6z/Cw8ZP7eZ6EW2YWKr?=
 =?us-ascii?Q?2k2NROMFsy5auPLAYhIqOo1SAXtMwpeqXwHX2I05G7sM6hJujMoIcEy7CZUD?=
 =?us-ascii?Q?5ss/xAyvQZe2tZEgkIyJ8PN8TKyrkHgYzTA37KnSH61magczWx+cfod5fiJw?=
 =?us-ascii?Q?iU4Yy0IXc+62BkxCUmfaBKxMSxw1Tlpp4y2P6UBaPOlRtwZWEB2kzwlvIrBC?=
 =?us-ascii?Q?XNMFLt15W+Gj9/igbbzpywko93Y/0/zzggaAaVxw0N0qQKhB6WunukLFp0Lw?=
 =?us-ascii?Q?/GAyqIODwsgCpY8mezEen42IgtMX87MYJw/ZbK/c0azdZ1/hvr6+Pmy/2Al9?=
 =?us-ascii?Q?aIzyzwTfi/N3xP/8L1owSUM9lGA9y1isl0pNJB8LYdUop2t71nvFN4nXSD+w?=
 =?us-ascii?Q?DRxF4nWrP2bdN2c6DSULE/nm7oUJHd6Jf/XZZM9GZ8T0XRYFoHAjHaokX0eh?=
 =?us-ascii?Q?p0Id1X98lIrPR4ckISFJjhBrJtTZpj9JdBN4DM7TM/YbA6jGIf7yKp1a3QOV?=
 =?us-ascii?Q?pbXIcSdYY83RXic8xWIkbwqTo4Di4KI8oxHO2dYJLYObt/6eKtDyrNtUqncS?=
 =?us-ascii?Q?pW0uJZRJhsRpyLZjzdgLSNS9DK4HXAN7+DtdGvyHP/UoUnOG+W7tVx8Bo7HL?=
 =?us-ascii?Q?rBJOP1/fD9WvsAi5Vr+OR/g8OvQ9ksfSGUZr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(19092799006)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?odlczR5s3qnxWzD+f5+pzokdMomCF3aMcoaxyjIMo3RLy5L0LnONOHJXJyje?=
 =?us-ascii?Q?Ikz/pCwJtRunugfzZn9CJjGb1KjWpggiNRumXYBFm43yeB+G2RICZhzXA1ih?=
 =?us-ascii?Q?an8Tx1pE2d1qXplpXdY3oDCBbx4tupmC6bYpEg+28m1VUH0JFe4HLi0enrim?=
 =?us-ascii?Q?pwCw1wOXGgOOfHfFQERkOBc29biK/OJh50T/SZin2yOVEOYQQAfNw7UPxnMq?=
 =?us-ascii?Q?tOlwpfW+ceH/1DgrVRG/VWh0fXqsEGZN3FQcCp6DIH34KL4086SVai2WhwmJ?=
 =?us-ascii?Q?8mjalJzbla65vsENYGy4umF2/qlvwCh51FrjcJU2hjpfZEJAdJqgcDc3VWEc?=
 =?us-ascii?Q?ZWB2HU1zbAL1qxjUgv1SoJyRIIBlmtGY5znOOSezwZl9lR6ZHjNysLujT467?=
 =?us-ascii?Q?So0onwGqYBTjtCpXk54TWDcoFDmRMGvIbdTr/FpUJv2y2wk+insI2w5jZdhl?=
 =?us-ascii?Q?1hSiOotCAHOHBJalfklFC20zwQU2EcwCp17Y4d/7kir0bJ2jF//2CTwf28g7?=
 =?us-ascii?Q?j5fynKno99OhBNbz18cmlc12gfH3zoUEb/CHo7ONpWuBY+KhZhxpyHirfmuG?=
 =?us-ascii?Q?jnKnUW8SDtfxfXl6llInNxmgBO5Qp+1eMQ4NBVJoYtBFXgTk/U1luvyJ89Mj?=
 =?us-ascii?Q?K2WBtqxywdLGXBtUfgNg68/ud3TL2XK+bcuXcl3fkTgTtPxhgGLIO8PioIIU?=
 =?us-ascii?Q?g9YXni+fmRYOVMq/aQrvQCd9RhaVTkowNs/p1rh1LDrFkrHw4RgwihsmpXqM?=
 =?us-ascii?Q?RMFWqZHyagg1DDEGyLGlkNnSZjQ8R9ykr1/h9lqguD8unqYYp5BOqcvWeI+T?=
 =?us-ascii?Q?AL7BUitpjo/J8yl8NzDo9+glRopDQ2QQYmKVnbIzBHsYtmNKHlOSjkJHHgT+?=
 =?us-ascii?Q?X11UkaJoINiDrVu4fEPmAEJOYk+2XStgsXKV0RrwE4VUZPXtAy6ywkDYkxLf?=
 =?us-ascii?Q?wCQMjj7ui3T6P339wzXym+ZNQVYIG2oAeEV3xeQktW4lITgj4xWQF0Y1UCuj?=
 =?us-ascii?Q?y1Klpj5IQ6kJKWPL9KxL/2X+MXvMGqE5C48FRjdPNGoZwCi+sus30GWZ0hRi?=
 =?us-ascii?Q?Yd3u1lBh9O3FVYUQX3/ty++Vg4JV4wOqyoXJrFTMLG9aq++Km1YFAeWEFQ60?=
 =?us-ascii?Q?DqCia+BMR1JDhfbIYdQ+bzTganCrsbqGdglFmvmDyR8tEYxRRDTwMjR1Rzqs?=
 =?us-ascii?Q?5ZE6N3OWNXVeB/mJN8VHaRMjAGsYKiS15GpbvykG/zp8gujcRLL5IfiPNQuQ?=
 =?us-ascii?Q?q2ySN4lZmbUQe8gp/WfL/fWuMiQt9SybyjTUVHZlEthg1+wRC/uRGBcXWUd6?=
 =?us-ascii?Q?C7ZiLji6RXTey8vFnkGa/hzqB3m8NsbgZQxXE/pRy2r+ImLAwuKxURp5jwaF?=
 =?us-ascii?Q?al6gnVrPob8RStDlWfh0MrQydGcRYTLe6vg1y1MHRce6pQEwSIQAVIFuFvzB?=
 =?us-ascii?Q?n/t9W6kU8BCXAHKSB0KlziUdb9Mjim6IXeA9M4Kx8o9kS0ZRpVNzbh9arSIL?=
 =?us-ascii?Q?S80Ozk5xrCXrWFt+tmf3MvoPWWJ2yCOW9Ncx+cjOSGp/YI+7rD6jf2UJIHBG?=
 =?us-ascii?Q?eSkBEtrUFD/iNQGKA0iOvX8PhA2g13JDvAceVy1c?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51412a43-c085-410c-2e85-08de169472e3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 02:39:57.4032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmt2ftGMdYxjTz0YH3ODHH2Jx139wqxHSYvAiB0cFXBLrsXr2Ojd7IjTYAgjb0mDNmhYmL9hTOHAcc9dyrrUhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8159

Hi Frank,

On Tue, Oct 28, 2025 at 12:16:56PM -0400, Frank Li wrote:
>On Tue, Oct 28, 2025 at 04:18:03PM +0800, Peng Fan wrote:
>> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
>> one Cortex-M7 core. The System Control Management Interface(SCMI)
>> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
>> Manager(SM) includes vendor extension protocols, Logical Machine
>> Management(LMM) protocol and CPU protocol and etc.
>>
...
>> +	depends on IMX_SCMI_CPU_DRV || !IMX_SCMI_CPU_DRV
>> +	depends on IMX_SCMI_LMM_DRV || !IMX_SCMI_LMM_DRV
>
>what's means IMX_SCMI_LMM_DRV || !IMX_SCMI_LMM_DRV here, which is the same
>config

This is to make sure when IMX_SCMI_CPU_DRV or IMX_SCMI_LMM_DRV is module built,
imx_rproc should also be built as module.

>
>>  	select MAILBOX
>>  	help
...
>> +	 */
>> +	if (priv->flags & IMX_RPROC_FLAGS_SM_CPU_OP)
>> +		return 0;
>
>You already have imx_rproc_sm_lmm_stat[stop](),
>why not use imx_rproc_sm_lmm_prepare();
>
>imx_rproc_sm_cpu_prepare() should be empty. So needn't check
>IMX_RPROC_FLAGS_SM_CPU_OP.

I will add below in detect_mode(), and no need imx_rproc_sm_cpu_prepare.

priv->ops.prepare = &imx_rproc_sm_lmm_prepare;

>
>> +
>> +	/*
>>  static int imx_rproc_prepare(struct rproc *rproc)
>>  {
>>  	struct imx_rproc *priv = rproc->priv;
>> @@ -532,7 +639,10 @@ static int imx_rproc_prepare(struct rproc *rproc)
>>  		rproc_add_carveout(rproc, mem);
>>  	}
>>
>> -	return  0;
>> +	if (priv->ops.detect_mode == imx_rproc_sm_detect_mode)
>> +		return imx_rproc_sm_prepare(rproc);

Here I will change to:
if (priv->ops.prepare)
    return priv->ops.prepare();

>> +
>> +	return 0;
>>  }
>>
>>  static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>> @@ -991,6 +1101,83 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
>>  	return 0;
>>  }
>>
>> +	 */
>> +	if (dcfg->lmid == info.lmid) {
>> +		priv->ops.start = &imx_rproc_sm_cpu_start;
>> +		priv->ops.stop = &imx_rproc_sm_cpu_stop;
>
>you have switch callback here, also swtich imx_rproc_sm_prepare()

Yes, as above.
priv->ops.prepare = &imx_rproc_sm_lmm_prepare;

>
>> +		priv->flags |= IMX_RPROC_FLAGS_SM_CPU_OP;
>> +		dev_info(dev, "Using CPU Protocol OPS\n");
>> +
>> +		return 0;
>> +	}
>> +
>> +	dev_info(dev, "Using LMM Protocol OPS\n");
>> +	priv->ops.start = &imx_rproc_sm_lmm_start;
>> +	priv->ops.stop = &imx_rproc_sm_lmm_stop;
>> +	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_OP;
>
>Most likely
>
>	bool b = (dcfg->lmid == info.lmid);
>	priv->ops.start = b ? &imx_rproc_sm_cpu_start : &imx_rproc_sm_lmm_start;
>	...
>or
>	if (b)	{
>	} else {
>	}
>
>	to do ops switch.

ok.

>
>> +
>> +	/*
>> +	 * Use power on to do permission check. If rproc is in different Logical Machine,
>> +	 * and linux has permission to handle the Logical Machine, set
>> +	 * IMX_RPROC_FLAGS_SM_LMM_AVAIL.
>> +	 */
>> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
>> +	if (ret != 0) {
>> +		if (ret == -EACCES) {
>> +			/* Not under Linux Control, so only do IPC between rproc and Linux */
>> +			dev_info(priv->dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
>> +			return 0;
>> +		}
>> +
>> +		dev_info(priv->dev, "power on lmm(%d) failed: %d\n", dcfg->lmid, ret);
>> +		return ret;
>> +	}
>> +
>> +	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
>> +
>> +	/* rproc is started before boot Linux, so do NOT shutdown the LM */
>> +	if (started)
>> +		return 0;
>> +
>> +	/* Permission check finished, shutdown the LM to save power */
>> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
>> +	if (ret) {
>> +		dev_err(priv->dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
>> +		return ret;
>> +	}
>
>look like this block should be in imx_rproc_sm_prepare()?

This should be kept here. permission check flow:

power on m7 lm
  |
  | success(indicating linux control rproc LM)
         -> check m7 booted by U-Boot
	              |-> If yes, keep power.
		      |-> If no, shutdown to save power.
                                                     
Thanks,
Peng

>
>Frank
>> +
>> +	return 0;
>> +}
>> +
>>  static int imx_rproc_detect_mode(struct imx_rproc *priv)
>>  {
>>  	/*
>> @@ -1166,6 +1353,10 @@ static const struct imx_rproc_plat_ops imx_rproc_ops_scu_api = {
>>  	.detect_mode	= imx_rproc_scu_api_detect_mode,
>>  };
>>
>> +static const struct imx_rproc_plat_ops imx_rproc_ops_sm = {
>> +	.detect_mode	= imx_rproc_sm_detect_mode,
>> +};
>> +
>>  static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
>>  	.src_reg	= IMX7D_SRC_SCR,
>>  	.src_mask	= IMX7D_M4_RST_MASK,
>> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
>> index aeed08bdfb5619c7afd7201589f417cfd6745818..b8a30df92d3bdeb915e33551235d555b947d0b16 100644
>> --- a/drivers/remoteproc/imx_rproc.h
>> +++ b/drivers/remoteproc/imx_rproc.h
>> @@ -51,6 +51,9 @@ struct imx_rproc_dcfg {
>>  	enum imx_rproc_method		method;
>>  	u32				flags;
>>  	const struct imx_rproc_plat_ops	*ops;
>> +	/* For System Manager(SM) based SoCs, the IDs are from SM firmware */
>> +	u32				cpuid;
>> +	u32				lmid;
>>  };
>>
>>  #endif /* _IMX_RPROC_H */
>>
>> --
>> 2.37.1
>>
