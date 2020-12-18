Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F45EC2BBD5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Dec 2020 17:34:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 172BD23B6B
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Dec 2020 17:34:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732798AbgLRReX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 18 Dec 2020 12:34:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732839AbgLRReX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 18 Dec 2020 12:34:23 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1E93C061A4C
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Dec 2020 09:32:46 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id w6so1961371pfu.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Dec 2020 09:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mdgob6jb0rUl30rfuLBWyS6H4rN7qpxnzyGATQ2xIt0=;
        b=Z/bCGb665F1fxnTF+3LEJAjTLAyRytVrF5nB84gRSWFkw9pBOTDRyaetGJaVASDVf6
         +nCf5Bzq1+bCfC0ZehUxmqVXTSEF7Ox4nPgslBlQKHFo2pX4hZzlnMxfuMhnTpEIy2t3
         QX1JabKmP8D2ajzElTIJHWwsg0XxZf+Sdj4mOaaDI0x1Zf6hS/8e4LAS3GjSgbVQsycU
         uXtaDQOOvuGn6B9+d41ZrH+ckbZzv5tgX7LMEi7WxfusAahQEnVXcCvdEODCIMX6ulCo
         P3yNhh4uYuuNmDcUhd8xzicCX0lfgBiSzor5WZTOjIfdU4Pf4pHUCtMsPZ0nMFbppxC9
         2IOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mdgob6jb0rUl30rfuLBWyS6H4rN7qpxnzyGATQ2xIt0=;
        b=hgk4C2CMyDy7hubA9IsSyKSlNj8A38ioT1tf/crwwDWqEkdz3vE+kzZiKs5n/Ty1LJ
         vYLO9cu0NRaQzOwuRM22pDYuwBWfVHV5MbzWs1eUjoxHzMK56MUNDDM/qS9eYa8zh1uv
         eqVd/WR35jH0NKU3t86WZxabZhM9uCEoZyefrdf5Z/hnSrJ2ojuA5MBSLeCq5OYpV03C
         XWLAvOKEFI4QU182v8I1ngUB+FaHuJBa3JxBWRyLY2MRNKD36Grla6gB7fC/HxRWw6p0
         Qdgc1Q9T1dMqlc+A1YhdGx95Z2MK8CXBpvnDRcLpQfJzQzsmUSAQLPGzfmOE+xJein53
         UbZA==
X-Gm-Message-State: AOAM532kNWJkWWqjsWJJRkkGVhXAgkRUYkNs5rzoBNLPCQNEjBVeAFLH
        O2txOqeA9on0JdZnawsu2440yg==
X-Google-Smtp-Source: ABdhPJy/+ZjcVxtTwF++2jStA55jRMPC2aPW/4VFjoWMyt1jjjmt0nHwJ8iyT7Xxi66ffp3w1L1SkA==
X-Received: by 2002:a63:2fc5:: with SMTP id v188mr4987089pgv.243.1608312766353;
        Fri, 18 Dec 2020 09:32:46 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id l11sm9892957pgt.79.2020.12.18.09.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 09:32:45 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     arnaud.pouliquen@st.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 14/17] remoteproc: Properly deal with a stop request when attached
Date:   Fri, 18 Dec 2020 10:32:25 -0700
Message-Id: <20201218173228.2277032-15-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201218173228.2277032-1-mathieu.poirier@linaro.org>
References: <20201218173228.2277032-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch introduces the capability to stop a remote processor
that has been attached to by the remoteproc core.  For that to
happen a rproc::ops::stop() operation need to be available.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_cdev.c  | 5 +++--
 drivers/remoteproc/remoteproc_core.c  | 6 +++++-
 drivers/remoteproc/remoteproc_sysfs.c | 5 +++--
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
index b19ea3057bde..d06f8d4919c7 100644
--- a/drivers/remoteproc/remoteproc_cdev.c
+++ b/drivers/remoteproc/remoteproc_cdev.c
@@ -37,10 +37,11 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
 
 		ret = rproc_boot(rproc);
 	} else if (!strncmp(cmd, "stop", len)) {
-		if (rproc->state != RPROC_RUNNING)
+		if (rproc->state != RPROC_RUNNING &&
+		    rproc->state != RPROC_ATTACHED)
 			return -EINVAL;
 
-		rproc_shutdown(rproc);
+		ret = rproc_shutdown(rproc);
 	} else {
 		dev_err(&rproc->dev, "Unrecognized option\n");
 		ret = -EINVAL;
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 90057ad1bb6c..2fe42ac7ca89 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1648,6 +1648,10 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 	struct device *dev = &rproc->dev;
 	int ret;
 
+	/* No need to continue if a stop() operation has not been provided */
+	if (!rproc->ops->stop)
+		return -EINVAL;
+
 	/* Stop any subdevices for the remote processor */
 	rproc_stop_subdevices(rproc, crashed);
 
@@ -1897,7 +1901,7 @@ int rproc_shutdown(struct rproc *rproc)
 		return ret;
 	}
 
-	if (rproc->state != RPROC_RUNNING) {
+	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED) {
 		ret = -EPERM;
 		goto out;
 	}
diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 99ff51fd9707..96751c087585 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -230,10 +230,11 @@ static ssize_t state_store(struct device *dev,
 		if (ret)
 			dev_err(&rproc->dev, "Boot failed: %d\n", ret);
 	} else if (sysfs_streq(buf, "stop")) {
-		if (rproc->state != RPROC_RUNNING)
+		if (rproc->state != RPROC_RUNNING &&
+		    rproc->state != RPROC_ATTACHED)
 			return -EINVAL;
 
-		rproc_shutdown(rproc);
+		ret = rproc_shutdown(rproc);
 	} else {
 		dev_err(&rproc->dev, "Unrecognised option: %s\n", buf);
 		ret = -EINVAL;
-- 
2.25.1

