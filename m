Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6B82EBBAD;
	Wed, 16 Jul 2025 21:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752701474; cv=fail; b=X1vPjfsT3kZ9TEMRzU2b3VvjqYNQ0OTJmC6gWmRuJHMnRdINbpZ9vDq6Cd8Knl1KuxBj6umclfYYpRdT21E9tGP2GJI9L8+Q249XI8dtQAV/jzvpDQpQZ8Nz7qpu/PSnO0r8jLbp3iE2oWpFD3LY0HCdoEoF6iNxRK2s6+jd2/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752701474; c=relaxed/simple;
	bh=vIgdEIWKvTKKWMTl3L9tM+nDKlxRWTOPotdcSUyTkJg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VTcNtr3rNkZBmSyat3M8ty2amr2XGiHN6bSHo2gE4HiHLdenHa6qHx2axoTzbNqAFN8X2LlWF0Y0NQstl5ACUPKenwx8sUJKbLcojd8CWqLp+bYuc4oIh8tZq36zWvew2Ww0SFtRbbhOi27TCtuIBs0hRoywa5PyQjiqbkTBOac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=T37rnz3V; arc=fail smtp.client-ip=40.107.243.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="T37rnz3V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DHdfcFJEE8LVYI9nhO43Sh1nIEHsoYChxwBl/0crU0slVU8+PXVQNjw6LTyev5bz6M4QLl2S1BMkbGLAtFAZmuaEZ1+TciGjwQE7CElprKKSlbOH3JJXu35XnSUU3mfpOIKdLtNi+8ubsbYwWfhCKoaThLaLWSW2QJIml8MbBm/Sg+205OyLnP79GAJQNa1JtugSXSSuMb8S4/bbZ4LTcXW7w18fWSHdv/X6ZK2Rx2keGHa3gifeLiU6YuqqlQKw5Xkp7+bsM5tQA+EEkipHZYl9okbCih593EdVpqNhQdEp3NFLMbm8LnmExDFY5u5IFKR3vqK428Qa8vstMZaKKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymJElQutUjagmrMtZQg0OsZKLJU7/cM/BDD2n+WyQNA=;
 b=L9UoyhW/3VmlKIQY6jbR1V05ZANSFmVitKfrysTzP/JBL47bWs4sKWGo2YGp3DrZzIGwH1j366EUih9eeLlGilJLCXUCs7kLGWxgEUplnsqZTIlZLlk2piZ+NGeWAnKpnuI//6lICl8v9JtuIFbcbqAWW+p7T5baXdyu4Kg6JpH/ewjpLsg4rfU7ADngsGKCIDGs/AI52mFvNBn6yXs4+1RY7BqqtmkU8TellhV3+v9oY3EkhB/0GCbBdCL5HUUcOq6VgqP4pVJ0LV83EVNN9Oe9/0QqVnls0Q0WBGXXMMFZf3+NXR/7WLqaSIuNfuwGgtQ1mnAiXhseiWAcLsF0cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymJElQutUjagmrMtZQg0OsZKLJU7/cM/BDD2n+WyQNA=;
 b=T37rnz3VdQ3cWaYh49A/B/gEz595yZZWgALpGo3qWm/4aD7DYl4ltNIMLJyJhk7dwUgjLwZTrwnAghaZHRQJosDWiJvAQ3lHV73HRK3HLyxVKjdcXsMGmQNAkp1MPJcEPanMc1HQTtmq1GoHWLXgaZPWqP4S5ewfaOBQzkkwYoY=
Received: from BY5PR03CA0026.namprd03.prod.outlook.com (2603:10b6:a03:1e0::36)
 by SJ0PR12MB5676.namprd12.prod.outlook.com (2603:10b6:a03:42e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Wed, 16 Jul
 2025 21:31:09 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::5f) by BY5PR03CA0026.outlook.office365.com
 (2603:10b6:a03:1e0::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.19 via Frontend Transport; Wed,
 16 Jul 2025 21:31:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 16 Jul 2025 21:31:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:31:09 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 16:31:08 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH 2/2] remoteproc: xlnx: fix kernel-doc warnings
