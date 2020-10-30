Return-Path: <SRS0=47aK=EF=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 567C9C4741F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2DC7206DD
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P7ugzlDA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727240AbgJ3T5T (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 30 Oct 2020 15:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgJ3T5T (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 30 Oct 2020 15:57:19 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8306EC0613CF
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:19 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id h6so6112908pgk.4
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AQKUy2WOGIwxSAiaY3BkIXBU/7c4r+yinzFDwKGfcZQ=;
        b=P7ugzlDAaqV2RZq5DLncXT+wLlVxFEgSlAlO0ce3BD/iR6b8t4Hdwo3/GbrkdgKUDz
         Yy8BpGVFTQlUKFk2YBXfHGK3w5CWty/FQ4zYLjWLiE5oyPxVFcm4jIIMAkvzA2PR7Yh9
         +WbBRLs1kUQqtxU1jmmOrPXsuwYer0N5fcYMh727p6vVDukGAX3+tnGq2Ly00sot0Si3
         NcrG+XZnDkXW/VHH1WQjnFYS1FVNB4oKmeQsYz6QGFdjpzOMhyWvPPZfG0oUHUmY1cLd
         NO91Tia+K4ZyFmfJRH7+GFXu0zv/0aJ83XPkY/gJlXJ9CEiDty9rb6gSzCknvQ5wSRZL
         MMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AQKUy2WOGIwxSAiaY3BkIXBU/7c4r+yinzFDwKGfcZQ=;
        b=QL9hTdqHplpP9kh1lThAepda9sJAfc85q5KlUlnWMTs1tHjcmzhQ1+E9pbcHLYtRYL
         f7zSVQQ0lyhLfjpF4P3E3cLPU14ueiqBxGqnWQqKnsJ1wCASL6z7r5OV47gp9gs6L4G0
         3AhTE16MeWlKz0DSWfqC4pgfCjExiAv09Tw9FnD/0zRhigJfixPUij0mCDXafFOhZ/z0
         yYT7F2c7UVvCfW5h3Bul8zjNUJAQ7x8wdlHEgUNDTMwmycFXW0e3kNxLaEvcJ6M6vBHy
         /bfy2CeqRlv8Q0pXEEbw60IGGPJDQrx6fD2vKgiu3FVf1C896mZBfZjx9Tdoj+3URwpa
         0oaQ==
X-Gm-Message-State: AOAM5329bDfCXXzEviUJ5FJPdwEesFNplx5szU2XPpw1v7e/8pjXDCrt
        FKZJNkPetLGFSJVYWYVYHkxwzQ==
X-Google-Smtp-Source: ABdhPJyCxOAiHeZVovskUfKKpQvhu7vsXRpz9z5ltDEEiuWN0ongpIxA4PRpGO3Zi0i8Tqzu2ErnYw==
X-Received: by 2002:a17:90a:d490:: with SMTP id s16mr4538870pju.185.1604087839084;
        Fri, 30 Oct 2020 12:57:19 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o15sm6892640pfd.16.2020.10.30.12.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 12:57:18 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 04/14] remoteproc: Properly represent the attached state
Date:   Fri, 30 Oct 2020 13:57:03 -0600
Message-Id: <20201030195713.1366341-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
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
---
 drivers/remoteproc/remoteproc_core.c  | 20 +-------------------
 drivers/remoteproc/remoteproc_sysfs.c |  5 +----
 include/linux/remoteproc.h            |  2 --
 3 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f36786b47a4f..63fba1b61840 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1444,7 +1444,7 @@ static int rproc_attach(struct rproc *rproc)
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
@@ -2017,16 +2009,6 @@ int rproc_add(struct rproc *rproc)
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
index 4564c4665a2c..3fe2ae0bd1ca 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -510,7 +510,6 @@ struct rproc_dump_segment {
  * @table_sz: size of @cached_table
  * @has_iommu: flag to indicate if remote processor is behind an MMU
  * @auto_boot: flag to indicate if remote processor should be auto-started
- * @autonomous: true if an external entity has booted the remote processor
  * @dump_segments: list of segments in the firmware
  * @nb_vdev: number of vdev currently handled by rproc
  * @char_dev: character device of the rproc
@@ -547,7 +546,6 @@ struct rproc {
 	size_t table_sz;
 	bool has_iommu;
 	bool auto_boot;
-	bool autonomous;
 	struct list_head dump_segments;
 	int nb_vdev;
 	u8 elf_class;
-- 
2.25.1

