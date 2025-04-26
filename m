Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2061.outbound.protection.outlook.com [40.107.105.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A631020E6;
	Sat, 26 Apr 2025 12:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745671268; cv=fail; b=IjhMZAhlXkvgGm7k52ZQC1SdLuGGMpfnpEelia1TZZj63G2poqZKR6Blcwpe0gKP8GC3Siqjh6Qn4Hi/kdi20iBvKXiQZMl2rMBFmMNNv/Mfnyp+uJfje2uM+IEZ9ALk68W4nfGqSFYFOdijxDOJHE6Ey+fPBRpEvwXbO5IlNnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745671268; c=relaxed/simple;
	bh=Tzcq5pk2Ptwfb255VLzmZQrx+9C+6hazTGBceg+I6gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IosyhiP+rULj4c5J2lSVfcGdQVnQ/JNd0NPtbKEjBSjJdJEnKcLKqmQ10ihQueDs555d8vw1ebOnlExzoIRx2Jy0e7MKcd9ysPfy/3CW+rz0lAbdW8x+WMZRRiWmiWAG3MK8gN0VeHMFWZeklEGK3aRVrjG6/LqyAOm+kQla5+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=L8VMJFaW; arc=fail smtp.client-ip=40.107.105.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="L8VMJFaW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GmNmWUSyVD+qy+VvQ8+6s/OiWdr5Y0gajJARF12txvKGr2515R5xtnUousViQ39StkFn30yPCjh2NSTBoUniPeQ7M919fvD2vAh4bmzHrgYlLGFXonu+ObxgWt2BGmaSE0pm4MpP4umxaVesA43OP21/EE4/h+QPF3ekwv9ZFdyF5hAxWDbrLpIlB5FIm9UBoHgRZr5pOotPjVG8mOoaEQX2y8CMCd4OK12HwG6dvO83Y3MlCsCH0SP9fqzNmMAZdVmd0azbYeTnfIxHKyABXXKZFUopZejgrFmV0FOWm+vb6RBTF4TFE3Gv327ggJlvsNwYcRykMVGr4qBhNqhX4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJPn9vdr0LDd6HgiYNuZk0F172q/wNp24GHszXjOMlg=;
 b=QXkmD/7QZ0XMAYSJ2qt2IOQ/GMENpUrtW5eHgtpECfzd3uAIMsjtcK2xygypU77llBsS6hi0lVzS6XJsQDlTIvm9dVSnKX1Qjb8hlanRwmm7hAX3vtzWYSOv87V09aNZgIO7X4HwyuDryAo4QHoIW3TxYtjX8KqU27szmP5XPNZyRedVNri08e+KasO7AP/f8hXSyzYxTrq1az02hF5/xHoNUMSpiDOBqQkfLPrAYjlVpl4neNp2JO5VZcUD8c4SfYmyRGqG/T5W1Sy2upcYeAU5dx2UiaYfJmiQHTisv+n6AQWICoATTIkhyUXwM+CWpjGnqVvyVeTakbu7xWmqjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJPn9vdr0LDd6HgiYNuZk0F172q/wNp24GHszXjOMlg=;
 b=L8VMJFaWX6MkfF3y46ti9z5U7auZW+zNRkBl+YEK/mzhD1ldmbeSLpf4NBxCda0OsLP099RDJGqzIsZM4jaIYrmOJBBs4TfzYF9CSlzqMCwcRnyFFoBD0Kwofo01iz1hpFAz2Qpfieq34l8vs4t6WApWzLeS9M2ncc2JI8aEFMUAbR/vBV3hfW9QasjAALMi/845CHKdg4PPskr2+9WIQ82bPqKo3AwZRZGoEa1m7kQN+Ud7hiQnkxKsMD/VDzd/oh4eMnCKbmm4HtDIe1JuFWwLOF3W01ZKvrp6JOQ7pCAZoB6gUgWtKBZr40KzmNDqoCfgVPfJs+q91jbYULUWXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by FRWPR04MB11102.eurprd04.prod.outlook.com (2603:10a6:d10:174::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.28; Sat, 26 Apr
 2025 12:41:01 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8678.025; Sat, 26 Apr 2025
 12:41:01 +0000
Date: Sat, 26 Apr 2025 21:49:58 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, daniel.baluta@nxp.com,
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
Message-ID: <20250426134958.GB13806@nxa18884-linux>
References: <20250423155131.101473-1-hiagofranco@gmail.com>
 <aAkf6bxBLjgFjvIZ@p14s>
 <20250423192156.b44wobzcgwgojzk3@hiago-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423192156.b44wobzcgwgojzk3@hiago-nb>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|FRWPR04MB11102:EE_
X-MS-Office365-Filtering-Correlation-Id: 112aa236-7f02-4c5d-aba4-08dd84bf9a14
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?30eL0SxILaNWr1HJHPdkO1iR0wvbUi4n8VGf1RRDqgxnasjxBqaGTE5/kglT?=
 =?us-ascii?Q?+U4sNl8+mXJUTh9cbI9e/x3Nb0gFskzMkOa67PUzwL1A+xuEDQRFFO5/VJsG?=
 =?us-ascii?Q?uEUnEWkkL+/7RmCwCLNxniPBITMbY9iphWMBxGK9xQjo0yzjcyU09k2LYnUl?=
 =?us-ascii?Q?KHQs3Ooe6Gkry71pz9GPmAuT/VXpGEarFr4xKne5JNXjclkUDDJwFAnPTGCD?=
 =?us-ascii?Q?PwWmm0Lm5R/mBwnnLvWHfFaBn38NMsI9xlKtev73K8Cq1816Cp+vZE0YI6qL?=
 =?us-ascii?Q?f++kR3hzTGUrTTXy5OfLphS+Ec+/i8itIgnUR6ZOfvLwgpia/RkaqoHqPdfg?=
 =?us-ascii?Q?EOk+CdMZ9XZPx4+zG9H4uDDeuzb1NvFgZyfO8UGxIt7ynxE0hNN7g7c5r5lN?=
 =?us-ascii?Q?uEMw47C2x8yJLTK22IrFjJeSDbDDaiJpcgiTFRzQVP6JA/+HjQHE1cbBc0sL?=
 =?us-ascii?Q?Mj9bQlN8nk2e/we9dvcj0UIZrvOjNK6PaSH1xfemvP0LT16yoI9n8urrMyPp?=
 =?us-ascii?Q?S5xiMtFEY/fi2GqWgQp5bJjdFIvWND6e/A/xBIqrfqijt8ukJFhIUILLNoat?=
 =?us-ascii?Q?3L7d9G5KXVH5nBxVrgaPkHjmJs9F2vMhXLbO9HVtPhHgVVNXeqUiXpkeou6p?=
 =?us-ascii?Q?PlPenp7nAkDnnG2CEdGgqQYg8SJIwBqa2ePhb2jON60o6Sygs/yLbPlz9WGb?=
 =?us-ascii?Q?LRUi4In4Zv0LYeJ62frMRHsU5CR0SOKRCoZyRGx9y5Rv+2M4zUDzS0xrw2wV?=
 =?us-ascii?Q?XFQiSUsRO9BDx+0T0XRfOqDf8FsmCtLd5dc8BDsb28sa/PENuGtktbs7kG5G?=
 =?us-ascii?Q?Z1nwGeRCX+y/weriWlerCsFuunDUIrhiIIGnj4D53RY4cQMVK72wMFrzRANp?=
 =?us-ascii?Q?hMAK7+bkPq1/qV6Up0A1GaxCLzXuEC10PmShUox+FtXg1CQZlabD+TTv1cIr?=
 =?us-ascii?Q?PsjdEwruJyeI9NQQmFiZ6t2Ql6evt/rc26k9xarPy3cDCiCufP1NQbp9tOdn?=
 =?us-ascii?Q?wM++4maS12rsQBCsE66TjJ85OksNbTWEYZ33/4Qi+GtLOdSfKud7CgKDVXj4?=
 =?us-ascii?Q?lIpSyVgXtv4eYqDFEX0R2Ql5x1AyiqMeKvrY4Rr45Ed7WnN388x7z8SA565w?=
 =?us-ascii?Q?EYfb27RCuByV+Kw8bA1ffgS9Bu88P8F1yyntok6IHgdnqNJ3sjEzr+yz+WmX?=
 =?us-ascii?Q?qUj6PZPHTZdYSrwpKvKZ+p0FB0e6R5muledFdldVPfdkLTOS54LwQ8AHQd3E?=
 =?us-ascii?Q?62z+swmLxu46xqvOQW5OOsaKloApf8lWcD3KuyB0NlJbVjXNuFe4owunEFd5?=
 =?us-ascii?Q?8xK7JiLXE3hW3EJtCBMCT56DB4Udgz/vJQWgQ0zr6JPKeEa9xTFBh7tSUG8+?=
 =?us-ascii?Q?dz+6+Ksahylml0wDj768MKpb5oBnkAQdlu2ZEGNgiYLDiY9XHDd/PiiJ1Pu4?=
 =?us-ascii?Q?ZjBtY903k5xLzWSrVJXXrfwehfVlBTklcrYGY9KKGcsnLXZpItESEbKHb81U?=
 =?us-ascii?Q?ohNVwg5pTdM0348=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LpNg7jMm26EI66q5blkaGtOlmGtB0nuR2cn/x98qbyCD/VSrLiCKxJGfGQW3?=
 =?us-ascii?Q?575KQKXwKbbQoTOaqmpztJBezqjINpD7spTaz/hHtRSLYneRKut3pw7lByKE?=
 =?us-ascii?Q?+22Tv5pTTxG3cqrpMOI0yLzBE7c8Qo4r8jUUoGS4r7uOmKADWeZ0CvXcjVtS?=
 =?us-ascii?Q?1y0YJ3vonKp8zJm6WO8l/qrhhRnMUn4sBziI30mQci6JsRaCDjGEQiAwa16k?=
 =?us-ascii?Q?uHuchKT/+anUheClXcv31Py4Y+0rtpmFD8WfmJeAkblVcwQXYiQ07+y/jMmh?=
 =?us-ascii?Q?kF3iUsaDhUt2SvDFbpcXfqPtjZF6V8A+JcEQWH43DfN57hdgKtv4zEk0aW4f?=
 =?us-ascii?Q?zZUzTJqg+un/kXIf77jL262e/gQeOpHnBnspQnoLrvQUvNVQVxbrSfE+Myc+?=
 =?us-ascii?Q?Agi+ZrpT7l+D3K0donJzLw8XXGzPn2+JUVE65jUtaCrLsQhlxFsSaIluLD1Q?=
 =?us-ascii?Q?XNMt8rKcVQNeVQZmFyeVXh8f4B9zKhaVh55FpNzCHX51TKKESnQHzXSXWDkK?=
 =?us-ascii?Q?eFrMVFPAVlksrzF8Iq27CheZ8+6lINu7EQV9Yqg1GE4uiXVWaAjJuhpXMKMr?=
 =?us-ascii?Q?Unnx4yTLU9PV5YxCPsRUdFp5dVYbbvZuOANYwVD2UGH09b1198OxjtcxKQ00?=
 =?us-ascii?Q?u1JHVSle5wW7YbqMZauZnovyXeOV0Soy8x8gYNNEkiUXhISbNESo2cv98V4A?=
 =?us-ascii?Q?7JEh3qS91+Nl8gp2ETzl6fbcJT538fbbAPyOB815WHEoo5+3RxynAIKF5VqD?=
 =?us-ascii?Q?JKAno6atXKQH/uTr8gpYbWx5szg6987D2f7+W+OcdyB1NKuhXugMW5yzXI78?=
 =?us-ascii?Q?gxrT+7OSwYrg+sfki9/AEUvtoUxS2nI/oEc/CbVz7wQKXLowFV+4NVbUyZdU?=
 =?us-ascii?Q?g5vD1wVCXhjzsVVrwT91PjYCO6GyrzoIVHvqoW9JA3/yMFAB3XTlEgbfKHGU?=
 =?us-ascii?Q?pmzNSsggxGTzzVlcwaGYDYf/iwBk0qc4yP/GfaXFvKWtO6v2zk2MnsP6OM6i?=
 =?us-ascii?Q?d4GGdS5fzzs4c1ef4zpZPRjo7+5zZi9Yc/AyQkrl1BSwBKmFLwVolfcVRxJz?=
 =?us-ascii?Q?KmyWGJORqyXgx581VtMqAXfVUFRr0KPqzQzee9zMNXwdDpyEAS7b20A3zK7d?=
 =?us-ascii?Q?nRniEDk5hhWnUhMjlSMw1yRG6DmcI8M0cGo1uNpFQgERQI0r6EHPlqFE8CX7?=
 =?us-ascii?Q?+SwRJfoNsTc3UjAiczO8V3ja8lslzeNKdRNimDMs6gRxFXgCx3Mc1F3p8O/f?=
 =?us-ascii?Q?wWrgYUBVpEKeh0y545gakG+AYQyCFclWC5+Nl2j5gNn1kg8gbYhOgNT+f8Ft?=
 =?us-ascii?Q?0wSbcxfJB3MbNlmGxwum9S4lYgxPFKC2f6QVHw01wwa1Byr8D1t//g/t9lvb?=
 =?us-ascii?Q?rA1yUm7CmIvbVrYQivohlUNuc3SNRrpUtCZrJ9g8VVgs3fpm9gXCfJOZ3yUl?=
 =?us-ascii?Q?nSoFCjJVdUfxFCnDMcWJ0BnSrjkkrzZhC4feCQL16ZK653yvsBU44y6xTWTl?=
 =?us-ascii?Q?M7uzihvrZKqUhrEJGkMl1rk+ZRRdvBbwFL+yVDplDHdtQIwGCgNkSn4aRb0J?=
 =?us-ascii?Q?rwc5ncyPPPYOUC46+BmDhqT1xVfKpaBmUrNHW+/5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 112aa236-7f02-4c5d-aba4-08dd84bf9a14
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2025 12:41:01.6835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xW03cTfZbxl1/zmmeZANeEZjc7BH2ixhDMsBeCPkyF7ceggSKLQNTknes4uxNkunOAy9BFiWNqblokv6GOuZzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11102

On Wed, Apr 23, 2025 at 04:21:56PM -0300, Hiago De Franco wrote:
>Hi Mathieu,
>
>On Wed, Apr 23, 2025 at 11:14:17AM -0600, Mathieu Poirier wrote:
>> Good morning,
>> 
>> On Wed, Apr 23, 2025 at 12:51:31PM -0300, Hiago De Franco wrote:
>> > From: Hiago De Franco <hiago.franco@toradex.com>
>> > 
>> > The "clocks" device tree property is not mandatory, and if not provided
>> > Linux will shut down the remote processor power domain during boot if it
>> > is not present, even if it is running (e.g. it was started by U-Boot's
>> > bootaux command).
>> 
>> If a clock is not present imx_rproc_probe() will fail, the clock will remain
>> unused and Linux will switch it off.  I think that is description of what is
>> happening.
>> 
>> > 
>> > Use the optional devm_clk_get instead.
>> > 
>> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
>> > ---
>> >  drivers/remoteproc/imx_rproc.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > 
>> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>> > index 74299af1d7f1..45b5b23980ec 100644
>> > --- a/drivers/remoteproc/imx_rproc.c
>> > +++ b/drivers/remoteproc/imx_rproc.c
>> > @@ -1033,7 +1033,7 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
>> >  	if (dcfg->method == IMX_RPROC_NONE)
>> >  		return 0;
>> >  
>> > -	priv->clk = devm_clk_get(dev, NULL);
>> > +	priv->clk = devm_clk_get_optional(dev, NULL);
>> 
>> If my understanding of the problem is correct (see above), I think the real fix
>> for this is to make the "clocks" property mandatory in the bindings.
>
>Thanks for the information, from my understanding this was coming from
>the power domain, I had a small discussion about this with Peng [1],
>where I was able to bisect the issue into a scu-pd commit. But I see
>your point for this commit, I can update the commit description.
>
>About the change itself, I was not able to find a defined clock to use
>into the device tree node for the i.MX8QXP/DX, maybe I am missing
>something? I saw some downstream device trees from NXP using a dummy
>clock, which I tested and it works, however this would not be the
>correct solution.

The clock should be "clocks = <&clk IMX_SC_R_M4_0_PID0 IMX_SC_PM_CLK_CPU>;" for
i.MX8QX. This should be added into device tree to reflect the hardware truth.

But there are several working configurations regarding M4 on i.MX8QM/QX/DX/DXL.

1. M4 in a separate SCFW partition, linux has no permission to configure
  anything except building rpmsg connection.
2. M4 in same SCFW partition with Linux, Linux has permission to start/stop M4
   In this scenario, there are two more items:
   -(2.1) M4 is started by bootloader
   -(2.2) M4 is started by Linux remoteproc.


Current imx_rproc.c only supports 1 and 2.2,
Your case is 2.1.

There is a clk_prepare_enable which not work for case 1 if adding a real
clock entry.

So need move clk_prepare_enable to imx_rproc_start, not leaving it in probe?
But for case 2.1, without clk_prepare_enable, kernel clk disable unused will
turn off the clk and hang M4. But even leaving clk_prepare_enable in probe,
if imx_rproc.c is built as module, clk_disable_unused will still turn
off the clk and hang M4.

So for case 2.1, there is no good way to keep M4 clk not being turned off,
unless pass "clk_ignore_unused" in bootargs.


For case 2.2, you could use the clock entry to enable the clock, but actually
SCFW will handle the clock automatically when power on M4.

If you have concern on the clk here, you may considering the various cases
and choose which to touch the clk, which to ignore the clk, but not 
"clk get and clk prepare" for all cases in current imx_rproc.c implementation.

Regards,
Peng


>
>[1] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
>
>Cheers,
>Hiago.
>
>> 
>> Daniel and Iuliana, I'd like to have your opinions on this.
>> 
>> Thanks,
>> Mathieu
>> 
>> >  	if (IS_ERR(priv->clk)) {
>> >  		dev_err(dev, "Failed to get clock\n");
>> >  		return PTR_ERR(priv->clk);
>> > -- 
>> > 2.39.5
>> > 
