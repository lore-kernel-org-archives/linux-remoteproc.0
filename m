Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013029.outbound.protection.outlook.com [40.107.162.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59EF1EB5DB;
	Tue, 18 Mar 2025 21:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742334645; cv=fail; b=puCKcX8J1QfU3ezfRoLEofpXWFMKofsfpy0H7tSObLlLXym2qY91iZab3hvSBUhqhXpikWu8CBTVhzOJ5bElofVs9fGz0ML27QuyU9ZhOUDSfFDLbHyjyPUYULIr3NtX9Aj4xsuaSdEjyZqAixbf+mmcu3wiGGCGdDw334TSeR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742334645; c=relaxed/simple;
	bh=/zaXfkYafZd9UcVqH5xEXt8qtHrDKhpw84jwLSPa0Lw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Pfut3dUbcRUV9oLrjt3O+DLCjjnE9asfVsHY18FXpfZLy7RNjGEIu1krgtU3eLtZeyDjUuxXjQ9egip937sqZj9qmWd1nmpkMVGeaXzM+bF7bVbcPv0CR7034e13ebofOrtjJOGZX2WhjPRRsxvpGSpd686gswmwcbMLWXoBFtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VavPOfw5; arc=fail smtp.client-ip=40.107.162.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VavPOfw5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGwKGBvJyCb/PRN+bZwbovXcy8ynmQGlcRf9tsQZJ6Ze3oXe1RXBRLIdCuKqpU8ZI6KRhqtp4N88GYO1QRZnvV3TmArtgU1kSQI955eX+Lya1ZDOBQ1a5XhJPGaL9mYLwD7d1YCZhjrm5yiNOqMI3MTSXTqUlvDNZeRGQ/93PeeQQ7DMB7C3SqBgHF7VbqAFLbyfP1P5m6OzkE7i2tGL+t+Yh7a9Y3nR5PYxz9tM48igWwAb3NKz68q6AzZRy/8KQnKknI3IsN80SEF6L+JcvYVQSTbPCVge4U+acZC++6Wfg0NrCmbyim6n1WqBCIPML2+HBYXnL6lyhstyHchBNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCsGBCvrBP28DTTGshbcWoYlwZPnCyB3aaygwRMJoXo=;
 b=Km3l9VpaSNl/1qtuiUC0gs9Pmw1kWYhHevhI6hYAJGm3mn6kHzG7WJvc+80zfSPKVepBSCIlC+Ey3zwwEe6VRvaG9RqK5htmyJdsySM00TEVT1ZO7jiDfKRKRYYJToUcGRbgIxn3aKWC6OBuzCdrls5x5xYSFb/lHNJ26spo7YQtzzMfCRotgXrba0YHGBi8pgFWzp69dCOaKXx7AQ3A7+F7TzN8Qhx7gitCoHikTD01xXiqkkHm516ggFhfK8rhSbRDJ9hW7halXLvPd4mONrt9qVoTp2U5fAwta3L9CB4J8aOxzabIkbQVEi5ND2qJ9L8yX1FkDKXOzMVq9INmaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCsGBCvrBP28DTTGshbcWoYlwZPnCyB3aaygwRMJoXo=;
 b=VavPOfw5OdembXJt0yEijVObLlLZ1nWVLDvMisRbVxsq0MjSpCVnf+1bZ4Md3XYouWVl2J/pnFvVP5NkUcP2HSxUEnHyrtTlbwv2iJ06BUnhL97h+ERKNE/XobCYBNiZM6fEUdSyyMnDeWnlEJBAg95gsoZBhLtSyLJmCtlZuoiRNxllzAGDG/wk21eShnVCBEb1X33WL86E21xi256vgUlj4mnlx07IP7pbgdwQ8YpONvisnVBwkrj3G+WdC/7+97/QtDFqTsetjlOVzAo+bu/huSWmFBhHw5HNVqBBPhwAW0ft8fROZiYkQkfd7A362zDCDNRV9n3rrooy7+1+iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by VI0PR04MB10462.eurprd04.prod.outlook.com (2603:10a6:800:231::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 21:50:37 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1%7]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 21:50:37 +0000
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
Subject: [PATCH v2] remoteproc: imx_dsp_rproc: Add support for DSP-specific features
Date: Tue, 18 Mar 2025 23:50:07 +0200
Message-Id: <20250318215007.2109726-1-iuliana.prodan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P195CA0003.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::9) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8774:EE_|VI0PR04MB10462:EE_
X-MS-Office365-Filtering-Correlation-Id: 286b1600-6b1d-49c2-bf05-08dd6666eac1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uU0lRahLwJH+QRXyXHDXFj2F3ibK/gB/1bKFGeHrnAC6rQVa34PfdIOWUyAW?=
 =?us-ascii?Q?vxCYx1oftlwpe6/+KwVpBlr3M43IikBkRULY0bkC6PQ8ev4jSppCCM52W3hT?=
 =?us-ascii?Q?GumtOkO+iYSLXslfCcsMfFYZyhTChedwXnEk/K1345+GeY8HTJlNygKLM/bg?=
 =?us-ascii?Q?EnxmtYJFaiq6rWcbbh1cTfDPLH2PoBbsv4IfcXgDEw87hXd2LOGrahslxa93?=
 =?us-ascii?Q?NxCh2C8num6I8F3b/nuHMlY6ia2t5ggIXPeAIfiCCudCEGwMWO9g5GYoxz4m?=
 =?us-ascii?Q?2FxrVZYz9YxTVF8ciRvyO9VD+f25DCfMv0kQC3B0guGV7ZGrTRkY/+XY6SRK?=
 =?us-ascii?Q?2pi/bh33Lab+v5Ra98dpoPIdI5n87aZBAyJrGWL0kemLCMbAqrZSZV5T4aNs?=
 =?us-ascii?Q?23bXY5u50bmRAyZ1a5LIg3bZdAKIcI9FO6w9iJEyqOzyECwRs4EtG3RhCLpL?=
 =?us-ascii?Q?Jjdsx+mWS0xqMcFBN/Gfd+VNXXB0JPbX+S3JizYW2ce3uIOg7lDk+fxs2hz8?=
 =?us-ascii?Q?HV7Np4qqSU6sRJ/6COhoneaRv+PsE7T+I6EhCgPmRgj9ydUaSxBfsZZTWMBR?=
 =?us-ascii?Q?7nCU77f63TlaPoZ7EerBMobi3cxoGKP/i9Ip8KrMumiVL1bluWzzV/3xkSzh?=
 =?us-ascii?Q?D6qN7xJB7JFj82+aczO1fuPFACP3dZ20Zm/tJJRibdVCDf4usxy+BrQGWKbL?=
 =?us-ascii?Q?AFFuS2q1qcp4+5R43aiHJdoaral890hR8AVKK69QGgtk5lNRjag1isDT+WP0?=
 =?us-ascii?Q?QoahCs0V2iqE3xszxK67YCcM31kImDnRjjOvGl08S6i5WwAUHIq4RjPVVsxo?=
 =?us-ascii?Q?stKP29aSHqd41M9Hacwq5DTvP/9nW3MzZGMDvS+viAqUo0SwHbAgaxfAvFMe?=
 =?us-ascii?Q?rHnoVzYKKBkliPHhbRhwuSJDfvJuYXF1t9XVCU9rqb8aygI69++LHbBMCOhx?=
 =?us-ascii?Q?Zb/kxWhzMOEnU1CnrpV/TgRaijpHXUWm0c0bPCIxrxbnpvwMtpgOf4JU9zbn?=
 =?us-ascii?Q?6z06zS110NZFuTtDlpztl5EeeFakZIm+IanUGjnmvNKnEqAuK0J9WGxKLZ+g?=
 =?us-ascii?Q?szIbrfiC97QX0rfjmqac/tRBmsxOGE/AFB3TpcdWpm157qpdNVqMCVV3Fg3v?=
 =?us-ascii?Q?pIu9ck6qgt44VEU4Uw/uwqIdW4KOO4uGxZlJGTnwAk+dMlrKDD9LBg85aSVJ?=
 =?us-ascii?Q?k5MuJYiOMW6nB2v05bla5RuBB+Hav8z2gxLbfX6jorEy+c1AMNtmX6yD4UZz?=
 =?us-ascii?Q?0Jd9oJBPBgearnihKh9BdhLHN/lbWjHF6MI6nCokALRjxyLeAWlyYIvg+aDs?=
 =?us-ascii?Q?EEWk2Xj7YAu4mgKI0FA3vi8ufyBL1xBMc1fULn0p+sJhyoDNjy1eaI6KdBQ4?=
 =?us-ascii?Q?4ffKXKC7OLDUN2XgXVfl8Gd1kfZQ0F2Iu16IpcH4LwuowHI/TD+sNPAffGJ7?=
 =?us-ascii?Q?LwjGr1endiCAvclyCYCX2GVnNeUO1fUl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8774.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CB1OtMqltmWuOyOyaqe1ZiGoT5AiQauasxZvDdvNlCu5r6VZ6PmlRjFOCRHZ?=
 =?us-ascii?Q?GHZLfkVtFF1XnWr8STQUP18G650izMCeXZac70UV3DPaO9P6u6040mbyQI3e?=
 =?us-ascii?Q?SujR2x1taj42T1HKhMrYOO0Ozd7jauX/lSZ4VNEwob0vN3jhKyhHVtMo4pIQ?=
 =?us-ascii?Q?6ZMRCXCAc603m4s6lk//xXlM/Hig5Kl2CA4um4dx890Ouktxt0sm+SfiXcTC?=
 =?us-ascii?Q?iCXWKLTH82E85WPetIXb6JchnlsfBQP0h2HMyvIkEfXcUwIsE0AugMrT+Vh4?=
 =?us-ascii?Q?kl2UsDRLYjg5rVgo1KbnnbUsj4qtDBeO4+kB2CFm2CpSV1ItTRCI7T3lTTYE?=
 =?us-ascii?Q?fw5UvpgJNuFmss6ZZwuLEO8OSlUNbF4EHO7+H4VAYfEZGrPYSfCGc3YaOAlp?=
 =?us-ascii?Q?5MxiGkDIfwts1iVRFXVnZ2GKtDPboKnY5nT5WQRpJhjuJpLUJZ4IuH5HbrZb?=
 =?us-ascii?Q?LaRLN2RpKqbvWSxHlZAmxz+U2726lfB3AxGYujeSIszA9g3mFgd/gbnWGzdf?=
 =?us-ascii?Q?iXtaFXOVuSY4TS3TxysedkOCGWgNIOs5HEk7RrV03KLdowI5ObIIoD1345fH?=
 =?us-ascii?Q?p7tHYUcF74lo7xPVJOpMu2pmL1fU3CQo0L9oxxcaYpQHUdJNYVUwV2fK6VFL?=
 =?us-ascii?Q?/TtFp+0PwnY/txmxXWHAD/XR9PW4JtpBP6X3yM7e7oZPyADS3sXci6eu9zx/?=
 =?us-ascii?Q?zB9gYIKo531VZdvbt1dbolKwnMhT1bgZS4R8kff4/Phq6hADJYgkcVKcBD4z?=
 =?us-ascii?Q?fkNRvPeSt+xPCl8JlsyJ0dwoyxIkLT6L3j9wVd9ifgxLRQlyKSNvKZdwIrrX?=
 =?us-ascii?Q?TLO+Ev3e5pc+2YV4IBTJfG6JCNse0nCeUJbPHjxR91ThfSOzqmKMWc9gX+pc?=
 =?us-ascii?Q?mMNlVJSPJzH6OgSGG2GZ2e7F97X6tht1vONpx129wDCyoRfuyt37v1jtPYNT?=
 =?us-ascii?Q?7NGoy5rMcQLLxMJmtWSnqvHfOQeGTCYRP6IyrDispqCQGQ6GCyB0W/rXcDbz?=
 =?us-ascii?Q?W5k8VIWBUdaJHOCBq2l8CYV7EeD0ansj5rmdgmK/SURskqoDJRDqsaPHDLhV?=
 =?us-ascii?Q?R5VGbz5dLvaBT91CwgGh1a+j1tVTykyExJCPKsG90Cn0lBTtbsOZt0cURAK0?=
 =?us-ascii?Q?/bUpEtmPNSt6w1k+VvC9ifBUYnhbR3JjoLiXEB1EV113q3scMBLYu5mv7ZWD?=
 =?us-ascii?Q?e9P8MWoVkoy3oKH9L6yIh8rBXjmpWe+b7742FDdVPGjIML81Vwf+kUNExnaI?=
 =?us-ascii?Q?l9sPT07uiEBoIoAqIfR8aDaOV9lUaoTM/biDGDC949SL0OouLaTGdIoMcF2I?=
 =?us-ascii?Q?OYKt+1OArYx343IQwa4vHT5Wa3z88EdYjeaWbmide5MNVkrKvfq7gGcLBQHq?=
 =?us-ascii?Q?lPRCWUu3IQUzoITJOMTwsSk+NiOJzLpn98GVLeSk3L+wy59wGMgNHs8soWu8?=
 =?us-ascii?Q?XBSTmLd3cSKmpjj7mBQqTZU8ob3tRuZaK2J2BJTDMbQTuY/y6Z2+xuCQqcWl?=
 =?us-ascii?Q?G67J8VF9ixd3/+ZPj1mlMizJIoEUGy9gu//FAU8PSr/3GGS7LsekD/NBS+Tm?=
 =?us-ascii?Q?9sZItvPnCAdpA11/iC3BbeTtBWM6IwtGCs+/CMTYcqROWJOZEC37gDBqTbP6?=
 =?us-ascii?Q?4Q=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 286b1600-6b1d-49c2-bf05-08dd6666eac1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 21:50:37.0824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cofZMOGTV1PTDpnkIM5kWcrjaM+lfv4nFeRjFlJGTaqMU6dKtqgKpJAsFVvLiUDf38xQ/dv7huPVD5ASg8RM9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10462

