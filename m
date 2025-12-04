Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013026.outbound.protection.outlook.com [52.101.83.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67F933FE02;
	Thu,  4 Dec 2025 12:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764851359; cv=fail; b=cNVcUKa2ZFLff5UOrIHmHUTuTpvkjriyGpB55KtQAivQ9GExmG5uM95HsAwhn7jAxDy/TJbOA26Jh395F9x1+w3NhPYygkC36IkPZpozxDfLD4IsVXVgvDC6lM+6nPe7adaxWqH16yXLGxl5ku2F7PCxIOpAAEDHazpv96twgHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764851359; c=relaxed/simple;
	bh=lhpotmEXx0CjWDQfjyP0s6srhNCTFimdzwBJW+Xye6I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=csfy8OU1LVTjmU3zI9x55PzOttefZPZPV+VcxN9R9HyiT39+zgVf9QHJTYa1F/R/lzLy/6vu7B8ho4amVQVKZIBCC8uuY0QZ86qp2oBkelY42dCJqt33FNZacqHNMl1WLwzPR37/Zh7PUZTjLoHx8al7KFFdb/HBdOPO7lp/MCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VTsycaoI; arc=fail smtp.client-ip=52.101.83.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VTsycaoI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTrjxhS9C9XSfagk4nNebZBANWOK5OGiBWh+g1wXCFiKndmiiYksmTf7qBgTqfs+nHIp/4C7fV1d+a3t3Q6CoUEwWxZ9nbGngpdd6zExQtlSEJQFxoopUrSiNOWq+Hj3474uhELEhnobeLbm/8dq5aqg+sMoXLR0xzWj7ue+8t4c4CHj2tjQdT/xN4EHbK3Pkgl7CAdPJWkNhautUMYBKbmxE98kIXIQ5viSSuod4knySYCo/okinPsUBJccLBDPmg3CPVspUV6cnGY9W0kNkd9vPRWi7vyqw5e+2L9IifKpfTpb70Bx7fxVKmVRGlPJAWExIi8oUAEIW+kRYaj1Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETjyxIAb4miAuJJmdY6bORcEFwPtpy3jkqRoG5NP/m8=;
 b=GEhUWoUREFf2+cZMxKYir7ljgJ9GcEzarM/ULnQO5BxdBOt3oCkTQwRmd+8OeCP4A0aYOB9neCR/Jf+WbXTHSGklXkz/p+7UAagKQZ8Nc1ND7pkN9MHeZel4zBzsEvz71qSC9cRNXe0bbSTcymRzdbg7efYokESdJdRZfpsyul6upMuMKD1U3rIN4VdMqwgNV2jvGKkElEIIOboQ88p5xK6jMKzqkxzD1y2+c2SoZlttY3CgM/lX3rBP19fpbEtqYi2t7lkSb01qh6XCb29aMHSjqV1TvfIzLvu1sGvz0776ZwKGxx3ylUBpLZ/nPbSOOtHMsWAFUwkhEayvZ6DrBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETjyxIAb4miAuJJmdY6bORcEFwPtpy3jkqRoG5NP/m8=;
 b=VTsycaoIfgQisX/20NQu6JJYH8mAmmA1PjIoQLQcIYOVKGbtVErHr532+vRM3b7q4pGznp1Vc3HWiVVUW3jUAQTnJ5dEuaHiCgBTt8TbMharbEU7p0/TxAqUOra/az8sZ5rdRfrs2ZRTpJCEpUw80AS5S2oBZ5vN3gMXP9sL9Pa9RlJGDAJOCGgAiS4RRBDXVQYsaqw4xiLNy8qcKGz2oZz3OUtfzFBAI1dAD7oNEZOtthwlnHU8+2BJLsdGIjeazsHDSCkOtb87ABGjWIjEE+1C2vWy1XG/TVG6On7l9cy/bAHT+IzrEWm5RZDoY6DRW/+hGg/3v1nT3bmuIbjCTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com (2603:10a6:20b:40a::22)
 by AS8PR04MB7782.eurprd04.prod.outlook.com (2603:10a6:20b:28a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 12:29:07 +0000
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9]) by AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9%4]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 12:29:07 +0000
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
Subject: [PATCH v2 3/3] remoteproc: imx_dsp_rproc: Wait for suspend ACK only if WAIT_FW_CONFIRMATION is set
Date: Thu,  4 Dec 2025 14:28:25 +0200
Message-Id: <20251204122825.756106-3-iuliana.prodan@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: f58ad3ff-59ff-4479-0600-08de3330b83b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G3mV3V1CUnYOfQ5KRPPFW7FZfQOc6OyXkCaqGOfahTWsZtTMwvIOFz/BAoGX?=
 =?us-ascii?Q?BPbbv2dPrcuC83tsKYWUHKleYTlgn0IRkh2Yg4MG6BDuNEmPbtnvZwa8gLkV?=
 =?us-ascii?Q?vfwWwpSwpyrQKJyNVW0b1hSer6lqyty+R4YbnDBYxYFydwE+SMEtAvL5Y++d?=
 =?us-ascii?Q?af4X59ygsqJN1JaIABduxvl6TvK8TgBlx08ttebP+OyH2Btk97BYnfsDd5aB?=
 =?us-ascii?Q?INh6Bpyl+yOp3a2A6PGVi0TYM4O9SP/fDBdRjjEnWyN7rwlWPK5cBBfA4JSX?=
 =?us-ascii?Q?/9UeWHY3CSx7Oqp16/OMG1al2wNr/7q6QgIjQYxTL1sCAP6p5RB4uUkNv18q?=
 =?us-ascii?Q?kG5fEzjvO2VaifS5XIF/V5HnLjTqH5A/yq/GlABi46cWc6KZ3qySY6qBTthj?=
 =?us-ascii?Q?ld6WGf2y08gpg1KZGfS63RrUIjnQNQIK3TQRkskNYdlAQIcN4W+brWUdVW6K?=
 =?us-ascii?Q?YReDR4te4/RVvEwv+PNIalw095/D3L1mjwVb+VAUrQ6Jg2xi4ZbsedOmsYlH?=
 =?us-ascii?Q?oXiPOqHQ//owbu5l9AeBVVy3umLwGudITeXJ0hkJ8LDefbLIjhn6Nkd9ESeW?=
 =?us-ascii?Q?IGuov+8eQzUgumx3yIoPuv0+b3zdf4RQjbOunXt04t+sj7A1qBwvs5rJkiDW?=
 =?us-ascii?Q?1pXpxOJVz09176bmkD2hiGRhNOVGLo74ANpe8idYnPtHsKGYMTX5iivEC19V?=
 =?us-ascii?Q?SoVeXj135MF024fX/uIk5uCa3uN/tpwIIMdWXJTWVEmr2k5K9JO/6xr6tIQq?=
 =?us-ascii?Q?LtncKEPpO/+vGXtVeAXtDXMV4kEDtvb3yo8YxS5/MOg3IRAnfzX1UOzayXHe?=
 =?us-ascii?Q?t3p4+g+hLuxNdc83DndRI5MZsnFHgZomaUCUgBCN4NQm15O97TyJiDHfIIXz?=
 =?us-ascii?Q?cW6ga12uK/knTQ01iyv7miVuzaAGslUTv+KN/M6yUR3HSuYZ4XRM5ILh3v/y?=
 =?us-ascii?Q?br3A3j40zahGgHpmLORbIKWTiEFWFV9P4B0ejTjGtiXqFeuUUt3TDurY1nAx?=
 =?us-ascii?Q?ij4u+hmX81F6i+36v6uCnVNJjMBytVzwKQzp67X3lckIvZE6h0hkopm2vTbX?=
 =?us-ascii?Q?PDjDoy90qF5MDRP1nWAzsrQW4NQWMMUDBWXSbJNU0UxCL75YLeBtoVwjotss?=
 =?us-ascii?Q?M6D+T6EIsL6wDsF1pi2RjyL9L0SsQ3H2ikA8L7dmSfUdmsJL/5SEELf/a1Eq?=
 =?us-ascii?Q?c4uzOMvflDERDQrbwmH4Ok/MoCPi6dF0HbNpcmib+lN90GbmyQwSKRjkSIVQ?=
 =?us-ascii?Q?M5jq7CBv2GchdYhoDeDr0ceM1lBZz321HZ9B94A3h9Lch/kx3mAcy8a0yga2?=
 =?us-ascii?Q?7oyjdmDu5viZHYcvJdSDBLJVWe3e9DXPg/PcrI/+PJWCZ1xufOZIqZJKIoai?=
 =?us-ascii?Q?c9rSxqZYLOUGI01olj9OfC9bssJfFOh+8FjDWdXRmDuSmlSsTji5h9xGwalD?=
 =?us-ascii?Q?QMf7c7yeUWzwkbUc12zTxW/k0B8XI5hElQqwBEEFtTdZaN/2qDjNw59ybmlH?=
 =?us-ascii?Q?q5/dWM3KdpWwSO5ZgDh65BygQIFSWe1Tm7Bq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8907.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1s23qi0QaV3KGISvS4BoDkQl6QGFxlo5xWOrZr0Ia6FSOpPbMxkImoor2+uE?=
 =?us-ascii?Q?DDOgVPux6mt8hCsipNAX4robDqFbiRo2ODKRxcO8gv/DQEajNRqSErKhr7Sc?=
 =?us-ascii?Q?LzxagcobB91GLCnPhPzewzEIvly11y0+hvfcgeBjDq4cc11MCC89WNGYeJ+s?=
 =?us-ascii?Q?q7BflBtnaMz2yq8jKnV6VDZJ23BzchxfD8gcKVop/GKJJMCPFjIWLQGXPcwN?=
 =?us-ascii?Q?0bJj6MCrY++WrcfE/zKvWC0lvc49DDvaK9raTJ5dQfcOkhO2OvFA5SFRzPVN?=
 =?us-ascii?Q?dllzObGZceR+PvK7Ynpmfe6OMNPRjzVJE/MPueqRmyhz6829MC9AseHjhK0m?=
 =?us-ascii?Q?UWKn1pwmiPTc74aDouJuhxSxSBB/9cn95BwQOVxxEfzV0QnAQR4W9E4YE9dZ?=
 =?us-ascii?Q?/LbTxCQMA4Q2y3ijXcbpbXRplw2VJFfY3f1xw/0fU84cyS4/1VZi0ET+m9NC?=
 =?us-ascii?Q?cCa+czMd0sV/LZOy0Pwxu2iRag/VxEPZftb37cafEI9ZrGht4zWz/3Unipiv?=
 =?us-ascii?Q?G8+WRWS5GiFKCnMCmQFAndF2+HOqa+ZUBW/DrtFBMgdl3O0R+52Y0UhR8R0I?=
 =?us-ascii?Q?7qctn5qMLpzTX1jvRlCBO4MULehuuSvP5dOaOV4bk6ysDqPFXTDxdk9MpZDS?=
 =?us-ascii?Q?CIvqoBBqDfski7V35ukBd9y0SQcw6yetXrqYL/yGIT6wT7gWknHpITM0gCLZ?=
 =?us-ascii?Q?Tr6qqRG6SieLKqUZzPevaNXuYakD/WRcTzl2T9mlKB8L1ex0HKE4acsBg/gH?=
 =?us-ascii?Q?cemgAcTVXsSnsDLVRYhF4oQGx2v0Lxi2dzskIQwQaKj+vf5P6IaI7GBGfh0h?=
 =?us-ascii?Q?IHakBnDhFZSqPUcaqcWzKnqXeaPJllUJUTBGSWJ337K4fnSIlHr5LdUSedKR?=
 =?us-ascii?Q?5gbHXNCQsHqaqwB0nKSRgtenBKcuwvdcUBQIaue9kfM8pBGvl+1ffSuYn+wz?=
 =?us-ascii?Q?vMxy2HVUuE6uLatL13SuBK7sEDf98sZFRZz6GaatoaT6h5zZOAUstrklQF/F?=
 =?us-ascii?Q?xkLd3F5BwQ0z26HprONihOh2FaYNmlfGUc6X9sSBSIHjfWOi3j4olPgdut61?=
 =?us-ascii?Q?3Lwyp2cedXPTYXdFPT+kpkc0e7jPE6U9a4qXLqygqg8flug+YwFbWTCimv2/?=
 =?us-ascii?Q?9Ejr3jpyMfMFbaW6KNAldbUIclOnzvbLhya0TKHrJmnaxdUcTKYOZiLeOKMO?=
 =?us-ascii?Q?p0ecH10vrqNlj5EIp29BTE/0Qu1Me8gKzd2jW0nrz4OD3IAXyyDgipS41qlA?=
 =?us-ascii?Q?WxWs+oKmlOHfWEDVQ9zY0g4MocyZOUbOD0FqrHaKYBGlVzdFexLZgvaJIldR?=
 =?us-ascii?Q?/ozr3mhk9JY1i2wnxYng2v/magWC8ku+C7sM9Dt8PSgvbxZ7JejJU6/P+e+t?=
 =?us-ascii?Q?A3X2JI4Ad40WZK5RIZPkXTemXZt6pvMcyQdqs1ihyBRBQTP5c5JCbAhvFNS7?=
 =?us-ascii?Q?7Df9qX0t61jhZHB/7IT5WE+y64md7sBkJHYxE5h4+SyzP8lvM1IpQxyp/kju?=
 =?us-ascii?Q?IUJFAF+HIgJ52JyETOF5efUkt8YmS1dWxGzX/nN1L+kK/AA/877725Ci0a4B?=
 =?us-ascii?Q?8fnSLZZ1Ic4PXccQFURzi2ve0JB9XLKVieVAPfjm9UzhzA6rduh+Qg1xGAXr?=
 =?us-ascii?Q?kA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f58ad3ff-59ff-4479-0600-08de3330b83b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8907.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 12:29:07.6939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jckGavNBqU1RvI7eFs5E6GHReURU+zZCy7BShHCZ3WrwEq//R8mMbc75Nq9Pb2TxqBylb/Ox8lFXKSuqTFzOMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7782

