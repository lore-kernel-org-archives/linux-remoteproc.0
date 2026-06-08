Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010063.outbound.protection.outlook.com [52.101.84.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC98037C911;
	Mon,  8 Jun 2026 05:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897645; cv=fail; b=b1My+gdXhWf2W6+mJfQkRMQRemhAbLAPDZuWGMzNCFeLbgpg49/jB8fc1A9ydK6PibUbPWl3lA7DzsxfbDzvKeU5BVAHAXpJFyRNnhephDSbzhmVlqJWpLdyujofftVkw3hsN7BGtf+QaNpVHS062I9O4D4R82xEnRmwvMh5+XA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897645; c=relaxed/simple;
	bh=bHMyxeVNo6F/egunvF1HeCqtmk9m4dAh2YIc3dZzmuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=J03I/gVDtnpdG5NMooCzjJF5hYapZXxkvVblxH0aeqFgEIC4HUgq5Vp2s/Xn4m3tEoqxGfLip8HQ/1VZF2d9LfXsribbme267GbRUEYFeApOKii48IXOdbLSsQCNwy8tzdXKZrgRIwKSW+Bp+Sahckqwrcat1jF9pt66py1Ue9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cMT0NTqd; arc=fail smtp.client-ip=52.101.84.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cMT0NTqd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VOj51ceGVz8CWGfRB1EL0CawcmurfXGCF4aBQJWM8pzdbzgKP9c7qZNrXr3JDV1IZfPk2LEksD0I8JKxfehXEpJI4aFm10a1Qy7JzDugWKN9v5hZ6pJePK+rpoADW2HnC6UjOI9iUmj9XzAXwqVnEic43iyvwwcpAC4TeKR3EVRf8Z3JJXiPZiNeEsbE/2oWHzJKZmSCr6rFzxJoeA9bUKoYPR3d6EYE7olIUBo7VSD/xzfE8IdLeHOu1IxpPBUimTfp36XndUyxge8dJpU3ZNESRF69rECiiUtE2vYq/z+cOJ2woglAFksb0b3Cm+T8q55sV5qHRe9oBx0CCnk//w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHMyxeVNo6F/egunvF1HeCqtmk9m4dAh2YIc3dZzmuI=;
 b=uZPyIJItJlBefQEf/V4tffXMuBqjRa5FvS4BobWtSdxmf2cAAbdSa5X2fU8rB300Oh1oEhRZVBPDO2dSyGcwISaQz3XyjmxkaErhVoe0RHYNs4k1YXrjF6mNfcwR1XdFrWwwqQHqpZAsBtpLpOII2WmnHsH8hVBRV3vvBtk0CG/YVioLb6XEsHUN3B9lsKt5Lc4LNy2Sq/BtWDLPr3kCUbrABUV+zJWt6kRhYC+HnlVA1iFfXmTLvVYOJvScfShHkZc6S4FW7zU7aZoiwJNnMptWq4++H1EIHP1yz/RutCT4wXMWy+wdhYXMGLWgEjhT/XNKtJPTceQmccyp3F+hWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHMyxeVNo6F/egunvF1HeCqtmk9m4dAh2YIc3dZzmuI=;
 b=cMT0NTqdSPsjHJFJrsmAvlPrYVXp1rgPoTcoSUPsSV8Nu3FS6z+T9SoGPV8CFTtDzZuqHArgla18Mc/yV5/8CSNdEkkRAJaLPW6e77Y+Nl3JBa0GrilGgNKmqz1UvXaNV+hgpXeHqL4O1JzF8S4CA/+NZ6KDcU5AQVk4MGtbdRAO3eWri3sloOyAa48f1E0vaCfseaflQSdFFG12oCFpiN+bRqId6WoHNDScd4GMaPCJoqPnerdI584qhquupkLO+hiOwi4tua8zXq70V5rso6a0hbX5pEju2/6ssMMy5ycWG+Gw/ASzPCpWAcynW2/Sui/VvTsAqeYMpaPDn4uCdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by DB9PR04MB8431.eurprd04.prod.outlook.com (2603:10a6:10:24e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 05:47:20 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0092.010; Mon, 8 Jun 2026
 05:47:20 +0000
Date: Mon, 8 Jun 2026 13:50:25 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 8/9] mailbox: imx: Don't force-thread the primary
 handler
Message-ID: <aiZYIXk+E/kilT0Q@shlinux89>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
 <20260603-imx_mbox_rproc-v2-8-a0059dc3b69a@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-imx_mbox_rproc-v2-8-a0059dc3b69a@linutronix.de>
X-ClientProxiedBy: MA5PR01CA0150.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::8) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|DB9PR04MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: b0867ec7-d975-4cf0-7bfb-08dec52167bd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|52116014|376014|7416014|366016|6133799003|22082099003|18002099003|38350700014|56012099006|5023799004|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	6maaETD8u9pKX5yEhTl1E03Axh39hIDraWAMaXfyNfXszIYCI1QUm7MscUFUgg7JnpwYfkZRAoDf7lFnOIaO/dqrwkx/fyiAt3d5BCHlBs9XMjYAYsrFiuEUQfzcLwhF0q5EA0lCoYKowUSI3xTYpeTPUSRSfgE2tLStS9GLOXeVyPF3wtKMiZNhe0rTM50kvvGHfPSQ9q+WC6fWzSe7jM2Rt6g4PKgxTh3CVZsJ0uTf4Mt20bgKBR3r6Pt42NWu0TFCqvb/lqjPlWr7EsK4M5mL41KZamBDOX+FDiw9iopMT7BLekPgyYPl7e4zQ7heTUhKMoOjt7v1Eec2T6FqU6NCm5HF5HZC/eK7wqHHgp8vldODrhljF27jxQ5DPSXaQ+KrTkzsUtI6f4ZCihKsgDgWwgHBpZQF3CdmNvxBc5YMcj+eUZvvgFMcTlIJY+kxu0D2jOaWg+8WfqCFAMtyHS1hIHztszQ3aNx3ivx+aiUbt75eUqlvIHEYvJyCLmpCG5rnDYGju6fES2pCzu6KX6cy+w5MadgwB0hn2ftaoouwiHs/4lgwJr/GzkWDp9Ifv85/gmk0raL3foqbHAcnt+xEsmobLIXyNKaawkAQxVF8UDPu+142qE6gIVeM3QJA03xAH2qGx9OEHRopkEKgiyKvdT2HdStBrVvDQaCzIW1Ub0Q7R3EU+EOgLA4axx35a2wqsnngqBuxTMZY6oHudH7S5TJouLm/1jUoklsANkl8aD4ZINgjTRFZnbbllpJq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(52116014)(376014)(7416014)(366016)(6133799003)(22082099003)(18002099003)(38350700014)(56012099006)(5023799004)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8+lJ6hP5MaQPA9S3kiR0MDt7AtvPbHiuBpW6aUnIuUJwDk0ZNDbn+j12FbUl?=
 =?us-ascii?Q?en7MBn8tW2JVq4lP31mThZo8jffF6suPZMMHRnGaqa1MIIG0MVl82L5OMJqX?=
 =?us-ascii?Q?u5fd9mHqVwBXlBgBQtBuP0ic/9veks3ZlbJcjkPznpOr1sWlYG41Q/FAaeS9?=
 =?us-ascii?Q?f7fvdDufyx0TNGeI1dm08lJOo4xQ9z585OCaLPCbcynhy9hy7HdWPHza1opX?=
 =?us-ascii?Q?QEKdZ6376LBFd0VtyyjGHI6c+Aac9c54kRqseIBLsS/bFvMM6L1hpGmuA//6?=
 =?us-ascii?Q?kPmxTrj5Nmb4+1QiV0CjDiZsc1vCXYoPWNNJhKreV933H7bRBw/R+wBgx27p?=
 =?us-ascii?Q?vSo7ycXOUQo4e5K+cRG4bGNWILWt35uPMyJ9LM7NDwZc8tqi4M+e9l+KXLF/?=
 =?us-ascii?Q?wUfySIqCqebtLRsXqGbGHq6zPTNvjbLS8W1GytYON6RWeYn8bo0otNZGF/2j?=
 =?us-ascii?Q?4/GBNDTV5I8ntXZXjE69cWNb4R2EPBrrZg83oMZkuIAeQEmXVUNS0T/+dgjm?=
 =?us-ascii?Q?4UsYXfCVJptoXr3kyUA385i0fArdbbB5TSg0W901L5/zwiv6kw7VXaNJ4V/O?=
 =?us-ascii?Q?iSAN6sbWhxJdiIma7Wb5tVtZl+yZbNVgqND+7SLDvLQfPGop0C2Xdyefut3J?=
 =?us-ascii?Q?DBJQQjAqo/bs83PtVJFA7DREUiqXk1N63nFXo++Yotiaj5tt1lvqbDJm1yzd?=
 =?us-ascii?Q?Ko+3dNVOb7QEIhSS9h7fuBurSVALCClWt8fGb53oUqzZ5iGBi2lanaypUBoq?=
 =?us-ascii?Q?qnpOnFo03KxeXLt85R5zWbbtmF+aRPiSnF7Zp7Q0NabEhealGV6m3VtMJdNp?=
 =?us-ascii?Q?2r7WrmnSfrjyCc6c7vEYWZcneCII9p7YN6jqmUxEEZ+YBmQlxBs2l46onOc8?=
 =?us-ascii?Q?FkOWyDrUcGMyvtLtBwOyzU/QLfAAZuXce42O/qD9NUESdWfdmMzm8HDvT7UE?=
 =?us-ascii?Q?9hw1mNp30mZ0YcCHHf50lfRwvai3Enm7WqUgu403ALZLpy0ShsAkQq0CpyGy?=
 =?us-ascii?Q?31lU69ahE9sIInomqs+4MT7T0eFQPJAiaqpNWuvpb1Hctp79Avlp4hc18UNi?=
 =?us-ascii?Q?T3neD/RlGVJsM5DY+9jy2c9fdLV6yk2V3bGXOh1b9qaTF+LDdTzUXIhKK14S?=
 =?us-ascii?Q?fxSLFuUK39gmOoiU/op3vtEeajcCSd3YHZap0vVZBHBX9zeWGIB/gdxgK1Wr?=
 =?us-ascii?Q?kz1ZO1i8VFh9y+MncAct59XxoNWJzZL88jvXnGKEZGHPmlwYKwreqzUukHEo?=
 =?us-ascii?Q?8rOEeqvdq0iMUYkoiviC4SZeZ+vEUa362Fn90dQAjpEAh4mxlIbNJpNy1Dkx?=
 =?us-ascii?Q?Mh/Ak4xZftgTsnV0jub+Th7l/Wtb5/Iuk8qOPa36SlZ/xi1jeyvWlhZIptmD?=
 =?us-ascii?Q?TzvWQG1OqozM+aCOVhVLdx8XLUoliTJhKuos/q2RESrlRyoCTfHNdLTU09EW?=
 =?us-ascii?Q?IytyYMI5cShv7FGHbKdQHpsG5E6GzR5iOLMBJzwdsuFyMaD1OBmjqShIzhCi?=
 =?us-ascii?Q?GqbvfE5KUidwcaqWNter4BwymQia90q283jRSAQMrC9ydlpG2sWHXuovjgdL?=
 =?us-ascii?Q?/iVdlRI/2+T6COkTcdeq5FsU72MMvNZqVa+FG5MZJSst9pIVNGuiakrhIX2A?=
 =?us-ascii?Q?d7klp5hdVYFZLlWAMFxJ/QjLIe01zFIoUHU37/HoyLGBfTxQwfXBnZQvspUp?=
 =?us-ascii?Q?+KD6CA7/Q8xRjbuKZ6PQAqF7H6sGwPPkEWY/M97ioJOzHVuLkYrF3kenH6D9?=
 =?us-ascii?Q?tXVHXSZsxg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0867ec7-d975-4cf0-7bfb-08dec52167bd
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 05:47:20.0449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebkqXiTbENLBFYYHfz95oikDUyXU74Vvifs8X1eebQlAdUbB7IHF2kl7hzUDhnE/HzIz9iy9LN8Ja0csR6YPHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8431

On Wed, Jun 03, 2026 at 03:05:11PM +0200, Sebastian Andrzej Siewior wrote:
>The primary interrupt handler (imx_mu_isr()) no longer invokes any
>callbacks it only masks the interrupt source and returns. In a
>forced-threaded environment the IRQ-core will force-thread the primary
>handler which can be avoided.
>
>The primary handler uses a spinlock_t to protect the RMW operation in
>imx_mu_xcr_rmw() - nothing that may introduce long latencies.
>
>The lock can be turned into a raw_spinlock_t and then the primary
>handler can run in hardirq context even on PREEMPT_RT skipping one
>thread.
>
>Make struct imx_mu_priv::xcr_lock a raw_spinlock_t and skip
>force-threading the primrary handler by marking it IRQF_NO_THREAD.
>
>Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
