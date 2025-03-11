Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FE323814A;
	Tue, 11 Mar 2025 08:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741683435; cv=fail; b=UvVSVPfwsEbe7CDVdqymb4bIvTYimDuwzsSrSXyqgYUALSTRC5xqi0ngoyT7NxzFH9hc8zGg6SFZpgWI3kGEr2actPJxhpqHopgdSQDvxNi1qMpNqHM9RcWQh7q6lNYoZIdPlPdy2j2KkxjEDqmQmY1RAx+DDfSGWNz+xG762QM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741683435; c=relaxed/simple;
	bh=Y6z8lnbwJEnqT0LnV9PzfLqR7hFAHQI7cX0wtvTlaD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r8WDrdLt+NF89JWb9ki3V8xuCeurtDPttQrmeKgAChP8ceVKt2Zx5KlxWu2KVz7KOkjD6ii4TheJOHRz7Ao/qkG7HeXbhCpsH/sIXgrmM/iy3M22pmI4ieapZww3b98Wpf13CGqBLfGDIgggUxbHTYnQwdMDJ/eBv0Ik8VPPN/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=k8MXrkx9; arc=fail smtp.client-ip=40.107.20.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="k8MXrkx9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w70H/MYi+9G9tCfXeIoxMeWuldzkHhsrjZNEtd/QfaEDpJEzJ11wqaz+GRh4pGsRKUcgbR1XUVGv58rKHfaZTJ4wwi4iWQyNtRc3NR3rVQmeIYs6HAcV1R1yoaZYBOTt3iyuHGRIcGIFruPl/tbFXPJBV4cifQAxCp6Fc9A6rDbR/s9qbBKcgbOQhe+bQ61z4g3kDkXLDETQ6SPCEsRETPpup87c1PnsswFA+UWERhCaPWEzXnNHIfJjE4fN6krlI78HzMvXuYN/adOIY5nQjXDSr+62NNo7MX6e3sp3gIgKs89rQ2mNpAHTqwrk3qAVOofhDbnusujciw0ZmoMOsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljFtMlWCx27May4Np5TZoruaKgghMfYu5N1BPh+C4ks=;
 b=pES1aMPJy/8zL043fuC1GIQPXTrFYZnnZC5Y9ik3zIu2aQVLTjAdiq6dfwaiQgvlOBWw5hoCF6Ly1EvUGuE4KTHRflxsAf+xXgEDnXVgRzFWrO7FyoXJp4KY3PKHhEKk2XSY7iuMKLUpR2VEMss3QDQdNFQH9Cmupgcme1ynzCe+LRSV9FT6BRmRnl9WxPD229TPgYn728HXP58m4/mX9LuJYHBmJU0xhWIRG0tdfMuDv16YttPSZ07Zf1QHjSv47hdi45FttFVuEIUVKOMwx0iJ7dM85i2Yxgmsl4/SsuiAoFPLf5+sGE5eD9i0u5XTp1moszPOH7VPUtfPotzU4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljFtMlWCx27May4Np5TZoruaKgghMfYu5N1BPh+C4ks=;
 b=k8MXrkx9LWLfkN5IuNedTk3ZWUf1vlp0VaN0ODNZ9fQTpSL/4eYDy6wpeKGMBPerANv6Na0SSagt9efpQo4AcmQTbC7mzv9QGl20RCuq+nSczi2kwAKh2M39eWyBE4uB46JiaObXSn0H+R+hblgCaGQZMtN5xh2BcXi5fG3qrdnrs7sXz0trLDTmPAScRujKzD/1Sz1yRAbihpFFAD2E1DhZzwENuA1vnMzcxTk4CCULGyoxIv407BRwcDP2TnVklItM9Z+c+1pOxhOib7uCa1YS6eYGCuh2XtYc86o+URR+t7UWeLcR3DQIlJLAqRmEB6qk98cES4bJpyn4jUeyQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DBAPR04MB7431.eurprd04.prod.outlook.com (2603:10a6:10:1a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 08:57:08 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 08:57:07 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	shawnguo@kernel.org,
	mathieu.poirier@linaro.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	andersson@kernel.org,
	Frank.Li@nxp.com,
	peng.fan@nxp.com,
	laurentiu.mihalcea@nxp.com,
	iuliana.prodan@nxp.com,
	shengjiu.wang@nxp.com,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v5 7/8] reset: imx8mp-audiomix: Add support for DSP run/stall
