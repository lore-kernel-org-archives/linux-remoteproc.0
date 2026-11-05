Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793846294;
	b=ND1QpJllc7Z9lDrKDi47z7wrqm5+zdx+iFA8r6VfubEks13bO7Y0blv5bf6jvkWYaJ+I
	 +vH6antWrFc0qHsXGs3VlnxL4XjGFRdHWyEGbxBHsB+3Dt5y0y9Ks4j53DPkguyqR3//o
	 MgtB+NlYR+zYzP1hOJLUQfWc9WFeNl0Qkru2KHwFI37OSHMLGGHQTBoqvJmH7Dyodutvt
	 avOJR0/DtvdryRl1PGKV9TiKpZyJxZaGAxOSseWCP4ksvKcx2eNNSwL3A5w1QA7IfYYaj
	 Z9hDV/B3YSLWjdatVHNtVteWiq+AgGrQZ4GqtlHi/xpbcnlx/jLQELDT8nd/P1b8Z8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793846294;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=JgeBCATj9boj9Qzyu99TXoPkZnhl97NuV0K6WQLT1ZI=;
	b=ey02akXGyh1Lo2ZECqIptpTLQRoLOTIe1SUkBCvg+vk5t0bYwPl5UgPqQv8Me9IL5j6G
	 2v1+twxSzWuOvNAhJsln36UdJskMOybwAaJfWQW2k9JILoedNJbrhpwwebngoZl3ZQJAl
	 2w4ksyDkhgdOeCR4Bg/5ULEd/2TPmrD6oJJ284n3O1+pJpBtyz/x7sYVseMUwzgmEe0BZ
	 jHBl909YaVyVjpsg1ePCHs1tJaDWklLwjw+I38NlCWJtTg0bRT9T8Xygdt901s8gqZQVg
	 ZrdFJUbcyGfDsTAPdTCrdz2UNOSTScwNiD7WsILdnLKag0pJCnlAlicLs5T1QS/APkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=YL2PPJ47;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.56
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013056.outbound.protection.outlook.com [40.107.159.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1C5606A332;
	Thu,  5 Nov 2026 02:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC1C5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=YL2PPJ47
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XCROuC8VWC3lNGZJ2c5izy4mCa6CpOR2W9kcKohTY6Xf75715rxOGjZoPzz94Wa0wpxV9N4auxY0K+iVWBZEeJWPRarTwlgZthINjUOTGYUlvuvMCOB7d5Fddgqedfn5D6RlwJUW562CjGVkTPLGhhma/pizwh3jb6udq0096vMuOBkYJHi2EWrkuwv+If2JhdNBzHgsStPxH+i3VqDIwHItDXR9ErESeK5o95m7uuk/vr7jOWvBbcwSX2Fg68lSmdQYlHtA5cPcngGLVd+OQP/bsn/Py9XHbCIoWBpMMwftbEVKfRW4EtyKdTrQbPkSWLxWHWUpdVLdYrhhfFjLCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgeBCATj9boj9Qzyu99TXoPkZnhl97NuV0K6WQLT1ZI=;
 b=R65SDI4DJkeKmi1IMI6+SCmEzfvRzfxk1/yAytEVkakSkZBjCPREWvzsJKgz1J9hBuuckDEtqXUAD0atdd3h3Ct4A5JNA5dQm/bD3+KC3KU0f6ksAvJY9i1gjbgfZ9LbDxh7fMPgkMv6n4bCMAm83lVkk514VPF5baI/9u3J6w8bVukmJY2h8mWxri3pD61HJJyC5wwffct0WHiNJYKU2dKr60cEHWNnyX6gvRNB1QU7LXzAydQbME3kgCPLlGPt+BPZuyOclxJYD6WBrjWStLAWN5W+NFtEtdb6KJL7Hr7mw35qYgpksuumSEzD6MscrDFyR305Qae8oWpFwm+QgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgeBCATj9boj9Qzyu99TXoPkZnhl97NuV0K6WQLT1ZI=;
 b=YL2PPJ47zyvE+yyQdx4e4o8ZoBLNzgVnl9+lKDh931miHN1N5knort6hy7tg+ftpcah+xwcn4dHc8L+OwHSrAgLrilx+S00rFNRAM9Hbtm7qtAORys82406EVRO3gjua86wVTKcA7aua/uhWz04eMtWffw/cdisJYdNvXV+I8y9XGVORlEC9AVw/j5beFd9pNEVUA2KfgZ4oyFRKeNNdCWS73pC6I0qFWPJqx0Y8q3lB/5lN2/DuBJ5tGZDn2/8aQT8+g3FWrn4z7QZgaFi63tkF4elpjuFtVQCUyWAGSKnTU3vy0qIaFggfUykzBgHCZTA0gtHeUsrt8oYMDFEM4A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by GVXPR04MB12060.eurprd04.prod.outlook.com (2603:10a6:150:2bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 02:38:09 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 02:38:09 +0000
From: shengjiu.wang@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shengjiu.wang@nxp.com,
	daniel.baluta@nxp.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	p.zabel@pengutronix.de,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/4] remoteproc: imx_dsp_rproc: Add softreset and dbgreset handling
Date: Thu,  5 Nov 2026 10:41:04 +0800
Message-Id: <20261105024106.338791-3-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105024106.338791-1-shengjiu.wang@oss.nxp.com>
References: <20261105024106.338791-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0125.apcprd02.prod.outlook.com
 (2603:1096:4:188::13) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|GVXPR04MB12060:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cf87f0f-73c3-476a-ebf7-08df3ae5d44b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|1800799024|376014|7416014|6133799003|10067099003|22082099003|18002099003|921020|56012099006|11063799006|261102123227099003|261021123027099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261009223027099003|261021121427099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	bSQ0bbT2e8QgvMITA0cUyX6BuCk5o/GfR1S73mQMRR7jcmcQs7+r0AasyTkIk8X9DxemuYi53V7MDGgnhlSN8Gj/2nHQVuhw+qskeHFlVWIOaPbe22jsynkLQIn3lRKhn5K4syTwhdlrkg0EaS0f7TvTnQuHJyU7eFP0eIvClMMlKDkGawHgPyaO1WoWow5j5s6CdCcStoT1qGHSrUKfm4LRzlB4t+3tRxToU9AkE1e1lvl8UmETOl/vtNDBnrwirp1sLJL1aUevgw0J5JsCFGjDKn/AqyKf41FmjX9aOjNfXqM/FWTjcCFBDRmSCgh3JJ/xJWSXleNv0zPLqVOlGGyzE097Z7udLt0kj3ABsb6CSDTRUJAA/WelI455b1FIfqLiiR0Fwm77uf+V5v4t6iRc7BqaxNUWJzu4JRz7FrE3Nw5Y4vZO6vCM+qFV/hxm4GjfKFjGX/DiNFlvPDZjeFsHbFGm2aQVWjD/Xd7241GlwybS5CEmiL6keb7HOUjYPOVnxngEgU0mgv9LZiEtrJdZl29ggERD0tlQUlCpa1MMzsL+J2dF5bJ2qk9xR3Qfx5trmFQc4tcJFeIHyAxwMKIW0gOdmQl/XZi/Em9tDSODWig5xNyE1MX1A5CW03WDZY+YLj2O4Zgc4tMpqqyWglgNNjz9J2piGNx/YcgdnNs9HM7wFGreSqK5DRvjGzJ2wnMeGL1QLWau9MVJ6Fxp6A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(1800799024)(376014)(7416014)(6133799003)(10067099003)(22082099003)(18002099003)(921020)(56012099006)(11063799006)(261102123227099003)(261021123027099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261009223027099003)(261021121427099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J2VfxJiHS98bispIlOcmTsaQnYbsjkgryrETEBFGaYQuaQL6BtEigDMXCI5r?=
 =?us-ascii?Q?kkCBIfkFQOa2EDnfWjYmQglbMVFPNVDKXeWeLwL9n3QfoIHFcAcWlBzsOYC+?=
 =?us-ascii?Q?yu2MBKwn7lETaDBF4GvEHx/3Jem+nbUhzaPWs4X3ryNVzlo4dCCdQu7/pUOn?=
 =?us-ascii?Q?SUvhp4VBVyLBCTTPUWqMvnKdU1wOMgqn5WjXBbUPH+MsHXQaNkDyVGwekBmw?=
 =?us-ascii?Q?qIygkR619YrTTpyabZWF2EsIkiIQlNbj8V0lmcyFOXSIFEBab9TrGGoR1184?=
 =?us-ascii?Q?8A+oanqFDDLR7oZzXKR7/wODhH7jYxO4JyX/FbA06KRIveotT2rV5I+8Ko5V?=
 =?us-ascii?Q?dUi2AnqqTnXvShoQ9RM6Oq3C2osHo04HcpU/LG+dvlFB1wBYuwHYUQUw4cbx?=
 =?us-ascii?Q?Uvm72PFyFfb5amLWpPFdIUehPADf9CpMkfWAfOs30vO1UebFTrWLlW8di7sK?=
 =?us-ascii?Q?zlOj+044x+eCazUpIgr87iIDlahZl1BlnB5FhhfWr+1tVnY/EjkMqwrQfewm?=
 =?us-ascii?Q?Qo7sbGmua8gsod1sWS6Gys4s2B3sPzszPAWdsgQBKNbQIV5JbaMLKt3/Noeq?=
 =?us-ascii?Q?0/JajquMSOOU2Wi911muZ2EJuXQhv/E7fyOcWB4TCZ0nr/ERF6hUxYNPxI1x?=
 =?us-ascii?Q?jiqIHD6SX7lpmorsPDBPYymCLQEb8jTNb9AY+Ex/CZ8eDGmaBtJDMPqHXfgi?=
 =?us-ascii?Q?cR2UngbL/FHuK3qVbjimiSMfkwjkrzwFhaCnSjmfLHcGcdnIAiS553uyk9yL?=
 =?us-ascii?Q?t0FvARSNlavR3G2t/YfhBal8bekCx2/OZaaLalHGSD9O80j1eAaYQkJ0e+/f?=
 =?us-ascii?Q?5yl2Bm66YrHkbYvYuSltNhiTL4yL3kUOYcIkXxOMpQGthrpzExuom6tgmNYw?=
 =?us-ascii?Q?jy29Mu3VbGN44Egn0TSNbHcBtVwFHjopnTCtptovGTyBpngoeZyugyUC1gGU?=
 =?us-ascii?Q?FHPYc94QCRiEds93pgOq7dm4t5XCVBgC4s52PahGVZQqkOjjXHf6sh9/1VPf?=
 =?us-ascii?Q?s+SyhT7LHNZx2mC51EK3ITGC3a4faU1zV4PZSta6iavhaPgLxJy/lf4zF6X7?=
 =?us-ascii?Q?18JSFGA7nkQC8pfohsYnRgXANNhPg3BBs7Y5/5p6Ht/3lS5qBKoSKVEHDVIh?=
 =?us-ascii?Q?CiWiyh6Yh/se3HN/q9v7/b02U2nPdSOmGNquJ0JTq27Jj+BXB4eUoVzkgGdi?=
 =?us-ascii?Q?UguSvB7cn0uaEP/1KFz0ykzC7yVHgRnFkNvRBdiOIV8W5c4a0Z2nvmLsnsnV?=
 =?us-ascii?Q?75gwMWwMQhno/eB38/TEu/70EDR2pewdPI2e5+FA748Aqhsqw38d4GW+Sat3?=
 =?us-ascii?Q?MWJCTIoAS6qoMkZVE0oHsNMy33vYzaMTetiOVS0wUyDzUkERWKMEvjKi1WKP?=
 =?us-ascii?Q?DC2cf6spXpVlq7XmD9ZfjapLNE5qyea0t3AtULtpG6khLYLmIQLkQct0iX2/?=
 =?us-ascii?Q?Uk9fzB/N3SBSt1IoMQrbOyANuDfkNsR+QhAKErqZ9oE2f3zv9YU4QnI45S5Y?=
 =?us-ascii?Q?ZCVUC6ycX3MYNJIimQOFWkVz/38Ga+NTPv3w9KNxWa6T7TOD6mmKkMNyWW5C?=
 =?us-ascii?Q?pv4eJKPbvo8SRDZRPoHN0hbU91oplJQG2gG1RfGZzEcuplOoR2a4nTZC3AZp?=
 =?us-ascii?Q?DCQm3yVMwtkLYuIdFddZdH4l0X+YQCcQY2+TwlKnI1tEM2BPI8IlcTzvoaDA?=
 =?us-ascii?Q?dDEfNEgL6gBZIoMBPoTECI2FLYF8KkpM5MUb25NUHRk8gHf8x+LdckLELGLK?=
 =?us-ascii?Q?SvI4Pn2Se3nSdr7QsIZ6h5ByfE8yOF13AZf9p5cKWxlXuGfJ+ERu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf87f0f-73c3-476a-ebf7-08df3ae5d44b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 02:38:09.4659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q9QldWhWmRAZTVW8r06jhTR02Vx5rXdcmxXEskXYwa6863ofSRBDDQCM5qPje9dnJun2P6ISmvNzvRBUe+77jfDbq3Q2A9yhSqv9JIHdffEBp+59g8db208hP/6rIpQs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12060

From: Shengjiu Wang <shengjiu.wang@nxp.com>

Add soft_rst and dbg_rst to struct imx_dsp_rproc for the softreset and
dbgreset controls defined in the DSP binding.

Update imx_dsp_rproc_reset_ctrl_detect_mode() to acquire the runstall,
softreset, and dbgreset controls. The softreset and dbgreset controls
are optional.

Rewrite imx8ulp_dsp_reset() to use the reset controller API instead of
accessing the reset registers directly. This relies on the i.MX8ULP
SIM LPAV reset controller support added by commit 5aac7afc752b
("reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV").

The imx_dsp_rproc_mmio_*() helpers are no longer needed after this
change, so remove them.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 76 +++++++++---------------------
 1 file changed, 21 insertions(+), 55 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 96d619daf3f5..0b0042525ea2 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -108,8 +108,9 @@ enum imx_dsp_rp_mbox_messages {
 
 /**
  * struct imx_dsp_rproc - DSP remote processor state
- * @regmap: regmap handler
  * @run_stall: reset control handle used for Run/Stall operation
+ * @soft_rst: reset control handle used for DSP core reset
+ * @dbg_rst: reset control handle used for DSP debug logic
  * @rproc: rproc handler
  * @dsp_dcfg: device configuration pointer
  * @clks: clocks needed by this device
@@ -125,8 +126,9 @@ enum imx_dsp_rp_mbox_messages {
  * @flags: control flags
  */
 struct imx_dsp_rproc {
-	struct regmap				*regmap;
 	struct reset_control			*run_stall;
+	struct reset_control			*soft_rst;
+	struct reset_control			*dbg_rst;
 	struct rproc				*rproc;
 	const struct imx_dsp_rproc_dcfg		*dsp_dcfg;
 	struct clk_bulk_data			clks[DSP_RPROC_CLK_MAX];
@@ -243,20 +245,15 @@ static int imx8ulp_dsp_reset(struct imx_dsp_rproc *priv)
 	struct arm_smccc_res res;
 
 	/* Put DSP into reset and stall */
-	regmap_update_bits(priv->regmap, IMX8ULP_SIM_LPAV_REG_SYSCTRL0,
-			   IMX8ULP_SYSCTRL0_DSP_RST, IMX8ULP_SYSCTRL0_DSP_RST);
-	regmap_update_bits(priv->regmap, IMX8ULP_SIM_LPAV_REG_SYSCTRL0,
-			   IMX8ULP_SYSCTRL0_DSP_STALL,
-			   IMX8ULP_SYSCTRL0_DSP_STALL);
+	reset_control_assert(priv->soft_rst);
+	reset_control_assert(priv->run_stall);
 
 	/* Configure resources of DSP through TFA */
 	arm_smccc_smc(IMX8ULP_SIP_HIFI_XRDC, 0, 0, 0, 0, 0, 0, 0, &res);
 
 	/* Take the DSP out of reset and keep stalled for FW loading */
-	regmap_update_bits(priv->regmap, IMX8ULP_SIM_LPAV_REG_SYSCTRL0,
-			   IMX8ULP_SYSCTRL0_DSP_RST, 0);
-	regmap_update_bits(priv->regmap, IMX8ULP_SIM_LPAV_REG_SYSCTRL0,
-			   IMX8ULP_SYSCTRL0_DSP_DBG_RST, 0);
+	reset_control_deassert(priv->soft_rst);
+	reset_control_deassert(priv->dbg_rst);
 
 	return 0;
 }
@@ -338,14 +335,6 @@ static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
 	return RSC_HANDLED;
 }
 
-static int imx_dsp_rproc_mmio_start(struct rproc *rproc)
-{
-	struct imx_dsp_rproc *priv = rproc->priv;
-	const struct imx_rproc_dcfg *dcfg = priv->dsp_dcfg->dcfg;
-
-	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_start);
-}
-
 static int imx_dsp_rproc_reset_ctrl_start(struct rproc *rproc)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -391,14 +380,6 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 	return 0;
 }
 
