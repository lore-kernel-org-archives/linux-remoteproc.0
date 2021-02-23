Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71630C433DB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 23:47:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36F5464DDC
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 23:47:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233897AbhBWXqn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Feb 2021 18:46:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233818AbhBWXkR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Feb 2021 18:40:17 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 562CDC061224
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:28 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id c11so38400pfp.10
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GF5EQHFlmp0+qmUZul6iVpKZ4h0RkwOCQenPoUGAdoc=;
        b=JXFzabmRKJ8V0T+o9nOAxWVsuMgdr+B8uaPJVlbvmPmcxc8D6urjBQYMXSW2PwklpB
         bLKPh91Z/GF+3TG31+OpZ+cASxREnq6WnPHRCUV1ycXtwqyrWBImOtrXS5ynLbt2vBsM
         HOPj48ofMMoFkxHSPjERWm8vGjs97SXvNzKBva13fVqzcrx6emz4c9e9nOxtvyKkXbDn
         UI/EXGCm5L3V/ZnYJZvvjUVSgdUy99W4qBIzXOCwMgryXYPjgb5oUt/IiRB3+74VMUMg
         SkY0NYoGrq1zLG0Y9ooK6VlJMJD4YkNiMgngT0hXE5T8g+hR9wjGZsWWCI8fFSqOAkNe
         ansg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GF5EQHFlmp0+qmUZul6iVpKZ4h0RkwOCQenPoUGAdoc=;
        b=NXTCo7MuaGORvdUe5Q8k6D/mK808jZhd8difz0Xak88wrCuI/A2Dd9o1HKaM8Kx8Jp
         cIkg8c1CzqL6oeMN5budz5xtEYxCcCTu7atFjBeUutgbTvCVDLjz218QZHPpzoXQIgCR
         7VW737M1/+S4C6qY0zuzgGr6rf2F19cWw8bAbHZVTFqn4J27Q1cIIzgJasF5g5S5tMI0
         KZAicyCtNXUmVvfUS+HaSLGWOgVITZq+Y1lL5CmbZWmBihzqqX6G3Ckj2ZD6onNSWYML
         9FxTDRJC/2Ex56u07qEDqkY/HIMJYPEgxDJmO4zsSeX//WVk6jq8IUtZTlPZqE0J7/iy
         8UzQ==
X-Gm-Message-State: AOAM533JFweLSymEjbafWTHckLtVu0z4aXWOvze6MD81i+FvhOKyDQiO
        SV3Ejp1qprGDuj62vKMjwggrLg==
X-Google-Smtp-Source: ABdhPJz42IAXFy40S62cYn6Imjzfoc1xcaOkTJIhpRstco5Pcq5ISsfYuxsdM4Ul6ZKyAulxaa/GhA==
X-Received: by 2002:a65:6205:: with SMTP id d5mr4569749pgv.40.1614123327949;
        Tue, 23 Feb 2021 15:35:27 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c24sm311999pfd.11.2021.02.23.15.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 15:35:27 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 10/16] remoteproc: Introduce function rproc_detach()
Date:   Tue, 23 Feb 2021 16:35:09 -0700
Message-Id: <20210223233515.3468677-11-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
References: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce function rproc_detach() to enable the remoteproc
core to release the resources associated with a remote processor
without stopping its operation.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
New for V6:
- Checking for rproc->state has been removed.  They have been moved to
  calling functions.
- Freeing the cache table has been moved to the next patch, i.e 11/16.
---

 drivers/remoteproc/remoteproc_core.c | 58 +++++++++++++++++++++++++++-
 include/linux/remoteproc.h           |  1 +
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 0f680b7ff8f1..fc01b29290a6 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1709,7 +1709,7 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 /*
  * __rproc_detach(): Does the opposite of __rproc_attach()
  */
-static int __maybe_unused __rproc_detach(struct rproc *rproc)
+static int __rproc_detach(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
 	int ret;
@@ -1948,6 +1948,62 @@ void rproc_shutdown(struct rproc *rproc)
 }
 EXPORT_SYMBOL(rproc_shutdown);
 
+/**
+ * rproc_detach() - Detach the remote processor from the
+ * remoteproc core
+ *
+ * @rproc: the remote processor
+ *
+ * Detach a remote processor (previously attached to with rproc_attach()).
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
+	/* if the remote proc is still needed, bail out */
+	if (!atomic_dec_and_test(&rproc->power)) {
+		ret = 0;
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
+	/* release HW resources if needed */
+	rproc_unprepare_device(rproc);
+
+	rproc_disable_iommu(rproc);
+
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
index eff55ec72e80..e1c843c19cc6 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -662,6 +662,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
 
 int rproc_boot(struct rproc *rproc);
 void rproc_shutdown(struct rproc *rproc);
+int rproc_detach(struct rproc *rproc);
 int rproc_set_firmware(struct rproc *rproc, const char *fw_name);
 void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
 void rproc_coredump_using_sections(struct rproc *rproc);
-- 
2.25.1

