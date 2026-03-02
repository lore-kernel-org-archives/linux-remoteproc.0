Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010040.outbound.protection.outlook.com [52.101.69.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA671A2C0B
	for <linux-remoteproc@vger.kernel.org>; Mon,  2 Mar 2026 09:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772444454; cv=fail; b=IIUWhX+0LU+DfjQDBtcaroAVBxz2YZeGWDhI/zYXB3kwUfCyDXA7+3qCPFDsdpYr2T65pVxM16Zu1oQ7zlX8498QM1knhWdAyJWoySdARjx/OYedb3jhUOyKzZ4oCj+hlFOOg/QUTzioU0N+ti0+ZUmI1LMAwSjtHD/+nTISmdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772444454; c=relaxed/simple;
	bh=aiwCOkNrXlGnXLAv/qnsro1CW377HI/uitMEoKReCZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rjfXYW7EN+wzfi+oko94Z/vdCD5W7CeEmQtkKXrnZ3lMWfPSsivfAZc+fTP9bHi6XuK92qT+N93amJY9syUms48bLEEKTdQQeu+1Ja4u9gyDZRtmVU36DtmpLVCyLzgjq/ytl9UhFaVqvGOiZi9d2zlNlkDrAYrHuxKIUV1Pui0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rJNcqMaD; arc=fail smtp.client-ip=52.101.69.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rJNcqMaD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pr1Kl9mNtKfr9sFo9VFsOgRWxojW+TuZi88KWSRJTD3RrZckihQCofez4BUKKjP0BGU+4paEsjh9ZAejHtUnrW27cLN+kwvWHstqhYIQdJOwZJP3f+JYGYsFYiDD2tC1/vqIQW+9gQsPxJV3gVyGUPjJrQZniRiYoMf7+JYG5tWcPorydgUTkGYYTjyOmuQwH6/XZPasSmN0CKfJp3CSVFpU+wXk6EerNx1GQjVusfBmqvvn7D9GZ5914//UwtavHeFzsRSg3CYXIb+UmSg/vobsLn74mdaaweCTVJuDsa3/b1GvdJwVIlz0X4GRnpFVEqnbvROqprW9KkqqjC0Skg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpne7SR30zvhhb5HGXBne5OebH8gdlmqp+U5G7uPvN4=;
 b=a8y4ij571vSmdr3k3Gd6NAm5oyoIQBQoPqmbsqFF8PgUy5K3s90iLHkfOad3CuDM7ZaBurDJKN90zmhj3Uk0wwxIV8aQTxSEarT6y45EZV2BAXImkJ2nEvkqt1L9DYcUTaTguwDn0MCy7iyNwNf79hpqp1Vx2z7qoTlmQeBbC9HV6Lb3tK6r/0LW8P0W1lm3CCcfpdiaHyB15zEKRo58n4/BIb3I7hmT3XHzcc+LND0ZgCCzVqJ5NQFFwpWvCLzJUpRH+K1qPNRDOnmo+l/J2PQAIUKRsiUf+EgSvHLJUdNtZc4xUkq/ZvMuEVe91oyszTiznJy4wCZwS7N2L5Pylg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpne7SR30zvhhb5HGXBne5OebH8gdlmqp+U5G7uPvN4=;
 b=rJNcqMaDOHKKGP9JEWkwWiLLaBdun2eXCie9h8R/PtcRladd58pd0Xc1/iBfEolzVyCVUVASmC7SZ+YxbmjbkU+jMzzQjn0LA47baiU/LCVu8iry4BkMMIZSeXwzgpSoljbmaT1ovIz6934T+gW9MNq+bktAp/HTph9PqsWeHd5v2ISrnVofnUpXHdqkaK8ZfK2s8DQbzpg9cINa3lrRYaVLKjUUrG4vZBibJtQB7H7wHED0Rd3bZcJDI2F1Rz8HoFQRHTaPgYg0oYqAh1RGHRauB3YD//or5lxgmOsefTbOfFJC4Xkj+vqQCxrC4hQV1UlCjyiA9UdnBrTcrNQWfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 09:40:50 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Mon, 2 Mar 2026
 09:40:50 +0000
Date: Mon, 2 Mar 2026 17:42:48 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH] remoteproc: imx_rproc: Fix NULL vs IS_ERR() bug in
 imx_rproc_addr_init()
