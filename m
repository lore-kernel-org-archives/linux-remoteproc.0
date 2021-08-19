Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA9DDC43216
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Aug 2021 15:12:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9454660F5E
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Aug 2021 15:12:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240229AbhHSPMq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 19 Aug 2021 11:12:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240112AbhHSPMo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 Aug 2021 11:12:44 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57824C061764
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Aug 2021 08:12:07 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id q10so9658951wro.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 Aug 2021 08:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v6GAbr66okOD9V7dTNi4u5Z8fCaq8a6byUdlyqLUflM=;
        b=Ivd46ySJLbNsyxlfRVwWbG0GqXzPnOnmBg9kLe6sNoCc93b2zmwKLIVtfXtBUFSs3t
         RD3cnncBBKsq83vO6sr5ZAWqc9MA4lhDRFx4Nzv7el4ezY2lIP/eie51SgDztqFNH8L4
         5Uma2sJE3gcQHd2Ca07X4+RUrIflsan9LKuteL4bIHmUxRu5LkWSFzlxP5LTxAlSh3Za
         bM2m5x2jCYEjtZeDt3nUUAzrtZyAT8agSj/WPjIi4EV7595MVQ0tdK/Y2lnJwkYAQaLb
         x2WtmeA8T85HCfM9sZfb8u5Wm5FqDfq4WtZFwkvT/8idb1vbdWdV92T3/LdMLzWhtN+i
         nZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v6GAbr66okOD9V7dTNi4u5Z8fCaq8a6byUdlyqLUflM=;
        b=o92g8ev2ttJjBGA8WlqfQoDoyuc47g0Q5OJ3I7yqxvCE500jqcg5nKZbolsTMFufaq
         GQDzdEO0B41pCTDduvwH0kSTPJFmxKQ3xJQBiuivkKOwC/eHXlCRbzWft015SuROImml
         QVTmDjX1aBx6T40MbWmsDIV/lhdx0Kz9MHmTqx78aZPIEYQdKmBSHoYTgv5n91Mhb7Ky
         4ZaN8JYsAPkG9ZpN88zylMiENRuxvVtrLvk6RUxXH7de0ZEIwAo3cn6YVjxLPgAH5dGO
         Q0JWOYtwvKeDkm5UyL37zbE5Nx6kaKw1QCzwbyn6dvsJ6V2EZThmwDmgmz7iJo7s7tUO
         ijvw==
X-Gm-Message-State: AOAM530ZqJzN5JqfwxrNQoamyKgz62fjOrU+m+4dBp5/ws6F+a9yybBr
        vAQL6An2EM7ib1/yJELHekE4wSYZfx/wJg==
X-Google-Smtp-Source: ABdhPJxBE5twHcmKowsG+ovIEnPxIQ8S3bdEfeFLCv51hFg0jKHZTJmwlsXhIIq2/OLE2ElyuD+KbQ==
X-Received: by 2002:a5d:4309:: with SMTP id h9mr4415176wrq.299.1629385925959;
        Thu, 19 Aug 2021 08:12:05 -0700 (PDT)
Received: from alex-xps13.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id j37sm1556962wms.39.2021.08.19.08.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 08:12:05 -0700 (PDT)
From:   Alexandre Bailon <abailon@baylibre.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org
Cc:     matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        stephane.leprovost@mediatek.com, gpain@baylibre.com,
        khilman@baylibre.com, Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH v3 3/4] remoteproc: mtk_vpu_rproc: Add support of JTAG
Date:   Thu, 19 Aug 2021 17:13:39 +0200
Message-Id: <20210819151340.741565-4-abailon@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819151340.741565-1-abailon@baylibre.com>
References: <20210819151340.741565-1-abailon@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The DSP could be debugged using JTAG.
The support of JTAG could enabled at build time and it could be enabled
using debugfs.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 drivers/remoteproc/Kconfig   |   9 +++
 drivers/remoteproc/mtk_apu.c | 147 ++++++++++++++++++++++++++++++++++-
 2 files changed, 155 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 6c106a6c3ad5d..cb1a2d9f4a9f6 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -63,6 +63,15 @@ config MTK_APU
 
 	  It's safe to say N here.
 
