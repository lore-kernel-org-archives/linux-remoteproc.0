Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E08C433E9
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 23:45:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE21564DAF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 23:45:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233837AbhBWXmt (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Feb 2021 18:42:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233405AbhBWXim (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Feb 2021 18:38:42 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C35EC0617AA
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:22 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id n10so210903pgl.10
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FhTtWZ2doNdRzGDtmgu+jcX3oUvQ8f/zyG4h5bfvKfU=;
        b=oJCAZRog6hxBAFJw2zpiSM+UvYVpBhl6yqgyqt6dOItsdVpAy+Kv4v+nUBfcqbhALd
         VMm/uz8Iy9pICeudHEluanUam5NITXMiefOGc3QRfPNVfhpnFaPzNQqTx3gpxnUaiS6G
         zvWacl8Eb4rVT70iE12VJbCZQYd5TK+ydLD2YedIWDxaidsX+FvkzYaLjpFouHXBTuoZ
         Xr6o4zkgDgTUpS9yJmNJ/YHc2kraD5PorZUunMLmdALlvGkSSZczpvfcWwiA1A1bF1RN
         VUhPRCQrQ/S4rHt/Xq/kbSelkCh9/sGshD9zH2fFle3YMvWlBg6F0vQFeA+4YLvrIiP6
         nXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FhTtWZ2doNdRzGDtmgu+jcX3oUvQ8f/zyG4h5bfvKfU=;
        b=ewRkrlEzi9Rty6xYJkoPHyDXeBQd5BfQUDxwgV4UEF9Pp6fJ6FP5q6xw8aC16rezEF
         8eNmICE7/enjtKSVsNDOy5008cb8d+aOIN9Dtq4G0ZOBcUViquTtuE848PJ7wdwLgWdG
         dstx+uQhiqomyDa1QsuTd81mIP4QmxwqP4Lt68Hd2l9Cu8eHN5HxJklLWYkD6sD9ibMR
         QD1N6XXkkNKgchqfljdfnZZHxNuWTkDGQkevoaPG0+XMojoWVey9pnnGxHKfvSdqNDPs
         C5kqML9JyYNhpesZSlJ5+AO53KZoqw7hmmBBV5qXl3vet+wRtTG5AAs6FMHPQl0cKrqN
         EkRg==
X-Gm-Message-State: AOAM530N/Bcd09elmCLiBrOXlJM8YYhyHV35Coue5Fx/U02Mqpm1qPcw
        FD0+j1EbETv/8Lqm/4PueV4FzA==
X-Google-Smtp-Source: ABdhPJyyk1a9A4dF+jF++NTAGKcmDAEFkg+LKnFi+FHWIYuXkBFjIHVrtAUNNc+tQhYddkk/W8JbJg==
X-Received: by 2002:a62:83ca:0:b029:1ed:78d1:531a with SMTP id h193-20020a6283ca0000b02901ed78d1531amr15767699pfe.56.1614123322159;
        Tue, 23 Feb 2021 15:35:22 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c24sm311999pfd.11.2021.02.23.15.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 15:35:21 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 05/16] remoteproc: Add new get_loaded_rsc_table() to rproc_ops
Date:   Tue, 23 Feb 2021 16:35:04 -0700
Message-Id: <20210223233515.3468677-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
References: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a new get_loaded_rsc_table() operation in order to support
scenarios where the remoteproc core has booted a remote processor
and detaches from it.  When re-attaching to the remote processor,
the core needs to know where the resource table has been placed
in memory.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
New for V6:
- Don't return an error if a resource table doesn't exist.
---

 drivers/remoteproc/remoteproc_core.c     | 32 ++++++++++++++++++++++++
 drivers/remoteproc/remoteproc_internal.h | 10 ++++++++
 include/linux/remoteproc.h               |  6 ++++-
 3 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 8c7e9f1d50d7..0012b7bdce24 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1537,6 +1537,32 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
+static int rproc_set_loaded_rsc_table(struct rproc *rproc)
+{
+	struct resource_table *table_ptr;
+	struct device *dev = &rproc->dev;
+	size_t table_sz;
+	int ret;
+
+	table_ptr = rproc_get_loaded_rsc_table(rproc, &table_sz);
+	if (!table_ptr) {
+		/* Not having a resource table is acceptable */
+		return 0;
+	}
+
+	if (IS_ERR(table_ptr)) {
+		ret = PTR_ERR(table_ptr);
+		dev_err(dev, "can't load resource table: %d\n", ret);
+		return ret;
+	}
+
+	rproc->cached_table = NULL;
+	rproc->table_ptr = table_ptr;
+	rproc->table_sz = table_sz;
+
+	return 0;
+}
+
 /*
  * Attach to remote processor - similar to rproc_fw_boot() but without
  * the steps that deal with the firmware image.
@@ -1556,6 +1582,12 @@ static int rproc_attach(struct rproc *rproc)
 		return ret;
 	}
 
+	ret = rproc_set_loaded_rsc_table(rproc);
+	if (ret) {
+		dev_err(dev, "can't load resource table: %d\n", ret);
+		goto disable_iommu;
+	}
+
 	/* reset max_notifyid */
 	rproc->max_notifyid = -1;
 
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index c34002888d2c..4f73aac7e60d 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -177,6 +177,16 @@ struct resource_table *rproc_find_loaded_rsc_table(struct rproc *rproc,
 	return NULL;
 }
 
+static inline
+struct resource_table *rproc_get_loaded_rsc_table(struct rproc *rproc,
+						  size_t *size)
+{
+	if (rproc->ops->get_loaded_rsc_table)
+		return rproc->ops->get_loaded_rsc_table(rproc, size);
+
+	return NULL;
+}
+
 static inline
 bool rproc_u64_fit_in_size_t(u64 val)
 {
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 6b0a0ed30a03..51538a7d120d 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -368,7 +368,9 @@ enum rsc_handling_status {
  * RSC_HANDLED if resource was handled, RSC_IGNORED if not handled and a
  * negative value on error
  * @load_rsc_table:	load resource table from firmware image
- * @find_loaded_rsc_table: find the loaded resouce table
+ * @find_loaded_rsc_table: find the loaded resource table from firmware image
+ * @get_loaded_rsc_table: get resource table installed in memory
+ *			  by external entity
  * @load:		load firmware to memory, where the remote processor
  *			expects to find it
  * @sanity_check:	sanity check the fw image
@@ -390,6 +392,8 @@ struct rproc_ops {
 			  int offset, int avail);
 	struct resource_table *(*find_loaded_rsc_table)(
 				struct rproc *rproc, const struct firmware *fw);
+	struct resource_table *(*get_loaded_rsc_table)(
+				struct rproc *rproc, size_t *size);
 	int (*load)(struct rproc *rproc, const struct firmware *fw);
 	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
 	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
-- 
2.25.1

