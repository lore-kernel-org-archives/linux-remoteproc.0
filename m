Return-Path: <SRS0=47aK=EF=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1B4C4741F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2EEE0206ED
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XU0AaVBZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727427AbgJ3T5Y (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 30 Oct 2020 15:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgJ3T5X (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 30 Oct 2020 15:57:23 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53DDC0613CF
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:23 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id j5so3479728plk.7
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d8vC964dzjnOG1s42jnfHaCETkISum3lh12P9W6/brk=;
        b=XU0AaVBZaCUu5iviJKd23NsekTDDlrchdezQ475j/IGe9Sqh3n6p5sYHESZvI9aAMs
         yDNxS2R4nunxR2GFhH8DtfDnWEhAOv1OtaGyGYTk/G2czyVpHFfWichr6mn7WXioXB0G
         rwRecT80Q4/2o+Z4XCI9rErGfX/sdwrtwvVFxKRrWddr05Y8QZE1HxnAvGEBckKUjz34
         IWIV73p2ukxuwwAx154XkiVDBN+s4bim+WhLb/h+AD4elmQDdLpuRHg0djVOtaMnr2Is
         4i/uXZbHmgQFySbrgdIO/xbS22t72VyOPnArKN4C6AfWy4fzx61OkwpIac7aGMy/qejo
         m4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d8vC964dzjnOG1s42jnfHaCETkISum3lh12P9W6/brk=;
        b=aMqHcHCc060YuB/JNI61obSV+wQtS8xP0SwxgjGAvY1f0RkxdYsaA4W0DZvuehiVKZ
         jl1DsmRI3V5Wt4ESolflLQ/msU9TIWK3b3aUOxPUrHIhWV7It6u+KqJMwBQR6tpZslRu
         OuzNEVLAsPZavTKLIaL5Dve2ADJCZoM0mElAWf9s0UnOCI4aPzCHZgpWwCJ5etUxy4Wp
         OFz9IQ0qM2mFSg1Yg6PI6vOVu6nBkE+vypiNdgq7u76UfXlKtZGAWfqTS33EoTokD6BP
         mM0pz4A1XvI/JKd7oDyztwP1OYI+gMvpRqf2SbK1DFv8aZaFR20eBke1pK/bBnqVzYuA
         sOXg==
X-Gm-Message-State: AOAM5330GyvLmzB035VODdGNrFb1DxP+jD8UHovbn2RWwPVr3hopjTyB
        r6IEhqMPUDqZ/VlUnNbNgrqd2w==
X-Google-Smtp-Source: ABdhPJzjbUeUT9qw4f/Nje9c/zAci15NK8OAfwLQZdF27YLXRMkrZ+RLbAVwHCVDdvLfEUznBPVdVg==
X-Received: by 2002:a17:902:21:b029:d2:564a:5dc6 with SMTP id 30-20020a1709020021b02900d2564a5dc6mr10654125pla.14.1604087843279;
        Fri, 30 Oct 2020 12:57:23 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o15sm6892640pfd.16.2020.10.30.12.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 12:57:22 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 08/14] remoteproc: Introduce function rproc_detach()
Date:   Fri, 30 Oct 2020 13:57:07 -0600
Message-Id: <20201030195713.1366341-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce function rproc_detach() to enable the remoteproc
core to release the resources associated with a remote processor
without stopping its operation.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_core.c | 65 +++++++++++++++++++++++++++-
 include/linux/remoteproc.h           |  1 +
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 62e88ff65009..6b33a83960d2 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1667,7 +1667,7 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 /*
  * __rproc_detach(): Does the opposite of rproc_attach()
  */
-static int __maybe_unused __rproc_detach(struct rproc *rproc)
+static int __rproc_detach(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
 	int ret;
@@ -1910,6 +1910,69 @@ void rproc_shutdown(struct rproc *rproc)
 }
 EXPORT_SYMBOL(rproc_shutdown);
 
+/**
+ * rproc_detach() - Detach the remote processor from the
+ * remoteproc core
+ *
+ * @rproc: the remote processor
+ *
+ * Detach a remote processor (previously attached to with rproc_actuate()).
+ *
+ * In case @rproc is still being used by an additional user(s), then
+ * this function will just decrement the power refcount and exit,
+ * without disconnecting the device.
+ *
+ * Function rproc_detach() calls __rproc_detach() in order to let a remote
+ * processor know that services provided by the application processor are
+ * no longer available.  From there it should be possible to remove the
+ * platform driver and even power cycle the application processor (if the HW
+ * supports it) without needing to switch off the remote processor.
+ */
+int rproc_detach(struct rproc *rproc)
+{
+	struct device *dev = &rproc->dev;
+	int ret;
+
+	ret = mutex_lock_interruptible(&rproc->lock);
+	if (ret) {
+		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
+		return ret;
+	}
+
+	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED) {
+		ret = -EPERM;
+		goto out;
+	}
+
+	/* if the remote proc is still needed, bail out */
+	if (!atomic_dec_and_test(&rproc->power)) {
+		ret = -EBUSY;
+		goto out;
+	}
+
+	ret = __rproc_detach(rproc);
+	if (ret) {
+		atomic_inc(&rproc->power);
+		goto out;
+	}
+
+	/* clean up all acquired resources */
+	rproc_resource_cleanup(rproc);
+
+	rproc_disable_iommu(rproc);
+
+	/*
+	 * Set the remote processor's table pointer to NULL.  Since mapping
+	 * of the resource table to a virtual address is done in the platform
+	 * driver, unmapping should also be done there.
+	 */
+	rproc->table_ptr = NULL;
+out:
+	mutex_unlock(&rproc->lock);
+	return ret;
+}
+EXPORT_SYMBOL(rproc_detach);
+
 /**
  * rproc_get_by_phandle() - find a remote processor by phandle
  * @phandle: phandle to the rproc
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 3faff9bb4fb8..6713faab6959 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -656,6 +656,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
 
 int rproc_boot(struct rproc *rproc);
 void rproc_shutdown(struct rproc *rproc);
+int rproc_detach(struct rproc *rproc);
 void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
 int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
 int rproc_coredump_add_custom_segment(struct rproc *rproc,
-- 
2.25.1