+config MTK_APU_JTAG
+	bool "Enable support of JTAG"
+	depends on MTK_APU
+	help
+	  Say y to enable support of JTAG.
+	  By default, JTAG will remain disabled until it is enabled using
+	  debugfs: remoteproc/remoteproc0/jtag. Write 1 to enable it and
+	  0 to disable it.
+
 config OMAP_REMOTEPROC
 	tristate "OMAP remoteproc support"
 	depends on ARCH_OMAP4 || SOC_OMAP5 || SOC_DRA7XX
diff --git a/drivers/remoteproc/mtk_apu.c b/drivers/remoteproc/mtk_apu.c
index 0e3f63987bd85..3daed38bb5188 100644
--- a/drivers/remoteproc/mtk_apu.c
+++ b/drivers/remoteproc/mtk_apu.c
@@ -5,12 +5,14 @@
 
 #include <linux/bitops.h>
 #include <linux/clk.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/iommu.h>
 #include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/remoteproc.h>
 
@@ -44,6 +46,11 @@
 #define CORE_DEFAULT1				(0x00000140)
 #define CORE_DEFAULT0_ARUSER_IDMA_USE_IOMMU	(0x10 << 0)
 #define CORE_DEFAULT0_AWUSER_IDMA_USE_IOMMU	(0x10 << 5)
+#define CORE_DEFAULT2				(0x00000144)
+#define CORE_DEFAULT2_DBG_EN			BIT(3)
+#define CORE_DEFAULT2_NIDEN			BIT(2)
+#define CORE_DEFAULT2_SPNIDEN			BIT(1)
+#define CORE_DEFAULT2_SPIDEN			BIT(0)
 #define CORE_XTENSA_ALTRESETVEC			(0x000001F8)
 
 #define RSC_VENDOR_CARVEOUT			(RSC_VENDOR_START + 1)
@@ -56,6 +63,13 @@ struct mtk_apu_rproc {
 	int irq;
 	struct clk_bulk_data clks[3];
 	struct list_head mappings;
+
+#ifdef CONFIG_MTK_APU_JTAG
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pinctrl_jtag;
+	bool jtag_enabled;
+	struct mutex jtag_mutex;
+#endif
 };
 
 static int mtk_apu_iommu_map(struct rproc *rproc, struct rproc_mem_entry *entry)