Date: Tue, 11 Mar 2025 10:58:10 +0200
Message-ID: <20250311085812.1296243-8-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250311085812.1296243-1-daniel.baluta@nxp.com>
References: <20250311085812.1296243-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P195CA0009.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::14) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DBAPR04MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: 05899435-e879-4092-d58d-08dd607ab2f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?udQLzwMnRWkUsBMcrIqaIphVG1wDoJfFnljUpNDvrRVWkt2LFdNTfzstsyd7?=
 =?us-ascii?Q?dCVkpanvILWm9rGMsMEeXeG39Y6XDRvRQniAJL/TtIC/6ayTjb2Q8+cPtYL7?=
 =?us-ascii?Q?GObK8e3dbBhYLn8zo/KaM9aJPFS/2bGDeKdODkuLLfJaw1huIualGOkPBOSJ?=
 =?us-ascii?Q?Z7I4twYnH/iowQhB2LF6QV32W5hpGCKZpx+lfnh4Lhz/DIj3WCtlWzKzWCKj?=
 =?us-ascii?Q?tojdSZzSa8T5c3fVIyUgyLEHjTZyyLogqIq1MZS14NywKnvyEkJ63vuRwNjW?=
 =?us-ascii?Q?fjtITbs5i6r1R7wHJ1jf/uqbihOG4XE2ENZ/P5SkGM3ySgpTv7vs5oORRW7T?=
 =?us-ascii?Q?rPIcDEYNC5WLUYZtjHfixOC0iSToiHUMIqN8/NTDbVgJfWzELYCbfDbrC+7J?=
 =?us-ascii?Q?KBf+Fu6+2But2L0AhO62o/uIfJXKcjnbhjLoMDzGuLddJu8S0hpYoO4NYIHm?=
 =?us-ascii?Q?qIufX7g//B5rVYCodmvYRKBBYTwEeYvD2r22YLNHH6SrndTxv+bVx6FeIq1D?=
 =?us-ascii?Q?C3aohU/877xW8o3OPLk5wtt99001G3JUIxy1sNnGSq8aTawPP/byU7Sc9swX?=
 =?us-ascii?Q?76mw1Xl0rwm95IebFM2n2mYSA2I7kGUS5sJ6Rc+7Drp0iIqIOBuTqAXImXWw?=
 =?us-ascii?Q?SY7QyXXl3sL8LlBtxv0LHn12pMo60BPPnvSJVdaRBI51l+k9IGZ1VFmqIxTk?=
 =?us-ascii?Q?Uq2UZ7FNrekrY/J99ZozvAA4RbkAVGHPepKaQRluecfDUFIikEoERShnQ0mv?=
 =?us-ascii?Q?RDR8kHUWacX2Q9eMHyIQ0K/FSig4YVkJdNORdMdD8xKMoZ5Y5wcx7aencWw+?=
 =?us-ascii?Q?sIOzREmzOTaeD53M2/tS3nEuAiVaTx3cMgTZya5JJ/mi6kLNrOF3KlvT6Is6?=
 =?us-ascii?Q?cSRNjWLgL/p8pkOXnFHvHOUJ5lh1dhjG4XuZEBIidKHmDiYrWbtv1IMXBcBU?=
 =?us-ascii?Q?49QEOJvsS/v4Ow9zN6i9ChKEHNsyF/+kjImrIgsVTc3YyPHiCILCQQt/nPdu?=
 =?us-ascii?Q?UjJiu3otoapA0REm2XRLY0s9QYIFusLQurH6Y7zgL/MyaH8By7+EYI/z2fCW?=
 =?us-ascii?Q?tdyCyWiFKrTKqQjF0orAM9pt8JsRevjA6acYLqx6EAatR0VRMAtp5Q2vl7o+?=
 =?us-ascii?Q?gRKIFvvByFtCPvvzPI8Grdua+pt06ctJaDWmV6RZITqQ8OpqhWhugB2N03kw?=
 =?us-ascii?Q?vZvkmH5gqvsFkP9SkBuLf4lyUykRh2ezNOWmdli/RYfXClOdA3ty3m5K+Ujw?=
 =?us-ascii?Q?KsCGSZ7CY1jcQ7Jj6LTokdvLSknDT5wABedvViDnzws7SBcoGptnbKBMSpci?=
 =?us-ascii?Q?KxtvTryclPQof+k3TBxfEkLQj8oU55PlEFRSslTtXt+m9sReE2GsGgDg75az?=
 =?us-ascii?Q?WAzQ0aRQ75YuYikiRbA/9R8+rRpTvLiI+Fb+aJyzP4QB2nhD3ZpP6/0S1W+/?=
 =?us-ascii?Q?oZPORiBfVDs0Ixd+I1GHjxpiheD2iAcG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T7Wx3wXGhiLnr0gjLWqe1RZ8AFKF/iLD3PpxuUQcG5wYh0kbZoWvrlxPgXdx?=
 =?us-ascii?Q?KZLRqb7255aAUre6d7bn6Cu/bTu5VfBYlOVB38Te/EgqMtvhpFhtSGqTcuff?=
 =?us-ascii?Q?fDkYv3WG5QytP4TFVt5DtCOf4xbzqOKV/OIQ2P9rTn7kJjSn80TVF61IbMor?=
 =?us-ascii?Q?6sj6yWQpxEk3ZMD0LwHa5YH51ZY9OTcmhthBardTFb1swgT0UhWUE09NO8GS?=
 =?us-ascii?Q?1BqRxP5P0hbyGUazYFCp9219ChOWc0sUrypc0VTMxTj2AoExG/9Ey3I9ScIo?=
 =?us-ascii?Q?VnRO0zoiDNN3R/C9XbimueTvEF8KPaOqp++36BAimini5ugmNLcRhDOhbeQQ?=
 =?us-ascii?Q?OXlP9AFW8kkP4uDllHL8fELS6ivpo+jBnTU7u0ju+TY6Tzhp3ToSm093FRwR?=
 =?us-ascii?Q?AxwfUTY8/IaiCNp3jCn4g0dkFoiJOoEY+oZJHCqaxKeAtrkpUh3OVswkQ0yE?=
 =?us-ascii?Q?EC5ynJanSCWoxB0qR4KlT+zdx/dhntXTrcMBF9Xzyt7knGSQ2rYIKKcqSPOV?=
 =?us-ascii?Q?gzHkMK0QwQcAcSH5SRpZVLMnMkSHAd8jL7lKqoda1Ae2JqD/OMIFdp/LGglT?=
 =?us-ascii?Q?8/okVaCZSvKk29gzb46IvRo3MG1LFQ2iJqJNPZAtPkMRCzGq9oP68eWfV1/W?=
 =?us-ascii?Q?NCLsi6dRGsjRxs5M/tO70nAxcpYUOPAYyC043gfXJFTTfYHqaasXDXmZ/KvY?=
 =?us-ascii?Q?bdGL9s8bnYb6PVi6lhq3fXF/z2RBNaWGssTaNhuP32yaBAnLhG2ljO3MG/RV?=
 =?us-ascii?Q?pwXFFT/KAwWlcIIanEgoLEJZQNSqUt4IKdA6IJZdQP2czX2MhJjXVBwsEFka?=
 =?us-ascii?Q?f2+lHwkP6bLjPhxxgTqamZPw1OeVNR+u2DDBne3u61OPGgXyUC3W5Zq+N3Ip?=
 =?us-ascii?Q?riVDtlFqkvo9Ne2WB1MtW/eXcRmKanmJs7DW2hLSftub6oo2peUpNI1FD/FW?=
 =?us-ascii?Q?I027Z7dLNFGOPmQKnk5kOc+IXxDF1AhC5UlUfLnz4HUngapSfbWxJTJ5UsyW?=
 =?us-ascii?Q?YqtVfGYWjtXu4HXIhTZEpbl2KWBZ8iEI8Ww6srQzFayOwwIyEWWIN2aHHo31?=
 =?us-ascii?Q?CASiQO0saTpwLokqx9CttiaSt90DeLLhEKegE4duyObrL6V0qh5dKtoVYjk0?=
 =?us-ascii?Q?P3A+YkRbtjxLaUWcUHNXAh/2VSJ25NHB7P1DC2tgq0XgadK9c0+jlgWw3LJJ?=
 =?us-ascii?Q?NAjzPhbWObfIF8gwKemMnNcbjIe8rZeBTtzo9FhZ3uxBAiPM3dUJC/+UBCi3?=
 =?us-ascii?Q?ekPHkzHSdq8I9eJnh/cV04FVg0q5SDSOhOXakkrmvHP0Y42xX64bsFq5cdeF?=
 =?us-ascii?Q?b5PZU0fMT7ivBwPt11xVC5Qoxaq4BGnyhcUO0eZweSD7yjQflT3hJY/RxPAS?=
 =?us-ascii?Q?o7jAO607Hvbg/13HSRWq7VcXsT9WRK86L6Jzdbc9hiIFFPpGwQ6qd5+8xaGH?=
 =?us-ascii?Q?ZKEIvmeZWkk685RUJoObv3wdPWGA4fBQ45zVcLG2C1mjpctbZpqxbaJEhroZ?=
 =?us-ascii?Q?05rwUD+y+mtO/RwpTm0v3GkMdFHdc2tVClC17zS9wPpbgCwdDdCQm/7E1kpH?=
 =?us-ascii?Q?HGpF5fFzhocZjJe6numXtWckNrVnGIhydyIpU4KR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05899435-e879-4092-d58d-08dd607ab2f8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 08:57:07.0374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBnPNvGcQImBtAX9Jrex4j6nqOMehWmXKiVPoY6SPpAsPqBzhYwYE/UjOJIj2kfO7XgNYvnNe3eaGPeN+cBkCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7431

We can Run/Stall the DSP via audio block control bits found in audiomix.
Implement this functionality using the reset controller and use assert
for Stall and deassert for Run.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 04ad27aca806..6b357adfe646 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -17,6 +17,9 @@
 #define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(1)
 #define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(2)
 
+#define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
+#define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	BIT(5)
+
 struct imx8mp_reset_map {
 	unsigned int offset;
 	unsigned int mask;
@@ -34,6 +37,11 @@ static const struct imx8mp_reset_map reset_map[] = {
 		.mask	= IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK,
 		.active_low = true,
 	},
+	[IMX8MP_AUDIOMIX_DSP_RUNSTALL] = {
+		.offset	= IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET,
+		.mask	= IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK,
+		.active_low = false,
+	},
 };
 
 struct imx8mp_audiomix_reset {
-- 
2.43.0

