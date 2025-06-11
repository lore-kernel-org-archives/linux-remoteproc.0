Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011070.outbound.protection.outlook.com [40.107.130.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202DD8F5B;
	Wed, 11 Jun 2025 05:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749619184; cv=fail; b=L49aOo1tE9UfpTegO0CrcpQEMidSJ/dhAg1CZGx6KyEi0TyygaWdrepFrpCPjUE5eBGNSHqszfI1xyvLGsU6foho++BkOuuHAUmf2yt2XEnTPZk2lMkxyLlgEScrXaL3DHc12JfVUW49DoJRtPF3cpK3on8WprR30fwFuiHY+lI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749619184; c=relaxed/simple;
	bh=hJ4kX0l3hbeSaWbjeF2Q0DrUUZbRlEgNI2JPsVBWB/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TYQpWvNB8HvVE+TAdiYuQK+4JOt0MBcwN90oBGsH/f2O06/5MDqZg5KPdRIQ9dboARvpAJSmXaLxdGdOwBolgBWmTtCUjzM/fZml9k0pc2pCJHm/dV0RQpoOk0e2By+wxJwV+bkmBK2vA3UsisqICgspXNQkx74x0X9ns/0RktY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JU2PnlTc; arc=fail smtp.client-ip=40.107.130.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JU2PnlTc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xo5kTuMRvgT+G+cwOChI9fUPFInwRNR8s/4zlbGvRpC7asaEq4axDKS7XYulaY9w5tqoyMCkG2kdjddzHQTV8CBmwQ6Qt/XOs2iO+3duGH+M0IJP1WxFQlt3RyG9AelE21jYSHMwwZ0r5KcSMNc5OTqPxz8oM980SPuIsSvt9+gmZuCXeMmND7N49e5m9R33Wcyzu0IHOOz/FA3Mt3Q3YrnGPR9/ISdBbncTr5BQEnyP8MaS59eM5yrVEsOe0wd7EPauXtRhoKyjBqrfK3orXMUA41ObK7MiBxqenIGWqJEiXcr4nZvk2eV+eVZSHWr4y1R+xGwC+aqAaNLMSsKo8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBj7NcUWYQZ5pPR8kQWFSyMltNLBOvOxNFkxlFkN0HU=;
 b=hSjKaWeoiPXAkEp4938TNMI8izewpPfVTpxzFX42H+Sp30/4sraWvj/xz6uC2xuN8VDqV+zGrwgEUl5DanJjxq74PY4t4PxV7Q/q5H7q/O8oP6rBmFVJy4M6C+fnU0IrSVhVaRlEsKZvwVw4RXtuCK9QX/QBzTtzd98OVTklk6jd/S9iOsRMad91gNw1b4WAH5WMK8nO3kf6Ag+b5p5MdDxZ7KXCqMlOaHU7bJ7xI3eF023oiFQSGiBq+tf0y/UKUORla37uY4lEClGTtXdK+ey5773DhVfXVwC7jhDxQCoRAzyu5BjL4nSAEeOzHKpwQZD3dcA3+WuML3gepYl8+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBj7NcUWYQZ5pPR8kQWFSyMltNLBOvOxNFkxlFkN0HU=;
 b=JU2PnlTchznvcqJVGtN4+0TWRKIfzZmeFxATqNxEXCfiiGeDu2ycSSzpHbvhrbbwD6Ggc+wX3X+N9EllAuTlpYG3fgwDwjgaO+y3RPZY/SDkiHRGYkkU3BdEQkZPHv2dUOts+cfmWGdsSfn2ci9Vf5iqABFJ6E/frDwaFi74j7eYjV8wlDbr9Vsq5OyeU7udIsK3oyQVRasXvUxTTHUtOegSk1wvkyRutY+aHv835w2kPW5FTVYk/t90Lco53gtdRTAdRKG2W9rxDwBt5m2WfTcmAnUaI4I7qJI2r+YMbwDv/Am1RxqbqXieWDRhJs9F1rgBR/mLe2pYz2+qQ/W19Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS4PR04MB9622.eurprd04.prod.outlook.com (2603:10a6:20b:4cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 05:19:38 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 05:19:38 +0000
Date: Wed, 11 Jun 2025 14:29:39 +0800
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
Message-ID: <20250611062939.GA9120@nxa18884-linux>
References: <20250609083803.GA13113@nxa18884-linux>
 <184791843e98e0a0.ed7541b3db6a6586.57e5fabaf9bf62ee@Jude-Air.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <184791843e98e0a0.ed7541b3db6a6586.57e5fabaf9bf62ee@Jude-Air.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2P153CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::10) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS4PR04MB9622:EE_
X-MS-Office365-Filtering-Correlation-Id: 52cb52fb-effe-4a5a-8925-08dda8a78f35
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J1mWHJ3KALY92j+cuP+ib2Prl4ayH0l0iIBHRMgC/lHJd25wqQWjkUNOXjln?=
 =?us-ascii?Q?3eeDSlzRQxZnpcHQ7URYReM6iq7e6IpIS1VFyncxKE2jqX41HynBaTwY4e2o?=
 =?us-ascii?Q?tFXQzahv6ROQlwV1dXbybl9BBmvAXF8LG4garLSQ7Lv7T4VWQEN51di7XAg6?=
 =?us-ascii?Q?jSpeqYX/asWo+esLQeN+gM4jRZd8b2qV21W4z/I2C/NPQEXle5ASmIjx6OAT?=
 =?us-ascii?Q?JnsV6oetFY69yBhfyAauHHikpq6+N/U/iJUweiizSFz9sHIpAXkfcF//SSCs?=
 =?us-ascii?Q?bSCADaraIYz6EWFZIkhkk95+e0rovRs/BZKVzliQRaokzfsqemAkdKEZl7Lf?=
 =?us-ascii?Q?jzQ2a94CCR1gFZW35XcRT+0ID0VNxswYqe5QGx6c8yi4Z3vj1WRqIWZ3eEtK?=
 =?us-ascii?Q?rwEBX8hY+abb7kGJTsWLAJ1O0OWYTPAO0y1CK29Hz+AsP5cRDG8ldExhtnoH?=
 =?us-ascii?Q?lUCz0i3uIYkzz69AVRvjNUlrXLr/Z7dh0KF7I6EG1zkDq2MXh5GW4diD9tVs?=
 =?us-ascii?Q?6h26nsD3Ir1G9gX6+F+cVXTAC9HexT88Jr/E0AO4Bl/2Z93i9grI30rZkYAg?=
 =?us-ascii?Q?frJCv+i1DJRxdnKKBUgiXnDLi7Xz1Strq9xrPVrMdxFEAjx6GSk+P5eKg+Eu?=
 =?us-ascii?Q?9Jlnzegtm21E+V19PtfE7SqS4dzB6Zf4sKZfjcgosgbg/5N1sPZ/j06e9kSl?=
 =?us-ascii?Q?HPNjRaBAs2MTq1TUOdobUZwBbfIQact3NXp+6sAwotFdBfs7E38HATAZY/pF?=
 =?us-ascii?Q?PoitY8VCMbshK0rFtg7dwQ5MIvc1dbTwqSbotUtGGZg2c1o+Lr+v6Go6jXGk?=
 =?us-ascii?Q?q6Bw0/RCYHUTr21ChzzJgLN6Y8yuQ8teWobR9qBrVjHao2O1plR4trR9Y+El?=
 =?us-ascii?Q?c3zUoPYCLujfVL9ASm3tYzFRKY7GK9ZbS98a5oimgMCsVwL5gPPLIa3g5Bs2?=
 =?us-ascii?Q?b2fdmOvqg25WzuK+Rcc34m3Zmpmm8ZdWnsAhcF0qY28xy9cyFrV7Fw1NHy27?=
 =?us-ascii?Q?bFr6HtlVFQf+7mWeyIvLSVsJRw8Bh/Qg2ilhudVMk3LujAtoTm3zIgkcbDc6?=
 =?us-ascii?Q?hbOxTe1sUOSLMYg+BRTNSyILEV0bGXCqzkf1ypjXEqmntunCfB7ptdwyufaP?=
 =?us-ascii?Q?dgGM2VZwbnak8rXiGboC4BFaCOsee0aYHiQfH+A46Fh8DiosG4Oo8SIdaEYQ?=
 =?us-ascii?Q?zpmIlrigbJKSnYvjOg7eV86ODp0x0VuBpDR/nrFbKo2hykm4ztnoG0IIX9Uz?=
 =?us-ascii?Q?RkaHDS/ANIiRetTqWsGwa/akTqC5L57ogNR5ZasQtWJscx60Qw/FhQxNrjeH?=
 =?us-ascii?Q?pd8QQpqV+gUaVNBiGP/FFcYnkrXVC+/nTeKcRmk3jx5Xi+Gw6mjrt8ukvieY?=
 =?us-ascii?Q?mno4OMvzp3UsP/w8D2iAlR+hYBaok5L0aJF25NPXwSuodfPsPZfeqpY5UPx1?=
 =?us-ascii?Q?JlqcT8HTwhtj0yrRPapvBBnWOVbwff+sCENlPG3woqygfAIWDlpw5yNIkn2F?=
 =?us-ascii?Q?IRNol2SpoMp7Pf8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iVGP5W6kU25uU8IOZvIan8YMOkK4X+POFQ9t5w0TRYN7KYxpXgLojZ3zSuO9?=
 =?us-ascii?Q?i8H7Eu+cUyKZ0xBn97UKVM5CdiZEdQbjZT/OVHdvlkyK7x7MsunrXuvo4SI9?=
 =?us-ascii?Q?8r70qgDHyKxJ49fOgr3ctOXhA/gROwMXm2nsYz+uRvUtHvAuD4aP/jozJpgy?=
 =?us-ascii?Q?gcPsYRh/ZoO0EiIs/zSsq3uiFNFVbfpBBf+SHesPwJe8djL3jT9GN7ZU3M11?=
 =?us-ascii?Q?lSzxucC+Wyz8UOHGTDEwAhg2196tCTEQ2XUvlleT6flhkUXhat+jv4JZzpUj?=
 =?us-ascii?Q?4F+sc5+Y0o1rsUUw49vQf9LcqGbFfJHiIMcusj8EOjIx/0cNKuBoMP+TMHgI?=
 =?us-ascii?Q?lHWHZ1hEEYsO5sswD9JEc2VJMZGbYJT2KxgvMhbHdUmPJ5N5pOYApQyKZRMk?=
 =?us-ascii?Q?Gi2X47hMwf3B9vxnzkzItAamuDWdALZAYFQ+SV9eTfehg9qTs3JJaPWeBhrr?=
 =?us-ascii?Q?FNtqXjvES0kAFP1KocqoWwjJbQg6wASDa56ma4jcSx6hdWVvBWstMZod7vU3?=
 =?us-ascii?Q?H2Rp9Yx8cf2t2NcigcwgMdkaXPkBKBY3HSZB+5aOvwEUDrNfecs0RLT0/AhH?=
 =?us-ascii?Q?l+AjILg24S84dpAVp+fl69mzJmpPxJWVrA1fDOMfnGq4Q3U+e1/w/eVkSjk9?=
 =?us-ascii?Q?r99CenVtut2e4dX8llZ7UTZnQjovVlLzouszl/8IW+DWCz+NnZ0GUzRyRvqL?=
 =?us-ascii?Q?3EdhJrt0eNxHhkqzH8SJJKiSYE9Fs2hminWXfZGlj4MaeqgG9nIVtC+evRVd?=
 =?us-ascii?Q?k/UIg2l4YWsP0nbK+Q0/TV6b+kVD9kgegZCBEuQ4V62ZUCd+Of3vPrCOq/oH?=
 =?us-ascii?Q?VOegKs4TUtVOU8YGOCtwjMBJxN1+mn+xkVq4I3Gj5/TaP/4wND0PptN6ao5r?=
 =?us-ascii?Q?Dzj5EJH98tg7jSqzVnSohN6n9vggjsn1jPLGryQmsUqIHYZcZBhWUgw+twqT?=
 =?us-ascii?Q?MnYoxpw4yT6Z008C+KptOA191sfsMEDw6ntrhyL/msela8K7aLBBcGbulWf6?=
 =?us-ascii?Q?GbJ/uB7akQOlT7uQlYqP0+pr3znvojPSHNUrqxKuaV+On9iWaTgWr+iECO+w?=
 =?us-ascii?Q?JKa+GNRYAf+AmGcUL2JP+Cyhy8B/FvDDrF0obK1wCZLNYuvcFkie9FJD49k/?=
 =?us-ascii?Q?8WgLopuByWU+kB96lRclCOiBygy+6bShx0N+njtoCY9vdiR1SAh3SskwxuWW?=
 =?us-ascii?Q?F9jUsvQ+8vw+7wmFSQLEYDwOEqo/Ah27qjnhOy7WOHl/y3QQ/1lQUaa5dha+?=
 =?us-ascii?Q?dzsCrikA5YD+Tjl7J/MtQWhs7Ilq+k++N09Fy0T8pEfoVGChPn8UCSKXDhrR?=
 =?us-ascii?Q?Xjq/EHPEdKNvR+uWv3r3iEIc48MyUkfymWN72tmbRyyuKJ8F+3bTlz8KKu5s?=
 =?us-ascii?Q?ezpW4WxwhjSZfC2oOz72ymB9oNy90EIXfDpJSMv6ZR/IEgFEYguxLosIWQ56?=
 =?us-ascii?Q?cehn+q+62buc4WrgU6PzdrNB6ws3UDvST77ouKHSs7rTPVt/juGR0p69sCAO?=
 =?us-ascii?Q?MmUU80SmSNTJXJJP4BKCgksh6RzKk4whZR1whns2E/6drS+Rvf8r1owdIj9I?=
 =?us-ascii?Q?tLiT3NaL8MEMk1R9EBHAAT/3GiIYXnRhC2JFlQS5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52cb52fb-effe-4a5a-8925-08dda8a78f35
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 05:19:37.9569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BmAyMLzHVXtv/6gQF1mOLaz652oRinzHs6C8o2QmFN6L4FKXVxmOKziQlKCnbKw1HCqY4mpGfQbWMdlD+X1ucw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9622

On Tue, Jun 10, 2025 at 03:42:57AM +0000, Junhui Liu wrote:
>Hi Peng,
>Thanks for your review.
>
>On 09/06/2025 16:43, Peng Fan wrote:
>> On Sun, Jun 08, 2025 at 10:37:40AM +0800, Junhui Liu wrote:
>>>Add initial support for the C906L remote processor found in the Sophgo
>>>CV1800B SoC. The C906L is an asymmetric core typically used to run an
>>>RTOS. This driver enables firmware loading and start/stop control of the
>>>C906L processor via the remoteproc framework.
>>>
>>>The C906L and the main application processor can communicate through
>>>mailboxes [1]. Support for mailbox-based functionality will be added in
>>>a separate patch.
>>>
>>>Link: https://lore.kernel.org/linux-riscv/20250520-cv18xx-mbox-v4-0-fd4f1c676d6e@pigmoral.tech/ [1]
>>>Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>>>---
>>> drivers/remoteproc/Kconfig                |   9 ++
>>> drivers/remoteproc/Makefile               |   1 +
>>> drivers/remoteproc/sophgo_cv1800b_c906l.c | 233 ++++++++++++++++++++++++++++++
>>> 3 files changed, 243 insertions(+)
>>>
>>>diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>>>index 83962a114dc9fdb3260e6e922602f2da53106265..7b09a8f00332605ee528ff7c21c31091c10c2bf5 100644
>>>--- a/drivers/remoteproc/Kconfig
>>>+++ b/drivers/remoteproc/Kconfig
>>>@@ -299,6 +299,15 @@ config RCAR_REMOTEPROC
>>> 	  This can be either built-in or a loadable module.
>>> 	  If compiled as module (M), the module name is rcar_rproc.
>>> 
>>>+config SOPHGO_CV1800B_C906L
>>>+	tristate "Sophgo CV1800B C906L remoteproc support"
>>>+	depends on ARCH_SOPHGO || COMPILE_TEST
>>>+	help
>>>+	  Say y here to support CV1800B C906L remote processor via the remote
>>>+	  processor framework.
>>>+
>>>+	  It's safe to say N here.
>>>+
>>> config ST_REMOTEPROC
>>> 	tristate "ST remoteproc support"
>>> 	depends on ARCH_STI
>>>diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
>>>index 1c7598b8475d6057a3e044b41e3515103b7aa9f1..3c1e9387491cedc9dda8219f1e9130a84538156f 100644
>>>--- a/drivers/remoteproc/Makefile
>>>+++ b/drivers/remoteproc/Makefile
>>>@@ -33,6 +33,7 @@ obj-$(CONFIG_QCOM_WCNSS_PIL)		+= qcom_wcnss_pil.o
>>> qcom_wcnss_pil-y			+= qcom_wcnss.o
>>> qcom_wcnss_pil-y			+= qcom_wcnss_iris.o
>>> obj-$(CONFIG_RCAR_REMOTEPROC)		+= rcar_rproc.o
>>>+obj-$(CONFIG_SOPHGO_CV1800B_C906L)	+= sophgo_cv1800b_c906l.o
>>> obj-$(CONFIG_ST_REMOTEPROC)		+= st_remoteproc.o
>>> obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+= st_slim_rproc.o
>>> obj-$(CONFIG_STM32_RPROC)		+= stm32_rproc.o
>>>diff --git a/drivers/remoteproc/sophgo_cv1800b_c906l.c b/drivers/remoteproc/sophgo_cv1800b_c906l.c
>>>new file mode 100644
>>>index 0000000000000000000000000000000000000000..f3c8d8fd4f796d0cf64f8ab0dd797e017b8e8be7
>>>--- /dev/null
>>>+++ b/drivers/remoteproc/sophgo_cv1800b_c906l.c
>>>@@ -0,0 +1,233 @@
>>>+// SPDX-License-Identifier: GPL-2.0-or-later
>>>+/*
>>>+ * Copyright (C) 2025 Junhui Liu <junhui.liu@pigmoral.tech>
>>>+ */
>>>+
>>>+#include <linux/mfd/syscon.h>
>>>+#include <linux/module.h>
>>>+#include <linux/of_device.h>
>>>+#include <linux/of_reserved_mem.h>
>>>+#include <linux/platform_device.h>
>>>+#include <linux/remoteproc.h>
>>>+#include <linux/reset.h>
>>>+#include <linux/regmap.h>
>>>+
>>>+#include "remoteproc_internal.h"
>>>+
>>>+#define CV1800B_SYS_C906L_CTRL_REG	0x04
>>>+#define   CV1800B_SYS_C906L_CTRL_EN	BIT(13)
>> 
>> Align the format.
>> 
>> '#include <linux/bits.h>' should be added for BIT
>> 
>
>Will do in v2.
>
>>>+
>>>+#define CV1800B_SYS_C906L_BOOTADDR_REG	0x20
>>>+
>>>+/**
>>>+ * struct cv1800b_c906l - C906L remoteproc structure
>>>+ * @dev: private pointer to the device
>>>+ * @reset: reset control handle
>>>+ * @rproc: the remote processor handle
>>>+ * @syscon: regmap for accessing security system registers
>>>+ */
>>>+struct cv1800b_c906l {
>>>+	struct device *dev;
>>>+	struct reset_control *reset;
>>>+	struct rproc *rproc;
>>>+	struct regmap *syscon;
>>>+};
>>>+
>>>+static int cv1800b_c906l_mem_alloc(struct rproc *rproc,
>>>+				   struct rproc_mem_entry *mem)
>>>+{
>>>+	void *va;
>>>+
>>>+	va = ioremap_wc(mem->dma, mem->len);
>>>+	if (IS_ERR_OR_NULL(va))
>> 
>> Use "if (!va)"?
>
>Will do in v2.
>
>> 
>>>+		return -ENOMEM;
>>>+
>>>+	/* Update memory entry va */
>>>+	mem->va = va;
>>>+
>>>+	return 0;
>>>+}
>>>+
>>>+static int cv1800b_c906l_mem_release(struct rproc *rproc,
>>>+				     struct rproc_mem_entry *mem)
>>>+{
>>>+	iounmap(mem->va);
>>>+
>>>+	return 0;
>>>+}
>>>+
>>>+static int cv1800b_c906l_add_carveout(struct rproc *rproc)
>>>+{
>>>+	struct device *dev = rproc->dev.parent;
>>>+	struct device_node *np = dev->of_node;
>>>+	struct of_phandle_iterator it;
>>>+	struct rproc_mem_entry *mem;
>>>+	struct reserved_mem *rmem;
>>>+
>>>+	/* Register associated reserved memory regions */
>>>+	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
>>>+	while (of_phandle_iterator_next(&it) == 0) {
>>>+		rmem = of_reserved_mem_lookup(it.node);
>>>+		if (!rmem) {
>>>+			of_node_put(it.node);
>>>+			return -EINVAL;
>>>+		}
>> 
>> Is there a need to handle vdev0buffer?
>
>I'll exclude it.
>
>> 
>>>+
>>>+		mem = rproc_mem_entry_init(dev, NULL, (dma_addr_t)rmem->base,
>>>+					   rmem->size, rmem->base,
>>>+					   cv1800b_c906l_mem_alloc,
>>>+					   cv1800b_c906l_mem_release,
>>>+					   it.node->name);
>>>+
>>>+		if (!mem) {
>>>+			of_node_put(it.node);
>>>+			return -ENOMEM;
>>>+		}
>>>+
>>>+		rproc_add_carveout(rproc, mem);
>>>+	}
>>>+
>>>+	return 0;
>>>+}
>>>+
>>>+static int cv1800b_c906l_prepare(struct rproc *rproc)
>>>+{
>>>+	struct cv1800b_c906l *priv = rproc->priv;
>>>+	int ret;
>>>+
>>>+	ret = cv1800b_c906l_add_carveout(rproc);
>>>+	if (ret)
>>>+		return ret;
>>>+
>>>+	/*
>>>+	 * This control bit must be set to enable the C906L remote processor.
>>>+	 * Note that once the remote processor is running, merely clearing
>>>+	 * this bit will not stop its execution.
>>>+	 */
>>>+	return regmap_update_bits(priv->syscon, CV1800B_SYS_C906L_CTRL_REG,
>>>+				  CV1800B_SYS_C906L_CTRL_EN,
>>>+				  CV1800B_SYS_C906L_CTRL_EN);
>>>+}
>>>+
>>>+static int cv1800b_c906l_start(struct rproc *rproc)
>>>+{
>>>+	struct cv1800b_c906l *priv = rproc->priv;
>>>+	u32 bootaddr[2];
>>>+	int ret;
>>>+
>>>+	bootaddr[0] = lower_32_bits(rproc->bootaddr);
>>>+	bootaddr[1] = upper_32_bits(rproc->bootaddr);
>>>+
>>>+	ret = regmap_bulk_write(priv->syscon, CV1800B_SYS_C906L_BOOTADDR_REG,
>>>+				bootaddr, ARRAY_SIZE(bootaddr));
>>>+	if (ret)
>>>+		return ret;
>>>+
>>>+	return reset_control_deassert(priv->reset);
>>>+}
>>>+
>>>+static int cv1800b_c906l_stop(struct rproc *rproc)
>>>+{
>>>+	struct cv1800b_c906l *priv = rproc->priv;
>>>+
>>>+	return reset_control_assert(priv->reset);
>>>+}
>>>+
>>>+static int cv1800b_c906l_parse_fw(struct rproc *rproc,
>>>+				  const struct firmware *fw)
>>>+{
>>>+	int ret;
>>>+
>>>+	ret = rproc_elf_load_rsc_table(rproc, fw);
>>>+	if (ret == -EINVAL) {
>>>+		dev_info(&rproc->dev, "No resource table in elf\n");
>>>+		ret = 0;
>>>+	}
>>>+
>>>+	return ret;
>>>+}
>>>+
>>>+static const struct rproc_ops cv1800b_c906l_ops = {
>>>+	.prepare = cv1800b_c906l_prepare,
>>>+	.start = cv1800b_c906l_start,
>>>+	.stop = cv1800b_c906l_stop,
>>>+	.load = rproc_elf_load_segments,
>>>+	.parse_fw = cv1800b_c906l_parse_fw,
>>>+	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
>>>+	.sanity_check = rproc_elf_sanity_check,
>>>+	.get_boot_addr = rproc_elf_get_boot_addr,
>> 
>> Seems your setup does not support attach mode, so better add
>> attach hook and return -ENOTSUPP?
>
>I checked the remoteproc framework code and found that the attach
>function will only be called when 'rproc->state == RPROC_DETACHED', and
>it seems that rproc->state will not be set to RPROC_DETACHED unless I do
>so explicitly in the driver or an implemented detach function is called,
>neither of which happens in this driver.
>
>Given this, do we still need to add an attach hook even though it will
>not be called in practice?

There is no need, I overlooked RPROC_DETACHED

Regards,
Peng
