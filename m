Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011047.outbound.protection.outlook.com [52.101.62.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A09240FD8F;
	Fri,  8 May 2026 17:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778262022; cv=fail; b=TRbEofihKjHrRovOHlUDMwWGEeFPv64L5kVaPIGaLKgaxvJu5GO0qJPGh4uqCn9GqwgDvNlBMxxLQ3XS1v0Zo5Y5HRhU0Q3ASmaJ5DEMgaTJxTW7gsZw2/rJglUtZjc4+uVkolJ6Z6zAR+fuStdNCjsCLu66julWdQuO9KjVUJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778262022; c=relaxed/simple;
	bh=Y6Zg6UjnooUsLUeAapumwDmmDmI0/s7yxQ4pEwh74gs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KjBaAdczGnVw4qssq8iv3VelwObSsK4oSYljkLGEwS8ChmyT9zbHvWuDyoTX+uZwmi4BQ4iRJPOYNsJf1kwOUNhbuh2gHY2JMuoauqNyVBjv5WT925IOe98JJEqfq/kucwljZiC01KZyl/fMmjfn/Z5psp5P1Tq+dVoo+Ldtt7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Qno378cK; arc=fail smtp.client-ip=52.101.62.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Qno378cK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gl2/FIaoONTSrBuzVAfQfkTtj00GkEhBbR1XS88RoeFgGiCOP25Os36opsAY7yovf1iW3AqKrUZli1TBdLnXyh9n6Nkwrevr7RV9Q8CIhp4DOiVxujn2QvrHJDq6fWZ6uSDMZjPzj39mLFzcRDVR6EWshxTkiNpx0scUu2kZvAiZ6Sh6jJSyhldj6oIIqMQJW5G8vzrOao8JN4Gz1bDmYXgs2jBaEWfPco7371SrI23LT+uWLjelT3Pc+N7t2rMHkhlyxOCVi/dDGbHMn7gbfxeeYTytb09099xll6PMFBY563ZfFs8Dz9kKoV9luhDlhjggNLcSVGERZIOOSQ8QCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJNxnryF0wGYYU7t5MS9woiB76MagdgVjaT0itjnwLo=;
 b=PUNSAeYhMchCqWMHJastdcc7dXMRNi6WvipvVsI666bZhpf1oKtr2Bc4j2y6vx5PAa7zDLFOVgbUPj9UPfrjz+ujahTbw58/y2oEhEZoluZRH/6u4riYTevjohfe9WMkZBeL4T4fpBZhwBT84IbKqK4vcoOcSFzNx82o3xMiWB++N/sZkLcztZCzgfTdS6NCDFVwu+gj6h8ZFujiFTDHIMq80UsDyHlf7dMkyyg+wjIhfTxkw7hUr+gLM8zQ1MQ6RKjD2ddgaig/wIUZ7xAiNg6QELC2wn5Ktwha/0UWPvwF6tDl9Wo2KQV9Q0Rb0njNgU9oUvbS/JiX36SZaX2xRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJNxnryF0wGYYU7t5MS9woiB76MagdgVjaT0itjnwLo=;
 b=Qno378cKUm5+KAPS/QRMCeWEnHt7UzY/7Pr8BlSYGJBDDswrTH8gcPGMNadVzoxYRGB2GvWHhOzv9ZX6lmD3WMu8y1MMoqODw/63CPwpflh/3w71kTUbV8ELHLDIvRKJJGygvY1EOgoqVel0JhSjXOyhxY3VQ2VTVaotHOXOMuw=
Received: from BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::17)
 by DS7PR12MB5839.namprd12.prod.outlook.com (2603:10b6:8:7a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Fri, 8 May
 2026 17:40:17 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::ca) by BY1P220CA0013.outlook.office365.com
 (2603:10b6:a03:59d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.20 via Frontend Transport; Fri,
 8 May 2026 17:40:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.8 via Frontend Transport; Fri, 8 May 2026 17:40:16 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 8 May
 2026 12:40:14 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 8 May 2026 12:40:14 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH] remoteproc: xlnx: remove binding header dependency
