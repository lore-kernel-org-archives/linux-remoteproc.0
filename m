Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011001.outbound.protection.outlook.com [52.101.52.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699E9472F95;
	Wed, 14 Oct 2026 21:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013688; cv=fail; b=JnOSa8qGBV5GGmuKmESL0Kt+qnCKZQaQ9+zImb/Dlt7uurJ4k/oWmQvY32vC2E4vtVAAK6nPVAPP/m51fMQVQVOoEM9ucvvAZqIjoQOsCH7da2PdJ3vKAapkBVqiQYNueoBqVzaFHHvScledq37GcFYAlWOds7Z5CadnKuXD4os=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013688; c=relaxed/simple;
	bh=ecxnv8e9v40vNlplD2hANB6KbfiaUO/r5P0gIgl8890=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K+xYw0oKmVoopHzuMF2O0/xekjxLXj2RWYdtbgFRgYbQ9k3hdb3/dTAlrgTsYKNaHoSBZm11foVQj2C1xKCpzm0XrXPO8S4ZfVMTSI68FQXQ4UAQw/Z5YOu4Q908/52HY9P7gOy8seavBEK00KKdhRUsEQM3Vj4qhTSOO6ztGRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ACjyke/u; arc=fail smtp.client-ip=52.101.52.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ACjyke/u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eT1+E//Jga92Iv+JA57kvmwtskcjeXnCTwmqFEsi54WEvZfNi+QtVqohgnaYbWGPJcR4wxfhEUDpcv1Jo/nemylwhYg2KO7+Kh4rzAnpWg7NZrlrp/yGWhhretsSOVhQdj+zOfZmKx78o6qaoGAKCYI8nr2qwqFaZ+1bteK/9sM7kvsoHw65sqr6OvhccjECOjMkbET74SsENYrO6NXTnyOvFgJOgFqpOJRcCg3SMvSwNRftUPy3k9m038VBjsG77CcCB3a9QJmbGpD3uzoPjKQ6w+p2XkBEUOcP17PS1YL2ugAS9JosR87KXMD6FQPF7uOLd2fZzs0tHobGStQxIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fygqlgZFJiQP0LSDJ2lH3n8bM/FkwXWFCMFdbHx+juE=;
 b=m/xJaYVW6r28p3ihzNogMMzzmDc6pZ0s1L5Fj2klYxw4g2jl1J1xQiUIXYNpczNt82wFkWGLaFdO1rBWBl1B8+9ac3UXoYaDTkG4r5IsUDYYCpyS5CsTPuYuedHXK9Hw0sXzE2Q9hgjVNh0ZkCcX72yytS5PD8o5T1dcMVZUIuvSVV4geGrqG//ct8zcWmWu+jWDo7vFkMDTv2170G4O6+J4o9NDw5ET4ZyWTkKkHCOfSvP6pogoT+NePsjNwgIcQcx6+JOfgmq8WYw74o/gTLbSUquD3yHDCwaul/w1Mrg34fTfEKdl6YhYLVgvXE21RUyU4MmDuuK5kCbjEzBn+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fygqlgZFJiQP0LSDJ2lH3n8bM/FkwXWFCMFdbHx+juE=;
 b=ACjyke/ua6qgLvW5v1UmiJSFfrXjcsA40Z492PO1+l7aeUvcVQGYTrmLIuiZehH8HD2zuHhpAIbblUJFE+RErKbFAsZk0ux0kdcRkNHPGXfsT40ZoJG6PXutZoEGghzelURKrdZaz7uG2FJVhKoQ6uHv+FehXq1pNdY+pjVo0b8=
Received: from PH7P220CA0168.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::19)
 by SJ0PR12MB6992.namprd12.prod.outlook.com (2603:10b6:a03:483::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Wed, 14 Oct
 2026 21:34:39 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:510:33b:cafe::60) by PH7P220CA0168.outlook.office365.com
 (2603:10b6:510:33b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 14
 Oct 2026 21:34:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 21:34:39 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 16:34:26 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 14 Oct 2026 16:34:25 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <michal.simek@amd.com>, <linux-remoteproc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <ben.levinsky@amd.com>, <tanmay.shah@amd.com>
Subject: [PATCH 4/6] mailbox: Add AMD PL Mailbox soft IP controller
Date: Wed, 14 Oct 2026 14:34:24 -0700
Message-ID: <20261014213426.2957480-5-ben.levinsky@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|SJ0PR12MB6992:EE_
X-MS-Office365-Filtering-Correlation-Id: 67269bf0-89c4-4eab-c515-08df2a3af3af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|7416014|82310400026|23010399003|10067099003|11063799006|56012099006|261009223027099003|22082099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	d7lpGg543D8e6UmYrNKgAbn6iNPEWyXkk2AO99tT4rXBW2wt3nPIojMYF9QEdzBbEvOfBrow5/LzYwz0HCfbGBM/nJbzTWXhljxTA4abAdF5v87oMn6Z7hZ71JYFl+s21m/pmZaIdD4y7maPJ7iXd5SR2rd8k88K7Uzoyu7YyG3dhsuvK6to3hIJhS/8ksTYo8SNiCpnzhUVA9/+LEK4+3yKjYUeQ6mY8zqFSyd2fUuy2FOcZxlR/SSkuqkCmQAJ+tA7mGJdu90I48IperbQs6vkTTzeEHTPlKMYXjKMGHnOm5ycnlTf41bVVLq8Da4XsQnJ/MaeOUQY0jT3n2XL3W8/pgpfnprvhm0msGnkYBsuE7k9I9sovfS0Nx3d6msCHz2qUsb+ho5C3vZon59YjB/2iLWKUxzqzLv5ihPRW0S7mvgLRKrZIYwtZRvr6G9uSPAynoVd9y0jfzZlQbcKPdsxx7fRc02dGM6Zojl1w25TF0GfFA3+ncd3khTp4OUU5b93AjQwbsKEh8wESNkPbtDubswV8AhqQPv9tAj41lcK3qzuqLsTj7es5Z/lxAA2OZKegflSynjk+CPNzRDUDNM7B0BI89XSKWJGGASsEeCvY82tBfSI2foXoUtpogoGxb176MtgvGQOP2AtVAqQlw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(7416014)(82310400026)(23010399003)(10067099003)(11063799006)(56012099006)(261009223027099003)(22082099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MBKqenFdzFw9L+FzF6S7nH7WlaKWZ0OIPBNdxraeG45U3cKQVyJJ+dH9uunyCxAraC6+Daoo2d4vn4vix+9sWhTYDCKeCkS9p/s6FP1k60T9jDmb8kZig+T5W6RbkZGOmfFtV5adtAIry0B7Gr23CwFMzVYyEiVEXkTNypnjlbs9xQBYWu//wqJS6deFS0pJF4+TFeQDMXgVweRbZY0svTnF7UzFfMBI5b2h2pAcNLLvRDQyPXNLx+huz9eiKEsCasdIJv4J7V2y6c10TgXBzyW1Pt7V0HaHrENOw2btj/TJgm4jBc3CET/axn0peWFWmDHH/5DBMMDfEsAdwJzkECIJuyL/BgA91AJUCEDTkhTF7FSnqNgkSt/8C+SVKNnL1heSfvDZP+QvEsLYrYVcGFvgFLSu9C++eOxE7HC9edKV0jajqQuHoe9raz3HKtjM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 21:34:39.4015
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67269bf0-89c4-4eab-c515-08df2a3af3af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6992

Add a mailbox-framework controller for the AMD programmable-logic
Mailbox soft IP. Expose separate transmit and receive FIFO channels.

Enable the interface clock only while a channel is started, before any
register access, and disable it last when the channel shuts down. Keep
provider probe free of register accesses and leave the IRQ disabled until
a client starts the receive channel. Initialize each FIFO when its channel
starts, use receive-threshold interrupts for incoming words, and poll the
send-threshold status for transmit completion. Stop that polling from
accessing registers once the transmit channel begins to shut down.

Carry mailbox payloads in struct zynqmp_ipi_message, limited to the FIFO
depth given by the device tree. The FIFO transfers 32-bit words and the
hardware conveys neither a byte count nor the FIFO occupancy, so a
transmit length that is not a multiple of four is zero-padded to a whole
word.

On a receive-threshold interrupt, read up to one FIFO depth of words and
deliver them as one message, then acknowledge the interrupt. The event
latches only when the FIFO goes from empty to nonempty, so a word that
arrives between the drain and the acknowledge, or words left by the
bounded drain, raise no new event. If the FIFO is nonempty after the
acknowledge, toggle the threshold to latch a new event for them.

Assisted-by: LLM sparse
Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 MAINTAINERS                      |   7 +
 drivers/mailbox/Kconfig          |  10 +
 drivers/mailbox/Makefile         |   1 +
 drivers/mailbox/amd-pl-mailbox.c | 369 +++++++++++++++++++++++++++++++
 4 files changed, 387 insertions(+)
 create mode 100644 drivers/mailbox/amd-pl-mailbox.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..4e28e0c311c0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1287,6 +1287,13 @@ S:	Supported
 T:	git https://gitlab.freedesktop.org/agd5f/linux.git
 F:	drivers/gpu/drm/amd/pm/
 
+AMD PROGRAMMABLE LOGIC MAILBOX DRIVER
+M:	Ben Levinsky <ben.levinsky@amd.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mailbox/amd,zynqmp-pl-mbox-2.1.yaml
+F:	drivers/mailbox/amd-pl-mailbox.c
+
 AMD PSTATE DRIVER
 M:	Huang Rui <ray.huang@amd.com>
 M:	Mario Limonciello <mario.limonciello@amd.com>
diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index ab869769e278..3c3f262c903c 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -8,6 +8,16 @@ menuconfig MAILBOX
 
 if MAILBOX
 
+config AMD_PL_MAILBOX
+	tristate "AMD PL Mailbox soft IP controller"
+	depends on HAS_IOMEM
+	depends on OF
+	help
+	  Mailbox controller for the AMD Programmable Logic Mailbox soft IP.
+	  The controller exposes transmit and receive FIFO channels to mailbox
+	  clients. It supports interrupt-driven receive notification and
+	  polling-based transmit completion through the common mailbox framework.
+
 config ARM_MHU
 	tristate "ARM MHU Mailbox"
 	depends on ARM_AMBA
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 45dc59bb3e7f..5614d7e1e2f8 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -4,6 +4,7 @@
 obj-$(CONFIG_MAILBOX)		+= mailbox.o
 
 obj-$(CONFIG_MAILBOX_TEST)	+= mailbox-test.o
+obj-$(CONFIG_AMD_PL_MAILBOX)	+= amd-pl-mailbox.o
 
 obj-$(CONFIG_ARM_MHU)	+= arm_mhu.o arm_mhu_db.o
 
diff --git a/drivers/mailbox/amd-pl-mailbox.c b/drivers/mailbox/amd-pl-mailbox.c
new file mode 100644
index 000000000000..bd6595332f53
--- /dev/null
+++ b/drivers/mailbox/amd-pl-mailbox.c
@@ -0,0 +1,369 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mailbox/zynqmp-ipi-message.h>
+#include <linux/mailbox_controller.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+#define AMD_PL_MBOX_WRDATA		0x00
+#define AMD_PL_MBOX_RDDATA		0x08
+#define AMD_PL_MBOX_STATUS		0x10
+#define AMD_PL_MBOX_ERROR		0x14
+#define AMD_PL_MBOX_SEND_THRESHOLD	0x18
+#define AMD_PL_MBOX_RECV_THRESHOLD	0x1c
+#define AMD_PL_MBOX_IRQ_STATUS		0x20
+#define AMD_PL_MBOX_IRQ_ENABLE		0x24
+#define AMD_PL_MBOX_CTRL		0x2c
+
+#define AMD_PL_MBOX_STS_RX_EMPTY	BIT(0)
+#define AMD_PL_MBOX_STS_TX_FULL		BIT(1)
+#define AMD_PL_MBOX_STS_TX_THRESHOLD	BIT(2)
+#define AMD_PL_MBOX_IRQ_RX_THRESHOLD	BIT(1)
+#define AMD_PL_MBOX_IRQ_ERROR		BIT(2)
+#define AMD_PL_MBOX_CTRL_TX_RESET	BIT(0)
+#define AMD_PL_MBOX_CTRL_RX_RESET	BIT(1)
+
+/* FIFO depth range of the IP, in 32-bit words. */
+#define AMD_PL_MBOX_FIFO_LEN_MIN	16
+#define AMD_PL_MBOX_FIFO_LEN_MAX	8192
+
+/*
+ * The send threshold is active while send FIFO occupancy is less than or
+ * equal to the programmed value. The receive threshold is active while
+ * receive FIFO occupancy is greater than the programmed value. The related
+ * interrupt status bits latch when a threshold condition becomes active,
+ * and a new event takes priority over a simultaneous status clear.
+ *
+ * A send threshold of zero makes the status bit indicate an empty TX FIFO.
+ * A receive threshold of zero raises an interrupt for the first received
+ * word after the RX FIFO becomes empty.
+ */
+
+enum {
+	AMD_PL_MBOX_CHAN_TX = 0,
+	AMD_PL_MBOX_CHAN_RX = 1,
+	AMD_PL_MBOX_NUM_CHANS = 2,
+};
+
+/**
+ * struct amd_pl_mbox - AMD PL Mailbox controller state
+ * @regs: mapped register aperture
+ * @clk: interface clock, enabled while a channel is started
+ * @irq: receive interrupt
+ * @fifo_len: FIFO depth in 32-bit words
+ * @tx_lock: serializes TX completion polling against TX shutdown
+ * @tx_active: TX channel is started and its registers may be accessed
+ * @controller: common mailbox controller
+ * @chans: transmit and receive mailbox channels
+ * @rx_msg: receive buffer passed to mailbox clients
+ */
+struct amd_pl_mbox {
+	void __iomem *regs;
+	struct clk *clk;
+	int irq;
+	u32 fifo_len;
+	spinlock_t tx_lock; /* protects tx_active */
+	bool tx_active;
+	struct mbox_controller controller;
+	struct mbox_chan chans[AMD_PL_MBOX_NUM_CHANS];
+	struct zynqmp_ipi_message *rx_msg;
+};
+
+static int amd_pl_mbox_send_data(struct mbox_chan *chan, void *data)
+{
+	struct amd_pl_mbox *mb = chan->con_priv;
+	struct zynqmp_ipi_message *msg = data;
+	size_t offset;
+
+	if (chan != &mb->chans[AMD_PL_MBOX_CHAN_TX])
+		return -EINVAL;
+
+	/* The TX FIFO is empty here, since TX completion waits for it. */
+	if (!msg || !msg->len || msg->len > mb->fifo_len * sizeof(u32))
+		return -EINVAL;
+
+	for (offset = 0; offset < msg->len; offset += sizeof(u32)) {
+		size_t count = min(sizeof(u32), msg->len - offset);
+		u32 word = 0;
+
+		if (readl(mb->regs + AMD_PL_MBOX_STATUS) &
+		    AMD_PL_MBOX_STS_TX_FULL)
+			return -EBUSY;
+
+		memcpy(&word, &msg->data[offset], count);
+		writel(word, mb->regs + AMD_PL_MBOX_WRDATA);
+	}
+
+	return 0;
+}
+
+static bool amd_pl_mbox_last_tx_done(struct mbox_chan *chan)
+{
+	struct amd_pl_mbox *mb = chan->con_priv;
+	unsigned long flags;
+	bool done = true;
+
+	/*
+	 * The mailbox core can poll after shutdown() has started, while the
+	 * interface clock is being disabled. Do not access registers then.
+	 */
+	spin_lock_irqsave(&mb->tx_lock, flags);
+	if (mb->tx_active)
+		/* SIT is zero, so the threshold status means TX FIFO empty. */
+		done = readl(mb->regs + AMD_PL_MBOX_STATUS) &
+		       AMD_PL_MBOX_STS_TX_THRESHOLD;
+	spin_unlock_irqrestore(&mb->tx_lock, flags);
+
+	return done;
+}
+
+static int amd_pl_mbox_startup(struct mbox_chan *chan)
+{
+	struct amd_pl_mbox *mb = chan->con_priv;
+	unsigned long flags;
+	u32 irq_enable;
+	int ret;
+
+	if (chan != &mb->chans[AMD_PL_MBOX_CHAN_TX] &&
+	    chan != &mb->chans[AMD_PL_MBOX_CHAN_RX])
+		return -EINVAL;
+
+	ret = clk_prepare_enable(mb->clk);
+	if (ret)
+		return ret;
+
+	if (chan == &mb->chans[AMD_PL_MBOX_CHAN_TX]) {
+		writel(AMD_PL_MBOX_CTRL_TX_RESET, mb->regs + AMD_PL_MBOX_CTRL);
+		writel(0, mb->regs + AMD_PL_MBOX_SEND_THRESHOLD);
+
+		spin_lock_irqsave(&mb->tx_lock, flags);
+		mb->tx_active = true;
+		spin_unlock_irqrestore(&mb->tx_lock, flags);
+
+		return 0;
+	}
+
+	writel(AMD_PL_MBOX_CTRL_RX_RESET, mb->regs + AMD_PL_MBOX_CTRL);
+	/* Interrupt when the RX FIFO changes from empty to nonempty. */
+	writel(0, mb->regs + AMD_PL_MBOX_RECV_THRESHOLD);
+	writel(AMD_PL_MBOX_IRQ_RX_THRESHOLD | AMD_PL_MBOX_IRQ_ERROR,
+	       mb->regs + AMD_PL_MBOX_IRQ_STATUS);
+	irq_enable = readl(mb->regs + AMD_PL_MBOX_IRQ_ENABLE);
+	irq_enable |= AMD_PL_MBOX_IRQ_RX_THRESHOLD | AMD_PL_MBOX_IRQ_ERROR;
+	writel(irq_enable, mb->regs + AMD_PL_MBOX_IRQ_ENABLE);
+	enable_irq(mb->irq);
+
+	return 0;
+}
+
+static void amd_pl_mbox_shutdown(struct mbox_chan *chan)
+{
+	struct amd_pl_mbox *mb = chan->con_priv;
+	unsigned long flags;
+	u32 irq_enable;
+
+	if (chan == &mb->chans[AMD_PL_MBOX_CHAN_TX]) {
+		spin_lock_irqsave(&mb->tx_lock, flags);
+		mb->tx_active = false;
+		spin_unlock_irqrestore(&mb->tx_lock, flags);
+
+		writel(AMD_PL_MBOX_CTRL_TX_RESET, mb->regs + AMD_PL_MBOX_CTRL);
+		clk_disable_unprepare(mb->clk);
+		return;
+	}
+
+	if (chan != &mb->chans[AMD_PL_MBOX_CHAN_RX])
+		return;
+
+	disable_irq(mb->irq);
+	irq_enable = readl(mb->regs + AMD_PL_MBOX_IRQ_ENABLE);
+	irq_enable &= ~(AMD_PL_MBOX_IRQ_RX_THRESHOLD | AMD_PL_MBOX_IRQ_ERROR);
+	writel(irq_enable, mb->regs + AMD_PL_MBOX_IRQ_ENABLE);
+	writel(AMD_PL_MBOX_IRQ_RX_THRESHOLD | AMD_PL_MBOX_IRQ_ERROR,
+	       mb->regs + AMD_PL_MBOX_IRQ_STATUS);
+	writel(AMD_PL_MBOX_CTRL_RX_RESET, mb->regs + AMD_PL_MBOX_CTRL);
+	clk_disable_unprepare(mb->clk);
+}
+
+static const struct mbox_chan_ops amd_pl_mbox_ops = {
+	.send_data = amd_pl_mbox_send_data,
+	.last_tx_done = amd_pl_mbox_last_tx_done,
+	.startup = amd_pl_mbox_startup,
+	.shutdown = amd_pl_mbox_shutdown,
+};
+
+static void amd_pl_mbox_rx(struct amd_pl_mbox *mb)
+{
+	/* data[] follows a size_t in a kzalloc() buffer: u32 aligned. */
+	u32 *rx_words = (u32 *)mb->rx_msg->data;
+	u32 words;
+
+	/*
+	 * The hardware reports neither the peer's message length nor the FIFO
+	 * occupancy. Read until the FIFO is empty, up to one FIFO depth, and
+	 * deliver the words as one message.
+	 */
+	for (words = 0; words < mb->fifo_len; words++) {
+		if (readl(mb->regs + AMD_PL_MBOX_STATUS) &
+		    AMD_PL_MBOX_STS_RX_EMPTY)
+			break;
+
+		rx_words[words] = readl(mb->regs + AMD_PL_MBOX_RDDATA);
+	}
+
+	if (words) {
+		mb->rx_msg->len = words * sizeof(u32);
+		mbox_chan_received_data(&mb->chans[AMD_PL_MBOX_CHAN_RX],
+					mb->rx_msg);
+	}
+}
+
+static void amd_pl_mbox_rx_rearm(struct amd_pl_mbox *mb)
+{
+	/*
+	 * The receive event latches only when the FIFO goes from empty to
+	 * nonempty. A word that arrived after the drain, but before the event
+	 * was acknowledged, had its event cleared, and words left by the
+	 * bounded drain never raised one. Raise the threshold and lower it
+	 * again to latch a new event, so that the interrupt fires for them.
+	 * This cannot latch an event while the FIFO is full, which happens only
+	 * if the peer writes a full FIFO depth during one interrupt.
+	 */
+	if (!(readl(mb->regs + AMD_PL_MBOX_STATUS) &
+	      AMD_PL_MBOX_STS_RX_EMPTY)) {
+		writel(mb->fifo_len - 1, mb->regs + AMD_PL_MBOX_RECV_THRESHOLD);
+		writel(0, mb->regs + AMD_PL_MBOX_RECV_THRESHOLD);
+	}
+}
+
+static irqreturn_t amd_pl_mbox_irq(int irq, void *data)
+{
+	struct amd_pl_mbox *mb = data;
+	u32 pending_intr;
+	u32 irq_enable;
+	u32 irq_status;
+
+	irq_status = readl(mb->regs + AMD_PL_MBOX_IRQ_STATUS);
+	irq_enable = readl(mb->regs + AMD_PL_MBOX_IRQ_ENABLE);
+	pending_intr = irq_status & irq_enable;
+
+	if (!pending_intr) {
+		dev_warn_ratelimited(mb->controller.dev,
+				     "unexpected interrupt: status %#x enable %#x\n",
+				     irq_status, irq_enable);
+		return IRQ_NONE;
+	}
+
+	if (pending_intr & AMD_PL_MBOX_IRQ_RX_THRESHOLD)
+		amd_pl_mbox_rx(mb);
+
+	if (pending_intr & AMD_PL_MBOX_IRQ_ERROR)
+		dev_warn_ratelimited(mb->controller.dev,
+				     "mailbox FIFO error: %#x\n",
+				     readl(mb->regs + AMD_PL_MBOX_ERROR));
+
+	writel(pending_intr, mb->regs + AMD_PL_MBOX_IRQ_STATUS);
+
+	if (pending_intr & AMD_PL_MBOX_IRQ_RX_THRESHOLD)
+		amd_pl_mbox_rx_rearm(mb);
+
+	return IRQ_HANDLED;
+}
+
+static struct mbox_chan *amd_pl_mbox_xlate(struct mbox_controller *ctlr,
+					   const struct of_phandle_args *sp)
+{
+	if (sp->args_count != 1 || sp->args[0] >= AMD_PL_MBOX_NUM_CHANS)
+		return ERR_PTR(-EINVAL);
+
+	return &ctlr->chans[sp->args[0]];
+}
+
+static int amd_pl_mbox_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct amd_pl_mbox *mb;
+	int ret;
+	int i;
+
+	mb = devm_kzalloc(dev, sizeof(*mb), GFP_KERNEL);
+	if (!mb)
+		return -ENOMEM;
+
+	spin_lock_init(&mb->tx_lock);
+
+	mb->fifo_len = AMD_PL_MBOX_FIFO_LEN_MIN;
+	ret = of_property_read_u32(dev->of_node, "amd,mbox-pl-fifo-len",
+				   &mb->fifo_len);
+	if (ret && ret != -EINVAL)
+		return dev_err_probe(dev, ret, "failed to read FIFO length\n");
+
+	if (mb->fifo_len < AMD_PL_MBOX_FIFO_LEN_MIN ||
+	    mb->fifo_len > AMD_PL_MBOX_FIFO_LEN_MAX)
+		return dev_err_probe(dev, -EINVAL, "invalid FIFO length %u\n",
+				     mb->fifo_len);
+
+	mb->rx_msg = devm_kzalloc(dev, struct_size(mb->rx_msg, data,
+						   mb->fifo_len * sizeof(u32)),
+				  GFP_KERNEL);
+	if (!mb->rx_msg)
+		return -ENOMEM;
+
+	mb->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(mb->regs))
+		return PTR_ERR(mb->regs);
+
+	mb->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(mb->clk))
+		return dev_err_probe(dev, PTR_ERR(mb->clk), "failed to get clock\n");
+
+	mb->irq = platform_get_irq(pdev, 0);
+	if (mb->irq < 0)
+		return mb->irq;
+
+	for (i = 0; i < AMD_PL_MBOX_NUM_CHANS; i++)
+		mb->chans[i].con_priv = mb;
+
+	mb->controller.dev = dev;
+	mb->controller.ops = &amd_pl_mbox_ops;
+	mb->controller.chans = mb->chans;
+	mb->controller.num_chans = AMD_PL_MBOX_NUM_CHANS;
+	mb->controller.txdone_poll = true;
+	mb->controller.txpoll_period = 1;
+	mb->controller.of_xlate = amd_pl_mbox_xlate;
+
+	ret = devm_request_irq(dev, mb->irq, amd_pl_mbox_irq,
+			       IRQF_NO_AUTOEN,
+			       dev_name(dev), mb);
+	if (ret)
+		return ret;
+
+	return devm_mbox_controller_register(dev, &mb->controller);
+}
+
+static const struct of_device_id amd_pl_mbox_of_match[] = {
+	{ .compatible = "amd,zynqmp-pl-mbox-2.1" },
+	{ .compatible = "amd,versal-pl-mbox-2.1" },
+	{ .compatible = "amd,versal-net-pl-mbox-2.1" },
+	{ .compatible = "amd,versal2-pl-mbox-2.1" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, amd_pl_mbox_of_match);
+
+static struct platform_driver amd_pl_mbox_driver = {
+	.probe = amd_pl_mbox_probe,
+	.driver = {
+		.name = "amd-pl-mailbox",
+		.of_match_table = amd_pl_mbox_of_match,
+	},
+};
+module_platform_driver(amd_pl_mbox_driver);
+
+MODULE_DESCRIPTION("AMD PL Mailbox soft IP controller");
+MODULE_LICENSE("GPL");
-- 
2.34.1

