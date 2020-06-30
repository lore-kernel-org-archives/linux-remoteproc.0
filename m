Return-Path: <SRS0=lk58=AL=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31DD0C433E1
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Jun 2020 16:31:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1222F20723
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Jun 2020 16:31:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qkso+Mi+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388286AbgF3Qb2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 30 Jun 2020 12:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388193AbgF3QbX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 30 Jun 2020 12:31:23 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 025D2C03E97A
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2020 09:31:23 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id h22so9705188pjf.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2020 09:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kSFl/PPm+laMZYzO9Qtv6/OB8Vc89JQ/oHAdPk57qm8=;
        b=qkso+Mi+qizQchWvUN3dG7Wi4ZOVa62pZ2tRLklIqmByJxOpPpQDM3TxIA3P9NZjNy
         4ukXOfnIU20yYItRqCnRqwyqH0B5KMEO13xuF3HOLgDL63XwbVtaV8qfHf8UdizPZ2uk
         XodigXIm9T/CTu5zSaMBmAIFoSpViGDEeviLsLv7R0KP3s0q6ztcltNXz4kiQWMWRtyH
         MQdZcevN15+Di7TJ7MwTz0AtL/ZAhH3FwZssIj8vpy8rCZAwczKwTTQGvYRD7JA/SFif
         gnG9Do1eevxfhk5LMrFl6PEguRBnypXAouv2MEzGDZFfv4lgi95JfxuzNGoyb0QiqZ04
         PKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kSFl/PPm+laMZYzO9Qtv6/OB8Vc89JQ/oHAdPk57qm8=;
        b=GGxBVpFdCUvBLg8T/7wXBW/55gVCM0tTY7M1CbVtaHRLJ3JlVWdf/LkuRVtmYajkrM
         5uNkTfFzXy254l3vz8sRADOtim9d1+1y8qylKoI6qMTyLwAJepWGGKHykTN7EWuGcCH3
         o9C6YLgSp4zHvrdQOV3VYkp73pA96u3kmCoL5uOwb/2p/imMXhDZG4Z9QFXRug2W2zM8
         N+H0iVpMvzucOdL97iwqaLP6CbtRyLc2uhU005PmlxxdgSsOLA6bU+rSU5xrmnwSYLMh
         di7YtkkPZZf94UrlIuNsEZnoVZ+UEU8WqSxqQfQayViRPolAuTUrpoOfqjvytNBf09i+
         l9vA==
X-Gm-Message-State: AOAM530y8/lzqIUAvlk5+Gu+cMq/m37sRZCor3L/RQPKQtmYk7QjyLgw
        R3NRWdUG6K2FQmftPqs/yQauSw==
X-Google-Smtp-Source: ABdhPJyaJKMQeRKv2cqPQNBgC/3/uMn/MxqcTdfzfmnQ4Lz4DpxXj9L22s5atSLvhitAiasA5H0RtA==
X-Received: by 2002:a17:902:b095:: with SMTP id p21mr17521475plr.4.1593534682551;
        Tue, 30 Jun 2020 09:31:22 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id n4sm3184606pfq.9.2020.06.30.09.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 09:31:22 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, paul@crapouillou.net,
        s-anna@ti.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Revert "remoteproc: Add support for runtime PM"
Date:   Tue, 30 Jun 2020 10:31:18 -0600
Message-Id: <20200630163118.3830422-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200630163118.3830422-1-mathieu.poirier@linaro.org>
References: <20200630163118.3830422-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This reverts commit a99a37f6cd5a74d5b22c08544aa6c5890813c8ba.

Removing PM runtime operations from the remoteproc core in order to:

1) Keep all power management operations in platform drivers.  That way we
do not loose flexibility in an area that is very HW specific.

2) Avoid making the support for remote processor managed by external
entities more complex that it already is.

3) Fix regression introduced for the Omap remoteproc driver.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 9f04c30c4aaf..0f95e025ba03 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -29,7 +29,6 @@
 #include <linux/devcoredump.h>
 #include <linux/rculist.h>
 #include <linux/remoteproc.h>
-#include <linux/pm_runtime.h>
 #include <linux/iommu.h>
 #include <linux/idr.h>
 #include <linux/elf.h>
@@ -1383,12 +1382,6 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	if (ret)
 		return ret;
 
-	ret = pm_runtime_get_sync(dev);
-	if (ret < 0) {
-		dev_err(dev, "pm_runtime_get_sync failed: %d\n", ret);
-		return ret;
-	}
-
 	dev_info(dev, "Booting fw image %s, size %zd\n", name, fw->size);
 
 	/*
@@ -1398,7 +1391,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	ret = rproc_enable_iommu(rproc);
 	if (ret) {
 		dev_err(dev, "can't enable iommu: %d\n", ret);
-		goto put_pm_runtime;
+		return ret;
 	}
 
 	/* Prepare rproc for firmware loading if needed */
@@ -1452,8 +1445,6 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	rproc_unprepare_device(rproc);
 disable_iommu:
 	rproc_disable_iommu(rproc);
-put_pm_runtime:
-	pm_runtime_put(dev);
 	return ret;
 }
 
@@ -1891,8 +1882,6 @@ void rproc_shutdown(struct rproc *rproc)
 
 	rproc_disable_iommu(rproc);
 
-	pm_runtime_put(dev);
-
 	/* Free the copy of the resource table */
 	kfree(rproc->cached_table);
 	rproc->cached_table = NULL;
@@ -2183,9 +2172,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 
 	rproc->state = RPROC_OFFLINE;
 
-	pm_runtime_no_callbacks(&rproc->dev);
-	pm_runtime_enable(&rproc->dev);
-
 	return rproc;
 
 put_device:
@@ -2205,7 +2191,6 @@ EXPORT_SYMBOL(rproc_alloc);
  */
 void rproc_free(struct rproc *rproc)
 {
-	pm_runtime_disable(&rproc->dev);
 	put_device(&rproc->dev);
 }
 EXPORT_SYMBOL(rproc_free);
-- 
2.25.1

