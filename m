Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA77C433E6
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 16:26:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED73964F80
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 16:26:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231922AbhCLQZe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 12 Mar 2021 11:25:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232493AbhCLQZC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 12 Mar 2021 11:25:02 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA8D8C061763
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Mar 2021 08:25:02 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id x7-20020a17090a2b07b02900c0ea793940so10975853pjc.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Mar 2021 08:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kdHxs7JLHKePLMQLEfdUiVSo/tj85hv+zhe9KF+ZdIk=;
        b=l7LAZxN9TdM84y6XXmSm1YUoVCBEHA/A7MD8+YJVgECWfDXYoyUjw/BJMkp2K2hbE7
         jggP91z7N1uweUd6crM7s34B80FgnhpMHuROZ+CNPwUk/r7x42UQbj8WQJ/xFeZDyUmk
         29zdD2iK3QUkNBuBmIkrneNmmEUL48kFUca9e+lib02FLexcVDD5unHCTICOM2TlaSe9
         pNnfevgn94/uUM6rXqMJNUe5nPmpE7OLJF3W7qXzZpljPx/bF/WYFNQe7p9CnXOLnsRD
         2qPbdcT0lIh5pPSM1M/cOkeceXB/WQo9Ycn5g8NKa/pbKAKh9WT2ZpRJ2w7LKgPLMXoK
         eFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kdHxs7JLHKePLMQLEfdUiVSo/tj85hv+zhe9KF+ZdIk=;
        b=H3ZSd8/BR+Ugay5K/yduf5WdCIQ1ojOpww3IBDOcm+cHcquXACHq3rEoXHZjOB4LFz
         weYIhFDVcHWO9m4mmphTVaKrSvuIuLOhYWSUwdi0wBS8c9/Db3tuo0iLRneIvlAH3C2i
         WQhHAy/wRJN8epNKZ/+ZpmPuSpCecYIaPooFUspFE8be+ux1M86k6GgRvkGGUw1F++iQ
         dLT5XykmzKIAIsVehpOQmoVaVI8Vsze/ytZn99vkFmfp9wTnh83Pfeqrz1dbi7WnFxl9
         MoYvH7+/eBYZ5zeL8Kz0WT2cxTsbxq9lV1d4XAQuN+SeOkQgQhzZSQiuOvTbJkKbba/+
         jb3Q==
X-Gm-Message-State: AOAM531JvRXdGYLQo7JuRSPD/DD43J3DbUFPiaoyd4Wj9vpEbO48zEFu
        Ww4WxsSCb4bfu5IR9g6JYKla6A==
X-Google-Smtp-Source: ABdhPJwzIwsGCTHOunkv0cp96iuqqyuE9PCc+MYDxioKGcPZFRhCoV/IxRGWTzXDS8FwK7PnVBH8zQ==
X-Received: by 2002:a17:902:344:b029:e4:a7ab:2e55 with SMTP id 62-20020a1709020344b02900e4a7ab2e55mr14592293pld.63.1615566300733;
        Fri, 12 Mar 2021 08:25:00 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e8sm5899599pgb.35.2021.03.12.08.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 08:25:00 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 05/17] remoteproc: Add new get_loaded_rsc_table() to rproc_ops
Date:   Fri, 12 Mar 2021 09:24:41 -0700
Message-Id: <20210312162453.1234145-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312162453.1234145-1-mathieu.poirier@linaro.org>
References: <20210312162453.1234145-1-mathieu.poirier@linaro.org>
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
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c     | 32 ++++++++++++++++++++++++
 drivers/remoteproc/remoteproc_internal.h | 10 ++++++++
 include/linux/remoteproc.h               |  6 ++++-
 3 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 8c7e9f1d50d7..bf6f6d15b1c3 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1537,6 +1537,32 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
+static int rproc_set_rsc_table(struct rproc *rproc)
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
 
+	ret = rproc_set_rsc_table(rproc);
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

