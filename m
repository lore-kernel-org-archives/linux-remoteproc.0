Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2045.outbound.protection.outlook.com [40.107.21.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E75729A5;
	Sat, 29 Mar 2025 11:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743248913; cv=fail; b=moeh7SG7Pb+PCzEjrvXvKsA+7UUjmY2B+uuSxzCQ0C1VDTh3EmB4TKPpTxX9Tdq81GDr630jMV4KVCofw4lc5RZhv4aA5OI9nOQZ75UvfAmBojV1EQ4wklN31IUFGPvSrkrnGJ/PqUjwa/i5apCZZtkvh3FO/y6Qkjz3NwThWpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743248913; c=relaxed/simple;
	bh=5nP3PJ+xpko1/gDlx7V5m++Nu20mCwlbYIVVYw0LOlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ra+ExbqAidXxjKP1d4X3L1OSLt5Dzxq2dOMF2m4lToVMe7MoH1MH6YS5tq6Q3YYqfsrsrXXzRPaAAaU+FpceOGECwcpEwn5tvjx/v52zAoBlxoS09B8yrfBHBccB34Ua0GLUIc7cnePP4D+wrJQypirRxQt+vGQygfd55amFtUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=B4aij5H2; arc=fail smtp.client-ip=40.107.21.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="B4aij5H2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dRlU+Voe6Qvm7S7O9aerFm4QI1GStxTjlKghQcAwYle+tNfaYqCrDC8LKk8No3+L1OVtP11zUU4w3fkNYbsOeJSMXmx/D2gZxxuTcIWu634dEm5jzZmyiO6m0+ki2nfEJ8Msg6avhCapyiCjoRHhQAcWeNN3A1+7c883u6YkLC+NUGkmGoa1+7f3nGV0gYDjLu5UUWa9bnEk0UHV09hT0jZ+YlmSkhqXs9bDcwzHL7Q64Xm/LuAOiHgDOPGhaR6yDgWohX/sX8rR6sRQsHrayqSeI2TEytnk1xdrFU84bEcnjt31DNvI8yYErVzTckCXjosxiF9bLsEVT/T9mc9NnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nN6z9AoWAq6yMExOCEuJ7vjrFtLxb7lFYJfIOPwyG/A=;
 b=NXnz4AkpL+5qpgyFUOB8YEt3pEbngBNMdysm/c5jgFGPuoWnZpNaK5zwds3m4OnYTqLitNGZkDr9i1i148GRbut2bxKRm7YrWd5OIM+507P5GIrhDbY8a7yhTK+n0vNDv58z73/6TwouRKPBOadOJa+TR3UofHzrKqEzmi3zDsM7UDPwUDRkkpjB0bQ5hBc0fAhREgn11HP2vJfBGUzcXTt+ZVMBKupWL0OgrlQTbQFdgueRdTieTXsPMQCDaTlDTMHgtisay1ZJXw32YKHcPoNfOPRy+g+7Is51FrkFDdOw65/LG4o1dee0sUiBoAGNHUatAB2Q0uAonHgOForN1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nN6z9AoWAq6yMExOCEuJ7vjrFtLxb7lFYJfIOPwyG/A=;
 b=B4aij5H27xleqf8VDhBIrx+2n87zR5w7ypHwFcj3d6Mr6kgsAv/B46d2DOik6ewr8Yd0BjdJm36wDRQ+Ca/QF+Cv7kAinVXY7751/qwOdzW9ejrlegNvJtvu/vB7OzvkrhnQeqPVKAZf5yO6ZeHusoWjVhhbZzgI5EcewqkN/AYftZrkC/Jk7e2uscqAh52Bp6f5nPGze3XZxNDcs7YHYoKVH0WZoTPavQ1pq8EpGRHL68UBUR4A58c6L3tZ5XbgIEk6uzN5vn7aopF8U9W1sKZFVhMWJfpM8SQTZDwDBfO5n/orWo3hWhqj+0Fyrc5acGBvPiSL3xyur4eSvllDuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8304.eurprd04.prod.outlook.com (2603:10a6:102:1bc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Sat, 29 Mar
 2025 11:48:28 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8534.040; Sat, 29 Mar 2025
 11:48:27 +0000
Date: Sat, 29 Mar 2025 20:56:29 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Arnaud Pouliquen <arnaud.pouliquen@st.com>,
	"open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2] remoteproc: core: Clear table_sz when rproc_shutdown
Message-ID: <20250329125629.GA11929@nxa18884-linux>
References: <20250326020215.3689624-1-peng.fan@oss.nxp.com>
 <Z-WO-fhDJKyG7hn2@p14s>
 <20250328045012.GA16723@nxa18884-linux>
 <Z-au0USkvoDYTF7A@p14s>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-au0USkvoDYTF7A@p14s>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SGXP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::14)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8304:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d618211-9af5-49a3-2b57-08dd6eb79c10
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6ROrwn8Rng/LomxjmxlQ1tsBPoJllL62UrsD6I/okg6cZlAHIZ2YDXQtjNRy?=
 =?us-ascii?Q?LLpffq5s0aZbDdM4Af2X7zbT/5/q6eSMras0Wb3N3OREqQYZA/I4ck0cditV?=
 =?us-ascii?Q?4I0KEGtcnOOS38i3gW1SUUv/mq1KOe3HI+ysfprPQBtl9MEi4kH/xegEcrNl?=
 =?us-ascii?Q?aSEsjUlDTR1nXaig0lLeOrfcX4rDrt2WP39VcQMeojXIscQ+TtclC/3l5Jt8?=
 =?us-ascii?Q?02vv0TQaA8hDWkDPVcmmvFoJfGHB7ulkcLGy5XhDsIBwIHhkX+5QVuV2fwMK?=
 =?us-ascii?Q?+wMi1BkrTYkZVERwjOpHUqENOACv1lMLRIHtJb0ylaAMwwFkr3+x/4FFbXfp?=
 =?us-ascii?Q?0gsc3Wh7K32aDyfQRYc8twdudqZn02L7wFKPpGzIOJ/V8gv9luX+s7fulJAF?=
 =?us-ascii?Q?sTEwAz6eVC4pU9kEwYJ8J1qwxFzPWBkKgj0v7UZf/h1Fz13p10I5+tshwmCq?=
 =?us-ascii?Q?e6JFJXRzh0tsp+DiWUHtEIDoPSMQ+37LSFlI1g1AC0MAHHqVOFzMkenwNwWi?=
 =?us-ascii?Q?BbNXQfuzUEZLo5QGbP3qurrO7EXi4Uma0LJTg9vFEsULYPZOGdmd74/WLqoN?=
 =?us-ascii?Q?7JZdhimDF3C1j6TZS9xN3hfsrqpkgTRX5FQN3ruMWOZkfJjdrveR9ouFnaGQ?=
 =?us-ascii?Q?KxJlXe9beKKAuXP3VgXEqdaZ8PhGXXGJFY64JrFXoKtUkXQ8K5DKe84uBhID?=
 =?us-ascii?Q?NajEYwZGaBpeVyin6y20nn6zGRKDRDlPhXnpeDk8wuPItOd1HKfwTD/WKqXt?=
 =?us-ascii?Q?UJciECG6K6D6p/OQV61Tm+gPxocWOVEzAI/OvqSi8jm1sysb44mILh7DDHYy?=
 =?us-ascii?Q?Ncx9uaBWK2NoahmxY5Sns2rovDMaWXdduaFbFgh5NipAG/qTJiYhXD33uJaW?=
 =?us-ascii?Q?ddvAMHkAVNQEKosENJkvOpKUdpWzHr+QlNtt/u4Az9lxPScDvIN2yFtua7Ik?=
 =?us-ascii?Q?LaEoAFM1/vxn0zsp3pwHjCKwpPdD4RHW86uNEuf87v1/mpMjREw7ZQruPhQM?=
 =?us-ascii?Q?2dB234anCNFLp8iMIuY0K7avHkfbHf3Hck8UY8EBSqBgr7FXkP+EaYFKBphm?=
 =?us-ascii?Q?g8Rg6LFPxzfJ9hs0VzxU+BAKWnhB6/GnwD1teS9CqZCOKamVubJ6qOmZv6AA?=
 =?us-ascii?Q?/YMEW2Y+pzT8UTmDOtt5NcO01uLWcKn/02/WtApOcrYRUcCqRQ+vIDeG6bmU?=
 =?us-ascii?Q?yJLEAfP33MYd3qbHHbAStpwbkQ48SgFu+dAdSWD5t7k9goGWjLMXRDbCuyIu?=
 =?us-ascii?Q?OFP187W2nGLURZtlJy636jTjoByNtNtJVX9wSLGDB4ilOeg2rlWoeifnm4J/?=
 =?us-ascii?Q?BO6x1A/rPHCJn0i+E1hz1/vkL3UkMod65V/IsrBsYFrOQrl7NUdIPETkMRbI?=
 =?us-ascii?Q?TMN7FyUjheRqsiZ82MXxZoI0uXjRZPfy+ocNmybfxDAVKrgb9g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4K8LUBvVyJgC0SFRzAxH1NkaEDFI3uP/J66w/u3LXEs577MUdosWlmVrhSdr?=
 =?us-ascii?Q?LTgfDu+XfnwxgvMuWIPpHXKpCO4arVw5DsO1+vi3wYm2XHTKLutniTqa8nwt?=
 =?us-ascii?Q?9+a9CVV8BXrjqYhgL1Rc1WhicciaYswLCJc2lW3b1yKLNPQcq87zl4rC+vg/?=
 =?us-ascii?Q?Yk8YGLGzhdLnIGQDGIQNOdQReH0FI5Z3WcnEijXKa77v/9gHeW4W2Q4cQ3Gp?=
 =?us-ascii?Q?c0Zy9vi/bcJQbU+Zg5JxzvXmeh4/MBlssKOOGmnlJv+vD03/46P53FW23pkF?=
 =?us-ascii?Q?EI2Fpf4zyCdqo2JmSFhR5L+SvMysHFYIGxfZ4WBKZ2LbYNRmm6XqQh11Vndx?=
 =?us-ascii?Q?JiUBVq8qv+0Gdg/zeWJBGHMSH3Jr5iD9lqHM2AMeaDeFP8M+8Ge9e2uj1O+f?=
 =?us-ascii?Q?WsHMBXoS9R6a8MdTnBcE8Hn+HT8YorUgxXKYi9fXuY/g7VkRuydizNiRPRlc?=
 =?us-ascii?Q?1xeKzOvY4Bt0xcgnQyrd+JGsgIidhbBj42t2Do1p/Pma4SKtmrr3lDxxbySj?=
 =?us-ascii?Q?AqsIL16vhUu/RFON5AkCkexH6T74CNVDuDqUtk1yVC5V+DCUxacYLZ0zAI8K?=
 =?us-ascii?Q?GpvKM3KTBRNQ7siY/0vNVii3LZvZKm3aQPNzTxS5C5yulgp7EoINU5mm9/z+?=
 =?us-ascii?Q?H0WiNjBIC7yEebsaMAnWhSs7giPs+AQCdROixd1zRSCukQ/P90ZT6gflVhnD?=
 =?us-ascii?Q?Dxo8hvt0TkUq0fENzwuSB+CFjMWfurfqWSvA/AXbrTH4R4Woz10t4E198Odz?=
 =?us-ascii?Q?eWmy8s7UtHWrA0SGSn2QQJI8MXoMhervWwH2FqaHFxS/nf6Paz/l6stZT+5j?=
 =?us-ascii?Q?mz+FkMHPi7DBXS49CbsZ0XJ+hVFRfHvA2mOK2m3n0NA6TqGhpP05p3GNCcPJ?=
 =?us-ascii?Q?YTHAYv+wlKHgSQqb/nSfbqMcF/Xmi8i2Tl8XL+T0VSVMEkEBmsE//XVdomin?=
 =?us-ascii?Q?gLdvIgR1cORGW+MzuufF7va/bHCVM1LIRZK0CiKk51FOEknztwcLNcbeA5Et?=
 =?us-ascii?Q?Ck4E9zV+gj8HpKCzt7KazJSx1mOa9KP0JZaolF/IVXj4ok0N25yro9j7PG+3?=
 =?us-ascii?Q?4Oo9RJiCSc6tKDoeI75Afkd2NK+8QFBReTe5KsVyT8rPg/0k7XJ/xTjbv9GF?=
 =?us-ascii?Q?9lej7aSbleJuIhbNRm7CLqB6DglrY8Dh0Dj1kdyigt0Q53S2WBIXo4bbNcc/?=
 =?us-ascii?Q?951uCxZHZMn3fROvQVl5nocMkRwoQE8GpZQc5AgsDatXHOVW2XyFte3Vsu1R?=
 =?us-ascii?Q?uedwIT1CKXiHgWCVVpOLSMpafBnXuBywh/G4tSGUQgxTENnpGFW45cpvrAsx?=
 =?us-ascii?Q?pfms0JtlxYT2do5Le51lhEfqDRybNL8RQms9jFBCVzuA1zz3od2hCOWTNQTM?=
 =?us-ascii?Q?ocxrXAVGp5pUFCyx7cHHuJNltvAQoWIjcxcX6OM5QZjol4c1BimzCL02JoYE?=
 =?us-ascii?Q?8heBPCka0RtVLSR98fUgQu08EqwPZajxEopxufuFAm0nIjadKACrIWF/XADb?=
 =?us-ascii?Q?vW8X1zsj7Rr/jgp5ntcpWqDHD1cRrSFtPe91YBLAvI1ESUxb5h5N6jmlIFU5?=
 =?us-ascii?Q?lzfbsoYXuKir349na+9NhSS8QXVxamGkPk2oHj7r?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d618211-9af5-49a3-2b57-08dd6eb79c10
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2025 11:48:27.0726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AzGuHrCvAzLY31pYNwMDeNmqYVzi4xJhGLYVOd2grSMkX/rnYW/JVlvJcfI1ICCviz/NlGGpsf+rwkYt3AMXZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8304

On Fri, Mar 28, 2025 at 08:14:41AM -0600, Mathieu Poirier wrote:
>On Fri, Mar 28, 2025 at 12:50:12PM +0800, Peng Fan wrote:
>> On Thu, Mar 27, 2025 at 11:46:33AM -0600, Mathieu Poirier wrote:
>> >Hi,
>> >
>> >On Wed, Mar 26, 2025 at 10:02:14AM +0800, Peng Fan (OSS) wrote:
>> >> From: Peng Fan <peng.fan@nxp.com>
>> >> 
>> >> There is case as below could trigger kernel dump:
>> >> Use U-Boot to start remote processor(rproc) with resource table
>> >> published to a fixed address by rproc. After Kernel boots up,
>> >> stop the rproc, load a new firmware which doesn't have resource table
>> >> ,and start rproc.
>> >>
>> >
>> >If a firwmare image doesn't have a resouce table, rproc_elf_load_rsc_table()
>> >will return an error [1], rproc_fw_boot() will exit prematurely [2] and the
>> >remote processor won't be started.  What am I missing?
>> 
>> STM32 and i.MX use their own parse_fw implementation which allows no resource
>> table:
>> https://elixir.bootlin.com/linux/v6.13.7/source/drivers/remoteproc/stm32_rproc.c#L272
>> https://elixir.bootlin.com/linux/v6.13.7/source/drivers/remoteproc/imx_rproc.c#L598
>
>Ok, that settles rproc_fw_boot() but there is also rproc_find_loaded_rsc_table()
>that will return NULL if a resource table is not found and preventing the
>memcpy() in rproc_start() from happening:
>
>https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/remoteproc_core.c#L1288


Sorry, I forgot to mention below code:
loaded_table is a valid pointer for i.MX, see
https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/imx_rproc.c#L666,

So loaded_table is valid, it is memcpy trigger kernel panic because table_sz is
not zero while cached_table is NULL.
	loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
	if (loaded_table) {
		memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
		rproc->table_ptr = loaded_table;
	}

Thanks,
Peng

>
>> 
>> Thanks,
>> Peng
>> 
>> >
>> >[1]. https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/remoteproc_elf_loader.c#L338
>> >[2]. https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/remoteproc_core.c#L1411 
>> >
>> >> When starting rproc with a firmware not have resource table,
>> >> `memcpy(loaded_table, rproc->cached_table, rproc->table_sz)` will
>> >> trigger dump, because rproc->cache_table is set to NULL during the last
>> >> stop operation, but rproc->table_sz is still valid.
>> >> 
>> >> This issue is found on i.MX8MP and i.MX9.
>> >> 
>> >> Dump as below:
>> >> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
>> >> Mem abort info:
>> >>   ESR = 0x0000000096000004
>> >>   EC = 0x25: DABT (current EL), IL = 32 bits
>> >>   SET = 0, FnV = 0
>> >>   EA = 0, S1PTW = 0
>> >>   FSC = 0x04: level 0 translation fault
>> >> Data abort info:
>> >>   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
>> >>   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>> >>   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>> >> user pgtable: 4k pages, 48-bit VAs, pgdp=000000010af63000
>> >> [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
>> >> Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
>> >> Modules linked in:
>> >> CPU: 2 UID: 0 PID: 1060 Comm: sh Not tainted 6.14.0-rc7-next-20250317-dirty #38
>> >> Hardware name: NXP i.MX8MPlus EVK board (DT)
>> >> pstate: a0000005 (NzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> >> pc : __pi_memcpy_generic+0x110/0x22c
>> >> lr : rproc_start+0x88/0x1e0
>> >> Call trace:
>> >>  __pi_memcpy_generic+0x110/0x22c (P)
>> >>  rproc_boot+0x198/0x57c
>> >>  state_store+0x40/0x104
>> >>  dev_attr_store+0x18/0x2c
>> >>  sysfs_kf_write+0x7c/0x94
>> >>  kernfs_fop_write_iter+0x120/0x1cc
>> >>  vfs_write+0x240/0x378
>> >>  ksys_write+0x70/0x108
>> >>  __arm64_sys_write+0x1c/0x28
>> >>  invoke_syscall+0x48/0x10c
>> >>  el0_svc_common.constprop.0+0xc0/0xe0
>> >>  do_el0_svc+0x1c/0x28
>> >>  el0_svc+0x30/0xcc
>> >>  el0t_64_sync_handler+0x10c/0x138
>> >>  el0t_64_sync+0x198/0x19c
>> >> 
>> >> Clear rproc->table_sz to address the issue.
>> >> 
>> >> While at here, also clear rproc->table_sz when rproc_fw_boot and
>> >> rproc_detach.
>> >> 
>> >> Fixes: 9dc9507f1880 ("remoteproc: Properly deal with the resource table when detaching")
>> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> >> ---
>> >> 
>> >> V2:
>> >>  Clear table_sz when rproc_fw_boot and rproc_detach per Arnaud
>> >> 
>> >>  drivers/remoteproc/remoteproc_core.c | 3 +++
>> >>  1 file changed, 3 insertions(+)
>> >> 
>> >> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> >> index c2cf0d277729..1efa53d4e0c3 100644
>> >> --- a/drivers/remoteproc/remoteproc_core.c
>> >> +++ b/drivers/remoteproc/remoteproc_core.c
>> >> @@ -1442,6 +1442,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>> >>  	kfree(rproc->cached_table);
>> >>  	rproc->cached_table = NULL;
>> >>  	rproc->table_ptr = NULL;
>> >> +	rproc->table_sz = 0;
>> >>  unprepare_rproc:
>> >>  	/* release HW resources if needed */
>> >>  	rproc_unprepare_device(rproc);
>> >> @@ -2025,6 +2026,7 @@ int rproc_shutdown(struct rproc *rproc)
>> >>  	kfree(rproc->cached_table);
>> >>  	rproc->cached_table = NULL;
>> >>  	rproc->table_ptr = NULL;
>> >> +	rproc->table_sz = 0;
>> >>  out:
>> >>  	mutex_unlock(&rproc->lock);
>> >>  	return ret;
>> >> @@ -2091,6 +2093,7 @@ int rproc_detach(struct rproc *rproc)
>> >>  	kfree(rproc->cached_table);
>> >>  	rproc->cached_table = NULL;
>> >>  	rproc->table_ptr = NULL;
>> >> +	rproc->table_sz = 0;
>> >>  out:
>> >>  	mutex_unlock(&rproc->lock);
>> >>  	return ret;
>> >> -- 
>> >> 2.37.1
>> >> 
>> >
>
