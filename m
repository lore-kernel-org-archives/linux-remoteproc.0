Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BF72F549C;
	Tue, 14 Oct 2025 09:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760435001; cv=fail; b=esptRKtJgq+moIi2vkwL7ZdCO4NU44Bb0dAs5POwQHbFcCPOXUKYBEMdIhZbWXZfoSJqUEc8hHUQQk0EJikHnxdhXkU2cot72O7yreTfMk9X/HOmpmbjHVMyNvRd4e9FyLwuVIfK+LPDxQftQYwMjqiSCaKkeScR0AbcMXe9r+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760435001; c=relaxed/simple;
	bh=1LWnoaBrqioT2pZbKX/LJgORkUKg9w4gTGCiaV3Abyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cXAnid2mIG4Q5JF34FMkD8tUgj+uomVMaxfmWJwDQ8CJDPsERbPgHVbEe0iHyh9uowHevlC88YRgl+TaeS9MMSvdXiqOA3o/gnA/dXlvDAB7K98Be3tZLVpptyrZdrIpImhgScKhIQX73RCzTpUBuS9foGNJINyp2rGo8zHTGu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=v/lAHtBW; arc=fail smtp.client-ip=52.101.70.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="v/lAHtBW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D5tOdhMRQupU8xbKQe5ucPUJ5YR7RBTcShelOL+5GNbhDgMxJhqk66LHURFN4mtQ5TBeuWthKwePGZnkH1TMIFcDplk1LjoHPHExE+FNIGZZo5SwfAm4ndkDPGZP5eDgctN9ZThMLMMevRE5/P2Og/b9QOy4nVozqAqTI8jN4Q2pwtYkvSlGbhK3bGfWreUeeVpSK6gzdncacAZLRqs8+1lTSwfXJGhTgAimBslFWeLa6DycjlChvRy3fC9j1V9Y5WhxtqW8vMhmb1WVfYg9ORgWVEIv32I/+3y2R+KqCyR11UG8h+7DiiFUd+aWPymK5CNuhs1165szCy8JYEjelQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLczAIMd6YBgHTyUBd3OaXQeoTevWz+WAYzf75JGUEA=;
 b=ujEn6K6DiCODOVVj/1xNv9iXoNNumgqcn/b6p4HLwysbE58AcN183i9T4HDewZDbP/9iichhWTeT4EiXfCYtDZYeeDBJV2b0w2hFEwEVobyJO7EGHLBgK/EcgykR0V1PosF1RqZ1gKyPxCCRRG30dvlR0w5fobdd+c+wtKua/xIltgyHB07k4WLUrDr89W2/8nJ0CERIid5XofADUEnkt3ccrZFzBKAl53EuYHcVC1sMy4croIFLleKNZP6q4xnv3t9dCI7eipW2chsUwaEanAqQWr9DYQAhMKRv29OLErlbikaHz9BJnn+vIXk6hlQU2DrAys/KNTD/2Adt74xddA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLczAIMd6YBgHTyUBd3OaXQeoTevWz+WAYzf75JGUEA=;
 b=v/lAHtBW8xlWQRwMmn5DjggqfV4mLy07Qv5Yp0Cuz7HBMnXOVXbizu9PuSm0TvY9Qu+JMT6ESi7pvX24nIM6nCOSqQlbqo1YdhrWzcwHudJBu7HKqttthjeA7kXgd7wtrpD9SyJfSsEITb7pqtsRVq3OFqMCd6KLXrkuhjtBH8QJeS2qcW1Wa/bGCjAHBI0BeY08eAhUPwtiJRHwJO6kpCtnqaYfvBh6G+yEZK8HnNHQT5sr5oNIN/2tWh93gayHJ6L7+O/fl7/Fa/ptk61q6Ll7Y/Fnz0z5oJDWgrtjFYcZI/3YwLCXiB0m8nOJgC4N9Y+bjM4hvitiCh8YGaBG6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10656.eurprd04.prod.outlook.com (2603:10a6:150:20e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 09:43:13 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 09:43:13 +0000
Date: Tue, 14 Oct 2025 18:55:30 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Andrew Davis <afd@ti.com>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/7] remoteproc: core: Use cleanup.h macros to
 simplify lock handling
