Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5273F23313E;
	Tue, 11 Mar 2025 08:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741683420; cv=fail; b=VFqTpLj6IJbuE8d8x3/bdreeLc1kcr1M+nOha6FfQ4BAACIWYu1q+afWgcj/6PpFSDu8ySTr+iBUgNYPGHV3vz56oIdttQJeqHOLSUNMZT0jv6i2ikvsLbBRU3uMyJ5WI5w4MDHO2aX/VdLNrdrw80g30yiV+6p1G6AmI4FiVRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741683420; c=relaxed/simple;
	bh=CXWA2QRvld9BhvBo/rR+LK89ImoGyDWDhU0XYuUJS9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XGcMyYkadfAPdPbyjH4dC7IfdTlYUqCtfge5s/GQcqH6bzJlksGTuRZQfk4VTB5njIjedwmukvyeearimOmIEfdbfwK3ZWquIyZfiU/Rdyg+bzEhHN/q2BX7FPLw6x8KcOTeyGP42N8f3Bp4wseN46pJQV3rdjhN5yi/gTiNZbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iRhR+0B7; arc=fail smtp.client-ip=40.107.20.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iRhR+0B7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSgZ4jrUZEWPmGCB339WW69ftGXeuDiBBLrX0DL97uNqXhuhG7I8mn7OQcEs26wLN/FFgKETPGx4lUJPJKF9reHSM176c5/qNfE/oPrhTwCQgFiMPfsFz+RlMuYGsaDRn5llnm29pNgECO6tnDpN+XN9IqnDL4XSJqyHKrodM7rmKGbZzOgNYGyM1F8A1js/Ixw7Om6hSNNm0bzTzDu9cvdkQ8KO4tPbq/xvTR6BNprq/sIjFFLKykt8v29DWSVxmU1FR5UMwJ9pXhhLmZsl6MsYjcwpdTLTO4W8pKP/Fwa1++98cBXEEMbHS+tS8jJNp+zQvwPcQkuS3onCC3l/Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlMvMZO/tcfYiZINsUbEej4wSm1eHa76idm2MdvMLKs=;
 b=bVdeuaa9zeNsQGRS4zIvYh240jRU8qfcko0V50vtJD6k8RwDvcKj35iOvKnxWrQTdSxcpgerawNxlfvZ1dqNIZSEg/bhu/cj7V1pBstE02RPsH7Vgt2aDH9gGUJwoeuN7X4RlVBK5uecJbvzqG1mujiIVvToc92sFLtaf8eteH/ws0fh6aMg3tpdG6w/GxGyW0JNljsKZsjz+X+lfpMN0Cmt13r/H6mb1LneUli0sSsIyDT1/nRBNj7TM7ya6+xv5wt90djYTOXNPqxjODOLb8N6uK+oxZPQtCuJuO973CYX+spV86BnkgSAy6wOMoU4mIakFkxdX+CJiC8GKJz6bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlMvMZO/tcfYiZINsUbEej4wSm1eHa76idm2MdvMLKs=;
 b=iRhR+0B7q/W88fUIMhWOvHTztC/flToratBN+98AvwFEPFW4FEWX7NkMNe9dUJsdN8JHM30UGtd+HnrPas5U8NXyf1sosRZPG+KU/UraApyvL/BV7zLDJO28YNcculZs96O3d8oh62N8W+As8P7sp5U5SPOWCjgOy9awP6pVvOE+8xuz3DotI4WqSW5rM6C5c3pHSgaSFVeuY2adWTD4t7SQoRs+0ODKTLp0xhDbIDYW7sFmJEfgEJz5tp3NLVjF1ejefEZwoG/rfFz6JyZb7BOA1NTIufl047/vFMuoMMAdY8g6VUeYnmShRgrM0KwQQmr3QYQWu5A/r7Vv3bDtDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DBAPR04MB7431.eurprd04.prod.outlook.com (2603:10a6:10:1a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 08:56:55 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 08:56:54 +0000
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
Subject: [PATCH v5 1/8] dt-bindings: reset: audiomix: Add reset ids for EARC and DSP
Date: Tue, 11 Mar 2025 10:58:04 +0200
Message-ID: <20250311085812.1296243-2-daniel.baluta@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: dab3e838-239a-4757-84fa-08dd607aabb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SMdoN819wXhN9sAytJ/xIv+y+cPcSwdMUvFSyt1rAc7Hs2OV0gCFNHz39GTB?=
 =?us-ascii?Q?VedQY6iKDqVofGhBhExXTG4X1HQAH88KhWG4rexmWz3ZLwm8bNW8l+46Gq9U?=
 =?us-ascii?Q?e5A3j4oVwPMgYUGp0tU8KXJLWUrk7xWVU53t73nNuZkT01rNt+8ti9U1YX+B?=
 =?us-ascii?Q?2F1RNCq21Ury6sR+DlZYsISoJRNzU3d2BQ1iw2QNqb2J4jVAb92Vg8w0KZQu?=
 =?us-ascii?Q?Ed3m/gulIF1DIxpBUU0rEbmbGRLj9zKb+RWYM6IAGEdSVWQWy+45086wu6sD?=
 =?us-ascii?Q?AGv3aEupN6kJx8jDzRWpIbful23E6GCKUEHmUwnhHF9jyAGbWZaZN/hbuPQ4?=
 =?us-ascii?Q?OYDXKycIwBfI0mmmtlIMaxfOo30aluDfg+goD9zWveU12zMgU1g4BOS0XGuL?=
 =?us-ascii?Q?ZfyHSqYCvSBEYxFMQqEowfJ870HFgZhPp5XEOiQeBBKKzrc0a9xRaTg+Hb9I?=
 =?us-ascii?Q?P2Cp2ueB/he6BgIC1mqAOnyGPzTPerxsQdvBhut5zpw0psy98lb2yhW05Enj?=
 =?us-ascii?Q?S1hoAV5trASiFKt/sxq9gI2wmQhEsEwUSR7SKohTtRaJvCIPpdoqYSjmtHmQ?=
 =?us-ascii?Q?WIAPc6uWyOknmxMcWna20QoaDwbKQ6sMIJsSuju3rt+DPIyYnafUZH3Snl0u?=
 =?us-ascii?Q?B1umnh2KVVT3Am1zg1v1ppDhR94rsQ2wjDVYB6GfyYZ+dUaGplTolDsmT5+A?=
 =?us-ascii?Q?XOLvpffStIR8mLN+quA7kPczkFJc9K/Nio/gk39pPyG/AS0dQpW9IZJ+L7i3?=
 =?us-ascii?Q?w7orrAz6Nd2u26P+rYMCJvZkxydaysqoBKum+BWf/yH2HXWITemrvLNbyjSs?=
 =?us-ascii?Q?ljvRNnMmtppMAaRV+TPvmtyuvHyA59K9y+iLfELFliVDoSdd90KxcO+BgWR+?=
 =?us-ascii?Q?l2MCr0rxVCacWjkW2dWg2BBlevYXMM4tc1yXm752By14vDHUOKqORsR9hrXx?=
 =?us-ascii?Q?87g0b3vnmr+adKABtwtwjK7vSwlTFSbTzQXAHlKI+XFsZs92eGrdeWZM58ZI?=
 =?us-ascii?Q?Br7pXtUYDii/BRIVZvKi2Kk500A5IFS5o7tWBNFuzIzVCui+fP/6YYctFnPu?=
 =?us-ascii?Q?UI31jwbNBxCaem876ICyi/XpFmlO+qxnIqa+rAQHuyaxYkKy5VioO49IJATx?=
 =?us-ascii?Q?X5lWAR3LbK5OOo3cZyh2Qdily+i64xM310AnmcIS9utZaooP2z5SDjWL5z64?=
 =?us-ascii?Q?12IMIodDynvWDdwVlZPBeRIUuDAc9y58XsuGFH06bOqJ4TfyPC6YpsdkRK59?=
 =?us-ascii?Q?5cMgmmZR3v6ct0J4wwr/LKPwUXUzrjc7FTCuG+7oK7vqULkO/gzOzwYcqaRt?=
 =?us-ascii?Q?iwKDMy86aae6jsTtqIzFCDLUUGe/1dV043OL4X92uaboAjV4S98s4PPE6PYA?=
 =?us-ascii?Q?GgQ118pvnOoAnEPH5txyGidSFJpYTTp0c9EiE07FX8YmJW2eEYAn4Qm5cqDt?=
 =?us-ascii?Q?6Cy5tgkida78trxa64YLY4mGLFTq4lX1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Yhr1+zrpTPIWcAUVSpaDDWl28pzqwzddMn5/YjCygoX2pmAsbeCH+LQzyTkd?=
 =?us-ascii?Q?rRVLtj9f8m+HfnqYoCYByZjVuecY6NFkQWLG2BZKiHefMtJ+IjuNhn85ldPh?=
 =?us-ascii?Q?shRs65kFIYJdMO9haWUhJb4wIKq9pV/nUa00AtKKk6b5bCBL8nCUWnDsOEdA?=
 =?us-ascii?Q?nzAKr/UK/tFdLHQenofNZyr6QMhr7+rH8CAgwDdk+OUfAqEz2XI1GPWHE4Yz?=
 =?us-ascii?Q?WYRshwHyWJyzVP353G246yc87tQ5GFWxUJzzANx/DawkbbfpwXkCVkIsNBky?=
 =?us-ascii?Q?tEY/9B2h/+MQSiZrKpyEe3kogL+uMsQ+ezAL+yi8th8AjQDu9BpybaOiKSc7?=
 =?us-ascii?Q?88yRQTUxodrYPORIOTYLJTBpYTEdfIauEu1ifnedKhRHAWSSr0bwpxbCvpOR?=
 =?us-ascii?Q?qEKJ/lB58c/1PRJabYs9pRxMnU6HyYvQhOp/nIRk8JBSdmcYohuh0CHJZi3y?=
 =?us-ascii?Q?X5YsGQsVtv7Q6/Bvl9+5TqkZFta9dHJ9glmHeJxmybSYGcPCD7BpSHe0KAhs?=
 =?us-ascii?Q?F+zu3J7u99oOYIV39mW+/M2fzFZmJbj747BHfJCeY15dIy/FJh1nJk86J0pZ?=
 =?us-ascii?Q?EqCTWuE8P1ldhuqeaN3fVJC9DJjRickARh+Ht8A/x4XBLjTLpcz4akE/sbSM?=
 =?us-ascii?Q?MSAAzDrz8RHTD51Pj9l0E9SimPzTfOzIRyjHiSKwvsOvhxNWiN3tQBpQFFjK?=
 =?us-ascii?Q?EDVc0Rg9/vdtPi2qbOOEAiWyXmbinIvjGl+KupizZ637uZvm2yY7Mpgn+P4a?=
 =?us-ascii?Q?GntYgGqYWt1NNYOOSp8E1qwg7pPBCdikTkVegFaoDBkcYndBh7Gal4dmIWwt?=
 =?us-ascii?Q?cWzead8+e3tH7xI1QK6Mqnn50a43jn8BzMajPy443i74sUOGPaS8kNRbn+Hf?=
 =?us-ascii?Q?ParHg9mv8dMpSb5ie3jwJ8v7nPzvl6K+/S5kaQ+iX3MHNMsscNUPQhvWcrqc?=
 =?us-ascii?Q?ImoKUIbCeBrY+S6RGXNGEt9ToojzG63PX/ZN99iMGfwnIlo1E7fNWgxiOPQg?=
 =?us-ascii?Q?Gn7+5mfu1zFO1k4vYz09HjDPTpX5f+6DGIHNEkkqygbkvduE+1sNGzhwGh8U?=
 =?us-ascii?Q?GdAnWNdQPsZJu8trhKWcsvfhVVwttzUGqA8LJhBkItxxX2SPL/6TT+mTKfgV?=
 =?us-ascii?Q?mRwj1Cp4eYFTlzFksbAoJ0kK01V3gLfWgoTvl9Kor2xhzRJmi+iP46TiSVMz?=
 =?us-ascii?Q?x11E+DhN7tRBjuDtzUnuRuXl8Z7O1uwvbg9NPJ392CNYxnrhSGpewCqRrRAI?=
 =?us-ascii?Q?vOP0YnTqHuyvOY754JP/j9IockqSraLz3ZD5cYNCenB7KXLGaOahNLTHOhEv?=
 =?us-ascii?Q?mayshl7hjcF3Lubs2/J8uBbPGToiKwC/RIyXHqr7S0UmkIPLZk+uM+oBk5Rl?=
 =?us-ascii?Q?VtGfT9NoXWof5BzPw1Qs67n3PHiK7QC7ab9gN/h2LQ+rK6Yl79vzStEPn5zv?=
 =?us-ascii?Q?s5nBB7Ux6/0Pr1nmd2TNym9pbEWPXey8mQI+IPB6fC5rd94AQ4qdDgpm8/ml?=
 =?us-ascii?Q?rLEZqUXlCGkuLf++MHGWlbBmQABDjKFCYVEtjtmAeMoLEwxq5aaQG85FSZqv?=
 =?us-ascii?Q?bdTH5salFKsSODei46VFLVD5dnZNN6X4aMcSIeGP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dab3e838-239a-4757-84fa-08dd607aabb9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 08:56:54.2421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUFPMMqHjEsvHUMML2wFWUkSeMQzrbPK/wYsc58vAfi48AUrLWHa/XRy8KRPgjo+i2rX4hlu4wJcaS2OtY5MMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7431

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

