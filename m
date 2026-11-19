Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795125860;
	b=ebnMjRfQC4Bx0byihnOO4zs8sx+XOaHKB2sOcYaDt+msPpU/2YuSMXUjzTLVP6rU2oxO
	 0vEAwRci8CayUK20FrciPrYRXot9NZwmLD6e2ZdGSEbPi2o88cOUeQyB+2NYHUHW5+TEj
	 B8e2TKjYwrWH2vrcTlSUov2wMA4k0ZaNsdKoJf5ddzNsOg3FGMJmjnQtgFK8lnzqP9f+j
	 LQcM379toS8Dq2U+e/1Ab/8DYFa5RuTSRbaQctlra0krRwqBuetsXkV+GN9Yu4JRl3oA7
	 OMlN6MjfMEKTMJ7BkR9Gp137B/2nce+mgkpwWT2ZX48jsyg7a2mZPT0dUyCa3IBLXKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125860;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=RYWNR0h0liD1qdkAYXsnTwsbXEEFmaCq5YohX+Uco70=;
	b=d6tFGVvQgAtp3tiPPb+CY8SojjeYAHyMBre5kcVYD3UdaTdqxLs5aBzChS9p4b93VrOr
	 t3zdYKIiaK9EEwXlO8bLDIKLb0YfxCM8KUQiajruW7lnoiwjyoDaU9fEv4ALgME76KluX
	 pUCqlv+/ONYRKTHWIPFBL026wBZsQLzW5fSU4X7vVn8pweeI087EWA/agNMzu+T0C03Sa
	 ef9gcS/PpVj+AXRG907KH4Xp8Qk+GtlnknlS06eQHclEP6RebKFbh/D5ybyveu1z7f2JA
	 nzbh9JbbarU81I+Qrr+IuVA/Ga1w1IKQfvXGyKtqdDz7dEybQx9ifL+iKDIZ+JxKkww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nO0aGLkN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.67
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011067.outbound.protection.outlook.com [40.107.208.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8176606A331;
	Thu, 19 Nov 2026 22:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8176606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nO0aGLkN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRDFyZPs5PNspwCfj+F5+x08P6WzOE+DH929i2Mdvhcmku9EjxtsyyZHrjOdVh+K3Sgxtnqb2Q0Tnh5CxCTcQnbu7uCZWLxjehunfxpnOmY5/69a81ujzW3e4BNnUL6/K2RL+bjMvYKpMX8AV2oatT8wb++ywFyZGR0OUYy3lDQo4EsNmBCANzpoRVkJOdhQf/3jeHzdJ53Q7WjH94ahkg8f++ef4i0Vt+sqtdbJVog37rlO05mkzjF/zUdIPnXLw37mknQKtW4CufNkCqI5NhMYAP2aRP8g1OKBiJRIR6Z7Wxjlz4xuAaOAkMa13d80ly+h7BptnFPVYCtHtoH43Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYWNR0h0liD1qdkAYXsnTwsbXEEFmaCq5YohX+Uco70=;
 b=vx1L+3a5tvlKcWgjwS0f5UH+fY9sVDcHlS3zEKk+/4ADi9HFlo+FSiBU525FAoCxKiVcV9XlI7TzH8Ostj/0XNMjCKTVhUcL3/6milhyS2hfjun1d05swmjlh7r2ifsmVl/JBlHJ7qVX4SilnYxTIS01n6AY3kh1l9lrJ1wCQQqpPKqQ9l8OuOchrDs9OvI9bY6su6i6NxBuiKSg0BLJLaXXlLVpBpNlEtAI4IfTRV8MUULLSLTheS79D6KISsx0sjwHDtmG/KMa0tcvyy8jGbgxFjQtnR5cQ/nV9g29nniFB70NWJBBaHyTP+Dp8Q5yIGmD5o6wa89aMI4awq0SdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYWNR0h0liD1qdkAYXsnTwsbXEEFmaCq5YohX+Uco70=;
 b=nO0aGLkNgQ26BDeblmm21D4p/LEsWn0CcOhtX17aSGp57bJUyCCYGOOAOG8TxAUsI37ITFrtsqyW3vOiwYkZ+6APc49Oa0Z5BWco+Z+UBVqtH0m3m6JHt3M2OECg1pldTzrdqVUMs/9D3S2PewDCGxk7SvxihiTlfbOh068qjhk=
Received: from CH0PR13CA0060.namprd13.prod.outlook.com (2603:10b6:610:b2::35)
 by SN7PR12MB8147.namprd12.prod.outlook.com (2603:10b6:806:32e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 22:04:11 +0000
Received: from BN1PEPF00018548.namprd05.prod.outlook.com
 (2603:10b6:610:b2:cafe::51) by CH0PR13CA0060.outlook.office365.com
 (2603:10b6:610:b2::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.7 via Frontend Transport; Thu, 19
 Nov 2026 22:04:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00018548.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 22:04:10 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 16:04:10 -0600
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 16:04:09 -0600
From: Ben Levinsky <ben.levinsky@amd.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson
	<andersson@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <michal.simek@amd.com>, <tanmay.shah@amd.com>, <ben.levinsky@amd.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 4/4] remoteproc: amd_mbv_bram: Add RPMsg support
Date: Thu, 19 Nov 2026 14:04:05 -0800
Message-ID: <20261119220405.2838553-5-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119220405.2838553-1-ben.levinsky@amd.com>
References: <20261119220405.2838553-1-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018548:EE_|SN7PR12MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: 67e902ea-8d40-405e-0fa6-08df46890a6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|7416014|23010399003|376014|261009223327099003|6133799003|22082099003|18002099003|261009221227099003|261009221727099003|261009223027099003|261009220027099003|56012099006|261026121527099003|5023799004|261026140227099003|11063799006|261028144727099003|261022115727099003|261021135927099003|261022105027099003|261021133027099003|261022113327099003|261021130227099003|261026130827099003|261026135527099003|261021121427099003|261021123027099003|261022075727099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	iz2I2oq6Ftk5GNG6v+DZbAHiFtWz9wUhkVKvlnhdINV6VqVZ01kah9DYYsiPM0o4ybELA4NLjJDKuRWFZPzMgxrdoDOR992l4y2o4p5LyJ1uglh0VzOWKmwRQS5vzvf65f454cB3zqkegFAiz0dpIeJNPRLWGpikoLAmbnaY5pYLipXMmJxWaHbAibXux3heuVtaDd2+o2+k1c1v2NX3WDHLn4Rf7kDAL8umhej4O1lLVF/FRwx3ELoMUoQ1AZL6yzg4sJTECWqc/WOBK8eESa2L573O/cvzU4QzBm7/B06kEuqPpUr0cZrM/c10I7QCoXDIQ1t9Wna32JU00xYzw+Vl/Oyy/6SPhHV1qm2/ck4BuhkngDfhbmxTKoNno36ToAmHtDC7sxRW9Vi/PDBOMTyj6l+YKjDe0HUsmjnG4S9ZjTHHgHq+YlbddyAMJpHjsjGuuaDuZRf3NvQgJCCu4KxRQtpSWyLXSyM+KZsW2SfenQn55/QXIBkL1PfDMGRXkD0Yjsm678Jfg0tx9bw4N0ZCH2M9noj6j9ufVkYkr7vH77Xpd+R7xhSPMQY7COShPvreTHTqglu/j5nkQkDH1GcCm/w9DlaEdZ3uEq6vbrQgx/lqmDRR0ffvQ+aTkjfS4/WiMN1jlhgbhCuVMCUuT/1tJAeeEa/K/I/WxD8BGJMTXaJPUZqugK874kmVK92CZv1LHZ9ZIKLbrzAMRmCZSQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(7416014)(23010399003)(376014)(261009223327099003)(6133799003)(22082099003)(18002099003)(261009221227099003)(261009221727099003)(261009223027099003)(261009220027099003)(56012099006)(261026121527099003)(5023799004)(261026140227099003)(11063799006)(261028144727099003)(261022115727099003)(261021135927099003)(261022105027099003)(261021133027099003)(261022113327099003)(261021130227099003)(261026130827099003)(261026135527099003)(261021121427099003)(261021123027099003)(261022075727099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3t3xUa1dL+6T0YE/9fTpSadrIPuQTrei5JCsndBW+0SzAb+yafqs2rIfOvFXVEjgqWwLzkaGVuOmo05eWueyn3wOcCUcmwJXIJLECOGw9XYOjXbbn037tL/EwcuoLi88qJ9aob1BU/tZGxQRajpqUytVRSQbvM86iiNHoEEUbZDxymWx1BGgKW2nXBL2P50eoj8bOG0uERAVju0hsHl+2GWZc8KfQ3MKUGTNF7+HFgZC/qXwb7LTySBMCnEFfDBNneLPob6fInop3vd7kw5SCxhgdQHiiQhfyT58JjnVaarCgWCOeqLzh35x+VUDCZwO3mjpze/ZiwAvMvIxTD1rir0j5vLpYK/FxbzjZtx6Nxr0HVuYBdNQX+K1CPPWpKBKnX1nornuh3rzCEADncsEN9oj/OnZWez9+jLPPi/GJGa64/SJb9MD6rhmY37YO7L+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 22:04:10.8664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e902ea-8d40-405e-0fa6-08df46890a6a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018548.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8147

Add RPMsg support using the mailbox framework for virtqueue
notifications and reserved memory regions for the vrings and buffer
pool.  Both are optional, the driver can still be used to only load,
start and stop the remote processor.

Received notifications are processed in a work item since the mailbox
RX callback may run in atomic context and the virtio RPMsg receive path
takes a mutex.

The mailbox client API doesn't provide stubs when MAILBOX is not
enabled, hence the new Kconfig dependency.

Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 drivers/remoteproc/Kconfig              |   5 +
 drivers/remoteproc/amd_mbv_bram_rproc.c | 295 +++++++++++++++++++++++-
 2 files changed, 299 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 70dec8c3fe4e..2d3c51cbcbad 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -26,10 +26,15 @@ config REMOTEPROC_CDEV
 config AMD_MBV_BRAM_REMOTEPROC
 	tristate "AMD MicroBlaze/V BRAM-based remoteproc support"
 	depends on OF && COMMON_CLK && (GPIOLIB || COMPILE_TEST)
+	depends on MAILBOX
 	help
 	  Say y or m here to support a MicroBlaze/V BRAM-based remote
 	  processor managed through the remoteproc framework.
 
+	  RPMsg communication additionally needs the mailbox controller
+	  referenced by the mboxes property, such as AMD_PL_MAILBOX, and
+	  RPMSG_VIRTIO.
+
 	  If unsure, say N.
 
 config IMX_REMOTEPROC
diff --git a/drivers/remoteproc/amd_mbv_bram_rproc.c b/drivers/remoteproc/amd_mbv_bram_rproc.c
index e4a103cf8455..0b54a6cc3e62 100644
--- a/drivers/remoteproc/amd_mbv_bram_rproc.c
+++ b/drivers/remoteproc/amd_mbv_bram_rproc.c
@@ -15,14 +15,19 @@
  * Reset is controlled via GPIO connected to Processor System Reset IP.
  */
 
+#include <linux/bitmap.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/gpio/consumer.h>
+#include <linux/mailbox/zynqmp-ipi-message.h>
+#include <linux/mailbox_client.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/remoteproc.h>
+#include <linux/workqueue.h>
 
 #include "remoteproc_internal.h"
 
@@ -31,13 +36,266 @@
  * @dev: device pointer
  * @reset: GPIO descriptor for reset control (active-low)
  * @clk: processor clock
+ * @rproc: remote processor instance
+ * @tx_client: mailbox client used for virtqueue kicks
+ * @rx_client: mailbox client used for remote notifications
+ * @tx_chan: transmit mailbox channel
+ * @rx_chan: receive mailbox channel
+ * @notify_msgs: persistent mailbox payload storage indexed by notify ID
+ * @pending_notify_ids: notifications awaiting process-context dispatch
+ * @rx_work: work item that dispatches received virtqueue notifications
  */
 struct amd_bram_rproc {
 	struct device *dev;
 	struct gpio_desc *reset;
 	struct clk *clk;
+	struct rproc *rproc;
+	struct mbox_client tx_client;
+	struct mbox_client rx_client;
+	struct mbox_chan *tx_chan;
+	struct mbox_chan *rx_chan;
+	struct zynqmp_ipi_message *notify_msgs[256];
+	DECLARE_BITMAP(pending_notify_ids, 256);
+	struct work_struct rx_work;
 };
 
+static void amd_bram_rproc_rx_work(struct work_struct *work)
+{
+	struct amd_bram_rproc *priv =
+		container_of(work, struct amd_bram_rproc, rx_work);
+	unsigned long notifyid;
+
+	for_each_set_bit(notifyid, priv->pending_notify_ids,
+			 ARRAY_SIZE(priv->notify_msgs)) {
+		clear_bit(notifyid, priv->pending_notify_ids);
+		if (rproc_vq_interrupt(priv->rproc, notifyid) == IRQ_NONE)
+			dev_dbg(priv->dev, "no virtqueue for notifyid %lu\n",
+				notifyid);
+	}
+}
+
+static void amd_bram_rproc_rx_callback(struct mbox_client *client, void *msg)
+{
+	struct amd_bram_rproc *priv =
+		container_of(client, struct amd_bram_rproc, rx_client);
+	struct zynqmp_ipi_message *mb_msg = msg;
+	size_t offset;
+	u32 notifyid;
+
+	if (!msg) {
+		dev_warn_ratelimited(priv->dev,
+				     "received mailbox notification without data\n");
+		return;
+	}
+
+	/* Each notification is one 32-bit notify ID. */
+	if (!mb_msg->len || mb_msg->len % sizeof(u32)) {
+		dev_warn_ratelimited(priv->dev,
+				     "malformed mailbox notification: %zu bytes\n",
+				     mb_msg->len);
+		return;
+	}
+
+	for (offset = 0; offset < mb_msg->len; offset += sizeof(u32)) {
+		memcpy(&notifyid, &mb_msg->data[offset], sizeof(notifyid));
+		if (notifyid >= ARRAY_SIZE(priv->notify_msgs)) {
+			dev_warn_ratelimited(priv->dev, "invalid notify id %u\n",
+					     notifyid);
+			continue;
+		}
+
+		set_bit(notifyid, priv->pending_notify_ids);
+	}
+
+	schedule_work(&priv->rx_work);
+}
+
+static void amd_bram_rproc_kick(struct rproc *rproc, int vqid)
+{
+	struct amd_bram_rproc *priv = rproc->priv;
+	struct zynqmp_ipi_message *msg;
+	int ret;
+
+	if (!priv->tx_chan) {
+		dev_warn_ratelimited(priv->dev,
+				     "cannot kick vq%d: no TX mailbox\n", vqid);
+		return;
+	}
+
+	if (vqid < 0 || vqid >= ARRAY_SIZE(priv->notify_msgs)) {
+		dev_err_ratelimited(priv->dev, "invalid notify id %d\n", vqid);
+		return;
+	}
+
+	/*
+	 * The mailbox core queues message pointers. Keep each notification word
+	 * in persistent storage until the controller reports TX completion.
+	 */
+	msg = priv->notify_msgs[vqid];
+	msg->len = sizeof(u32);
+	memcpy(msg->data, &vqid, sizeof(u32));
+	/* Order writes to WC vring mappings before notifying the remote. */
+	wmb();
+	ret = mbox_send_message(priv->tx_chan, msg);
+	if (ret < 0)
+		dev_err_ratelimited(priv->dev, "failed to kick vq%d: %d\n",
+				    vqid, ret);
+}
+
+static void amd_bram_rproc_free_mboxes(struct amd_bram_rproc *priv)
+{
+	if (priv->rx_chan) {
+		mbox_free_channel(priv->rx_chan);
+		priv->rx_chan = NULL;
+	}
+	if (priv->tx_chan) {
+		mbox_free_channel(priv->tx_chan);
+		priv->tx_chan = NULL;
+	}
+}
+
+static int amd_bram_rproc_request_mboxes(struct amd_bram_rproc *priv)
+{
+	int ret;
+
+	/* Without mailboxes the driver supports load, start, and stop only. */
+	if (!of_property_present(priv->dev->of_node, "mboxes"))
+		return 0;
+
+	priv->tx_chan = mbox_request_channel_byname(&priv->tx_client, "tx");
+	if (IS_ERR(priv->tx_chan)) {
+		ret = PTR_ERR(priv->tx_chan);
+		priv->tx_chan = NULL;
+		return dev_err_probe(priv->dev, ret,
+				     "failed to request tx mailbox\n");
+	}
+
+	priv->rx_chan = mbox_request_channel_byname(&priv->rx_client, "rx");
+	if (IS_ERR(priv->rx_chan)) {
+		ret = PTR_ERR(priv->rx_chan);
+		priv->rx_chan = NULL;
+		mbox_free_channel(priv->tx_chan);
+		priv->tx_chan = NULL;
+		return dev_err_probe(priv->dev, ret,
+				     "failed to request rx mailbox\n");
+	}
+
+	return 0;
+}
+
+static void amd_bram_rproc_release_mboxes(void *data)
+{
+	struct amd_bram_rproc *priv = data;
+
+	/*
+	 * Free the channels before cancelling the receive work. RX channel
+	 * shutdown disables the controller interrupt synchronously, so no
+	 * notification can queue the work again once it has been cancelled.
+	 */
+	amd_bram_rproc_free_mboxes(priv);
+	cancel_work_sync(&priv->rx_work);
+}
+
+static int amd_bram_rproc_reserved_mem_count(struct amd_bram_rproc *priv)
+{
+	struct device_node *np = priv->dev->of_node;
+
+	if (!of_property_present(np, "memory-region"))
+		return 0;
+
+	return of_reserved_mem_region_count(np);
+}
+
+static int amd_bram_rproc_get_reserved_mem(struct amd_bram_rproc *priv, int i,
+					   const char **name,
+					   struct resource *res)
+{
+	struct device_node *np = priv->dev->of_node;
+	int ret;
+
+	ret = of_property_read_string_index(np, "memory-region-names", i, name);
+	if (ret)
+		return dev_err_probe(priv->dev, ret,
+				     "failed to read memory-region name %d\n", i);
+
+	ret = of_reserved_mem_region_to_resource(np, i, res);
+	if (ret)
+		return dev_err_probe(priv->dev, ret,
+				     "failed to parse memory-region %d\n", i);
+
+	/* The remote uses the physical address as device address. */
+	if (res->end > U32_MAX)
+		return dev_err_probe(priv->dev, -EINVAL,
+				     "memory-region %d %pR is above 4 GiB\n",
+				     i, res);
+
+	return 0;
+}
+
+/* Validate all regions so that nothing is registered if one is invalid. */
+static int amd_bram_rproc_check_reserved_mem(struct amd_bram_rproc *priv)
+{
+	struct resource res;
+	const char *name;
+	int count;
+	int ret;
+	int i;
+
+	count = amd_bram_rproc_reserved_mem_count(priv);
+	if (count < 0)
+		return count;
+
+	for (i = 0; i < count; i++) {
+		ret = amd_bram_rproc_get_reserved_mem(priv, i, &name, &res);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int amd_bram_rproc_add_reserved_mem(struct rproc *rproc)
+{
+	struct amd_bram_rproc *priv = rproc->priv;
+	struct rproc_mem_entry *mem;
+	int count;
+	int ret;
+	int i;
+
+	count = amd_bram_rproc_reserved_mem_count(priv);
+	if (count < 0)
+		return count;
+
+	for (i = 0; i < count; i++) {
+		struct resource res;
+		const char *name;
+
+		ret = amd_bram_rproc_get_reserved_mem(priv, i, &name, &res);
+		if (ret)
+			return ret;
+
+		if (!strcmp(name, "vdev0buffer"))
+			mem = rproc_of_resm_mem_entry_init(priv->dev, i,
+							   resource_size(&res),
+							   res.start, name);
+		else
+			mem = rproc_mem_entry_init(priv->dev, NULL,
+						   (dma_addr_t)res.start,
+						   resource_size(&res), res.start,
+						   rproc_mem_entry_ioremap_wc,
+						   rproc_mem_entry_iounmap,
+						   "%s", name);
+		if (!mem)
+			return -ENOMEM;
+
+		rproc_add_carveout(rproc, mem);
+		rproc_coredump_add_segment(rproc, res.start, resource_size(&res));
+		dev_dbg(priv->dev, "reserved memory carveout %pR\n", &res);
+	}
+
+	return 0;
+}
+
 static int amd_bram_rproc_prepare(struct rproc *rproc)
 {
 	struct amd_bram_rproc *priv = rproc->priv;
@@ -68,6 +326,10 @@ static int amd_bram_rproc_prepare(struct rproc *rproc)
 		return ret;
 	}
 
+	ret = amd_bram_rproc_check_reserved_mem(priv);
+	if (ret)
+		return ret;
+
 	mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
 				   resource_size(&res), da,
 				   rproc_mem_entry_ioremap_wc,
@@ -79,7 +341,7 @@ static int amd_bram_rproc_prepare(struct rproc *rproc)
 	rproc_add_carveout(rproc, mem);
 	rproc_coredump_add_segment(rproc, da, resource_size(&res));
 
-	return 0;
+	return amd_bram_rproc_add_reserved_mem(rproc);
 }
 
 static int amd_bram_rproc_start(struct rproc *rproc)
@@ -116,6 +378,9 @@ static int amd_bram_rproc_stop(struct rproc *rproc)
 		dev_err(priv->dev, "failed to assert reset: %d\n", ret);
 		return ret;
 	}
+	cancel_work_sync(&priv->rx_work);
+	bitmap_zero(priv->pending_notify_ids,
+		    ARRAY_SIZE(priv->notify_msgs));
 
 	/* Disable clock after asserting reset */
 	clk_disable_unprepare(priv->clk);
@@ -139,6 +404,8 @@ static const struct rproc_ops amd_bram_rproc_ops = {
 	.sanity_check	= rproc_elf_sanity_check,
 	.get_boot_addr	= rproc_elf_get_boot_addr,
 	.parse_fw	= amd_bram_rproc_parse_fw,
+	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
+	.kick		= amd_bram_rproc_kick,
 };
 
 static int amd_bram_rproc_probe(struct platform_device *pdev)
@@ -148,6 +415,7 @@ static int amd_bram_rproc_probe(struct platform_device *pdev)
 	const char *fw_name = NULL;
 	struct rproc *rproc;
 	int ret;
+	int i;
 
 	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
 	if (ret < 0 && ret != -EINVAL)
@@ -161,6 +429,8 @@ static int amd_bram_rproc_probe(struct platform_device *pdev)
 
 	priv = rproc->priv;
 	priv->dev = dev;
+	priv->rproc = rproc;
+	INIT_WORK(&priv->rx_work, amd_bram_rproc_rx_work);
 
 	/* Get the processor clock */
 	priv->clk = devm_clk_get(dev, NULL);
@@ -178,6 +448,29 @@ static int amd_bram_rproc_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->reset),
 				     "failed to get reset gpio\n");
 
+	priv->tx_client.dev = dev;
+	priv->tx_client.tx_block = false;
+	priv->tx_client.knows_txdone = false;
+	priv->rx_client.dev = dev;
+	priv->rx_client.rx_callback = amd_bram_rproc_rx_callback;
+	for (i = 0; i < ARRAY_SIZE(priv->notify_msgs); i++) {
+		priv->notify_msgs[i] =
+			devm_kzalloc(dev, struct_size(priv->notify_msgs[i],
+						      data, sizeof(u32)),
+				     GFP_KERNEL);
+		if (!priv->notify_msgs[i])
+			return -ENOMEM;
+	}
+
+	ret = amd_bram_rproc_request_mboxes(priv);
+	if (ret)
+		return ret;
+
+	/* Registered before the rproc, so it runs after the rproc is stopped. */
+	ret = devm_add_action_or_reset(dev, amd_bram_rproc_release_mboxes, priv);
+	if (ret)
+		return ret;
+
 	rproc->auto_boot = false;
 
 	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
-- 
2.34.1

