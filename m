Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012057.outbound.protection.outlook.com [40.107.209.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B0D44999F;
	Wed, 14 Oct 2026 21:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013689; cv=fail; b=JFR7OaaUVRqpVvxGTuCLc/rMoZM2AlV2JRKYXC9bgBuo4SCwbkt1JhZyEY/abC3Rg7Gg2BRvHFWYcv2VBS506WXcE3HUBTFwPbXsg8noO+AQLawFRSTZiGtfoggBsc+JG8GCluJ5tqwXMfl6NmYy9EOeFV3dWJ8XXw7NFmO1DFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013689; c=relaxed/simple;
	bh=b/k7e7VwUWDH5KpeXgZ1nYgde2ADw3gqKNWKkGK8hjI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qQq4Kbh5myT6E3LWk5+HzFfQ9ajYgPgy5jf4kqjNQmUdu7OPMO1kqA9G6xWdwTwxE+TxaxxtHh9QDyH1JF4fQcOZFaCBfcV1N1aaHnGoCZHjRRYnQQdQI68Of5uq7KfKR/+wNmBjWUhBHEWSQFaL5B8UFE34/+r11HvqYaQ9Sho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=N7FYXQ/R; arc=fail smtp.client-ip=40.107.209.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="N7FYXQ/R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwzM7+YwYxRbiCKRcVf4B50IQpDUydFMfZIqSAW5dFN2VkGAVWT15vky2Lzwth86eJMY8CsPAo+/o2QsXseC/WmntvrXhVWt5M39OkgYVB7PRXo0r3t3+M5+Nmp2Hqr6wtTBbz+7SvlVb5H1RHF3/PFN58maVg31uKrv9we0XuKiqYFnm8pFbb80x/PZ3Upe3gWWD5z6JoDEukLpHu7xcMKvXAWSxR+C1lLLcN46pRHSiaKiGuSZni2s8/mh8Qw/rzhlIu0eq/dgnySMuS3tLdZDGv2jZzbmdmJCf4punKQw2ODB3KMF4zJbmH6wo/GqOQSCbD1LrX2rygWUxYJubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XQ0ln5blAqRCEMx2gHKDXOTNni5lvjDjBYRREqfioA=;
 b=coEsd90vI+tOwtTwo6KjP9SHBkrc6hecewPxB16+LRtOqugLaMNcMwfJxm+zlOtsfhl9+OhwbFDAJVvlSStffQSklDTxjrKxDglS20wgdV4zOiInOYfA09l7OfV825F9UWuiDzlJ6xojRbfaXilWGx44W1hPPY2BcX8Uo48SxJr1r9HgYFY0Cd/P6dM7W+01zcTz2zCAbo8Cc81mV2m7UCWbkvBEOMXVfsR2bAn3+XKQMi/k5rUhFeW1ns49yIOB/MLWsqhcz/6qpxEbyuJBX26rz8sXbIZqfrEowCa/4fpf6l8l3QJwjTCaPWfJZTTzFkIe7qmbOu2VwCBU0ivVpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XQ0ln5blAqRCEMx2gHKDXOTNni5lvjDjBYRREqfioA=;
 b=N7FYXQ/RAhIMMpqIlM+2QhUaluWA4K5ar8sydLHQaEnhlAIoWrPaXLlhi9CYfPyb4diHiAxUKk5ZDvK6X1iCTMPBF72BaX5wEPJanqWFT56xqy3X0vdd1ihN0+T9eaDekBblAkz2WfRmQ1IZtTLmSL/4AXpMhNEA3Qv/7u24vRs=
Received: from PH7P220CA0158.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::34)
 by SA1PR12MB6704.namprd12.prod.outlook.com (2603:10b6:806:254::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 21:34:41 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:510:33b:cafe::3) by PH7P220CA0158.outlook.office365.com
 (2603:10b6:510:33b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 21:34:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 21:34:41 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 16:34:28 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 14 Oct 2026 16:34:27 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <michal.simek@amd.com>, <linux-remoteproc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <ben.levinsky@amd.com>, <tanmay.shah@amd.com>
Subject: [PATCH 6/6] remoteproc: amd_mbv_bram: Add RPMsg support
Date: Wed, 14 Oct 2026 14:34:26 -0700
Message-ID: <20261014213426.2957480-7-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|SA1PR12MB6704:EE_
X-MS-Office365-Filtering-Correlation-Id: f3085e30-ef5b-47f5-549b-08df2a3af4a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|36860700016|1800799024|82310400026|56012099006|11063799006|261009223027099003|261009223327099003|261009221227099003|261009221727099003|261009220027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	7FQnpn3aibktwRzdAbWKWqmfMXcudl0tS2v2vdY3KfQHTMvFcJGp3FC6MVTea/TZhoe313omMvsOGF9WiiKiqtX1nyOoQCYTaSS5HJ6GXaxurVoweQOIlYCncras05ik0srt7ffQcv4XVKEtRBNSyFMSpfLMI3o8T8W8scW2OwjaARSR0DkofrLQ2O+RYqr7rvavaZ1qaRKcHjZUKuY4wUbiufdiHWyHE+icvla60G++ZCQaPL5OLhli95mG2Bb21+uN+vhF0TSMfkNLuBkbiybhqWUZDlRaTNXeLBt1BZvxRuduij50K4XBX5YpopTLLM93N8/EW8izNmj3fRHgTW598JA4U8ILXD/NxsGULa3giwVWpGbwpIt+ujHLz8Rqz+JvGOoBEZt3v8dNGpPHgZ/0IEgTpDges/dmU5K06ziAWA40Ix7zDXinQf5dcz4vID7m/a0OBb34v30XngzmGyjTwgzJ3OR2pKW3lYezdwaKHcsxHjny0aHVnLVn/4x9atDFS6vlPuy6lrC53bwfc195DbkUSTHhcldrWR+A8+RuiNsNxyO+rVf/Kpeh89tLAPXwY366bAuafdTCpoutLysYhOWAjond/IRaCPyRjOpSXtuwAZaDKfANDXINpknlQTL1uxobd55HUAJL0s07hCb88YcHTxjWhHJ1pRFU61Ec5THBpBA7lkZGJMOOjf2CVHc7Xh5+RfXAUeB0a/Gd4Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(36860700016)(1800799024)(82310400026)(56012099006)(11063799006)(261009223027099003)(261009223327099003)(261009221227099003)(261009221727099003)(261009220027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zG7vR9OtdYv4qnUX8xrXuRvLi0iQfN/zVCQYRuSgsmlA5puwINKru48m1M3qgnV8Eb02iTSiwlCWoWqY7GpP5XJd2Syw3qWu7ANObfZPgK6C5CNOZdJoLE5W4SVFhaE+OewqFDyJlE7YJJbtaSa0bD/CMV7cPNT159OWP1Hguo+OOd60GfT+evso3uUOAcIBU/LC/MghBEGwQ1LL0D2MpIlPWh9VrWnfJJYmW7Co5j+GIBtFBCHEf9NJBtEFK4owbnZD6mSOFq7v/VQuROP6X3KcwZl+LWEKP+VoNw++gnM7gIMiAf+3oVrRvc3UEqYsYKV3I4Jo3doCS9babU3WWZS+qJgUnJfGvYDujnpSuNFjbjOU79WXpCJgDDWmk73KoH+6wGdqE/pgm0q2xhly7bnLnk74PtAC+7MSug0C9LFwbB/5zxxeDEhS/6I714oI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 21:34:41.0068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3085e30-ef5b-47f5-549b-08df2a3af4a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6704

Register named reserved-memory carveouts and expose the firmware
resource table after it has been loaded into BRAM. This lets remoteproc
create virtqueues backed by reserved shared DDR without deriving
carveout roles from DT node names. Map the shared-memory carveouts with
the common rproc_mem_entry_ioremap_wc() and rproc_mem_entry_iounmap()
callbacks.

Use the mailbox framework to send virtqueue notification IDs. Defer
received notifications to process context before dispatching them to
the remoteproc virtqueues. Keep mailbox payload storage valid until
transmit completion and order write-combined vring updates before each
kick.

For designs where the mailbox and remote processor share a clock, request
the mailbox channels only after enabling that clock, while the processor
is still held in reset. Release the channels before disabling the clock
during stop.

The mailboxes are optional. Without them the driver keeps supporting
load, start, and stop only.

Select the mailbox framework, the AMD PL Mailbox controller and the
virtio RPMsg bus, which the driver uses for notifications and RPMsg
channels. Selecting MAILBOX while depending on GPIOLIB creates a
Kconfig recursive dependency, because GPIOLIB is selected by drivers
that are reachable from MAILBOX, so select GPIOLIB as well instead of
depending on it. The driver always needs GPIO for the reset line.
Depend on HAS_IOMEM, which the selected mailbox controller and the
write-combined carveout mappings require.

Assisted-by: LLM sparse
Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 drivers/remoteproc/Kconfig              |   6 +-
 drivers/remoteproc/amd_mbv_bram_rproc.c | 231 +++++++++++++++++++++++-
 2 files changed, 235 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 5b56b2dcc725..9ebbbf76289f 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -25,7 +25,11 @@ config REMOTEPROC_CDEV
 
 config AMD_MBV_BRAM_REMOTEPROC
 	tristate "AMD MicroBlaze/V BRAM-based remoteproc support"
-	depends on OF && COMMON_CLK && (GPIOLIB || COMPILE_TEST)
+	depends on OF && COMMON_CLK && HAS_IOMEM
+	select GPIOLIB
+	select MAILBOX
+	select AMD_PL_MAILBOX
+	select RPMSG_VIRTIO
 	help
 	  Say y or m here to support a MicroBlaze/V BRAM-based remote
 	  processor managed through the remoteproc framework.
diff --git a/drivers/remoteproc/amd_mbv_bram_rproc.c b/drivers/remoteproc/amd_mbv_bram_rproc.c
index da621f62f7df..65d2c3946325 100644
--- a/drivers/remoteproc/amd_mbv_bram_rproc.c
+++ b/drivers/remoteproc/amd_mbv_bram_rproc.c
@@ -15,15 +15,20 @@
  * Reset is controlled via GPIO connected to Processor System Reset IP.
  */
 
+#include <linux/bitmap.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
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
 
@@ -32,13 +37,207 @@
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
+		dev_err(priv->dev, "failed to request tx mailbox: %d\n", ret);
+		return ret;
+	}
+
+	priv->rx_chan = mbox_request_channel_byname(&priv->rx_client, "rx");
+	if (IS_ERR(priv->rx_chan)) {
+		ret = PTR_ERR(priv->rx_chan);
+		priv->rx_chan = NULL;
+		mbox_free_channel(priv->tx_chan);
+		priv->tx_chan = NULL;
+		dev_err(priv->dev, "failed to request rx mailbox: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int amd_bram_rproc_add_reserved_mem(struct rproc *rproc)
+{
+	struct amd_bram_rproc *priv = rproc->priv;
+	struct device_node *np = priv->dev->of_node;
+	struct rproc_mem_entry *mem;
+	int count;
+	int ret;
+	int i;
+
+	if (!of_property_present(np, "memory-region"))
+		return 0;
+
+	count = of_reserved_mem_region_count(np);
+	if (count < 0)
+		return count;
+
+	for (i = 0; i < count; i++) {
+		struct resource res;
+		const char *name;
+
+		ret = of_property_read_string_index(np, "memory-region-names",
+						    i, &name);
+		if (ret)
+			return dev_err_probe(priv->dev, ret,
+					     "failed to read memory-region name %d\n",
+					     i);
+
+		ret = of_reserved_mem_region_to_resource(np, i, &res);
+		if (ret)
+			return dev_err_probe(priv->dev, ret,
+					     "failed to parse memory-region %d\n", i);
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
@@ -80,7 +279,7 @@ static int amd_bram_rproc_prepare(struct rproc *rproc)
 	rproc_add_carveout(rproc, mem);
 	rproc_coredump_add_segment(rproc, da, resource_size(&res));
 
-	return 0;
+	return amd_bram_rproc_add_reserved_mem(rproc);
 }
 
 static int amd_bram_rproc_start(struct rproc *rproc)
@@ -111,10 +310,17 @@ static int amd_bram_rproc_start(struct rproc *rproc)
 	/* Hold reset asserted long enough to provide a clean reset pulse. */
 	usleep_range(10, 20);
 
+	ret = amd_bram_rproc_request_mboxes(priv);
+	if (ret) {
+		clk_disable_unprepare(priv->clk);
+		return ret;
+	}
+
 	/* Deassert reset and let the processor run. */
 	ret = gpiod_direction_output(priv->reset, 0);
 	if (ret) {
 		dev_err(priv->dev, "failed to deassert reset: %d\n", ret);
+		amd_bram_rproc_free_mboxes(priv);
 		clk_disable_unprepare(priv->clk);
 		return ret;
 	}
@@ -133,6 +339,10 @@ static int amd_bram_rproc_stop(struct rproc *rproc)
 		dev_err(priv->dev, "failed to assert reset: %d\n", ret);
 		return ret;
 	}
+	cancel_work_sync(&priv->rx_work);
+	bitmap_zero(priv->pending_notify_ids,
+		    ARRAY_SIZE(priv->notify_msgs));
+	amd_bram_rproc_free_mboxes(priv);
 
 	/* Disable clock after asserting reset */
 	clk_disable_unprepare(priv->clk);
@@ -156,6 +366,8 @@ static const struct rproc_ops amd_bram_rproc_ops = {
 	.sanity_check	= rproc_elf_sanity_check,
 	.get_boot_addr	= rproc_elf_get_boot_addr,
 	.parse_fw	= amd_bram_rproc_parse_fw,
+	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
+	.kick		= amd_bram_rproc_kick,
 };
 
 static int amd_bram_rproc_probe(struct platform_device *pdev)
@@ -165,6 +377,7 @@ static int amd_bram_rproc_probe(struct platform_device *pdev)
 	const char *fw_name = NULL;
 	struct rproc *rproc;
 	int ret;
+	int i;
 
 	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
 	if (ret < 0 && ret != -EINVAL)
@@ -178,6 +391,8 @@ static int amd_bram_rproc_probe(struct platform_device *pdev)
 
 	priv = rproc->priv;
 	priv->dev = dev;
+	priv->rproc = rproc;
+	INIT_WORK(&priv->rx_work, amd_bram_rproc_rx_work);
 
 	/* Get the processor clock */
 	priv->clk = devm_clk_get(dev, NULL);
@@ -195,6 +410,20 @@ static int amd_bram_rproc_probe(struct platform_device *pdev)
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
 	rproc->auto_boot = false;
 
 	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
-- 
2.34.1