-static int imx_dsp_rproc_mmio_stop(struct rproc *rproc)
-{
-	struct imx_dsp_rproc *priv = rproc->priv;
-	const struct imx_rproc_dcfg *dcfg = priv->dsp_dcfg->dcfg;
-
-	return regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask, dcfg->src_stop);
-}
-
 static int imx_dsp_rproc_reset_ctrl_stop(struct rproc *rproc)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -1024,23 +1005,6 @@ static int imx_dsp_attach_pm_domains(struct imx_dsp_rproc *priv)
 	return devm_pm_domain_attach_list(dev, NULL, &priv->pd_list);
 }
 
-static int imx_dsp_rproc_mmio_detect_mode(struct rproc *rproc)
-{
-	struct imx_dsp_rproc *priv = rproc->priv;
-	struct device *dev = rproc->dev.parent;
-	struct regmap *regmap;
-
-	regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,dsp-ctrl");
-	if (IS_ERR(regmap)) {
-		dev_err(dev, "failed to find syscon\n");
-		return PTR_ERR(regmap);
-	}
-
-	priv->regmap = regmap;
-
-	return 0;
-}
-
 static int imx_dsp_rproc_reset_ctrl_detect_mode(struct rproc *rproc)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -1052,6 +1016,18 @@ static int imx_dsp_rproc_reset_ctrl_detect_mode(struct rproc *rproc)
 		return PTR_ERR(priv->run_stall);
 	}
 
