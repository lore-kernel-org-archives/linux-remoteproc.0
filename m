Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011034.outbound.protection.outlook.com [52.101.70.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B807419E819;
	Mon, 27 Apr 2026 02:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777257571; cv=fail; b=QhRK0vno2t1ZJHIX8TfkqIBj2nxTeaDr4ZcX1u4DE9AZD/1r+cvhe8zzO2AeOPyFBL7MqwupyTJ4zCdWiAI0t2J7bCSSgY5BqXCM1RAmdT2ZgSq6uC+bw1I/mAckCJYgaVznGhU/QfQWz1zR5yATLRe6egJEuxJlGyRcvr9nJbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777257571; c=relaxed/simple;
	bh=eeZRinB2qCK3VZ2t0PR9kmpg6kwWqmvdq+kSGH8BelE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sU2dvQ46gyYyrdi7B8Ga8Ljlxa4QfbDjp/ClW2efXzX9sLiE0DEzhxdFhOkgbIYx278rFyCUllxqs1groywmJN6WqoCzJYoVwcbULNsjWbnGDKgHXlG0TbfNbD7mQ7bv0MROL3qNd2rRnReM1uQHsdhdUjZi82xMfZcqp+LM9oM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WfaLmbN+; arc=fail smtp.client-ip=52.101.70.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WfaLmbN+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFWSyeFBY9ORoa/rU7BVaeJhFgIoCjtN9uujI8f/E6KBwe9SGow1i67Rd1OPnztg9FWOAO0ybA+IPSoqkXjKB6Ldilt7LZ4HIqLd7VsyUjapd+ZpbYEXpur7XBMw+xBfkMn6aTQy78YiE/SVEhZXafYkz9sLqsYLOhUenmkyJElUXs80/F/lBxpI4l/RJihq0m7Hb0yIOLbze7NPAJ+oZlgtM9LEDu8sWhziFMrkdx9b/1eojX1Csw3q2S/ai2YB6gQREM03+Ke1BlSOFbdIm7THGJt/i2EaGHXut3OSbXE6b0PyiKP+8JbK342JbW3554A2tT4vnPhryYT1m6Xe7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnjBvcwsFuV3BFAI1rSLXXcOXAoeMgeZj1ryS4P/lSk=;
 b=L93/3PTfFg8Wwm4brnqS6MHaWdCrx7AvW+dAgl1+U2jyG5iEtVomXFvy9pPX1Gvd+RbyyOjGrWkzTHwMiitzL+WI0PVHq2fd0N8A7/jUmBmNYG7G2044GsjZdgnDwbBGgUq+tn09njwfWNUbr3KUxIiyxSQS+bSlKjBHlF/wF/BEXTXxXZMfcjlTEVSzvsNwyke2UWKHqoTMUTgYym1eYZVEYo7d7gJr8Su30PqTVqIu/Dv5Hbk0eF1pm2LHnajwkTZezKf0ajeKWShTuSm/1NF8RAft9yQYuBylpZeGff5NUoWY/EfpIqJGgC8D+W/j988urBUm3+dCT39TRHrBoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnjBvcwsFuV3BFAI1rSLXXcOXAoeMgeZj1ryS4P/lSk=;
 b=WfaLmbN+GFNxLKltWGt0QJalOGqKfQn98qzbQVIERw16uaOrwZLQuCllJmW3wNlh/vIN6yNn/bUWMlAWDBKhuQbh2zi7mnOBA7eOK6K7x39tu8tJObBonKbBTnxeR6MytUxjHvADh9VofCZ5LeHIRRsY7G5x/vPmGrIkryLgNU5r6Io/YZpgpefT/j96UuAU/3awbbyMhEVpMBVy3tseQh7GsFc/xLh3M8d8Ua1GMbJAl3zZworjDwHJRntrvkEDWUoW9T44beJWUVuGSyiJP9l9O9fYnYmt7Sc0DDoGQkPYTYuUFo8WZv6dX6g8xXmhmkQzIAVQgcu0LuQ1bnEVjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10793.eurprd04.prod.outlook.com (2603:10a6:102:485::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 02:39:27 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%4]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 02:39:27 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 27 Apr 2026 10:41:26 +0800
Subject: [PATCH v4 3/3] remoteproc: imx_rproc: Add support for i.MX94
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-imx943-rproc-v4-3-68d7c7253acd@nxp.com>
References: <20260427-imx943-rproc-v4-0-68d7c7253acd@nxp.com>
In-Reply-To: <20260427-imx943-rproc-v4-0-68d7c7253acd@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MAXP287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::23) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10793:EE_
X-MS-Office365-Filtering-Correlation-Id: f2960680-27ab-4b32-3cc2-08dea4063320
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|52116014|376014|366016|1800799024|921020|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	/uXAxS1HykqpcRFGHBUqSsXvJQlCc6QActAtI6VQmigW/T+9RDnjYbTU1nIiRlkvRrs2fiN6aG0dTPeFJReSQR+Jz8LJ4yZDBz0H0/S4mMucyf5KkVe8P2jk+jpLtDlbIDnK67u2O4cj3JWNaMAnLUzu1U/809+8Hm061hF97F/vwtv8zl1i9TKpY9v55At/yOVsqYARzdUmD7gKPXdaHG1b7+4M7I9hSgFG6bA960kwEabpGFoiL3qGKSZWkoTft+U3s4wN9HYU+FZyVoEiQgdnVUO3ZEBCRjP/qF3BFCD00Y/2wJ624qrcS0QWC/PoVmYYIL7LHpBCeUzR9ZBryl8hN8QG/Vb26rDnXfY3mTOM5SbzFZW04JXvANDvqf4uHBzm+7qx4/AD6v+vw+gMhcFxC+3ofa5fmflXAn/YhNI2lP3PRN8peJ3aSeV2n3/gwLtQPssjm1jwvBdzQfoPoJp0S0ybryYhbfSvjWACaDmTBwmgjm2vKkyVCBLwhYea5DHV9CIj5vQ8ZrskI4dUdybeZb70hTL732ojOsWVKZgmEqrZjfSK3Ig5UNofhuevL5pxH3tFwf6TuKuN9cM8boR8Z/64tE22uTLcILngBY2B20+py6HsvJ+WAjHV9Y7xyoMUhjWx6wUHrr+KFHlIIAyJwo5tWemIobkLwV6wVUDSEDWFXAUQkk9NxsxBB8YWCwzrKbwVEPsRM9MrhxlKI6VmpfwESH2EngMAKOp8L10WYG/P0tO+VPCsS+vErAZa+GbZ43x+0megRFo4KEdzuiznc879gE5tTxHqwmLXRLg2iLfBYdmYf23ydekL4zak
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(366016)(1800799024)(921020)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NU51TkRRNFVTUjBlWkdTL1hVVDdvR1BMbVM0dmtyN0FjbVhSVXFTckdhNW5p?=
 =?utf-8?B?S3Voai9GNlpaLzZzb2FNNXk4VVRZL1VHNWc4d2lRRWxQakIxdGU2RGoxS3dF?=
 =?utf-8?B?VlhibjVFQUpiK0pRODVOUG03QTZZZUhkRkhCRVRCNjFaeDBieHE3bExVOVRz?=
 =?utf-8?B?bWFWUmRPRHhwMlhVRDlBMGV2d3YrYXdNYlh6U2lkaWVFNmhpUGJtTENmbXJr?=
 =?utf-8?B?eDNyZmVvbDMwWC9qMDhCUnltcVUvQTBiSzlhS0h2aWpodzhIM29XQjlQMVQ1?=
 =?utf-8?B?QjlIcFo1dUZNQ1UxWDY4VDVMS3praTBwaUlkNks1cGdOdkxuNXZGNXdWaU1w?=
 =?utf-8?B?MHF3WDNGd0R6MWRuSGdRR1dmYjZSRjBFOG9kSjVwRzBYQmZhMUt0Zk5ZTlE3?=
 =?utf-8?B?MFJoUWpSZTg3K25sZ3VFOXZ2YWxlWUU2Y1JYejBCc0pWQnA3elpscW9oNUpm?=
 =?utf-8?B?ekdsbGxXQXVLNkthTFA2NEVXSFZEbjdCLzBVd1Bja1pnUEc5eE55a1Z3SU94?=
 =?utf-8?B?c2t4ZTRWblpzNURQM011WXRQSm8xZUZVV0JLSGNNUE16d0dvblozbStESVVw?=
 =?utf-8?B?SE1keS9uQ2ZIZDFSd09lbktLSXR0bHVDT3IxeGQ1aXJweStrVnF2V1hOZzUw?=
 =?utf-8?B?d1Erb3gxU0tidEd0dVZXNS9BT1Fnc0FJS1NmMGIyTmZuaElLZG1iUEovNUdl?=
 =?utf-8?B?ekdIazA4YmFTa0d0cTgzekFBSFFmam1ReEZyeFd6UWVhZitNcEVqSFZHRDU0?=
 =?utf-8?B?Y2hSdUhKZzlJR0hOaGx5NEh3QVBVTXBOcisrNHNhbnFhdk41VnJ3N2ZYYTVz?=
 =?utf-8?B?MUJTUldoK20ydlo2Q2tXdVlqTVNsSXpYVmV2elhJOVFQK2tMd3BSSWU0Mi9k?=
 =?utf-8?B?cFdvWUxuMWlOU2JoaXVWbGpzaHBMNnBOSnFjVFFZUE1GZmN4MmgxbTMyRWk5?=
 =?utf-8?B?cWhQRURwdE9MMVU3MEROb2hhQmRSTWxZNlhWZ1kwa2trL0RwMDhzcjVQREYw?=
 =?utf-8?B?UnNXZ2pCY2d0UXU0aGJNVzlFd0U0cTFEdXdWZFpzL2lPc2VGSE1oZlIvMmtD?=
 =?utf-8?B?MDJzaTMyQWNTcFo3d1g3YVphRnpuVEZ4OEhEdHN5NXBCMVdNbW9Uc3ZhdlM5?=
 =?utf-8?B?RnpOcG1ZOXZjNUlnZXVVZjNrVjgxYlpYNkplRThCeFR5a0xoejNJWTlZbEJy?=
 =?utf-8?B?bUVUdXBRNitmTk5rRG5rL2M0T1lmVGs0c0J5aXBYb1prRDhyQTF5bmZZeUN6?=
 =?utf-8?B?ejdwTTFXNGk0NS9XMWVxblpCU0NSdTQ4S1hxZ1hFcnBBcFd1UnU3S3dZQk5l?=
 =?utf-8?B?NjluMmVnMHR2ZzhMWnhSaHlYSklCQ2dPVkoyWVAwQ1BNa3g5bjVTaHZ4R1lT?=
 =?utf-8?B?aU9EbGdMZ1pHKzV0T01wTGJ0eHo1cGtHQU11ZHQyRmwzbHppS2NsZVNOT2dN?=
 =?utf-8?B?by9FQ3VETWx0MXdxaVo2MVFFQVQ2elFudDZ0WW81L2dORW1TbGJXa1dzTWxM?=
 =?utf-8?B?bi9GYlZIakVWMkdHRFNhdzRPaDFSNjZXNEZ0TFZBTllUTmxNdWt0aDQ0NlZC?=
 =?utf-8?B?R0daV1pRT3ErY2w4dVJCMTkwUGMxR0NmVmsrUS9OeThJLzNpNW83Z0cyaTFn?=
 =?utf-8?B?RmZTL2swcGNTa3o4RW1kRHdlWWlTcUxmb29sMU5uSUJBVFJYWjVMa3pwSSt3?=
 =?utf-8?B?dVBVbmIwOTN5T1c3MGgzU1FVT0JSSGJWcXA5MXBkRnpRM0U4bi9ORi85akRz?=
 =?utf-8?B?QkduKzFGWVNvdUUyQ01KTjFiRWN3dGZWWEFKM1hpZXJQWjhkWDlSTDhuQW8x?=
 =?utf-8?B?VS9KK0VkWXFmMUNxNFp4em14RWR4RXo5aS95MHhiT004b1k5L3k5bElzZkpy?=
 =?utf-8?B?blpEaDhGaWozQWx2ZWdCN3ZQcVBqeFNwMWgrQjY0MHhRMjhLOWRHcE52MU81?=
 =?utf-8?B?R2RNaDNGYThUdTVNR2xlTzJ0NFg3UXJqNCsvWC91a3FselJzQ2xXL3ordzFE?=
 =?utf-8?B?K1YrUUJWM1Zpb1cyNUhITDJabTlEcWllNWJEaC9QYks5UmhmcmhMRDlxdFps?=
 =?utf-8?B?V210MGxmN0hrelpBSXZrZlJVRit2aTRsOW0vdHo1VkgwUzVpVzE3UGQ0QkF6?=
 =?utf-8?B?Zk5xOGJIQThTNE1FQk5KRURjZU10YUw5T0RkZ29IS096RTRsUTQ4MGpmVXgx?=
 =?utf-8?B?T1l3SFdIZ2VIRDIzTXNDMGRLTEE3aW5DMDRyMFNCQllpN3U1ZW9SNDBRVkNM?=
 =?utf-8?B?bzI2dU8rYTF5Qm5xMHdZUFZxbTJUUC91S2tSMTc1OXNtUXJGM3dZbzRjTzBp?=
 =?utf-8?B?ZktuYmROL3JGejlwZVREbWwvajlTWHJ1RTBvbUhHR2FlckNSOVhWdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2960680-27ab-4b32-3cc2-08dea4063320
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 02:39:26.9623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oa158nC2epd9VoZLprFM+o1y2HvTOvxRn6tl1/e5zzs/KN+c4DoKl/aafp1KQFCC6t7hQRQ7IMaOXvCitifLAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10793