From: Iuliana Prodan <iuliana.prodan@nxp.com>

Some DSP firmware requires a FW_READY signal before proceeding, while
others do not.
Therefore, add support to handle i.MX DSP-specific features.

Implement handle_rsc callback to handle resource table parsing and to
process DSP-specific resource, to determine if waiting is needed.

Update imx_dsp_rproc_start() to handle this condition accordingly.

Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
Changes in v2:
- Reviews from Mathieu Poirier:
  - Use vendor-specific resource table entry.
  - Implement resource handler specific to the i.MX DSP.
- Revise commit message to include recent updates.
- Link to v1: https://lore.kernel.org/all/20250305123923.514386-1-iuliana.prodan@oss.nxp.com/

 drivers/remoteproc/imx_dsp_rproc.c | 59 +++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index b9bb15970966..1729bfbc602e 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -35,9 +35,17 @@ module_param_named(no_mailboxes, no_mailboxes, int, 0644);
 MODULE_PARM_DESC(no_mailboxes,
 		 "There is no mailbox between cores, so ignore remote proc reply after start, default is 0 (off).");
 
+/* Flag indicating that the remote is up and running */
 #define REMOTE_IS_READY				BIT(0)
+/* Flag indicating that the host should wait for a firmware-ready response */
+#define HOST_WAIT_FW_READY			BIT(1)
 #define REMOTE_READY_WAIT_MAX_RETRIES		500
 