From: Iuliana Prodan <iuliana.prodan@nxp.com>

The DSP suspend path currently waits unconditionally for a suspend ack
from the firmware. This breaks firmwares that do not implement the
mailbox-based CONFIRMATION handshake, as the DSP never responds and
system suspend fails with -EBUSY.

The driver already uses the WAIT_FW_CONFIRMATION flag to indicate that
the firmware supports the CONFIRMATION handshake at boot. Apply the same
logic during suspend: only send the suspend message and wait for the
suspend ack when the firmware is expected to support it.

Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
Changes since v1:
- Moved confirmation check earlier to avoid sending the message when
FEATURE_SKIP_FW_CONFIRMATION is set, since RP_MBOX_SUSPEND_SYSTEM is
not handled on the remote side.
---
 drivers/remoteproc/imx_dsp_rproc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 1f3a35756769..d03017d6b214 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -1251,6 +1251,12 @@ static int imx_dsp_suspend(struct device *dev)
 		goto out;
 	}
 
+	/* No fw confirmation expected, so trigger PM runtime suspend */
+	if (!(priv->flags & WAIT_FW_CONFIRMATION)) {
+		dev_dbg(dev, "No FW_CONFIRMATION needed, suspend directly.\n");
+		goto out;
+	}
+
 	reinit_completion(&priv->pm_comp);
 
 	/* Tell DSP that suspend is happening */
-- 
2.25.1

