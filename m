Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795069262;
	b=q4jm1QS/ATz1PwKL7MMTKtBpVEAjLyexT+pHI+9M13TfXTvumPztfe3KkT/Nf69vZh9/
	 gBqiqHUZazGg+CRy71hlg3YhKTO7ya2cguoI3KNAug8Znk7jIEAySNAYexNwCBxi7ZUD+
	 /yz3QMqBPSryNwbTmbIhKhbk/5SYrXOgKjzebNlfKZSXjgbtvECtDJRiWd3yOBtx+iCYv
	 etu46MNLADkVlxm9QoFS6hjhEuHKS+FDUnXEPiEihwRtpFKZX6WVKi8EI2XyvIWrJUf8Q
	 ghf+WppvommdFdYkcZ0F0POqYrKNKeermuzAyTNRHqOu+NbtMGhWDf8RViW5rkWDDeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795069262;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=rCjeiacuUpZ/vyNwbk4Tm084Y06xMs9behKISfu6BUc=;
	b=YXoDnnBJF7WAhjjrGDQSdSGfB+xDEGTujPC56uNtynn9PCjIBUxOI6pxEdqL88byesnX
	 LFFNCCCn1GLX87G1OPn5N9Z3AaaBoiGA/9XTCt6rk/pRpPtdxejD7boUCOMB0vq2TeJWU
	 iY7EJCzPdyD8uCR44pMgzM7nWmNqN9o3Puan+PcUGT2DpE4jziDnmq0Vcq3y81Gt23h5u
	 OwV76EhzY2vewspnskWyEDuVUOAj43TvRPpiuLh/zgntsKF73GXdSq4Z4YVbxn9nHHAvT
	 RuS1j8/sn4nOkliEa/Y3e+2MLHYxNheO6gBe4s76XMrsyQRFaqhMHXTBYP8L+Tb14Vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=GImiJJmB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.20
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013020.outbound.protection.outlook.com [40.107.159.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C65606A320
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Nov 2026 06:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1C65606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=GImiJJmB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BsG7YU9Nxbn3ka1iK0z7eLt8Puft+Il8ylar4RtdO62qcP3d6neBobkghOGACvUnbCTzxtRaN339GGsVKsUcMWiU3eCj7BUkX923Wu+MKPlHMzUIflixFoCStHi3HEMZanzzSOGcyzK0x1D3Dc1CD5/7TakWb2zVDAixKW0TFgU4iQ+LlAdyIFU2uhkzA0tio8jcxe3UVfmBDZ8kNXoPBtGn9qLdzEJwkKunOvLytURJXVB+QXKahzAQHxYoWZkG+xv6whJKBQQ/RShRG1ptnG/w1eQZ9kLKZb+hxjSUY9f5ZberQWmKLeaLha9DyFbkag3epgvn+FxVkCLrqtobFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCjeiacuUpZ/vyNwbk4Tm084Y06xMs9behKISfu6BUc=;
 b=BlgiZFYDa7RjsvGsAQ+MgoCCWrRbOc7SJ5NfV3X2KGUrECdGz8hWUVdQVWjVstADlyB4TVxQB85ZEolqJWkO21c3WAsj6JHTbJf/fiXCQaO0sGeWNXIQYMWamYlaN+diOEtKHJ+iamP9THdnFDBfDzN58f7A/3tS77ZJ4ZqaQ3oEF+nQnzRlPmn83GY2el4K6qY4XW5r8Iwy/WrnIK5xOAlQyJX7ELQzcKI9hY//6ck1lHCiwt4jzBAImBfQ9jCCKJLPDRYMR5MZIIXGTdjZ6yeoyLgn7Iz8FdzFjmB9VnSuiUT5a54UV2D3n6xjunvjZxLPDkdGHswAUabSG+0fiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCjeiacuUpZ/vyNwbk4Tm084Y06xMs9behKISfu6BUc=;
 b=GImiJJmBd1iV50DE9Fw++sP0uXwNluOst2GqjeUz/3V5Lx96wnqt6BPnjdJGy8B9Ni9ux7RlioPWqgQLaJ/jdQM85NRSPcm7GwMGsB/73EsUQuKZl4fz5nnGGGAa1RXMRiljVywBXCuzzz+U6Dx2pOXt3/+j+59qJZPxUtnOLi7SnkhVSWK3dzqlw85mw+V3vFLp+qRiWusqFd1LMqsHwq0zI2mF9jnOkCB9XwyvvB9tmkUbU3ijuoV9ul4bU00l/0wRRl+hbkFzFXUzBApZ2xc7xwEwJskTcKYTlDrVL76ZNOV54IYNybSMIMOgu3BclOwdjtpGXtdD5Tex57+MNA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com (2603:10a6:10:1e9::23)
 by BR0PR04MB263363.eurprd04.prod.outlook.com (2603:10a6:2c8:4c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 06:20:58 +0000
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb]) by DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb%7]) with mapi id 15.21.0615.009; Thu, 19 Nov 2026
 06:20:58 +0000
