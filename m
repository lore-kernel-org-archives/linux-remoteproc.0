Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011025.outbound.protection.outlook.com [40.107.208.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A523A168E;
	Wed, 14 Oct 2026 21:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013676; cv=fail; b=eCsYugYyPcGe7ecs+gsuFXBbi2jOvJZMnNCkaRfP1P2jdDyz5V/VtfD/eun7SFQI/kU+8DhciMjj2rn5+U+nobxyACefVdS2uzyfkBCkImFU68xzQRDA8tVUlBs+UXFeiAvW0L2WzCgz1CzYDRKbXiEPYXMtYC72btEzrZqSxQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013676; c=relaxed/simple;
	bh=S7pOluUz6oZbh+XewQL+ALuFRPonnERPQn5Nv7s9yN0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZrRKy+f/ViHwnWk2Pkerk5c9x7ghKTxhHMeCfJ9etN52MNTPTZrdmUWSevfRC5kw2uAK30EyFpITKit0tpqlhAu/9nbASptWJ11dui/V9aS8F/jLt8GdNZdIWjCKpRAF/MRfLjJHN+hxBCat2a8f2MfATfPOwNquhWB28tkmTF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZLn6IB6L; arc=fail smtp.client-ip=40.107.208.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZLn6IB6L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6/YPMQJZgcQnOiOylTq4upLbVT6BXSpD0Gkr0aKqB8O0CVCAMlBOWaaDOnd8ao/73qjoHdMhIZa+NiHOr/9XJFCKBafvpaQJZKYzoWZuX751vw+i04kDBt8obbU3mvOjrhbDRXPniviYxaFPlW1bS7EEeYbZWa9HqAqCAOnsgoN0F9ziXbBinNR/5kFYFWH0kf7DJXcnnrCOv35lH1SaVupTwAhVirkb8P4uQoOjugyQ0Fg46m+Y5tJE3CP6XC9ccER/xi8522Irxnye05Z59gNi5fg6BC4TUK8WPkNhWP1twQmUW4s6tKzNDLqqxgptC8heAUka3qF2OxWRwx5Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1vlnclKvwUuPxSSXnVYkRvQiGQg9zvojyfFjMpxKok=;
 b=DKlOxaDR4inJPYFvQBo0RpDJwATh1TFm+XXw97IKcFrCxZZUfgkbh8ITE3fnzR015ea+aG8GK+EHAQtBOLLUSPBpGQD8J+QJ+Hx5pDuMzZldrt00hz7+g/7Kw0FvhofF/XPOd0ZhbpAwizNPzNrjHOId6N39PdD/kCYVbR75er6xlhZHDttrkj/Cpm5QRU0XC+DvNqU8FRpTDQxHc0q/VCEt1CXV4ejeVWGBTxEKvx9iPZNK3EnDP2F7mKFSQneI/0wB7I+QqUkH7SMA4GwglLwAweyDHaFEA8fI4xv79CKTNlhP0lz21B7YBuG78r/5zoAbKAMFxBAI6dZ9ls1ZMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1vlnclKvwUuPxSSXnVYkRvQiGQg9zvojyfFjMpxKok=;
 b=ZLn6IB6LTEq0dR7cD9R4q+UQzIJP8AmLuyy8q2ZThM6ZZgnYlnZHa98fImH7HAu1MrrV31FRmistnF0naBp2DeohprYqcuUrZxDqYJrWPtJeV+41rFxBkVAmCPOZ64qJhExil9CjbDLXdWZnHlZIs4FMlsTxmcYKgCb/R+ekmQA=
Received: from SJ2PR07CA0021.namprd07.prod.outlook.com (2603:10b6:a03:505::23)
 by DSVPR12MB922022.namprd12.prod.outlook.com (2603:10b6:8:3e9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 21:34:30 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::56) by SJ2PR07CA0021.outlook.office365.com
 (2603:10b6:a03:505::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed,
 14 Oct 2026 21:34:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 21:34:30 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 16:34:23 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 14 Oct 2026 16:34:23 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <michal.simek@amd.com>, <linux-remoteproc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <ben.levinsky@amd.com>, <tanmay.shah@amd.com>
Subject: [PATCH 2/6] remoteproc: amd_mbv_bram: Restore reset GPIO direction after PL reconfig
Date: Wed, 14 Oct 2026 14:34:22 -0700
Message-ID: <20261014213426.2957480-3-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261014213426.2957480-1-ben.levinsky@amd.com>
References: <20261014213426.2957480-1-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|DSVPR12MB922022:EE_
X-MS-Office365-Filtering-Correlation-Id: 70935c7a-3ff2-4c8b-03a5-08df2a3aee34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|36860700016|376014|1800799024|23010399003|6133799003|18002099003|22082099003|10067099003|3023799007|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	R23H0ZOoXBdmAoOMnL045TKNXcUhwPSx3tgbU2bem8+6TOh/o/3SiSFlxLvshqedjrR2SEjVeOq657eOuAamFT8/sA2ILS3fgWHt+4hLdBy6hvr+5dAEQCX6DOfiNvqL1E1q7/1PbJWJpZoE4BJEnY8CANojYmRa4WFd98u7pz/ZtUKx0AJMGez0Y+zfM0cjazreEqQbAkW3Auz8/FHTADupKpGrmdjdIzn/fyKL7JWFshNmmE/UcroR4Ow2nAGOYIe5Xtc6VHb/XnFDssMouqufLQbG9m9rR/m6XRYCNFb2dPZb6ya+bC+Q4Y8+1fk7ToRiqTPlR/esgBswFmdXxElr7ZQsSUk/asmLr2HmSGx7UHWW3Ucdq2PKqbKP8L/vbcPfyx3t+NTPqp4++cVFPVjLXeusHyz7/XWxaV5zphAK3ik9gBviLF5Ww/YP+Dj7Z9EZPFhiO6q7J7oFSEPcfNsrfCV93P7rMZRoNrDTwF/QyPBysNrq2QrXRLUVhHQbxDXkg1qRUyZc5YjK+2ltOCaNA24WUTz3TJj/fdDfBE0rXwzQdsE7ghsXleIpvm0rAAGoWfeVca+r3n/mXXVrYIZufahOC4QD0InweGthUyUWFz9mEoYpNEH28mkOlvs2v3CXKAWtQkxI5L+FYL8AwcdXV9MeJ5n9OTieLbfkP/An379r7FEa6BnOgX3dPQ3AgGULf2/WIXOE9YxnhLQaeA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700016)(376014)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(10067099003)(3023799007)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jimatmGTUVwPS2040YeSga3Cucua4HNWIkz0FjDgS/sE1C9VH9Ag93ppTCIHzldXaS9akHP2Gih4fJvdVX0RLMfuCythzovDm55gFvd7oc/D3kg2dSpGTz8zay5KTlKtCEJo0qx/OCny8IKJxVFjz4xHe02llXSGnKTV8KUH66xOHbF00ozWXvHgDT47iKJvkydZof+3kjp7ZUCcgc+T/mS0QXjE1O/OWaj4o1krksIBsw44NTbZ78n0w3oOm6PB9QWj+4ZJQDwnzEIBoaI+8Xxh/riRCrYMNEBKVloP5nNB3Hxh1BUjOVuJ85rqEzRgkCL9ubW2Y77PfjoKDVK4JsXK9wmkOcAWvILcbENmYWmIuAt66/6jUhd6JBqn838tW8GsJ2dHRiT45mt1XDzcwxRE2+DdY1BWN9oDDTh3UuELLQ4vDbAytU51k1c6bz9P
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 21:34:30.2036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70935c7a-3ff2-4c8b-03a5-08df2a3aee34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB922022

Partial reconfiguration of the programmable logic restores the AXI GPIO
that drives the soft-core reset to its hardware default direction, but
gpiolib keeps its cached output direction. gpiod_set_value_cansleep()
then only updates the data register, so the processor never sees a
reset transition: remoteproc reports it as running while the newly
loaded firmware never starts.

Use gpiod_direction_output() for every reset transition so the output
direction is re-established, and assert reset briefly before releasing
it so each start produces a clean reset pulse after the firmware has
been loaded.

Fixes: f87b4998994e ("remoteproc: Add AMD MicroBlaze/V BRAM-based remote processor driver")
Assisted-by: LLM sparse
Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 drivers/remoteproc/amd_mbv_bram_rproc.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/amd_mbv_bram_rproc.c b/drivers/remoteproc/amd_mbv_bram_rproc.c
index 6cf33c7b7e64..da621f62f7df 100644
--- a/drivers/remoteproc/amd_mbv_bram_rproc.c
+++ b/drivers/remoteproc/amd_mbv_bram_rproc.c
@@ -16,6 +16,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -94,8 +95,24 @@ static int amd_bram_rproc_start(struct rproc *rproc)
 		return ret;
 	}
 
