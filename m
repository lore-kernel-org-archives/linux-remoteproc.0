Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010041.outbound.protection.outlook.com [52.101.84.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D39325785B;
	Tue, 23 Sep 2025 03:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758597731; cv=fail; b=VlemI5gjQH16ogz9/qbf6S2jHR09kig9cHOBTC6RLCpamnRv4XAB6L0TxP/YAiZcN9IqrfakY0Fij0wJFR98jPck+WlRQvIdHLwhwll2vcrqBFzkzBEnikH+7NVLtDwgpBr7/olD4GbTayGptzGUvW5V8pgqcprvlifUGteucwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758597731; c=relaxed/simple;
	bh=RYNnwG+n1kf8ygBHxItC3ztL6eRreg74qWxtY4nzmWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=icd8JySwszNlLziBtcPNerP5MF8fCLoLUQSq+TH9YOZOr6OhfqEBjuN484OPgtF7PThb4ULha78nxuSFXbspffwn74Jros3zPYCdskh1relAEYqH0/gLrkFWio2cZoInMvjzBlogHR+hPARhNY1dDGDXZ+dKH9s3pY+qR1H6+UY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aF6cJdUb; arc=fail smtp.client-ip=52.101.84.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aF6cJdUb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kISQIgKIXVnktTzPH1/p0BewZFY56Fl320tXep75xFckMGUbJK+AB52sMITp/PGCPcd2kLNn55I/d9giTyAeIlge0XSNU8bpyi0/pok7PtKE5Oq+bELXHGgaZN54IaeF7fMKGVN5ibNe3bcNoi2b3vIw2Ue9RSAuSokYlCIIqNzqQ5TmJXNdKCDuCEh2yj16qjkfIqXXlVgsXHuVY1n4TxgumtekpEwTReZn2maySt1TQJ4dkw2C6I8LreGm2vtgFwSmgHs7KyLi2AIfycBKG2XofVIK4owAhmbAsqWQGw236NgPbDNg8+6WGZj4RUAdXqSpjrcmJvMpVOp9bRcDPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZLyqG1VAtxyZg+U2Ocs3m1dLR/+E5XmjX1hlUPA8VA=;
 b=v9A64cZYF/U/I+SPY+zQDyW7bljIkMDX2qASiWEj5wwZG0Cbdj5POQwc/3/JiBUQ+1jJShBi2U2hk+hl0zaeq7f823iK2IV+r3XC5HoGee/YH+du/kuAo4MwOBy+ztLaRxX3PJrm2MZVOCkzwMIe8AoOffvFNMTzXPhcEQeGLOgy0allSJ0hebqBWFZlOvq2+9jPykJw65CScXsqE/y2k57NMX4WZ4ezCN/kmlbXp7176CZ6eOoEdpdoPUTlE4azTOipsnkhWEstJ5d58W/R+ucCS/RBiSvRlbq+xW240sAiBvjYOtcmUjX4VJtQB/E8zRFjzSDpLi3GsIn+ZjKKwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZLyqG1VAtxyZg+U2Ocs3m1dLR/+E5XmjX1hlUPA8VA=;
 b=aF6cJdUbzdXegKcTL/lputebFISJXNzIwv1Fks5BT79I4qX9nfY/YIV4WAufi/MmKaNUQmCo19xEbtrIQ5FvJDhhdLenYyyKCI3/FcnGMgr0lfC7ZUBqPxiiaY8Yg+K4qp3R6obNeForgZRna1O45oGUQtjuoEd9OG69NJEJ14WlOOlRM57i8Fke9TIX+wEgYMfGqSDUxjEHYIekPKZMdD6LaoAQIJhMu/gdpre974t9jFyId0WILiswq0tIIVRrCS7vT60rc2P11v7ogHi8XRRpfXMeq+eTcZ/mqr334s++3boA2oALrtHIqlYlVsfElyCtvopxMIN0+oMROaOb3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB11193.eurprd04.prod.outlook.com (2603:10a6:800:291::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 03:22:04 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 03:22:03 +0000
Date: Tue, 23 Sep 2025 12:33:48 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] remoteproc: imx_rproc: Use devm_clk_get_enabled()
 and simplify cleanup
Message-ID: <20250923043348.GB31170@nxa18884-linux.ap.freescale.net>
References: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
 <20250917-imx_rproc_c2-v1-4-00ce23dc9c6e@nxp.com>
 <aNF8GgKGvokLq0mf@p14s>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNF8GgKGvokLq0mf@p14s>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0043.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB11193:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dc14cee-277a-476f-2478-08ddfa505dd0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r0KJFSi486//7poypEMbHkEd83hm5vYiP3rTufJXb3/IYT0DiTB7rlMwpoa/?=
 =?us-ascii?Q?YJzh/C5a0vTdh5Z6xA2kuC/30yKfumURI9+ECZEYdqtHHtrTQ6/KVtxN4I9r?=
 =?us-ascii?Q?3be1xrXOYZqmV+d4dvLixq9nHH1gV8T1b/ejQBlc7tpeC4E4s353geExAraF?=
 =?us-ascii?Q?kICtwkopm19Ph56F+ncj8n6ZVJuVOmHs+6akF6m9iG6U5VArahHweF/79wiA?=
 =?us-ascii?Q?U838poPTJAqfXGPukXYpagVyhcD+pAE+LVIfwhmQxHB4MItm74828kO1+YXH?=
 =?us-ascii?Q?HSbva2h2xKnL1VXxEqHuTqNSkvIXwYnT7JPD7IgMzxtky4UTXXDas0kqxRoE?=
 =?us-ascii?Q?lIcBKk1l+36NxLPb0FFDUGYeKPKHmQAggBha6R1n9mDqAD7i7R84ufhz8FkK?=
 =?us-ascii?Q?SyOIRWLp2MUKbW9pe7G3KU82O9aYJjq+EYG1Sxz4uGKZ8ptCXPFtnepUsaRt?=
 =?us-ascii?Q?m/Hso9SrD2CGNPE3xrjP3C0O1noU74NMa2eMhLtIFyyuq+8uofrC/scB/NX1?=
 =?us-ascii?Q?peZaTXmrV7B6hlPWSdEPxLv46E+zvkgf6iChlYzzsIytunbCy9yWVdTXq0s2?=
 =?us-ascii?Q?y0oClL0c0mMY6Sk9AlGz9s1TPVOITFjZ4MCBkSls8vQB8mp9yF+OfLtNI0F4?=
 =?us-ascii?Q?gcegYYk1tRnn22g1JRAH4mvjvNEE4WHHMq/eyWm+W5I6QUDD3wXdy5dxqBcg?=
 =?us-ascii?Q?ldg/P33fLY9V4CRMTy3SQnyRu/1WE7y4qxkMDvbit7HitjHnEoKEHejM4kSZ?=
 =?us-ascii?Q?78ZA7viUy5Rb3JZ9d93j2r/1cI6sZebIaMCWkMq8BngTg2t93XiMGkHjT8yr?=
 =?us-ascii?Q?xkQcs0wMhFLw5Jzh+Bi9whk2+Iqo2C7ZOe0GmX9AzgBf4eqUMgLxysM6KAS6?=
 =?us-ascii?Q?/DcO+YJ+Vjd1GazTbMH2XAOlego3g1rHURauzW6D/RMK0nit8loNOLEuVrRR?=
 =?us-ascii?Q?CyuQ78iPN2L+6su/Z/HtOBpFk5TRvW8beM13whH6PSF08wtO/7ICKiNm/kHI?=
 =?us-ascii?Q?E4ZUgaVwB7JUxWpSQqo59Ln4TzSWapL0bsI1X9JWFYRrgae+/S3dQoztfTNa?=
 =?us-ascii?Q?gQvttDORmN+g+KCdz7zMh5SEDERUiYOWMq1baw3NbvdLUZpgpNvZGlT1cxw2?=
 =?us-ascii?Q?rHyOHdx4jOGvH8Ok7x6deIKVTFJMrSPDFGtQ67MMRYAStZ/OFp7wQiMxqS7h?=
 =?us-ascii?Q?rp/3M/OBPc1hCPAXyYEOtsm007j1hAjZpNjhuwuCgZ5tEvK33YvURf/zLpzT?=
 =?us-ascii?Q?oRIaNUrfR+4WzG9gsf47DnS5ZakRxs1KTsn9MdFrLZOYxP4FLVPMjzwJ4UhA?=
 =?us-ascii?Q?0bSVG112R7TfUOQ9GltQUehEiv/u6vAaO6KE36puy/+dvdNhPiCTDoX+Zx2Z?=
 =?us-ascii?Q?81rjlcSPkT5Hx8csAlOEw3T47FPTVOmOKBBn8soVOQMnF6jGbfd3BIxAJZQw?=
 =?us-ascii?Q?nI82DyuZkw8Hz+ttmM1t8ByY6hCKONdItJM6A8ImpgXTaIk59Fdn8g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/ixrBrv/ZxIJrR4yHOOtYGmmCYhcU8ztOu63+s+M/CaU0wWRzZ0bjIJ8Db+l?=
 =?us-ascii?Q?zkgeUGyeujMAfTkOUBh+urkmBZaPuWDij5/GuxBmIj/jmwgMhoDGGto+G0L2?=
 =?us-ascii?Q?J7A1XEPSiCWjkfaAPmCBwiapp6Xzw8fXIefzxgd3OZZrlbSXHJZ9YKiqzQSu?=
 =?us-ascii?Q?LcH582m65grPHtmjxg9ljYgVe2RG23x0nIId2tM+8eVTnne2xYRD2eKCK9pq?=
 =?us-ascii?Q?Ye3b6a6y00uZuFZwonQhTGClXnPknGuz0k4B41wB6ma1H3czVm8bxl2ucPcH?=
 =?us-ascii?Q?YUhaM6LaxovuUflly+o/Q5Mx0LVQxQvBe4FiBEU3vSn5ctQMO5Zx6ZcZgE2h?=
 =?us-ascii?Q?s11ch+SSThoz0t5pGzTivvOZemt9eppzQTYfhvel7i8P13fdGsjqKe6WDcL+?=
 =?us-ascii?Q?s2shv6oXk1BqKZrK5XWuRH20tra3ca9WZOJpt0pgv8BHNGiciwgjYV91tt4W?=
 =?us-ascii?Q?TEmpEdoHvz/LvsSElLJjxfyaJUSsxI/t2XTLbK7yt2dsAWYvsqDoz2PWSUHv?=
 =?us-ascii?Q?sFjQqWKVeLH9vDZQkFU3Na027fmFXGHzoqCJ0YEpq6LggCmYN4Tsi+X/mpsW?=
 =?us-ascii?Q?DAi/V/sYoeOho+VjZliUE8jCL64eKKAoT47bcYT3wVlKmwy6LCXmJljVe0an?=
 =?us-ascii?Q?a5Xhbni8OA5uX75iuA4L2JiAyqHEiNGr52vR2ZHwvvTUrU68qK9P9OR4FouE?=
 =?us-ascii?Q?wfREe86XefWuUAlFsMaLqZ9jedXA8spZiRtb2sQ9j7AREdMoZdP6QccbQN3u?=
 =?us-ascii?Q?EbnIG0zDXGXyp2Tld7Xj+8cSsKdMBbV46BQq8ursG1bzpnxcprzJJGbbTkPn?=
 =?us-ascii?Q?L/j9gBry65RyOaa9svXjjOU0TCXkDt/4EqNks+WUzi1m3wjOAU64RjVhZJo3?=
 =?us-ascii?Q?ReUHJ7V3rl37H4U4IsGbh1VUjgy24j1thirmbV5RZOMFXvmjm+4uBHIvi2TM?=
 =?us-ascii?Q?M3asR9FzsdKlf78U3E6AAD1CziByYCxFHf7/5OKVxQ8NoxT2F3szxDow3W16?=
 =?us-ascii?Q?T/sYPzzQQhgt1AKRK8c8Lwwb5J6u77c4nPWex6ZGvC1tnUl/oZXPCT6aaB0E?=
 =?us-ascii?Q?LDSRnWLZghmbm1EQOiyxx96IZl/A9na9wYMZBEmYk8NxWA15pj+wHVWjBBhc?=
 =?us-ascii?Q?ZH7cAbC/o+tHufjxHn/wwnUBX1O3rIbwCp1yBPm6FLAEJMv0stQQoGX7c14+?=
 =?us-ascii?Q?t0Q+6cUEzFPmOzkNiSJLFzn4iKwUi//KYqyD/zAOt85CGB4e22IUa9/1Wmur?=
 =?us-ascii?Q?GQPu2RCd4WpX3X+QCBFHZfdEhrazHqRai5aBu+iXOj/RysiXPclLbVACOxKE?=
 =?us-ascii?Q?Q5kVGHcbjwPyrsvbcNLQmbN38NraTcQ9qgqYsLQ250PP2TdsgNCWs2kkhXxs?=
 =?us-ascii?Q?ipqTcUjtlSz8E2S7dJAkvC2LU31mtKLrhaBvlKryQG9xSL13aQ3pIY4GKoy9?=
 =?us-ascii?Q?kCZ+JywSCtc7HmB4cagUyYl9/i1XY1umxFIHDhtEIIpZ9phb9VmBZ5p0kOLS?=
 =?us-ascii?Q?o76dJHZo/BAz4oLGRemjDisaWoUVJfVQKcryI4mFzl+lhP2sOB9EGTqGfir7?=
 =?us-ascii?Q?EWZGLoJvOe3s9VMedc4NOXB7TibpkEDCV7SHvmDB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc14cee-277a-476f-2478-08ddfa505dd0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 03:22:03.6833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4EkIxZjrn2T20cRzD3TMJXoDtVgOh+pYrqqht4oWD1Re3E1boW2iPKxjrd54ToeD0RAddBgK0UxB3nme8ENkBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11193

On Mon, Sep 22, 2025 at 10:40:58AM -0600, Mathieu Poirier wrote:
>On Wed, Sep 17, 2025 at 09:19:16PM +0800, Peng Fan wrote:
>> Replace separate calls to devm_clk_get() and clk_prepare_enable() with
...
>>  
>> @@ -1187,7 +1178,6 @@ static void imx_rproc_remove(struct platform_device *pdev)
>>  	struct rproc *rproc = platform_get_drvdata(pdev);
>>  	struct imx_rproc *priv = rproc->priv;
>>  
>> -	clk_disable_unprepare(priv->clk);
>
>/home/mpoirier/work/remoteproc/kernel/drivers/remoteproc/imx_rproc.c: In
>function ???imx_rproc_remove???:
>/home/mpoirier/work/remoteproc/kernel/drivers/remoteproc/imx_rproc.c:1179:27:
>warning: unused variable ???priv??? [-Wunused-variable]
> 1179 |         struct imx_rproc *priv = rproc->priv;
>      |                           ^~~~

Oops, this variable is removed in patch 5/6 which should be in this patch.

V2 will have this fixed.

Thanks,
Peng
