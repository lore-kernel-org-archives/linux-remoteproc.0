Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:42277 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751464AbeD0MQz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Apr 2018 08:16:55 -0400
From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] remoteproc/ste: remove abandoned include file
Date: Fri, 27 Apr 2018 14:16:38 +0200
Message-id: <20180427121638.10887-1-a.hajda@samsung.com>
References: <CGME20180427121651eucas1p2c4ebea8480acdc9016448eb58dd41e09@eucas1p2.samsung.com>
Sender: linux-remoteproc-owner@vger.kernel.org
To: linux-remoteproc@vger.kernel.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Jean Delvare <jdelvare@suse.de>, Linus Walleij <linus.walleij@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

STE modem driver has been removed in 2016. This include has no
users since then.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Cc: Jean Delvare <jdelvare@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Suman Anna <s-anna@ti.com>
---
 include/linux/ste_modem_shm.h | 56 -----------------------------------
 1 file changed, 56 deletions(-)
 delete mode 100644 include/linux/ste_modem_shm.h

diff --git a/include/linux/ste_modem_shm.h b/include/linux/ste_modem_shm.h
deleted file mode 100644
index 8444a4eff1bb..000000000000
--- a/include/linux/ste_modem_shm.h
+++ /dev/null
@@ -1,56 +0,0 @@
-/*
- * Copyright (C) ST-Ericsson AB 2012
- * Author: Sjur Brendeland / sjur.brandeland@stericsson.com
- *
- * License terms: GNU General Public License (GPL) version 2
- */
-
-#ifndef __INC_MODEM_DEV_H
-#define __INC_MODEM_DEV_H
-#include <linux/types.h>
-#include <linux/platform_device.h>
-
-struct ste_modem_device;
-
-/**
- * struct ste_modem_dev_cb - Callbacks for modem initiated events.
- * @kick: Called when the modem kicks the host.
- *
- * This structure contains callbacks for actions triggered by the modem.
- */
-struct ste_modem_dev_cb {
-	void (*kick)(struct ste_modem_device *mdev, int notify_id);
-};
-
-/**
- * struct ste_modem_dev_ops - Functions to control modem and modem interface.
- *
- * @power:	Main power switch, used for cold-start or complete power off.
- * @kick:	Kick the modem.
- * @kick_subscribe: Subscribe for notifications from the modem.
- * @setup:	Provide callback functions to modem device.
- *
- * This structure contains functions used by the ste remoteproc driver
- * to manage the modem.
- */
-struct ste_modem_dev_ops {
-	int (*power)(struct ste_modem_device *mdev, bool on);
-	int (*kick)(struct ste_modem_device *mdev, int notify_id);
-	int (*kick_subscribe)(struct ste_modem_device *mdev, int notify_id);
-	int (*setup)(struct ste_modem_device *mdev,
-		     struct ste_modem_dev_cb *cfg);
-};
-
-/**
- * struct ste_modem_device - represent the STE modem device
- * @pdev: Reference to platform device
- * @ops: Operations used to manage the modem.
- * @drv_data: Driver private data.
- */
-struct ste_modem_device {
-	struct platform_device pdev;
-	struct ste_modem_dev_ops ops;
-	void *drv_data;
-};
-
-#endif /*INC_MODEM_DEV_H*/
-- 
2.17.0

