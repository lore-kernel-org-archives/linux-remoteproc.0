Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013045.outbound.protection.outlook.com [40.107.162.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D9A225A3B;
	Wed,  4 Feb 2026 00:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770166554; cv=fail; b=Hc48sNzSAhAtCH9RxFjj8UTvPQSM23AE0Ge3PJjdHYCxp2idWPTwRDElHVpKbGL+Z4XqsghEUomJPc8Mtmoyro/Xxo6eh+doEvPM0BoeNfuvbTThyhKZVLPlhPTgVDAwhkplHQ9RaBCXSWrR1of9Pwx0PJ0E1GHaP7BhrfBCjAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770166554; c=relaxed/simple;
	bh=vDuwcTBBs1XMrwN7CU6EhnTYkGRQm0Nz8IscxvRkC3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hFU1PYp7P04hA4wyOOznCgFK326ksXTQQYQ5d649KNR//0W2JprpjI4mibBtCFsazgnINtSdkrZnZS1FdOMDPITukhi4WwOM1wdoN8DXn/HTjvFvyUQI78FZiQaIHxx8IwIV2N4s3ek5SBw3maTz1OgtT5cyoYwuOrJho9SqpqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Px4+Y+Pi; arc=fail smtp.client-ip=40.107.162.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Px4+Y+Pi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f19vHOHWJ1Uwd/nuwXLMjqIXoWgsPBGg/XDg2hKsF6/8J/cDrf4mhoketbmyxpipAGFNxl1YayWBsBtg7t0DnHHti/CNgqq1umKXDa8m+r1aDorRkAZ2Lr6vnovNm1VlevjGd5GMVKk6TVQs5txVnfVvzON/DFTCnIbntm9GtYZQgepKqxOttbcW7ncm1YTT8PVaLR569PdlQysCq6IgjxYeblt0lIWUdp4vYJcLGZL6D/uxCFShuoGgfAeZ+XbJuWHyNb5LcLPuXCpH/woRsaoZrLdBAmpeZh2EbXnWfFvo0SMbqEkVgj4Dod0zBiDWXmt2vLoQ9MhqUTuEgWYnvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fu4BvWtzry11hBDwwBbtUJFEVkjBKXbbcwGVg9tQtFw=;
 b=MajpnDinRj6LdkmNtp0Ke3xN0VDkG83DU2iz7E+96H4uNV4u13ZyXBc0mZVfAm4x75liNOG76Xmfy4unNdQBQ3+sXjnRcRzMoKv3OTK3V4yD/5Sz8z119zAkXJ5qTJIQK8qypiPduzOdQ9Uszu/xJgUIm2QuioaqSfk7NZBpP5BzTALTB/z+HSeO1irZ0Reep67+nnnS+D6U/qr4fvFbvvrMcJlKE8aUpBF5m4jV3pcwMUrCXD3zBBKOx+OFWfk9PZSTWwQe88E7WftxuBI2BfLWXp9nstJv8McuFammMMOZma+NQ9vlR8P6K8ta/GE5jjxgEHtpKsENRP8drr2eag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fu4BvWtzry11hBDwwBbtUJFEVkjBKXbbcwGVg9tQtFw=;
 b=Px4+Y+PiS69lJA08WXjVJ8K4jgbXpu1IcLvKjmBZPvujdpjw3Ifn7tsXkgGIgdMXC4QDPs7dU2HR+0hyg1lw26BHVPQEOlkag5aXorPe+txez3auhn046hTzAFn0wulXjnus1uNVZ/rG1+HQsP1Q5oWCmiPj3S6RU9TmRSfJA7ImupIpl9+IBRHdnmINSiKkbdhNYR9iWQH28QlUQKErqES2+PfPGK8VJtfTszCa4ZIBTUODd1VFkc7guwDYARnP/w80Vw4m3niVIHU4/C2IRzXI6zsO4m5aWa0d1hDrshqSWU4FdcjD/n5qpgk5wSDbfkdEGvW/tX8qahdqgqhEiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8483.eurprd04.prod.outlook.com (2603:10a6:20b:34b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 00:55:49 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Wed, 4 Feb 2026
 00:55:48 +0000
Date: Wed, 4 Feb 2026 08:57:12 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, Andrew Davis <afd@ti.com>
Subject: Re: [PATCH v2 1/2] remoteproc: core: support fixed device index from
 DT aliases
Message-ID: <aYKZaDn5Q58xdO94@shlinux89>
References: <20260128103118.3630078-1-arnaud.pouliquen@foss.st.com>
 <20260128103118.3630078-2-arnaud.pouliquen@foss.st.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128103118.3630078-2-arnaud.pouliquen@foss.st.com>
X-ClientProxiedBy: SG2PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:3:17::25) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8483:EE_
X-MS-Office365-Filtering-Correlation-Id: 62c8b2f3-64cd-4d41-1e71-08de63882267
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fQUfgskza3oHgf34gk5CJwvDp6Og2lb8ReoAAktxQuahc4p1plzCH7a7Mv77?=
 =?us-ascii?Q?0ZchCyqEjM7G2VphCzauF5wA/1QxPrG60UxWO9eBUrTRSheGGuMXbjc+XcIr?=
 =?us-ascii?Q?NNfK1oNs/ZZ44ZL97jGSzqJGPX2gC/VVvNNjDGbLLhTC3gctClUXTrONqSUV?=
 =?us-ascii?Q?1QUPVvPDgwe5w12EQZPc89FBsU5nKIo7Xu8O64ISBdOTOhc7U2rAO4Oqumq8?=
 =?us-ascii?Q?Zn0dx4Fn/g+gWS/LjuN55Ar5HnaDmehdAxGAwgf68TqysRfCb3Wo+efOEnhr?=
 =?us-ascii?Q?XjVoa0o2N9Rpdnz4u+vYBdNGn+lBvKaEuBBmM0fQYmGbZ46Hp0nEZ4MOawN4?=
 =?us-ascii?Q?apfgDacanSO2CZ1pPBvvx9ZO53VAYbUOQx8Izovi7Cp1jIe/ryhXhBU1f65R?=
 =?us-ascii?Q?Z0MC0K73Bk5aLkj7oARGJIEa7BWEcYgWoAvW0VALuKAooDK+/SXdr8PkYC0w?=
 =?us-ascii?Q?1bhVO3MI0qVZxmPVoeReh74F/GJ9SpLXy4yH5ix0HHUpcQabTPmp86G+N+hJ?=
 =?us-ascii?Q?d+yyHUI7l73FyJ30dgVNBFp5Rh2E+Ytmstu5/aHeiLnKhnLttsYjTqBV1VLa?=
 =?us-ascii?Q?x9ebgZxLjEib6cEsHHbYZo1ukpQtpybo9Fy3L/pYk1N4MiiNuMiLkWqZj5kw?=
 =?us-ascii?Q?c74jQUnXjK4wX05tHVNZ5bZyLBl7IyPE+ml2bHimiNKVVjfvvP+wIj+3mi4U?=
 =?us-ascii?Q?5/ZxsMuO6M63aEFiW0DtdYsKOHJLqTzhuQyNM8MU8baTNg2xagFF0xCEwdcJ?=
 =?us-ascii?Q?pW8K48E3qkpDsrkhXxtC28OMI1FX3zN5HsBt07YlfF5v1kzG52gnxYWh4m2n?=
 =?us-ascii?Q?MrX86SoyxULH1jsbWWUY7KO8uETE67NTI5IsrxPu30W47p8knmfDN50PN1ur?=
 =?us-ascii?Q?G6711Y5cXIGtK7fOpBf2TspwcC2Y4A4Vp0GN3RsNZRp5r3/3XR72bvzfZDLl?=
 =?us-ascii?Q?XfNcXh3Wx6vSyYk/VzyowKIcK1Z+7Ea4oJGPbvRSBTKXlMmLxLSTDiNFLqAz?=
 =?us-ascii?Q?L98kWTzpmYh5/E9fPfqlNkga3bc2QJQepwnvqy0BtoU88zYW9qv7w2vWo9yW?=
 =?us-ascii?Q?AWYvcnQbMvaKy/I+m6lev4TQLdUGkhV7n9YYMz7fqJCheWkuWoNBa6H6jBic?=
 =?us-ascii?Q?3kOi8jBHUx4r++mTMaxAVokMKruVbwFU4uFBxXe9CLr4ZP2goZanIOHL5476?=
 =?us-ascii?Q?9LbFJdRFdzhaqV/Mu0X7ELOss1xxMYg4BHWuwn6QCOroe4l6lfpeNGFcEEAM?=
 =?us-ascii?Q?CCAOqkEomSEXcG7e7XhY/fOZJ4yBnYsHDIiL2CcnAc7VF7jJYDLliMALQl7A?=
 =?us-ascii?Q?kyzkEhVXqahlPcFYUOQq8A44LhuuQCp1kVODRHvwZXr0TorKzv3+w+dbnEuv?=
 =?us-ascii?Q?V8XWoKKl1WLCyEydbPDKKmReZD4chPZ1cRNyyEcxbzp58BG2WHMf8domrRmR?=
 =?us-ascii?Q?bV7lUcwyT3NWkMqmQ7RjIhQZiHkFF2wgj6GvkaWWmIgGfIDQL8NG5tWuOPHw?=
 =?us-ascii?Q?aa5UAyauynKQ2tmfpwoaTrbrkJrxY5vLUtrgPSRpCf7Wj5VeYnmHDSQvO7Qc?=
 =?us-ascii?Q?m41RBeZZwsJ72afMNeoXq9lyCld3thYovdSG9/J+SsuSuPHims0vhomGaybG?=
 =?us-ascii?Q?j2CewOP7VT8wWF9O6sfxc6I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2Uku+CjR18y8YfQ+D01YEUxEIIXg/xzfCBS8gRrlVkv/mMMOy0hq+4IDdwst?=
 =?us-ascii?Q?XMQ+4bz3XWnEzVA9np0zkcNzfql7d6pga5Jvu/6SCtUT2z9GEcfggta5Ngcb?=
 =?us-ascii?Q?/HX5+Uurj0bV2gVd5rDrkTzVZvuU5Gx4xxmjswCYh5IT2YqFDZqCRTK3mB1I?=
 =?us-ascii?Q?zx/0erBYp9WRSGBdUgKT2a/DWgm69RLQHkRbvIPoIKoUWojxM9RaHGIeqobd?=
 =?us-ascii?Q?luitsxDL55h5rS80pN+KtgEmUsbGIc5mb/+DX15BILn8bf18BUKOqNyuF6qj?=
 =?us-ascii?Q?b8KCqK3RGHHjqSkn2UMz5YDh30BjwkiW0GgzZNfKiCxu939pM0HosW8+fU5a?=
 =?us-ascii?Q?6VNuZ3VnTm2F9BdkbM8jplQN+VxXqp5kyjY/Qwk32ByvlJyxWi51tGLBb16u?=
 =?us-ascii?Q?bRm5r38B9hpLgEfl2HbGDw/dFl8x9iXIm3cEQmDYMn/7V4WqGy+9n3P/R0Zs?=
 =?us-ascii?Q?1Jiyn4gDR2wkbiXyIJtmW3GcidDWlyC2AphAgYAPKPKF3DxcPojlrDwV4sEI?=
 =?us-ascii?Q?d5CnJx9fToOuha9u6vDOPxPhy8CUj12o/YQzxoXB5ZQlbzBS2Xc1pSUfG1DL?=
 =?us-ascii?Q?SLtWOKpmiPxXpWm1EKsx9UJmLEjmSYn7ScpUeGJY8pd9oi4WKy26oaGKDXTZ?=
 =?us-ascii?Q?z0DVDEp33uS1wNmZsdXJIMH3sX7+u9yW0EPhqDhmkrnAaFToZp88PEyVmUvD?=
 =?us-ascii?Q?aJR91YRjaQ0/naw1lHTiHFwa7f9HBsgYF1OrwaP18jHQU8bV676JeWMJTWyR?=
 =?us-ascii?Q?ems91qPtdg7i8imOwMq+2eiyC+UIG3n6XAFO2+Ju3/yRB6P5A29MjijzzRUa?=
 =?us-ascii?Q?7ImONiikS0Qv5aJas6w41S3hVtGpL+2wBsC31l6GTx56xH8pisbrtVDKJVWQ?=
 =?us-ascii?Q?qqTdqjeiOBp7O+MTdBb+lS0bLAH2c+SDi/xrsKWKHanAquVJVG/gR44bY4ZE?=
 =?us-ascii?Q?eeE1yVsJszyhiPp3GJyxNDHffdKolDma3rNtGP4jNmllFzvNC5O3aZqRAmj4?=
 =?us-ascii?Q?XtNVLA7iVDSF+3XmgcGtEV7+NTeDB1cBSpHPtCoy5OyRrG/yZhuUD3TxuKmS?=
 =?us-ascii?Q?Hrf4diZy1rqQala4KWdz8CzLSteAkz2cO9XYREn6dsNJprPi5Y8P1pVyBkJG?=
 =?us-ascii?Q?0RsxTfuBJ0motcR+HbLf/pjuN1/MujXL1AQvVb+mC9gXPK4b2zwSOxfqAbyy?=
 =?us-ascii?Q?7SVW6ncKfLiDN8HQB2CmBNX6+mN8aSW3DqUlklZ+SFx2cdkHtoOqUAj57oJ9?=
 =?us-ascii?Q?VKQ6yljbMfZRGMILRkINC4iMFntHHDa2a9M+57/lrcgv0ZJa0n28uIjRITc6?=
 =?us-ascii?Q?kURiajUMeNOATOt8fLfSae/qnKXbjPL7pWvOEXfOyBOuIxFhhxh/hl7sNRpc?=
 =?us-ascii?Q?XJPbWwf8RNB+FG/LmRBS/fap+wLEINvSI/UUK1VWPVmLuuSjzqCCKxDLxmEs?=
 =?us-ascii?Q?8ZC1EIHSt1iscbeioaSDdwCfl50/4EL0xUN5ib9+U4oYl2QC/DdUzJVo35sK?=
 =?us-ascii?Q?kaWDwQljqpR85zXnyH4b0WNJNjLE4Nqbu4gQg4X2I4d2im2iv/sPgfNl+H3s?=
 =?us-ascii?Q?9usElziAKGWuKLKr5iIWKt1cnos55wmk5w47zlRtdMUx2fk/OCB0F+ouQZm0?=
 =?us-ascii?Q?pax48Y/ts5KQe8QzSxdlMfaRcNiGd9HRAQhP2uCp6EaOuL+QgFQ4mkQpY3sG?=
 =?us-ascii?Q?PHENRUygKNRDrDtLj/OuKrCBf34FI+tq7E9WudGRI4dZJ0jCAXFCZlBM9QU9?=
 =?us-ascii?Q?a5V4wRtXmw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c8b2f3-64cd-4d41-1e71-08de63882267
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 00:55:48.7645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZeM2dnfPhsnzI3b9dybKdCvnh4VR7zZRfL1LrZT2siqct8EiMTg/njT1vnYvSAYnzDN69e/MbFr4cefshxIULg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8483

On Wed, Jan 28, 2026 at 11:31:17AM +0100, Arnaud Pouliquen wrote:
>On systems with multiple remote processors, the remoteproc device
>enumeration is not stable as it depends on the probe ordering.
>As a result, the /sys/class/remoteproc/remoteproc<x> entries do not
>always refer to the same remote processor instance, which complicates
>userspace applications.
>
>Inspired by the SPI implementation, this commit allows board-specific
>numbering to be defined in device tree while still supporting dynamically
>registered remote processors.
>
>For instance, on STM32MP25 Soc this can be used by defining:
>
>    aliases {
>        rproc0 = &m33_rproc;
>        rproc1 = &m0_rproc;
>    };
>
>When a "rproc<x>" DT alias is present, use it to assign a fixed
>"/sys/class/remoteproc/remoteproc<x>" entry.
>If no remoteproc alias is defined, keep the legacy index allocation.
>If only some remoteproc instances have an alias, allocate dynamic
>index starting after the highest alias index declared.
>
>Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

Tested this patch on i.MX943-EVK(patches for this platform still in my local)
with dual CM7 and one CM33S:
/sys/devices/platform/imx943-cm70/remoteproc/remoteproc1/firmware
/sys/devices/platform/imx943-cm33s/remoteproc/remoteproc0/firmware
/sys/devices/platform/imx943-cm71/remoteproc/remoteproc2/firmware

Tested-by: Peng Fan <peng.fan@nxp.com>

One nit below:

>---
>V2:
>- Introduces rproc_get_index based on Mathieu Poirier's suggestion.
>  An update compared to Mathieu's version is that the call to
>  ida_alloc_range is retained if an alias is found for the remote device,
>  to balance with ida_free().
>- Rename DT alias stem from "remoteproc" to "rproc" to be consistent with
>  keytone driver.
>---
> drivers/remoteproc/remoteproc_core.c | 40 ++++++++++++++++++++++++++--
> include/linux/remoteproc.h           |  3 +++
> 2 files changed, 41 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>index aada2780b343..38d6eb1c9483 100644
>--- a/drivers/remoteproc/remoteproc_core.c
>+++ b/drivers/remoteproc/remoteproc_core.c
>@@ -2433,6 +2433,43 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
> 	return 0;
> }
> 
>+/**
>+ * rproc_get_index - assign a unique device index for a remote processor
>+ * @dev: device associated with the remote processor
>+ *
>+ * Look for a static index coming from the "rproc" DT alias
>+ * (e.g. "rproc0"). If none is found, start allocating
>+ * dynamic IDs after the highest alias in use.
>+ *
>+ * Return: a non-negative index on success, or a negative error code on failure.
>+ */
>+static int rproc_get_index(struct device *dev)
>+{
>+	int index;
>+
>+	/* No DT to deal with */
>+	if (!dev->of_node)
>+		goto legacy;
>+
>+	/* See if an alias has been assigned to this remoteproc */
>+	index = of_alias_get_id(dev->of_node, RPROC_ALIAS);
>+	if (index >= 0)
>+		return  ida_alloc_range(&rproc_dev_index, index, index,
>+					GFP_KERNEL);

Nit: "return ida_alloc_range"

Regards,
Peng
