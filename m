Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C2BC433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:51:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E49664E4A
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:51:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbhBKXvu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Feb 2021 18:51:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230320AbhBKXue (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Feb 2021 18:50:34 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A76C061356
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:59 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id n10so5058472pgl.10
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+0I2FxbDSsv8cQH5eSoJMFXvbpy5lOFWxMK2CkAG6co=;
        b=bCIeixkzJNEwVKPQsDrd499M79NaeE/5Qcm8AI5oQBm3ldjySTUXAI2Yb/sB8Az5KO
         doVYzyeXIzSQscA7IcfTX6pqSTsG3UzH5xq4y4IDFSYxckfc5zbkYFNFqSbw81BDqN3L
         DJQA1lArwqCBBC/3eTbYQX+QZ0OAiw7/JRCyRg2RU4nNjdyj9uk7sO56xiTRtcU6gDxN
         eBTuifKnwUKvCjQxcFxfkj1Ao0A1lf0yyijzVZhzjYslwrmfNQngmRJb55aIZxitGS/f
         vUw9efVAkFB5qXuBj8soe1CF+xGaUG74HAMBEc7h+3vo+/GyDGNZDsAbM1fmin0eVsvA
         acyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+0I2FxbDSsv8cQH5eSoJMFXvbpy5lOFWxMK2CkAG6co=;
        b=Onv3xYbLYraFRA2/3HesMkghq8gpWBAbji3vbjDUzZK2dbpo0l57rPaKdCj+eLqk0Q
         WS3ef6lB7FuQ2PIwpks7KXmZkE9ZzQfqBKULO5hPJoSGHgbWzWxkzZpLp3re80+VwA+Q
         QIPJFowmkESzVptStdG99qN96XLoUqqpjMnVy1P3S2Gr3QXbbY2MHPmbUIxVzyt3PMkd
         efwOPRdlkVFAQVjK69qm+7FpnUcD1Ip7I3XUBuYEVwUOFQcvrymEk9lyrKhDU+Yuk7+w
         HrTeNEmTF5pTojiE6u7fEsvGnkm3DEw+7eMQQlpGoznnLoRVaUa0OPtrngZ0jeWFI61c
         jtyg==
X-Gm-Message-State: AOAM531yZugB443Gb0+VjMei64bPG+R4DsG7yXNFK/GUKAcnKzk+l/7d
        HDAnMgI2RXrX2vxnnDYKrfRPqw==
X-Google-Smtp-Source: ABdhPJycmalaMFdZguE5XDaGUFLOkKYhtUY2aHj0pbXYDy1Md4ax/3AoEkMsJXJ3rS6D52R7XZ2BPg==
X-Received: by 2002:aa7:9ab2:0:b029:1e3:c753:acd8 with SMTP id x18-20020aa79ab20000b02901e3c753acd8mr370600pfi.44.1613087218700;
        Thu, 11 Feb 2021 15:46:58 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id iq6sm5932740pjb.6.2021.02.11.15.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 15:46:58 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 19/19] remoteproc: Refactor rproc delete and cdev release path
Date:   Thu, 11 Feb 2021 16:46:27 -0700
Message-Id: <20210211234627.2669674-20-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
References: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Refactor function rproc_del() and rproc_cdev_release() to take
into account the policy specified in the device tree.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_cdev.c | 18 +++++++++++---
 drivers/remoteproc/remoteproc_core.c | 36 ++++++++++++++++++++++++----
 include/linux/remoteproc.h           |  4 ++++
 3 files changed, 51 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
