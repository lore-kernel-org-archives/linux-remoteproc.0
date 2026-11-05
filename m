Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793855954;
	b=waLYESI0/0sUK0Ece3s2YRRqMQmjrSxGyY9+wYLCTvu65hn8D4yqbvCO0/BdkKXCxIvd
	 /G2gnr8cr8Pmk2LxlD/l70VMGi+ntr448zJu1V3GPbBgUddnj2PasC+pWHw8B6xK2De+Q
	 bpzWDjJcC1HL5ST05lkFEfODq/wpQSSspT2rdAvmTsZ4xfeNJgUe3oZRd5zz35CkSeTqZ
	 t/wONjHvyYFupstzoA+Vo61vWRlmoO5ijzEJx03C9aYdDdGE4ycQKLhqCU4aOGtAktd1C
	 8IFQ40lWjVQqT/7NQuRaaxWAO9C/1NDKl8ANTOG7x3QQz9QdulZAjGwMT5v8ZUJaJ7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855954;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=SKAybtCaSespV9yhryUm5dH+x/VTnVxornDOCTSAvpU=;
	b=PXmGjjvz6dX7+z7Om9V9c3t4qpdPPWr9cWxlmmdo3mPKgTao9T0nRHjcRwWy5RaQk/fD
	 +0uHG4e3Tc17G0Yx+2eQiHqdOjZ+7dH+rV5nVRe8VBeq9C74BTlgKX6YvO74Ughdr2ebn
	 QpPbWdDuhMov6+Ysxiqhxqo9/miTX9tw9Bgp6JScbSU/puCsC1wjavGNyZBXG3ihE/+3z
	 HA8+JppbiA8GNta8ODGTv4r0wxkw24ug2AqFBcV4EAXuJrkYNG+/oEAhQLBtHe91Y9Vv/
	 Q9mDPwCgT3tN/FJxBynsvXBmpIPnJznoEeR8ZWmda+88RP4qJaA5W5ySt5OlX/xdNqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Us0+dQbH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.7
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010007.outbound.protection.outlook.com [52.101.46.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F2C606A329;
	Thu,  5 Nov 2026 05:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15F2C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Us0+dQbH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vgd/s7ns10m+jdhmBBinGeOwQYTM3Xk0ZOD0KMK17Gy+YVwpXe35kTU8cYdm7T5fBGOSdpDHf7oDk/DlWIUGf5oahxkPTKhITVVk6qHbHv/98OhteYu0WQpZ5YhWjZgZzMnOvxEX08N6Ym5/YkYEuz+xtUeeNrOuBGARpHYstCN/1zxcAUmm6f/GIegvFl7ymtA0MAHxi3+XdVgiJH2UqENrx8caYibAMzw/L7RppvFlQLmRtinmIAeX6Kq2tgW5f97aaQj7a6Ef+No2gtcmMcw/r8MvEL55CFxWFk3JI5Ml9m/oVnXGCKYkN2UerXM0ReEjzx3Ws5cqnTUWfwTZUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKAybtCaSespV9yhryUm5dH+x/VTnVxornDOCTSAvpU=;
 b=ybq75Rp+Uc6/zos+ygoWFxNOm29oGMCK+Sd7QVmXrNq7M3+G6zFPc+UlEhiV5RO21iX9XPGr3VDPLpCh508vXBWmvRD2m6Tjx5kKQhC1eXj5K/NKyjsQCwPjpw2PnrJ2AkDiHWFB9sp53J/t2swdQjIhKx4y0kJx1itenhulx/FbTUyJnb2tYbRyvRtgdv1Do9505t0plkrVDC6DNd2Ra4wLXkpfvpuy6txp+5Jfr7btvT3zqxLQoWn2tgaR0TIVwj8yMM6gMLPRImWtoZtqlW+f8ZzssG7MC3a4S0HuGDBtOCrpUE4YsGareuTnacXWOPNlarfcR6K9kLMnELPc3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKAybtCaSespV9yhryUm5dH+x/VTnVxornDOCTSAvpU=;
 b=Us0+dQbH3JM0oBm50j5iUqetK0qVPQxcZBs6coVLW4jAVyxEe3b+I/ogk0UH/mMjbSUpRO1pDRY85sVqJvHgncaaZXgyQNPwi4s28cKDWXog1+tEnrFPRghxXY/sj3M/AN/fCUQOoZg85hj1jHP4l0fz0obqbXgw1ORkS/ETnck=
Received: from SJ0PR03CA0020.namprd03.prod.outlook.com (2603:10b6:a03:33a::25)
 by SAEPR12MB231369.namprd12.prod.outlook.com (2603:10b6:802:204::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 05:19:11 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::42) by SJ0PR03CA0020.outlook.office365.com
 (2603:10b6:a03:33a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Thu, 5
 Nov 2026 05:19:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 05:19:11 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 23:19:06 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 23:19:05 -0600
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 4 Nov 2026 23:19:04 -0600
From: Ben Levinsky <ben.levinsky@amd.com>
To: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <michal.simek@amd.com>, <tanmay.shah@amd.com>, <ben.levinsky@amd.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/6] remoteproc: amd_mbv_bram: Restore reset GPIO direction after PL reconfig
Date: Wed, 4 Nov 2026 21:18:58 -0800
Message-ID: <20261105051902.1646651-3-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105051902.1646651-1-ben.levinsky@amd.com>
References: <20261105051902.1646651-1-ben.levinsky@amd.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|SAEPR12MB231369:EE_
X-MS-Office365-Filtering-Correlation-Id: 07c78f21-b182-4853-7b60-08df3afc5372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|82310400026|36860700016|11063799006|56012099006|261022075727099003|261009223027099003|261021121427099003|261022105027099003|261102123227099003|261021123027099003|261028144727099003|261026140227099003|18002099003|22082099003|6133799003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	zYzg5PMXjkeQ0O8yy0n+8J+qnGnFOvY+dP+dsxktoMibioYHDejr/jhuOllnpV5jfOnT9dr2VQO8ur47QV2rK0HiTn3mhM8naZpgeG/4XkZXsgN8etiXdLSahQ6EJUV6FY6xv50s2eQj4olB8kWhLTsyHjudG5FJjlOPY8VYQAPAaNtmP0C2hR4JSYrhzDWYa67r2sCpt9/n0BgXikikpKrL/BCGO5ssWZH2skpVrENvtR0EJlysHDDKtJwBeeCgi/644rrKkwbLeoFsJZvyrXr1AudJU6/D0kMDZv0C3G1JsunctJ/0T3uxZWjC/SmuaSRdubzqpxPaqJTTpk1RRpRm157JsmrtYP7RnNE3GNPUprEYHNb30HN/no/238NAeKnl0S28egf57dc+D+yAcogfCb2PwhWCtaykytNBCYJZLaGWNKdSUNDh5fBSYQRQsB414n2MEyXfRpUXoWiMFMPc4actHkWlHgRm9jEtthwT2Y0846sL2zDOQsuNY91jWpS34rbIaYJzxvvzxQAlmhuKwgvXPj9s+3jmkuEAgpxMHu/qDcxe8jljCpKEk/SmD+NyJ0F2vA/lh8ecfBLYZOTyCsAvpZvSxzp9v0emUDXawYJqweRCvSfbLDU24BhAjEX1dqesIsm2NCAKaV4LP7tjpZ1JGI86aq5eSa9SbsmKHHrgM4rPD4lIoJzfnj4tUcJDzZEbD/TQV4rwFxIziA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261022075727099003)(261009223027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261021123027099003)(261028144727099003)(261026140227099003)(18002099003)(22082099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1h9x4qGLlx1Vf6C0lPblkNkCCJ8PtXsm9sCwLo0odhKA6uGBU9uBp+Ew/pWvQKQE+xf9D9+yebO0x/tvT3t2A12uln7D64jz7/FBTTHdqh++LFdtMDYV4XxvSyivj6mS2l/AL9vljRy/Z1RSlxys7hPiWY/+tOOeOHelZmm7NtaZTB/qwjTxDPf8FxujvRGtlWdzdxALoyA/Uw29i6TZJPzlpImFHS8T2t37rUtGBNMd+Nb7pJTtqA/T+CQe7DXd+KsUPG9mLnU0gJp/Gy7doHhu/B34oQAznBkvHrM+F3HZIFWX3eXEBjBzagXKyfXahrhpxUjsQjLM1jo9N0uggDF0kR5hXwEnwL1a0HyUrjTBs2x4nAGD8tTEJ5uWJZy+9DPbYCilHkdrzbzyyUOO38PZmoN6tQzH6NOzGAevLelaa03J+hbJCJGEec9CaO8i
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 05:19:11.5004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07c78f21-b182-4853-7b60-08df3afc5372
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAEPR12MB231369

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
Assisted-by: Claude:claude-opus-5.5
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

