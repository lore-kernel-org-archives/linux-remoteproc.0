Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011013.outbound.protection.outlook.com [40.107.130.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C75023F413;
	Wed,  1 Oct 2025 01:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759282883; cv=fail; b=krT9zzXOszIDYXNnEEecYX3WuBc34kCD3+T51xaWl/QrmFJjnpO2xap79r4bKDLNZyX8rQqTBNd17zFnNe9+fUg4YnU/O1SVfiPSoakhBgPB2DSCp6jsPcszuNZonWLNAgKI1/ZhQxy17RfM0s3eXOrJFByjSKBsd9x2oWSu2EA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759282883; c=relaxed/simple;
	bh=w+FvF1BrgGGhbrctZwLrj/tusDpkjE0cpr0Qs3CMo7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ePNOsOwwHVtgouDvaySr7BX38UTtqD9/czGYC9JfpR4L6OSkUX8eg5a037lmBHiNgujlJPBhCOxanVaU+kHNK7q5fa9iCvW6HhyC/mnI05i9OQMyE42jK2EKP1hX1jaC6Dzl0FweyCAV7r9hLl8ezoY805/zb7ZKW51EPISnBJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Lwukplm4; arc=fail smtp.client-ip=40.107.130.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Lwukplm4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Az6U6x/B+zoBjrFeCg6u0+iaB4cMAlvTyYJ7VxI0q1qTUhlYNPYarcUd/Qr5JqpX8Iparyqa/PAU+pS8zv4+H25IfXHzex+ttP61SpMPasJgEvhq3NKg1bz5AHLQFX+F/qAC1p93sPBDuj6+YcgDOV7nAextHWVy8mXdK+4b6tRxG2PRqDmL0BSyVCao0Sz0IAUJhT2dHqJgQ/Iz0HxvsOzSiet0lgHNclz1Y/NGJu+TfK4KtahW7at6XU693jXXNutkSqPsbnIH+yuGzUfpAeXtdkK0y1Qa6IXZcueWbvw/QziUHw0QADcQ/GLQ0S9Cmh5XqSENTSao6caL7AiI8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUGzCaEMT95OtjI1DV4kyTq8BMBcd/aF0MBVIffxOqA=;
 b=n8/I56nCSE538LRfS9DK3ea1vOCp76c1AAzcQwwqrKx4COKdqaspleckcMHHGFuVlcrEJ1NO2s3Qb0+WC4laIpzsZAon75Nt/6LfzMtzjFabYZ4fFZi+Cpl7aEEsT9c3A2CWGZ0HOOghUAN/19IMRQPajOZ11ZuMKoWYJoJy4oWuuNQWF1FIeYtiAA+QyUrdNAHd6UjSB+wQ87xC0lWTAD/lOgciPdpRoqK3hBn1mdRSNLIFbHZ8nJPAsznKRiArtD0dHgz661/Qc80kHWPebk9lxRjpC29T1e+xw9D77k+vnHK8iYMKCZ4TzJFV/LvArJ8PwpL+OmiCqKKpPvG0ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUGzCaEMT95OtjI1DV4kyTq8BMBcd/aF0MBVIffxOqA=;
 b=Lwukplm4KkNWVBL4w+Rz26ib5uF7moxNv8VaLp3qvpE7J2EIWCptPwUFKQYNrvMhIwbC6sxH5hgN/zP6oDmsFA4drncThon+n7tLEFZlYi4hxl2DaAvH+mbqFV+fUeOLpSY+lOfTCcUxCMGBPTHQK4feoP6r0GAl8LhfWnR8VuVInAT63ik6BKEzHQXvHFU6mhimrrDXjI3FGHzMEgBOiaeoKcq71nBcLsgBEyDGJr9tjSRWy0zBJy6eW2YDur4SmnQPSFHVtzq8YO2i5LzeK3GKK6XenifRykVeUxvltlbMd+6mcWMAsh7GR2CQ9uVIOn595kFigAxcNWyWs1dfTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by DB9PR04MB9865.eurprd04.prod.outlook.com (2603:10a6:10:4f0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 01:41:17 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9182.013; Wed, 1 Oct 2025
 01:41:17 +0000
Date: Wed, 1 Oct 2025 10:53:05 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com, andersson@kernel.org,
	baolin.wang@linux.alibaba.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, florian.fainelli@broadcom.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] hwspinlock: brcmstb hardware semaphore support
Message-ID: <20251001025305.GA23170@nxa18884-linux.ap.freescale.net>
References: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
 <20250929200628.3699525-4-kamal.dasu@broadcom.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929200628.3699525-4-kamal.dasu@broadcom.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2P153CA0037.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::6)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|DB9PR04MB9865:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fd34038-9c65-4c8f-5e18-08de008b9b86
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bjanpx79VFMDqrYA0mf5kyfzZYMqwy25daf93oG4Ssd/qfF4f/ABkbzEWGTT?=
 =?us-ascii?Q?1M9XF7PAhIbK2WSKsWxQNowEQhpYT/r6zn4jPo5frqOOEYi6t/BhW+/2NlzY?=
 =?us-ascii?Q?W9ryk7hm0w9FFCwgDo+Loksp1CE0EHLzSu8MsKqPS97W+ohHwib/uur37Dj7?=
 =?us-ascii?Q?DFnYh8t4V0mfzfzxcD7YzhOxRzJw5SdLDUT4XQyUb3gL7muM+DgdQKyWmS0C?=
 =?us-ascii?Q?xc3LQw1tiWsxV9sYFYlu+lNxCrikeYnGkfhWTQgVmK4n/ND8o9NkNFWKymKs?=
 =?us-ascii?Q?dYvx2UO/ry9PzLyNrlBAvSnqhY4NAQ7nBeYDppjG6xQvgqi+yNVYv568FJSw?=
 =?us-ascii?Q?GTqqJHy4ZdCtzaVx25STx0UcnfJt11Ql4xr5zxmqWXJVQzw6fqhTKv2EQ0GZ?=
 =?us-ascii?Q?oQ0SsAK8bMuwRpPaN3KmvJP5w4HJ4zEM/Iclb0lsbH9wniLuvheqRIcNw/3h?=
 =?us-ascii?Q?Y0HkHVa4boM8lOMZ7e7w7T1kFQRnQXUallv0vEFHrxLDc0OssROHbwO4iUi9?=
 =?us-ascii?Q?RSPvlRwRPRoZivVc4HMF4bhmx+8e3j2qBuJvlwrNoEHmidcE/QSeTVYZoDI+?=
 =?us-ascii?Q?pCATMlT9KklivfTcAc9aMN+GKOtv2DBcmenobW53Ow+4tjPrRDBbSo0XZHbk?=
 =?us-ascii?Q?uXuidDDYtgS5D4L9Dia9In6Xrj8/oj4NwOyHORhYXRjSjt8jLWVSnBhla0hH?=
 =?us-ascii?Q?+BXaoYa/OG85y+hZtDcCZ9Fg6FUaw5sFaAAA0hj3foFYg2O9IbCjcyM0gsbj?=
 =?us-ascii?Q?pPp8wVwKfiimHH/lMCe4wIgmSe+v2Vq4hjUKzfXgiSKNwOSRARL8I4q9iEvo?=
 =?us-ascii?Q?fgZvKVoPF76X2/LW3n8a3KdZrDJDl50vg5j2rspJ2MaQsCqIixiUg1CXG3XK?=
 =?us-ascii?Q?aHjPz5gx+PRcYMbtEta3mjAeOf+xK7ABIS3OkBWrDJgST1inRXvLKXC7XOpP?=
 =?us-ascii?Q?F2CTQRfDAiBxw5hg+spuQEuGWgw2LjiKyFGZFK0iHH+AiJcMLgV8UNc1ENqM?=
 =?us-ascii?Q?j1O1T0Z3rkSxXA9UYWtpXhMx+iP3s//0pkghZYsAWl3te5n9qZ1GkVmyk8MC?=
 =?us-ascii?Q?35XEt7aMy5M31JdA5oa85GOttSwsSVuM9F0S/6FrJ6tThqGgWEUgGq1E6/ih?=
 =?us-ascii?Q?Ax5mRfd9CPMtNdE+/jzvFuwRhw8DCc5jUeJEqQTFT9txnZtbCyttoAVxucIG?=
 =?us-ascii?Q?8c7G6onuC2jakZHRTw65EUkytmGOp1eDIUoqMQupJhEGDZBZECWChUUTM0fR?=
 =?us-ascii?Q?zwa3L8N3YtXGuiMU3XKMrl6204XdHUeTy1H+esdp/KoMAfj318hS2KhR7e0p?=
 =?us-ascii?Q?7w1oHZ+hG8IUkrJgttfv4NLyN3ImkSyPWPkR9xQdM/XvjWGCXw4EGSCgSxHO?=
 =?us-ascii?Q?Ar20kTFYv/QBYx26TtVucgSZpWTe1LBMA0tJghEcNy3K3J3WXdMXr/M398Lr?=
 =?us-ascii?Q?dpJuoOqAXZObRUJdzNMOCT4fRXqDMuvMj4dgoWv7tA0hyD7D98IS8QWh45fI?=
 =?us-ascii?Q?pW/vl9ix5atV1glyTSyYIVdFJ3j1wcu1zDPQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yR6IvjEQeF1V/dsHvlUzjSbRPyewGx82cQ4rvI+y9xqNXlwqqs1MsDyx/hC2?=
 =?us-ascii?Q?IdtJOwRVAqftvoU0NAtBmVj27mSfHUbT25CRZeNS7sp5a7rvqQCIrbAYecMB?=
 =?us-ascii?Q?/XieZqdW3uqVacX8bhfRLKAb2+fvHi+HRGLaAh25eF2L2a3OLzlVEyi8vZuN?=
 =?us-ascii?Q?oDNFKai2D8ft5e2PmLNIpCRRJwZO/nFhz03Vt3rCbu1HWij1g2UTFSX8bpl4?=
 =?us-ascii?Q?gUa9zPrhzZCecDNN9p4ZhHnd2ZwGFZZOkmEI1PCUD22Iqsun9Y5fXlnNFyKy?=
 =?us-ascii?Q?viSWUlktEpiFgO3C8vYorH3XQxTSSrAZG6NujT6ez6EQ7dBFpQB7p0VMjaXh?=
 =?us-ascii?Q?G6sYC0OZ4pSQWJ5FlhqO3Cy6y//3Ko0Q2PPk7j61mUJd2jVXDTCMcDmwv4t9?=
 =?us-ascii?Q?Vtss7zz+lfkD+DT8rPky+4hNGlmg5qhXBpEtCxWJSbUKsZ6HfKM/L6FR/lr3?=
 =?us-ascii?Q?D0x5bLZH6ubcXrXqOeIWnnfW1PTs0+t4u3k+EV7h9iKi9KOMPvLE0uCPVj+S?=
 =?us-ascii?Q?AlqnHe1J2kh6Wz82kZfWwrqPNV80b5wY3Q0/k2w9I1zTn2G3uhJl6qi6dPNY?=
 =?us-ascii?Q?SLUHyxDtiTmuDKOpeygxCS681BNkJom+pO3e1RiNvPkna0k3r7UWfmnxUDno?=
 =?us-ascii?Q?ai/6CncBhjNzG/i3R7LWNdILuNkWO8V70k/043+q8Ig6qaRYj3l0vQjcHgtF?=
 =?us-ascii?Q?Ue7xWybdhxPEdiIX/ZfTKw7WSI8WA5Q6UuGAF4rWqS13wRAM7KY5IqS6Ldus?=
 =?us-ascii?Q?mrxOXTpySeymHRpCt7W/PSwvINKO9P2yf8vzBYDYfM+/xdnRrG4Q4eHIGip8?=
 =?us-ascii?Q?wxxcyXt4G/R56cAF22NnkWRZqOHIR5Urs4LP623MgHZT80fe/bGy7JjKuYs9?=
 =?us-ascii?Q?19MLWaEcmssaH0ggkE9R5YfLQIO+dj+sXSADoT0EG4Pk63jRUzY8uoMaWPuO?=
 =?us-ascii?Q?qnjs5JjamgPxB7sJNJB5NvwK5t0liMa/wtNFvV7y703WwFhpJAY+93I4rPtk?=
 =?us-ascii?Q?KbCJ3k5rm3ubtb477fEycj3C1j0n4rQHpv28PLYE+gUJ+sfzP7ubLbMSOgTD?=
 =?us-ascii?Q?+GqYwDrYLFn1eALnyRSaC8O52uyyRlIpSvChHqMZ90AXDCuFZ9Fr8/LxQbsK?=
 =?us-ascii?Q?sAJ6fTD1yLpfyCnZVPdfGQyphkt3u00HvBleV55u0UR+QbTdJz1EAX3u3LdV?=
 =?us-ascii?Q?lhD9p+TysoHb5BMjpjMkDgC20h1Hql5IzlGj3pNGAG/YJOn2zrAMJ0J853JZ?=
 =?us-ascii?Q?+scWL3De/sPHeBLEdQTaxdA/u4i+AJRIDlhSuLy1MmlMWWLqKSxbhX2ejh7m?=
 =?us-ascii?Q?Rz1TKY125AHIh3GZ8Gffl23oLjuB5eAX8icp7DWWv+fAoy4/0m1EadN7UZKz?=
 =?us-ascii?Q?44BaYNza34oh/aoGFgK3D65d3UQ6Ld0xo/EzrouMod/xzHsJI1+fbXFgr9eb?=
 =?us-ascii?Q?qWA+QzzyFFtuS8eEu8sA7WuUA3Tzz5I+G/aptAnvrlLvEBXe377/AW6ntiyD?=
 =?us-ascii?Q?bE6BbnrVYmUe4tTLvGT+s5Dc+wDhjGaU/e+0KE+HDxlQtYfeHj1eFyHzves4?=
 =?us-ascii?Q?WqiJXHEw9h9cY0nBkKEeu3yRCjmsoEL7/hW3d7ln?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd34038-9c65-4c8f-5e18-08de008b9b86
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 01:41:17.3278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RUuw4OrjYPqsSA/391URjDqs7GrmGO+X9ZgHapLbolSS+ZbWU9deCdjzhC0PMEFki9FtUn3ozb9LumZzrEreLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9865

