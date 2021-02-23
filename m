Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE31C433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 23:46:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B80A64E00
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 23:46:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233617AbhBWXqd (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Feb 2021 18:46:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233817AbhBWXkR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Feb 2021 18:40:17 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47EA9C061225
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:29 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id t9so33142pjl.5
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HPbp3odOfaIom8lulpC+zN3L+Tw5Db1SxhlJJbdYzWA=;
        b=Lnhc24KUMdXeZxlsoSjmtldmuCTGikwcXR8zVl7VpxCaVNl0reanjW2E/uPrMbr4Jk
         JCe2X/s4nJZ1ORlDlUbDUNrKCN8Z0311QgBQI7bxsxWtZMgckQ8Kt/KDOUqADlTvfE3U
         zTszAoiysnpt3YoNW9JD2SuFL3QC54p956Qa9TcMHZKdBKDZdD1fpoCrZQSIKrMLvHXb
         bVC4ELvIfewd8z+2/69lluul2fFT1q1obxQ5Kje7e3cMPH4UdzTbJS5Hkhbw1l/Pp4tb
         AblViX0ispBByz7T9pemaTozghMPHlrIW09cSlrW/kFTyTlS0z8D6qJErGxF0TqPhnxy
         CRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HPbp3odOfaIom8lulpC+zN3L+Tw5Db1SxhlJJbdYzWA=;
        b=b0YO5kgNMlHMaWNusiXMOBE5TLSi2RPmZTMq+7KV/6AYPJhcSXydq/2OUDEpbgeEIh
         1+4BL4NVCZtYTKK8+Psruu+1pF0IgH3pP7tp8qunmAszn1iP2VXu9q2N7464Y4QQEqne
         CV772BBRlBYuSr9bWufJrU4WYdxM8Ct86TijIPDj8RI1Te7p+sbp8cvQGzfitLFw54a/
         xQaYMUe40oD/EPEJoEMa6+dRjugJxgjgI/5yaMhRFachajEVvKOkiyhJJWqZehxruiHO
         syZVi4MgwQkOmZTIkWcKO1IDJdLLnaMthV+h/Ze6x4wx9SrbB2dYh7JX+hAu9muQWDQQ
         53jg==
X-Gm-Message-State: AOAM5329csX3+iop+gySBjdc0FYFjSae1M9b9pOibEJjzJZhY1gkh4N6
        /MdPrXm8AyKrI0dD9ryWwYimOsKvgNK89A==
X-Google-Smtp-Source: ABdhPJx/VI9lhdfasSY6+J9J7zhrY1PeQnVBk9Jj0sOSq96rQttwigsoFbpE/xJcM+9epB+bcWL5OQ==
X-Received: by 2002:a17:90a:fb58:: with SMTP id iq24mr1208810pjb.64.1614123328836;
        Tue, 23 Feb 2021 15:35:28 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c24sm311999pfd.11.2021.02.23.15.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 15:35:28 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 11/16] remoteproc: Properly deal with the resource table when attached
Date:   Tue, 23 Feb 2021 16:35:10 -0700
Message-Id: <20210223233515.3468677-12-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
References: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

If it is possible to detach the remote processor, keep an untouched
copy of the resource table.  That way we can start from the same
resource table without having to worry about original values or what
elements the startup code has changed when re-attaching to the remote
processor.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
New for V6:
- Double free of the cached table has been fixed.
- rproc_reset_loaded_rsc_table() has seen a complete re-write.
- rproc_stop() now calls rproc_reset_loaded_rsc_table() rather than
  dealing with the cached.  This allows to properly shutdown a
  remote processor that was attached to.
---

 drivers/remoteproc/remoteproc_core.c | 86 +++++++++++++++++++++++++++-
 include/linux/remoteproc.h           |  3 +
 2 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index fc01b29290a6..3a4692cc5220 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1556,6 +1556,21 @@ static int rproc_set_loaded_rsc_table(struct rproc *rproc)
 		return ret;
 	}
 
+	/*
+	 * If it is possible to detach the remote processor, keep an untouched
+	 * copy of the resource table.  That way we can start fresh again when
+	 * the remote processor is re-attached, that is:
+	 *
+	 *      DETACHED -> ATTACHED -> DETACHED -> ATTACHED
+	 *
+	 * Free'd in rproc_reset_loaded_rsc_table().
+	 */
+	if (rproc->ops->detach) {
+		rproc->clean_table = kmemdup(table_ptr, table_sz, GFP_KERNEL);
+		if (!rproc->clean_table)
+			return -ENOMEM;
+	}
+
 	rproc->cached_table = NULL;
 	rproc->table_ptr = table_ptr;
 	rproc->table_sz = table_sz;
