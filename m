Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011043.outbound.protection.outlook.com [52.101.65.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0821B7F4;
	Thu,  4 Dec 2025 12:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764851350; cv=fail; b=gighykLVORcekMmuQl8z3yzwvqk371L9yG8ZUcs8FcSDoB3NctwsNx1tEBRCqosgGrugq52tZE11l50a+QqcnpKx43SHcKkXn67vUG/Mv4CKXKkVIRCEtZ8mlASTofxKeutAa+e7Ngp19Aw1MbLfp4YVGGsEcS3WrQ9I5vZ9vko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764851350; c=relaxed/simple;
	bh=83C+cWbU9u6SPe5z8GF6pmCR9S5oIY/GWF5D8oZtFyU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bQFaHtwYqc2Sn1dVlA/uBY8TCiLDOxZAPpLzh3L8JhyL27lJ6asKFEvZoP48BSXu7U9EnehALXXe2QRCtvmVhwlJtOAtxY9nFE65OfFlYGeZgWH2Ig+zcSwkl2Y/2J4piHt6bk0RtDSFbWCO5yT/TYDK2Y151Jsgtlo23c+eaeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=J9M8vycp; arc=fail smtp.client-ip=52.101.65.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="J9M8vycp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g2Y04kr6dopXaIWG4FMrAC9Ze3dt5vk1MjCkzvO8vJHWB7tF1A3EDGshkfHjJ7X3eKCFmnxDbuhmbQwROH1JSuhsHc3nHsTHhsHU06n8unwPZjppmB/qyXI9Lp+sdqZp+AmhxRANHSewDcJG5hhtaaVANIOZJLsurRw2eF7I9xiSn19kfYV5RCBZ8HG33Y++RhK5A0K4TFuuKfOLWZPyUA97AzLbEuJE7kBzeYAn5Xe7Sw5Kgq2TYN4p9HVwDOdCqaiYRYGUUB7Xj+mxIXhpI3DNnYtyPYNCXIPSlZJeQbpviXLobyQEzVmX6UqWfMVKNGCm6Tqb0KkiEbT43IdRNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTqjjenCSmFepV8e2KiAO3fRjEVuQOa7cH46hZJL5h4=;
 b=QqgHs8MLBeqS2JXPjWJ+isiloTz9EsEvHFpZaq4wFDux1txw5kuJI5J5DeEIWN+Euwk3vVtdKPo/drcUsKXiK/Jb4YxPNGKgrmQ+XL+sKfGiVFDNG/eLsE6i/J65Iw3pJXupFdONcLAfZQx8PCvyOd/1VrGClf7WBbgDS7ctFkPPz1x40/GmrJ5RbndvED6rWpv0zf+TKz02l5C/qpxtn0874BQeEav6PUtl8fHaJB1BEri9DqIboNVVdvaPBD1E4vlhJZPN2s/hX1cr/4BkQ29hBBlVrv9/jmGFOLcPj8kx8onDpVVLTlQblI7WPpiKHBhcWRVuGKJDefqI47Bfmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTqjjenCSmFepV8e2KiAO3fRjEVuQOa7cH46hZJL5h4=;
 b=J9M8vycppFPlJmAxZII/HeRTT1j1K+g5yE22OwjkG4cuWR8IWhuObiBmxyvrYdB+A+2kgkvTf03cJI/MQyVwYYTDFn4ToiyJItOLWzPdD5uiuPs0TWWRbEepMYU+vlcRcxuVibpgDwisEg9tiGUYNHRVMGvirb0tlhYK6gM8Tq+bbmwXUcAkF5EUzJP6rPQsq2F37WsbtBMrnptDr2lnEEPZFIv1R3dEBkM+O/Wv3y8xzKoM2EZ97MvupmR4KXcRhHGIvx10fTaibv2ty2k0npzJSguzF/2eoLA47yLYc1ogcX8IGG0aL32fdsTR40oedtufV3cEiIU8pYJ5piqwvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com (2603:10a6:20b:40a::22)
 by AS8PR04MB7782.eurprd04.prod.outlook.com (2603:10a6:20b:28a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 12:29:02 +0000
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9]) by AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9%4]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 12:29:02 +0000
From: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"S.J. Wang" <shengjiu.wang@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: imx@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 2/3] remoteproc: imx_dsp_rproc: Rename macro to reflect multiple contexts
Date: Thu,  4 Dec 2025 14:28:24 +0200
Message-Id: <20251204122825.756106-2-iuliana.prodan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251204122825.756106-1-iuliana.prodan@oss.nxp.com>
References: <20251204122825.756106-1-iuliana.prodan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P250CA0003.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::19) To AM9PR04MB8907.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8907:EE_|AS8PR04MB7782:EE_
X-MS-Office365-Filtering-Correlation-Id: e1dfe700-0610-49c6-3135-08de3330b521
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?REvLDEtqQ5xK4zP3TkFFAAmoeLWkTbqkRXN+2YyCiWRFil7oR/8H1fcTjpYI?=
 =?us-ascii?Q?kBkHd904WmLLJ38dLi3RRppYgk+ShJgGxnswokvP5DoEbrg9GGkwzl07FgEH?=
 =?us-ascii?Q?H8sG5X19oqUOt9GguPPcpIzcSEY8O6y8d5VntOBZpdMx2ISKKRNziEaQdYjQ?=
 =?us-ascii?Q?G2AfkjYikkrSTjzchUDRT78P0AKagxD0p7VkwV3JTqlomIMVqej4Sji/JMol?=
 =?us-ascii?Q?5nShNSLaJ13x+PeLG1r2VaBh5DollpO7wn1lXKPS7w+xT6dTo2LxRD07KILJ?=
 =?us-ascii?Q?Ix4gjZEBhUpCJkP7Q3RpxObfPwEabxJewHhrIX11O6U6QlUTjrEDwRHxWf6A?=
 =?us-ascii?Q?A4bBB+NsYm8XRtiIO4Uj0rmpImr3U3oyV1RFUREH9hnwAylCGWM0f/0yloT3?=
 =?us-ascii?Q?ns8RX2MShUDgVrfLIlS9mLtrAxNfnegzBylbxnW/XE4EXGRy+DDqxPcpAkB3?=
 =?us-ascii?Q?Udcj7TNgmayOsvFB7qts1hbgQEiB9B9EhMgFd7Ch0kOHhEvPZuQSDUfYD4up?=
 =?us-ascii?Q?URU/RfO0J0KGjX2CFXzsPYuzXE7ukj1imYUCI+5Z1odz3/8sH/5L3a19zhPg?=
 =?us-ascii?Q?RMYuqItQVLr2MsHBW2kIvHo7szPkU00+GIBnxD7SuQtuALe4PEOuBxaT3XC/?=
 =?us-ascii?Q?K3HuijOumHzIo2Lw5FbfLSRwN23G73dSb++tSm1Ytv5HTi7Lv/u8vQ2jSbAK?=
 =?us-ascii?Q?0OYpRdHOk7xVxmYDtXEFiJa4VUjfxo0bJihSXAT+jtS3xfkdNQv1x1t8jTB0?=
 =?us-ascii?Q?9mqWO1jQVcwavhmzSZbABFQnEleDx8DA8zmspTY/HY8WZ3X9BV+3LYVD7RE3?=
 =?us-ascii?Q?e/9RMhxUEoIKRAI9jSs+bRPVe9VyWvAbr5GLPRrtnoSKhxdLbyfHWoP+L1zG?=
 =?us-ascii?Q?QN+Z3BKQ5c86MFp6N72+mHVQeVWEdBR972n5OzN1ec1cBo1joL8Ys3HzZfCk?=
 =?us-ascii?Q?LJ7/bLQm9TjEEucKQF9hoL0xORH6HdYUSPxT3zbPg5A5s8uTKf+XuGpGmw5k?=
 =?us-ascii?Q?rIOb7ljfQcuAQSohxCkh2KbX76p2s2GOHrFvReeclLqtBoOonary8Q0vGfMJ?=
 =?us-ascii?Q?dRtjK/SMnEEQX+1mvdSXlJNkAxmOYJoGpsoZFc9U+qasYFXhqP0HZvbmII3W?=
 =?us-ascii?Q?RkSUDhjD2mXd5+MzNUbYbXtQPdiD8+YBAZPG4vjC7CUcPW9Ty5b6FYSgvIp7?=
 =?us-ascii?Q?hNHPNQmB77SOkDo5RrFzM+wOaa3OVVR9rhBYwB2VS6jDFq93GPzvVD/9i/Qa?=
 =?us-ascii?Q?So2ckj4gMBKF1ZCeqIybPs47GJ8/itQfak3MpYGoAHrCdqFS6FuZI+hgebXp?=
 =?us-ascii?Q?Lf55KhG/rLXFfWW/vQJ+2ttGR4qh/HA2czgXihVHw0Vo5KmtlbSPyEIFYhDW?=
 =?us-ascii?Q?FhTjBRQyfMWKbibmw+iUi+JyIbU9lcbnPo5krZrtT1rMq3IoN7YUSvGneR57?=
 =?us-ascii?Q?9msKbJ9PCPZ+yFMg/KRz4jEz7WLuaoUW8Me895Y6xEl1Rik0kLGnIJu1AuWm?=
 =?us-ascii?Q?XYNo/qTWXu0La5Ep0+Fw+pgRHdYR5cDVIYzA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8907.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m6BtTyERIOBFq/GH5uFBkSWgGbKFRPjBCYit5KhzRjq1VKeln34oPISIWxQN?=
 =?us-ascii?Q?cTsnnPCUupT0C3U23r3MgqX2nMw1jxzEL0cpa4DbhUYMmaolCXIaqcnPx0Gs?=
 =?us-ascii?Q?ewTj4lmFHM0dS0nIUZj/WDcehClwW+Ua+Psd1ml/oH277IlgCVDBOzW3XKfQ?=
 =?us-ascii?Q?2jR6JiE+dTbibDgRpPgA27MoWKIhRO+KaCasGU1ZMCHv5kjzI/5/wsLbxUcw?=
 =?us-ascii?Q?3+ivNUDRVcRjHfxgHlql0i8ZU+WFmXdTqwleHAkxZbGdsCblqDzuZ6wXdoHF?=
 =?us-ascii?Q?T8qq46ljzqDK/KaXySZaGE9DcTVbTr7MempZpzg/3Z8uYuCW04x2uqWYeiFq?=
 =?us-ascii?Q?mZ66T9CU0djWECe0zx+FAsar/xPtx74zlJn7nqqa55SkI9VMPjBJxyxnBXst?=
 =?us-ascii?Q?BuzxEvZBn0S3vtnTS8Y8WVTFpKRx0ba3vew2rmXlM/YBnwVztQSP55qC5QwQ?=
 =?us-ascii?Q?MF/+rP9dWnagHaqsA37EuEKU9/8iNNEXdfI9l72UHHEUmFrjXkPSgB8f84PE?=
 =?us-ascii?Q?PapRWbknaBudf2L6XvoyzsomGCUjJ7PvltuqD32GBkCctnVzA6FALOBJQzEq?=
 =?us-ascii?Q?EFAlzO+nll4I/kkpVp3u/+sRSgJVXXLr+Hg9EIv9XTUjBcm4/eji8z3SK6Hr?=
 =?us-ascii?Q?DBENAMd+vyyCaitzCXIwFZG19v3Mfm5IASAgnfBbKMv9534tm60x9FIYc9Ts?=
 =?us-ascii?Q?d28S/hRGV1SDGkTHCrrGooqQXXiLWGvtOq1tr/FuU2JjTHBYbE9q/R17NVzr?=
 =?us-ascii?Q?p9csV2R+bbC2Wf96TWW54m6x3SOjYnVKyHmUNf2XN1mM3vuWjoF5qfN5+PxT?=
 =?us-ascii?Q?FOJU9FTTbOjOwD0HScYJQm00bchFNORNMULofQ6jMksD9x3ag2DmD1UNwIh8?=
 =?us-ascii?Q?4Q0Uih422bxN0y8wb7o+mbWz3vlSV6pBG2tUVtsLQnTI13mvCOLs66/dkTVI?=
 =?us-ascii?Q?vB+NAgWR9vzCDjah71j8k57QHpJXEa1DhsA6ulRa3PjrgdfqiIE/kT7Je/Et?=
 =?us-ascii?Q?eyqbfZbwlRUe9DVozP6gzvoPItAgqhH6FQ/IijF9Vv/P3anBzdsZrz7UgkYR?=
 =?us-ascii?Q?NYw20yqylVJC2XeF8OcZ9NDVxLkmiOcUfO8KqB2wM31GAA1b5wFxn09DZjTE?=
 =?us-ascii?Q?AWM4LYTFKoAskuSHe7n5Od+eoA5lJdL6Ne8rbQ4NbtkjhygUcM/OkAYrvGU4?=
 =?us-ascii?Q?A+294eVhpVA65I4NCpC9+OA/zXFx469wF6FoluDsXqz18KquRjIsnRbTaE/7?=
 =?us-ascii?Q?EYVj2lZ7gRAlmIU8Gt6yfp1hHIQuZDeMXX7F5Jljfr+UoKLYvcvWf7ygMKn8?=
 =?us-ascii?Q?gs2KlP0+CxmNUxoL7tKZJ5K6qAubtnYqZj+cOQpl61DSYrT6jqJuFkzGlHXY?=
 =?us-ascii?Q?glgqZfLA2aVTM7tRN0PMDMDOjoo8dvewbU/gOSMTfQD7MWU0dOu8hnK2v+eT?=
 =?us-ascii?Q?r5S5bgEmw30COy/jihIWdUBMnDE2PQCsaTqkfwtpmGurMf5Dcx/D/IqeQ46P?=
 =?us-ascii?Q?NxtMwFZgLECTdkcGNa5PxPc/8kusYIHYmQVGZVVa0nA5OR48jgR7NtW/QxK1?=
 =?us-ascii?Q?7u+HEBrDaPFvEJafoT0TpqaTx20nGciWDW044YlZl7PgzIbfdDsFqheak2YA?=
 =?us-ascii?Q?7w=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1dfe700-0610-49c6-3135-08de3330b521
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8907.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 12:29:02.5482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bjrqc7z2rWOX7n3MIMkLm6Y2VuGBTbrkDKD0BVDK7Jo5FKexz5wRwwWW0Hnw7b6tEJDlFckTLAACNrmvZmg/3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7782