On Mon, Sep 29, 2025 at 04:06:26PM -0400, Kamal Dasu wrote:
>Added support for brmstb_hwspinlock driver that makes use of
>the hwspinlock framework. Driver uses SUN_TOP_CTRL_SEMAPHORE_[1:15]
>registers to implement the hardware semaphore. With this change
>other brcmstb drivers can use hwspin_trylock() and hwspin_unlock()
>apis and make use of this hwspinlock framework. Other driver dt nodes
>just need to use a reference to the &hwspinlock and the lock id
>they want to use.
>e.g. hwlocks = <&hwspinlock0 0>;
>
>Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
>---
> drivers/hwspinlock/Kconfig              |  9 +++
> drivers/hwspinlock/Makefile             |  1 +
> drivers/hwspinlock/brcmstb_hwspinlock.c | 98 +++++++++++++++++++++++++
> 3 files changed, 108 insertions(+)
> create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c
>
>diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
>index 3874d15b0e9b..551afa8df2d0 100644
>--- a/drivers/hwspinlock/Kconfig
>+++ b/drivers/hwspinlock/Kconfig
>@@ -63,4 +63,13 @@ config HSEM_U8500
> 
> 	  If unsure, say N.
> 
>+config HWSPINLOCK_BRCMSTB

Should be put above "config HWSPINLOCK_OMAP" to follow the order.

