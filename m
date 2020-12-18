Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B19C35273
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Dec 2020 17:34:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C01FA23B6B
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Dec 2020 17:34:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732713AbgLRReI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 18 Dec 2020 12:34:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732694AbgLRReH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 18 Dec 2020 12:34:07 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1C47C0619DB
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Dec 2020 09:32:39 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id n7so1759352pgg.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Dec 2020 09:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GfAYvBHbjdMUa8RWoEQi/iMGUW9VzhbWJlUDatd7jcU=;
        b=prkzIuN97+jNEpprDZ7gPj1HbaI732J7q4fHIF0k4XfYqWiNkOiy5j/hXbkunlilb2
         gY5Z2ivhxKohvyOzzK4UOS7WX1imqUG1mpL8qHV5ZFcBDUZHXdqbwYiw9wNhy/yAEBdA
         g5+yW1w1R7HZpmhUAIAjVs7ceQYDBwCczyANRH1KDxABJs1B60hazMtOPJbB0eJfohhg
         vAEC5Ez0eIHHpxtVUHqfyLj5iSHZD+lhKR4+KsGnhVa1jZXKK3VEsbn09Yh9pZZqbJCD
         o9yp6hI2Z356ky++68fz7Q1gjr2tvzxdl77Nch9biWaLKVJ4BN7qbOMsQnSyint4wFvV
         U/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GfAYvBHbjdMUa8RWoEQi/iMGUW9VzhbWJlUDatd7jcU=;
        b=XeMqw1iqC7pBgT4kbFZYEBURHRZOifOk3STYyi0OymK3jt+1gayGpWmS9aiWR+xWMQ
         +KFrHWp/qmkEUXHjYPgLb9Au/1VW8BumMduDQYO0NlDYFgkBHXpTZC+Yzxx8q+jZBn9S
         SdZM6d5vU0jdpOMY/LRgOoLFXEGHiI55puFXZP9jBAiqArRewE8jX2P2c49QRuOOXZ8G
         h7ZBWAnT/+wsHEAqN+130DQfF2w5yrNpY+wARkftRdibyP+wJ10D+DKuj0qOrU2fHNJ9
         by+qWx8RKUxlJ6fetqWuTvrnl3x1c9P64vORI1xl1eE6Gatye9Eve3pEs/jPPLaCcbPW
         yMSw==
X-Gm-Message-State: AOAM531kTfLT+/Y4sV2z86fiC3boSf2Vg8Y2Pf6P1VBlt6HPN9uIm2VR
        VNIsY0rNkg8Ioz3UIHep8WXh1Q==
X-Google-Smtp-Source: ABdhPJyJv4r/lTmSSwsyWCMJwd0QGEMhsBG3iVOEJc1MbcZ0nVgXFTyh3zRFkhSSE8kWSaP6kGF6GQ==
X-Received: by 2002:a63:b908:: with SMTP id z8mr5225658pge.396.1608312759574;
        Fri, 18 Dec 2020 09:32:39 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id l11sm9892957pgt.79.2020.12.18.09.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 09:32:38 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     arnaud.pouliquen@st.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 08/17] remoteproc: Properly represent the attached state
Date:   Fri, 18 Dec 2020 10:32:19 -0700
Message-Id: <20201218173228.2277032-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201218173228.2277032-1-mathieu.poirier@linaro.org>
References: <20201218173228.2277032-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

There is a need to know when a remote processor has been attached
to rather than booted by the remoteproc core.  In order to avoid
manipulating two variables, i.e rproc::autonomous and
rproc::state, get rid of the former and simply use the newly
introduced RPROC_ATTACHED state.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c  | 20 +-------------------
 drivers/remoteproc/remoteproc_sysfs.c |  5 +----
 include/linux/remoteproc.h            |  2 --
 3 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 3d87c910aca7..19545b7925e2 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1444,7 +1444,7 @@ static int __rproc_attach(struct rproc *rproc)
 		goto stop_rproc;
 	}
 
-	rproc->state = RPROC_RUNNING;
+	rproc->state = RPROC_ATTACHED;
 
 	dev_info(dev, "remote processor %s is now attached\n", rproc->name);
 
@@ -1665,14 +1665,6 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 
 	rproc->state = RPROC_OFFLINE;
 
-	/*
-	 * The remote processor has been stopped and is now offline, which means
-	 * that the next time it is brought back online the remoteproc core will
-	 * be responsible to load its firmware.  As such it is no longer
-	 * autonomous.
-	 */
-	rproc->autonomous = false;
-
 	dev_info(dev, "stopped remote processor %s\n", rproc->name);
 
 	return 0;
@@ -2023,16 +2015,6 @@ int rproc_add(struct rproc *rproc)
 	if (ret < 0)
 		return ret;
 
-	/*
-	 * Remind ourselves the remote processor has been attached to rather
-	 * than booted by the remoteproc core.  This is important because the
-	 * RPROC_DETACHED state will be lost as soon as the remote processor
-	 * has been attached to.  Used in firmware_show() and reset in
-	 * rproc_stop().
-	 */
-	if (rproc->state == RPROC_DETACHED)
-		rproc->autonomous = true;
-
 	/* if rproc is marked always-on, request it to boot */
 	if (rproc->auto_boot) {
 		ret = rproc_trigger_auto_boot(rproc);
diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 1167adcf8741..99ff51fd9707 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -138,11 +138,8 @@ static ssize_t firmware_show(struct device *dev, struct device_attribute *attr,
 	 * If the remote processor has been started by an external
 	 * entity we have no idea of what image it is running.  As such
 	 * simply display a generic string rather then rproc->firmware.
-	 *
-	 * Here we rely on the autonomous flag because a remote processor
-	 * may have been attached to and currently in a running state.
 	 */
-	if (rproc->autonomous)
+	if (rproc->state == RPROC_ATTACHED)
 		firmware = "unknown";
 
 	return sprintf(buf, "%s\n", firmware);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index f02958a6c001..257a5005f93e 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -513,7 +513,6 @@ struct rproc_dump_segment {
  * @table_sz: size of @cached_table
  * @has_iommu: flag to indicate if remote processor is behind an MMU
  * @auto_boot: flag to indicate if remote processor should be auto-started
- * @autonomous: true if an external entity has booted the remote processor
  * @dump_segments: list of segments in the firmware
  * @nb_vdev: number of vdev currently handled by rproc
  * @char_dev: character device of the rproc
@@ -550,7 +549,6 @@ struct rproc {
 	size_t table_sz;
 	bool has_iommu;
 	bool auto_boot;
-	bool autonomous;
 	struct list_head dump_segments;
 	int nb_vdev;
 	u8 elf_class;
-- 
2.25.1

