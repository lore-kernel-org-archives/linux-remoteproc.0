Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013063.outbound.protection.outlook.com [52.101.72.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6B02F0C67;
	Fri, 10 Oct 2025 13:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760101751; cv=fail; b=PSmCakzA4dvbJKY3ADfKuF7xJUsPIF+zk+8ZWdSnboL4+c3GcTnUfEm625K38/7TW72fwhefOZZ3JlOw2CUwwm1p0zQDvQC3wYB3Lbu/vY+OK5Qs/3mn0P9poUtuidDBdPq5LWeo7ZCKZfDqcyzj5XHB9/arm5gx9M8keoCJ1xo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760101751; c=relaxed/simple;
	bh=8tEyFVlJ67Rd+sv3hX0P4g7Iq8dC73Q/fCPVu8Rcv2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=M77ii45ShEa9vDJs0qKcECIUd1owRjXX11/3D14TFQVyTZ6dEzqwMMwn6cTZOr/hMbzZSf5pdJQbVupCbtsz3KHaEqxyO+9PVDf4ti/gZA52NrBrMa/RZvMXOTqwEq3/kVdjZ0g2Du2Z98wH0Eyeki/88jNzWevhQLumNMHW97Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mlI9j/qj; arc=fail smtp.client-ip=52.101.72.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mlI9j/qj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NugR0TyOtzHQA2WFY9v7AYY6P09SSsb5AhN5YkANKyBSwxTWZKbvNgm/tiIApTlZYlAWiJCZKvR4p2LuPYOPO07wNbFJ2StWg7O6X7OIA4Mkm3vL7lHrnoepT1qBHdTexRH05mnlr8vk9Egf3rTzAnWiHhIaeYm+ypBc+TgmmcYb2AffC2+k9nO7sey+SWnPQIiSwIijYafllcZM1kEh+kMjpOdL4Wbrr8x7Wft+7Ep3Em8KvPSB+hZ3ZsAAcABB+Ramio6kr8Gx1BD4yiqefm6B6jaf7OVhmABJfvpZ7eFg9qE4EU9P6Fw2aM9CbunDued+CaMvfgnNuK1rfEjy5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQDoL1gYjXlSitW0Kft+YPlHnXg17KVjRdSPd2lUdAE=;
 b=WDxbAR2HuPymi0IgzN4luMIR3Nhv9wZ5MJzZfbd8rVRjv3vtFxFACF2kVYjCOV5ZOLxyaGhxL9RN3G4oXETW9faZgiRN9KW/UKyGm4jtuiJ5Sb3iZwr7OtknGHcbYFAEn6A9Qh+bs1flZy6yfweH7IUfn/qLHCrFjkNu1NJjr/skPRBE84FkUBexSoucQ8MDvrx0TI8EXksc9Wihe67wYNaF3nbTqcNuFrFbLBxf31PnJF6NUZbBnT4ZqPdH0eQXKGndl2mZIuvVSSGOOcomm74IQia0UIq/0t/KrvKPkcM+gRSCNJclahKL+Rk+2aDyh722JPlAIKMnQqsTUnXZVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQDoL1gYjXlSitW0Kft+YPlHnXg17KVjRdSPd2lUdAE=;
 b=mlI9j/qjiriQU2X5dzI421fSWjU9ytk9+cXfNk/qW97htoOXhzGeFUK22V8U1li15Yaa2Y2qSrYIJrktCzG490+piLLP+aLWy8vrHVYeISe9zeaW3N++g0mrRW8V9twB2NQNJUMXBDByDNN1vZXDoYgl4ROnyvUAOjIgempIPn9SbMXIMHq1uYeqovs9Xv7kgOVid5fPOeAtHDoJQ0QVokYtxKlmsZ8IijxgLj88LE6YxUvgnroZx0NXfKdEXyu+0qWLOJtzUvsjZwMNVdvKEhImkNAjX6n7mf7r2MsipfkPAeD0q4930yNG/FB/2qtRQPKre2Qmfi9oj1cg7CvB1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10945.eurprd04.prod.outlook.com (2603:10a6:150:21e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 13:09:05 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 13:09:05 +0000
Date: Fri, 10 Oct 2025 22:21:17 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Andrew Davis <afd@ti.com>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] remoteproc: core: Consolidate bool flags into 1-bit
 bitfields
Message-ID: <20251010142117.GC17199@nxa18884-linux.ap.freescale.net>
References: <20251005-remoteproc-cleanup-v1-0-09a9fdea0063@nxp.com>
 <20251005-remoteproc-cleanup-v1-6-09a9fdea0063@nxp.com>
 <9c8d708f-bf20-4dda-abf8-7896c820c611@ti.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c8d708f-bf20-4dda-abf8-7896c820c611@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR03CA0125.apcprd03.prod.outlook.com
 (2603:1096:4:91::29) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB10945:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a200612-9a73-490f-9bfd-08de07fe3099
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G+Lx3XlFhawl4XSAiXjLRSnTSqyR9hll5qJn9ZitbqM3O9QLa1qH4xK58JOH?=
 =?us-ascii?Q?GsM3N6idvMjuyowgOm5p1xt1ZR+Pnmfwxn3nY5oI2x7hxAPGGcYWDWr6eNGg?=
 =?us-ascii?Q?Dsk9bej2jHKkZacHRDJyBDmo6OEFjKz8IWYVZ3R9HXw6geS7z/RGPK6ET1Ui?=
 =?us-ascii?Q?+cDA8dnnNqAviO25r9/46fD2rcI6skjupiM+M+GLzwDZpGCCLN8+v1KMCgg/?=
 =?us-ascii?Q?LXU5PhpB1WkPnFmFQilD3FPRmvxDw2KRQkQY/JVPzySI6cqiYsQwqL2AzrWw?=
 =?us-ascii?Q?y4b2lqgrd8qnEixnj1l6fzl2zUrNSHETRQF5CcfgN99MLR13L0zrgv8UMlqO?=
 =?us-ascii?Q?JmvsRkgIRqWExKqZMLXNOUjAuykcZ6qA5pBV1VlLr+PSpFSdN47EmlgxXer+?=
 =?us-ascii?Q?xb3Bq/RASzpNHi17y3Hdru/Rwf5pF1pXkjbcvZ3ahuenxyAOgle/KEXgMH6w?=
 =?us-ascii?Q?ohy3WvOKBQMhm0gZgm0LtWQPZnGm8hm4IrJqVHfR/hMe+gL1YrTtgbhXfw7A?=
 =?us-ascii?Q?PXhPLT3g5mXzobvdIbHPKZ8uMwAtiXrM3XYmIKeawWm4oyryTGjArfIjlUOR?=
 =?us-ascii?Q?gU/voEahRspxNVjyjI1MmGlMN1/dxKjis9lA23o0PU3YdB9zXvtmXPjLhoZC?=
 =?us-ascii?Q?3A0/sKwZLbQZ5dfHiV9/VnJph+c3IT/v9dIlaoXCd6GfkjZpW8ZhsMnfwS4X?=
 =?us-ascii?Q?QtdD868sBvOKMlfVAan5bns4Yy0g1oKrp3+LgVjkGTQAWfTp0ehm8/stQhzb?=
 =?us-ascii?Q?jL5HtMJ7FK1kXFKPsu1kbbU8BGhurxKpkyC4AfSaOGixLmWlovLwnzw2SM0g?=
 =?us-ascii?Q?ntCZOGEhIp8x2fA2NttyglLt8yIwK6u6oPXJxM/b8zMDTdHj3tSLbG2RvW1P?=
 =?us-ascii?Q?JeBFnYNCugywgq8xUeKl7tGjHPoTUPA3Kz0+mP4W8zqw9fePRLSXacqyiCCf?=
 =?us-ascii?Q?+w1Q0njNcic1dQRjMJrtdA4c16rqMXAxf9ai4ScSYil/7cSAHbz4335CtBrO?=
 =?us-ascii?Q?jM04v4lO02q9Zg/76PyQhDNA8hoFOsCHiwyd5J8xrHQVcV5lAcFBsY+Nxwur?=
 =?us-ascii?Q?HvAu6h1ag9QuDb4rAJM4IXlHJd9arxM5iBgmY/Mmrxb6kFjWs13RPzJIgtvE?=
 =?us-ascii?Q?GxToUqOwABMi9Y754iPKrrsd4U5pxQwhtJxRF9H/kucpSX2OMYtHf4fW5m7w?=
 =?us-ascii?Q?sY0Nfxb35kVzsus4burUpdWg1TthXHhRsBM9G4oJ8ioAohZsH3NIf3D7AqvC?=
 =?us-ascii?Q?9E4ZcGxUxuAjoaipJeNp+4oNMPQmIOaMXRF1sTsl0he+iTm2nBSlHscG+Mtt?=
 =?us-ascii?Q?mQhEl9fOLQOmxZuacGAhVWG6TGgYGfxpmludToNmiCKm6yY1gKj0cjpqSVA+?=
 =?us-ascii?Q?RjfGEEDED+sE2lRCA09b8GjpXBaiP/7Oqt17TBV1/rZ2HTi5wQQa7sHDGE6d?=
 =?us-ascii?Q?BdrGStVrOLm5Ez4NJMbaj+Q2E5jZBvZQIc+ygOmk8eF6EPEdkfMkc11kmBYy?=
 =?us-ascii?Q?Izbg2xWoEaauMqroFY3uAo5VgESTvgGQpGpg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a0WNSG0JqGfeuv5nJqaVu+7cjx1cwmsnwXraCmH55bjzWmeEcgFaFuXUXccC?=
 =?us-ascii?Q?jq/wo8X7bqMUpWWH1efh56qU+FTl3gFre1j2EB60pcZd7d/0kNxb/YCa0+ho?=
 =?us-ascii?Q?10zqOScUQdNIYm8B9ahN0zU05WdxdN0/zTo3e8yQb4fLHu/go/uBSxJ9qE7f?=
 =?us-ascii?Q?u9aGLbbF6PVqvuXOAFNSNcAikfaWGtEhyjsGBOFdirXdmA9oz+TfEEQnEIDx?=
 =?us-ascii?Q?j1++pitfykNM4YxvlsJlstjs9/ZpHFJ99v6X/BW8vBgX3RLaMy9MCXmXhKx/?=
 =?us-ascii?Q?ahQqfVPvWUTHo7R/Z5OXHthiaWy6LpRsedpFrQXv45nu+04PyFTIOMw8jDR4?=
 =?us-ascii?Q?Ixta65nK0E7DZ8G8/zrxoHtSFdrJf4UbDlmUD3nnJ73xkHri26OHPUykVjsn?=
 =?us-ascii?Q?MOUIDDDQaoAQN0pxf3eT0VmoO5xQj6WU+diB0CVO9KyjLt3miSXy1hw1SGgo?=
 =?us-ascii?Q?wZ9mo0HhZ/RPc6a8HrswS1nrSJ2t1IO7V5lYj34YiwpKpEdCqYzZHbEhZUkc?=
 =?us-ascii?Q?kyG2zhSbgbkBpedK9rp9ZIJ6bmqPinDK0tsmsSPCMk5JPEBco3/J3MMtwvoF?=
 =?us-ascii?Q?+Fj6EJI6cX/KjjWkEd9GfhikR0vAaCYaH5EL40sR4+3wa9Aw3cCN1EqkucyR?=
 =?us-ascii?Q?DAsujxtB7DETJuprmQtDGRrpPuD3v7kIiaJOVlKQPdrcXauC8C9QTcdowFRc?=
 =?us-ascii?Q?SYnJKZwc3Ci7XaOO/2lLIbkuPK5f2RV1ujoLaLQ52goMS7Q5Jt5bzHf2eK4T?=
 =?us-ascii?Q?LWj2aKdhDT3I3WhTBqsmKIAd0KtBi0hRyr9n2Cx6xLLCMZMm9O5Vvwe1kBvW?=
 =?us-ascii?Q?TlruU2Q9kBJwH8rNx/E3Eb6t5MG5BXK5L0QpX4g6TF7vsTrSxxQUhWOVkqvu?=
 =?us-ascii?Q?WRo1AssXqu6mGbm/7MIVDs6lpUZms2Oa2MOeXf9yn3JXN+PcGbJj5mPVS2Qr?=
 =?us-ascii?Q?EmUtk3hkJn78ToPUD0wWxhFsKJf2XfKZ99poqmky7bKZhaWwmrvKYeFp1FdA?=
 =?us-ascii?Q?6pxHhUYS2hgT3SUl8hGFB4rNkqJJHCIh3G2MA7aaJOsn8fvTXecyP1v3W02X?=
 =?us-ascii?Q?UtScQXOPpP/qoqsD9wTSYqt6wJPGI1WcyCb53bYMmpWFKi+XWkWHjFvQfS6l?=
 =?us-ascii?Q?biGHj6hPHe2/O0Q2FfCDWO9eGB2dXn+EZrBXrMIL+4jgQpJDSFfG2D1ETORI?=
 =?us-ascii?Q?XXT7rSlYe5Zq+IMe9PrSdnVaRorNVy9geiHS5Rsi1FjPOM3OBglz7eQdpBY5?=
 =?us-ascii?Q?W2sRNWUqsA2I/v4SicHpZvEW7ZTRgkLXEOxtO99KUO2A9tryAMtLZFvfH8F0?=
 =?us-ascii?Q?/moe1fSWPFaN7PalLNB4IZhgKFu1AJXWqjK/kNdx+S9Z0ueQtn+zMkwQcvVJ?=
 =?us-ascii?Q?kB7tQA+KA/X4dmFpaG7Snu5Nd0UpuBhmd13KQWQVtPiqNQ2M+sQwdL7CBIvk?=
 =?us-ascii?Q?jJDLaV/AZnfqo75WA7vK+Louc4ZtHJLFMB+0Zo8ewAmH+NLJtWJ1HitktH/q?=
 =?us-ascii?Q?hCZN9CLtT1DLJJLeqVoYAS8vtgDCYaZC3H5CfXHK8c2zq0kCfPfPweGXmmaF?=
 =?us-ascii?Q?aPtrQmTfTnxqjvGHBe4xSpqrld7a7mhTgNfAFww1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a200612-9a73-490f-9bfd-08de07fe3099
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 13:09:05.6151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SiQ3L7L7NCjKyCh2rcUoz60tvXdrrFiGlJsrPltrL9vxHu63bgq1AzhuJCsn5zhR1jKHAKU2RkcIj8W7X5dpow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10945

Hi Andrew,

On Fri, Oct 10, 2025 at 08:01:10AM -0500, Andrew Davis wrote:
>On 10/5/25 9:14 AM, Peng Fan wrote:
>> Per Documentation/process/coding-style.rst rule 17 regarding the use of
>> bool types:
>> If a structure has many true/false values, consider consolidating them into
>> a bitfield with 1-bit members, or using an appropriate fixed-width type
>> such as u8.
>> 
>> This commit replaces multiple bool members in struct rproc with 1-bit
>> bitfields and groups them together. This change reduces the overall size of
>> struct rproc from 0x4d8 to 0x4c8 on ARM64.
>> 
>
>Most of the series looks good, but this patch I'm not a fan. This isn't
>a huge savings and bitfields come with many of their own challenges.

Thanks for giving a look on the patchset.

I could drop this change in V3. May I get your R-b for other patches?
(V2 was just posted out after fixed stm32_rproc build issue)

>
>> No functional changes.
>
>If the structure's size changed then that is a functional change. There

Got it.

>also is probably a performance change from extracting the value out of the
>bitfield, where before they might have each been an aligned width variable
>that could be tested in a single cycle.

Agree, but performance may not be critical here.

No problem, I could drop this patch. Let me wait to collect more comments.

Thanks,
Peng

>
>Andrew
>
