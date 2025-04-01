Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2058.outbound.protection.outlook.com [40.107.22.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055293FC7;
	Tue,  1 Apr 2025 00:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743467597; cv=fail; b=b856GpZXgMhhSw21YdFS6qaxf5ifvKbISSzuC1u0xZzMU1lZ4QvTO9silnYygttTVsG+Yi52S3aTsyHFHZKTeOwHFl+ak1DhnnAcuXnukdMIKIyNY75yZ4vH7MmjBBH04eH+25w1NFmlpbPBDAEHiG5P9xmiERcGANeoqir8W70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743467597; c=relaxed/simple;
	bh=pQ80ldbud2eQy4Yc91oHmVMLdPeCyDVIuVsCh32RlDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YQy9ALoSKPbBNNbJXiVa27l4kNjVIV4AnwJ0CyP/ACD7lBdPDLRyhezcUHMPojjIMuPOZF06nT9Xe3NV95dQOq7z1xPuOKEocV+IPloinBjr32DdzPjtKObq01X441ILvGKLYztWJ+F761v0aebpgTYydDUqjHqDYGxcZPXlIgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eKKLBlRM; arc=fail smtp.client-ip=40.107.22.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eKKLBlRM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IGMvosaFLPSHY50lz/vaA6noqpxqbbqrd/iiEezWAbjbRCBQZiSl7K9BBWW4iuLqNSs5sPewkcUtsWicjp37HIVykjkHMZdwNHaAQzHjy+gKBo5EiA1mOrzjek1QRhC9zHNLnqfjDd+Ytv/DlD04BzWBqS/VQbaD1W6iMg6MqEV2d7PEDlzqZ32Y9IIkNw3S74oyV0+DKpMeTWPG+bJvvcfZ/sSppjBDR5EGdix4KWgLQz6ibCPG/v/aJSRbP3ZLwAUQUe+psQZ0WpQ01IKACia1zsJPJaqPgYDCpG9bAL1jPuW6Kz2C9Fe5u5hXcKM6v3qhc/eCUaEO6VCb1jG/xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=acbN7Vat7CdQojtxLVqJfRRkOIEX62mLRqm9V7lnnLE=;
 b=wifjuJYVaqM4PRpFZ9DuP3rYDwvYkxv4cbPUxEnvW8DrrEeygi0BAiuniBm9Qgv2cvpH6WFQFhp6X60pPi/hFz3y4Pc6sZzDTywStbUzB913G7tkqKuqA8nTCAVxfdsycYP6AWNH5/Hk4C+I5u5VPQA7GekvlcaXaFs7VAMQDmWkmIUZcXKhMfgQbHrcEL2vU2MZxtxOaegmposH4RVLl77O+u8cHgweh1qc9+D1w2ICe2Slgy7IX70NHYTKsyOKYvqiS+sfn4eTAmbZZf/TFOGWJGHVSbX/0uzZBysCIAhjwirfdxXXgnb5U4F3brkcyPlpAdEty/8Eg3wlIZXo6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=acbN7Vat7CdQojtxLVqJfRRkOIEX62mLRqm9V7lnnLE=;
 b=eKKLBlRMQTy2zHFNmKitjVvDpKziWPPqcllPCUIB9nmAMGJ95fz8+d9ot9DGvvtUIh339lWjd/6i89wf4mZJf11X9mcg7gFOPP/tXBseFKJd38Mos7jmiUvinFKgQrqqVqjTqyZSqhiOKFgiMHmbrbVoQKCuv6LBtH2O23boVhRpHHHjRADBCcwNcEbpwaxdImgBZjE22NeZ5VrC1r3WPCQeYBWrwnCUJdKZ9uCOF1n0ByKGNsI/CC+0AOZEc140Bk95R0ormO5WF8GPtzlbv9osrdjNQz8SbscslinJhhZaxPXxAcdG41GAyDR3YFS4yqBfFD/oazXS3nmxl7VNcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB11063.eurprd04.prod.outlook.com (2603:10a6:150:20c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Tue, 1 Apr
 2025 00:33:10 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 00:33:10 +0000
Date: Tue, 1 Apr 2025 09:41:24 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Arnaud Pouliquen <arnaud.pouliquen@st.com>,
	"open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2] remoteproc: core: Clear table_sz when rproc_shutdown
Message-ID: <20250401014124.GB15525@nxa18884-linux>
References: <20250326020215.3689624-1-peng.fan@oss.nxp.com>
 <Z-WO-fhDJKyG7hn2@p14s>
 <20250328045012.GA16723@nxa18884-linux>
 <Z-au0USkvoDYTF7A@p14s>
 <20250329125629.GA11929@nxa18884-linux>
 <Z-q3ebPSjkSPVlgP@p14s>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-q3ebPSjkSPVlgP@p14s>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR02CA0119.apcprd02.prod.outlook.com
 (2603:1096:4:92::35) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB11063:EE_
X-MS-Office365-Filtering-Correlation-Id: c485e4e4-968c-461f-6905-08dd70b4c785
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jxwxtTyRnKoj1DYsklskJsWgt4e2ZZxu3RJMSLMQMCoVgvdHL8oPaQBsFh1z?=
 =?us-ascii?Q?6bkHhJ6jWdc1qWQHKU+CoR9i98mZh+46Gl3S9A00r5vCag9jJT0CeRe8CBt9?=
 =?us-ascii?Q?QpkwOVhUCRxK9PiPvmBfvgxi+Jhax1k581AkesucinnRoPCFv5H8ro5xXSos?=
 =?us-ascii?Q?CwbxP2QohEKahFl/0YANynfwzR2rMgCklF3is1VLJPuVZVc07iN5y1LUYH74?=
 =?us-ascii?Q?INuY+B0oHwKGn17AxQ1BDzN/vLvaV6/xaagNdXCJTMD6cc9WL+H07g0rci1r?=
 =?us-ascii?Q?qPJlETzaI9ix5GmPW+FE5dhxVOMNSfjR6M9uzc7CX7ATNeqmdlazhluMJIIK?=
 =?us-ascii?Q?qObXYkcA5davDYQqF9R6GBWR4v1/m9AyJyzFG0nzjhyOhhTXm8N9a9iwpsG3?=
 =?us-ascii?Q?jSG+AiRx6JuXmOlm+Wx0ZSIzkb1hrKLR8RlNR/IqT2wKtdtUDYBupg9oRqBw?=
 =?us-ascii?Q?We4OLEkuHZWLRNfg5frCXR7oRvrud0TF4kJR69E0gtgsKqlvMMvPCTA9J0l5?=
 =?us-ascii?Q?yL4pT5eSgx0yE6Q7ojumVN++/1HgYoPZXrV5ZaYQLgd+dxHHPGMKNHzLBG7w?=
 =?us-ascii?Q?s1UVzenxBXTzHZL75zw9N+9a4VpxfqCdpIZ5cBKhCXdpk6W1HsO7UFRekUOw?=
 =?us-ascii?Q?TDAXJXImP1pXO+BwDzFjm6cpNu3zipyKpiLbsoTjx6mVfr6z4HaQefJC8tnq?=
 =?us-ascii?Q?H74JUqT4zosixaquOb4y5pTvg2bip2vezPWMcBC1tPIbahUBPV380/7LEhDT?=
 =?us-ascii?Q?+qiwK1vn2Nhj/gCzdRQzS7q2rF4glhucYf08wTvnkmtJbOSZ9Ic7k9jjFFZq?=
 =?us-ascii?Q?wLCTSgXei7V3eIGowIUHa0ex4FlxK97K9/rLQ8mdyjwRoJmnr54dyat5YijM?=
 =?us-ascii?Q?bcuLARwf3CF+HZG17G5YB1GoU0M9a5PvTFHBjqy+tykBaZjS2NiovwSVCvcc?=
 =?us-ascii?Q?beTMBdHjHsWUxf6gTlNYm37F31moowEBV3XRi74RCFSqvrUv2tqm0qn1q1LS?=
 =?us-ascii?Q?mjkiJIqm/FMIJWgP0F1M/gICDyzBf+9htt7v+jMsMRbMqyyHszdYtgV5aa6D?=
 =?us-ascii?Q?HLuxo0b21qChR8kSpJjrnrS09gJUiVxiFTLnHQzTwdTx8uZgTiteQkyUoJPl?=
 =?us-ascii?Q?0PV2DebehzkSnaBAM4N88mWPuw6INqUMKIhiGG3wT3QYuXI1ApHkAwaYs4ir?=
 =?us-ascii?Q?w6Oe0aeDsSyOv9DbvKJ9qKTh6ir5k8XMCm0F41In9lCoJ1K0weABsc65Y09c?=
 =?us-ascii?Q?O3xHY1NQZ579SXd3UBstF5VxExx5w0HmBFzbWwVUdxPJyGBHTN8zWYwu2txJ?=
 =?us-ascii?Q?rErYkqStnbU8Zr6rp15ArsLnI6a3kdwhaZOLz11b781yXwcbocvUfyh5SEoP?=
 =?us-ascii?Q?BaV4ouUUURiWsFMAfUhpjWCChSQgdkoUg6x+1797VHRWbR7HWg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6bogvpQAvnqLX9plxCmurgBrCfv/nqC93yw5ppbeb0OH8ebN07nTrfb6acr5?=
 =?us-ascii?Q?6ItQGzGjkVFYnqCqui2JreE6MY8nc7BvgphfrXpxrtfMj4HUz3lmhfPqFY+S?=
 =?us-ascii?Q?qIzogR+WJe5l6bDnlgPSuwaA3JfWGtF2PoSJc0YdpyY0HHKZbz/Sgs1QIBWj?=
 =?us-ascii?Q?VYaYa0kzHX+S7IoWEcHFn5tLMF3n+9gCHILkul7TUneHSnmZ9oqWKbXkL5Ju?=
 =?us-ascii?Q?jaGqWXw0JfBB0bGJfxF1EFrZmQiL3xYULi9PV5TYM2i/SmqKut0iJh8cSu06?=
 =?us-ascii?Q?5GpdDiurrf7c6bUKYS0kJDQB4PwMx4u+1MO+C/XYRJ96aQqGqxOwmEt2/gCo?=
 =?us-ascii?Q?6ZV42f/cmTPYLFpAIWaDaaOT+c6uIhaqrs0/U8+fIjzm1SSAO5N4sOLZK6kD?=
 =?us-ascii?Q?IHP2e5irUaIDrrR+MiPXwZN24uzQZoGWGGEBpYdPHcsQ6GX/fvvaZzWE2bI/?=
 =?us-ascii?Q?L4zGKmMYivmi4z/gF/9yDMPrWn++lTfCU+jcBgWd31V+qWRYkoXLpgH1EuTH?=
 =?us-ascii?Q?pC6iSaVDq4UVxu1RZKh/GRtNRsdAMPME5eQ+tCDBEx+4FjqnCaXIeE305Yi0?=
 =?us-ascii?Q?SrBQYbB97tSTdQa7zDklgBSrJgjLAiWAdR04Ik9MfbzlL3velA89LWLpWEgL?=
 =?us-ascii?Q?hjcJTqnYTPGYMth5d3Iij6M6nQs+R3ajadqTW3hIoZCBJ3PLIabpN8i7dRLJ?=
 =?us-ascii?Q?w2yrdBBXS6gvp5g39pZvQNAyjfWmbQbj/w2kgLd8efXFPtHYSBcBohB1Ei1n?=
 =?us-ascii?Q?IaRUzX6l0iM5pqYEg+1OYbemlXrAiMbWxvTMJENE2DuFB0s9VKixcbrjC+4S?=
 =?us-ascii?Q?B8mMJM1eSeSDgEf3kcf6KdOgW2VW/3KtP/XjdlSjGbwGCR7+f75v9sifhUdi?=
 =?us-ascii?Q?OKNjO+EZhxT/80dqJCd3neHm70fkYS6ETAikTG2zlIeXL0w9P716+1JHfBZm?=
 =?us-ascii?Q?N2uDy4MnuSgTgObVl8Jgyohd70t4YxaByfSqkgi14ljatB4LUlAX2TAuo1sC?=
 =?us-ascii?Q?zQj3QBfLlO/C4Ocqg3qPLJcLfg1R/BIApXFsXhHoqC8vA8IqsQV5Fn0rFQp2?=
 =?us-ascii?Q?vQFhNrh/pQZ3S75XyjkpF+rF80rVJ4WzgzdJzId3Ev705qLPxpbJel38OKUu?=
 =?us-ascii?Q?Osx7LTaoXEOhnuNAkQ6blksv/7CS9/O6fbU5wjCzF0x5zTRMnbVReolPfVJW?=
 =?us-ascii?Q?PiCfgS+rfJi4qMuE8DP/Wjk89GEvjD0oGuhYS4i+HcI33zaNxEABbpRqe7kA?=
 =?us-ascii?Q?161gXlVisp99YUS68dhD3Q61MyTM5Czg0QeCGJpOHJbYxlE0sB7mfAI8ZYPJ?=
 =?us-ascii?Q?rcpBKE4FWonQxu5v0/chs7OW99gN5q8qqUnEqy96ZzoRjFlTp50j4ztAHxks?=
 =?us-ascii?Q?LSdlurbbHZUmkPkJD7r34ACY1Gk0O1kgar9etdyMjLJ2MhJB9Bw2xsbC2rMx?=
 =?us-ascii?Q?dW1zpNMPFCnlKHiPkqUpk2vE0k/Nt3ShJce1oiFHXTGC6rjKXJxdFnZv+Eq1?=
 =?us-ascii?Q?sopf/SlUSJJKfKEKFwSr3kRJ1UMlVaCiawWw1P6EAcIfOqSkib2kkpfFPpKr?=
 =?us-ascii?Q?V3N8odkox4qprIZZ9YgNgmlcnAQOvYOFrVzNfiCR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c485e4e4-968c-461f-6905-08dd70b4c785
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 00:33:10.4914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gG2ZtH6I6Pj7HZDfHJC/ZCiuGqvfriimcGfYABGFs6Hd0tIQjVKUzUcWr/qsX7qLMDcfltMZX+6AfkbLSTT0tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11063

On Mon, Mar 31, 2025 at 09:40:41AM -0600, Mathieu Poirier wrote:
>On Sat, Mar 29, 2025 at 08:56:29PM +0800, Peng Fan wrote:
>> On Fri, Mar 28, 2025 at 08:14:41AM -0600, Mathieu Poirier wrote:
>> >On Fri, Mar 28, 2025 at 12:50:12PM +0800, Peng Fan wrote:
>> >> On Thu, Mar 27, 2025 at 11:46:33AM -0600, Mathieu Poirier wrote:
>> >> >Hi,
>> >> >
>> >> >On Wed, Mar 26, 2025 at 10:02:14AM +0800, Peng Fan (OSS) wrote:
>> >> >> From: Peng Fan <peng.fan@nxp.com>
>> >> >> 
>> >> >> There is case as below could trigger kernel dump:
>> >> >> Use U-Boot to start remote processor(rproc) with resource table
>> >> >> published to a fixed address by rproc. After Kernel boots up,
>> >> >> stop the rproc, load a new firmware which doesn't have resource table
>> >> >> ,and start rproc.
>> >> >>
>> >> >
>> >> >If a firwmare image doesn't have a resouce table, rproc_elf_load_rsc_table()
>> >> >will return an error [1], rproc_fw_boot() will exit prematurely [2] and the
>> >> >remote processor won't be started.  What am I missing?
>> >> 
>> >> STM32 and i.MX use their own parse_fw implementation which allows no resource
>> >> table:
>> >> https://elixir.bootlin.com/linux/v6.13.7/source/drivers/remoteproc/stm32_rproc.c#L272
>> >> https://elixir.bootlin.com/linux/v6.13.7/source/drivers/remoteproc/imx_rproc.c#L598
>> >
>> >Ok, that settles rproc_fw_boot() but there is also rproc_find_loaded_rsc_table()
>> >that will return NULL if a resource table is not found and preventing the
>> >memcpy() in rproc_start() from happening:
>> >
>> >https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/remoteproc_core.c#L1288
>> 
>> 
>> Sorry, I forgot to mention below code:
>> loaded_table is a valid pointer for i.MX, see
>> https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/imx_rproc.c#L666,
>
>(SIGH)
>
>The changelong for this patch says "... load a new firmware which doesn't have a
>resource table..." and now you are telling me that @load_table is valid.  As
>such I have to _guess_ that @priv->rsc_table is not null.  So which is it -
>valid or not valid?  

As wrote in commit log, bootloader kicks the m7 and m7 publishes a valid
resource table to a fixed address.

When linux boots up, first stop m7, then load a new firmware which does not
have resource table, then stop m7.

Even the new firmware does not have resource table, the imx_rproc driver
still returns a valid resource table address which is got from device tree
(rsrc_table) in imx DTS when the driver probe.

@priv->rsc_table is always valid even the firwmare does not have a valid
resource table. The TCM area is not writeable by Linux, so the firmware will
copy the resource table from TCM to DDR if the firmware has a resource table.

Hope this is clear.

>
>If my assumption above is valid than fix that instead of hacking the remoteproc
>core.

I just found V1 was picked up by Bjorn.
It is not hack, clearing table_sz in core code does not hurt, I think.

If my assumption is not valid the changelog and your justification for
>this patch are wrong.  Either way I have spent way too much time on this patch
>already and dropping it.  The same goes for your other patch [1] - resent it
>when you will have properly address the work herein.   

sure.

Thanks,
Peng

>
>[1]. [PATCH] remoteproc: imx_rproc: Add mutex protection for workqueue
>
>> 
>> So loaded_table is valid, it is memcpy trigger kernel panic because table_sz is
>> not zero while cached_table is NULL.
>> 	loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
>> 	if (loaded_table) {
>> 		memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
>> 		rproc->table_ptr = loaded_table;
>> 	}
>> 
>> Thanks,
>> Peng
>> 
>> >
>> >> 
>> >> Thanks,
>> >> Peng
>> >> 
>> >> >
>> >> >[1]. https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/remoteproc_elf_loader.c#L338
>> >> >[2]. https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/remoteproc_core.c#L1411 
>> >> >
>> >> >> When starting rproc with a firmware not have resource table,
>> >> >> `memcpy(loaded_table, rproc->cached_table, rproc->table_sz)` will
>> >> >> trigger dump, because rproc->cache_table is set to NULL during the last
>> >> >> stop operation, but rproc->table_sz is still valid.
>> >> >> 
>> >> >> This issue is found on i.MX8MP and i.MX9.
>> >> >> 
>> >> >> Dump as below:
>> >> >> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
>> >> >> Mem abort info:
>> >> >>   ESR = 0x0000000096000004
>> >> >>   EC = 0x25: DABT (current EL), IL = 32 bits
>> >> >>   SET = 0, FnV = 0
>> >> >>   EA = 0, S1PTW = 0
>> >> >>   FSC = 0x04: level 0 translation fault
>> >> >> Data abort info:
>> >> >>   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
>> >> >>   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>> >> >>   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>> >> >> user pgtable: 4k pages, 48-bit VAs, pgdp=000000010af63000
>> >> >> [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
>> >> >> Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
>> >> >> Modules linked in:
>> >> >> CPU: 2 UID: 0 PID: 1060 Comm: sh Not tainted 6.14.0-rc7-next-20250317-dirty #38
>> >> >> Hardware name: NXP i.MX8MPlus EVK board (DT)
>> >> >> pstate: a0000005 (NzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> >> >> pc : __pi_memcpy_generic+0x110/0x22c
>> >> >> lr : rproc_start+0x88/0x1e0
>> >> >> Call trace:
>> >> >>  __pi_memcpy_generic+0x110/0x22c (P)
>> >> >>  rproc_boot+0x198/0x57c
>> >> >>  state_store+0x40/0x104
>> >> >>  dev_attr_store+0x18/0x2c
>> >> >>  sysfs_kf_write+0x7c/0x94
>> >> >>  kernfs_fop_write_iter+0x120/0x1cc
>> >> >>  vfs_write+0x240/0x378
>> >> >>  ksys_write+0x70/0x108
>> >> >>  __arm64_sys_write+0x1c/0x28
>> >> >>  invoke_syscall+0x48/0x10c
>> >> >>  el0_svc_common.constprop.0+0xc0/0xe0
>> >> >>  do_el0_svc+0x1c/0x28
>> >> >>  el0_svc+0x30/0xcc
>> >> >>  el0t_64_sync_handler+0x10c/0x138
>> >> >>  el0t_64_sync+0x198/0x19c
>> >> >> 
>> >> >> Clear rproc->table_sz to address the issue.
>> >> >> 
>> >> >> While at here, also clear rproc->table_sz when rproc_fw_boot and
>> >> >> rproc_detach.
>> >> >> 
>> >> >> Fixes: 9dc9507f1880 ("remoteproc: Properly deal with the resource table when detaching")
>> >> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> >> >> ---
>> >> >> 
>> >> >> V2:
>> >> >>  Clear table_sz when rproc_fw_boot and rproc_detach per Arnaud
>> >> >> 
>> >> >>  drivers/remoteproc/remoteproc_core.c | 3 +++
>> >> >>  1 file changed, 3 insertions(+)
>> >> >> 
>> >> >> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> >> >> index c2cf0d277729..1efa53d4e0c3 100644
>> >> >> --- a/drivers/remoteproc/remoteproc_core.c
>> >> >> +++ b/drivers/remoteproc/remoteproc_core.c
>> >> >> @@ -1442,6 +1442,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>> >> >>  	kfree(rproc->cached_table);
>> >> >>  	rproc->cached_table = NULL;
>> >> >>  	rproc->table_ptr = NULL;
>> >> >> +	rproc->table_sz = 0;
>> >> >>  unprepare_rproc:
>> >> >>  	/* release HW resources if needed */
>> >> >>  	rproc_unprepare_device(rproc);
>> >> >> @@ -2025,6 +2026,7 @@ int rproc_shutdown(struct rproc *rproc)
>> >> >>  	kfree(rproc->cached_table);
>> >> >>  	rproc->cached_table = NULL;
>> >> >>  	rproc->table_ptr = NULL;
>> >> >> +	rproc->table_sz = 0;
>> >> >>  out:
>> >> >>  	mutex_unlock(&rproc->lock);
>> >> >>  	return ret;
>> >> >> @@ -2091,6 +2093,7 @@ int rproc_detach(struct rproc *rproc)
>> >> >>  	kfree(rproc->cached_table);
>> >> >>  	rproc->cached_table = NULL;
>> >> >>  	rproc->table_ptr = NULL;
>> >> >> +	rproc->table_sz = 0;
>> >> >>  out:
>> >> >>  	mutex_unlock(&rproc->lock);
>> >> >>  	return ret;
>> >> >> -- 
>> >> >> 2.37.1
>> >> >> 
>> >> >
>> >
>