Date: Thu, 19 Nov 2026 14:25:55 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v3 00/10] mailbox: imx: Use threaded handler to avoid
 kworker in imx's remoteproc
Message-ID: <av6Wc+kHFKqwFHAR@shlinux89>
References: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
 <avrLnVFtgobyTwN1@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avrLnVFtgobyTwN1@francesco-nb>
X-ClientProxiedBy: JH0PR03CA0027.apcprd03.prod.outlook.com
 (2603:1096:990:74::10) To PA4PR04MB7885.eurprd04.prod.outlook.com
 (2603:10a6:102:ce::14)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7883:EE_|BR0PR04MB263363:EE_
X-MS-Office365-Filtering-Correlation-Id: 1500e1db-242b-4802-c09e-08df46054497
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|7416014|376014|366016|1800799024|6133799003|18002099003|22082099003|4143699003|11063799006|5023799004|10067099003|56012099006|261022075727099003|261026140227099003|261022105027099003|261026121527099003|261028144727099003|261021123027099003|261021121427099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	0QMFVA2a9/m/6GGo8RarPteYt+jx7hYgEL1sYSjmoyMBlasnbOe5c8KP7TUhia6PSTMKk25S/obgF5mXqZz44Ecw2hZcz8tIvYzmG0GT5ChU3C+TcEC13MRF0pWSFQEg50eYivqG8bDgIbHct9ufw03A1ZJGpbpHmRkizAPVZ9ORpXRVvMbGHqa4jv4DjOADL6eFwonW7xzFgBMfpjY3vFgoy3Bh0ujTowTzKfAZgNFdbkC9Nogl7vLZaxPZa7313Oaer5mCyKCOrZ/yksByyPrEK8ZHbXpfOUKq6n8MEvfyDuhJj/tT3p8z4QW4pfxcj3b+PTeI9unt3ez1uBwgsRcSW1EqwqoMOu9XyWvR8e2ZKDoALfcFIpDiOFadsR7VGlMbZV8G8kiYy3QA0sj+mFRRsUoC9qxFb9Dc+jhmz1rpny2uSL4AWqkjgnF6Fsm73c45ygZvDEEN+RrNr+ZRA1zSii0nidILMYl6FYh5oTcq6TSAnz+8ydqLAxOb7/52tXG2Rp+518NH/LKTk36cgcJoEIzu8606YnkjcnbudjjGoF5G0lLty831LJzuB+qcecDfApJMCHVe6eRAFu0dtnY6DRR0akNF+f0kGvTHrGMvbVquSRQbPf862g86lF9FdmNvdbQUyZsKIbzNIAgLzloutDoLT+rbEIbn6pT6cfE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7883.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(376014)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006)(5023799004)(10067099003)(56012099006)(261022075727099003)(261026140227099003)(261022105027099003)(261026121527099003)(261028144727099003)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/Ltx5NgroBLOm1F2jT2VCVcBw5GirLG6dZbgg4i6tgc6EMJGUuZ6+wpZUjCm?=
 =?us-ascii?Q?6jM75Vmu98XVChck1GXU1NkpG0STx5erCtM5EUTydh4caai08K7tRkUJoRTU?=
 =?us-ascii?Q?BZmWhwAngZUwciuorfQ9bV6UxYdqBUStmTDi1PrvK5j8QAjTGjmapDIgeXTe?=
 =?us-ascii?Q?RD3HuAx1iH38x5p2qK4HktTW8+hyvHFDQU1NJ7SLfFkLm6sMX+BMlUHoL67V?=
 =?us-ascii?Q?jTzKSCPJD0i2mshq/zmfFWVCapum7lhfpGO9C9LiFUAgg3gRwCPmG6PiIOxN?=
 =?us-ascii?Q?ueiOj4GlJkCzsucrXqKmUU7tuFwAdft3dHAebv1QXJF2SsyweARM3KXY5NuM?=
 =?us-ascii?Q?XZDShfi8muLvuJY7fga6bGWJdbTH4yXi2UYfZO9EfEW8ZBQcyA7VEAb0e8Jm?=
 =?us-ascii?Q?T5OHI/mzsG1TyixRH8y5XOCAyfdZkt98xOTAAKkfPYbtHMuGF9cTN9zlmWaX?=
 =?us-ascii?Q?v1KPsi/VZSGUKljBn5TApgOrfI8MBmdHhWD3HuVNk1o4Wf278SdnX/Qs9+9u?=
 =?us-ascii?Q?+SgzaDVBQCkEEhU1TSVplLrzMSlZWk6GrkGWAFCEk0ttMGb2l/Wv0MQoOlyl?=
 =?us-ascii?Q?gEV0+8Bm70OIAC6nVU8/JFQMJnhhF2VrMm9OiAOkZTA6qDjLTIZpZQrXaSbh?=
 =?us-ascii?Q?jxuYYU5LAWo9d29NGjz+C+LCt/iKh+XUC3vvtGPPe1Y3EYntzMKYM36+TmtR?=
 =?us-ascii?Q?uo/n2D6ObQy/+Z/bu70UnZ4b13eSrFDlwlNYrw9qO281Y/hz+I90AufieUMw?=
 =?us-ascii?Q?xvSZ++aBI4LCJplyEz2RWhL8ZEAhDcBTFkraBzXAICZwzRU0ZN8q2nOJY3SN?=
 =?us-ascii?Q?1IOUPKCsVMtbr+A3srB0eL6+NPu05DTVQS6EulpF0atse++W1Jh5lOsn9CZW?=
 =?us-ascii?Q?hhMmgh0rLLLQ9JJu+gPYG1spKBan2hpiuwBtGCC8Zxujazmg7lWLEGGevw5m?=
 =?us-ascii?Q?/6jxVgxRganSQd2Vj+teJicMjygR6/SIEffjgkK5Fd1kVRv7fY2fdh5JmHO+?=
 =?us-ascii?Q?2odiHKso0ROch08nMOtQL0t2X9EmfABlQkAkHXC11mujZYvyK8kqsmdGcTSt?=
 =?us-ascii?Q?LAd9luyzD/w5RDqiRhng9ryTIGdvlwWCsFM2clHS4Eevdt22w7tEms/emHwR?=
 =?us-ascii?Q?XGSsNXmKCwtGpF8q8XsMV5hFb/4eIA/QZzHfJ8oVW6cvw7ZNUzlKGjRzcl+a?=
 =?us-ascii?Q?VRj1lIuxS27t0r2o53sqNFBxPdBssr+glCxGBJpPP6+FHHspj2aZppj4enrq?=
 =?us-ascii?Q?RU5lUw3p3zSPHjKQPbJlhDcmGev4mnIqZjsWzA1UnElBzPaR0tKQtKIkh+iJ?=
 =?us-ascii?Q?aX+IhuB5b84XnSoeLbKZbboBdHccTES7Baz2e1d3greJgD19hxwJLK8mEetu?=
 =?us-ascii?Q?9tq2R9yzEYgD+enI16tnvSqXGzNtUIZRYk70I+msXVz1jbLnxbtnmVtXKsBz?=
 =?us-ascii?Q?K4W1dt8ObD3i/bPPOTTrsdKDYGu2/ZDxFwL3bjeyxoS1/alQgc8+oylS07yz?=
 =?us-ascii?Q?yHSAMu2vYqJTbmWKQJN5/076L8ooKQkd3OMElTqxcTMPlhw6bcKfYxWmdX9x?=
 =?us-ascii?Q?aCvPF/aXo+hhHArGBqVROBwplqjr/bF3xrSIapXA77t+8iZP3JwXQ7IPeATG?=
 =?us-ascii?Q?cXV8EjL1oX85P8ZmuvSj7XdQDQik57w9cfEcNwS/UJTwyuLfn+UIKXio8MAg?=
 =?us-ascii?Q?/x0bb5HUm1eep8dMc8GeFns1Rw0nhvATTo30/P09HJNsESzBQ80ZdstNlIS4?=
 =?us-ascii?Q?m6G7b7Cly5RiqCNambt6YqrepNp1YOOQOwCW3Kb+At3tFQmaNKyZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1500e1db-242b-4802-c09e-08df46054497
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7885.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 06:20:58.0923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GVScRHXigI6yy2bLI9TCpDIzFBLMyOJgKqGODHrlHVWlaFbDkSboBZKOnImFynjoFPxNgUHOFzjzE0sUPfAFOxfxKCf5hcHuz1H850xOrNd4gcZOA64rydQi/uKaiTni
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB263363