Date: Fri, 8 May 2026 10:40:06 -0700
Message-ID: <20260508174006.3783082-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|DS7PR12MB5839:EE_
X-MS-Office365-Filtering-Correlation-Id: 5278f238-f35f-484b-fffc-08dead28dded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	s5yjquK1G3znu4K7wonJD0YVTeYabDD0Huxh3b1dqjtDgUB+cJwedLMliVB86KkncHRYZ/zpAGnSJQLMkfCN5iGA8uq5dsmo+4C/Ow1Bx5kkgiPiJ9elkW5PzI3E26JwITrFv8qBHYGbRUa4D5wIGC1APLYMawo6Kh/1sO5Xn5hgqFgeG94viur5zRMrHWrNSnkj3EIdNwqbOpP9zS84CwY7ZC24sj5sP0jdvPTDtb8fh7o8U8qoP4cmkYf+E8LeKRC8VIPlL19c7Gl9b+XmxS81bRkgkoNOPrR5UOpjfTEYM3Ak7M9rwDZzyX1gR0+mdL+D2dF2h2vBaRghgIic7fnTKFPAC+8SqYysONMiCQxvVjW+FyJrvusDh0TU0TBaMpdRVKonn5hLc9QpMSRNn/fRp+Rk4oUh7obzDwLa40eDrAhDGBIXjXiKRyMk+EA21D1d76zhLr8MhqZqXnSfhls8LdovapzPkIQeta+baZXt1xoqWRnegnqpzyttA83ZUDQ0klM8B2+qSfJh6H/kcJ63VeuzpebJvueFEWQBTzKT9LRsBaeV5271VDU74R6WXIFA+L0kEjPanP1smr40tPM0rJ6daatZUotsTFU4I6SIwTHBT7+i21ASlLsssD/ptFC1zoyVlIm6jRQVEg+wXcuOGE0I9Easb+/NyklhGeC+KE0ffNYOoWYpw0nNEcPt+tdwgNupJwKr9O29Je/KqlVJRW1ohlRvi95qmcZeGPY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	t/51HWiob+AtHE0x/umvJ3IK87P+S4AgNk38R1UNArwlKajwtde96ruTmjYA8bSYtHl1B2S81pjbxT4d2hSvTwBqrVa+rIvy3vwIpWrPX88psSWlT/pBB1xOlbr0S6fCWmGkdBkgiKXJ9BPPXeXWxr2liiO2ovtMARoKyfryEwiT3AYtGkqvLn6Dfn7FAYwvSxJ1MAMy1D+KwYnsIxd86lqB+jOvL5IRllJX8HnjhqaRDHYe9LMn8HaROWcf/pR1m37nwPDUDGrUNYWiqpff3aMDrBxKz9hzsY6KVy7J1LVVVtRETvfNZTXdkxEQ5aV9kDbnOMQzay2wDkWeBUXXPMlFWI9tVY89YEYWi415IJ/5QBp+QYuNfOq1ZsP/Kdz8Nto4FKigtkumxhJODogCAoiJTT+hUuJ0os4Qzx44WAmry9SiCo9Y47g8KftAt075
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 17:40:16.5743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5278f238-f35f-484b-fffc-08dead28dded
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5839

Bindings can be deprecated and driver should not include bindings
headers directly. Instead define needed constants in the driver.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 45a62cb98072..f5b736fa3cb4 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -4,7 +4,6 @@
  *
  */
 
-#include <dt-bindings/power/xlnx-zynqmp-power.h>
 #include <linux/dma-mapping.h>
 #include <linux/firmware/xlnx-zynqmp.h>
 #include <linux/kernel.h>
@@ -19,6 +18,11 @@
 
 #include "remoteproc_internal.h"
 
+#define		PD_R5_0_ATCM	15
+#define		PD_R5_0_BTCM	16
+#define		PD_R5_1_ATCM	17
+#define		PD_R5_1_BTCM	18
+
 /* IPI buffer MAX length */
 #define IPI_BUF_LEN_MAX	32U
 

base-commit: 54dacf6efe7196c1cd8ae4b5c691579d0510a8bd
-- 
2.34.1

