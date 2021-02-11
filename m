Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C302FC433E6
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:51:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9193264D87
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:51:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbhBKXvW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Feb 2021 18:51:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbhBKXuK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Feb 2021 18:50:10 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3F2DC0698CA
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:46 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id r38so5049332pgk.13
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nWH3imbAeMw4n5RIWv9Jygevt+XepgJ5nBh82nrQrzU=;
        b=OsUt7nvVzjq1BmdRnvM0Ryju3WLLiLSgarJPlpzD0x4jyGi1rgG2Dth57tK5d5PltX
         BBXdHFgDZGzqkqeVy+teyQXKuSz+TWhYZDPUuflpgghbp8lhbB/SczBEnUUtr2le14/A
         t9SW0oYT9SOAnQhh5DKGyQ5/pfmxrYxHfNOfvqVaCrNHfnkFTqHE67UoFcdOA//BhyIY
         7Kiwbjcmnf2XrZrviU0YRaG5l7ocRaXq18bMVaH1O+d0T1YoN3gRWbDEK3JsxHIyuBOI
         CD738Gw4bs+Wl05rHHJkZYYwuNjh7f8WgcWP3WT80dYw7F7lKb3uzot+dzAWgF/KIGMv
         dM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nWH3imbAeMw4n5RIWv9Jygevt+XepgJ5nBh82nrQrzU=;
        b=pQgrILtEUt7YvBEYyISoAmln+xVp5DRh3ErneGYtR9wtTF0HCX5QKeP85Vg4kRBybs
         xmi2kHFZqVbKf+HyfDmOfztvllbYj49fXDYOQXeG6OCLpMJEdtUi0oVC/6nUW4NcDw7y
         suMdzUL/2e/BmwU6hgb3Rp1tjjhodg5MDtr+/nFG4VIcYb3FfoA2c2YtKdOzRwtZVX5F
         Bz7VN0i2lPVa31O45/8zwlkpHZozfyCaw2yxMy+GJHpMdtThl/b0n60yDnUgcX5nQq7h
         pKpEgZIVFq1YwC541gPABbD/rOnlw5Sqjrg6b3wMOA5yErtUJnNKk3xA3LDSaB8ctdGL
         jPAw==
X-Gm-Message-State: AOAM531pXshQqYYXuNwns8AR0sMLiVZ4vFUHUgFsaNSqhd9//lr7HlAW
        qOLCHKB1hfuuV3KFKtC4upYVkA==
X-Google-Smtp-Source: ABdhPJwnNYdhLS3XOt7Ib9m7KFFkeV97pBzTsT0zQw7/rCXBb3/CMFfPL7ryBJyDR8iOzqBdCpHdSw==
X-Received: by 2002:a62:187:0:b029:1da:e323:a96b with SMTP id 129-20020a6201870000b02901dae323a96bmr386865pfb.28.1613087206129;
        Thu, 11 Feb 2021 15:46:46 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id iq6sm5932740pjb.6.2021.02.11.15.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 15:46:45 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 17/19] remoteproc: Properly deal with a start request when attached
Date:   Thu, 11 Feb 2021 16:46:25 -0700
Message-Id: <20210211234627.2669674-18-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
References: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch takes into account scenarios where a remote processor
has been attached to when receiving a "start" command from sysfs.

As with the "running" case, the command can't be carried out if the
remote processor is already in operation.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_cdev.c  | 3 ++-
 drivers/remoteproc/remoteproc_sysfs.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
index d06f8d4919c7..61541bc7d26c 100644
--- a/drivers/remoteproc/remoteproc_cdev.c
+++ b/drivers/remoteproc/remoteproc_cdev.c
@@ -32,7 +32,8 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
 		return -EFAULT;
 
 	if (!strncmp(cmd, "start", len)) {
-		if (rproc->state == RPROC_RUNNING)
+		if (rproc->state == RPROC_RUNNING ||
+		    rproc->state == RPROC_ATTACHED)
 			return -EBUSY;
 
 		ret = rproc_boot(rproc);
diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 3696f2ccc785..7d281cfe3e03 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -194,7 +194,8 @@ static ssize_t state_store(struct device *dev,
 	int ret = 0;
 
 	if (sysfs_streq(buf, "start")) {
-		if (rproc->state == RPROC_RUNNING)
+		if (rproc->state == RPROC_RUNNING ||
+		    rproc->state == RPROC_ATTACHED)
 			return -EBUSY;
 
 		ret = rproc_boot(rproc);
-- 
2.25.1

