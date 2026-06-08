Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013030.outbound.protection.outlook.com [52.101.83.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F0F30F7FF;
	Mon,  8 Jun 2026 05:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897757; cv=fail; b=XNtkgtTCHxnItbMJjk0JMvGphvOktwcrd0A4z1hKtkdXQOyUN8Gjf9qCGMrFeJMqSwyz74mqsbse6YDIGmBxYTnVXeHXZ/o4Vwj3ks3Jjhay1hLHlQG7htBg4EB02aatb3+5mL3XMWYDhU2ZA1t+KhRvOxhwSO6zMqV5+1JW9LQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897757; c=relaxed/simple;
	bh=iBYk9fv4rza+p4Owffy5bzWC1ek/oXhKWV+mkgur1rU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fzsdzXH4jkBJXhryWeWv3K0ono7l9geY1Uyyiy/QDNCzaBdYoB0V2Ko2WpqfOTyM1MwSPsG05ZI8uOtNz7AsFFKTTfWwtlK3xQV/w1IVTy8Qx7yti1yiF3Vip65Yzg/x7rCQFD86Xq1lJpV2xapTXjwtch2FvhczRlIJupxLGMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LObkUuZf; arc=fail smtp.client-ip=52.101.83.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LObkUuZf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7eTkLsIzMma09bP0ZHBPt2ybTl2HMn8C8j/43rmi+qU6oR5hD7bBl7zb1Zw228JMXzCLX32amRRLBOr13Lf805kfodJoWYRbLmofyVssxY7hOV6x95ZMRBwm83mVrqJqQWaob6uRrbDCKiGSZ1+Nzwysd/OdvOqB4g4ARKB0JOagDBx1p4BeKtJOL59LXiTzO2RPIOLTM0cAfpckonvh/Kb7Pb3YQxY02at9sM4dIGP+UWrfstSXRqasgl1v1lDwqIwqfV5ViXhZ534EUFY/NX8/wA2LWPl38Iop3ES13euoX2l81rekKdxPXgNVr3LqV3ePoPrfqke1eChdcPqUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBYk9fv4rza+p4Owffy5bzWC1ek/oXhKWV+mkgur1rU=;
 b=HonPzWPmkJ8vcRug4o1L+cglbOBOH9+Bb7UaLXtPFOgkX6AB6D3v9Zedy5d8XWdBg8hFHMZDOfbIjKbfyv4OeohNwkVumUSPIKAU/CwzJcaZdJHT4ibjOcVaEp1WRgTgFYzNNMMhtbKvtsypGJbzxjjMmzkkMJ5Tf5rT6d7ZWn8fT4ZoqDb7S+KgztDrlDXgHRg1wyQgt0xwIKC5PK4SYhaRHsZWnu05nYd5cB8ShjeeNVXSTfc8kP9AWzxbb9cw40x4VpjaeKFKtTOAwUGFSZ919YrmpzaBR71ffWQZuFYNID9jVi021nZg9eQhsOrUa8rHE+JTQyOxnNRF/hJzqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBYk9fv4rza+p4Owffy5bzWC1ek/oXhKWV+mkgur1rU=;
 b=LObkUuZfc3DlcI6TbRLHXBcELaW7uBQuxvq3C5vU0J68rGu3YL0q6j9rxZ5XWe1APHLc3SMo3c7NNqN8B6yU+boCEWNzwGqowFhtBX5x0yLIMsx5bF6jY1Q6sFTSZQXpt68Lz/KOA/Ak1WMvigSJIY1TpS3ID1Bn9emJ4HaNqS6Ia7RCtQRA/Avo7nXcWPvAT5alWSyhT1hcQqAW2j2RwElcEoNe+ESnWHxiYiJ2Lr1ltvqElhG0HzP2SkqLJyOIGV3b/bR4KBuHF9eEEQqy8YbTlz1yXqi/7sMNOtSBlhRPYUZEq0reWyd5rQ6IpQ77HtDJgY3iDqsyG69zrtxfdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by VI1PR04MB10004.eurprd04.prod.outlook.com (2603:10a6:800:1d0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 05:49:10 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0092.010; Mon, 8 Jun 2026
 05:49:10 +0000
Date: Mon, 8 Jun 2026 13:52:16 +0800
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
Subject: Re: [PATCH v2 9/9] remoteproc: imx_rproc: Invoke the callback
 directly
Message-ID: <aiZYkLyiX1cDOYrj@shlinux89>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
 <20260603-imx_mbox_rproc-v2-9-a0059dc3b69a@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-imx_mbox_rproc-v2-9-a0059dc3b69a@linutronix.de>
X-ClientProxiedBy: SI2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:194::15) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|VI1PR04MB10004:EE_
X-MS-Office365-Filtering-Correlation-Id: d5993084-17df-432b-9c23-08dec521a99c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014|5023799004|11063799006|4143699003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0vGlXQ05dZNa7XAAi6h1N0rzWY1wXO15gewCnwU/2WaDtwWFNYv+C/Yw2i6IYlZVe3LkrsDGQ/GCk5nguFDOFDLnFaXvE/OqBirYUdwT7jCNHZ/S0fDpb67VmtsGzXjDtMznYOY3E8E2LOT2livAY8D2WpmFH/4jFVi+wsLw1U6rkCI01JvKXvTLb0cFixx+zT3s0C73QbKFh01Ed2cMhdJNJbkjV1OzZN7oxZxqSs9JTNBPC4uW0W1U1zDs9N1X5AicNe05jhE22qa18ivINfs7EJm+SIRkMMJhbW/chQNFi6oKu5A0eXDVHZfkgDmJ/mXLa2RMnkoJCPeRZ+Z8NuXJ8OqXIgglRHEG/oaCvBYadtBoD3s3GE6rg0sxIETKik4qg7n/550BYaq1Ju5Fm8wIL1+HvhWyEG1dyk23imAekLn/xnOEw5Mz72YCf7Q/Mn6+MsJvjpEfbVoYvCzQ9wypPDul5kVJhBK6TNtd+YzDMuTmNFhGigGYk2elsMzRXJcK6PrmXGUDFkIZFeIUWVhPoYZNq7i1mr+jeQbq8nDv+WaX9Z2caGO98Uj6fGXo9zi/5tirL89oyc8qLgSCRjgg9nyvSPPQryNGIEgo6JCKD2cg0aYeNiuua7j/5laO94vS+Brk51Lk7IxjrEStVmI6qBOIdhPawaE7M5sqGm1Pj+/zE3ydT0z3UCbmAAMJv2YGKGW6pvKvByBp5mS0x8Dhk7v5zhtJCsGLxfTxMT1KvFl2Cb97GccfkKsoeeYr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014)(5023799004)(11063799006)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O0jPiB7EzwlZtZPKRMuKFx27qb8ADnoL4HoyaRnGILYXOCCJNvAZkOGm1O5E?=
 =?us-ascii?Q?eIfY/g+CMsKjUQ3J+x+e05g0VR1b/dIT1or6k9Lnb6bjmhDcN0igPqsqe8as?=
 =?us-ascii?Q?Zeo+I9oCTNfZci1Az/nXpSf7D4B7j4pcMClaC3tIIZ2X7+hqRa86Y0cdRbbX?=
 =?us-ascii?Q?eXkaEbamVpf0umkkfJUgP5UUAcW5ki9vyefO+KU/9ZKP6G6p/59WHq1dzHE0?=
 =?us-ascii?Q?RU4NSTemkRimRmcZUd00hPHOC14HFyWYQmrEaC7JmfQPhbRVaeysVedIAXpl?=
 =?us-ascii?Q?n8yzKdAwZ49Eh12h0zgoI2tc/MR7D1ss/i/XqPA8AZGSCWTF2zFAl5Xizor9?=
 =?us-ascii?Q?5dbTUp9p1V7oRaKWqpp8moXr7ijgufyt/7OTWMBxrZLvYCbDsMgS+1BLd1h0?=
 =?us-ascii?Q?uBQid9H7Lz7joEG2KFe+k5iGE6Lz1q5IdyllfjS3aluFm7PpdFLTD9IGM7Rp?=
 =?us-ascii?Q?EJzzzafywBRGQlWqxmHvUAkDlzRqq94MM80WmANpnKdXR2aq5CFTF5Gna2jI?=
 =?us-ascii?Q?f3yqdNovg+pRspe5bFBu0ZmIg9aA0iBUbsU9ZgaGlOi/m0BdTWrDGxvv+Dmw?=
 =?us-ascii?Q?P3r0zI+1yCdfUixIycSMBZRnKaw1FBMLyOCqg4SzDOq7YpddI+aj/RjH2Juw?=
 =?us-ascii?Q?R4sQQ/6V+OIGZM9yI1AM9mnsarc6DF+3dPPJOC6Jjm3pxsb6WDQo5zhpDHPE?=
 =?us-ascii?Q?OUPneqhwa00LeJTRIjzqzQdJQftn0+GcoU4HQW2re65FPlNmfLslL0TWWRfI?=
 =?us-ascii?Q?WaFtQy1MTf0j8PzFkRFJfoqUaUu9NpB+gz1PN4bIU8ruGnzzYgxSsyrHUAtR?=
 =?us-ascii?Q?veXa4XFxt7K7qZMT8lxvT52PJlvtakWK8LPznSQf/k7QFe/93tKbuNKyGbBN?=
 =?us-ascii?Q?W36JE9Z3sdi/fXalW7olZMxO5sOzu1zlQugtNnAzXTZkjZvpzIgodS+oLYKy?=
 =?us-ascii?Q?vgwl84I8CBeRLweyvc2WZ4GpWvqRx6ibhnZ91ZPieNd3tbOBTv0xdYweMyfO?=
 =?us-ascii?Q?Bsjc+QIhQKGw32vtJHEyJEO84TXdFDp8IW4IauNzohbOSbjBRi83S0b8TGJz?=
 =?us-ascii?Q?1NXyXiP9WJUBU4xXUfD/+9OixFIdNeo2xV5A/MT0FqevZuEl6OA9LvEu6p5v?=
 =?us-ascii?Q?WGtBwIe60w/IPfTtN7hLnlF3VN8JWfoskamhK9MGmymqrbdnawR2qX9UC9l5?=
 =?us-ascii?Q?SwDPWj8HEgDv4Dj/oULUy94E37XGGTMEpugZFDaRONFDnRpIFy9bz10LA0lD?=
 =?us-ascii?Q?jS0BgSZFeaR2Hjl4zLS1IOjBLKit/PB3q+8+Ip277L1K3wtHR6idY/Ihca9i?=
 =?us-ascii?Q?zLUQe2eFQSroLfgKcDi17RZ9x2amkUGUbDEpHT16E23xdKiUa11qXzloaqVS?=
 =?us-ascii?Q?b2ewzDXqKXZxb0H60lI5Sclz2cAC3f+R6wVN2upbfo941VM+oGrL4XeajsOH?=
 =?us-ascii?Q?+91BdddjYW7rQNAZz/9jpva/a4k1E3FM2KSAS2GXHfOz3yCptjokSI69UsWk?=
 =?us-ascii?Q?Gj3lH7o03lGiNVSH86gO29n6YPbDbvb//r746vI57KDTZkP2EAkJEP/wghxH?=
 =?us-ascii?Q?narTgKvYpml7Ant2Z3f8P9BhL5pGrz7ZqfiEeH7OlcMBqamZPP50h2yvCLa1?=
 =?us-ascii?Q?IRG4h6lKHpYuKWeBsFkzT2cO5V9mxtsnbXgQu3x+uw5E188UoN7q/Y8w/jdW?=
 =?us-ascii?Q?xMmVzgBFGCQAlKoxE9343S6fEZ8QV2v9B91vVL3y5nCe3yo0QdhT5ZvyoxQ4?=
 =?us-ascii?Q?Gn23Ii88Xg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5993084-17df-432b-9c23-08dec521a99c
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 05:49:10.4383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h2et36h1w2aEfo4nqVT2SoVRYyDbS0vpHy6cU3bkSR5Vw350gLxtxANNtcCGkJRvltnnhIXxTmXwtwWSKej1zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10004

On Wed, Jun 03, 2026 at 03:05:12PM +0200, Sebastian Andrzej Siewior wrote:
>The imx-mailbox driver moved the callback invocation into the threaded
>IRQ handler. This means the callback is invoked in preemptible context
>and there is no need to schedule the kworker for the
>imx_rproc_notified_idr_cb() invocation.
>
>This was tested with the rpmsg-tty driver on imx93.
>
>Remove the workqueue handling and invoke the imx_rproc_notified_idr_cb()
>callback directly.
>
>Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
