Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE47205ACE;
	Wed,  5 Mar 2025 10:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741168868; cv=fail; b=fTqI2xY939vIb2f+glZTpjokAxUSjKZmL/gCffeDNFr++M1y8okDvWrM2JnO6fv/kUPkd7uhqe2LzA0mt1wYSjzCXrxXtV/97zJnd3+ga4CFz0jnX9By8mgdS3apfJFa09MzIoeG79IcWMXgPuRYePRZkuFjcGDDEq/T/Wrtluw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741168868; c=relaxed/simple;
	bh=CXWA2QRvld9BhvBo/rR+LK89ImoGyDWDhU0XYuUJS9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KgBH1gelJD0HbyJH698BImRNuDXfKnIif3XCCojuWZjIQPXeJUnxqogc355k2JOff2BwjwBIhtd7+hAcNRGzfLZo0qiOA8Ltu0GRAxlHIiaz7INQFVZOE0GyYMYAosdYqocD7Xjij0c1YOSvcudmu5DE8VtIRUwgJiX9J1HtzqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jxZ8Mcl8; arc=fail smtp.client-ip=40.107.20.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jxZ8Mcl8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rQgNquf1ho2TuwvFJWWn7pwSDMjzJX8w4hVhMUiw1k53apMi9ENuY1VUpPCteiuxsjPNEZleQAd0wdCcAH+hTAbdf/yWJsPV+RgYUSqTtR0idWgr4CBlC+w8aZM1vh50oqfQ67pkRt4ZCgo9Ioy8JLbTO9mirUATqz/YqCH+10umCrwtbaTA7/7Wwk1lbqia8M8uDDKInsPXAN+PsGWkZk4mZl4ETvKgPZVB96ODBWDlsudPt2DivV2o5ZKd/qVTi6MSpHxl6tpvSBKPcApxJkYYDDQeB0xeZzj5i9xhf5DbqA8X7EdLqvr1DeOgZ2eZFWuxR1yOdmFPz0YIWS9Zeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlMvMZO/tcfYiZINsUbEej4wSm1eHa76idm2MdvMLKs=;
 b=yAd61Y80Fa/SmiUs1ga/uhsT4jLHStHA69j3N/CX15CKxtPdtlW8oTBdoYFV2ZEANilpsRXKwvOQXd8oDcCpj7NVoJuAjiqFOQk1qLNUUi3dqM89RPJm2fjrEfJeHNyE8fQBQD3lCPxwOF2qe/WqShMBZLgHyd6VWUequ8iaH+ahlmPY4qMZkQ2MC7mHI+uV7d5LAuRGCOkx4uJA1+5ob8HmrfcHHi8sY27Cc601BbwPx4MQro0j6RO+5wtz4AidRXoM4KVHjPgDrAfRFmYlOGvEQ8oNRimcrjVkMmmDT5fnJ3YrIaAXOOtyglbSvq42EjAzo3wRUTlg7UZg4PJdKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlMvMZO/tcfYiZINsUbEej4wSm1eHa76idm2MdvMLKs=;
 b=jxZ8Mcl8R50CJdn4XqSYHKb1/NtHx22sDQZMjcyTgFD9FIfwf7QPg+6fxHGMz37ngq9T55XDd83/Ly9wlgL86yz1/JYh00iJ+m9LmAQ0yc4sewIIeWF1EMIt0k1WjCQvtwiAT/CcqueZ17Ql3cLGJKZg1gPZeen7KVOdfRfBSGyK/NqrvuV6ffw2Rvn6Bb68rnQMlAPlzFV7dP84Ssq0a/BGEGP3kAk088n232KLoIhunkwBaVCAzPHzw78DIZuXAbRH4cL+m/Fz7LG2AhBWS4pB11gTiNJ0lfzpm1fWV4oPr/w01z/3NbMyY5/E73SbAemOVrar0tq9OQeIR7QwfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VI0PR04MB10541.eurprd04.prod.outlook.com (2603:10a6:800:26a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Wed, 5 Mar
 2025 10:01:00 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 10:01:00 +0000
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
Subject: [PATCH v4 1/8] dt-bindings: reset: audiomix: Add reset ids for EARC and DSP
Date: Wed,  5 Mar 2025 12:00:29 +0200
Message-ID: <20250305100037.373782-2-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305100037.373782-1-daniel.baluta@nxp.com>
References: <20250305100037.373782-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0031.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::12) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|VI0PR04MB10541:EE_
X-MS-Office365-Filtering-Correlation-Id: 5632f8c5-cdba-4d9c-54a4-08dd5bcca203
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uq4AB8VY9mvzUieDh3BByG2HJf3Ku1nNCkNQunJC52CNDeNqfF7Zb50cp+np?=
 =?us-ascii?Q?eHxmE9OAS1fcRxjc0I45hpqYkOC+jUS7JeaUz6AriZ1MsGurCYQLKtrQzTIp?=
 =?us-ascii?Q?ZU7UzEOA1HcsyhnpFyIJPeou6r29lqmxQzr4lyctjL3/vXk2Q+1VVMq/E6Hq?=
 =?us-ascii?Q?Rs1LoRQRdwP0I7Fo8/ekONKnWIpE8LyKes1mAtGjsqgQshs7TgKj+jfIU66O?=
 =?us-ascii?Q?GQcKqfOcv0XVbqX8nAULaltKnrw80Q4FIH9ECvf5PgFFY1qBfLaZti1J/pMC?=
 =?us-ascii?Q?MkGQlElHwFdkcxugT7PDMII5qJDVWhw6YA1UjyWQrtMCw87k86DYzerCvF7P?=
 =?us-ascii?Q?R+nW4aRikT2tkvz08qbtm4MtMvD036YhyO7J54EXvBU6pupmU2UIqDCOdQVt?=
 =?us-ascii?Q?uheLSTd7SzrESkyavHKUViHMgGaiCNNDyFF5sMLgL+bBJ7omjNadiDGr2gLt?=
 =?us-ascii?Q?HNidyf4DMeWKSBE8UHsCt0sndKuwbsHrMVpZs6+u0X/Fkh2BHgxwSsVwL1C1?=
 =?us-ascii?Q?iUFbtFFCRgswdi5Bv18yfc1r2brAttCptBU/Ckyu8ffUpT7GwP/pOO/XslJO?=
 =?us-ascii?Q?sL5XJrkvpQjdu9KFOhuSJ7Kj/NhdQbrxEhhyIyP6hf8pyGvvI/7YrMKpdCIc?=
 =?us-ascii?Q?BFIStR6MBEaE114AbkSaCfVRn/WhhqBg2Uo4GNXUklqM7jlfgSn336ucvo4H?=
 =?us-ascii?Q?ZrqTZUxb0NwtGFBIjQ5qEgVKkIILE8xvemTVvsp3Kkz/1L9lxhu8WpzZNhqm?=
 =?us-ascii?Q?GXOqTd1s3s4SjVIWclC7RjLiws4b1qzkfY8PVjwouTp0QzoxSRlyBUFHfoGs?=
 =?us-ascii?Q?05U36lAx6/+/W5CkJh+RWU89366aPxeibH2OQ2zPjcGaaXM/tY7ydADSaXi9?=
 =?us-ascii?Q?Ht3CFGJIcYQtGemgzPegBTu0oSCQeJdjhgrtYyHZe8RPSSCIyF71SOfMo6lK?=
 =?us-ascii?Q?cLifp2gu36TKpBa0GCn8hoNqE18mdHZEdbkMHtaVwtbV+HGpKXRR6QtG0erp?=
 =?us-ascii?Q?8YeywqSt/NKmmgxPwp7HLDfjGNUwAo7xRrJtwXLkE/aDI7HvWVWWzo60LAiG?=
 =?us-ascii?Q?MFvJnyj3nb2uGk6kQQHHcT6uotei2fDshs4lZY7uQxwqgNLLy3OCdjYgyHpH?=
 =?us-ascii?Q?YkK9CwyvTwKNneeBWK8u1InognQVdTWK0Zum6kXq0fusdxZ86t20E+IT0aPe?=
 =?us-ascii?Q?MSFSlYk8UQfVYrvGW9l+Tj+SZ1TIF7DZl9clyESyhcqvaEASUpW+SjYijV4I?=
 =?us-ascii?Q?9PM6Gh2DJwJ6J2rgIfgiN1vKWLIzghaZDPZZOHi5XSNtkE2HjK2au34bJrDi?=
 =?us-ascii?Q?EP3JPnUl+r08InAUGmPCZ7Vm+QDtPA8sW2OzPj3zsViFiT7YCym1fZZYKWid?=
 =?us-ascii?Q?7aw6k1whI5cFAJjarjQiO+WEg/ZVP6MtFFoVkS+BKkGlNeb7JCn+n93J4XV1?=
 =?us-ascii?Q?LfwAGPs0YDL7Xt6LO7HSIIaIAOe1CljU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wrMu2eJN8mGZjXMTqxOUJN9SkgUR12m5SHIRZnf/dDP9K4ddYvDxcv2lPwFF?=
 =?us-ascii?Q?O8vbsBmfAkZ3yVhfVwj49LQO89t/g5gfTBJqFhhxW5/0pAGOIAhprJT5/SK2?=
 =?us-ascii?Q?eGGMBvAV26eOnUes6uNVufOdaRa8DTUB+Fi3Vr9gj7cxAR1eaCG3amCfuWmk?=
 =?us-ascii?Q?q5Ns9noREImFcYT6nNx1xS2RknCfEACz4987GEzE+irH2zd8NwUI5UYb5wkL?=
 =?us-ascii?Q?cyHjRuTqXoh17+zh7CHBoRWyySVi/w3tityfxndayu2nrinAx+sEHKeBZGsE?=
 =?us-ascii?Q?VRglfYhGmgNYguSiD6wEZzfxYfgJToEGWh0mdoi7SMluovOMU+gpJK2ImK/L?=
 =?us-ascii?Q?xtGRM8bZK83Ir5XAYF+BFF0+ZEENuYiJDJJKY+2vY1X8dXE5oYnHWC64v2NT?=
 =?us-ascii?Q?P5C3Ki1yc2GgIVI69/MNRiVLQG2b9NJPk4/eXSzbzuS1HMS7NLaz+tJXKCAY?=
 =?us-ascii?Q?9RiTg6VNizmT/hMp+z+o1o6xMlkqUtmBtFtNpHL7U8McFVjJN2c4BkwMaeRN?=
 =?us-ascii?Q?kGjvJigHhSbsnO+wxBdTtAvzZMrFT0kKNN4rJppN3dYB6uo2KLHssSmyGDsB?=
 =?us-ascii?Q?Z7L7OHPmKisW8hrM/XFOQUw7YRHbUQGuAF3Efzcx0kmU5UQloj3m+fKLzXhD?=
 =?us-ascii?Q?qpWNd8Y5TVpU7hdqtIN0hiNwYJTi7Cts1TPR0u3xZhQxYKkW+pTd8Cn1xwny?=
 =?us-ascii?Q?5K4QTSahHv36ik7c63pE/Eggt8SPSApUcf+abJE5Eqw3k0vKoZFOaZ16Am1+?=
 =?us-ascii?Q?v9iYFEi2W/Ltqg0+xSW47myayWVFi6R7VmB1VDfjGVORALuLzRAMARd3WMkX?=
 =?us-ascii?Q?ozUo2x0oCgpPUfuA9T34/ni92OBKU3L9aissHJ3xa5OA9jKhHw6oUWhgaGgS?=
 =?us-ascii?Q?1bkustdQ9DSpdnivnic3Lzayc5fmh4P6BY6YmGhLn5Ib2idlxBxONnZLv692?=
 =?us-ascii?Q?IQgHnvAcR+ai1wX08JCI5YiPGyDpnY4kEIJfTnaHAbDG9Md8z8Nid/5jJI/0?=
 =?us-ascii?Q?1GzpjRFdC6XxOHDmfpT1tTLtVfm3RW9oR5UElbI9fuDcUGxtYX3LdCVtEsqg?=
 =?us-ascii?Q?zhajhkKOqMNKRX/L9EaRxfYnb68F1B13k+ZY8V9U5r6i6aHlCTrN9RZnIMBx?=
 =?us-ascii?Q?/blEU5/My+WAZy1Osd3iMaXGqpQ0oyrnzPlKgKiugrea+ASaa+c2x5bZg2FA?=
 =?us-ascii?Q?WWm2A8c6Mi9Y8C+Kbyztho6kx3cl4k9085i5d+XCKKl+m5MIsW6kehgG3aWE?=
 =?us-ascii?Q?2AVy08OddF9R04qnNMd2Uv5QWfB1yYtlDQA93pbMCyN608Vey+5o1SGsdYnq?=
 =?us-ascii?Q?CyhQ8JbbtO0BaV2gwDKOAq9rq4dl6xO+uz7b50mOdVsPoW7FaKzLq2op+l8O?=
 =?us-ascii?Q?3ul1iIthUH9vnpn1AJ5mglXnRT1hEXkfzVfeC2cu5z/AjRHMcjhDxs0xZp3c?=
 =?us-ascii?Q?5XwAPFAj6MPRh2shN2fvEosSTQvfHbiNDpJDazxoyfw+ufG4sM4FVShZ+tEu?=
 =?us-ascii?Q?e5WE4tq1W30TCcOzbA0/+wKeMjLo+gyImWwThHySJqYQvC7IRgHxPXQcIgxe?=
 =?us-ascii?Q?cN95vm2ZsktvNILDKKOrUbVTXhDyHCAT2ch3QA/S?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5632f8c5-cdba-4d9c-54a4-08dd5bcca203
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 10:01:00.8249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1rqJdx/3G3pZt4LJD11n3aMhY6e5kDVrTyT8aphEg/jG4OW0ME5m0ddYwJTRJNYtkmWDWFO2UPnEUzqNhGux5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10541

Add reset ids used for EARC and DSP on i.MX8MP platform.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 include/dt-bindings/reset/imx8mp-reset-audiomix.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 include/dt-bindings/reset/imx8mp-reset-audiomix.h

diff --git a/include/dt-bindings/reset/imx8mp-reset-audiomix.h b/include/dt-bindings/reset/imx8mp-reset-audiomix.h
new file mode 100644
index 000000000000..746c1337ed99
--- /dev/null
+++ b/include/dt-bindings/reset/imx8mp-reset-audiomix.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef DT_BINDING_RESET_IMX8MP_AUDIOMIX_H
+#define DT_BINDING_RESET_IMX8MP_AUDIOMIX_H
+
+#define IMX8MP_AUDIOMIX_EARC_RESET	0
+#define IMX8MP_AUDIOMIX_EARC_PHY_RESET	1
+#define IMX8MP_AUDIOMIX_DSP_RUNSTALL	2
+
+#endif /* DT_BINDING_RESET_IMX8MP_AUDIOMIX_H */
-- 
2.43.0

