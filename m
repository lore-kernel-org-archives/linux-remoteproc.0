Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DE1C64E7A
	for <linux-remoteproc@archiver.kernel.org>; Thu, 26 Nov 2020 21:07:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73D3A21D93
	for <linux-remoteproc@archiver.kernel.org>; Thu, 26 Nov 2020 21:07:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pBsQ3pXn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391757AbgKZVHL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 26 Nov 2020 16:07:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391641AbgKZVG6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 26 Nov 2020 16:06:58 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77426C061A48
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2020 13:06:58 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id l17so2597170pgk.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2020 13:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BZKEoNhgpUCxk0BJFPhN8SyKdDsMxIN4bfJcnaCrMrQ=;
        b=pBsQ3pXncC41Q83qq1u3ofxVdrDRk/6O4wPSti+nnYcmiF/ZOJ+H5vqGvPmxtPWizc
         8y3XwipOESsOriEGeSxOxbflSMQm4o+Zmj2Tk14XtK/OJ7+4S3LV6hNbruVNDcsVejL0
         3I5CJZZVpoIcl5kia7yH3D5fKKpBOVfAHD5gSGFglaYzgTr6wT+ol0kdNyBvyKzWULPA
         1zRpvcdUbIxHbgCWet60vwfVRlsnB0mCIl9fX6QZcSxbDEg2EytQI9J75p2Sg4/y79NQ
         fmRGRnv6MkGS1+KhY6nNhQJVg5BiNov4S0XYjDOjoH/haen8AIlWClVRPfxi/mft/PB+
         GKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BZKEoNhgpUCxk0BJFPhN8SyKdDsMxIN4bfJcnaCrMrQ=;
        b=DDtJ/y009FxnDv5sFbNXCppzugkth3/ocA3Zi3ER5HEF3mLcPkkfIeQeNMF5P68LDo
         RSFJxstYt44pwEm+H/WP4TuN7JE06Euiiq5HcozSjJEpES0yYSF32NKqdSlLq/ntQaGW
         oTtEZz3AeOC1hXZtNDbRiOYEufRImIlDPdM7OMa6KPsYZqCnPt7IpaY03keXl4t1Hk8u
         NXwmJUqQ49p2xk8JceV8pKSV+Y/MoeZiojQpk3GQDjjM3wcxCY+CIbK5xQZW0s86xNAk
         Q/fdST4MflnSQX04S29OrS0kGf/oEHZ/ATDWQCvxcZnOewsK4/MqenBWI1rjgoAiLUdx
         lJZQ==
X-Gm-Message-State: AOAM5337Xm0vDNsONvjDbp08iOtFshMVOZxbae5jDhrLVPTLcjcH6H3g
        330fGCsjjQ1A7IfTXIL6g+/BRg==
X-Google-Smtp-Source: ABdhPJx3to5KO+RDOFbdZsmC8iWcc6Tc9rvKooHi7wvnqs33TJvUOiEWWcUokQuvgrRVA0RKL78vtA==
X-Received: by 2002:a62:fc4a:0:b029:19a:ad58:b015 with SMTP id e71-20020a62fc4a0000b029019aad58b015mr1116046pfh.77.1606424818052;
        Thu, 26 Nov 2020 13:06:58 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c203sm5612676pfc.10.2020.11.26.13.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 13:06:57 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com
Subject: [PATCH v3 14/15] remoteproc: Properly deal with detach request
Date:   Thu, 26 Nov 2020 14:06:41 -0700
Message-Id: <20201126210642.897302-15-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126210642.897302-1-mathieu.poirier@linaro.org>
References: <20201126210642.897302-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch introduces the capability to detach a remote processor
that has been attached to or booted by the remoteproc core.  For
that to happen a rproc::ops::detach() operation need to be
available.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_cdev.c  | 6 ++++++
 drivers/remoteproc/remoteproc_sysfs.c | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
index 61541bc7d26c..f7645f289563 100644
--- a/drivers/remoteproc/remoteproc_cdev.c
+++ b/drivers/remoteproc/remoteproc_cdev.c
@@ -43,6 +43,12 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
 			return -EINVAL;
 
 		ret = rproc_shutdown(rproc);
+	} else if (!strncmp(cmd, "detach", len)) {
+		if (rproc->state != RPROC_RUNNING &&
+		    rproc->state != RPROC_ATTACHED)
+			return -EINVAL;
+
+		ret = rproc_detach(rproc);
 	} else {
 		dev_err(&rproc->dev, "Unrecognized option\n");
 		ret = -EINVAL;
diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 7d281cfe3e03..5a239df5877e 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -207,6 +207,12 @@ static ssize_t state_store(struct device *dev,
 			return -EINVAL;
 
 		ret = rproc_shutdown(rproc);
+	} else if (sysfs_streq(buf, "detach")) {
+		if (rproc->state != RPROC_RUNNING &&
+		    rproc->state != RPROC_ATTACHED)
+			return -EINVAL;
+
+		ret = rproc_detach(rproc);
 	} else {
 		dev_err(&rproc->dev, "Unrecognised option: %s\n", buf);
 		ret = -EINVAL;
-- 
2.25.1