From: Peng Fan <peng.fan@nxp.com>

Add basic remoteproc support for the i.MX94 M-core processors, including
address translation tables(dev addr is from view of remote processor,
sys addr is from view of main processor) and device configuration data for
the CM70, CM71, and CM33S cores.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 65 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index c21782be4bb69d830479f538a091bda48b740ca4..7f54322244acacb32d8fe17f5e62b6aba21b3084 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -145,6 +145,41 @@ static const struct imx_rproc_att imx_rproc_att_imx95_m7[] = {
 	{ 0x80000000, 0x80000000, 0x50000000, 0 },
 };
 
+static const struct imx_rproc_att imx_rproc_att_imx94_m70[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* TCM CODE NON-SECURE */
+	{ 0x00000000, 0x203C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
+	/* TCM SYS NON-SECURE*/
+	{ 0x20000000, 0x20400000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* DDR */
+	{ 0x80000000, 0x80000000, 0x10000000, 0 },
+};
+
+static const struct imx_rproc_att imx_rproc_att_imx94_m71[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* TCM CODE NON-SECURE */
+	{ 0x00000000, 0x202C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
+	/* TCM SYS NON-SECURE*/
+	{ 0x20000000, 0x20300000, 0x00040000, ATT_OWN | ATT_IOMEM },
+
+	/* DDR */
+	{ 0x80000000, 0x80000000, 0x10000000, 0 },
+};
+
+static const struct imx_rproc_att imx_rproc_att_imx94_m33s[] = {
+	/* dev addr , sys addr  , size	    , flags */
+	/* TCM CODE NON-SECURE */
+	{ 0x0FFC0000, 0x209C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
+	/* TCM SYS NON-SECURE */
+	{ 0x20000000, 0x20A00000, 0x00040000, ATT_OWN | ATT_IOMEM },
+	/* M33S OCRAM NON-SECURE */
+	{ 0x20800000, 0x20800000, 0x180000, ATT_OWN | ATT_IOMEM },
+
+	/* DDR */
+	{ 0x80000000, 0x80000000, 0x10000000, 0 },
+};
+
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	/* TCM CODE NON-SECURE */
@@ -1477,6 +1512,33 @@ static const struct imx_rproc_dcfg imx_rproc_cfg_imx93 = {
 	.flags		= IMX_RPROC_NEED_CLKS,
 };
 
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx94_m70 = {
+	.att		= imx_rproc_att_imx94_m70,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx94_m70),
+	.ops		= &imx_rproc_ops_sm_lmm,
+	.cpuid		= 1,
+	.lmid		= 2,
+	.reset_vector_mask = GENMASK_U32(31, 16),
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx94_m71 = {
+	.att		= imx_rproc_att_imx94_m71,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx94_m71),
+	.ops		= &imx_rproc_ops_sm_lmm,
+	.cpuid		= 7,
+	.lmid		= 3,
+	.reset_vector_mask = GENMASK_U32(31, 16),
+};
+
+static const struct imx_rproc_dcfg imx_rproc_cfg_imx94_m33s = {
+	.att		= imx_rproc_att_imx94_m33s,
+	.att_size	= ARRAY_SIZE(imx_rproc_att_imx94_m33s),
+	.ops		= &imx_rproc_ops_sm_lmm,
+	.cpuid		= 8,
+	.lmid		= 1,
+	.reset_vector_mask = GENMASK_U32(31, 16),
+};
+
 static const struct imx_rproc_dcfg imx_rproc_cfg_imx95_m7 = {
 	.att		= imx_rproc_att_imx95_m7,
 	.att_size	= ARRAY_SIZE(imx_rproc_att_imx95_m7),
@@ -1501,6 +1563,9 @@ static const struct of_device_id imx_rproc_of_match[] = {
 	{ .compatible = "fsl,imx8qm-cm4", .data = &imx_rproc_cfg_imx8qm },
 	{ .compatible = "fsl,imx8ulp-cm33", .data = &imx_rproc_cfg_imx8ulp },
 	{ .compatible = "fsl,imx93-cm33", .data = &imx_rproc_cfg_imx93 },
+	{ .compatible = "fsl,imx94-cm70", .data = &imx_rproc_cfg_imx94_m70 },
+	{ .compatible = "fsl,imx94-cm71", .data = &imx_rproc_cfg_imx94_m71 },
+	{ .compatible = "fsl,imx94-cm33s", .data = &imx_rproc_cfg_imx94_m33s },
 	{ .compatible = "fsl,imx95-cm7", .data = &imx_rproc_cfg_imx95_m7 },
 	{},
 };

-- 
2.37.1

