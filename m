Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010010.outbound.protection.outlook.com [52.101.69.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCE3281341;
	Mon,  9 Jun 2025 07:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749454417; cv=fail; b=ki3VAiQKIxT+k3pEzvu0EUhB5l5irh/w6E5zdm83dEc4LqvmAFJQCKtBr82+ih9CoY54Epo1EfG1bghUx4Xj+8lf4BNJGXahd7gpCjnYey7ndHCnuZV5xnn2mcsLM2wxQ1STG2eUItVAgZ6YtFHfyI1ND+w3n8JoGmLVSOyPC0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749454417; c=relaxed/simple;
	bh=BYvhQkF+iJJrVbUY+uFeaFJsWJ3NFynjzZBuImU2yuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qrlmPEwWbhviQgNM+TzpckrlwxiAJQ8kh0q8cjKpCNyYsguVrxzQGwg961OrobfJRDWS3Pq5kaciAW3nU+Iij+n/rgIZUrV1QBpYZ3UwBoOI0nZlLtVohDurTtCI2afPMAoAYtaguJ667q8IMEF8uk6mOVLEKSRdqp7ePqxqFYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=u9wLM2is; arc=fail smtp.client-ip=52.101.69.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="u9wLM2is"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQKwJZGE6ULyO9lEhekIBTlNG56CEO8y5kJ/qzvzSCaRDDQV1BI5yYOz7bw94pBNemsHrRmi8tZvsw4Zv8fKvjDpEPCVXSb0B/Ooq2dvDzvZdxrbcyG4bsgfff/uhrWtb6JCeTf8u6sFwaUQxIN1RE9/2zLiIpoS+uRxwvLdGNq1dQIFjAAPpAWx0x6DlD7XQcj0ych6TfpcpqC16nNKO9tRiZEfckPx0rkGHcI3MgvLLmEjyOv/ElHgnsCwgwjACovMV+Vic/AxS1rhSVnsIE84MrlpdRgrH7Muoi37igOh57xvxRJfomFrBgK7H8BZem5ztbQ7dJr5IIElOQLpdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/eduaRXx4/ZxAeLhttSF0fHtjvR5kn2eh2pywM2BzI=;
 b=f0L6vrMQk0L50N1WYmqE5Sc3gIGJvHRejiF9/7UHx2p261/zIQB6idNoq1iILwvQovnhwDdomhYmb2+BqlhEcILiy7myHwRmDK6uWWBNBs+dHFLv9TYE/6Xpn5t+4znRROWJkDRLDvtjpn6K0PDMEk9aoBY9dzBiV7FGJxi4B1v7+BdE6EPzQ4GYKpv67Us1E6M1jdppMsBsBkaPZDav6TBFIGh7V9zKURcofPymVqwK6QKIepVbhcOcTmQsMluswRymBy+CyhsleDaBZUqULWZ69nkoAEOdhaYoJkRDcFPN4IFX9rZ6i1VGfsmho4xlfqOwnEFdF4Dsk6wNvb0gKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/eduaRXx4/ZxAeLhttSF0fHtjvR5kn2eh2pywM2BzI=;
 b=u9wLM2isiubx+XPTAe7g4BMm3UNW5y01AfCjCEeutGr5sq17PkZwuw1mpqG5mOSex+MjfXVsn/WgTMd63yTAzgWCFzNql3U49GlH/Xc4ZSWKAdb0nPZa7vXK4I/dZua73E1Zk0w2mp+5VJ44uxxI5HqK5/WOuhnXWMvexnhsI6rDlXP+/wZ0DJvUkh393YcPmnLJdCvwT05LkNSGiDqnKL8nxUhKmzC9pkqpG9IlJuBUB5cw6qZwL4nNzolFDTBQsP/g1MhJgrsNgwnRAFxsoXd3ARVnCujjL1mlzeEJ2yFDt/1RKEQXebXlsvIKZFVpYIX+AtSz4HfuH5/UxtMBbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10226.eurprd04.prod.outlook.com (2603:10a6:102:464::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.24; Mon, 9 Jun
 2025 07:33:32 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 07:33:32 +0000
Date: Mon, 9 Jun 2025 16:43:30 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] drivers: remoteproc: Add C906L controller for Sophgo
 CV1800B SoC
Message-ID: <20250609083803.GA13113@nxa18884-linux>
References: <20250608-cv1800-rproc-v1-0-57cf66cdf6a3@pigmoral.tech>
 <20250608-cv1800-rproc-v1-2-57cf66cdf6a3@pigmoral.tech>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608-cv1800-rproc-v1-2-57cf66cdf6a3@pigmoral.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10226:EE_
X-MS-Office365-Filtering-Correlation-Id: f3408b36-4f22-4415-bb21-08dda727ef40
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mVK9gSK7rz+abM2VPNu9fNQ/LEXCPdL44N3xTdpU1in9s/XBJtQT0vM+6HZX?=
 =?us-ascii?Q?MXMk97SU+ya6KVjtACI6AWf/R8jqrEnqJVaBJMd4dHcjftN99NPd4siHKodQ?=
 =?us-ascii?Q?UFjuhDFaiV+PKja/yCIim7uQjXwsAjKcJe6JSCqowMmjuX4opywcUJDPaIEn?=
 =?us-ascii?Q?YwzfB++ljth2IFcj3b+v0yR+ng/lzWcY0n/CLOdViM9lwON+JrTGL/WAg1iY?=
 =?us-ascii?Q?ePSs0T97QE8Hu8+YxtkVke+Hjjh0xeizyzSkyNll7RwJKGXgT5bd15YpR/Yi?=
 =?us-ascii?Q?bD6wEMQSqnHvz6b92AeXubqB6yJMpX2uAZBW1yD0MgOHg/Pnb0pLF5cT9IOD?=
 =?us-ascii?Q?F78A1mJ/ScEwBsP1xlSRaYlYKZlyTkXOvWC4C8Z4TMlfnKEGfgrQx+0yXal9?=
 =?us-ascii?Q?DTPu/HS1QOQxtZKHnpJAavvIrTrBPnW03vcXKl2BfbD94yKLSfANr/b41QFH?=
 =?us-ascii?Q?Z/aKyuyIOg/9l2Q4EU6YM9COjUM/SDe4CUSx3/zEKyzHMxH+DQloEjSrCcmZ?=
 =?us-ascii?Q?+Jojc/IiCVPuIASc7sHO/1FDpWSlf5idmUk7AUIf8pfj9P1ZRJErjj0IQKXm?=
 =?us-ascii?Q?M2ai1z9zoLh8cQpnSh0k8qPZft6OQrV0agJLQHcwR2/72wt7okZTLez9Z4LJ?=
 =?us-ascii?Q?2YbAGp2TO3IIl79j7ErFuVFxrNfql0QMOhgqhd4CQwrWuWHhvSdr6fafi/0p?=
 =?us-ascii?Q?0nKPvuJIPdJ4Uo21bf12Q3nQrVVu4uK8B3T1WpH8bkfY0yBn0v32pEffd4wv?=
 =?us-ascii?Q?gauZeeV9+6zubKH8hTtckK7XtUEQj9HjWbQfGwcXtdjBu76CvLOvspYHdK94?=
 =?us-ascii?Q?RT4t1YexF3hsjaDtqF70n8nKNV/Zuuy1K5kyHjk0uGjaKY6GvqOj5OJJDaIt?=
 =?us-ascii?Q?1atxUwL71pwtCRKSmvfnKu2iXMFEHYh9z0KdcBMaLmbywPFhQ/MBFfQz2neN?=
 =?us-ascii?Q?h+e611C0JodH3G/wnEUeChixPO5f8TecrIx8Rn+A6JX1MtpLCBn76wzl5T3w?=
 =?us-ascii?Q?ZNENlvYlRiodHgcAIDGQbsf9nLiT9GLv1IwBYeabMwmRBFbAfSnUYD32WoeQ?=
 =?us-ascii?Q?I9fooB9/0MIYOAidVWRYd3jykm3sJojiRdh4z5Zmv7SXx2Q+KwDPBgJ68lsj?=
 =?us-ascii?Q?sA4JjqwBbgTLBwLxpSTUyiz7iwlqGT8YsAGMbeVE1k3ifrnen/nEc5aTiK4V?=
 =?us-ascii?Q?0r8DHYYxBmgKTGjEpx5J7ly8Qfd+5/3W3WfMc9qAPM0gzSllBZMag8CjmT1j?=
 =?us-ascii?Q?0Gi4jIua2saHlE5voAahxebo/X/tKK8p8tqn6mzDaGF/0uJn11kV40CEmZhK?=
 =?us-ascii?Q?CV3w3UNvA4D46hfF8d4UkMqRFtRqH+n6Pn+DeSEPbNkWnul3hf8g1B6OPJ9d?=
 =?us-ascii?Q?imUeQ0oxtme7g5k0xwycEDsMRaSUoRN1jk8ivmN4/hf7ZNYkxCaMTAZb//vr?=
 =?us-ascii?Q?qurb3NV1H9Pa18wDMtl7slOb/Ph5Y1mYS6FTJbj7EoXvfd78Q/qYWWt0382Q?=
 =?us-ascii?Q?6tpPYrAdqYsBhls=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uVn2yBZKT8uF23NGeaDzqw9fXU00WnEGRoTP8eb4YydHRXMR2kvlABlJuR33?=
 =?us-ascii?Q?n/dCPsCYjLwQkGMkhcg1hHu/0dVtS93CywMUQYXbbdp0KuIpe6IjGRflH7gM?=
 =?us-ascii?Q?uCBI8Zxm3WY65aQEqaJ27aqOysfXsx1ynFeL90ag/Xph+dYmQofkfsMdzXmp?=
 =?us-ascii?Q?Zug5ytLiewfBbPnkaRaLuEaec0zZZtvl7boyrGWBKRpAm8VXE3GO2bcSa4eV?=
 =?us-ascii?Q?YkIU4eZ0a+uDWAQf3mAsWISETd8TfIq8NRQ7xNNy7nmkEoKfwcXM/t6JhXA6?=
 =?us-ascii?Q?ylEQnFLNR9uG/fdDSOSVitxzleSsc10KLg4lme+2t9gvIpsf1ZQ3LfgL3ofZ?=
 =?us-ascii?Q?bnc8p9TtdyA6AGxzTwxHOYJKbs/CocRB5Br7G78TLY9T7jTz8b/mD8PiMMmF?=
 =?us-ascii?Q?iPpq87rRKxgUuvd3BpaeUN40VrVAS2Ww9fUhbUciPUq70ISGIbshmN6axV9w?=
 =?us-ascii?Q?vAQgdy1nOTxZ0YWvNQoi0H3Yz2R+KNUxkmgUHsFlhvmdpsH9oMwmu9r3GF1P?=
 =?us-ascii?Q?sL9AMq/3BBIqCVls7N17MaaRLgCkUqVIGlfVButbE3POKWEtoV7LZhTZGZLy?=
 =?us-ascii?Q?BlF6SUrHQT91RzLS9gk+ZuWbtIf/581PS36vMDUB8b9ymXabTtd7KjmgzJic?=
 =?us-ascii?Q?RohYwbdHbZLy1rgwQD+vMpnE8LkUtF1UnPldqYSRDePTgtFrkkSIxEYDpUZY?=
 =?us-ascii?Q?WeTm4k4uBX6kA0/4ElPb4O0Lt4NC5/OLUgA+Qcs7ziZYQ9UPUNpuZtqsTuJT?=
 =?us-ascii?Q?R/AZJ8bft2WIH3tKeGE09gLRgLLgzllLLmndlglkW5Dlc4EcsnyjGAFCTyHb?=
 =?us-ascii?Q?VcaiiBCQEUBZyLBvCdh5ae5pfcSck3JljHj0wD9gGqrS37QSLm2k8KYxJ1kD?=
 =?us-ascii?Q?xDa2bFY4CVB+dufxq8gas99+iwVB+7IpSQ9E4ZpHkJJLmaPwoZPaml3p8h2Y?=
 =?us-ascii?Q?aT/ZW1nupZBfF/1YJBc6gJrwMj8A/dwAqQBQgzY/0FFvGVwYj4B6Ap/srovp?=
 =?us-ascii?Q?6w6l7feCUhKnnN+BkKT2A9U4r6Ca0skaFv8FJ536wIJKyv+tq8yK5Vz/DPkj?=
 =?us-ascii?Q?UMGKsS/Faoon/APUB28TNyscdhHUHdOD6fGYdR1AYNb3Ytz9yPPR8B5AH0/9?=
 =?us-ascii?Q?dtFeTe60YgaDR8S78hDbKHw18huKFdbEOoWMB5dwa2TluVKAD1KigSgMbI9Q?=
 =?us-ascii?Q?wn+r4uFyy21An/4r4bPgxR8m7vHwHywwHxZdXjkMarXMowHTxre0o5bJCjms?=
 =?us-ascii?Q?E7FB6XJpAUmX5en1XngYoX2McSy3ukuQjwmcTa3pgTejQBzyz8Mki9Zu3AgI?=
 =?us-ascii?Q?B40ORWEuC2QtFu0L4cuYKzjhyiNVgt9mi30+jGXUZ3CP7Gn+gEn8LkTtLLxi?=
 =?us-ascii?Q?MooxfzWwKg39AQrOiG2BgYIxwl8CAhGQ7TA4eauiZ+BptU2Wf76Sw+DdfAF0?=
 =?us-ascii?Q?y0tCtryZR3ngila2g4RSPzTb/g0csLz9RT+hlzfAO5sXmJD9he+iuUrdw2N6?=
 =?us-ascii?Q?xrCGRiIjnuWUnH+1Oxe1QDI86W6WaDw6VP9G/xYFsGy/yijfS2s1xFKAm+hC?=
 =?us-ascii?Q?3DXFmUWSyCrl1+u323qjRK0pzzMvoiCjFRmi+mkW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3408b36-4f22-4415-bb21-08dda727ef40
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 07:33:31.9275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QX+wayGxthrU53iBpBg/UimhSraUZ1xjVAxumSq7tBHDWnwG7V2bNLlo+w2RXuNrsXiizn9/tTa0CGa+LLpQvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10226

On Sun, Jun 08, 2025 at 10:37:40AM +0800, Junhui Liu wrote:
>Add initial support for the C906L remote processor found in the Sophgo
>CV1800B SoC. The C906L is an asymmetric core typically used to run an
>RTOS. This driver enables firmware loading and start/stop control of the
>C906L processor via the remoteproc framework.
>
>The C906L and the main application processor can communicate through
>mailboxes [1]. Support for mailbox-based functionality will be added in
>a separate patch.
>
>Link: https://lore.kernel.org/linux-riscv/20250520-cv18xx-mbox-v4-0-fd4f1c676d6e@pigmoral.tech/ [1]
>Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>---
> drivers/remoteproc/Kconfig                |   9 ++
> drivers/remoteproc/Makefile               |   1 +
> drivers/remoteproc/sophgo_cv1800b_c906l.c | 233 ++++++++++++++++++++++++++++++
> 3 files changed, 243 insertions(+)
>
>diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>index 83962a114dc9fdb3260e6e922602f2da53106265..7b09a8f00332605ee528ff7c21c31091c10c2bf5 100644
>--- a/drivers/remoteproc/Kconfig
>+++ b/drivers/remoteproc/Kconfig
>@@ -299,6 +299,15 @@ config RCAR_REMOTEPROC
> 	  This can be either built-in or a loadable module.
> 	  If compiled as module (M), the module name is rcar_rproc.
> 
>+config SOPHGO_CV1800B_C906L
>+	tristate "Sophgo CV1800B C906L remoteproc support"
>+	depends on ARCH_SOPHGO || COMPILE_TEST
>+	help
>+	  Say y here to support CV1800B C906L remote processor via the remote
>+	  processor framework.
>+
>+	  It's safe to say N here.
>+
> config ST_REMOTEPROC
> 	tristate "ST remoteproc support"
> 	depends on ARCH_STI
>diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
>index 1c7598b8475d6057a3e044b41e3515103b7aa9f1..3c1e9387491cedc9dda8219f1e9130a84538156f 100644
>--- a/drivers/remoteproc/Makefile
>+++ b/drivers/remoteproc/Makefile
>@@ -33,6 +33,7 @@ obj-$(CONFIG_QCOM_WCNSS_PIL)		+= qcom_wcnss_pil.o
> qcom_wcnss_pil-y			+= qcom_wcnss.o
> qcom_wcnss_pil-y			+= qcom_wcnss_iris.o
> obj-$(CONFIG_RCAR_REMOTEPROC)		+= rcar_rproc.o
>+obj-$(CONFIG_SOPHGO_CV1800B_C906L)	+= sophgo_cv1800b_c906l.o
> obj-$(CONFIG_ST_REMOTEPROC)		+= st_remoteproc.o
> obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+= st_slim_rproc.o
> obj-$(CONFIG_STM32_RPROC)		+= stm32_rproc.o
>diff --git a/drivers/remoteproc/sophgo_cv1800b_c906l.c b/drivers/remoteproc/sophgo_cv1800b_c906l.c
>new file mode 100644
>index 0000000000000000000000000000000000000000..f3c8d8fd4f796d0cf64f8ab0dd797e017b8e8be7
>--- /dev/null
>+++ b/drivers/remoteproc/sophgo_cv1800b_c906l.c
>@@ -0,0 +1,233 @@
>+// SPDX-License-Identifier: GPL-2.0-or-later
>+/*
>+ * Copyright (C) 2025 Junhui Liu <junhui.liu@pigmoral.tech>
>+ */
>+
>+#include <linux/mfd/syscon.h>
>+#include <linux/module.h>
>+#include <linux/of_device.h>
>+#include <linux/of_reserved_mem.h>
>+#include <linux/platform_device.h>
>+#include <linux/remoteproc.h>
>+#include <linux/reset.h>
>+#include <linux/regmap.h>
>+
>+#include "remoteproc_internal.h"
>+
>+#define CV1800B_SYS_C906L_CTRL_REG	0x04
>+#define   CV1800B_SYS_C906L_CTRL_EN	BIT(13)

Align the format.

'#include <linux/bits.h>' should be added for BIT

>+
>+#define CV1800B_SYS_C906L_BOOTADDR_REG	0x20
>+
>+/**
>+ * struct cv1800b_c906l - C906L remoteproc structure
>+ * @dev: private pointer to the device
>+ * @reset: reset control handle
>+ * @rproc: the remote processor handle
>+ * @syscon: regmap for accessing security system registers
>+ */
>+struct cv1800b_c906l {
>+	struct device *dev;
>+	struct reset_control *reset;
>+	struct rproc *rproc;
>+	struct regmap *syscon;
>+};
>+
>+static int cv1800b_c906l_mem_alloc(struct rproc *rproc,
>+				   struct rproc_mem_entry *mem)
>+{
>+	void *va;
>+
>+	va = ioremap_wc(mem->dma, mem->len);
>+	if (IS_ERR_OR_NULL(va))

Use "if (!va)"?

>+		return -ENOMEM;
>+
>+	/* Update memory entry va */
>+	mem->va = va;
>+
>+	return 0;
>+}
>+
>+static int cv1800b_c906l_mem_release(struct rproc *rproc,
>+				     struct rproc_mem_entry *mem)
>+{
>+	iounmap(mem->va);
>+
>+	return 0;
>+}
>+
>+static int cv1800b_c906l_add_carveout(struct rproc *rproc)
>+{
>+	struct device *dev = rproc->dev.parent;
>+	struct device_node *np = dev->of_node;
>+	struct of_phandle_iterator it;
>+	struct rproc_mem_entry *mem;
>+	struct reserved_mem *rmem;
>+
>+	/* Register associated reserved memory regions */
>+	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
>+	while (of_phandle_iterator_next(&it) == 0) {
>+		rmem = of_reserved_mem_lookup(it.node);
>+		if (!rmem) {
>+			of_node_put(it.node);
>+			return -EINVAL;
>+		}

Is there a need to handle vdev0buffer?

>+
>+		mem = rproc_mem_entry_init(dev, NULL, (dma_addr_t)rmem->base,
>+					   rmem->size, rmem->base,
>+					   cv1800b_c906l_mem_alloc,
>+					   cv1800b_c906l_mem_release,
>+					   it.node->name);
>+
>+		if (!mem) {
>+			of_node_put(it.node);
>+			return -ENOMEM;
>+		}
>+
>+		rproc_add_carveout(rproc, mem);
>+	}
>+
>+	return 0;
>+}
>+
>+static int cv1800b_c906l_prepare(struct rproc *rproc)
>+{
>+	struct cv1800b_c906l *priv = rproc->priv;
>+	int ret;
>+
>+	ret = cv1800b_c906l_add_carveout(rproc);
>+	if (ret)
>+		return ret;
>+
>+	/*
>+	 * This control bit must be set to enable the C906L remote processor.
>+	 * Note that once the remote processor is running, merely clearing
>+	 * this bit will not stop its execution.
>+	 */
>+	return regmap_update_bits(priv->syscon, CV1800B_SYS_C906L_CTRL_REG,
>+				  CV1800B_SYS_C906L_CTRL_EN,
>+				  CV1800B_SYS_C906L_CTRL_EN);
>+}
>+
>+static int cv1800b_c906l_start(struct rproc *rproc)
>+{
>+	struct cv1800b_c906l *priv = rproc->priv;
>+	u32 bootaddr[2];
>+	int ret;
>+
>+	bootaddr[0] = lower_32_bits(rproc->bootaddr);
>+	bootaddr[1] = upper_32_bits(rproc->bootaddr);
>+
>+	ret = regmap_bulk_write(priv->syscon, CV1800B_SYS_C906L_BOOTADDR_REG,
>+				bootaddr, ARRAY_SIZE(bootaddr));
>+	if (ret)
>+		return ret;
>+
>+	return reset_control_deassert(priv->reset);
>+}
>+
>+static int cv1800b_c906l_stop(struct rproc *rproc)
>+{
>+	struct cv1800b_c906l *priv = rproc->priv;
>+
>+	return reset_control_assert(priv->reset);
>+}
>+
>+static int cv1800b_c906l_parse_fw(struct rproc *rproc,
>+				  const struct firmware *fw)
>+{
>+	int ret;
>+
>+	ret = rproc_elf_load_rsc_table(rproc, fw);
>+	if (ret == -EINVAL) {
>+		dev_info(&rproc->dev, "No resource table in elf\n");
>+		ret = 0;
>+	}
>+
>+	return ret;
>+}
>+
>+static const struct rproc_ops cv1800b_c906l_ops = {
>+	.prepare = cv1800b_c906l_prepare,
>+	.start = cv1800b_c906l_start,
>+	.stop = cv1800b_c906l_stop,
>+	.load = rproc_elf_load_segments,
>+	.parse_fw = cv1800b_c906l_parse_fw,
>+	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
>+	.sanity_check = rproc_elf_sanity_check,
>+	.get_boot_addr = rproc_elf_get_boot_addr,

Seems your setup does not support attach mode, so better add
attach hook and return -ENOTSUPP?

>+};
>+
>+static int cv1800b_c906l_probe(struct platform_device *pdev)
>+{
>+	struct device *dev = &pdev->dev;
>+	struct device_node *np = dev->of_node;
>+	struct cv1800b_c906l *priv;
>+	struct rproc *rproc;
>+	const char *fw_name;
>+	int ret;
>+
>+	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
>+	if (ret)
>+		return dev_err_probe(dev, ret, "No firmware filename given\n");
>+
>+	rproc = devm_rproc_alloc(dev, dev_name(dev), &cv1800b_c906l_ops,
>+				 fw_name, sizeof(*priv));
>+	if (!rproc)
>+		return dev_err_probe(dev, -ENOMEM,
>+				     "unable to allocate remoteproc\n");
>+
>+	rproc->has_iommu = false;
>+
>+	priv = rproc->priv;
>+	priv->dev = dev;
>+	priv->rproc = rproc;
>+
>+	priv->syscon = syscon_regmap_lookup_by_phandle(np, "sophgo,syscon");
>+	if (IS_ERR(priv->syscon))
>+		return PTR_ERR(priv->syscon);
>+
>+	priv->reset = devm_reset_control_get_exclusive(dev, NULL);
>+	if (IS_ERR(priv->reset))
>+		return dev_err_probe(dev, PTR_ERR(priv->reset),
>+				     "failed to get reset control handle\n");
>+
>+	platform_set_drvdata(pdev, rproc);
>+
>+	ret = devm_rproc_add(dev, rproc);
>+	if (ret)
>+		return dev_err_probe(dev, ret, "rproc_add failed\n");
>+
>+	return 0;
>+}
>+
>+static void cv1800b_c906l_remove(struct platform_device *pdev)
>+{
>+	struct rproc *rproc = platform_get_drvdata(pdev);
>+
>+	if (atomic_read(&rproc->power) > 0)
>+		rproc_shutdown(rproc);

I think the remoteproc framework should block remove to be executed
if 'power > 0'.  If not, the framework should be enhanced.

Regards,
Peng