Date: Wed, 16 Jul 2025 14:30:48 -0700
Message-ID: <20250716213048.2316424-3-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716213048.2316424-1-tanmay.shah@amd.com>
References: <20250716213048.2316424-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: tanmay.shah@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|SJ0PR12MB5676:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ed5daa0-f629-466c-dcce-08ddc4b014b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ERITisq5upUO3aL1UJWgJlo5IECqeSE9/HzEPyTZ0/ld/O9H44DxzOILJthn?=
 =?us-ascii?Q?Em5fHlUCGpAFm505M1/9u8UhrsQChVunzMXzyigFYmN3BsL3LmcH5fgX66hm?=
 =?us-ascii?Q?4IvhQD51J4hxy97tfzLUeCo935yDsVs8D/VEfJNyYSIp6zgzpV2mqaqNY2bj?=
 =?us-ascii?Q?bflgW5aQOLdzuE5EpCvkhkSTyOm3CwpNHNSx8vpQG5pLhd89PQmBiekgTVQG?=
 =?us-ascii?Q?RlLUfnAKBIWzNJfySykAEz7FT9q3F8ki2CVkjXgJ34ETBy7dUpPovOISvTkS?=
 =?us-ascii?Q?x99+9qkBiy/piu7IDE5RrOAKqc3aZECAXJxBaf/4MoI40n+Ba9U/FHjAFhJY?=
 =?us-ascii?Q?OL7ioCzmDgDrakbEBlsniH6W7RetnHiEEDeA9aT7c3Sxctb87aMpmkMsekVx?=
 =?us-ascii?Q?coGItXiqTrpZYc1MrTQUVzhsJxLgNiAgHiPTFr95kF93utaDzuNxdODPelCo?=
 =?us-ascii?Q?kgPSA+KlWTjTzbAqALw4zPz9vLiE2MCyxqNRLBX5x/TTq+oZ0F9VfXZvGJzA?=
 =?us-ascii?Q?LvjE4wnhQ1ZeNO230xLuM7W7xJgLNyTM2okr+nfzHpvFNS0c02yEMp09VKXn?=
 =?us-ascii?Q?g3v9F6s3V2b7UEggMptzEa1qGqGR5bDSa9mOGsZ9noXHs4F6VNqrzJiozPj1?=
 =?us-ascii?Q?hw3k30nHO+lzEB7I3QT7byrEYKg5H58Ye2Wk+4n3rdgk8QSlqoHhRe/U4Lmy?=
 =?us-ascii?Q?qOJcArBvixaigjLv9jFoqX95Y2SM7jmSqLKFnnsyioYOCahCvVY03l2ZQ0rR?=
 =?us-ascii?Q?W8485nnszsYxYgTUvE74cxptzVLn4LYlTzquLa6uC/SKCyzeKZhL8lfrqSTZ?=
 =?us-ascii?Q?74TxaBhtYw7Z/DYwH+8+5Gv0JWg2jyDXwdIErY8VUpmr4WuTn8ocSZsc2Sv8?=
 =?us-ascii?Q?ZblVtCVPpPnuiQgpq+7UfOtCvP0JNiif3keoBWIf+LFNYsku3RM6OWbqrS2o?=
 =?us-ascii?Q?OhSXTqGm9N8AZhFkvdz1lvUs5KNQRXInN/i92RwHF2xtVXXE7BbJQYnXFM68?=
 =?us-ascii?Q?EqJa1yVSM8WslPDlPJJqJh8nMoeCklCx7mSutyTHhuCmHYSmnoQM+bzXvFNk?=
 =?us-ascii?Q?4P7f0Lng84PYjjPVLP1TJ7McIF2V/75SFAETmYoWLgWrW2fByN0k/z1oLp2X?=
 =?us-ascii?Q?puNCqNsof/xm31eTfjirMQpN6y1/0ZzqEh67MAhZSoTdFezlIh25zdDdW6/W?=
 =?us-ascii?Q?Z/lNYoHwpjL0T8QNjJVCJGTv1JgK9uS4RXppXVDXoUOdqVD7WIHXE6S7ItAv?=
 =?us-ascii?Q?4dfX1kzZxuMpHghvr9j8sM95THyl5OCebph2hUO+HNnEPq7LmUNRSQC1W+wb?=
 =?us-ascii?Q?1a3q8RLYqnrebgAgG26DwxcmF/ChRlmH/tXBS+cfzFka/I87Y5L/lhCtQRRW?=
 =?us-ascii?Q?3bz3rtu4FK50IlBhiIE5GaEXx699OE+/JgrVFdAG9O/r8nUyRiCBq01GwmnU?=
 =?us-ascii?Q?+SeiNH0GAz0x2mBS4AKvBzGAimU10hNCBhsBbG0iX6pE3/FYsp92raK8pjNd?=
 =?us-ascii?Q?UJfkIFXhdFuuC4jb9a6FogrdGvOkHC9QTEOc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 21:31:09.6141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed5daa0-f629-466c-dcce-08ddc4b014b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5676

