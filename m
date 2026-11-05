Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793855986;
	b=acRGYp2GcTjta4Vym2M1Dvf2KiAwU0gRg+jKR1kEhALZzYGUHtYlTPaFRUmPEZwsaAY/
	 5YjtIMygnBg4VzaEgT2P44tb6YeN+M4UFuErR/Olq7jqDdXE6eb4HguHF7xe2gFbfI6Xb
	 8/VtwUZnO5MGi15ZDTrF3dlr2fLuTevcLvdYfjYsnVMdf6Icibjah9nbTY+EIMQD+JQPC
	 uq8aWI/xgxeYuLXRiKTbYV+NDkWYTHF6uLQpzsCHV+NyiTY8GTgNzDGc+e88ivY81SMAX
	 H7DpMTEh2p6h/JuHW1RKNy4+YE9ZIkjDhFD7o89wL6/vGKN9jNg246jsr2d6bOerGkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855986;
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
	bh=t4O0PdlOQUSppIuqBLdSLVl6sa/ssSJmmqKpnoW7+4Q=;
	b=ViWVT+2o/25JydwU/aQrgp3KJBZGJ8od9to5OcuGFh+YEiS+pbwdLgb65dXXezymnF8b
	 /WgVyYWv2Wo3TlgTMck3eYm+zpv48MLyShlIrV1XUcv03ynIrnkA9Z9Xpxx44mz/t0YwY
	 kmyWNQjHc5S6fOO5Ie05enl1w++H7ELeyxb5ZcPeYV+LCC2Ih4Odnh5b/7u36uz7ko3cW
	 nK8kj3HziUBZwalySBfoW4fzvqvHRxz9eEcPugAmQrgBr8nAvJMfY48WHqLeVsmWHkleA
	 sVc1XFqYAYcugDGkb+gNvFOCUflsxmhb7fHOZeb/VWLnee3Ty0MLzQJMziU5dikR5Jw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="tJph/B9t";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.40
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011040.outbound.protection.outlook.com [52.101.52.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68849606A326;
	Thu,  5 Nov 2026 05:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68849606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tJph/B9t
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6O0elKPiJzEbijb++lctJpjT1WFWA9xYiPfHnoz1ufY1k/QhROzVw1gJGSosRCYAYDKVl1VZiNLpxr2kaOUUDpurgu679yNSARGySkiEjb/YbzrKwj08FoHj30UMpk5fev71PTN/hapZ2Kf8Z3RyHo+bmh9YGTOPnLw9+3tM16p7f7JZxk+/GMm4caWZ8qOovLc8579xFAjrqrRXGJ9SNu5GuyZqfRFBYEA5FBomTioNAJEi6OLTCdWVnmOHOoEUygLk1qfyT0Ul+yf3lDvCn+WjvdLsVj5Qyj7uxbR9kFlCdoRC28c1tYMpzt+TPPv0oaL7dFSZIThhz1S6eODdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4O0PdlOQUSppIuqBLdSLVl6sa/ssSJmmqKpnoW7+4Q=;
 b=ejZptED9KoG+M+fV8MIyBKLB0JjBkz4IvmiwBcZGAw84ST7Mm053WVwcBEkDulbwpYd1GE0guGN6rYY1X3s3uocEVNKCxI8goniSzgD+AgPZ8irPtdNcucKO+S8MQibEeo4xSOeHau3bvlEFg1vhCA2N5IVfp5jANVPCBsiccHwxJAbe0pduo8HKPxNRcpIfQmdXSdkUvhNk171mPTcCcIp9xzufSaNp5/rjZzmoS4Wglqzol85ADvHhIEQ94VKwKYl7EIf3YDIvSwHY/BoexKIYVUz8cNueZUxrxaQbPA1B6Y0k9KoZG5DQzOS4cc6BvZ/OUsqqRUDeF9UXu+oenw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4O0PdlOQUSppIuqBLdSLVl6sa/ssSJmmqKpnoW7+4Q=;
 b=tJph/B9twnMVdOvslkLId0kekrh+Dzq8T9KunzjZTaXh3qXaPBTx/TP8HSrMPOJobDs1MjIpSArD5ZQxyDX3eVSN5zaDDU7xhJtWkcm478ERuGmYgxP/5bmNYxj/T6Y0gR4SW63DBHhDNnVeHpvbOdYNuTd2BE/OP1TMMjzgiOs=
Received: from BN0PR07CA0005.namprd07.prod.outlook.com (2603:10b6:408:141::20)
 by MW3PR12MB4361.namprd12.prod.outlook.com (2603:10b6:303:5a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 05:19:40 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:408:141:cafe::88) by BN0PR07CA0005.outlook.office365.com
 (2603:10b6:408:141::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 05:19:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 05:19:40 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 23:19:10 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 23:19:10 -0600
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 4 Nov 2026 23:19:09 -0600
From: Ben Levinsky <ben.levinsky@amd.com>
To: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <michal.simek@amd.com>, <tanmay.shah@amd.com>, <ben.levinsky@amd.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 6/6] remoteproc: amd_mbv_bram: Add RPMsg support
Date: Wed, 4 Nov 2026 21:19:02 -0800
Message-ID: <20261105051902.1646651-7-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|MW3PR12MB4361:EE_
X-MS-Office365-Filtering-Correlation-Id: b41b4e9d-34e6-43f1-9761-08df3afc6466
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|7416014|376014|18002099003|22082099003|11063799006|261021123027099003|261026121527099003|56012099006|261009223327099003|261026140227099003|261026135527099003|261009220027099003|261028144727099003|261009221227099003|261026130827099003|261009223027099003|261009221727099003|261022075727099003|261102123227099003|261021130227099003|261022105027099003|261021133027099003|261021121427099003|261022115727099003|261022113327099003|261021135927099003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	2iAYF6/W0M7qfT3UpV39+btEl16/kUolBnpDRzNk8+gI/KW4gdQ5wrW8SPfP5vdHZ9Z/Wy+rHNA2WGIqRMK8z5KOdSXv94p45aq3irZE5yE8C65KKcxQb5ujs8UtLyMDcKmBY9nvwCiv02vlgqZ5WK4rwIHkh2fxDVE+DWWf3zrZnqMwEcg8Zz0xEqmVB6VQk22wKFxHE1q2PVRCIKalJoxn/qoTAVzuTnI9LLgxsdzTwsQyodyVmFZmWXmiA75NdVw1K2emTwNtucHlVaWZ6yQaXrT0uKUX1PGBTGyI5CZ4tJ4SZw1iWGK5bWY/Und7dBIhnANXXQ6UJYqtuXcstNwGJyYuSr+hKYjt8JRuZolVr/iBthGkwqws6r660IvX0aujC16nS0rHNRIf05ue7ythj7ZBL1bMi4w5hulgKG5lHpmNxgphMLAHiMvHceB6k9HTtw2nr+ee0AYHeU8VJaXTZKCtXtJN6N1I51eyvJk+S+ay0/EhBKkPXxow+eXk1ajRsYqAwIX2W1usDkqhbVDSdldtC0PJg/RSmVUOIuDVi3gZeWdJivtEHPJ3JeFv0VmOKrXFEp2/xbYlW3Zs/nO71drMLEKyeYbVg/dA05x/YON9pY0pgA1XEz2aWQNSbs32RzuSfacHhZkBndof9fYwn/OSzqxVQkP11fa3cybSMT1IZMRoSZA8aupuHk+zZ3lUA50I7sS/9Yds8znzgQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(7416014)(376014)(18002099003)(22082099003)(11063799006)(261021123027099003)(261026121527099003)(56012099006)(261009223327099003)(261026140227099003)(261026135527099003)(261009220027099003)(261028144727099003)(261009221227099003)(261026130827099003)(261009223027099003)(261009221727099003)(261022075727099003)(261102123227099003)(261021130227099003)(261022105027099003)(261021133027099003)(261021121427099003)(261022115727099003)(261022113327099003)(261021135927099003)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jeO02LrzjxYb9oAT/WpblpZdiPw0KLEFu9wJVzY8YywarTNJB5Noiz/E3rTv16gYROtrgvqAtysOG4AzF/qj9k0vkvUILK0O0+suis/vd2CX8U+cvR6EYi8syU7H93eC3axij6vZDIKW6Ty0S+1nNVIrHRIphWvW7+yqJv34r3aHdAPeUWCxmZnys2Q8weMisJi2YReXV3z9wa6hnpE4FWJR6Nk2UEOs7auQ/b8rAmGW52JQU0aGuBhdiogFTPb1ypu4NxCOx3/gQEtOuknZEe4gEzae+marhoNCEW9cA4M3rPnNULz4tTKfoKV1di3Fsirqb6urvtNUjXb5DwTcSRQVhrkwBqq0EOY9pxaKAVkHWkOXw1Wgr+0EKalyiHwxqyPucwpLnSNzE+QojYtcHVyBUjSvMCmYCN+JAB4bA3+7cmvGHD1U40U6w7pFZotr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 05:19:40.0124
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b41b4e9d-34e6-43f1-9761-08df3afc6466
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4361

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

Request the mailbox channels at probe time, so that a missing mailbox
controller defers the probe instead of failing a later start. Release
them when the device is unbound, after the remote processor has been
stopped. Free the channels before cancelling the receive work, so that a
late notification cannot queue the work again.

The mailboxes are optional. Without them the driver keeps supporting
load, start, and stop only.

The driver now calls the mailbox client API, which has no stubs for
!MAILBOX, so depend on MAILBOX. This makes the driver unavailable in
configurations without the mailbox framework, even for designs that do
not use RPMsg. The PL Mailbox controller and the virtio RPMsg bus are
only needed at run time; the Kconfig help text names them.

Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 drivers/remoteproc/Kconfig              |   5 +
 drivers/remoteproc/amd_mbv_bram_rproc.c | 245 +++++++++++++++++++++++-
 2 files changed, 249 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 5b56b2dcc725..4efb60a953a7 100644
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
index da621f62f7df..9c2694fd645a 100644
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
 
@@ -32,13 +37,220 @@
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
@@ -80,7 +292,7 @@ static int amd_bram_rproc_prepare(struct rproc *rproc)
 	rproc_add_carveout(rproc, mem);
 	rproc_coredump_add_segment(rproc, da, resource_size(&res));
 
-	return 0;
+	return amd_bram_rproc_add_reserved_mem(rproc);
 }
 
 static int amd_bram_rproc_start(struct rproc *rproc)