+/* This flag is set in the DSP resource table's features field to indicate
+ * that the firmware requires the host to wait for a FW_READY response.
+ */
+#define WAIT_FW_READY				BIT(0)
+
 /* att flags */
 /* DSP own area */
 #define ATT_OWN					BIT(31)
@@ -136,6 +144,19 @@ struct imx_dsp_rproc_dcfg {
 	int (*reset)(struct imx_dsp_rproc *priv);
 };
 
+/**
+ * struct fw_rsc_imx_dsp - i.MX DSP specific info
+ * @len: length of the resource entry
+ * @features: feature flags supported by the i.MX DSP firmware
+ *
+ * This represents a DSP-specific resource in the firmware's
+ * resource table, providing information on supported features.
+ */
+struct fw_rsc_imx_dsp {
+	uint32_t len;
+	uint32_t features;
+};
+
 static const struct imx_rproc_att imx_dsp_rproc_att_imx8qm[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	{ 0x596e8000, 0x556e8000, 0x00008000, ATT_OWN },
@@ -300,6 +321,39 @@ static int imx_dsp_rproc_ready(struct rproc *rproc)
 	return -ETIMEDOUT;
 }
 
+/**
+ * imx_dsp_rproc_handle_rsc() - Handle DSP-specific resource table entries
+ * @rproc: remote processor instance
+ * @rsc_type: resource type identifier
+ * @rsc: pointer to the resource entry
+ * @offset: offset of the resource entry
+ * @avail: available space in the resource table
+ *
+ * Parse the DSP-specific resource entry and update flags accordingly.
+ * If the WAIT_FW_READY feature is set, the host must wait for the firmware
+ * to signal readiness before proceeding with execution.
+ *
+ * Return: RSC_HANDLED if processed successfully, RSC_IGNORED otherwise.
+ */
+static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
+				    void *rsc, int offset, int avail)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+	struct fw_rsc_imx_dsp *imx_dsp_rsc = rsc;
+
+	if (!imx_dsp_rsc || imx_dsp_rsc->len != sizeof(imx_dsp_rsc->features)) {
+		priv->flags |= HOST_WAIT_FW_READY;
+		return RSC_IGNORED;
+	}
+
+	if (imx_dsp_rsc->features & WAIT_FW_READY)
+		priv->flags |= HOST_WAIT_FW_READY;
+	else
+		priv->flags &= ~HOST_WAIT_FW_READY;
+
+	return RSC_HANDLED;
+}
+
 /*
  * Start function for rproc_ops
  *
@@ -335,8 +389,8 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 
 	if (ret)
 		dev_err(dev, "Failed to enable remote core!\n");
-	else
-		ret = imx_dsp_rproc_ready(rproc);
+	else if (priv->flags & HOST_WAIT_FW_READY)
+		return imx_dsp_rproc_ready(rproc);
 
 	return ret;
 }
@@ -936,6 +990,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
 	.kick		= imx_dsp_rproc_kick,
 	.load		= imx_dsp_rproc_elf_load_segments,
 	.parse_fw	= imx_dsp_rproc_parse_fw,
+	.handle_rsc	= imx_dsp_rproc_handle_rsc,
 	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
 	.sanity_check	= rproc_elf_sanity_check,
 	.get_boot_addr	= rproc_elf_get_boot_addr,
-- 
2.25.1

