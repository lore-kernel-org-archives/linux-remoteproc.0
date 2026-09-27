Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41271248880
	for <linux-remoteproc@vger.kernel.org>; Sun, 27 Sep 2026 00:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790468454; cv=none; b=g7QRtxb1ldZwLXaJ4eKp8OloFOHT/mBFWH3Opb0Tst+5d47iusjozZLGhD4h3rniJe1IbUs054BcA8wYReZsC8DYV/mgZfpdkJI4EncJu3/jpuQV8tL+hyoabw7kOJVV5GyTWsp+8KqvoLJP63z3fhNe9XVZ/BCM0XEb5KJS94I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790468454; c=relaxed/simple;
	bh=GIeFzqkf+t90OFEOly3kIqkEDK9YoFqQscjmy9Bb7zM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dUPO4sKv9Yu/RWxpqypVTtx2C9JsOW/UlQnbTZ05pflwu+nlHCUvqXxZIlHmpfPfvdihlYi7n127CcaVfmjIdkJNJY+7tOQDinWhJkv1sD89Mgc5i6MIk3F9q5U4xyEnZDq/0Z40A4YkIvbkmBtKzjG7W2fsWdZeM8pr3XNCdKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9LCjacC; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9LCjacC"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6d33d80855eso1480529eaf.1
        for <linux-remoteproc@vger.kernel.org>; Sat, 26 Sep 2026 17:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790468451; x=1791073251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hI4LzcR5N9hwvq4XXdv1TVoYIFqgkaE3x77LOlHbgrY=;
        b=Q9LCjacCLCBsxXUhGEMOJEE0yGeyZdU2nzeLF2PCfYTeVSHt53/G+6HEUM5RvQAFfv
         cP1gxkoGtW0JdQf5uYf9V5mCdtXcNV1LtbzsttWvE1f2kUiahmhgKPxvCPeFVm7MuFxS
         XHu4dCmBop9eJljQGFlyRIzq8itu1F3n+qnvKqOmGL+2pp11BhIWM7DrZPjAk7gnncb6
         1m1LOQodncTSrS2Aq6ZI1qk/zjgwYMTgd8HXNsQN+lyiXyKAT3iswNAaTtOGRiA9S4vT
         7H0CmwyO5xZDozOz9aKWqbXhinRxAVjVH8j7iWsdkdIiL1I9Pz/lXEXsvG51vGgcTXKD
         Edvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790468451; x=1791073251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hI4LzcR5N9hwvq4XXdv1TVoYIFqgkaE3x77LOlHbgrY=;
        b=vbnonlg4ElYIqvAbYGq4afR61aCYM4lxWNHIZXC+n3IUKLg1omjRpfzKtpilFsYLmc
         ywG5krV7pdHxPH0kDLb9IREoM86NEl/A4tYzZRr+GZkt2t7TTYOnfVl7qaIvpzUFzeh2
         OclhmaLMGtjAD2kqBI9sIZSba8q5a0Cz1XDSq/0deDAI2bWWwHALcPVrpilYdabEVWS8
         dLTeY/rxHmBH989LNLAi5Gf2R2xjcP7dEkotabKVj1t5a/Vj0GRkjkP2Ycb1PVrB8k3h
         ufErEaNvSyKs89+KhzD4Z/FMt0cxOFPhz5mnttqvQAr8dcu6kkUIYKZrdBUTeym5DrzU
         B66A==
X-Forwarded-Encrypted: i=1; AKwUvByooM4DlvHEaMWCzwSo8PxhrosHCvIq/B9XYuaiL/LsNfAM6JF5QDU2Yu/H/S0pAcfTgvv6QOWxvo1axtjIFyvO@vger.kernel.org
X-Gm-Message-State: AFuF++nEEgcGnGUgKfVq/MwBytVqR+KfCsVbmFiazS7UmKNQ+ks0FDT+
	rY8PE64X5/WM63/bUezrU+lmVoCsaqo7Sppq1uTiQkE7Sm9PofGPoB5t