>+	tristate "Broadcom Setttop Hardware Semaphore functionality"
...
>--- a/drivers/hwspinlock/Makefile
>+++ b/drivers/hwspinlock/Makefile
>@@ -10,3 +10,4 @@ obj-$(CONFIG_HWSPINLOCK_SPRD)		+= sprd_hwspinlock.o
> obj-$(CONFIG_HWSPINLOCK_STM32)		+= stm32_hwspinlock.o
> obj-$(CONFIG_HWSPINLOCK_SUN6I)		+= sun6i_hwspinlock.o
> obj-$(CONFIG_HSEM_U8500)		+= u8500_hsem.o
>+obj-$(CONFIG_HWSPINLOCK_BRCMSTB)	+= brcmstb_hwspinlock.o

Put above "obj-$(CONFIG_HWSPINLOCK_OMAP)           += omap_hwspinlock.o"

>diff --git a/drivers/hwspinlock/brcmstb_hwspinlock.c b/drivers/hwspinlock/brcmstb_hwspinlock.c
>new file mode 100644
>index 000000000000..56206431a94c
>--- /dev/null
>+++ b/drivers/hwspinlock/brcmstb_hwspinlock.c
>@@ -0,0 +1,98 @@
>+// SPDX-License-Identifier: GPL-2.0
>+/*
>+ * brcmstb HWSEM driver
>+ *
>+ * Copyright (C) 2025 Broadcom
>+ *
>+ */
>+
>+#include <linux/module.h>
>+#include <linux/delay.h>
>+#include <linux/io.h>
>+#include <linux/slab.h>
>+#include <linux/spinlock.h>
>+#include <linux/hwspinlock.h>
>+#include <linux/platform_device.h>
>+#include <linux/mod_devicetable.h>

