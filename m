Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2069.outbound.protection.outlook.com [40.107.21.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B91245014;
	Wed,  5 Mar 2025 12:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741178408; cv=fail; b=Gzu0OkOiSHIj/8GNl8SgKHaDwgYoQ1FwtIszS5flx4m1Hn4648CluVY2LvWHZZteUYlqMfeIotkBeuYHNs7+7q0gRrg3R6mmKLhS2me3YSr4Hpi16CVHQIDtRJsVV2gri3yBmJGo5skRKIkIhupKo3tw1fKob/wMMlEK1zKRzW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741178408; c=relaxed/simple;
	bh=Il1Oyw0GUJ673pa7xy/5OMx4t17MsQhzKQ9qKUjckC0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=bnvnO35fx9zqVqMUEO9i3ra16SrH0IB9w6sOwPjlf9G5tI2WkJwKAdeKUbldrf99baE4+PBkfmjH02ZyM5YLBVrQJPd4Q1oHIENBiYURx3m17P4nYirTWLaqKRkF0pxxPdPmmMYYdEcW7UnLupX6ryio1eXpLhoO/za7sMHhcNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BxAqMfHg; arc=fail smtp.client-ip=40.107.21.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BxAqMfHg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vUWtMbLqQlRqgCIxMo17Z0eA6t++QaFp++sFI4HpoFJ8Dr/XyXXiqRR6z280aobcc59NmeH6WX4MMUK3QKVPus5gzr4EMjcKD/G3dmK5qLIT+Zkqtvs/5qOhXYkV29IvgMsuKqY4ZOhlBZghiKvym4AUs/MGLaz3ZjkT9QTsORSl4V48wPD053d5ewcrXGcZKvy/Z9Q6JiEQj2Q6xOmCDPjlcnxuusBDVZ4k+p1rnxxwOS0XPU2caNjkKORT/SWp9e9tM0mlkzvborzN7g3eCrkgxTg9H9ilt3pOOI6zSAFfxNEKmK+Hpw2VuGZW33ZoY5Ewwdvmm3hLNA99cFrgDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8VAjib+6A103TMmVmC8d30dlP5ysyD2y/eNhRaWlg4=;
 b=sp5uNcYwL9m17T5zBPL9H49LWEtNYzFDQRTnbRza5ADWu0Gzc6pBRSdn41KBAeF+s0hhATaCS9TzUK2SNStyRaaDKlF6Ve92YSfjb6tWTu3t6atX21DdkjqL8QYsuVKWx92GG73fWzMwftJXqPXXNnqnt1dcF6mXn7AnEkeMWjCJtTp12zg1P+V5+5izZh1OfGxOscsEjwdvHtcIKV37VYN/+J+syRzuSVd9hKcjNVrn1x85JB9DsBKsiUVpFdcQgb3VMiyJHXA3WTXyP0B+HgkaocyMm8iqYfoZ7z1gZW8D1t4zt/ff56BKJUNKHFot+JvviQmY/4/nSne0hoZkoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8VAjib+6A103TMmVmC8d30dlP5ysyD2y/eNhRaWlg4=;
 b=BxAqMfHgfh+cxtWQWuzIqBzVF0GtgdONB1eE34XbplLuIQsIaD6xlR3dW26YlknzZWATDk5wmSBPKozE9+Qr1DvwSzqbvJu0px9U8Qlf1esYyh1m9psaeXvLXpBG+paUOwPcBPBNR0YIfkLtHpqOpzXNtN+5VztJ7z2lYBXDUN5ZE77+jbGGM9HJV2a2MNRGMStqQJX51Wlb2jY/3SMg5R+ssA2wT4hOWVsKM/QrnlXqftZrmT90acp5WcSz4Q4LTFActvitGTCnj3tjZzrrMYC2g7KvglT8PjHpRF4QjzTEkcyL+UjZTUT/d6VyDC/NrBkGC42ukI+4zU0jiHCy5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by PA2PR04MB10513.eurprd04.prod.outlook.com (2603:10a6:102:416::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Wed, 5 Mar
 2025 12:39:59 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1%7]) with mapi id 15.20.8489.025; Wed, 5 Mar 2025
 12:39:59 +0000
