Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2050.outbound.protection.outlook.com [40.107.20.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1E91E4A9;
	Sun, 27 Apr 2025 00:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745715577; cv=fail; b=aFgirxwmnp+/AYFePstH5Xd+Kdl7TobrBZAa8ykMYQt5BuVxonG9HpM1iol29jT5lT7NJ40TFyLkleoUqgBj0D/F19MR9zsH0nWx318k2iQmDrikHhjh37loUxXz1GTKMpwqvYW1mujGo3LEXjVi7SUBEu2mX32JWrN1TQfWGoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745715577; c=relaxed/simple;
	bh=0HNieE0oFS1eIVRazU2UxKOFIG/PtgXpm085K+JyHGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JEI9PpZwR31AnlGLBFcMP6H3Z/wDJhJYRLsUeAkq17WfsI39z8/QobxpWE8MKV2m6GIJknCJShgY+E24NGvcErMqquNK1fiCINwBQogOHdD8yoOFWn/G0GSk4g3Wtuv0iOZ6yyMAt15C6m2Auzux0MwVEh9vUoBLOCmQO5TAFWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OSR8i7Lq; arc=fail smtp.client-ip=40.107.20.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OSR8i7Lq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c2YiHb41c8LBgGiXaB68+SEjMWT249njNeFdhpwBjbAMPlYhFVjYm03gGa8d6Yxog4i/liURWB9ijg/85FdYcL4XJ72iuVXJuaNL7d1PfqWWQM3e31DjVn2I2UddK/SfsRcmEBWAo5rn8mGlwadseFrFy2fDcSseyXTNSyOYhoFTRKpMlRtPa3Bu+Lp3a9sfok5/BTmHpHCq2yIVOFoLb3ZEujnDBJB+f47j1APoF24uNXwsrGBTN4Ix4hloFyl6lCuQdWEdPAV8s2I18alF+AOUvkJffEp2IEh5xrKWmxTMoxRwp0YVlOppds+GjbFi8bhU3+l7NBYl+BK0UUOHhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xesSsJpJL2X75Uumni6RX0jNzAglhJA+QXXpcqEW35A=;
 b=BCjAWeAtT1GkaGyf3DP5GrnlHughg9kmHj/Xb73dpPJdYWTbwnTNCZE3MskJVxfHiRlqkq7IjeeXqWbqnIvjll7aPPn6JnzNY5MiNlge85aRdSlmco//+DgYng8rP+lIpVWBbNyHGdHrGbCB/2gLfAKvWy5zR3fmh4iH3ivxt3KBq/kYb4cgHwmIbs67cWXJTAJ2L6JZli22q6NSYMk77swhQP4PCwgk2fllYotOd6DbdqTxzng7JSoSu08pD2c0PqAFForJlxKwa76EDOGDJmc6FSGNHvVGpbQEKsezSdRL1WHodx6UbAWx8aw3F4OtqeZywcLVGQXv7W6WADmeJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xesSsJpJL2X75Uumni6RX0jNzAglhJA+QXXpcqEW35A=;
 b=OSR8i7Lqi1n5cHAlLxvYFhTgEi3kPXhDEI01P8E2YRPPVwW3ren8VCXYCsv7jg4PA0ZC0glMVDoSWcLQvOmmkXKSk7ca7cdUiXOUqAVexN62tm9O/0jlk+CgBQF7HgzSWgZZgz9lhKRnTslEWd+uTcO9zciLHQRt+H5Vc8d6fW9hQmNmTNff7RUgDyvbZsf2gLdzjVlsUkxGGr95iNYsthJ/GEKHZue4Adz6d5bDzQ1zrjCBsy223jzc6IxGoamjb9kWrd198hDe5HnfwvZUB+3pzuW5tCHwjlAtgl0Phc0+gAxi2Xuq+TqnL7v8XshGhKGwmFzElN99nthmrHhY+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8380.eurprd04.prod.outlook.com (2603:10a6:10:243::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Sun, 27 Apr
 2025 00:59:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8678.025; Sun, 27 Apr 2025
 00:59:29 +0000
Date: Sun, 27 Apr 2025 10:08:25 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Hiago De Franco <hiagofranco@gmail.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com, linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: replace devm_clk_get() with
 devm_clk_get_optional()
Message-ID: <20250427020825.GC13806@nxa18884-linux>
References: <20250423155131.101473-1-hiagofranco@gmail.com>
 <aAkf6bxBLjgFjvIZ@p14s>
 <20250423192156.b44wobzcgwgojzk3@hiago-nb>
 <20250426134958.GB13806@nxa18884-linux>
 <CANLsYkzLZKHpwv+Zz7YqtU4NCy7ZmapuzpgtfxsRfoV=Ve8rVg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkzLZKHpwv+Zz7YqtU4NCy7ZmapuzpgtfxsRfoV=Ve8rVg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR06CA0181.apcprd06.prod.outlook.com (2603:1096:4:1::13)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB8380:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fcac053-12ef-42b9-0283-08dd8526c358
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yIRdhMfEuOC+A4V5shw6BB5h6NL7tZ5OtmgGuj559sRhQ571dTyR2Az5Kd6h?=
 =?us-ascii?Q?Ye7kZ6XiVQm5uR6gkr8GR2lAOLYe7DMEewsEZZqr+R30gjaDp/+RKL1OF2rt?=
 =?us-ascii?Q?nQvBOmut7fFaWiPnxXbr8ITgmBTfa+nSrkc3J4q1C/HrdfGXeIXfX5mLcRNX?=
 =?us-ascii?Q?5pKaMZLYM8+34pE4rSRilb24FrTyAmC3fHhG9skd8suyuOQ3AhgQsb8PzU5e?=
 =?us-ascii?Q?hXUKadn4G1e+Hm47n5QX1thMQr/GoQqzQT4OXZD/VC44eI6n79fHNNqUZCpe?=
 =?us-ascii?Q?5o8/kV2GEmV8PbwVgvSNweBBgzoJKlwnjdACpyIug+GaDZI2iQAWf+euucqa?=
 =?us-ascii?Q?iafHV2N0w5v95OQVF909YOpy6JXXfQuGG6w//MpMtDFyOirNt9u+tYYXDrYW?=
 =?us-ascii?Q?3uCbPAJU+Dgeis7lH0IZKziXZGTrQOmI9EEyQ6QW1nfijpPitLcx1h2YnMRw?=
 =?us-ascii?Q?zIqjnEMwHxw5APkyGVnzmNXRxqCqAQuVM4Dm/bw0xjYw/t0rui2f3DMFaE2i?=
 =?us-ascii?Q?v8fvcweXISUgwTX40/qkoYZqFK1VmK27KM4gCPVaTM1/h+9gu4kAaGT3lZdD?=
 =?us-ascii?Q?5cAY46zR0gmyeck8dr1O0zsIwql4vp1+Fra2GfgQ13S+byiwbuhNvQ2wBEcM?=
 =?us-ascii?Q?ey9u1Sc41HYV0jI0w2T/gfgC/FbyvvRN5hhbmZl16zzxrQ7lNUofgu//j35F?=
 =?us-ascii?Q?8gdhWMWhSPuYkO34xze0BJ0bHX2MwiOtJpInB+SNJG+KV2R44rE2YsHs7IzS?=
 =?us-ascii?Q?K98nszVH1bC+r/L7z+q7qIZWpy9UFAS7zkwhYHLt4oY9+VaEwp0eHV2KbWiI?=
 =?us-ascii?Q?azV9MgOIUXcv5QzTVl4wpf0VK63SEMG+ADCmYwCgRCv5VgceBhr9xksnPdQV?=
 =?us-ascii?Q?3coHB2KrIyOwYObupW3niXM4LFQ9rdGiVfqWrljkvAxA4CI6T3CEqjusHxX7?=
 =?us-ascii?Q?6sG4kRehL3KLCzeZ8G5RG1TZ76OmzPm/XjvXTpCG32dPAsr9lmqtPr/Q8fjZ?=
 =?us-ascii?Q?b/BGerI0TyF/ns3PWJOc6dK4V+ozW9CtA38va3oqF4gg+Pk9pzINQC5sT4Fn?=
 =?us-ascii?Q?h7X0jtA/GizQUGKdym9fgBm74FQbDzEHn+XB0SlFel/jfo3SHnxKYpHmFEVR?=
 =?us-ascii?Q?JNOc3qh94OvT1YG8Hr9XvzW9ic8KTDQkf5N82fl2rS4K18zOibYXOf2STxOE?=
 =?us-ascii?Q?avd3ZeB7fDXpFgxNgjIQdCdk7DNIqTp4gBzsQ/dAqkof6RZET2sQaFCHDW0R?=
 =?us-ascii?Q?/uBiIj3Eo7Ry5GN/7ZlfaCxuaUTHf34B2EIksV7dGoKY7ogUDC2Vy/A+557o?=
 =?us-ascii?Q?5YqhkTDcxfyCv2WF/psVYaAjv7BVhpPRL517PTpUYg5pUtf0Hlmz+JXyXenn?=
 =?us-ascii?Q?HMGfdtfOhWIcG5hfIeGl8oDowKKV5kw6uTp4kRgLryps0yw9hxp4c7MdRdXE?=
 =?us-ascii?Q?ugx2h98vvf11BGn0C5OwUvXluU8Y2nz1NqCR9CSNiMZwJo3rc66R5qbQobWA?=
 =?us-ascii?Q?7Ux3qP744mLQfQs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lSu4rmWm8jopNLOGpIeBoNp+SZAwSg+Z2FYErljC4HJBKUDepIU6ZIeeXrE+?=
 =?us-ascii?Q?hs+nF0XFJvhNicL43c0rg1onWWRjzOLy1NXCKdZWxaf/XAwtIYS484NYfwjW?=
 =?us-ascii?Q?yNYvuZb59UAMKyR6TZI73/6TCNsYsBTVygsYQzS+xC+tvO6Md+yG5WyHSBfM?=
 =?us-ascii?Q?z1v87IRJ139EoG3clbKgBLUkqpM3/exUSmAnGySe/RntKzXFz8+Y53/8aPe4?=
 =?us-ascii?Q?L1kxgsIzeZzwslN+Co4k+/EGoJrFQJnuhQ+Cqgf+qNWkwmSyhxUuFgb52Lf6?=
 =?us-ascii?Q?SzFqN/z8Nk5YM33Z39J9Si+VkTn+HOe83POTGyTba3McULDiXPNMWG9NKjJL?=
 =?us-ascii?Q?JF47bZbe2WgeyZhTWnSXbczOl6lPEDfE0pR9rgRhVHWjjWO5sMZfLrCDeI0F?=
 =?us-ascii?Q?QadrNwInNC+FqcxfeuezXXf5RpLe4h0Mk/BwwOmobb834aPxJMaoTUddb45h?=
 =?us-ascii?Q?Y1DiKIGOArdKC3AhI5i+3xLiQl/2V724D3rB6jyvkGOYxBAgZzxryuzb51bz?=
 =?us-ascii?Q?FQUgju3ebpg3nHY6LXXLciPjQk7Bm3LNETV81VMJR1LLuk4Zo6cP67zJ+Brr?=
 =?us-ascii?Q?wOz4fDzLW10CiTAYz0FyvwYwOQg6i255I0dvijbH60GPJlNlodj1ZtNSOo9/?=
 =?us-ascii?Q?lYd0ryMno/FCb9125AyfHQi1Em2CW9MdDEm37Os2nLw4pTto0NpDO0is1Chi?=
 =?us-ascii?Q?v0HIEF9+Gn5NGhz5jBaTAhgdoVDCGXiITHQtR+RqCUs+N6fhjesBQhb8+aOQ?=
 =?us-ascii?Q?HAdG5qsBMfhsPk+h5NBEinQ0o9TXw8YloJywctYNcNZhhcoa+xdnVFFF+P66?=
 =?us-ascii?Q?zfQDZ6EoETl2FmiawxXz3l8CDEbGaWNhzWsPbj812XDsLokY7AoVLgEzqfPm?=
 =?us-ascii?Q?Uj6gC4lH3mCQ0g/cbOlnZp1QxGlVF7gyAH/PlY/Oo0QVT2aFNrnbyaQ+lTUw?=
 =?us-ascii?Q?h1HadMfnvzIfTD/+yOGPwuwCglkNr7k4krzwLA6rwYrxC5nPaxcMxNtO+Kug?=
 =?us-ascii?Q?8+iksHXwnfD42x9NkquKppLRBCD0mRhAfJlHrBf+MH71UJ+22fStka81tUhI?=
 =?us-ascii?Q?mg4p/EcgXGtL41wn+coAmzDJiO2w2Y5PxKdynJAn1ToUGzXpJ2zw/CG7JFxs?=
 =?us-ascii?Q?MqKa6s9yAhoBskSEU3IowV0a2wNuiRvdfb8OcKd6g79SkbfxUp85xfQU6MK/?=
 =?us-ascii?Q?JLVog8NOZGgoUR0R4Vbyoig1ArbYJFrwbCCk/+oPG+Q1qSP5bmK1QzA65XLA?=
 =?us-ascii?Q?fzJk9NEJdFHa3w9LZ7GwdyfuqH8kgGOj2s+o37xKRif5qdA08R/xiJSVzQ04?=
 =?us-ascii?Q?Ou4/WfTDz/CpzgtsHQPyodecDk6g5CoblRUptnuBOj6AqO1f/GMD09KHGbOt?=
 =?us-ascii?Q?XhKkP79AIHDGnhK7JLWDc645gyZKtNLVMkpd/LpBtwlHaG1ONK1WjPcxAXec?=
 =?us-ascii?Q?BSCLRHlwZl1t8jWP20rvnACTlCyCTcCPskVkigyEkPAkqFaJVRbpfsxC07q0?=
 =?us-ascii?Q?STspJB01jmfx7u9KjtsKIB8lEZW+3H1AVu5Bcnl11BljOpVa77Mo+5QmW6De?=
 =?us-ascii?Q?1o2ata3CUqSyP+bRQjwVfRdc2uGPP4otfdtKAb4L?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fcac053-12ef-42b9-0283-08dd8526c358
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2025 00:59:29.8339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dc0YD2U/BxrpnRjYmj6mylAHr1kBnuZhn6SG7lXLPPF/+sK4MbFDWPTXMYTBjGmrePbWnq5gAI6P6SQKcjdSbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8380

On Sat, Apr 26, 2025 at 03:47:50PM -0600, Mathieu Poirier wrote:
>On Sat, 26 Apr 2025 at 06:41, Peng Fan <peng.fan@oss.nxp.com> wrote:
>>
>> On Wed, Apr 23, 2025 at 04:21:56PM -0300, Hiago De Franco wrote:
>> >Hi Mathieu,
>> >
>> >On Wed, Apr 23, 2025 at 11:14:17AM -0600, Mathieu Poirier wrote:
>> >> Good morning,
>> >>
>> >> On Wed, Apr 23, 2025 at 12:51:31PM -0300, Hiago De Franco wrote:
>> >> > From: Hiago De Franco <hiago.franco@toradex.com>
>> >> >
>> >> > The "clocks" device tree property is not mandatory, and if not provided
>> >> > Linux will shut down the remote processor power domain during boot if it
>> >> > is not present, even if it is running (e.g. it was started by U-Boot's
>> >> > bootaux command).
>> >>
>> >> If a clock is not present imx_rproc_probe() will fail, the clock will remain
>> >> unused and Linux will switch it off.  I think that is description of what is
>> >> happening.
>> >>
>> >> >
>> >> > Use the optional devm_clk_get instead.
>> >> >
>> >> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
>> >> > ---
>> >> >  drivers/remoteproc/imx_rproc.c | 2 +-
>> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >> >
>> >> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>> >> > index 74299af1d7f1..45b5b23980ec 100644
>> >> > --- a/drivers/remoteproc/imx_rproc.c
>> >> > +++ b/drivers/remoteproc/imx_rproc.c
>> >> > @@ -1033,7 +1033,7 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
>> >> >    if (dcfg->method == IMX_RPROC_NONE)
>> >> >            return 0;
>> >> >
>> >> > -  priv->clk = devm_clk_get(dev, NULL);
>> >> > +  priv->clk = devm_clk_get_optional(dev, NULL);
>> >>
>> >> If my understanding of the problem is correct (see above), I think the real fix
>> >> for this is to make the "clocks" property mandatory in the bindings.
>> >
>> >Thanks for the information, from my understanding this was coming from
>> >the power domain, I had a small discussion about this with Peng [1],
>> >where I was able to bisect the issue into a scu-pd commit. But I see
>> >your point for this commit, I can update the commit description.
>> >
>> >About the change itself, I was not able to find a defined clock to use
>> >into the device tree node for the i.MX8QXP/DX, maybe I am missing
>> >something? I saw some downstream device trees from NXP using a dummy
>> >clock, which I tested and it works, however this would not be the
>> >correct solution.
>>
>> The clock should be "clocks = <&clk IMX_SC_R_M4_0_PID0 IMX_SC_PM_CLK_CPU>;" for
>> i.MX8QX. This should be added into device tree to reflect the hardware truth.
>>
>> But there are several working configurations regarding M4 on i.MX8QM/QX/DX/DXL.
>>
>> 1. M4 in a separate SCFW partition, linux has no permission to configure
>>   anything except building rpmsg connection.
>> 2. M4 in same SCFW partition with Linux, Linux has permission to start/stop M4
>>    In this scenario, there are two more items:
>>    -(2.1) M4 is started by bootloader
>>    -(2.2) M4 is started by Linux remoteproc.
>>
>>
>> Current imx_rproc.c only supports 1 and 2.2,
>> Your case is 2.1.
>
>Remoteproc operations .attach() and .detach() are implemented in
>imx_rproc.c and as such, 2.1 _is_ supported.

For i.MX8QM/QXP/DX/DXL, attach/detach is for case 1.

To support case 2.1, more code needs to be added in imx_rproc_detect_mode,

Something as below(no test, no build, just write example):
diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 09d02f7d9e42..eeb1cd19314c 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1019,6 +1019,9 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
                        if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
                                return -EINVAL;

+                       if (imx_sc_cpu_is_started(M4X))
+                               priv->rproc->state = RPROC_DETACHED;
+
                        return imx_rproc_attach_pd(priv);
                }


When we let uboot to start M4(case 1), we(NXP) only wanna to add some test
code in U-Boot. Not intended to make it for remoteproc

But if there are users wanna case 1 in their product, we could support it,
1. adding cpu state detection in drivers/firmware/imx/
2. Use the cpu state API in imx_rproc.c to detect cpu is started by bootloader
   when the cpu is owned by linux.

>
>>
>> There is a clk_prepare_enable which not work for case 1 if adding a real
>> clock entry.
>>
>> So need move clk_prepare_enable to imx_rproc_start, not leaving it in probe?`
>> But for case 2.1, without clk_prepare_enable, kernel clk disable unused will
>> turn off the clk and hang M4. But even leaving clk_prepare_enable in probe,
>> if imx_rproc.c is built as module, clk_disable_unused will still turn
>> off the clk and hang M4.
>>
>> So for case 2.1, there is no good way to keep M4 clk not being turned off,
>> unless pass "clk_ignore_unused" in bootargs.
>>
>
>Isn't there something like an "always on" property for clocks?

There is CLK_IS_CRITICAL flag that could be added in clk driver, but this
is harcoded in clk driver. Using this flag means for case 2.2, there is no
chance to disable the clock when stop M4.

There is no device tree property to indicate a clk is always on as I know.

Regards,
Peng
>
>>
>> For case 2.2, you could use the clock entry to enable the clock, but actually
>> SCFW will handle the clock automatically when power on M4.
>>
>> If you have concern on the clk here, you may considering the various cases
>> and choose which to touch the clk, which to ignore the clk, but not
>> "clk get and clk prepare" for all cases in current imx_rproc.c implementation.
>>
>> Regards,
>> Peng
>>
>>
>> >
>> >[1] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
>> >
>> >Cheers,
>> >Hiago.
>> >
>> >>
>> >> Daniel and Iuliana, I'd like to have your opinions on this.
>> >>
>> >> Thanks,
>> >> Mathieu
>> >>
>> >> >    if (IS_ERR(priv->clk)) {
>> >> >            dev_err(dev, "Failed to get clock\n");
>> >> >            return PTR_ERR(priv->clk);
>> >> > --
>> >> > 2.39.5
>> >> >