Hi Francesco,

On Mon, Nov 16, 2026 at 10:23:41AM +0100, Francesco Dolcini wrote:
>Hello Sebastian, Peng
>
>On Wed, Jun 17, 2026 at 08:55:25AM +0200, Sebastian Andrzej Siewior wrote:
>> The imx's remoteproc driver uses a kworker from its mailbox callback to
>> complete the request. The reason is that the imx mailbox driver invokes
>> the callback from its interrupt handler and the remoteproc callback (at
>> least the rpmsg-tty) requires a preemptible context.
>> 
>> This works but is problematic in a PREEMPT_RT environment where the
>> latency of the invocation is important. By scheduling a kworker the
>> high task priority from the threaded handler is lost and the kworker
>> competes for CPU ressources with every SCHED_OTHER task in the system.
>> This can lead to long delays on a busy system with other RT threads
>> which are less important than the completion of this request.
>> 
>> Looking over other mailbox driver, like the arm_mhu for instance, they
>> use a threaded interrupt handler to invoke the callback. This avoids the
>> kworker detour.
>> 
>> The here suggested change utilises a threaded interrupt to invoke the
>> callback. The primary handler mask the interrupt source so that the
>> handler can run without getting interrupted by the interrupt again.
>> Doing so avoids marking the interrupt IRQF_ONESHOT so that in a
>> shared-interrupt environment the other interrupt can still fire while
>> the first is masked.
>> 
>> The first four patches are result of the sashiko review. Does not look
>> critical.
>> 
>> This change was tested on a im93 board with rpmsg-tty driver.
>
>Our CI shows a ~10-15% eMMC sequential read throughput drop on i.MX8QXP
>and i.MX8DX (Colibri iMX8X, Cortex-A35), starting with v7.2-rc1 and
>still present in v7.4-rc3 (hdparm --direct -t: ~129 MB/s -> 105-120
>MB/s on i.MX8DX). i.MX8QM, i.MX8M and i.MX9 are not affected.
>
>5d1c0000.mailbox interrupt count before the test went from ~8k on v6.18
>to 60k+ on v7.3/v7.4.
>
>Peng: any idea/suggestion? Does it makes any sense to you?

Please help test whether this helps:

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 683ccea6f2ba..e29044cf4b92 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -635,7 +635,7 @@ static int imx_mu_startup(struct mbox_chan *chan)
 {
        struct imx_mu_priv *priv = to_imx_mu_priv(chan->mbox);
        struct imx_mu_con_priv *cp = chan->con_priv;
-       unsigned long irq_flag = IRQF_NO_THREAD;
+       unsigned long irq_flag = IRQF_NO_THREAD | IRQF_ONESHOT;
        int ret;

        pm_runtime_get_sync(priv->dev);

Regards
Peng

>
>Francesco
>
>
