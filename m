Return-Path: <SRS0=OrS8=7O=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DABC433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Jun 2020 17:51:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A680B206E2
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Jun 2020 17:51:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xV8yuXtw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728162AbgFARvw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 1 Jun 2020 13:51:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728144AbgFARvv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 Jun 2020 13:51:51 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51720C08C5CB
        for <linux-remoteproc@vger.kernel.org>; Mon,  1 Jun 2020 10:51:51 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id m7so251442plt.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Jun 2020 10:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pqpjieqWzPdW4kzMNpwF5pnX0DXNGRCF4a9MybtJdT0=;
        b=xV8yuXtwUh++8lV8BVnmVOMFKn53SmBmnp2YNZxGf8Trj+639nR8oSYo80GhJ9HoEM
         Cyxq9yEixuV9BAacNnNlsgDlyNdb7ep1rEknCXcA6JL18jGHKKllU3mWDIOz5Q+QWLPR
         CqcqTdHCs2ddxMFa+7kjz4tDJB7JBC/D9LbnPDLUh5+KBLCkz/birKGLRY4fyLXQaC+2
         e0BzZyj+uFckAtUW4EPOfaiLudrq5/5K8qaepd4twB6/4f+pKxeUSQGYe9kXTlo5ZxSM
         GoPCUnixn2Ad9tWPZYRUExGsMKJ1vQRnkwQJrz1avpfJRh5s6o8Lhi9VENgDu9QQy7Ls
         fO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pqpjieqWzPdW4kzMNpwF5pnX0DXNGRCF4a9MybtJdT0=;
        b=PDE6QC5vskvOi5MHW1x5QvM4l18u39mpEIR5dMpYIMtUajsZx10H9ZRKKpgrqxVc+r
         ABmlZdGHrQI4JZM117xlSESne1raz8tM9HznBHeqVmqz8shm/xyn50znU/Xih9G+8QZu
         OreZEd18VI37A9rnJbJVgxUp6RKfOeE0rlWRuWh4fT4KCHSg2k7BXv5QlPAY+K/2KQvq
         JsFnWs5jmd1ffZBmZhy2yDbQT+uaoU+Z8B5Uh2GUTbARPnNqiJzAWLMwd8Ffx1K6tEwe
         tJTJQwA08CIxWTCFf+WijcAtsBVCmTamRNekG2u/oXyoURg6g6eCKKGcy7y9NlN4Pvg/
         obAg==
X-Gm-Message-State: AOAM530KNDFEdHG+pZVeiuyirMRz3woivTVBCLBRROnDDC/m13vqTY+U
        UaPxNmRFt39/RQV7C/e9f8Y5tg==
X-Google-Smtp-Source: ABdhPJzUdnArY7LUm+Nti3l1o/PEa4bBNpE6E6cm6T4db8FdE0WHvO5lbq7oqp2iucgX6qWRh5QGkA==
X-Received: by 2002:a17:90b:3651:: with SMTP id nh17mr629350pjb.4.1591033910795;
        Mon, 01 Jun 2020 10:51:50 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id k12sm58219pfg.177.2020.06.01.10.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 10:51:50 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.pallardy@st.com, arnaud.pouliquen@st.com, s-anna@ti.com
Subject: [PATCH v4 9/9] remoteproc: Properly handle firmware name when attaching
Date:   Mon,  1 Jun 2020 11:51:39 -0600
Message-Id: <20200601175139.22097-10-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601175139.22097-1-mathieu.poirier@linaro.org>
References: <20200601175139.22097-1-mathieu.poirier@linaro.org>
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
---
 drivers/remoteproc/remoteproc_core.c  | 18 ++++++++++++++++++
 drivers/remoteproc/remoteproc_sysfs.c | 16 ++++++++++++++--
 include/linux/remoteproc.h            |  2 ++
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 0e23284fbd25..a8adc712e7f6 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1642,6 +1642,14 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 
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
@@ -2166,6 +2174,16 @@ int rproc_add(struct rproc *rproc)
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
index 8b462c501465..4ee158431f67 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -14,8 +14,20 @@ static ssize_t firmware_show(struct device *dev, struct device_attribute *attr,
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
2.20.1

