Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94110C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue,  9 Nov 2021 08:39:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B2C1611C4
	for <linux-remoteproc@archiver.kernel.org>; Tue,  9 Nov 2021 08:39:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244308AbhKIImV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 9 Nov 2021 03:42:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244305AbhKIImU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 9 Nov 2021 03:42:20 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5C79C061764;
        Tue,  9 Nov 2021 00:39:34 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id d24so31612290wra.0;
        Tue, 09 Nov 2021 00:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5Sz/735onEF716UXTcImtOWZIbaz1MJB0FnTTfmZwdA=;
        b=X3PMwiWcZ317j/HKlLoCBfXCTRnxoNpDRG1WPHUTi4jUBM1/6m+mqMs51jGhLP6gRV
         4z0QqGpmfOyxtKvPp6FR3wxGCs6TDSYdaYpS5i6eA/rw/xhAU0Yr/rT4va4p/17yf1LH
         LC729puIwIjjod+s3L/XrASkZWUAG8ZyteWCtIGomM6FB7HGBRrzbE/Q1o0yO6GEMSmh
         m3jGZVEH+hdQwoOFD8LteA1NtiB4qi0X9Mi8PR7w5CDFVSGlqOhxDoapK9qogX4LAHfq
         DyHao+ujnpWOXZe7y4Ji3N+ecIITMIw6ys9Xb4zly52GvC5/p6sANmo1OW8JYoqSBLQV
         BeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5Sz/735onEF716UXTcImtOWZIbaz1MJB0FnTTfmZwdA=;
        b=J1LSEr4bJh2q7+kDrxLfc9vHJ92oSTz1nqdSzJ3ELx9D1wHD5H8HprPCp5tRZAsOL8
         MFnpjePDE+PgciSnI35NMwKhOWaJKLXsrFj5BUS2XAvonWH947lQqdKoyliBEQOT52wm
         lw6nWHq1p38veXtVJqVkdONTis6gk75M8CStsbQTtWYbCpL3ZtqTbcPq8/sH/91bLkN1
         0tm4YgF5N0gX6BzEtR9YeV0VABt9ofMj7oRERtI08OwK/z1iwmXjfIJsTciMuEhTkGh2
         18arTbUv7vHgWxul3UTmcO0ByjpTQrBcGJ4LrvwQ8t9g4FQVhmDtnvRZtfeSom/R1Esy
         HDPQ==
X-Gm-Message-State: AOAM532e+Wezd9vhOylSBMUAymKuF9lm3MwEE8eQgJ2/ETpQ54IzjmJg
        m828cK/ReDHnC3cF4i7pYaOYzbIp4mw=
X-Google-Smtp-Source: ABdhPJxgf9rBYmjZaKV+xzWd9VYwmPlhOUeMrLSY2EYekzdlZyQ5UavAA9+z84DxFT2jkWfuDcGfzg==
X-Received: by 2002:a05:6000:120a:: with SMTP id e10mr7202115wrx.156.1636447173241;
        Tue, 09 Nov 2021 00:39:33 -0800 (PST)
Received: from localhost.localdomain.at (62-178-82-229.cable.dynamic.surfer.at. [62.178.82.229])
        by smtp.gmail.com with ESMTPSA id q26sm19086055wrc.39.2021.11.09.00.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 00:39:32 -0800 (PST)
From:   Christian Gmeiner <christian.gmeiner@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Christian Gmeiner <christian.gmeiner@gmail.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org
Subject: [RFC PATCH v2 1/1] rpmsg: add syslog driver
Date:   Tue,  9 Nov 2021 09:39:21 +0100
Message-Id: <20211109083926.32052-2-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109083926.32052-1-christian.gmeiner@gmail.com>
References: <20211109083926.32052-1-christian.gmeiner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Allows the remote firmware to log into syslog.

Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/rpmsg/Kconfig        |  8 +++++
 drivers/rpmsg/Makefile       |  1 +
 drivers/rpmsg/rpmsg_syslog.c | 65 ++++++++++++++++++++++++++++++++++++
 3 files changed, 74 insertions(+)
 create mode 100644 drivers/rpmsg/rpmsg_syslog.c

diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
index 0b4407abdf13..801f9956ec21 100644
--- a/drivers/rpmsg/Kconfig
+++ b/drivers/rpmsg/Kconfig
@@ -73,4 +73,12 @@ config RPMSG_VIRTIO
 	select RPMSG_NS
 	select VIRTIO
 
+config RPMSG_SYSLOG
+	tristate "SYSLOG device interface"
+	depends on RPMSG
+	help
+	  Say Y here to export rpmsg endpoints as device files, usually found
+	  in /dev. They make it possible for user-space programs to send and
+	  receive rpmsg packets.
+
 endmenu
diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
index 8d452656f0ee..75b2ec7133a5 100644
--- a/drivers/rpmsg/Makefile
+++ b/drivers/rpmsg/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_RPMSG_QCOM_GLINK_RPM) += qcom_glink_rpm.o
 obj-$(CONFIG_RPMSG_QCOM_GLINK_SMEM) += qcom_glink_smem.o
 obj-$(CONFIG_RPMSG_QCOM_SMD)	+= qcom_smd.o
 obj-$(CONFIG_RPMSG_VIRTIO)	+= virtio_rpmsg_bus.o
+obj-$(CONFIG_RPMSG_SYSLOG)	+= rpmsg_syslog.o
diff --git a/drivers/rpmsg/rpmsg_syslog.c b/drivers/rpmsg/rpmsg_syslog.c
new file mode 100644
index 000000000000..b3fdae495fd9
--- /dev/null
+++ b/drivers/rpmsg/rpmsg_syslog.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/rpmsg.h>
+
+static int rpmsg_syslog_cb(struct rpmsg_device *rpdev, void *data, int len,
+			   void *priv, u32 src)
+{
+	const char *buffer = data;
+
+	switch (buffer[0]) {
+	case 'e':
+		dev_err(&rpdev->dev, "%s", buffer + 1);
+		break;
+	case 'w':
+		dev_warn(&rpdev->dev, "%s", buffer + 1);
+		break;
+	case 'i':
+		dev_info(&rpdev->dev, "%s", buffer + 1);
+		break;
+	default:
+		dev_info(&rpdev->dev, "%s", buffer);
+		break;
+	}
+
+	return 0;
+}
+
+static int rpmsg_syslog_probe(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_endpoint *syslog_ept;
+	struct rpmsg_channel_info syslog_chinfo = {
+		.src = 42,
+		.dst = 42,
+		.name = "syslog",
+	};
+
+	/*
+	 * Create the syslog service endpoint associated to the RPMsg
+	 * device. The endpoint will be automatically destroyed when the RPMsg
+	 * device will be deleted.
+	 */
+	syslog_ept = rpmsg_create_ept(rpdev, rpmsg_syslog_cb, NULL, syslog_chinfo);
+	if (!syslog_ept) {
+		dev_err(&rpdev->dev, "failed to create the syslog ept\n");
+		return -ENOMEM;
+	}
+	rpdev->ept = syslog_ept;
+
+	return 0;
+}
+
+static struct rpmsg_device_id rpmsg_driver_syslog_id_table[] = {
+	{ .name = "syslog" },
+	{ },
+};
+MODULE_DEVICE_TABLE(rpmsg, rpmsg_driver_syslog_id_table);
+
+static struct rpmsg_driver rpmsg_syslog_client = {
+	.drv.name       = KBUILD_MODNAME,
+	.id_table       = rpmsg_driver_syslog_id_table,
+	.probe          = rpmsg_syslog_probe,
+};
+module_rpmsg_driver(rpmsg_syslog_client);
-- 
2.33.1