X-Gm-Gg: AYBFou0IU8bJbgPWugY/p0zIa3eGSOxaUUcjvRFWdkD+ZvwbHTIfJpNdlNV90pxUb78
	dHl8goGqv3btrBiOOJSXBT+mE8FWK7ZQMym4FdF8W79i38oHSHDO21h/urmdX0mk3wxBmCdtC09
	sam68JpG6iuGpA3KW4a7ED6Ekp49MYkbb5nRteMrbcKsWZl2J4WWqW4+AOEXog2XIyOkT0eV+Ni
	3JqtKBr09T0kgEtuHNs53a3TDZEECHdnZJ7M0rWs2vEL7JaNeaisF/1snz5347cXL3npXubjg2C
	G2O7H5szbFeqJrkCJ/lfOLH6uSihf5P62REz4y9Mg2Pt17jNaXj+TJW/JPI0vWVVb27dvW5A8Fn
	gIxsXErn9xpTUB05tUglLpzfK+anstsZrudrSd80DTAjlalhKiuGl7+fkPvvjZRYSBelm4VDHZx
	v0L1j8P/XYlSFr2jsGhVQAsQufdhCQssAwqYhEAbliopUM+XTrWobNnnLhSMaRpyuE6/zpJnJci
	RNYAVKvbCZjC8VnOiHWIQ==
X-Received: by 2002:a05:6820:3107:b0:6c9:80d8:a1e7 with SMTP id 006d021491bc7-6d43fd7af20mr9804934eaf.36.1790468451131;
        Sat, 26 Sep 2026 17:20:51 -0700 (PDT)
Received: from tcmichals-5759.lan ([2607:fb91:3584:35a9:66f8:2cb5:aa80:21fd])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d8828e1ea0sm838989eaf.6.2026.09.26.17.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:20:50 -0700 (PDT)
From: Tim Michals <tcmichals@gmail.com>
To: linux-sunxi@lists.linux.dev,
	linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	jassisinghbrar@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Tim Michals <tcmichals@gmail.com>
Subject: [PATCH v2 2/7] mailbox: sun55i: add Allwinner sun55i/sun60i 4-port Message Box driver
Date: Sat, 26 Sep 2026 19:20:11 -0500
Message-ID: <20260927002021.797069-3-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927002021.797069-1-tcmichals@gmail.com>
References: <20260922034711.190253-1-tcmichals@gmail.com>
 <20260927002021.797069-1-tcmichals@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add driver for the 4-port hardware Message Box controller found on
Allwinner A523, A527, T527 (sun55i) and A733 (sun60i) SoCs.

The controller acts as a hardware crossbar connecting four heterogeneous
processor cores (ARM Cortex-A55, Tensilica HiFi4 DSP, CPUS, and XuanTie
E907 RISC-V) across 12 logical channels with 8-entry hardware message FIFOs.

Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
 drivers/mailbox/Kconfig         |  10 +
 drivers/mailbox/Makefile        |   1 +
 drivers/mailbox/sun55i-msgbox.c | 375 ++++++++++++++++++++++++++++++++
 drivers/mailbox/sun55i-msgbox.h |  58 +++++
 4 files changed, 444 insertions(+)
 create mode 100644 drivers/mailbox/sun55i-msgbox.c
 create mode 100644 drivers/mailbox/sun55i-msgbox.h

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index ab869769e278..9067f5161276 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -332,6 +332,16 @@ config SUN6I_MSGBOX
 	  various Allwinner SoCs. This mailbox is used for communication
 	  between the application CPUs and the power management coprocessor.
 
+config SUN55I_MSGBOX
+	tristate "Allwinner sun55i/sun60i 4-port Message Box"
+	depends on ARCH_SUNXI || COMPILE_TEST
+	default ARCH_SUNXI
+	help
+	  Mailbox implementation for the 4-port hardware message box present in
+	  Allwinner A523/A527/T527 (sun55i) and A733 (sun60i) SoCs. This mailbox
+	  provides 12 hardware FIFO channels for communication between the
+	  Cortex-A55 host, CPUS, HiFi4 DSP, and XuanTie E907 RISC-V coprocessors.
+
 config SPRD_MBOX
 	tristate "Spreadtrum Mailbox"
 	depends on ARCH_SPRD || COMPILE_TEST
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 45dc59bb3e7f..aa17f9d0acd4 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -70,6 +70,7 @@ obj-$(CONFIG_MTK_VCP_MBOX)	+= mtk-vcp-mailbox.o
 obj-$(CONFIG_ZYNQMP_IPI_MBOX)	+= zynqmp-ipi-mailbox.o
 
 obj-$(CONFIG_SUN6I_MSGBOX)	+= sun6i-msgbox.o
