Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2080.outbound.protection.outlook.com [40.107.249.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3710F36D;
	Wed,  2 Apr 2025 00:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743554172; cv=fail; b=s/Kp9EJF+OJ0yy/c6dwfQoMjG1w4MD+mUkzkIWAUd56vnuWCR3cZf30HCtvNg/tDc/3Iy/SBufyptTt+hReHJ2N/89vwxGbC4nGO/a9T+tsoD263VdU5oZKAVcR/gj3ty/DxPT2RjyVGQLzipzvjAuAD1j6zdIZLGqRBRQ2fEak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743554172; c=relaxed/simple;
	bh=JgS59AkE1hzEFnXK6J8PyWscZSwGOPVZipq5vm+kSrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=toi9Xs+ikcOFvcCT6kfWpxaYBANhdAp4zouEg5fu8mGI2rYCRcSDBgt7oHYs0h2geZ6w1YhvhtAiBIBz9+vzlF8vshvEgQ2ezdyVW3PyeLwBFD/c9u9Lyjzi8dnQAdefN/UDK7l19pZHdWT5k+ZXqBETKjDwaScJk665rfHysAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KzDKXcQJ; arc=fail smtp.client-ip=40.107.249.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KzDKXcQJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3Wjz+4fezR+9DInguA5MjUW6olvh/3ePKJhKRynGuDB4XOEhNlkxUiaNSt2D2rAku8L2dLToMC6ook/sb5xMw1JCP4XhJzzIO7gLQqmLZGLVkNN+i1QCmeenj0RmdpNM9L02qxEUIy7qIvnejgOcaIqcmxKLlcV45bML/zP6aymrZ3uIHUi0DKfPQ8r2XHMYg3YOHhNdTCw4/UnN6d2dvzDUUrnFUltWP9yKrbgx4s8IhJugwEuHhiIJy/Y5ZUFExDDlJRnMx9VvNFbvIiFzDYuu2Ld0A1U1a6BnTySvkIiEHaF5+00KiHHzEMLVXRXRopl20/Sy6fkRUkLdFbPAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFS63nGsOAKS5Sc0Opr8DOQm2801kLN2XKXxXcA9EdM=;
 b=IRYjiiUEpXpbEaf6pBvYF8cwM52TA23Dbl6bt7ZgJsMv4ANnozJs8DpvKsnsJlvnQrfsRIYXhQ5gxRGuYCtlYnoC/1cf+CzyJieBvfVdQbd8ZTIpgxmPZDzaPy2eONUmrt088Y4SMQsGgA/bB38r0hsIZZJb12tUW/wcm1QrpcU5h1o2lvEUUC503DV+Kyq3iA47e2RHNEOR9qXsgfUjgJENuIlOgiQiMmdTDkyXQ6XWQ8RXtl4sR9FyDeTO3LzDYlJx4fFr73rrWD2QOsrRr72Dx2fymwtUE6jktU82Jwar+LK5jSwVyboG/UixKTLXshsYQ23rluLRtLNIwfwgTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFS63nGsOAKS5Sc0Opr8DOQm2801kLN2XKXxXcA9EdM=;
 b=KzDKXcQJMZNt2sQL+THpp5bsIixobecPdz2Iy8EisKJEfJZvcJ0+FVxLTtnrwf6zWiY1zYjt4SdwYpxLA4mr5xHI2TozoYsyf3ceV2t205kj73myzc2Ka2Cr5IMsKGjs+Azkzr3/Qo0q/pExo14N+soS/2/OZTV4g5NpPTiJyKzD+XajUbWW/tJaFYIxLxva2gIyLzrMmuCiQnrtvBm2Q3CGImeO/68j35o4Q28qDpghvYN9sb5EXgPUlCfH5qTO9VB28GYl7pOxqwd3eE6iyOWSzNzUIEbBvXODd4ZVkRlyPeWVJAVkus04LKmtFEI+tsuSUdYb8uTqcSzIKRzRtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM0PR04MB6882.eurprd04.prod.outlook.com (2603:10a6:208:184::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.45; Wed, 2 Apr
 2025 00:36:06 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 00:36:06 +0000
Date: Wed, 2 Apr 2025 09:43:55 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Arnaud Pouliquen <arnaud.pouliquen@st.com>,
	"open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2] remoteproc: core: Clear table_sz when rproc_shutdown
Message-ID: <20250402014355.GA22575@nxa18884-linux>
References: <20250326020215.3689624-1-peng.fan@oss.nxp.com>
 <Z-WO-fhDJKyG7hn2@p14s>
 <20250328045012.GA16723@nxa18884-linux>
 <Z-au0USkvoDYTF7A@p14s>
 <20250329125629.GA11929@nxa18884-linux>
 <Z-q3ebPSjkSPVlgP@p14s>
 <20250401014124.GB15525@nxa18884-linux>
 <Z-wOr3eLaX9myqb4@p14s>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-wOr3eLaX9myqb4@p14s>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR04CA0170.apcprd04.prod.outlook.com (2603:1096:4::32)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM0PR04MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: 21f3ec10-f5c6-4676-1869-08dd717e5aa7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CyHAB85+cSQt+tFbm7/WTp6D+M12p5+ctoLRTiMjp1TLPRw3sdjjP+xkgmA+?=
 =?us-ascii?Q?U/iAXOoENfHpi9L6IDCAQg5kZhEkRZZCAA42IQlvNxOpZERs62qA181epLwe?=
 =?us-ascii?Q?ylnMvL4Nku+jyNdpQ8rKGoc59HKnidFSQWP1cqajkXYj//UFpBZgiX6tgkaR?=
 =?us-ascii?Q?82vMq1sHz0AUcId3QGOo5cNaSWdUUaTho2P+MRYG0HU/Q8Fte75d1s2TlIrB?=
 =?us-ascii?Q?xCmzBA8ptfosQeJfa2/0ew+ZTjDADh2D+u+1uJDATBpyccVqApi5Gox4yyFr?=
 =?us-ascii?Q?mpeI+8SAY8QmLAtdSfOwJ2Q3LjEOBq3ulgGp/s0SLhetAstFyhwhWnBojrB/?=
 =?us-ascii?Q?mnnGap5FnsGpN5H5TIngHSqI5QLnCpgBNok+lkInODo8DIhaHfDzA/5S0Fn2?=
 =?us-ascii?Q?UwsHRqqok30ncSc1dqKMEbBZGB/nlKO03D38silD0RW1oE+Fwt6XFAwUjZ87?=
 =?us-ascii?Q?WKBsOTOCPyOtJ2XY25rrZ+0km+J9anntCGQBSnzWUDi3M95DZY7MeMOUJCeA?=
 =?us-ascii?Q?lK6rbQmUGXKmHPRMKHBZXWUb/qHrviza7+MBz36/PwXMEvcYDedAMBglL6XT?=
 =?us-ascii?Q?5t8RCH+BNWKhvGlzwllOdKx3B9hT/ez3iTfZ8+D2EwVNzaCMk6l61H5AOCsK?=
 =?us-ascii?Q?DIq6BV1UCTvY83OPVwnldI8B/dvI/NEhivVN00VQwKF6HgahD2p8xYS6tELB?=
 =?us-ascii?Q?2mXt4FSJ+FUhxt7zFBU/vsLZ8Qtvm4EFXZEZwVi7ujl1kNDjOyqm34viEdqd?=
 =?us-ascii?Q?cUgA2F5szpqGzGWFKm9S5/zopdgEj2VWszucbGXmwS0gPgmLIHw5twelO9Ye?=
 =?us-ascii?Q?Sdmh1/1IaJFgEHFTa+w1MQrjQ9zsLYUWXdAzmWLUG2GK0r0uZyIORGKZba2+?=
 =?us-ascii?Q?YnAy7ww8KBbd1B0SRnJLQfw76XQRLgqgk1dYzz1Wy8uaJaqvXVgiSkchzIGo?=
 =?us-ascii?Q?4tEdfts9dM4YGYCxM7j/1rzHIq20qc3GTwmFAl8ohLt5FgGqPx7dEYzujaEx?=
 =?us-ascii?Q?VsJXmRaLlJSPkiFLysg1AFgbYztCadu5zRiwNNN8j1OkhdDiTysov8YlpcmG?=
 =?us-ascii?Q?JHWW//U/jxjkfTK78nQRGywWI7y/ilHEs7rIYJceRhqlmUpMVgwd03qvvjGT?=
 =?us-ascii?Q?HFJ2xUhnl9vTWGo224viWs+/IKqbnPjFuP8t523PVOXq4xt4XoaykOmkblsc?=
 =?us-ascii?Q?gFOaOb5L6IhLzUjpX2CSzN45l8OmMcwm4vNPSoNZJ3knXGfhnj59OVvQaC9K?=
 =?us-ascii?Q?Sp0dWF3VwXpXUa8Y5nIiEcH3pdKbJ0aAcRc0i0Oby4fZqwNsS5gZ4GLhgvl8?=
 =?us-ascii?Q?4ursR3l+kPVJKHJflj8jlnDvLaEYVmWjnMuWm7ohHQK4crtxUq8FfmvFuPPy?=
 =?us-ascii?Q?8Xgk9dAtfkZ5ZkZv6YL+iC+wwo21YQWibQQo4gSw1s2ynOM8Gw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8hW83U26gZf5+//fR8YYigtQ0eneRFqZZp+gf5un2LyH8qqUw9IBhbuYlYuk?=
 =?us-ascii?Q?4Ort5HPaqiXVtezFk8TZfGSljKha+WMLVkThDXO1kKlk/HbxVO6c90vrdskr?=
 =?us-ascii?Q?9i6P1b3EUgzGYlh/Gz/cKa18z580jxdNWAbXs8o7Xl9Y7vVSZl8Np72kVeFW?=
 =?us-ascii?Q?SkwaJlYsAI+Lcr182xF9Ah+amB5oxJVjq5zCvqpqd0Gdg065X090rZy2a8q3?=
 =?us-ascii?Q?fz0ne/ksbw+5gn0Jrr4JfB32QwpylM48tjeOjR2JizRo17QSNcsGMp+siZGY?=
 =?us-ascii?Q?YZGtMGgjcdkumkFcAxOxBThWknelwTshTjc5b8PlaMOrGCxcKABDgqiiIiwJ?=
 =?us-ascii?Q?T39sy1h3vCgDg1PbqxlUiwUHMpf98FyOM9BVCBE02u7kxQmVnzLnuEGiBAQz?=
 =?us-ascii?Q?2E7H6Yi6e9xebictd/Z9TqYAXGK3kWQcYNDWTRThtJdmu9gRCTqAiGDtjgBu?=
 =?us-ascii?Q?gaWE3qX1TFLLxJDvRHKPXryI6DtMfCPLretFfoNfZ+7TWa32kcuDcwerYnoI?=
 =?us-ascii?Q?VmMCT1AsdHsTj1q5Vmo53xqq8wc1zuNS7T8WHfVHEoFXX4Wiz6TH1am1UtnN?=
 =?us-ascii?Q?0OR8Iwq2Mz374IR9wHOKNZFePbkkmzjW4tCCN+WI7aVAXADVsr4q+5rRJBco?=
 =?us-ascii?Q?HQx3ZMUOmR0nD9K+CRq0AV4rBIScCeGRCghB3wMRptzKk3wekuk0j93dE5QL?=
 =?us-ascii?Q?YzWZw0aPdUAQT2JMAVLFLYtQBOx16hgkQw+pLuFjq2XFdy8/XLyszQ+EYrzd?=
 =?us-ascii?Q?187ciOnkG1CoHVsWuqsqUqHaxcaUVExx1xCkPlZOlMJA5x5gnoscKmSaScXE?=
 =?us-ascii?Q?AiV/eG4bWcAJdF/WRqs/4qagGFtO74rQVRWFg7QYPoOCNVdu1KmbfP4Aj9J0?=
 =?us-ascii?Q?OaGMscII9O9z5r31w4QqniA+54cft2T4dfbtwq1htTQz8DUuXNK2Gw83RWah?=
 =?us-ascii?Q?wm/Wcgnmj7mBYbqbR0FFJUV30EMvDqSiQJTbWDq5L6M+OrWp970Btz11RkD6?=
 =?us-ascii?Q?X4UKzpB4T799LOfnCT413usoO1qZxV5zKRXCtKpmpxOb14eQq9Cc8ISLCJtA?=
 =?us-ascii?Q?piGgGvPgtiZoXMioP5yrRtscxahW3BrkKVBywRraT3+K6SkPeVGZUYkCEdAL?=
 =?us-ascii?Q?bBzh1DCrz5E4wd0TlHDnIg8v2RMPrwVuvfzMHmKdgymhtjQ0RsnPUiljxVpC?=
 =?us-ascii?Q?M7y68aksffNardcl56vYXY9LslWO6iwWMtQURqqWTaQcHXJO4pwlte8whAjg?=
 =?us-ascii?Q?13bU3E5LNRPM7bU77cyT0rkF/5A0NRmnOcWi5KhBeEf1M+hbRS7ty+WkjPJ5?=
 =?us-ascii?Q?pSbt6Il8zCRsE8LToGQtP4uNgyS99/PoBBej1auCjIl+a2JB8zXl/gFWxXDb?=
 =?us-ascii?Q?ijmCmz5v0oxoHLa+97TlOreuMEgdy/GiY8+ixC/jSvaZDqxEWSNJnu3Zairp?=
 =?us-ascii?Q?7chX3pwMD3M1xGv/do6WRV33RPSy+PQ6FyphgAIymLZrBgt5/xNkjseBGAtc?=
 =?us-ascii?Q?jJkAp4W8cgz+kdZ1sBVF84Q6dW1E7LIo+Fkzy0sO+9Wp3I9t+cnhrLIA6Q/S?=
 =?us-ascii?Q?C+7M5E1iYzMIIRb1niwjxECFXopYudmZV4vOEUk0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21f3ec10-f5c6-4676-1869-08dd717e5aa7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 00:36:05.9761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbhmstK6BI/xMIP2shmxFdh5sDF2VRoQGgLvzCsvtSDEBJUMBvJp5y3fan6RB6aNX5pl4TbVXw7tDZrZ7XWdyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6882

On Tue, Apr 01, 2025 at 10:05:03AM -0600, Mathieu Poirier wrote:
>On Tue, Apr 01, 2025 at 09:41:24AM +0800, Peng Fan wrote:
>> On Mon, Mar 31, 2025 at 09:40:41AM -0600, Mathieu Poirier wrote:
>> >On Sat, Mar 29, 2025 at 08:56:29PM +0800, Peng Fan wrote:
>> >> On Fri, Mar 28, 2025 at 08:14:41AM -0600, Mathieu Poirier wrote:
>> >> >On Fri, Mar 28, 2025 at 12:50:12PM +0800, Peng Fan wrote:
>> >> >> On Thu, Mar 27, 2025 at 11:46:33AM -0600, Mathieu Poirier wrote:
>> >> >> >Hi,
>> >> >> >
>> >> >> >On Wed, Mar 26, 2025 at 10:02:14AM +0800, Peng Fan (OSS) wrote:
>> >> >> >> From: Peng Fan <peng.fan@nxp.com>
>> >> >> >> 
>> >> >> >> There is case as below could trigger kernel dump:
>> >> >> >> Use U-Boot to start remote processor(rproc) with resource table
>> >> >> >> published to a fixed address by rproc. After Kernel boots up,
>> >> >> >> stop the rproc, load a new firmware which doesn't have resource table
>> >> >> >> ,and start rproc.
>> >> >> >>
>> >> >> >
>> >> >> >If a firwmare image doesn't have a resouce table, rproc_elf_load_rsc_table()
>> >> >> >will return an error [1], rproc_fw_boot() will exit prematurely [2] and the
>> >> >> >remote processor won't be started.  What am I missing?
>> >> >> 
>> >> >> STM32 and i.MX use their own parse_fw implementation which allows no resource
>> >> >> table:
>> >> >> https://elixir.bootlin.com/linux/v6.13.7/source/drivers/remoteproc/stm32_rproc.c#L272
>> >> >> https://elixir.bootlin.com/linux/v6.13.7/source/drivers/remoteproc/imx_rproc.c#L598
>> >> >
>> >> >Ok, that settles rproc_fw_boot() but there is also rproc_find_loaded_rsc_table()
>> >> >that will return NULL if a resource table is not found and preventing the
>> >> >memcpy() in rproc_start() from happening:
>> >> >
>> >> >https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/remoteproc_core.c#L1288
>> >> 
>> >> 
>> >> Sorry, I forgot to mention below code:
>> >> loaded_table is a valid pointer for i.MX, see
>> >> https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/imx_rproc.c#L666,
>> >
>> >(SIGH)
>> >
>> >The changelong for this patch says "... load a new firmware which doesn't have a
>> >resource table..." and now you are telling me that @load_table is valid.  As
>> >such I have to _guess_ that @priv->rsc_table is not null.  So which is it -
>> >valid or not valid?  
>> 
>> As wrote in commit log, bootloader kicks the m7 and m7 publishes a valid
>> resource table to a fixed address.
>> 
>> When linux boots up, first stop m7, then load a new firmware which does not
>> have resource table, then stop m7.
>> 
>> Even the new firmware does not have resource table, the imx_rproc driver
>> still returns a valid resource table address which is got from device tree
>> (rsrc_table) in imx DTS when the driver probe.
>> 
>> @priv->rsc_table is always valid even the firwmare does not have a valid
>
>And that is where the problem is - why can't that situation be fixed instead of
>pushing it to the subsystem core?  Why can't you have code in
>imx_rproc_elf_find_loaded_rsc_table() that checks if there is a valid resource
>table at the address held by @priv->rsc_table and return NULL if there isn't?

It is ok address the issue in imx_rproc.c without touching core code.

priv->rsc_table contains valid resource table which is published when
m7 is kicked by bootloader, and m7 publishes a valid table to
priv->rsc_table.

It still contains valid content when linux stops m7.

To make it invalid when linux starts m7 with a firwmare(the elf image not has
resource table), need to clear the content of priv->rsc_table or
write some magic number when stop the m7 which was started by bootloader.

Then it is possible to check priv->rsc_table in
imx_rproc_elf_find_loaded_rsc_table.

The 2nd approach is to clear rproc->table_sz and rproc->table_ptr in
imx_rproc_parse_fw before rproc_elf_load_rsc_table.


>
>The core is already checking if @loaded_table is valid in rproc_start(), why
>can't that be used instead of adding yet another check?

Ah. I was thinking clear table_sz in rpoc_shutdown is an easy approach and
could benifit others in case other platforms meet similar issue in future.

If you think the current patch is not proper, I could do a v3 with the upper
2nd approach.

>
>> resource table. The TCM area is not writeable by Linux, so the firmware will
>> copy the resource table from TCM to DDR if the firmware has a resource table.
>> 
>> Hope this is clear.
>
>What is clear is that I spend 4 sessions on a 3-line patch, valuable time I
>could have spent reviewing other peoples' patches.

Sorry. Not intend to waste your time.

Thanks,
Peng
>
>> 
>> >
>> >If my assumption above is valid than fix that instead of hacking the remoteproc
>> >core.
>> 
>> I just found V1 was picked up by Bjorn.
>
>I am currently working with Bjorn on that.
>
>> It is not hack, clearing table_sz in core code does not hurt, I think.
>
>It is a hack for as long as you haven't provided a valid explanation for the
>changes you are proposing.  
>
>> 
>> If my assumption is not valid the changelog and your justification for
>> >this patch are wrong.  Either way I have spent way too much time on this patch
>> >already and dropping it.  The same goes for your other patch [1] - resent it
>> >when you will have properly address the work herein.   
>> 
>
>And yet you just sent a V2.
>
>> sure.
>> 
>> Thanks,
>> Peng
>> 
>> >
>> >[1]. [PATCH] remoteproc: imx_rproc: Add mutex protection for workqueue
>> >
>> >> 
>> >> So loaded_table is valid, it is memcpy trigger kernel panic because table_sz is
>> >> not zero while cached_table is NULL.
>> >> 	loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
>> >> 	if (loaded_table) {
>> >> 		memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
>> >> 		rproc->table_ptr = loaded_table;
>> >> 	}
>> >> 
>> >> Thanks,
>> >> Peng
>> >> 
>> >> >
>> >> >> 
>> >> >> Thanks,
>> >> >> Peng
>> >> >> 
>> >> >> >
>> >> >> >[1]. https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/remoteproc_elf_loader.c#L338
>> >> >> >[2]. https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/remoteproc_core.c#L1411 
>> >> >> >
>> >> >> >> When starting rproc with a firmware not have resource table,
>> >> >> >> `memcpy(loaded_table, rproc->cached_table, rproc->table_sz)` will
>> >> >> >> trigger dump, because rproc->cache_table is set to NULL during the last
>> >> >> >> stop operation, but rproc->table_sz is still valid.
>> >> >> >> 
>> >> >> >> This issue is found on i.MX8MP and i.MX9.
>> >> >> >> 
>> >> >> >> Dump as below:
>> >> >> >> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
>> >> >> >> Mem abort info:
>> >> >> >>   ESR = 0x0000000096000004
>> >> >> >>   EC = 0x25: DABT (current EL), IL = 32 bits
>> >> >> >>   SET = 0, FnV = 0
>> >> >> >>   EA = 0, S1PTW = 0
>> >> >> >>   FSC = 0x04: level 0 translation fault
>> >> >> >> Data abort info:
>> >> >> >>   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
>> >> >> >>   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>> >> >> >>   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>> >> >> >> user pgtable: 4k pages, 48-bit VAs, pgdp=000000010af63000
>> >> >> >> [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
>> >> >> >> Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
>> >> >> >> Modules linked in:
>> >> >> >> CPU: 2 UID: 0 PID: 1060 Comm: sh Not tainted 6.14.0-rc7-next-20250317-dirty #38
>> >> >> >> Hardware name: NXP i.MX8MPlus EVK board (DT)
>> >> >> >> pstate: a0000005 (NzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> >> >> >> pc : __pi_memcpy_generic+0x110/0x22c
>> >> >> >> lr : rproc_start+0x88/0x1e0
>> >> >> >> Call trace:
>> >> >> >>  __pi_memcpy_generic+0x110/0x22c (P)
>> >> >> >>  rproc_boot+0x198/0x57c
>> >> >> >>  state_store+0x40/0x104
>> >> >> >>  dev_attr_store+0x18/0x2c
>> >> >> >>  sysfs_kf_write+0x7c/0x94
>> >> >> >>  kernfs_fop_write_iter+0x120/0x1cc
>> >> >> >>  vfs_write+0x240/0x378
>> >> >> >>  ksys_write+0x70/0x108
>> >> >> >>  __arm64_sys_write+0x1c/0x28
>> >> >> >>  invoke_syscall+0x48/0x10c
>> >> >> >>  el0_svc_common.constprop.0+0xc0/0xe0
>> >> >> >>  do_el0_svc+0x1c/0x28
>> >> >> >>  el0_svc+0x30/0xcc
>> >> >> >>  el0t_64_sync_handler+0x10c/0x138
>> >> >> >>  el0t_64_sync+0x198/0x19c
>> >> >> >> 
>> >> >> >> Clear rproc->table_sz to address the issue.
>> >> >> >> 
>> >> >> >> While at here, also clear rproc->table_sz when rproc_fw_boot and
>> >> >> >> rproc_detach.
>> >> >> >> 
>> >> >> >> Fixes: 9dc9507f1880 ("remoteproc: Properly deal with the resource table when detaching")
>> >> >> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> >> >> >> ---
>> >> >> >> 
>> >> >> >> V2:
>> >> >> >>  Clear table_sz when rproc_fw_boot and rproc_detach per Arnaud
>> >> >> >> 
>> >> >> >>  drivers/remoteproc/remoteproc_core.c | 3 +++
>> >> >> >>  1 file changed, 3 insertions(+)
>> >> >> >> 
>> >> >> >> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> >> >> >> index c2cf0d277729..1efa53d4e0c3 100644
>> >> >> >> --- a/drivers/remoteproc/remoteproc_core.c
>> >> >> >> +++ b/drivers/remoteproc/remoteproc_core.c
>> >> >> >> @@ -1442,6 +1442,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>> >> >> >>  	kfree(rproc->cached_table);
>> >> >> >>  	rproc->cached_table = NULL;
>> >> >> >>  	rproc->table_ptr = NULL;
>> >> >> >> +	rproc->table_sz = 0;
>> >> >> >>  unprepare_rproc:
>> >> >> >>  	/* release HW resources if needed */
>> >> >> >>  	rproc_unprepare_device(rproc);
>> >> >> >> @@ -2025,6 +2026,7 @@ int rproc_shutdown(struct rproc *rproc)
>> >> >> >>  	kfree(rproc->cached_table);
>> >> >> >>  	rproc->cached_table = NULL;
>> >> >> >>  	rproc->table_ptr = NULL;
>> >> >> >> +	rproc->table_sz = 0;
>> >> >> >>  out:
>> >> >> >>  	mutex_unlock(&rproc->lock);
>> >> >> >>  	return ret;
>> >> >> >> @@ -2091,6 +2093,7 @@ int rproc_detach(struct rproc *rproc)
>> >> >> >>  	kfree(rproc->cached_table);
>> >> >> >>  	rproc->cached_table = NULL;
>> >> >> >>  	rproc->table_ptr = NULL;
>> >> >> >> +	rproc->table_sz = 0;
>> >> >> >>  out:
>> >> >> >>  	mutex_unlock(&rproc->lock);
>> >> >> >>  	return ret;
>> >> >> >> -- 
>> >> >> >> 2.37.1
>> >> >> >> 
>> >> >> >
>> >> >
>> >
>