index f7645f289563..9b2fb6fbf8e7 100644
--- a/drivers/remoteproc/remoteproc_cdev.c
+++ b/drivers/remoteproc/remoteproc_cdev.c
@@ -87,11 +87,23 @@ static long rproc_device_ioctl(struct file *filp, unsigned int ioctl, unsigned l
 static int rproc_cdev_release(struct inode *inode, struct file *filp)
 {
 	struct rproc *rproc = container_of(inode->i_cdev, struct rproc, cdev);
+	int ret;
 
-	if (rproc->cdev_put_on_release && rproc->state == RPROC_RUNNING)
-		rproc_shutdown(rproc);
+	if (!rproc->cdev_put_on_release)
+		return 0;
 
-	return 0;
+	/*
+	 * The application has crashed or is releasing its file handle.  Detach
+	 * or shutdown the remote processor based on the policy specified in the
+	 * DT.  No need to check rproc->state right away, it will be done
+	 * in either rproc_detach() or rproc_shutdown().
+	 */
+	if (rproc->autonomous_on_core_shutdown)
+		ret = rproc_detach(rproc);
+	else
+		ret = rproc_shutdown(rproc);
+
+	return ret;
 }
 
 static const struct file_operations rproc_fops = {
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 12bd177aa8cd..36b3592caf34 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2413,6 +2413,22 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
 	return 0;
 }
 
+static void rproc_set_automation_flags(struct rproc *rproc)
+{
+	struct device *dev = rproc->dev.parent;
+	struct device_node *np = dev->of_node;
+	bool core_shutdown;
+
+	/*
+	 * When function rproc_cdev_release() or rproc_del() are called and
+	 * the remote processor has been attached to, it will be detached from
+	 * (rather than turned off) if "autonomous-on-core-shutdown is specified
+	 * in the DT.
+	 */
+	core_shutdown = of_property_read_bool(np, "autonomous-on-core-shutdown");
+	rproc->autonomous_on_core_shutdown = core_shutdown;
+}
+
 /**
  * rproc_alloc() - allocate a remote processor handle
  * @dev: the underlying device
@@ -2471,6 +2487,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	if (rproc_alloc_ops(rproc, ops))
 		goto put_device;
 
+	rproc_set_automation_flags(rproc);
+
 	/* Assign a unique device index and name */
 	rproc->index = ida_simple_get(&rproc_dev_index, 0, 0, GFP_KERNEL);
 	if (rproc->index < 0) {
@@ -2547,15 +2565,25 @@ EXPORT_SYMBOL(rproc_put);
  * of the outstanding reference created by rproc_alloc. To decrement that
  * one last refcount, one still needs to call rproc_free().
  *
- * Returns 0 on success and -EINVAL if @rproc isn't valid.
+ * Returns 0 on success and a negative error code on failure.
  */
 int rproc_del(struct rproc *rproc)
 {
+	int ret;
+
 	if (!rproc)
 		return -EINVAL;
 
-	/* TODO: make sure this works with rproc->power > 1 */
-	rproc_shutdown(rproc);
+	/*
+	 * TODO: make sure this works with rproc->power > 1
+	 *
+	 * No need to check rproc->state right away, it will be done in either
+	 * rproc_detach() or rproc_shutdown().
+	 */
+	if (rproc->autonomous_on_core_shutdown)
+		ret = rproc_detach(rproc);
+	else
+		ret = rproc_shutdown(rproc);
 
 	mutex_lock(&rproc->lock);
 	rproc->state = RPROC_DELETED;
@@ -2574,7 +2602,7 @@ int rproc_del(struct rproc *rproc)
 
 	device_del(&rproc->dev);
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL(rproc_del);
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 5b49c4018e90..bd3ac6a47e47 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -524,6 +524,9 @@ struct rproc_dump_segment {
  * @nb_vdev: number of vdev currently handled by rproc
  * @char_dev: character device of the rproc
  * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
+ * @autonomous_on_core_shutdown: true if the remote processor should be detached
+ *				 from (rather than turned off) when the remoteproc
+ *				 core goes away.
  */
 struct rproc {
 	struct list_head node;
@@ -563,6 +566,7 @@ struct rproc {
 	u16 elf_machine;
 	struct cdev cdev;
 	bool cdev_put_on_release;
+	bool autonomous_on_core_shutdown;
 };
 
 /**
-- 
2.25.1