@@ -333,6 +347,133 @@ static irqreturn_t handle_event(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+#ifdef CONFIG_MTK_APU_JTAG
+
+static int apu_enable_jtag(struct mtk_apu_rproc *apu_rproc)
+{
+	int ret = 0;
+
+	mutex_lock(&apu_rproc->jtag_mutex);
+	if (apu_rproc->jtag_enabled)
+		goto err_mutex_unlock;
+
+	writel(CORE_DEFAULT2_SPNIDEN | CORE_DEFAULT2_SPIDEN |
+		CORE_DEFAULT2_NIDEN | CORE_DEFAULT2_DBG_EN,
+		apu_rproc->base + CORE_DEFAULT2);
+
+	apu_rproc->jtag_enabled = 1;
+
+err_mutex_unlock:
+	mutex_unlock(&apu_rproc->jtag_mutex);
+
+	return ret;
+}
+
+static int apu_disable_jtag(struct mtk_apu_rproc *apu_rproc)
+{
+	int ret = 0;
+
+	mutex_lock(&apu_rproc->jtag_mutex);
+	if (!apu_rproc->jtag_enabled)
+		goto err_mutex_unlock;
+
+	writel(0, apu_rproc->base + CORE_DEFAULT2);
+
+	apu_rproc->jtag_enabled = 0;
+
+err_mutex_unlock:
+	mutex_unlock(&apu_rproc->jtag_mutex);
+
+	return ret;
+}
+
+static ssize_t rproc_jtag_read(struct file *filp, char __user *userbuf,
+			       size_t count, loff_t *ppos)
+{
+	struct rproc *rproc = filp->private_data;
+	struct mtk_apu_rproc *apu_rproc = (struct mtk_apu_rproc *)rproc->priv;
+	char *buf = apu_rproc->jtag_enabled ? "enabled\n" : "disabled\n";
+
+	return simple_read_from_buffer(userbuf, count, ppos, buf, strlen(buf));
+}
+
+static ssize_t rproc_jtag_write(struct file *filp, const char __user *user_buf,
+				size_t count, loff_t *ppos)
+{
+	struct rproc *rproc = filp->private_data;
+	struct mtk_apu_rproc *apu_rproc = (struct mtk_apu_rproc *)rproc->priv;
+	char buf[10];
+	int ret;
+
+	if (count < 1 || count > sizeof(buf))
+		return -EINVAL;
+
+	ret = copy_from_user(buf, user_buf, count);
+	if (ret)
+		return -EFAULT;
+
+	/* remove end of line */
+	if (buf[count - 1] == '\n')
+		buf[count - 1] = '\0';
+
+	if (!strncmp(buf, "enabled", count))
+		ret = apu_enable_jtag(apu_rproc);
+	else if (!strncmp(buf, "disabled", count))
+		ret = apu_disable_jtag(apu_rproc);
+	else
+		return -EINVAL;
+
+	return ret ? ret : count;
+}
+
+static const struct file_operations rproc_jtag_ops = {
+	.read = rproc_jtag_read,
+	.write = rproc_jtag_write,
+	.open = simple_open,
+};
+
+static int apu_jtag_probe(struct mtk_apu_rproc *apu_rproc)
+{
+	int ret;
+
+	if (!apu_rproc->rproc->dbg_dir)
+		return -ENODEV;
+
+	apu_rproc->pinctrl = devm_pinctrl_get(apu_rproc->dev);
+	if (IS_ERR(apu_rproc->pinctrl)) {
+		dev_warn(apu_rproc->dev, "Failed to find JTAG pinctrl\n");
+		return PTR_ERR(apu_rproc->pinctrl);
+	}
+
+	apu_rproc->pinctrl_jtag = pinctrl_lookup_state(apu_rproc->pinctrl,
+						       "jtag");
+	if (IS_ERR(apu_rproc->pinctrl_jtag))
+		return PTR_ERR(apu_rproc->pinctrl_jtag);
+
+	ret = pinctrl_select_state(apu_rproc->pinctrl,
+				   apu_rproc->pinctrl_jtag);
+	if (ret < 0)
+		return ret;
+
+	mutex_init(&apu_rproc->jtag_mutex);
+
+	debugfs_create_file("jtag", 0600, apu_rproc->rproc->dbg_dir,
+			    apu_rproc->rproc, &rproc_jtag_ops);
+
+	return 0;
+}
+#else
+static int apu_jtag_probe(struct mtk_apu_rproc *apu_rproc)
+{
+	return 0;
+}
+
+static int apu_disable_jtag(struct mtk_apu_rproc *apu_rproc)
+{
+	return 0;
+}
+#endif /* CONFIG_MTK_APU_JTAG */
+
 static int mtk_apu_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -396,6 +537,10 @@ static int mtk_apu_rproc_probe(struct platform_device *pdev)
 		goto free_rproc;
 	}
 
+	ret = apu_jtag_probe(apu_rproc);
+	if (ret)
+		dev_warn(dev, "Failed to configure jtag\n");
+
 	return 0;
 
 free_rproc:
@@ -411,7 +556,7 @@ static int mtk_apu_rproc_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 
 	disable_irq(apu_rproc->irq);
-
+	apu_disable_jtag(apu_rproc);
 	rproc_del(rproc);
 	of_reserved_mem_device_release(dev);
 	rproc_free(rproc);
-- 
2.31.1

