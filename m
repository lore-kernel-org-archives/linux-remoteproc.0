Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F354C83017
	for <linux-remoteproc@archiver.kernel.org>; Thu, 26 Nov 2020 21:07:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E68F1221FF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 26 Nov 2020 21:07:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fbTz3I/q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391585AbgKZVG7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 26 Nov 2020 16:06:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391571AbgKZVGz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 26 Nov 2020 16:06:55 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4044CC061A51
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2020 13:06:55 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id t3so2558484pgi.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2020 13:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x8XMWKfae4q09gjVQz0Vnlnpd49+WO7LGPeK5Mj05BA=;
        b=fbTz3I/qpwcxvV52RAsvvLQQZevOtz9VhXW25EGHAOpzNMCjFuwxo76I1WTc8+7aML
         a/oorM43+BNCWnb/wtw2r9o8FVs7pZL7uEEkFHvBvCL49EDkZGGoKSE5M5CiIsl1+Ard
         M/38ct3v15xJiLINM4Ay1w7igT92vnulFhqMbVc/cYUAC2y4W6P6Qw6Jg41idknkE2xM
         verAPI56HY8tcgdeMQTYps4WSuIlJ+QSgB59Ucg/tvuvyGyaXji8qhjeHZsJHdN0R+9L
         pEoKMN618zBApBbdfnmOSh4WMTaH6sKUN9Y2MQSiUAtjNX5po7hHxZLS+RNoYgKB0McK
         Uldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x8XMWKfae4q09gjVQz0Vnlnpd49+WO7LGPeK5Mj05BA=;
        b=N1U8nXjZOC0ZurYXCXhO8VHoKw7UU2IOk2viCiLD3O2n5Yjv95Nc2+ttqOt4t2TzFa
         j5wQ8pma07KoPbwgj2TwHsJc3uTwVMrZWRCEPSnQnOlOICptZOl7zw7040kALu2lnjJ3
         T/sPcGBYRFIpIuq8PWCfkfqoyZZbPITrbCmQoFBy8YazhsbMoFHx8q8vzLfJy9IhSh8y
         aR7pIXBwfadEZl+Od2xFYusI8XGGITooQbXAFMjCQr8mqwqTHDzudmEsMH2za1NjKEYe
         mkgB9NvjnIafHB2AYEykDoGgBi9QQE0fgqXI4DYOKDff2ydZudPtqBU6MK4vDOP65xmw
         KPPA==
X-Gm-Message-State: AOAM5321Fy4ssUVcQVM8dkkrWBRjRBGt0h2d8Rd0RiTPm3uj/0PoNa0W
        d0pcRe75Gz7n2mkCOFypp5bZtQ==
X-Google-Smtp-Source: ABdhPJwGUuAbOIzOOO6caRziz/LNMDGyQXSMWsKQ4a+/0WeKqn/59Q21S5oQRoIAY2+CWy4ggwSnoA==
X-Received: by 2002:a17:90b:ec7:: with SMTP id gz7mr266535pjb.210.1606424814852;
        Thu, 26 Nov 2020 13:06:54 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c203sm5612676pfc.10.2020.11.26.13.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 13:06:54 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com
Subject: [PATCH v3 11/15] remoteproc: Add return value to function rproc_shutdown()
Date:   Thu, 26 Nov 2020 14:06:38 -0700
Message-Id: <20201126210642.897302-12-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126210642.897302-1-mathieu.poirier@linaro.org>
References: <20201126210642.897302-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a return value to function rproc_shutdown() in order to
properly deal with error conditions that may occur.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_core.c | 19 ++++++++++++++-----
 include/linux/remoteproc.h           |  2 +-
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index b54f60cc3cbd..51275107eb1f 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1869,7 +1869,7 @@ EXPORT_SYMBOL(rproc_boot);
  *   returns, and users can still use it with a subsequent rproc_boot(), if
  *   needed.
  */
-void rproc_shutdown(struct rproc *rproc)
+int rproc_shutdown(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
 	int ret;
@@ -1877,15 +1877,19 @@ void rproc_shutdown(struct rproc *rproc)
 	ret = mutex_lock_interruptible(&rproc->lock);
 	if (ret) {
 		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
-		return;
+		return ret;
 	}
 
-	if (rproc->state != RPROC_RUNNING)
+	if (rproc->state != RPROC_RUNNING) {
+		ret = -EPERM;
 		goto out;
+	}
 
 	/* if the remote proc is still needed, bail out */
-	if (!atomic_dec_and_test(&rproc->power))
+	if (!atomic_dec_and_test(&rproc->power)) {
+		ret = -EBUSY;
 		goto out;
+	}
 
 	ret = rproc_stop(rproc, false);
 	if (ret) {
@@ -1897,7 +1901,11 @@ void rproc_shutdown(struct rproc *rproc)
 	rproc_resource_cleanup(rproc);
 
 	/* release HW resources if needed */
-	rproc_unprepare_device(rproc);
+	ret = rproc_unprepare_device(rproc);
+	if (ret) {
+		atomic_inc(&rproc->power);
+		goto out;
+	}
 
 	rproc_disable_iommu(rproc);
 
@@ -1907,6 +1915,7 @@ void rproc_shutdown(struct rproc *rproc)
 	rproc->table_ptr = NULL;
 out:
 	mutex_unlock(&rproc->lock);
+	return ret;
 }
 EXPORT_SYMBOL(rproc_shutdown);
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 329c1c071dcf..02312096d59f 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -655,7 +655,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
 			     u32 da, const char *name, ...);
 
 int rproc_boot(struct rproc *rproc);
-void rproc_shutdown(struct rproc *rproc);
+int rproc_shutdown(struct rproc *rproc);
 int rproc_detach(struct rproc *rproc);
 int rproc_set_firmware(struct rproc *rproc, const char *fw_name);
 void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
-- 
2.25.1