From: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"S.J. Wang" <shengjiu.wang@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mpuaudiosw <Mpuaudiosw@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: imx@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH] remoteproc: imx_dsp_rproc: conditionally wait for FW_READY
Date: Wed,  5 Mar 2025 14:39:23 +0200
Message-Id: <20250305123923.514386-1-iuliana.prodan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0124.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::21) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8774:EE_|PA2PR04MB10513:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a3fda0e-4ab0-4be7-9a66-08dd5be2d798
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f1nbFPs1i3xsqr/eAMgaMfugyGQc/x1Fy+NFO9V5w25v3LVqohy6acX4hEBa?=
 =?us-ascii?Q?w4ytecpPIzF8pAZvK+9paV4BSeRqKX5DZ04MeEA3Xvv7zTldXh32RFVe6xto?=
 =?us-ascii?Q?8DVMGwodvqfz3rj30Pekx9myKDXQUBGpshp6c5nAfag7P5VxM4+yq1BSe8wi?=
 =?us-ascii?Q?WMsyrVszKVPdsW0HMrcOe/Lfki61exkN8dUabINNw6cGBldWsAMgmEvmsEYH?=
 =?us-ascii?Q?lLfceWYtTE1ZUOxGNg9GwcXUJ+IwA7Zg/Jn2UofT4ToDYuclPL3OS8aUgNW8?=
 =?us-ascii?Q?RlKO3463uhvasVBORtGikb1ezTcTr9GBVl4+mtitICAcKgS0gpkkLwLn4Zon?=
 =?us-ascii?Q?rcMMJbLWs3XJrkqAQy12baCd3bG9KJr0/MdRnmeJCi34LglQq2NTQjhnrXTK?=
 =?us-ascii?Q?VxHZjSqbx6HEfcU2igQhk0XNGm8uV5bDywbp1CEbJg0EWefRsoxrxjd2Uq6Q?=
 =?us-ascii?Q?yozdpP3rZEsrKyP9vceC26MZ4izHmEK9nosqrNXQPvk1/3ThzOxsW5ouD862?=
 =?us-ascii?Q?wi9YXyXvlmGC/XJy6jpxgsWiYbXTe7o1mBpm85huKLDLs1C2/gqCl8B2UGkv?=
 =?us-ascii?Q?4Kkxt0OxHndsWRrSPHf7iXWJji61GghTgWsE52eV24BwpUvtC2X1DlrM2RVZ?=
 =?us-ascii?Q?6zGQUDiMXmeoWl3RXwjSyYYSuqN33/iX6z55RpKvXaH+p2EQnFUUlr5GzG95?=
 =?us-ascii?Q?ulkGnkjVjbLAwn9UTH163976KKcbHC/umcLNQxhHAfFWlci0QHK8RibHRKKj?=
 =?us-ascii?Q?FLSoGsiRkKyM+Tr6PV6hv3Pp/ZJ9ZhtLCMcAoB8e2OV6k9aKliYLxhgdFO0o?=
 =?us-ascii?Q?IW3yXfcpPAcKNGxEiEm/qyiEkAREOK471VS/6udminRTqCs5IyqDph6sOC2A?=
 =?us-ascii?Q?JCRYazQKAXzyb07cE31ByuYfsAa302i+vEs2LrMx/yPZFGX4s3wZXImRhsvS?=
 =?us-ascii?Q?pvpcrigI1q06msICIrNkk0cvtF/gQkthCzZmR/qqEmgMlLBVRRcLwQgQiVw0?=
 =?us-ascii?Q?z9vVq3wZfR9eFjh9X/f7AbJ9BPkLTNuqn8lFYltopm82V3jGlPJnP7w+rz+G?=
 =?us-ascii?Q?JA22g+EcVmZ+gcIioCe+yUQh3ZpikRohBWq5iwan1XL+6ANgao4bEbsfUTB6?=
 =?us-ascii?Q?EtrB0rBZcP9oNponwPRXDmys0bhgfTQN3af1MiZ1O07x2z1ogEGdDk46aU+v?=
 =?us-ascii?Q?jd3M8oDO1QshkMLRZKpSLqGWh8mo/qGqflglzmDRJDQK0ZhRwgi4ufSvwJXM?=
 =?us-ascii?Q?NdBRpltFVXBtA7uWkUlxsUEPJyNYyQPxgX353rMWlm9DiKiefRrIbJINZ5Bm?=
 =?us-ascii?Q?yPqYT7xj1hIYeOMsI+bJfh+iuUmzzOhCAMZ6n3wIRCJ2Ch8mQx7Lj8Sc/qo5?=
 =?us-ascii?Q?KrqpUh/yaKjc8MKUPZwynVfOhLvLHhyY7eIeLIdhTVkHaP452lw34HPFt5Zz?=
 =?us-ascii?Q?H0DkTIGXouFcci20v7dYKyWbJJ/wJkmA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8774.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PGGreCGLxoWhua3fwhKpAZUzfBwrRXwA9ST7JhsbY/ZC1+ueiJCTk6acT6Ph?=
 =?us-ascii?Q?k8+B49l1x2JK1uooze7G6YcBisptbUjasKJnjVRlSxLG8Zlq99+bmR150eFR?=
 =?us-ascii?Q?ooIykpSZp0Oej5bCHKmPocklS7sbXkl8N1nVPbrTjzJFwly52TS0Z2JwbL3P?=
 =?us-ascii?Q?YwvU6pdAOjd6aLkfW8aY357XeiPZmZnhC7pTBFa94VoFZB++PSPdAikDES0B?=
 =?us-ascii?Q?DClUJOzmXRBCL2lS1HKwv04Zh3v4AXOkxzC7qpCScZi9AiLFN0E0FIB+Hg2d?=
 =?us-ascii?Q?FN4/+26Tq3/X9GgAolqo1NOo56pHvt+Ajy9BYDGOab6R9K1gSHtcHA2XwZLM?=
 =?us-ascii?Q?wQnGMNn8OyR5x9RW0A/FqSyqhrx1Nc0IQzo5VHhHUaUf5GroOqqh54c4Fbgu?=
 =?us-ascii?Q?uAukbiTChjlzDygLbNsr8Tt5mSCdW81wm/Zo/VkF6/AfBXcVhHZbVAGYbMMQ?=
 =?us-ascii?Q?Izgu3wombUAQsHSibnk0wffeAf5E+BuNtOemVhFjw4wTmxPwu4OilVcJmQ4v?=
 =?us-ascii?Q?w6iTX55Uu7iHJLFnTxcTpGxS5q1U3xmwbuc6elFXy27A/q/HkmDSdZecCGrK?=
 =?us-ascii?Q?fWosx+3HodW/pK8onuzdPWFvIRG4FxNbTDDzC8pL3QvXtiUYQD/dSxJFckV3?=
 =?us-ascii?Q?eYt4oSI+WPY+5m2DVvs+gGzVDjtjOTNo5gDfvN8YUiNzYlrXPlyreJC/neWV?=
 =?us-ascii?Q?5J/+opwMpOv3fuarQzSrlC2n8cguaN8WAL4Y8GC0adm3LjkI3NLwNrIISoYw?=
 =?us-ascii?Q?a7JKplZHX41jNV07bZqQssWS2D7v4QtZDqqq9He80yvdIiTd2Vdg6pBgyLwC?=
 =?us-ascii?Q?MpTDpvTUSc5aNQeYyEWYeNHL9XPDSwcAuJAJZ2TjOeX42GRP+82VZAHD6QVD?=
 =?us-ascii?Q?BgXfxB0sW+U9tb6XWCO5J9tNv1sH89OpN0lRZyftCuOcqbNUVRKeMuEDsljV?=
 =?us-ascii?Q?rRM6tIYJFUZYPZa08AOg0cwa8dpo2gg/V5owQ0PvsZwhbSlai+FekyV95CYE?=
 =?us-ascii?Q?aZkagG+8/UNq6PBlg2B3uAa2hpBMRVu810dwPoV4mbOuhm2R1+cFsmGlpRwf?=
 =?us-ascii?Q?MEJjjuylYfNwXsjSUSOFXq7rBQctolD4W//7jBx7kGc0lkVtNdPEf0UTVBLj?=
 =?us-ascii?Q?YKaROWK4poOO04fQ7b0XDPVCZ9RwZ03FN6Q9sMZ319Hz9hz/C3RVrzBop04S?=
 =?us-ascii?Q?xoFroMR/GzpWIcphANU8BWyE9jFO0NMyws+jmgl6yWXTUWB6gumjT9oiaTAv?=
 =?us-ascii?Q?PWTV7/g9ulHeBijE5qw30HYYQ1076BLvwn4VaHDlIKlzeBMtp2lqywMyyCzW?=
 =?us-ascii?Q?ddcA8TKvwYr6WJ2/PvWhhHPY5GCpbBUOJVaIZgmFqm+p5BiGbYJJE1qn+Trg?=
 =?us-ascii?Q?mcFkO397lMZHsjjyiIGQskpq1hii5j27/CAR10YZx54Hhfvy5RP8BE4a5rxs?=
 =?us-ascii?Q?xkPXhNg9y+7IuyiL4cYzr47h41Ig9s+tEQLrMQe15l6KB3PdbgiKuIgZM2Ei?=
 =?us-ascii?Q?BUdS6j18Sr71hQQklcascYI6OEvzn/zY1hH88nrCHG5h6oc1/qC3Z2BW7Y1F?=
 =?us-ascii?Q?ibfYCs65hFAJqdVrakh3QrIrnrS2hSwqCBtDslQ2R26RUO3ne7EGntaTOaFm?=
 =?us-ascii?Q?Kw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3fda0e-4ab0-4be7-9a66-08dd5be2d798
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 12:39:59.8024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tXO0zEEhGGgf+Q2NqSOrTDmyCxMz1SNtOs3QuUPG4Niyg/jFOOwDgmrYAOnG5EayZdAMIOQrnBnK+SuZygsd2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10513