Message-ID: <aaVbmAWUqU4s39Yb@shlinux89>
References: <20260227091546.4044246-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227091546.4044246-1-nichen@iscas.ac.cn>
X-ClientProxiedBy: SI2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:196::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8585:EE_
X-MS-Office365-Filtering-Correlation-Id: 97c9103e-0df4-4447-77b8-08de783fc9c2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	iizDNepoPi1Mi+XEDkS/BvEgmAxVnJDY6hhTSSR/rn+xA75M0juH3mETPTumar7MS1acSF4+pckwv+hJz8nGZm7Aw9l0eNcQ2RmNhE6uvHYdZEEeRZUnflWomNC0tOyeYgWFwdjRE2cmFL3XcCZV9vMMWqlsJjvvxFZpamUyToWpN2bfKneGEsdPbRs3eXIfsRgINbZ0jerWsjbUPHW92IWqdsNKqSVWdtIvSAn7mTmSwlrsaxwcsPoIqDSLUnfXmMPMlxAfSaIDktS/Xp/4WVi+6r3rwWgf1v+6a2nG5pvXI98B+cl2ev6RpsDN+tGjlyC08dtTttV2Nip35W5GYTkTh7A2MqgfMuT13LA2dMLvwAs/hGtyMyfSG+3VfFgGqiD/ZMuQmoDGQKJDnyYLerR69s1OysVMMiHZs8j2uTdIYsuBbQBEmPCMrXiW8XQ8MBQYDoSmgGhZd0TxIPc1SdNWGjF4vYz75/ehr+uQb9QNE9JqRC3yQZrFb4iJCq10U6M/qDSr3ctVrok7WYoOIURXOCH4eBv/WPNMV2VfoFmtEcYtRzA+ON2xNriVXwL1WviHhszNz0Q5/gRCA7vz6tJ3e24iQns3QICO4n7+Ajit49XXqDmvTVS3ACdIVoU/h9pIIhAaMVYq9MhwZn4f8YnqHLhFtVveFu3BpIP33FggDctZulDsVFvpLHetQrUJQohwd5vzGEYIEBl8L/vTiO/KMzSWg1DE/Dm/kAjJSrpU9jSpQNbcrjdXJTfC5cZ7+aJuqFyU+NZUXFZWfbaACMgf2yi+fbo2cex2ulOt8rQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bYDdw6AL65Svbw6v0Ppq2ROb79Vtnk+54UPq3UkDGsC2ZHgpQVJsKU6UDibJ?=
 =?us-ascii?Q?ujMR8lxAsyiC2sAwoD1yzwVVBYTw8mC2grV+Rmit5EmRJl/Cr5CCxbCvySS7?=
 =?us-ascii?Q?zrH3FnYSWa1RI/RQQLocqizuPxhCSAIJ7L37sscX97LMxUmFwPqeFNH4lmqv?=
 =?us-ascii?Q?EOZc2Xj1Qhm3zITp/M4SftJyslR32PskguqwY8DYd1J/1vYwu+e5LC/XuNiu?=
 =?us-ascii?Q?gGe4ust+SSZwOjdbmcrB4qoagFdY/bxJ6Ho3qVnSvQicJi3T4APzAr1mJIbY?=
 =?us-ascii?Q?GVq7b4QQPc+P3qxb4fN/43nalvBFQcGL7YU4lty7OeEMF8/xwmfVtNGOKRrM?=
 =?us-ascii?Q?r+4/vUM55/XK/+GrhstI5zH9jJT7Ig8GEg4ggvbPhmPVq47L4nQn213zSn8N?=
 =?us-ascii?Q?TNVw2EM8TWlRODGYCYgRMQ2auSbEgYxuUGkiuwk0apDC0TI6mkhtKW8gLWYN?=
 =?us-ascii?Q?ka24mVS80wXVAg/rPeOfPi9m3O/AR7lCNH4RXHnQ35Ldu6GnItcm7vO8/OYO?=
 =?us-ascii?Q?iFwgZ08LOnC86b42ohOMlyONxK+Lr34UZ4rvApBWLX1Xl2fXwVObS2cXdfg0?=
 =?us-ascii?Q?yop3Sko7wDckUhuqJQE4FUjg9C7GRWvF151ojQu8nTs7UBqUbASptS+hk3Dx?=
 =?us-ascii?Q?a7HGt2hp5zbH6vzDczvWOoy1Noy0q+1aqU39T8u1nxz0EGyQEk2QNvuP24by?=
 =?us-ascii?Q?g/nxdAsm+xFcdcxN98XgoUsHmYxdzpzVHO+CQIW+e339ngcTKE095YBCUfVS?=
 =?us-ascii?Q?wIdzoTfecRlL/Jp8Ri+fezoyoZNKj2GfcXAMgIw7XoU8jFqDN+7M4q6QyNgw?=
 =?us-ascii?Q?6Ggau03+h/zVoZ9QLMUBKblXWMkm/5vuyYmAM6Vn7K+25C0DntgsVbyQCem/?=
 =?us-ascii?Q?xpaBtz1uDbbFLETmnrHhVeH0FTvXCoRJGQYj+jWIAUvHPq0oaaXglzPBAfZi?=
 =?us-ascii?Q?R+hs5k8KwYN+/42ucp/5w6AAg9oqszmmCOqDlMeiAy7GpZoc1mnDYhOIHnsR?=
 =?us-ascii?Q?kcd2SH81/jMyHPFzk6FWP+78xpSFoO5WYBL32wgNy9c5IAIIDbA3SeJBmK8B?=
 =?us-ascii?Q?ub/z+C+oBtczOFUsD0BaOox1RG1fGaRFJ48Z0vWY30CFxnAZD3X0dak+++A1?=
 =?us-ascii?Q?lBquAAglk3eqCqSTErKalzk6w0LCuM47j1CAjgtjf9PBEoxh2WuBkb+gLTuE?=
 =?us-ascii?Q?ND2nGQ4e9vh6HggWlv6uaHzfqpZvlvxT/S3dVSnnD7YgR8ZwV1bok5j/XbqB?=
 =?us-ascii?Q?6akbn5Ge94JebwDP4XkJPM/ibzJam+zQkBHaAnOaihixYR91QqC7Eev4prqL?=
 =?us-ascii?Q?kcNpgntDF0OX9Bf+9DtNmiA+ux1XC9cdP4aD4/QXqW45lPlZ2XMZKd7n+KxR?=
 =?us-ascii?Q?PzQHnuSsO+kTgUeLCPthPOgKzj9vVm7tCSdHCsnOnTmBmU8AcKYUZ329pWlQ?=
 =?us-ascii?Q?HAw57gajpCpJ838OFTAFLLCvkvn8XWqaLpzFGZQIpGWF0DwxPjFueTCAF57J?=
 =?us-ascii?Q?ehuBkSWXCftYbd1BCRlFfh8DUrGrqpqZ8lT/tZcuC+8ma5cqtBWstAVfH4rZ?=
 =?us-ascii?Q?lEAKOw3VBT5je4+jekIPC5miaUOj+a8g/Wz44EGnx0iCFoP2BUdc5HmMYC3q?=
 =?us-ascii?Q?KMWhXvi0e/1ePa+M/9VJHPFtPW+7s6EtIo+BkwJmDVbQCwhHTDyErvUtsP7/?=
 =?us-ascii?Q?5ki4hIU/q84kwVHARoIxCmnoJfU4eWmP8/lsK4RZLSCI5LaW2YHA1xUZ5wEQ?=
 =?us-ascii?Q?Nad3iEcPuw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c9103e-0df4-4447-77b8-08de783fc9c2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 09:40:49.9223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mbc0erQ+ptMcZ9RA8r0o17MkcUESTtnXU9mefri6mQ5rt6ElnTVxstLk2qXIHMUCDM7jFpAY1e7VCIU/d/XoUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8585

On Fri, Feb 27, 2026 at 05:15:46PM +0800, Chen Ni wrote:
>The devm_ioremap_resource_wc() function never returns NULL, it returns
>error pointers.  Update the error checking to match.
>
>Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
>Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
