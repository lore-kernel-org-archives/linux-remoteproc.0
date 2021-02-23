Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77FFAC433E6
	for <linux-remoteproc@archiver.kernel.org>; Wed, 24 Feb 2021 00:08:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2932064EBB
	for <linux-remoteproc@archiver.kernel.org>; Wed, 24 Feb 2021 00:08:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234135AbhBXAAy (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Feb 2021 19:00:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234127AbhBWXuG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Feb 2021 18:50:06 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06DC3C0611BC
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:32 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id e9so16332plh.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LAmTI3bglQtEFeSTtt3Ql1nIs9Boi2zxtX6t4SxVxWc=;
        b=NGED3eMgJhGkZutPXOY2WKCOmKOme62DKhXx1QZ0sElxKyqqf9wTTUOVOY3wtc5K7q
         3BbDYubPwKdE1O0ikOKN+N07cltdgjsC/CdhLIFXmy9woQx2nyu9a26Q7ESUKcBEzMC7
         TO1YtNGCi4mw6gNi+ZsBjHUW0aiM82TfpG9EfQvvYNPNPKiAlyd62qoGwdcO2Jf3AhTT
         tEXJu57bkHJ+qN2qzBLsnv8CS2MFmfTAl6LhTSsnNhOYQveF03NPu06l3/SnMa5tZVTM
         IxQIyS5lLIxjrjMnNTmNa/ITI7VH/w6egSsVh/Ca8ZUE6WdbTdzQdFDqvVstrTk2dC0n
         awnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LAmTI3bglQtEFeSTtt3Ql1nIs9Boi2zxtX6t4SxVxWc=;
        b=Y3GnaP6JoOzoorvtC8FhiSsFXdTZW94lkvrR/PI/74WBRtoFPNiSrp61RtE/RWHqt7
         rUxT5d7FIykHT+AO/k3l+kAyyQ52McG+pcGEOrZ2+zVjXkedwM6O0g6+bzZp/xJAGqA2
         XRSpFD/PCBC8TZKp8BjUP4mtQwEL2iWsLKlbIVlHu4lmOO1RMXd4racnqQwFoA9sU7j4
         TMBWfGxzqyTUwb7TVIV72gyG9mhWS9QnV1bAIVdyD+wcJ7A8fIFwn1Iv22ruPoKIYY37
         QQ+wU+zlxKo3w5DER1r+ECensbn3B4phrtUA5CLyHIJLcHCR3T+0eO3geOuh+ISxKz/U
         QRpw==
X-Gm-Message-State: AOAM530g0x9huQ9K003AgQAUkrnXnpP0Y3uewm1U/vT0+G2W5PbF/bvz
        fqxZXuqflqpAIu4BG8IX9a06UA==
X-Google-Smtp-Source: ABdhPJyR651tRS4bDZK72lnBVxuVN3KAk7P6cdiDxXGAKnu4Rzr7sbRRMCz02RCa2EQ4DN7T5maLSQ==
X-Received: by 2002:a17:90a:bc8e:: with SMTP id x14mr1111361pjr.153.1614123331588;
        Tue, 23 Feb 2021 15:35:31 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c24sm311999pfd.11.2021.02.23.15.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 15:35:31 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 14/16] remoteproc: Properly deal with a stop request when attached
Date:   Tue, 23 Feb 2021 16:35:13 -0700
Message-Id: <20210223233515.3468677-15-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
References: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Allow a remote processor that was started by another entity to be
switched off by the remoteproc core.  For that to happen a
rproc::ops::stop() operation needs to be available.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
New for V6:
- Removed state check in rproc_shutdown() as it is already done in
  in calling functions.
- rproc_shutdown() doesn't return an error code to keep legacy behevior.
- Removed Peng and Arnaud's RB tags because of the above.
---

 drivers/remoteproc/remoteproc_cdev.c  | 3 ++-
 drivers/remoteproc/remoteproc_core.c  | 4 ++++
 drivers/remoteproc/remoteproc_sysfs.c | 3 ++-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
index b2cee9afb41b..0249d8f6c3f8 100644
--- a/drivers/remoteproc/remoteproc_cdev.c
+++ b/drivers/remoteproc/remoteproc_cdev.c
@@ -38,7 +38,8 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
 
 		ret = rproc_boot(rproc);
 	} else if (!strncmp(cmd, "stop", len)) {
-		if (rproc->state != RPROC_RUNNING)
+		if (rproc->state != RPROC_RUNNING &&
+		    rproc->state != RPROC_ATTACHED)
 			return -EINVAL;
 
 		rproc_shutdown(rproc);
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 0dc518a24104..00452da25fba 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1758,6 +1758,10 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 	struct device *dev = &rproc->dev;
 	int ret;
 
+	/* No need to continue if a stop() operation has not been provided */
+	if (!rproc->ops->stop)
+		return -EINVAL;
+
 	/* Stop any subdevices for the remote processor */
 	rproc_stop_subdevices(rproc, crashed);
 
diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 66801e6fe5cd..09eb700c5e7e 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -202,7 +202,8 @@ static ssize_t state_store(struct device *dev,
 		if (ret)
 			dev_err(&rproc->dev, "Boot failed: %d\n", ret);
 	} else if (sysfs_streq(buf, "stop")) {
-		if (rproc->state != RPROC_RUNNING)
+		if (rproc->state != RPROC_RUNNING &&
+		    rproc->state != RPROC_ATTACHED)
 			return -EINVAL;
 
 		rproc_shutdown(rproc);
-- 
2.25.1

