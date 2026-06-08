Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011047.outbound.protection.outlook.com [52.101.70.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D7B233955;
	Mon,  8 Jun 2026 04:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780894704; cv=fail; b=Jij6V8XebpXiqvcWdGNkUG2KvxdnBJHj87udk2ygJ/mkteqeRqHDIy57MMgzq2TnEBn5D6jHR57aEWNoHswn3i5ICzEeTGGeoZ2pOnKMMCMNxxEC+bAIfUOKnoRv0ad+SmejeXnLFBLqkQUVMGJuHrk9/3xJUB0etx/c4CMAzo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780894704; c=relaxed/simple;
	bh=eq+EBPrrJ4j9m3qGYq75uTZkEmeVQbiKyykN+zX9Wt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HKH5i3KjH/1Jg2TslrbUQQwI+gVuFVgRBtfj1S818KejaUoAY2T4k/oYnjRXy7y0odcySSRMYO7h55G5V2TGikwDysveNxAm6hTtCRS10I/J+reb3zAsaNTkwNBK97/8WsLZiTRrbAE2B8wKW/QusGoG8zfP9J8SUwJ9chNVyfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=W5MB5p+A; arc=fail smtp.client-ip=52.101.70.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="W5MB5p+A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PzZpsnph6q34NUFllHEb5u1uVv7M+xKscICuA4rDUf9LV8oWsqZWZB2w4WDZya9ztWoyBQVZymHeUztwThOfy0RMs1kywehlJxJO1/Qh4fMN5p2Ce/w3bw87Z0udOUkKCYvqhXNbW/8YdGEWO8wWxA+J/s3iDS7EuOm/R+Yo5LGjwgtVn91TQJcKAnIAqhjInj6jAoKEvlF12/cXtq7SNztymawCLneylZtFrS/JYc2CRVI+uHj8tW3D1gPlYWFERCmJgLfO+jAhLjlSJYM+V/1hEfymbIlm1KHPwiTkYmB8QOJwtBD085Z578cYTd/FSgD70PSmWFjtU/7iHQbc+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNAwKG7xlvnTpBIKfkcmGtlvt5yoYIgOZsKUTAUu+h8=;
 b=KSk/OJ/VVpTg58WNulsWlE9/EEJZGjlhlQM6m8B5a3YrT3qzOfZZHSscL3Jcw6QT68Kw4IVj4kbYSlqieBWEeUhGzF9jRD+O8xifbh5aQuNc7sJHoWBQ4Oi+zydeehZ6Ur4PYDF55iMc3hCtH7Cy2aSG0fENsVKfWdqsB26bMEvFpM3uGPzcmJRjxv7mycN1AeOlom9rtv+OrKNTjtjBebj8jWXmi72iNmZmYWIZwFbEvzTMeC5JlKR1N/gVd5TozzKHgXsp1uLDQEwGV3QGLvk8MNQxB/eeV4M/K3QzEguDeQc5K0PZ178i7Lv9os6gqRnCBO7dFN9JqEVANzDE/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNAwKG7xlvnTpBIKfkcmGtlvt5yoYIgOZsKUTAUu+h8=;
 b=W5MB5p+AZLTCk8CKlMWtidNURtZOTzy4KZbB5Ww15aCK+q094pY7SkWflhhjKe8JQdVt/238siGoreBTbG9uN/CQQ6SQvnnAWgHSefUJJCaP/BrUSzgbRrciG0DW203BIpQDtbW0oN3Iisbd9SVjNardmWDB+u0jXzItS/adCHo47xUu4mSKyrt5FWFYTwZgE4L1hEfZ5VBsJESEZoV3FmMMw+vHhHh+wq0aqtyaBifuKQ/rn8ZlEmP/QzA4PavFawluLW7p5ajPCFtnkeNHwPKlXkU0n+/43aUNVCUlbDbgiJudTDzc4tWS8hbgHRFOhm7XL3w6Pzapk3YiPXjy4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by MI3PR04MB12439.eurprd04.prod.outlook.com (2603:10a6:290:74::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Mon, 8 Jun 2026
 04:58:19 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0092.010; Mon, 8 Jun 2026
 04:58:19 +0000
Date: Mon, 8 Jun 2026 13:01:19 +0800
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
Subject: Re: [PATCH v2 1/9] mailbox: imx: Add a channel shutdown field
Message-ID: <aiZMnxH4qn/1fONa@shlinux89>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
 <20260603-imx_mbox_rproc-v2-1-a0059dc3b69a@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-imx_mbox_rproc-v2-1-a0059dc3b69a@linutronix.de>
X-ClientProxiedBy: SG2PR06CA0240.apcprd06.prod.outlook.com
 (2603:1096:4:ac::24) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|MI3PR04MB12439:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d9d8bb-e7b5-4f3d-471f-08dec51a8e9e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|7416014|22082099003|18002099003|6133799003|38350700014|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Cgp+bAYnQNEGhdjugFVPDoE961uSnJdIrEpMOkGjoLBcjbUaOrygPiMWqj/xbNYa3Ilm3CeSgyTanmizBxfEjLwI13VXqoeuLvP+ZTT4DQ8wHyzHAng8EpM3qES1TS07zfjIRGnO14vq9/stho+TNAECxi5j2Sa/wRgMY3dqmKKw7X2drB64ZnEcvYQwHeVEWe+/r5bN4QAUUY74x0X1f+B0K3WOHTU0FpXA/Ev42gh3Q0Gsg5Qh7r2m8LFw8XxyBn42fczxH2nXLM/hseQFlHqZCUFbWOczd5TiGV5YyniuQP0fTm3iKiw2d4Px8s1lrQhXeVLB4MjjiI/GiblCv34RA7KDi5p/J0A+vFSFIyNXDmZURZvMo0bWCZd07ZdMlAI/0wowdHungdIJSraW/XUsKuf/Qx/VUEIlf/bCZ2Mm/c3yEVxOni3Su2anjh2tvy8OeTxDceCTUKC/kw3iBs18FGEoD1wJlJzP8WHrZBMz/DQyxzMOr6jPs1OVzTQ2afrQCAqdmViTJDbjH5ex0AdufhD7o4T6Kt6s1Tepyp7nXgcNcA9y/kIBrNoMp70wesIEgv7SWosdD2efoV7G2Pfr38VxTURXORAfS0LaYpTOgGnAiHCNpxB++phcPFYcWzOj6UW8b/nz3m9OZkw3++my4MDeKO+dRv/0yBwALmF0RcjQiS9Z8/dqSZtVj0lsOSqCHiVbx+3bGWqhjBhyt4+2nklqGozM+qhTRhtt6hyBkcog2L7Sy546bYpGp8ni
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(7416014)(22082099003)(18002099003)(6133799003)(38350700014)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SjJQUNLa11sNV9uzu6WumDpUQNaCPkR6mcSleB/53BHQh06lUOGk01X92xx2?=
 =?us-ascii?Q?zjf8/ipoisJRZXhHk0VeUIoleecHBCN2sq53WmCv9Kryy8WIteKBSC7xrZlb?=
 =?us-ascii?Q?7XlCXczt9muo6lMFQRnr0Ae5VhuV5PGL1xUnzcixIX9HHmjvegivYB72MOmZ?=
 =?us-ascii?Q?9B78H3J32h4oqSBvQypbo9KJYW+VMjnPh200P4UJQEdvGL47kX+GZPJfdNER?=
 =?us-ascii?Q?uZKaDaB3PzGEyoGem6LtCJWHVt3qLpx+66aubCKhk72bmP4Vh8uXUVdKWT4E?=
 =?us-ascii?Q?kl9cXpWOha55UwPFIQiv9jF2MQtogtJlo7ZXFe4mgQ3scAtwinHfjY5g1ZKA?=
 =?us-ascii?Q?ceiCnCUa3ud+gbpU5TN37sl2RTbMAYcGfbMuWF5ZbqNG1uhi9Z/J3KnDEpKq?=
 =?us-ascii?Q?PFJlwyEmGn+Ofq5X7CTEaNjW7wG1YFzBNJIwjtOWxaqohIfh0MSuYilrBxb7?=
 =?us-ascii?Q?Yud/RcnsWgF3jYnWy1FCiaq+taeYeVkzWywuhY8E6vUeqGCHiPJslATU/NX2?=
 =?us-ascii?Q?ihc+PIVWtsJUHDA3HSygm4Krns0lZPF/rN5R6cWe30bnWXF+7oECHTOIv7qf?=
 =?us-ascii?Q?ZwhGvSx6bcK7JmX/KZiZUX7U4WYc45oI9cTEPM5qkJzEhnSXfhX5I4DqbtT7?=
 =?us-ascii?Q?gNWN0NAmWtTBdFVSurPHv2FkagcNL8t0/vGH1kins1uN5rIoc9Jz5VaQ2wAG?=
 =?us-ascii?Q?cvNDEilJ6uBfiEzstDB9Jp5xdd8xZroyeC4cuhJFPdDmnscJWViholApLWxF?=
 =?us-ascii?Q?ZtgMh29Yi3mvnstxtw+JsYVTxR+4mKmXi3qR3D4AcS2zJBGxrexxqTr7d3UK?=
 =?us-ascii?Q?AjtynkMWbqRzPOB6IQ2HeA40AFDsZpy/qdCn10pplI3Ihk5yJ5QNAg3ZCrMg?=
 =?us-ascii?Q?v9sbHRNvczVcfKO/aVmvPDaXDgCCygP7z9Mr0+5j+q0E58jo7EPg2isVi925?=
 =?us-ascii?Q?ln6r1chno+Jj01FhOsGFCU6ze0CdCiM/ZYUp1M+Igh9N/qtunl1gfMPebqZ3?=
 =?us-ascii?Q?Lw7F2Je9+cnUC7ABdrM3i7ghOGpsTSKetWtVxnpAVGv866VYZlDWTW4562k0?=
 =?us-ascii?Q?szMls1XNprT/BwtnYMbRjmbFF+rpENbVnBhWlWhc/s1dS6dsF1wrBxfdfOpj?=
 =?us-ascii?Q?LxLF0lp17o1vZ+SsHYeq1YGZJJrm3VNb80/x4/DwJ+Py2torCmHyKu1DhUux?=
 =?us-ascii?Q?UUPVexnA82BSdL7Vp6JxUDkelf2nCdnpT/gvq4/GgMKoA61NZmoknT1PP0Rm?=
 =?us-ascii?Q?SpyVG/nvITbAJrhbMjHO0ZebP64phPz+2EBuCEdUXCRPvjRcGo4r5+tjZFWP?=
 =?us-ascii?Q?KbxNsrk3ienr11ZmnKgKHHGiEMdWK56ROJci8HkOhWB9vfY/Sny+x0hCo4qe?=
 =?us-ascii?Q?kK60C9SSbCu/8bdCNrpQS958U1oUsOFu7HwHZ2rPUkPPpkk1dRDdVFeYsuH4?=
 =?us-ascii?Q?3wHRnMhdBJ5hMVdSbLzrQQYrrpDVWFIrW7Mybcvz0pn6jIpafkIyXySfW2RD?=
 =?us-ascii?Q?Z/aD8aS9yHaW//5TtDYJbESkt6VYpxaONV+QSSsTYgk1xrQZCMLbIdBzEA0N?=
 =?us-ascii?Q?JUzvyRWu8Uzm1QWLaoNhYNdbOC4y+Dqw4afe77p1sAggSQphkK5LuKv3TvzD?=
 =?us-ascii?Q?u267ipLOrlcC/hiyNPKImWUFgRBf3LjxhIdCALx89/1LkHW6EIXZRiU7sknT?=
 =?us-ascii?Q?HP/3/rYA+VkTGW7i6g+QA4c83ze+G358y3u7ZLILOl30YAKe+ejPpr90IKTI?=
 =?us-ascii?Q?8X6K9av6bg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d9d8bb-e7b5-4f3d-471f-08dec51a8e9e
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 04:58:18.8776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ItmEgrScmezjkuXwVpb5QwgAG59re+uriUBINUi3ltn22ijo40D3zKH8LbbWhqrrXGdRM3Q44hGPRmV/+aoFjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR04MB12439

On Wed, Jun 03, 2026 at 03:05:04PM +0200, Sebastian Andrzej Siewior wrote:
>sashiko complained about possible teardown problem. The scenario
>
> CPU 0                              CPU 1
>  imx_mu_isr()                   imx_mu_shutdown()
>                                   imx_mu_xcr_rmw(priv, IMX_MU_RCR, 0, IMX_MU_xCR_RIEn(priv->dcfg->type, cp->idx));
>    imx_mu_specific_rx()
>      imx_mu_xcr_rmw(priv, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, 0), 0);
>                                   free_irq()
>
>The RX event remains enabled because in this short window the RX event
>was disabled in ->shutdown() while the interrupt was active and then
>enabled again by the ISR while ->shutdown waited in free_irq().
>
>This race requires timing and if happens can be problematic on shared
>handlers if the "removed" channel triggers an interrupt. In this case
>the irq-core will shutdown the interrupt with the "nobody cared"
>message.
>
>Introduce imx_mu_con_priv::shutdown to signal that the channel is
>shutting down. This flag is set with the lock held (by
>imx_mu_xcr_clr_shut()). The unmask side uses imx_mu_xcr_set_act() which
>only enables the event if the channel has not been shutdown and
>serialises on the same lock.
>
>Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