From: Iuliana Prodan <iuliana.prodan@nxp.com>

Some DSP firmware requires a FW_READY signal before proceeding,
while others do not.
Introduce imx_dsp_rproc_wait_fw_ready() to check the resource table
and determine if waiting is needed.

Use the WAIT_FW_READY flag (bit 1) to distinguish cases where
waiting is required, as bit 0 is reserved for VIRTIO_RPMSG_F_NS
in OpenAMP and mentioned in rpmsg documentation (not used in Linux,
so far).
This flag is set by the remote processor in the dfeatures member of
struct fw_rsc_vdev, indicating supported virtio device features.

Update imx_dsp_rproc_start() to handle this condition accordingly.

Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 84 +++++++++++++++++++++++++++---
 1 file changed, 77 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index b9bb15970966..8eefaee28061 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright 2021 NXP */
+/* Copyright 2021, 2025 NXP */
 
 #include <dt-bindings/firmware/imx/rsrc.h>
 #include <linux/arm-smccc.h>
@@ -38,6 +38,15 @@ MODULE_PARM_DESC(no_mailboxes,
 #define REMOTE_IS_READY				BIT(0)
 #define REMOTE_READY_WAIT_MAX_RETRIES		500
 
+/*
+ * This flag is set by the remote processor in the dfeatures member of
+ * struct fw_rsc_vdev, indicating supported virtio device features
+ *
+ * Use bit 1 since bit 0 is used for VIRTIO_RPMSG_F_NS
+ * in OpenAMP and mentioned in kernel's rpmsg documentation
+ */
+#define WAIT_FW_READY				BIT(1)
+
 /* att flags */
 /* DSP own area */
 #define ATT_OWN					BIT(31)
@@ -300,13 +309,74 @@ static int imx_dsp_rproc_ready(struct rproc *rproc)
 	return -ETIMEDOUT;
 }
 
