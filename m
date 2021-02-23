Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0B1C433DB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 23:42:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76A9C64E00
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 23:42:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231735AbhBWXkw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Feb 2021 18:40:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232894AbhBWXhY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Feb 2021 18:37:24 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 852C3C061797
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:21 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id w18so7695067plc.12
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EmIttTOsgDNM++s8zt1RjF9fKLTZIPRgfTRmynUwSgM=;
        b=mcwM58WWsUXUvIsh2FdJ4BES+IgpYxO9AhUPJ1gWIw1zLuH2xRbnJpycVWoQY4dTme
         qd23XOhFVBK0Zm6R5OB2q8jjG7/BJOFGyDGUlj0bBDMrxogj2MLSKaDvvZ1GYJoXMo0c
         bF+o0kIrw0ndsMOdNGwjYVFJGe+Gro2hwWGIMWc6WYuUFHK4Bl5u40JATi5ho20E6NgM
         9y43IF7s5l7K5wvZ0rwgVnDq25TJVK0SIx7iaLQB6bf4xBJTzwi2Mt0O4ot30d7hccm+
         aX3YxzcOp7V67egVVkk8mRCOiVQXT+sdCpAUDhl0H6Gd1anKXA30nc7vmSLU0NDefPM6
         xhMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EmIttTOsgDNM++s8zt1RjF9fKLTZIPRgfTRmynUwSgM=;
        b=R4YF9giAK3ltQAJSSxMnRCTu7RO79A7EzTHslpyOKTJgYk619U4EMM9DMg5J6oRbfW
         P2oY1+c/yKMtvYm0z2LXPBfLBgyVERMDIzkB30xnwnHY6bDLddsiFdr08TXKh/XDWu7a
         jyGfcONs9b/vtzzkpgxg6ZWs4SyVfwZd5NA/yxw3hfJT2kbku/gr5Ud07XOdwvc6c8VK
         2T9oVCv3aSpOY7d7p8BCp+mLZ6WOuq2N8r4xgi7Su+rR30dsmslT8SetFgBOt3Wy6r27
         c8Ky/KCpLwWokc4rAYF8BDrdlPpp8NZ66CibKIPYrL36keq+86qREYuzfAxP4G0bdtsd
         uSuQ==
X-Gm-Message-State: AOAM531VXomZAJdudDhUc6AzaG1vpB7QfLLE68/ZK3U1/eHEdi1TCNMr
        ElVgyLez5I8kmgDhB0zqux/i+A==
X-Google-Smtp-Source: ABdhPJwB64ZHJ+69jz6oUR677oeFjkpkM0jxtAJzpXOouYsqrX1PbR4Ai+OtceRTW6rwTfNvfVAlOg==
X-Received: by 2002:a17:902:7c90:b029:e4:340b:37e7 with SMTP id y16-20020a1709027c90b02900e4340b37e7mr475922pll.2.1614123321091;
        Tue, 23 Feb 2021 15:35:21 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c24sm311999pfd.11.2021.02.23.15.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 15:35:20 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 04/16] remoteproc: Properly represent the attached state
Date:   Tue, 23 Feb 2021 16:35:03 -0700
Message-Id: <20210223233515.3468677-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
References: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
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
index 7b66e1e96e4a..8c7e9f1d50d7 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1444,7 +1444,7 @@ static int __rproc_attach(struct rproc *rproc)
 		goto stop_rproc;
 	}
 
-	rproc->state = RPROC_RUNNING;
+	rproc->state = RPROC_ATTACHED;
 
 	dev_info(dev, "remote processor %s is now attached\n", rproc->name);
 
@@ -1659,14 +1659,6 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 
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
@@ -2077,16 +2069,6 @@ int rproc_add(struct rproc *rproc)
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
index 4b4aab0d4c4b..f9694def9b54 100644
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
index b0a57ff73849..6b0a0ed30a03 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -512,7 +512,6 @@ struct rproc_dump_segment {
  * @table_sz: size of @cached_table
  * @has_iommu: flag to indicate if remote processor is behind an MMU
  * @auto_boot: flag to indicate if remote processor should be auto-started
- * @autonomous: true if an external entity has booted the remote processor
  * @dump_segments: list of segments in the firmware
  * @nb_vdev: number of vdev currently handled by rproc
  * @char_dev: character device of the rproc
@@ -549,7 +548,6 @@ struct rproc {
 	size_t table_sz;
 	bool has_iommu;
 	bool auto_boot;
-	bool autonomous;
 	struct list_head dump_segments;
 	int nb_vdev;
 	u8 elf_class;
-- 
2.25.1