Message-ID: <20251014105530.GB14479@nxa18884-linux.ap.freescale.net>
References: <20251010-remoteproc-cleanup-v2-0-7cecf1bfd81c@nxp.com>
 <20251010-remoteproc-cleanup-v2-4-7cecf1bfd81c@nxp.com>
 <3b7ab4c5-7dfc-41f9-bf6d-6deabfe97338@ti.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b7ab4c5-7dfc-41f9-bf6d-6deabfe97338@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR02CA0138.apcprd02.prod.outlook.com
 (2603:1096:4:188::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10656:EE_
X-MS-Office365-Filtering-Correlation-Id: 908c6331-1814-42d7-5c44-08de0b06179a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|19092799006|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gbppMRXSS2ucBx2NADDDPGHGU8Hekimnn5gtrAMjK5x5n6VjcjQ5cLkhPvH5?=
 =?us-ascii?Q?qY9HM1U5xPh6eDjtEMXEMaZJGAIAoH8Srp+XypyxgNL5i+ruTYn7+MGzY/uM?=
 =?us-ascii?Q?dKhHwtOO6u/W9sIU22AUJ5GxKCAUoCal0Plwmtyi4i9nfg8R/VxGKeeKLpkl?=
 =?us-ascii?Q?GIyiVeX4fufrHXMF2n9Dc+SZ0ZEwg+LtCAv91V8AEJXwOI/fv+L2dKCH9qqP?=
 =?us-ascii?Q?wHLuUAwpWpT0nnij6L1ga1yAlIkRuTFeOdcNiPiC63qrxVkCpB9r1bqgU6Bm?=
 =?us-ascii?Q?DSb/fTeoaGWgxmVXHhjkYtezAMVcKHw8LvzkapSMz9duHxdHIkEVa2828+U6?=
 =?us-ascii?Q?b/QsXPbGb+0mqQ80YV3fxh4af3yLtC0ztSqagkfQwTEWq80FrkXW0cOKGM5S?=
 =?us-ascii?Q?GZnmOWefQY9VF8/2sXewYF/sl2o7iUOwtE8sC7iutWwYeO3XrOHSvWqKtWkB?=
 =?us-ascii?Q?jRwHrP2g/4myt4CzX+K0wV8oKF4EdYCKhkHORo2u2SP+XlQfslml3/h2ywHi?=
 =?us-ascii?Q?4R+PUn9l5h19AGTdEnn0eWdMr40oCAKTbpywZIrIC0rNenuha4Lea/6hbyaU?=
 =?us-ascii?Q?ObkZw4fnNftWsR1y7FOdlVAc6twmNxuHM+FdFtgputzhTQ3k3DV8BHOR6Ftg?=
 =?us-ascii?Q?P8xrqMO+tuFIXWp2qprAHwDt+pfGn1y8FqAPb2F0NFzirmd8tXQsVdbCjTJZ?=
 =?us-ascii?Q?YPxNI3jpaqNQ6u3hdW6iefalHVM8rXLBFuC7RxtTbfGYuJghFTaFZe/3b+61?=
 =?us-ascii?Q?mxCWbpirV59JuZ7NwctVhSpE8x2NtL/oLf9bQb2/WEZ7pc8/cmnW3B5yBPF7?=
 =?us-ascii?Q?0yPGNfYKU8bChr7HJPrEPuJm+OE0PUfnsMRvhjv9LJEYpT8NpOfc8AMuPTI0?=
 =?us-ascii?Q?ths2rg41w3k2x5dtOw7XRD7oRIDFj6drYbwww+Kbu87o422K9tphWJkE9ivH?=
 =?us-ascii?Q?fl06jghhCGh9IaegInItZ70siolj/J+XzkPJHb8kn7kGHjqD7T6rzuPFyihU?=
 =?us-ascii?Q?HN8ejt7Nr4+TLnWT5vcZ74h+5QAOttl7UcmFtojSKnGPL2K4kSL9HEKnj9sL?=
 =?us-ascii?Q?C8+yojnfTZ48zkhbTGFGpuxLQagoz0uXGtTsJUtjD1CUQ0mKpcjR0Nrku6UV?=
 =?us-ascii?Q?0m6JuHy+6mQqy2OQWD8GVyuLgauEu8jVpleivxTbDPK+g8YAz9si43yd5Lh+?=
 =?us-ascii?Q?4nydHkGVf5QLwGzkO9gXFGe2mm8XX69Qq9EKWRGc51RLnsyM0GgyRWxYt1VU?=
 =?us-ascii?Q?+l58CZBrTf8Jb3uYz4hp6lu7yPP/mHh4ltFAbPy9ZFrnJ8T57J+dJBNseQ9q?=
 =?us-ascii?Q?xheph0RNDJA+GEX91jVZBfjOraLYWJ2u5D/iJjvQDuoI/93xaEZUN+CgAlZ0?=
 =?us-ascii?Q?ulnpkr5CVa+8p9mR+sqUt0xu556QkoRhxLkFj3KS1/+0FgZNzrAOIGNBQTUO?=
 =?us-ascii?Q?zbJN9MkSI5fObd45uxu8rXAzGHv5/D/0BWcDzIVvkm3B5rW034RfDeLspnBB?=
 =?us-ascii?Q?EZwCKsu2+THFEh5EN7iEsHuQLHJaGKf0TGiJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(19092799006)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CRREpV6J3I0fDOeVfwkRaE3265sF8HJ/kJRzk2StLfA7lOTYbXOEoZ/qzAdX?=
 =?us-ascii?Q?ugHl69f3YlPfxi4FPjJ/0vFDCxuXjBX1xqpONHD9ZZTPlJNAHnG+tmAGKvMJ?=
 =?us-ascii?Q?pt3XGyQogL79UzHYUcBTNDeu2sCSPIU/9Y58dhv2UY0N6rhRW2SsY5FlrQXm?=
 =?us-ascii?Q?jaVGDLryrTr3PnYy963FSFaprmqVNEFbnHlOWk3Kp4CWGknrDwIbcydS97k8?=
 =?us-ascii?Q?BbvAsaBipbjNX/RQGpOIW9zrflwTn/dA8cpAUhTPo4YWTEejw2MEUAXyhgaT?=
 =?us-ascii?Q?P1bLnz+4WX0L1z/cuxPllFkuSygm7h2jQFjuoEFKbVvhEllQmzHmDRazxAA7?=
 =?us-ascii?Q?7Ny+uSec+L9f7+5wu0fUbt0RWgZiQU8JffRuYVJ86H/lhwd+7LOjcDIq+Nmx?=
 =?us-ascii?Q?sf3o4zJLumIz0AG6FepvpDGPnMf/omQErkJpDKCjfIXBeOPczogkIhAFggr8?=
 =?us-ascii?Q?6esAWsxH27+yGK/CTNZRnONc2erFwi++ZecrEbp3Nr8dznL1TNXwxEII5FsW?=
 =?us-ascii?Q?vaDQwLNKa33E3PYmhSuSAhrOt+jt9jrgDAtK3o09+6OMSoIzMBgij4mAHMoD?=
 =?us-ascii?Q?K4mn9H2kWDaFK6x3A49nI/PV4fW5GNwsr3ShtVR4H2SJilsSSSEedbLyluP5?=
 =?us-ascii?Q?zVdiW2c349NqTTWgSdcp3V8e4XP4nLWMnQ4RisyiAojcpEtfw9zzrnA/X1LO?=
 =?us-ascii?Q?B1lBpV54VQ93EB6o9FeZ3RUi5s9xUT/g31vQAq820Ax/wWv47uk46ImRX46L?=
 =?us-ascii?Q?QSTPVzCJsQzPpYhlymFj+ArIyHFnp7BdITfLJMW0Qc7T1lVyfgRBN9HulhEY?=
 =?us-ascii?Q?raq+o49b2Y0Lsa+EqKWYA0EynXMsb9WkddoWlDeJngRKy7DFaVZctPYr7N4T?=
 =?us-ascii?Q?f5D8bGv+w3eNPSQhGTUl6qpUzf6sYX0+kNcN+rixczAM6ybJRqtCQdLP0VMw?=
 =?us-ascii?Q?GAKC4Qa6rXeOm20zdrS7EMzzPDKpPnuHEY9W5qYmeEMencyXGgH8YdzO5Pla?=
 =?us-ascii?Q?WK54E0AexZ9SYT2FoBYXpx2yhu0JTzFiGx0lKyFyD5fOy5BIgF+t3RoVZPoj?=
 =?us-ascii?Q?7cCVI99Y4Jc/F1UV1tCFByC2DlBDcTn/JN7gYuU0uhZ9z1XrPLg3tuDKP+rs?=
 =?us-ascii?Q?HPcEpk3YPQd42tZZ3ZE40TGbFySQ2AnyumpOKdkhvlpC5jB8NEHQuyNsQuqg?=
 =?us-ascii?Q?hC91EDSJye9yCyYNPJ2dclN/3lW3fq34zXzxJWN/sQASvWbDiNrhCSuv0vdQ?=
 =?us-ascii?Q?7sNJONRQOfkPo/+W69n3GohhUd1/FSHjtqC1gE5o8ZkCGKkbQK8exFnS15XD?=
 =?us-ascii?Q?9xJhjW1xKpdlNmb4JDyMXGEhIKBpOdJ35n0bDDTQUx4/6YTMFMG+D20MbeOC?=
 =?us-ascii?Q?qt7D/T0otTMJdOwJmojIlKgZ1sJxW11drS1Pmw9x0pDWoKkcGX6eftN0G5dI?=
 =?us-ascii?Q?nPsczLC/D7n/wk4xz/ehPt8qZTYEiLQkywMH2qpQbfErXCbsZNKXWXIzBOIr?=
 =?us-ascii?Q?VWugAfluo+Bkh5H3uwQeSCQNYwRK1SmVGPXipB1N5pLJnnPoBgA/1FzilE5t?=
 =?us-ascii?Q?DJQvrLNe8NMCVNprOZ1/iETVMRrX2yBm627guoHS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 908c6331-1814-42d7-5c44-08de0b06179a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 09:43:13.2337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YVMLm4fGkfg2cDNQ4NGMWF4bwmvZYxezrWnTPwXFcrZuo6L0E0kjdS8fgjuLlEPlu5MlfQ1YReJsOEmKk6Q5Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10656

Hi Andrew,

Thanks for your reviewing.

On Fri, Oct 10, 2025 at 07:34:13PM -0500, Andrew Davis wrote:
>On 10/10/25 7:24 AM, Peng Fan wrote:
>> Replace manual mutex_lock/unlock and error-handling patterns with cleanup.h
>> macros (ACQUIRE, ACQUIRE_ERR, and scoped_guard) to streamline lock
>> management. As a result, several goto labels and redundant error paths are
>> eliminated.
>> 
>> -
>> -	if (rproc->state == RPROC_CRASHED) {
>> +	scoped_guard(mutex, &rproc->lock) {
>
>Not sure this one is worth switching to scoped_guard as is doesn't save
>us needing the goto out label. Plus it adds indent to a bunch of lines.

I was thinking to align the usage of cleanup API, avoiding mix the usage
the cleanup API and direct usage of mutex_lock/unlock API.

Considering the deadlock report [1], we may need to rethink the lock
scope in remoteproc_core.c. I gave a look on ->lock, but it is a bit
vague on which exact entries in rproc it is protecting. 
Before [1] is fixed, this patch might be dropped.

Thanks
Peng

[1]https://lore.kernel.org/linux-remoteproc/6460478.iFIW2sfyFC@nailgun/T/#u
