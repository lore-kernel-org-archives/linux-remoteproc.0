Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0967C4361B
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Dec 2020 17:34:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F62D23B6B
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Dec 2020 17:34:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732799AbgLRReT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 18 Dec 2020 12:34:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732751AbgLRReS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 18 Dec 2020 12:34:18 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55598C061143
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Dec 2020 09:32:44 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id f14so1663864pju.4
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Dec 2020 09:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H4g2ghZevAZZMEldVnDmhvjfkN3XHebraEOrSS89kQg=;
        b=PiGtjane3hJdt4Yln3JhdBS07fwTZhgAKnMXQnHbOJg02WrEZY4pz3YJ6hr/Ztqkiw
         FsL0ZJomtWNko8fzcpuOOhFObhAwJMmucvfWrG32NYCh5SaQKS0jl2WOdtNykfh3LIsl
         gqj47HipepBxZM0Ahsq44RoEEdyquekivZtMsSTDX55neWf+4V0s3M4SmRAzJ/sLTf1a
         +bVuL+hPj0R0jQOWmWOqyiwk5iOBSJKJyvr47O6WdYhxY5lA9e8lSfLHOvklMPNAzivZ
         DEej6VIJ6XM3KakaIPcXrn7hN87taHfBENbmlBGkcmDJMlVdzOtS7dCfy82Wr53Ty6GX
         DI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H4g2ghZevAZZMEldVnDmhvjfkN3XHebraEOrSS89kQg=;
        b=cqrfjgtyb41agM0hJCSmBycaZWhlc7B9HnL2mP745jB2Wvg56EgE37ta293S+yBKPQ
         rCF79cL5+AnzQbK5odHkmJQ4D9Pw3akolVb9NYkZeoGaXaWHkgU+ZLNixHrG3iajOVZi
         2NTA3jIw2zqOPBwifkvZ5Vg7EVfohie9U5+V2VpiiQn6RXQ4hL6xfrTuOW997j7iCHqh
         be5GOxpH9KX+/bgXF7f/trX593eM0KM7y1uTmKOGItcaah0I1b8+mPJb1NEr2HbnYlK3
         O4kMOjMvhx1l/vNJBSTL5zKEMGL36g2XWO2kYxGs35mOiHrPY/eVFNEw6AO6LaF5B6AW
         VU/w==
X-Gm-Message-State: AOAM531aZUcB2mxTKqwQf615LBhlN/Zj0Vv6XrmT+ypWccmVFLXdjPvs
        v0X0+2yVWTzs3eTKJ8NRKoGoMg==
X-Google-Smtp-Source: ABdhPJxFlsdNpQczITSEa3R2bzJNrE8lUJjX1BO8NJEXHoY2yZi++2C8J1zqwuWx/8oENwP5aQEsVQ==
X-Received: by 2002:a17:90a:d790:: with SMTP id z16mr5371190pju.88.1608312763918;
        Fri, 18 Dec 2020 09:32:43 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id l11sm9892957pgt.79.2020.12.18.09.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 09:32:43 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     arnaud.pouliquen@st.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 12/17] remoteproc: Introduce function rproc_detach()
Date:   Fri, 18 Dec 2020 10:32:23 -0700
Message-Id: <20201218173228.2277032-13-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201218173228.2277032-1-mathieu.poirier@linaro.org>
References: <20201218173228.2277032-1-mathieu.poirier@linaro.org>
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
 drivers/remoteproc/remoteproc_core.c | 71 +++++++++++++++++++++++++++-
 include/linux/remoteproc.h           |  2 +
 2 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index e665ed4776c3..ece3f15070b9 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1673,7 +1673,7 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 /*
  * __rproc_detach(): Does the opposite of rproc_attach()
  */
-static int __maybe_unused __rproc_detach(struct rproc *rproc)
+static int __rproc_detach(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
 	int ret;
@@ -1927,6 +1927,75 @@ void rproc_shutdown(struct rproc *rproc)
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
+	 * If the remote processor was booted by the core the cached table needs
+	 * to be freed and ->table_ptr set to NULL because it will be
+	 * invalidated by rproc_resource_cleanup().  If the remote processor was
+	 * attached to ->cached_table is NULL and kfree() returns right away.
+	 *
+	 * In either case ->table_ptr has to be set to NULL.  It will be set
+	 * again when the remote processor is re-attached to.
+	 */
+	kfree(rproc->cached_table);
+	rproc->cached_table = NULL;
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
index 9bb34c3eb847..65ece6f177b7 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -659,6 +659,8 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
 
 int rproc_boot(struct rproc *rproc);
 void rproc_shutdown(struct rproc *rproc);
+int rproc_detach(struct rproc *rproc);
+int rproc_set_firmware(struct rproc *rproc, const char *fw_name);
 void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
 int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
 int rproc_coredump_add_custom_segment(struct rproc *rproc,
-- 
2.25.1