+/*
+ * Determines whether we should wait for a FW_READY reply
+ * from the remote processor.
+ *
+ * This function inspects the resource table associated with the remote
+ * processor to check if the firmware has indicated that waiting
+ * for a FW_READY signal is necessary.
+ * By default, wait for FW_READY unless an RSC_VDEV explicitly
+ * indicates otherwise.
+ *
+ * Return:
+ *   - true: If we should wait for FW READY
+ *   - false: If FW_READY wait is not required
+ */
+static bool imx_dsp_rproc_wait_fw_ready(struct rproc *rproc)
+{
+	struct device *dev = &rproc->dev;
+	struct fw_rsc_hdr *hdr;
+	struct fw_rsc_vdev *rsc;
+	int i, offset, avail;
+
+	/*
+	 * If there is no resource table, wait for FW_READY
+	 * unless no_mailboxes module param is used
+	 */
+	if (!rproc->table_ptr)
+		return true;
+
+	/* Iterate over each resource entry in the resource table */
+	for (i = 0; i < rproc->table_ptr->num; i++) {
+		offset = rproc->table_ptr->offset[i];
+		hdr = (void *)rproc->table_ptr + offset;
+		avail = rproc->table_sz - offset - sizeof(*hdr);
+
+		/* Ensure the resource table is not truncated */
+		if (avail < 0) {
+			dev_err(dev, "Resource table is truncated\n");
+			return true;
+		}
+
+		/* Check if the resource type is a virtio device */
+		if (hdr->type == RSC_VDEV) {
+			rsc = (struct fw_rsc_vdev *)((void *)hdr + sizeof(*hdr));
+
+			/* vdev does not require waiting for FW_READY */
+			return !!(rsc->dfeatures & WAIT_FW_READY);
+		}
+	}
+
+	/*
+	 * By default, wait for the FW_READY
+	 * unless a vdev entry disables it
+	 */
+	return true;
+}
+
 /*
  * Start function for rproc_ops
  *
- * There is a handshake for start procedure: when DSP starts, it
- * will send a doorbell message to this driver, then the
- * REMOTE_IS_READY flags is set, then driver will kick
- * a message to DSP.
+ * The start procedure involves a handshake: when the DSP starts, it
+ * sends a doorbell message to this driver, which sets the
+ * REMOTE_IS_READY flag. The driver then sends a message to the DSP.
+ *
+ * Before proceeding, the driver checks if it needs to wait for a
+ * firmware ready reply using imx_dsp_rproc_wait_fw_ready().
+ * If waiting is required, it calls imx_dsp_rproc_ready() to complete
+ * the initialization.
+ * If waiting is not required, the start function returns.
  */
 static int imx_dsp_rproc_start(struct rproc *rproc)
 {
@@ -335,8 +405,8 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 
 	if (ret)
 		dev_err(dev, "Failed to enable remote core!\n");
-	else
-		ret = imx_dsp_rproc_ready(rproc);
+	else if (imx_dsp_rproc_wait_fw_ready(rproc))
+		return imx_dsp_rproc_ready(rproc);
 
 	return ret;
 }
-- 
2.25.1