+	/*
+	 * Partial reconfiguration restores the PL GPIO hardware defaults but
+	 * leaves gpiolib's cached direction unchanged. Re-establish the output
+	 * direction and generate a reset pulse after firmware has been loaded.
+	 * gpiod_set_value_cansleep() is insufficient here because it changes the
+	 * value without restoring an output direction lost during DFX.
+	 */
+	ret = gpiod_direction_output(priv->reset, 1);
+	if (ret) {
+		dev_err(priv->dev, "failed to assert reset: %d\n", ret);
+		clk_disable_unprepare(priv->clk);
+		return ret;
+	}
+	/* Hold reset asserted long enough to provide a clean reset pulse. */
+	usleep_range(10, 20);
+
 	/* Deassert reset and let the processor run. */
-	ret = gpiod_set_value_cansleep(priv->reset, 0);
+	ret = gpiod_direction_output(priv->reset, 0);
 	if (ret) {
 		dev_err(priv->dev, "failed to deassert reset: %d\n", ret);
 		clk_disable_unprepare(priv->clk);
@@ -110,8 +127,8 @@ static int amd_bram_rproc_stop(struct rproc *rproc)
 	struct amd_bram_rproc *priv = rproc->priv;
 	int ret;
 
-	/* Assert reset before disabling the processor clock. */
-	ret = gpiod_set_value_cansleep(priv->reset, 1);
+	/* Restore the output direction after DFX and assert reset. */
+	ret = gpiod_direction_output(priv->reset, 1);
 	if (ret) {
 		dev_err(priv->dev, "failed to assert reset: %d\n", ret);
 		return ret;
-- 
2.34.1

