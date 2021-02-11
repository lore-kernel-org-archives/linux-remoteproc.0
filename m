Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FAB4C433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:50:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2F9264E44
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:50:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbhBKXuV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Feb 2021 18:50:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbhBKXtO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Feb 2021 18:49:14 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A7DEC061D7C
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:41 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id cl8so4376001pjb.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j+pNLbToLgdx106AOvWt9gZCfAGYBlkdberppemoXB8=;
        b=PgBkrZ6S9QNd1c222EuU5tDZ/KFOvbSt54l9FrE03eoiKhAFyfbxglppQkIBdDQ+sh
         cMGQmIG4Gd6H/PXQnTSw1HXhQk6OlJqooOE8viz0zLSvon8hPRcXfeSj/j8yPya+uv61
         +ZFHiWIwnRAnVG9mb/W0n2PuvyXZCD6tuMbpkhKCn+E/cBdgifw7+q66Hvy9HBTc6WFs
         Oc2M6h65eY7SN64Lb9ckO/4O2AqlemuqbJFTDIc9SlCc3M/QmGLIKWE0ACrt98vgpgiU
         SucdRGHwGC01TXNDppm6UEwQ/Kn8exbpEbsDOEdvHEhb7jSojnKYG6GezIk/9UQQfMGQ
         RgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j+pNLbToLgdx106AOvWt9gZCfAGYBlkdberppemoXB8=;
        b=g0Vr4czV69Y8HOGU+zmJrI1qqG34zOCepxVe1CFofDuVCYc/bSIc6g2OrsetIhJ2Mq
         CZKe14L0gggkTq64ePfMFLPhyQysXYHAm0PVZz6KJ6drIqLiag2yqdfmCwsDgzhxfGgH
         6cuMhn4sKwkImk5Kpd8FknJ73ky+IX6WAPfgZb5/Vg4rJ/6s+pnMvADF4L/cgDmMxOke
         HTk8XyBNFlk/Z5oWuUXnFtPPAIpefvEJ1cymL0rLThvjbs0YmeKlwVdFavm+uf2asVGK
         QhrqYbwmb3MolH6XRgCdqO5PzHzzFwuAGxOEWH8665eYhngLUp1NOTpPOLPyoKfDQ+2u
         4rPw==
X-Gm-Message-State: AOAM5307Remo1s7FRdWA+yeCrU8eqsOpoIIKx4S+Lx7Nv+Y49RiPl3Uo
        VyL8X2Dez+JzQM+BdiotZFChBw==
X-Google-Smtp-Source: ABdhPJyhSi+z3EpOLSBmKwtGZw5dqA3dXiU4Q1bIc7n6wom7HDxq1R9g+7X35d+c01Rw2UBwvcw9Fw==
X-Received: by 2002:a17:902:8d95:b029:e2:c956:f085 with SMTP id v21-20020a1709028d95b02900e2c956f085mr271805plo.35.1613087200695;
        Thu, 11 Feb 2021 15:46:40 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id iq6sm5932740pjb.6.2021.02.11.15.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 15:46:40 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 12/19] remoteproc: Introduce function rproc_detach()
Date:   Thu, 11 Feb 2021 16:46:20 -0700
Message-Id: <20210211234627.2669674-13-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
References: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
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
New for V5:
- Fixed comment about rproc_actuate() that no longer exists.
- Added call to rproc_unprepare_device() to balance rproc_prepare_device() in
  function rproc_attach().
- Removed RB from Peng and Arnaud because of the above.
---
 drivers/remoteproc/remoteproc_core.c | 66 +++++++++++++++++++++++++++-
 include/linux/remoteproc.h           |  1 +
 2 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index b150138542d4..660dcc002ff6 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1712,7 +1712,7 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 /*
  * __rproc_detach(): Does the opposite of __rproc_attach()
  */
-static int __maybe_unused __rproc_detach(struct rproc *rproc)
+static int __rproc_detach(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
 	int ret;
@@ -1954,6 +1954,70 @@ void rproc_shutdown(struct rproc *rproc)
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
+	/* release HW resources if needed */
+	rproc_unprepare_device(rproc);
+
+	rproc_disable_iommu(rproc);
+
+	/* Follow the same sequence as in rproc_shutdown() */
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