+	priv->soft_rst = devm_reset_control_get_optional_exclusive(dev, "softreset");
+	if (IS_ERR(priv->soft_rst)) {
+		dev_err(dev, "Failed to get DSP soft reset control\n");
+		return PTR_ERR(priv->soft_rst);
+	}
+
+	priv->dbg_rst = devm_reset_control_get_optional_exclusive(dev, "dbgreset");
+	if (IS_ERR(priv->dbg_rst)) {
+		dev_err(dev, "Failed to get DSP debug reset control\n");
+		return PTR_ERR(priv->dbg_rst);
+	}
+
 	return 0;
 }
 
@@ -1316,12 +1292,6 @@ static const struct dev_pm_ops imx_dsp_rproc_pm_ops = {
 	RUNTIME_PM_OPS(imx_dsp_runtime_suspend, imx_dsp_runtime_resume, NULL)
 };
 
-static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_mmio = {
-	.start		= imx_dsp_rproc_mmio_start,
-	.stop		= imx_dsp_rproc_mmio_stop,
-	.detect_mode	= imx_dsp_rproc_mmio_detect_mode,
-};
-
 static const struct imx_rproc_plat_ops imx_dsp_rproc_ops_reset_ctrl = {
 	.start		= imx_dsp_rproc_reset_ctrl_start,
 	.stop		= imx_dsp_rproc_reset_ctrl_stop,
@@ -1348,13 +1318,9 @@ static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8mp = {
 
 /* Specific configuration for i.MX8ULP */
 static const struct imx_rproc_dcfg dsp_rproc_cfg_imx8ulp = {
-	.src_reg	= IMX8ULP_SIM_LPAV_REG_SYSCTRL0,
-	.src_mask	= IMX8ULP_SYSCTRL0_DSP_STALL,
-	.src_start	= 0,
-	.src_stop	= IMX8ULP_SYSCTRL0_DSP_STALL,
 	.att		= imx_dsp_rproc_att_imx8ulp,
 	.att_size	= ARRAY_SIZE(imx_dsp_rproc_att_imx8ulp),
-	.ops		= &imx_dsp_rproc_ops_mmio,
+	.ops		= &imx_dsp_rproc_ops_reset_ctrl,
 };
 
 static const struct imx_dsp_rproc_dcfg imx_dsp_rproc_cfg_imx8ulp = {
-- 
2.34.1

