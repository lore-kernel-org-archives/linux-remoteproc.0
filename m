Return-Path: <SRS0=gNgS=AZ=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12827C433E8
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Jul 2020 19:50:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0701224D2
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Jul 2020 19:50:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pD5DjLXf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729874AbgGNTut (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Jul 2020 15:50:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729862AbgGNTus (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Jul 2020 15:50:48 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 097F4C061794
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2020 12:50:48 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id t6so8067528pgq.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2020 12:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9e5oyw3EpEAUNXXC3D3Or5+u88XxZ2wDyvbuUGOopOQ=;
        b=pD5DjLXf5nvPsFgBiCu+GVplqB7wbFTW6k50Gw4oVWTQg2dYsBVSCDBHfv0Mz8jaIc
         4TFVeD4ErhId3bwxwUaRLs0AKcHJVW/10Xiba+JZbR/AqzNa3FoJIN4IW5zBt/0+LIxk
         YMZIhlc89Xg4dSB67CpzbUJzsaZvK1fXMnXSZxeVY5b8xd0NoTOaMjGkGxIoWkq8HRdC
         FApoiyTsni8c9liw3rn3iFF0Bta9vY4kVtlMH5SnjFJqC8dIfUxNYJe7bw4mVu17DuHg
         RKIzcbp2u0yPY0wjdiTKpsIKHQABQZd1QYIhflQDzG9MOHQLgqWPHw6jACUrd5Xjxh2s
         zVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9e5oyw3EpEAUNXXC3D3Or5+u88XxZ2wDyvbuUGOopOQ=;
        b=PBStynzY2zvHZf5qj6x/kyobAMavUucGHP8mu61odosV2rdaTuRBeQ+531efL0bxtt
         gIfdCF0RncLkj6yRybWYCQ//O40jWHxcgA1L8Zx19wh1KlvRJydGchrYi4XvECVcHiyF
         jQv7kBtO58W8606VN2eFa/s6kGS2j5SciocE4oLmgX/cwNagoqV/J3bzr9xdoBBwJifx
         DESKeWp6RecMXExZoOOp8burgbxkTub8PHaZwqNvx0xDkoBsgJElZc/ghQBlicDZnZ7S
         rHcHqo0QSOFVfmSIpClJaEjL30VZLnEK+qIbMIUN5ZTtYBkIVT728KW1RjMEhQcQma7l
         wO+Q==
X-Gm-Message-State: AOAM530nV1v5UXkfo7hmOQsR+BCEGM3AmKy20YYW5cBa0DixLhvF0S2i
        LGDRcPHJPV4j7EI7XykytbQ3Tw==
X-Google-Smtp-Source: ABdhPJxnKdGpppGavOQKDJSfcPYLpFussnDxSqICbAETlSTje+PYY4ekJyYlYY9wyr2PzbmLNYHyQQ==
X-Received: by 2002:a05:6a00:134c:: with SMTP id k12mr5482683pfu.313.1594756247557;
        Tue, 14 Jul 2020 12:50:47 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id g8sm16736689pgr.70.2020.07.14.12.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 12:50:47 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 9/9] remoteproc: Properly handle firmware name when attaching
Date:   Tue, 14 Jul 2020 13:50:35 -0600
Message-Id: <20200714195035.1426873-10-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200714195035.1426873-1-mathieu.poirier@linaro.org>
References: <20200714195035.1426873-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch prevents the firmware image name from being displayed when
the remoteproc core is attaching to a remote processor. This is needed
needed since there is no guarantee about the nature of the firmware
image that is loaded by the external entity.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Tested-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c  | 18 ++++++++++++++++++
 drivers/remoteproc/remoteproc_sysfs.c | 16 ++++++++++++++--
 include/linux/remoteproc.h            |  2 ++
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 6b6e4ec8cf3a..099c76ab198f 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1624,6 +1624,14 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 
 	rproc->state = RPROC_OFFLINE;
 
+	/*
+	 * The remote processor has been stopped and is now offline, which means
+	 * that the next time it is brought back online the remoteproc core will
+	 * be responsible to load its firmware.  As such it is no longer
+	 * autonomous.
+	 */
+	rproc->autonomous = false;
+
 	dev_info(dev, "stopped remote processor %s\n", rproc->name);
 
 	return 0;
@@ -2142,6 +2150,16 @@ int rproc_add(struct rproc *rproc)
 	/* create debugfs entries */
 	rproc_create_debug_dir(rproc);
 
+	/*
+	 * Remind ourselves the remote processor has been attached to rather
+	 * than booted by the remoteproc core.  This is important because the
+	 * RPROC_DETACHED state will be lost as soon as the remote processor
+	 * has been attached to.  Used in firmware_show() and reset in
+	 * rproc_stop().
+	 */
+	if (rproc->state == RPROC_DETACHED)
+		rproc->autonomous = true;
+
 	/* if rproc is marked always-on, request it to boot */
 	if (rproc->auto_boot) {
 		ret = rproc_trigger_auto_boot(rproc);
diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 264759713934..eea514cec50e 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -15,8 +15,20 @@ static ssize_t firmware_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
 {
 	struct rproc *rproc = to_rproc(dev);
-
-	return sprintf(buf, "%s\n", rproc->firmware);
+	const char *firmware = rproc->firmware;
+
+	/*
+	 * If the remote processor has been started by an external
+	 * entity we have no idea of what image it is running.  As such
+	 * simply display a generic string rather then rproc->firmware.
+	 *
+	 * Here we rely on the autonomous flag because a remote processor
+	 * may have been attached to and currently in a running state.
+	 */
+	if (rproc->autonomous)
+		firmware = "unknown";
+
+	return sprintf(buf, "%s\n", firmware);
 }
 
 /* Change firmware name via sysfs */
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index bf6a310ba870..cf5e31556780 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -491,6 +491,7 @@ struct rproc_dump_segment {
  * @table_sz: size of @cached_table
  * @has_iommu: flag to indicate if remote processor is behind an MMU
  * @auto_boot: flag to indicate if remote processor should be auto-started
+ * @autonomous: true if an external entity has booted the remote processor
  * @dump_segments: list of segments in the firmware
  * @nb_vdev: number of vdev currently handled by rproc
  */
@@ -524,6 +525,7 @@ struct rproc {
 	size_t table_sz;
 	bool has_iommu;
 	bool auto_boot;
+	bool autonomous;
 	struct list_head dump_segments;
 	int nb_vdev;
 	u8 elf_class;
-- 
2.25.1

