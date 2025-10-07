Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010000.outbound.protection.outlook.com [52.101.46.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D382D73A1;
	Tue,  7 Oct 2025 15:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759850349; cv=fail; b=DdwsGTvAuwvLjOgcJG86V8+0lwE2zx7BUkRZhmMcmB1nWl40oDT+ujLoAS0RYxgLJg/hrbZY2DBqEm41J+R8i4PbKD1syv8U0dp3Kafmhh+cBdl2tts+O6BCEgZc57/MBaCZhUsZo5U+ksUgCiZMnBIuaeAgYXCpie7lJovo1xI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759850349; c=relaxed/simple;
	bh=4VK+6f/+RdO0eR4JCElKzBTYbc3kOZh1x6FtXSJ2Ic4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VWGe+6iSafMs3UCZPhKaAiyagoeo9rzi4g5VXHPSbKd5peDZhQAoEHsljGanZfMf/gvqn0FArrrk1VEIIhaus6boT6vh9g88/IJy8Bl4TJ16ewOSWc2i+HJLBdP28p4YBqxlwaM8G5616RaMYmkAx3nrLE/jW6tR2fWAGAwp7OE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oa5rpOgd; arc=fail smtp.client-ip=52.101.46.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oa5rpOgd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VWxUGeL8KSEUMlLAgghnLDqL5vtf8hxUGooSeARIRHV3u4JF4rZBc2pyLKsUy1Met6JFw1iH6uyxnrRmXMflfLJ00rib8CzQ08y5k+FSCXVIsGfuTQPelJmrmc86c2atqXZmnaR6mQKWXW/a01+aBSIr/eQGoChD/kqTdbKSuyYRWej641EE7JMTcuSYgiqArSm8LMyfaHmp7X8/ZfjlhZyLY/F5WBY9FPowyKGslxt+un7e6khK/TdLuFbe+BnLptI1glyoPMO0+g9c9oC33qSQ7lyhsIhi/B6+/ghIV2eYiP9ZgRMfWzlEJNVq+Y3gEqC5oh0MmT1K2h7ki3qT2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9bpMbOt2QZcivwxpQnb60o00Bb2wf/YgvINMX2AXwo=;
 b=uknfPt9ss1LsT0NCQtx3QwQd3u+FTL3OPQxo8DOS3Rdm3LN+oYdhAAD5SOMHLcof+0PpXjONzITU25BnDdaYqryqzRCNSdyswDoAXafpCZ15VFMKWaeDSttEt+Aq6oGZ4ejrQkSxd3Ei/h8RY8OZ0ACPevNggVAf+0m2ZYDDa/FiDgqq0VM2fv/KqLZFQwiPUZeLGk76oNZjqPzhGFS/DR/i92cCzisojFPgPj7BmS9JrvVbt03irNhQmLMunvKZ34UsGjJ2N77AcHA/OSmttHaTPVUzRf/I7Tz/arw9ji+sBFPlgt/p6b+Yd67q50/Mw9xcCV5w0WYC4I9EVgWR5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9bpMbOt2QZcivwxpQnb60o00Bb2wf/YgvINMX2AXwo=;
 b=oa5rpOgdzSVs3D3Nco/GIx4eaevTA5GigTDhkBAglhwcCSh1cUwuDeRZA/aGrNRWOrEUmDDw/dGJMI/d11TBamvTGMV8T/TaYNPrDdFcGQz3p5a4tI/KS0+2qoKJvcne8fs09X9L1ZWhKinTMh4irgLo70a7sxvztsf6ujyix7Q=
Received: from BYAPR08CA0026.namprd08.prod.outlook.com (2603:10b6:a03:100::39)
 by CY8PR12MB7266.namprd12.prod.outlook.com (2603:10b6:930:56::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 15:19:00 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:100:cafe::c4) by BYAPR08CA0026.outlook.office365.com
 (2603:10b6:a03:100::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Tue,
 7 Oct 2025 15:19:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Tue, 7 Oct 2025 15:19:00 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 7 Oct
 2025 08:18:59 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 7 Oct
 2025 08:18:58 -0700
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 7 Oct 2025 08:18:58 -0700
From: Tanmay Shah <tanmay.shah@amd.com>
To: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH v2 2/2] remoteproc: xlnx: do not kick if mbox queue is full
Date: Tue, 7 Oct 2025 08:18:28 -0700
Message-ID: <20251007151828.1527105-3-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007151828.1527105-1-tanmay.shah@amd.com>
References: <20251007151828.1527105-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|CY8PR12MB7266:EE_
X-MS-Office365-Filtering-Correlation-Id: 23ab3cd5-a1ab-433b-ed01-08de05b4d7a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oErimFbyEfjSWH1LqBPgZDQxmDa9tjAjyhCKXDOYcuwDb4DAohLGBYyu/IbT?=
 =?us-ascii?Q?PxLstq2z4DJpi5uHlzPrXmjQsKfXxrONSb0CiZGz6aLOStoJ4e+gjLM+vLR7?=
 =?us-ascii?Q?m4kezRCuOPwU10KXJLrMN41iCPJSQOJ081aHwppL8ty56ZvhhsqeBTl5lzZ6?=
 =?us-ascii?Q?Grm+QD+rFjwE/NDsI08ce689MuWhyFOLOPxrTCqlycBbHJi8i6xAzunyTkKX?=
 =?us-ascii?Q?zM3wkYfVFQJ35KbDNU+ApNYckPRUPYTN/v+yyFwSix2N/3YqF8O6ibSj94T4?=
 =?us-ascii?Q?av2fuRyP8PPMs2rU5sjrz+mLptK9WczCDBlAPR8ZxJzVoZe6N3Nn8L1u1oIH?=
 =?us-ascii?Q?e1p6ROAhgrZWuXwcvnPKNebqm/HTF6nR78Qu5qofHQAIImKhBibMY3zdArqL?=
 =?us-ascii?Q?xS1QT8MwAp7j7ExiPHXEYnJxXSFUxO3omZWuxw3u5JPWgbEhiAt71aqh3gdj?=
 =?us-ascii?Q?WUCVq77d+IztEq719UyULTjnHRzWuhJiOsHzs1CvsQkxg/2bfivCsKHW7OLq?=
 =?us-ascii?Q?gsd72bmCEUoxFA5Cfc49DZesoXfaAfRp8YCTPZBPVskKzqWwz5SJhddg2/pn?=
 =?us-ascii?Q?yIvcqdLD7pcYjsVHhK7RZ1IWCsSEK/3dR4Hb9KAKzR7oCTBcFjtHZdfJkq+O?=
 =?us-ascii?Q?+khs1PJD1CQOLamVwQ6EIaoDDLcuIT383Y4wK1Qa6owfMJGdcLvY3T5hrI4D?=
 =?us-ascii?Q?j8tPtfn9hQJkADJHZXjgM4MnkLarK0IIACdYAwuvWgb44EBc57KbZlLcrRNY?=
 =?us-ascii?Q?3oTrmelbYtfSia/OW10rx8KXuHQQSJSK2MP1bTzjv45j8FeXAyqPFyWAd7H+?=
 =?us-ascii?Q?pr450BVKd4Hby5Gk1lfUoHTWCn6G1R9wsti7t1AmjfAq6Ww5NEm8z4RpsjFz?=
 =?us-ascii?Q?5XU+CuW+Ifd8b18u1+lSSlQDMHauL1RoVqaELnsyjk7Ls2mASZ2iLunX2HwY?=
 =?us-ascii?Q?LAiiwKO32xWLA+ozWcWlbvy3N7jS0E4k/MXLzsHu/GMoMbKiNPjkcm9UasS0?=
 =?us-ascii?Q?Y5705O+HnSdxu/m7PE3SaTcnLP0Y4P0EsnmhIIez/g2OUt3Yuznq19cSSIqd?=
 =?us-ascii?Q?uFBM7ctGU0kZy28dkb9v1OHw+qqpc3H9uKNuB3+zlhQL8ov3fWq2OB/ZAEqQ?=
 =?us-ascii?Q?/r75byq0nLbg4zlGeqDEV9tj18Bj5/xiNN2/219QMVdRPUP1i51FNa2+wxbB?=
 =?us-ascii?Q?7o9hJaWGqr9U2T705Wl0Shj4pVBQhtHsFWUb6mCczR3E3GTsYAls4Mu5CbY9?=
 =?us-ascii?Q?T23Q93EUg9kxCiDzA4uTfCiB6wuMwDPUJ+hgsF/PTJul199P1wlnhC/WQPmW?=
 =?us-ascii?Q?AE65Y1pdLf5Nf2Olr/bO5UL5a3iMQchRNfFUqujg2ns09Z9G3tI7HI6fvrKW?=
 =?us-ascii?Q?EeBXDO64Z2S6A9+j8gC6ZgZMojO4Xdy7oiM1OVsioagsDMdgxCF+TFa1Ceqk?=
 =?us-ascii?Q?yHwAG+OIYBJC5hl4jlChPpC1931abID8wLYaXAxI02r3tYspd/0l91f9jFPv?=
 =?us-ascii?Q?5FvfHxGO/dhsVQB93b/u1jT+hw9olo8Oml87SwASissfzYWtQ7eSD9DhAJ4T?=
 =?us-ascii?Q?o9/vMxmTlIm+MHAbe/8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 15:19:00.2334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ab3cd5-a1ab-433b-ed01-08de05b4d7a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7266

If MBOX_TX_QUEUE_LEN number of kicks are pending, then no need to keep
doing more kicks because it will fail anyway. Preventing further kicks
is needed because it avoids printing false positive warning messages
from mailbox framework. Functionally nothing changes from RPMsg or
remoteproc point of view.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

v2:
  - Use msg_slot_ro to know if single slot is available in msg queue or not.
 drivers/remoteproc/xlnx_r5_remoteproc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 0b7b173d0d26..d589f31f45b9 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -9,6 +9,7 @@
 #include <linux/firmware/xlnx-zynqmp.h>
 #include <linux/kernel.h>
 #include <linux/mailbox_client.h>
+#include <linux/mailbox_controller.h>
 #include <linux/mailbox/zynqmp-ipi-message.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
@@ -335,6 +336,10 @@ static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
 	if (!ipi)
 		return;
 
+	/* Do not need new kick as already many kicks are pending. */
+	if (ipi->tx_chan->msg_slot_ro == 0)
+		return;
+
 	mb_msg = (struct zynqmp_ipi_message *)ipi->tx_mc_buf;
 	memcpy(mb_msg->data, &vqid, sizeof(vqid));
 	mb_msg->len = sizeof(vqid);
-- 
2.34.1

