Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012052.outbound.protection.outlook.com [40.107.209.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E83375F62;
	Tue,  3 Mar 2026 23:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772581910; cv=fail; b=PXdhkDNI+tJD42aku1fWxv4RuPNmERd556A7W+oPgaeKEGhM3UMLP9HibaYFjk6SzNNJIlVAf7gFLtG9QNNABN9pU63nOzAz2eVcUPqCSMcPUTWnNeAoB/LAfeFZ1dqtgmxuBDA8z8ol7nuxgQv7/recwe6Tc6BjCKA2llCnvR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772581910; c=relaxed/simple;
	bh=SxwNbCXaTtDJT2HfcenHy7o53DqXwipljapq/MG5oLY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mGUaNXv6AKFXohnBz29Ktz88AAO+ozYxWeLqA9Pp7qX6u+Z5fUCMJxymM/ZWdjEPwiXwWmMti1B6h2EpNGvRv/ktBlZTwKDBrHDOMDfBpM4Uss8mYcvT46sesBaWVB1bQBf2NsnLCuzJWZUgcWyJ+wmzpLaahFzuSsBtnA2YNdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RAM1SxCo; arc=fail smtp.client-ip=40.107.209.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RAM1SxCo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQx+eU685nmOkTw/IYnx94cf1pTmLQLIv61GExfRPvB5jIEkb1VedMus2RVRwWo0lxULgvg5vldbsJvEti3soQDi2+voSDoAR+Firjvce+Uo+qP4oez3r36X3ri15Y08W37UfkRcLpnkpqcm+/3CiGtvV6x9nbcoR318xzGAeCNeAm05WdOoLEFHurjaj/gGOCxaLxtws+1xODxGlIfcPOX1NnZWwPSQ79ZrEaENOYw1vZXv0FaeN4pU0gqhGHSQ4kxtUcPzTX+VmcN2Fx8WOoA2tDpercaSQSTMWZD/0LQQwJ3SvY1DweaXUDghGSpbjD+DHpxsimt0Zs0eXDKLBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/Bg3sI+EOnjf/up654jH5xwTeavBwTU1L4zoC4C+EE=;
 b=GdxIqZD8STWKmhiKIvO2qQMPl9bs1BE5pwDEViLvp6G78n5zp/7pjRO091znQ9KC963qQ0h47B5rz/2XqgnlGvxHj7X1I02uy95D+YBjxWWU0b72pIDyiZVCT7c2zXg9c2JiDDTNbaYyXvIXzqM3KCfwbjsthqa2+BxDpBUxFZrB2Dz2k+1kcag62bHJSsjz89x5I2ZDNtwlQhazJ4eqKWqgsuWbG9yAQT/v8B456KuxbZaybnWd9Lsca+BRLlOa81L/up8o/jW9sAucJakMbtTme+9WOJZ9acQr4tqjvw0VIMohw6R3HYpaxVHsqhAlLhppSm0EdvLM9ioapzFoQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/Bg3sI+EOnjf/up654jH5xwTeavBwTU1L4zoC4C+EE=;
 b=RAM1SxCotC3dd2hDNEDrh1R00v16Vxeb6I8wHYw1Ml9iJJjC0BXFRYJ5elXO4r2l/v+QcnXXmaHb7547cOKFiNkIFW2BA/dwhKMoaE8AQgjFZbbWNpvztLVqv/JdDI3BEYJuzpm997lgLCzsb+gZQneAjPajfpUf6cT7yQYQqRw=
Received: from CH0PR04CA0014.namprd04.prod.outlook.com (2603:10b6:610:76::19)
 by PH7PR12MB7139.namprd12.prod.outlook.com (2603:10b6:510:1ef::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 23:51:45 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::21) by CH0PR04CA0014.outlook.office365.com
 (2603:10b6:610:76::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend
 Transport; Tue, 3 Mar 2026 23:51:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 23:51:44 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Mar
 2026 17:51:44 -0600
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 3 Mar 2026 17:51:44 -0600
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Ben
 Levinsky" <ben.levinsky@amd.com>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH 2/3] remoteproc: xlnx: Only access buffer information if IPI is buffered
Date: Tue, 3 Mar 2026 15:51:27 -0800
Message-ID: <20260303235127.2317955-3-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303235127.2317955-1-tanmay.shah@amd.com>
References: <20260303235127.2317955-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|PH7PR12MB7139:EE_
X-MS-Office365-Filtering-Correlation-Id: b90901e5-72a9-4d15-6160-08de797fd387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014;
X-Microsoft-Antispam-Message-Info:
	tDkOmqom+FgFyl/ax2+K1VYNdzNctxYzLThhOnO+xdVjcDUjimmTvPia7pz/m1iI6uuYnPXqjOl4j4x0aXgxfxAIWSr/jXrEQiBVHpHXnCSnfWTErT+hmtFjHDAYSrdohAs6nS7HgWW9+E86+YumsP/pvCoKJDoI3Mqbz502q2xYt0wHgXFlJDs6zdi1kqIVFVsfrPhTE9KlarURxBK7JSdTLFRPwGcL0+xQFMS5/eeHGgnTxzaksgKhaSgJLU35ChQw50eO186VdmoAUj2kGBRZlmR3QKlYtEHiwULsiKF24wN8T8a2m2MaF98Yz2uJpxlsUUwnucN/PrC8t7X4BdoY/8yCL9KNnZVxMW2P0/kIjrkzv2TvsHdbmC0DVI+72j09o7ISZ9fn63pTMBqlAWxwcV0R2sm6GgP08WTR1JqgSKStnRn3pH11N1edq+2xheKVGP2gM+oRVLgxWS0Z3DE+Ekk0VGAJiF4z8vLzRdSA7m4f2pLUhRrMPvUKk9Wn60zdLgczRaKFWpul0xPVNm7ZKq/Cjuock602lFOBEDXKg2Q4Xi1ZOLLRpywbJsF6hpRegHvO8DWH0rqOKpLgHMqIldEcHk7G69u1pGxa+cdLFdJDkEpircES0nL/5FkGqt48flT/R9Cgzq/WSWMTDc1X/9ELkPTX6TTOb+wtzG1WiRj6fvnsXWDIwtoSMntXgQz5HekdJj8Kn7JkRHulzUAPanHZVtGvN0bQ7ItYg8MaMPfdDP/dHBxBhkY3jlqWmRbXt9BevOwY0AkOV+WKpg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Pwpvzh6PZuwm2fEilNntHcict5QAjv/WXBoR3zZtg0ZB6AUks+46jxMsUq/5fBeGiPxoSRwOLb903SdfYx+x7IrsZzmT3ujTwrOjsuUMQ9EaFA2AgRgOrMhR0koMInJHXkmow8urx5DDrdluw+9vkFEjy6FLdUFR27y+YbLeem08VSXnWpmN7gkWaLoxcjchGWgJqs8BUtfD8DRNuj3NpPBVPYqjuoXmijuorbTJevaJiwb5bXwzEsqEvwtgBVqQ/Yi1h/4v6al5as3zrUPkW/tz2uFAAJXbxwkplbfJBn0WGavX6BNzuDYIw4eTXNbpGiPL66aXCnVq+5mdJPcGu4NkCAupPYC3KpEOea+bYOVhCI0r3cXpu2rfoNWyBjeVXm1k8glIICRPrry2nj+KbyPT9Y+z8dUZKfriHSN98TdGA5V4aL+3hUGzeazJ4/UY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 23:51:44.9330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b90901e5-72a9-4d15-6160-08de797fd387
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7139

From: Ben Levinsky <ben.levinsky@amd.com>

In the receive callback check if message is NULL to prevent
possibility of crash by NULL pointer dereferencing.

Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 148d8c622566..5e92dc51f1c0 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -232,17 +232,19 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
 
 	ipi = container_of(cl, struct mbox_info, mbox_cl);
 
-	/* copy data from ipi buffer to r5_core */
+	/* copy data from ipi buffer to r5_core if IPI is buffered. */
 	ipi_msg = (struct zynqmp_ipi_message *)msg;
-	buf_msg = (struct zynqmp_ipi_message *)ipi->rx_mc_buf;
-	len = ipi_msg->len;
-	if (len > IPI_BUF_LEN_MAX) {
-		dev_warn(cl->dev, "msg size exceeded than %d\n",
-			 IPI_BUF_LEN_MAX);
-		len = IPI_BUF_LEN_MAX;
+	if (ipi_msg) {
+		buf_msg = (struct zynqmp_ipi_message *)ipi->rx_mc_buf;
+		len = ipi_msg->len;
+		if (len > IPI_BUF_LEN_MAX) {
+			dev_warn(cl->dev, "msg size exceeded than %d\n",
+				 IPI_BUF_LEN_MAX);
+			len = IPI_BUF_LEN_MAX;
+		}
+		buf_msg->len = len;
+		memcpy(buf_msg->data, ipi_msg->data, len);
 	}
-	buf_msg->len = len;
-	memcpy(buf_msg->data, ipi_msg->data, len);
 
 	/* received and processed interrupt ack */
 	if (mbox_send_message(ipi->rx_chan, NULL) < 0)
-- 
2.34.1