@@ -1563,6 +1578,65 @@ static int rproc_set_loaded_rsc_table(struct rproc *rproc)
 	return 0;
 }
 
+static int rproc_reset_loaded_rsc_table(struct rproc *rproc)
+{
+	struct resource_table *table_ptr;
+
+	/*
+	 * The cached table is already set if the remote processor was started
+	 * by the remoteproc core.
+	 */
+	if (rproc->state == RPROC_RUNNING) {
+		rproc->table_ptr = rproc->cached_table;
+		return 0;
+	}
+
+	/* A resource table was never retrieved, nothing to do here */
+	if (!rproc->table_ptr)
+		return 0;
+
+	/*
+	 * If we made it to this point a cached_table _must_ have been
+	 * allocated in rproc_set_loaded_rsc_table().  If one isn't present
+	 * something went really wrong and we must complain.
+	 */
+	if (WARN_ON(!rproc->clean_table))
+		return -EINVAL;
+
+	/* Remember where the external entity installed the resource table */
+	table_ptr = rproc->table_ptr;
+
+	/*
+	 * Make a copy of the resource table currently used by the remote
+	 * processor.  Free'd in rproc_detach() or rproc_shutdown().
+	 */
+	rproc->cached_table = kmemdup(rproc->table_ptr,
+				      rproc->table_sz, GFP_KERNEL);
+	if (!rproc->cached_table)
+		return -ENOMEM;
+
+	/*
+	 * Use a copy of the resource table for the remainder of the
+	 * shutdown process.
+	 */
+	rproc->table_ptr = rproc->cached_table;
+
+	/*
+	 * Reset the memory area where the firmware loaded the resource table
+	 * to its original value.  That way when we re-attach the remote
+	 * processor the resource table is clean and ready to be used again.
+	 */
+	memcpy(table_ptr, rproc->clean_table, rproc->table_sz);
+
+	/*
+	 * The clean resource table is no longer needed.  Allocated in
+	 * rproc_set_loaded_rsc_table().
+	 */
+	kfree(rproc->clean_table);
+
+	return 0;
+}
+
 /*
  * Attach to remote processor - similar to rproc_fw_boot() but without
  * the steps that deal with the firmware image.
@@ -1688,7 +1762,11 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 	rproc_stop_subdevices(rproc, crashed);
 
 	/* the installed resource table is no longer accessible */
-	rproc->table_ptr = rproc->cached_table;
+	ret = rproc_reset_loaded_rsc_table(rproc);
+	if (ret) {
+		dev_err(dev, "can't reset resource table: %d\n", ret);
+		return ret;
+	}
 
 	/* power off the remote processor */
 	ret = rproc->ops->stop(rproc);
@@ -1721,6 +1799,9 @@ static int __rproc_detach(struct rproc *rproc)
 	/* Stop any subdevices for the remote processor */
 	rproc_stop_subdevices(rproc, false);
 
+	/* the installed resource table is no longer accessible */
+	ret = rproc_reset_loaded_rsc_table(rproc);
+
 	/* Tell the remote processor the core isn't available anymore */
 	ret = rproc->ops->detach(rproc);
 	if (ret) {
@@ -1997,6 +2078,9 @@ int rproc_detach(struct rproc *rproc)
 
 	rproc_disable_iommu(rproc);
 
+	/* Free the copy of the resource table */
+	kfree(rproc->cached_table);
+	rproc->cached_table = NULL;
 	rproc->table_ptr = NULL;
 out:
 	mutex_unlock(&rproc->lock);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index e1c843c19cc6..e5f52a12a650 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -514,6 +514,8 @@ struct rproc_dump_segment {
  * @recovery_disabled: flag that state if recovery was disabled
  * @max_notifyid: largest allocated notify id.
  * @table_ptr: pointer to the resource table in effect
+ * @clean_table: copy of the resource table without modifications.  Used
+ *		 when a remote processor is attached or detached from the core
  * @cached_table: copy of the resource table
  * @table_sz: size of @cached_table
  * @has_iommu: flag to indicate if remote processor is behind an MMU
@@ -550,6 +552,7 @@ struct rproc {
 	bool recovery_disabled;
 	int max_notifyid;
 	struct resource_table *table_ptr;
+	struct resource_table *clean_table;
 	struct resource_table *cached_table;
 	size_t table_sz;
 	bool has_iommu;
-- 
2.25.1

