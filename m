Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A466C4321A
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 16:26:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 155F764F80
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 16:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232771AbhCLQZh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 12 Mar 2021 11:25:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232466AbhCLQZI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 12 Mar 2021 11:25:08 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7108C061761
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Mar 2021 08:25:08 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id o38so16186082pgm.9
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Mar 2021 08:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R0TXzfTF++XcnwzyZM9Oeax7CL4rb6/mdtuV8iWH+MI=;
        b=Qc2yYkrxTGTq5jVFrq2PfpRWsvsAW6N4IX9Itic0y/cteOq/6udH2YGhsVaENOr8mG
         4fH+eVpLyJjPrgd7NFFXC7hRWQkA0iTMSiBV557nUE2bMf7QFJz4K8Y7Nt4SQ0i6+KzM
         v4tF5lFD1646ow5RKJfFeE0aVMTelQeKH4+bWomE8I6Dcp4ji9dn0e4rtel2PxmafN6r
         92OVZheg8uCy/v7VFDFQU1GG4c8249faYwV4U/c/cPbFx1Oqjw4e9Y+JhmMYIWRNcnIU
         Dxu6ze37qA9a6f3p/ZcLMMyLqwblWh+7oAYRdBCLwAC5SPUaJh6neZrVNIFZsDeCK8Oh
         bhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R0TXzfTF++XcnwzyZM9Oeax7CL4rb6/mdtuV8iWH+MI=;
        b=jmzReEEfOByf30o4LO+PwpOC7oMtckdPp0/RwdMs2qsD9ggH0KsYwUVdtxfFF8PaK0
         vn0MB2v44riTlSi1dlZ6kBzEGyBbjsp3MXlv7Ztk4RVV6oQ1XpBLT8bO15hqHFmjh//r
         YG5h5kOfgnhmo7cOPFbwrVOys+hTYWeUdoBMSuke+3SSYJ1CJiU7UMtnwGfjzLbpqFNk
         TcJjAtKxKJKbpbAxk76YJEe2oZC1RzWL14o3spFyOAEH30laOecUeU5imqo96tHtUeUW
         uFbx+LLTkRHuhz7K1dfNlX2EYo47M7UvX1hMt9gOBmDF8ZqzH5me/LgoOlKerTZQA80g
         bl1g==
X-Gm-Message-State: AOAM533VSgYgyqLQ7WADNcKCtpdAEJ75YiCYpcXoqG5Dp25RhP3YnLuU
        gXEYnyrzsqLRvyWlwMZohOir2A==
X-Google-Smtp-Source: ABdhPJwSfjAfXthMtfRPRHzlVt7WIFpKu5atR2lmyp0jiUhQQ3UI0Wh1HVqotOCWI0jvj6JWFZJP0Q==
X-Received: by 2002:a63:4241:: with SMTP id p62mr12359250pga.453.1615566307948;
        Fri, 12 Mar 2021 08:25:07 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e8sm5899599pgb.35.2021.03.12.08.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 08:25:07 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 11/17] remoteproc: Properly deal with the resource table when detaching
Date:   Fri, 12 Mar 2021 09:24:47 -0700
Message-Id: <20210312162453.1234145-12-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312162453.1234145-1-mathieu.poirier@linaro.org>
References: <20210312162453.1234145-1-mathieu.poirier@linaro.org>
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
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
New for V8:
  - Checking return code for error in __rproc_datch(). 
---
 drivers/remoteproc/remoteproc_core.c | 82 ++++++++++++++++++++++++++++
 include/linux/remoteproc.h           |  3 +
 2 files changed, 85 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 5eaa47c3ba92..0f151dbcdc36 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1556,6 +1556,24 @@ static int rproc_set_rsc_table(struct rproc *rproc)
 		return ret;
 	}
 
+	/*
+	 * If it is possible to detach the remote processor, keep an untouched
+	 * copy of the resource table.  That way we can start fresh again when
+	 * the remote processor is re-attached, that is:
+	 *
+	 *      DETACHED -> ATTACHED -> DETACHED -> ATTACHED
+	 *
+	 * Free'd in rproc_reset_rsc_table_on_detach() and
+	 * rproc_reset_rsc_table_on_stop().
+	 */
+	if (rproc->ops->detach) {
+		rproc->clean_table = kmemdup(table_ptr, table_sz, GFP_KERNEL);
+		if (!rproc->clean_table)
+			return -ENOMEM;
+	} else {
+		rproc->clean_table = NULL;
+	}
+
 	rproc->cached_table = NULL;
 	rproc->table_ptr = table_ptr;
 	rproc->table_sz = table_sz;
@@ -1563,6 +1581,59 @@ static int rproc_set_rsc_table(struct rproc *rproc)
 	return 0;
 }
 
+static int rproc_reset_rsc_table_on_detach(struct rproc *rproc)
+{
+	struct resource_table *table_ptr;
+
+	/* A resource table was never retrieved, nothing to do here */
+	if (!rproc->table_ptr)
+		return 0;
+
+	/*
+	 * If we made it to this point a clean_table _must_ have been
+	 * allocated in rproc_set_rsc_table().  If one isn't present
+	 * something went really wrong and we must complain.
+	 */
+	if (WARN_ON(!rproc->clean_table))
+		return -EINVAL;
+
+	/* Remember where the external entity installed the resource table */
+	table_ptr = rproc->table_ptr;
+
+	/*
+	 * If we made it here the remote processor was started by another
+	 * entity and a cache table doesn't exist.  As such make a copy of
+	 * the resource table currently used by the remote processor and
+	 * use that for the rest of the shutdown process.  The memory
+	 * allocated here is free'd in rproc_detach().
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
+	 * rproc_set_rsc_table().
+	 */
+	kfree(rproc->clean_table);
+
+	return 0;
+}
+
 /*
  * Attach to remote processor - similar to rproc_fw_boot() but without
  * the steps that deal with the firmware image.
@@ -1721,6 +1792,14 @@ static int __rproc_detach(struct rproc *rproc)
 	/* Stop any subdevices for the remote processor */
 	rproc_stop_subdevices(rproc, false);
 
+	/* the installed resource table is no longer accessible */
+	ret = rproc_reset_rsc_table_on_detach(rproc);
+	if (ret) {
+		dev_err(dev, "can't reset resource table: %d\n", ret);
+		return ret;
+	}
+
+
 	/* Tell the remote processor the core isn't available anymore */
 	ret = rproc->ops->detach(rproc);
 	if (ret) {
@@ -1997,6 +2076,9 @@ int rproc_detach(struct rproc *rproc)
 
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