Fix kernel-doc warnings generated by following command:

`scripts/kernel-doc -Werror -Wshort-desc -Wall \
drivers/remoteproc/xlnx_r5_remoteproc.c > /dev/null`

warning: missing initial short description on line:
 * struct mbox_info

...

Total 8 warnings fixed

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 0ffd26a47685..0b7b173d0d26 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -68,7 +68,7 @@ struct zynqmp_sram_bank {
 };
 
 /**
- * struct mbox_info
+ * struct mbox_info - mailbox channel data
  *
  * @rx_mc_buf: to copy data from mailbox rx channel
  * @tx_mc_buf: to copy data to mailbox tx channel
@@ -89,7 +89,7 @@ struct mbox_info {
 };
 
 /**
- * struct rsc_tbl_data
+ * struct rsc_tbl_data - resource table metadata
  *
  * Platform specific data structure used to sync resource table address.
  * It's important to maintain order and size of each field on remote side.
@@ -128,7 +128,7 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
 };
 
 /**
- * struct zynqmp_r5_core
+ * struct zynqmp_r5_core - remoteproc core's internal data
  *
  * @rsc_tbl_va: resource table virtual address
  * @sram: Array of sram memories assigned to this core
@@ -157,7 +157,7 @@ struct zynqmp_r5_core {
 };
 
 /**
- * struct zynqmp_r5_cluster
+ * struct zynqmp_r5_cluster - remoteproc cluster's internal data
  *
  * @dev: r5f subsystem cluster device node
  * @mode: cluster mode of type zynqmp_r5_cluster_mode
@@ -732,7 +732,7 @@ static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmware *fw)
 }
 
 /**
- * zynqmp_r5_rproc_prepare()
+ * zynqmp_r5_rproc_prepare() - prepare core to boot/attach
  * adds carveouts for TCM bank and reserved memory regions
  *
  * @rproc: Device node of each rproc
@@ -765,7 +765,7 @@ static int zynqmp_r5_rproc_prepare(struct rproc *rproc)
 }
 
 /**
- * zynqmp_r5_rproc_unprepare()
+ * zynqmp_r5_rproc_unprepare() - programming sequence after stop/detach.
  * Turns off TCM banks using power-domain id
  *
  * @rproc: Device node of each rproc
@@ -908,7 +908,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
 };
 
 /**
- * zynqmp_r5_add_rproc_core()
+ * zynqmp_r5_add_rproc_core() - Add core data to framework.
  * Allocate and add struct rproc object for each r5f core
  * This is called for each individual r5f core
  *
@@ -1144,7 +1144,7 @@ static int zynqmp_r5_get_tcm_node_from_dt(struct zynqmp_r5_cluster *cluster)
 }
 
 /**
- * zynqmp_r5_get_tcm_node()
+ * zynqmp_r5_get_tcm_node() - Get TCM info
  * Ideally this function should parse tcm node and store information
  * in r5_core instance. For now, Hardcoded TCM information is used.
  * This approach is used as TCM bindings for system-dt is being developed
-- 
2.34.1