From: Iuliana Prodan <iuliana.prodan@nxp.com>

Rename WAIT_FW_READY to WAIT_FW_CONFIRMATION and FEATURE_DONT_WAIT_FW_READY
to FEATURE_SKIP_FW_CONFIRMATION. This way, the term CONFIRMATION covers:
- waiting for firmware to confirm it is ready to start;
- waiting for any other confirmation from firmware.

Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
Changes since v1:
- New commit
---
 drivers/remoteproc/imx_dsp_rproc.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index f51deaacc700..1f3a35756769 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -38,15 +38,15 @@ MODULE_PARM_DESC(no_mailboxes,
 
 /* Flag indicating that the remote is up and running */
 #define REMOTE_IS_READY				BIT(0)
-/* Flag indicating that the host should wait for a firmware-ready response */
-#define WAIT_FW_READY				BIT(1)
+/* Flag indicating that the host should wait for a firmware-confirmation response */
+#define WAIT_FW_CONFIRMATION				BIT(1)
 #define REMOTE_READY_WAIT_MAX_RETRIES		500
 
 /*
  * This flag is set in the DSP resource table's features field to indicate
- * that the firmware requires the host NOT to wait for a FW_READY response.
+ * that the firmware requires the host NOT to wait for a FW_CONFIRMATION response.
  */
-#define FEATURE_DONT_WAIT_FW_READY		BIT(0)
+#define FEATURE_SKIP_FW_CONFIRMATION		BIT(0)
 
 /* att flags */
 /* DSP own area */
@@ -287,7 +287,7 @@ static int imx_dsp_rproc_ready(struct rproc *rproc)
  * @avail: available space in the resource table
  *
  * Parse the DSP-specific resource entry and update flags accordingly.
- * If the WAIT_FW_READY feature is set, the host must wait for the firmware
+ * If the WAIT_FW_CONFIRMATION feature is set, the host must wait for the firmware
  * to signal readiness before proceeding with execution.
  *
  * Return: RSC_HANDLED if processed successfully, RSC_IGNORED otherwise.
@@ -322,7 +322,7 @@ static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
 
 	/*
 	 * For now, in struct fw_rsc_imx_dsp, version 0,
-	 * only FEATURE_DONT_WAIT_FW_READY is valid.
+	 * only FEATURE_SKIP_FW_CONFIRMATION is valid.
 	 *
 	 * When adding new features, please upgrade version.
 	 */
@@ -332,8 +332,8 @@ static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
 		return RSC_IGNORED;
 	}
 
-	if (imx_dsp_rsc->features & FEATURE_DONT_WAIT_FW_READY)
-		priv->flags &= ~WAIT_FW_READY;
+	if (imx_dsp_rsc->features & FEATURE_SKIP_FW_CONFIRMATION)
+		priv->flags &= ~WAIT_FW_CONFIRMATION;
 
 	return RSC_HANDLED;
 }
@@ -385,7 +385,7 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 		return ret;
 	}
 
-	if (priv->flags & WAIT_FW_READY)
+	if (priv->flags & WAIT_FW_CONFIRMATION)
 		return imx_dsp_rproc_ready(rproc);
 
 	return 0;
@@ -1131,8 +1131,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 	priv = rproc->priv;
 	priv->rproc = rproc;
 	priv->dsp_dcfg = dsp_dcfg;
-	/* By default, host waits for fw_ready reply */
-	priv->flags |= WAIT_FW_READY;
+	/* By default, host waits for fw_confirmation reply */
+	priv->flags |= WAIT_FW_CONFIRMATION;
 
 	if (no_mailboxes)
 		imx_dsp_rproc_mbox_init = imx_dsp_rproc_mbox_no_alloc;
-- 
2.25.1