Sort the included headers.

>+#include "hwspinlock_internal.h"
>+
>+#define BRCMSTB_MAX_SEMAPHORES		16
>+#define RESET_SEMAPHORE			0
>+
>+#define HWSPINLOCK_VAL			'L'
>+
>+static int brcmstb_hwspinlock_trylock(struct hwspinlock *lock)
>+{
>+	void __iomem *lock_addr = (void __iomem *)lock->priv;
>+
>+	writel(HWSPINLOCK_VAL, lock_addr);
>+
>+	return (readl(lock_addr) == HWSPINLOCK_VAL);
>+}
>+
>+static void brcmstb_hwspinlock_unlock(struct hwspinlock *lock)
>+{
>+	void __iomem *lock_addr = (void __iomem *)lock->priv;
>+
>+	/* release the lock by writing 0 to it */
>+	writel(RESET_SEMAPHORE, lock_addr);
>+}
>+
>+static void brcmstb_hwspinlock_relax(struct hwspinlock *lock)
>+{
>+	ndelay(50);
>+}
>+
>+static const struct hwspinlock_ops brcmstb_hwspinlock_ops = {
>+	.trylock	= brcmstb_hwspinlock_trylock,
>+	.unlock		= brcmstb_hwspinlock_unlock,
>+	.relax		= brcmstb_hwspinlock_relax,
>+};
>+
>+static int brcmstb_hwspinlock_probe(struct platform_device *pdev)
>+{
>+	struct hwspinlock_device *bank;
>+	struct hwspinlock *hwlock;
>+	void __iomem *io_base;
>+	int i, num_locks = BRCMSTB_MAX_SEMAPHORES;
>+
>+	io_base = devm_platform_ioremap_resource(pdev, 0);
>+	if (IS_ERR(io_base)) {
>+		dev_err(&pdev->dev, "semaphore iobase mapping error\n");
>+		return PTR_ERR(io_base);
>+	}
>+
>+	bank = devm_kzalloc(&pdev->dev, struct_size(bank, lock, num_locks),
>+			    GFP_KERNEL);
>+	if (!bank)
>+		return -ENOMEM;
>+
>+	platform_set_drvdata(pdev, bank);

I not see users of drvdata in this driver, is this needed or I miss something?

>+
>+	for (i = 0, hwlock = &bank->lock[0]; i < num_locks; i++, hwlock++)
>+		hwlock->priv = (void __iomem *)(io_base + sizeof(u32) * i);
>+
>+	return devm_hwspin_lock_register(&pdev->dev, bank,
>+					 &brcmstb_hwspinlock_ops,
>+					 0, num_locks);

Seems all "brcm,brcmstb-hwspinlock" compatible devices have 16 sema locks.
If this is true, it is ok. Otherwise better not fix num_locks to
BRCMSTB_MAX_SEMAPHORES. "MAX" implys that not all devices have 16 sema locks.

Thanks,
Peng