+obj-$(CONFIG_SUN55I_MSGBOX)	+= sun55i-msgbox.o
 
 obj-$(CONFIG_SPRD_MBOX)		+= sprd-mailbox.o
 
diff --git a/drivers/mailbox/sun55i-msgbox.c b/drivers/mailbox/sun55i-msgbox.c
new file mode 100644
index 000000000000..928e52e08bad
--- /dev/null
+++ b/drivers/mailbox/sun55i-msgbox.c
@@ -0,0 +1,375 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Allwinner sun55i/sun60i 4-Port Hardware Message Box Driver
+ *
+ * Copyright (C) 2026 Tim Michals <tcmichals@gmail.com>
+ * Based on vendor sunxi-msgbox driver by Allwinner Technology Co., Ltd.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mailbox_controller.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/spinlock.h>
+
+#include "sun55i-msgbox.h"
+
+/*
+ * Hardware routing table for Cortex-A55 host (local_id = 0):
+ *   local_n = 0 -> CPUS (remote_id = SUN55I_PROC_CPUS, remote_n = 0) -> Channels 0..3
+ *   local_n = 1 -> DSP  (remote_id = SUN55I_PROC_DSP,  remote_n = 0) -> Channels 4..7
+ *   local_n = 2 -> RV   (remote_id = SUN55I_PROC_RV,   remote_n = 2) -> Channels 8..11
+ */
+const struct sun55i_route sun55i_msgbox_arm_routes[SUN55I_NUM_ROUTES] = {
+	[0] = { .remote_id = SUN55I_PROC_CPUS, .remote_n = 0 },
+	[1] = { .remote_id = SUN55I_PROC_DSP,  .remote_n = 0 },
+	[2] = { .remote_id = SUN55I_PROC_RV,   .remote_n = 2 },
+};
+
+#if IS_ENABLED(CONFIG_SUN55I_MSGBOX_KUNIT_TEST)
+EXPORT_SYMBOL_GPL(sun55i_msgbox_arm_routes);
+#endif
+
+static inline struct sun55i_msgbox *to_sun55i_msgbox(struct mbox_chan *chan)
+{
+	return chan->con_priv;
+}
+
+void sun55i_chan_to_route(int chan_idx, int *local_n, int *p,
+			  int *remote_id, int *remote_n)
+{
+	if (chan_idx < 0 || chan_idx >= SUN55I_NUM_CHANS) {
+		*local_n = 0;
+		*p = 0;
+		*remote_id = 0;
+		*remote_n = 0;
+		return;
+	}
+	*local_n = chan_idx / SUN55I_CHANS_PER_PROC;
+	*p = chan_idx % SUN55I_CHANS_PER_PROC;
+	*remote_id = sun55i_msgbox_arm_routes[*local_n].remote_id;
+	*remote_n = sun55i_msgbox_arm_routes[*local_n].remote_n;
+}
+
+#if IS_ENABLED(CONFIG_SUN55I_MSGBOX_KUNIT_TEST)
+EXPORT_SYMBOL_GPL(sun55i_chan_to_route);
+#endif
+
+irqreturn_t sun55i_msgbox_irq(int irq, void *dev_id)
+{
+	struct sun55i_msgbox *mbox = dev_id;
+	irqreturn_t ret = IRQ_NONE;
+	int i, local_n, p, chan_idx;
+
+	for (local_n = 0; local_n < SUN55I_NUM_ROUTES; local_n++) {
+		void __iomem *local_base = mbox->regs[0];
+		u32 en, stat, pending;
+
+		en = readl(local_base + SUNXI_MSGBOX_READ_IRQ_ENABLE(local_n));
+		stat = readl(local_base + SUNXI_MSGBOX_READ_IRQ_STATUS(local_n));
+		pending = en & stat;
+
+		if (!pending)
+			continue;
+
+		for (p = 0; p < SUN55I_CHANS_PER_PROC; p++) {
+			if (!(pending & RD_IRQ_PEND_BIT(p)))
+				continue;
+
+			chan_idx = local_n * SUN55I_CHANS_PER_PROC + p;
+
+			/*
+			 * Clear pending status BEFORE draining the FIFO to seal
+			 * the TOCTOU race: any new message arriving while draining
+			 * will re-assert the hardware pending bit, guaranteeing
+			 * a subsequent interrupt and preventing blackholed IPC data.
+			 */
+			writel(RD_IRQ_PEND_BIT(p),
+			       local_base + SUNXI_MSGBOX_READ_IRQ_STATUS(local_n));
+
+			/* Cap drain at FIFO_MAX to prevent CPU lockup from a runaway remote */
+			for (i = 0; i < SUN55I_FIFO_MAX; i++) {
+				u32 msg;
+
+				if (!(readl(local_base +
+					    SUNXI_MSGBOX_MSG_STATUS(local_n, p)) & MSG_NUM_MASK))
+					break;
+				msg = readl(local_base + SUNXI_MSGBOX_MSG_FIFO(local_n, p));
+				mbox_chan_received_data(&mbox->controller.chans[chan_idx], &msg);
+			}
+
+			ret = IRQ_HANDLED;
+		}
+	}
+
+	return ret;
+}
+
+#if IS_ENABLED(CONFIG_SUN55I_MSGBOX_KUNIT_TEST)
+EXPORT_SYMBOL_GPL(sun55i_msgbox_irq);
+#endif
+
+static int sun55i_msgbox_send_data(struct mbox_chan *chan, void *data)
+{
+	struct sun55i_msgbox *mbox = to_sun55i_msgbox(chan);
+	int n = chan - mbox->controller.chans;
+	int local_n, p, remote_id, remote_n;
+	u32 msg = 0;
+
+	if (data)
+		memcpy(&msg, data, sizeof(msg));
+
+	sun55i_chan_to_route(n, &local_n, &p, &remote_id, &remote_n);
+
+	writel(msg, mbox->regs[remote_id] + SUNXI_MSGBOX_MSG_FIFO(remote_n, p));
+	return 0;
+}
+
+static int sun55i_msgbox_startup(struct mbox_chan *chan)
+{
+	struct sun55i_msgbox *mbox = to_sun55i_msgbox(chan);
+	int n = chan - mbox->controller.chans;
+	int i, local_n, p, remote_id, remote_n;
+	unsigned long flags;
+	u32 val;
+
+	sun55i_chan_to_route(n, &local_n, &p, &remote_id, &remote_n);
+
+	/* Flush any stale receive data (bounded to FIFO_MAX) */
+	for (i = 0; i < SUN55I_FIFO_MAX; i++) {
+		if (!(readl(mbox->regs[0] + SUNXI_MSGBOX_MSG_STATUS(local_n, p)) & MSG_NUM_MASK))
+			break;
+		readl(mbox->regs[0] + SUNXI_MSGBOX_MSG_FIFO(local_n, p));
+	}
+
+	/* Clear pending status */
+	writel(RD_IRQ_PEND_BIT(p),
+	       mbox->regs[0] + SUNXI_MSGBOX_READ_IRQ_STATUS(local_n));
+
+	/* Enable receive IRQ */
+	spin_lock_irqsave(&mbox->lock, flags);
+	val = readl(mbox->regs[0] + SUNXI_MSGBOX_READ_IRQ_ENABLE(local_n));
+	val |= RD_IRQ_EN_BIT(p);
+	writel(val, mbox->regs[0] + SUNXI_MSGBOX_READ_IRQ_ENABLE(local_n));
+	spin_unlock_irqrestore(&mbox->lock, flags);
+
+	return 0;
+}
+
+static void sun55i_msgbox_shutdown(struct mbox_chan *chan)
+{
+	struct sun55i_msgbox *mbox = to_sun55i_msgbox(chan);
+	int n = chan - mbox->controller.chans;
+	int i, local_n, p, remote_id, remote_n;
+	unsigned long flags;
+	u32 val;
+
+	sun55i_chan_to_route(n, &local_n, &p, &remote_id, &remote_n);
+
+	/* Disable receive IRQ */
+	spin_lock_irqsave(&mbox->lock, flags);
+	val = readl(mbox->regs[0] + SUNXI_MSGBOX_READ_IRQ_ENABLE(local_n));
+	val &= ~RD_IRQ_EN_BIT(p);
+	writel(val, mbox->regs[0] + SUNXI_MSGBOX_READ_IRQ_ENABLE(local_n));
+	spin_unlock_irqrestore(&mbox->lock, flags);
+
+	/* Clear pending status and flush (bounded to FIFO_MAX) */
+	writel(RD_IRQ_PEND_BIT(p),
+	       mbox->regs[0] + SUNXI_MSGBOX_READ_IRQ_STATUS(local_n));
+	for (i = 0; i < SUN55I_FIFO_MAX; i++) {
+		if (!(readl(mbox->regs[0] + SUNXI_MSGBOX_MSG_STATUS(local_n, p)) & MSG_NUM_MASK))
+			break;
+		readl(mbox->regs[0] + SUNXI_MSGBOX_MSG_FIFO(local_n, p));
+	}
+}
+
+static bool sun55i_msgbox_last_tx_done(struct mbox_chan *chan)
+{
+	struct sun55i_msgbox *mbox = to_sun55i_msgbox(chan);
+	int n = chan - mbox->controller.chans;
+	int local_n, p, remote_id, remote_n;
+	u32 count;
+
+	sun55i_chan_to_route(n, &local_n, &p, &remote_id, &remote_n);
+
+	count = readl(mbox->regs[remote_id] + SUNXI_MSGBOX_MSG_STATUS(remote_n, p)) & MSG_NUM_MASK;
+	return count < SUN55I_FIFO_MAX;
+}
+
+static bool sun55i_msgbox_peek_data(struct mbox_chan *chan)
+{
+	struct sun55i_msgbox *mbox = to_sun55i_msgbox(chan);
+	int n = chan - mbox->controller.chans;
+	int local_n, p, remote_id, remote_n;
+	u32 count;
+
+	sun55i_chan_to_route(n, &local_n, &p, &remote_id, &remote_n);
+
+	count = readl(mbox->regs[0] + SUNXI_MSGBOX_MSG_STATUS(local_n, p)) & MSG_NUM_MASK;
+	return count > 0;
+}
+
+const struct mbox_chan_ops sun55i_msgbox_chan_ops = {
+	.send_data    = sun55i_msgbox_send_data,
+	.startup      = sun55i_msgbox_startup,
+	.shutdown     = sun55i_msgbox_shutdown,
+	.last_tx_done = sun55i_msgbox_last_tx_done,
+	.peek_data    = sun55i_msgbox_peek_data,
+};
+
+#if IS_ENABLED(CONFIG_SUN55I_MSGBOX_KUNIT_TEST)
+EXPORT_SYMBOL_GPL(sun55i_msgbox_chan_ops);
+#endif
+
+static int sun55i_msgbox_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mbox_chan *chans;
+	struct sun55i_msgbox *mbox;
+	int i, ret, irq_cnt, local_n;
+
+	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
+	if (!mbox)
+		return -ENOMEM;
+
+	spin_lock_init(&mbox->lock);
+
+	/* Allocate channels early before touching any hardware */
+	chans = devm_kcalloc(dev, SUN55I_NUM_CHANS, sizeof(*chans), GFP_KERNEL);
+	if (!chans)
+		return -ENOMEM;
+
+	for (i = 0; i < SUN55I_NUM_CHANS; i++)
+		chans[i].con_priv = mbox;
+
+	for (i = 0; i < SUN55I_MAX_PROCESSORS; i++) {
+		mbox->regs[i] = devm_platform_ioremap_resource(pdev, i);
+		if (IS_ERR(mbox->regs[i]))
+			return dev_err_probe(dev, PTR_ERR(mbox->regs[i]),
+					     "failed to map resource %d\n", i);
+	}
+
+	mbox->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(mbox->clk))
+		return dev_err_probe(dev, PTR_ERR(mbox->clk), "failed to get clock\n");
+
+	ret = clk_prepare_enable(mbox->clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable clock\n");
+
+	mbox->reset = devm_reset_control_get_optional_shared(dev, NULL);
+	if (IS_ERR(mbox->reset)) {
+		ret = PTR_ERR(mbox->reset);
+		goto err_disable_clk;
+	}
+
+	ret = reset_control_deassert(mbox->reset);
+	if (ret)
+		goto err_disable_clk;
+
+	/* Disable all read IRQs and clear status */
+	for (local_n = 0; local_n < SUN55I_NUM_ROUTES; local_n++) {
+		writel(0, mbox->regs[0] + SUNXI_MSGBOX_READ_IRQ_ENABLE(local_n));
+		writel(U32_MAX, mbox->regs[0] + SUNXI_MSGBOX_READ_IRQ_STATUS(local_n));
+	}
+
+	irq_cnt = platform_irq_count(pdev);
+	if (irq_cnt < 0) {
+		ret = irq_cnt;
+		goto err_assert_reset;
+	}
+
+	for (i = 0; i < irq_cnt; i++) {
+		int irq = platform_get_irq(pdev, i);
+
+		if (irq < 0) {
+			ret = irq;
+			goto err_free_irqs;
+		}
+
+		ret = request_irq(irq, sun55i_msgbox_irq,
+				  IRQF_SHARED, dev_name(dev), mbox);
+		if (ret) {
+			dev_err(dev, "failed to request irq %d: %d\n", irq, ret);
+			goto err_free_irqs;
+		}
+		mbox->irqs[i] = irq;
+		mbox->num_irqs = i + 1;
+	}
+
+	mbox->controller.dev           = dev;
+	mbox->controller.ops           = &sun55i_msgbox_chan_ops;
+	mbox->controller.chans         = chans;
+	mbox->controller.num_chans     = SUN55I_NUM_CHANS;
+	mbox->controller.txdone_irq    = false;
+	mbox->controller.txdone_poll   = true;
+	mbox->controller.txpoll_period = 1;
+
+	platform_set_drvdata(pdev, mbox);
+
+	ret = mbox_controller_register(&mbox->controller);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to register controller\n");
+		goto err_free_irqs;
+	}
+
+	return 0;
+
+err_free_irqs:
+	/* Mask all hardware read IRQs and free registered IRQs before cutting clocks */
+	for (local_n = 0; local_n < SUN55I_NUM_ROUTES; local_n++)
+		writel(0, mbox->regs[0] + SUNXI_MSGBOX_READ_IRQ_ENABLE(local_n));
+	for (i = 0; i < mbox->num_irqs; i++)
+		free_irq(mbox->irqs[i], mbox);
+err_assert_reset:
+	reset_control_assert(mbox->reset);
+err_disable_clk:
+	clk_disable_unprepare(mbox->clk);
+	return ret;
+}
+
+static void sun55i_msgbox_remove(struct platform_device *pdev)
+{
+	struct sun55i_msgbox *mbox = platform_get_drvdata(pdev);
+	int local_n, i;
+
+	mbox_controller_unregister(&mbox->controller);
+
+	/* Mask hardware interrupts and free IRQs before asserting reset and disabling clock */
+	for (local_n = 0; local_n < SUN55I_NUM_ROUTES; local_n++)
+		writel(0, mbox->regs[0] + SUNXI_MSGBOX_READ_IRQ_ENABLE(local_n));
+
+	for (i = 0; i < mbox->num_irqs; i++)
+		free_irq(mbox->irqs[i], mbox);
+
+	reset_control_assert(mbox->reset);
+	clk_disable_unprepare(mbox->clk);
+}
+
+static const struct of_device_id sun55i_msgbox_of_match[] = {
+	{ .compatible = "allwinner,sun55i-a523-msgbox" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sun55i_msgbox_of_match);
+
+static struct platform_driver sun55i_msgbox_driver = {
+	.driver = {
+		.name = "sun55i-msgbox",
+		.of_match_table = sun55i_msgbox_of_match,
+	},
+	.probe = sun55i_msgbox_probe,
+	.remove = sun55i_msgbox_remove,
+};
+module_platform_driver(sun55i_msgbox_driver);
+
+MODULE_AUTHOR("Tim Michals <tcmichals@gmail.com>");
+MODULE_DESCRIPTION("Allwinner sun55i/sun60i 4-Port Message Box Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/mailbox/sun55i-msgbox.h b/drivers/mailbox/sun55i-msgbox.h
new file mode 100644
index 000000000000..2ab79a9149c0
--- /dev/null
+++ b/drivers/mailbox/sun55i-msgbox.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _SUN55I_MSGBOX_H_
+#define _SUN55I_MSGBOX_H_
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/interrupt.h>
+#include <linux/mailbox_controller.h>
+#include <linux/spinlock.h>
+
+#define SUN55I_PROC_ARM			0
+#define SUN55I_PROC_DSP			1
+#define SUN55I_PROC_CPUS		2
+#define SUN55I_PROC_RV			3
+
+#define SUN55I_MAX_PROCESSORS		4
+#define SUN55I_CHANS_PER_PROC		4
+#define SUN55I_NUM_ROUTES		(SUN55I_MAX_PROCESSORS - 1)
+#define SUN55I_NUM_CHANS		(SUN55I_NUM_ROUTES * SUN55I_CHANS_PER_PROC)
+#define SUN55I_FIFO_MAX			8
+
+#define SUNXI_MSGBOX_OFFSET(n)			(0x100 * (n))
+#define SUNXI_MSGBOX_READ_IRQ_ENABLE(n)		(0x020 + SUNXI_MSGBOX_OFFSET(n))
+#define SUNXI_MSGBOX_READ_IRQ_STATUS(n)		(0x024 + SUNXI_MSGBOX_OFFSET(n))
+#define SUNXI_MSGBOX_WRITE_IRQ_ENABLE(n)	(0x030 + SUNXI_MSGBOX_OFFSET(n))
+#define SUNXI_MSGBOX_WRITE_IRQ_STATUS(n)	(0x034 + SUNXI_MSGBOX_OFFSET(n))
+#define SUNXI_MSGBOX_FIFO_STATUS(n, p)		(0x050 + SUNXI_MSGBOX_OFFSET(n) + 0x4 * (p))
+#define SUNXI_MSGBOX_MSG_STATUS(n, p)		(0x060 + SUNXI_MSGBOX_OFFSET(n) + 0x4 * (p))
+#define SUNXI_MSGBOX_MSG_FIFO(n, p)		(0x070 + SUNXI_MSGBOX_OFFSET(n) + 0x4 * (p))
+
+#define RD_IRQ_EN_BIT(p)			BIT((p) * 2)
+#define RD_IRQ_PEND_BIT(p)			BIT((p) * 2)
+#define MSG_NUM_MASK				GENMASK(3, 0)
+
+struct sun55i_route {
+	u8 remote_id;
+	u8 remote_n;
+};
+
+struct sun55i_msgbox {
+	struct mbox_controller controller;
+	void __iomem *regs[SUN55I_MAX_PROCESSORS];
+	struct clk *clk;
+	struct reset_control *reset;
+	int irqs[SUN55I_MAX_PROCESSORS];
+	int num_irqs;
+	/* Protects concurrent MMIO register access */
+	spinlock_t lock;
+};
+
+extern const struct sun55i_route sun55i_msgbox_arm_routes[SUN55I_NUM_ROUTES];
+extern const struct mbox_chan_ops sun55i_msgbox_chan_ops;
+
+void sun55i_chan_to_route(int chan_idx, int *local_n, int *p,
+			  int *remote_id, int *remote_n);
+irqreturn_t sun55i_msgbox_irq(int irq, void *dev_id);
+
+#endif /* _SUN55I_MSGBOX_H_ */
-- 
2.43.0