@@ -133,6 +345,9 @@ static int amd_bram_rproc_stop(struct rproc *rproc)
 		dev_err(priv->dev, "failed to assert reset: %d\n", ret);
 		return ret;
 	}
+	cancel_work_sync(&priv->rx_work);
+	bitmap_zero(priv->pending_notify_ids,
+		    ARRAY_SIZE(priv->notify_msgs));
 
 	/* Disable clock after asserting reset */
 	clk_disable_unprepare(priv->clk);
@@ -156,6 +371,8 @@ static const struct rproc_ops amd_bram_rproc_ops = {
 	.sanity_check	= rproc_elf_sanity_check,
 	.get_boot_addr	= rproc_elf_get_boot_addr,
 	.parse_fw	= amd_bram_rproc_parse_fw,
+	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
+	.kick		= amd_bram_rproc_kick,
 };
 
 static int amd_bram_rproc_probe(struct platform_device *pdev)
@@ -165,6 +382,7 @@ static int amd_bram_rproc_probe(struct platform_device *pdev)
 	const char *fw_name = NULL;
 	struct rproc *rproc;
 	int ret;
+	int i;
 
 	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
 	if (ret < 0 && ret != -EINVAL)
@@ -178,6 +396,8 @@ static int amd_bram_rproc_probe(struct platform_device *pdev)
 
 	priv = rproc->priv;
 	priv->dev = dev;
+	priv->rproc = rproc;
+	INIT_WORK(&priv->rx_work, amd_bram_rproc_rx_work);
 
 	/* Get the processor clock */
 	priv->clk = devm_clk_get(dev, NULL);
@@ -195,6 +415,29 @@ static int amd_bram_rproc_probe(struct platform_device *pdev)
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

