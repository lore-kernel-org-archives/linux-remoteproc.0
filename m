Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B7EC4361A
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 16:26:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1311D65046
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 16:26:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232795AbhCLQZi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 12 Mar 2021 11:25:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232741AbhCLQZM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 12 Mar 2021 11:25:12 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD8D2C061574
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Mar 2021 08:25:11 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id 16so2202233pfn.5
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Mar 2021 08:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gj6WF/1oKuVocPkZDr0q35lcZZqhgtjB+hq21nBtWDQ=;
        b=gtz428PBLEgDloxKNuUGPr92ilupj59j2EfFWY0/N6WmAnATRxpQJlW+J2ee8AQHav
         xfm/Xf2HxlRVeNugLHL+U4NK/rWK5UJwdN7EfSosWKr3Zt4TBkWgoN5gxNkvHYyl37ew
         wTLuoegWNmHdbT1yapt1sRmrpbJFDYR80XDVQgf9zEXVpRYxrykMcKshqEyybiNI1g/+
         jIPrVankCXpF2yQKIzgKc3SRrrvlTrz2bdl5FITvFh/l09kH6c8OChMhbgTMBAroPgIq
         dRrowcFVCygaFx/jN2st9jMIN6PuKz34cElkxvTGRjMivbDKekwO6IJqP8vq2Scn2hAs
         yumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gj6WF/1oKuVocPkZDr0q35lcZZqhgtjB+hq21nBtWDQ=;
        b=cor3tXSOhE5ENI9bmMUU/JHDqkIk+/QlzuL3U1FFlcgk7maReJBHqPq/T0swOKkHjI
         hzWulHDDgPsdKWqGEuRzA79rM8Utl0R6sKokEhK5uW1fp1o7ezTeoIvOEQPEuREBU5Sj
         q1qQKrir9Q72dH6F2LScui3sByalQ7pLkcRnyc9esznddDyQnqh/DOYicSAt9PeQ9HWf
         9YyUzqoXhyOaHH56GkYqqvOO9QZ6b4YCsO6yRxlRGIcTZMPgqeX2/dEINOSHvJk133eZ
         jzOAZFPN4rEG+f2u5Ty2NZRQpXYeTtGCqY3eFDSMsQSwRbDhqyuYlmAkr67l8QYjObEB
         /rZQ==
X-Gm-Message-State: AOAM532T7TNS0IVYjyvtXM9kIbxAlw4UVMq0DCYMPyCjqMU1EoPZrgVu
        ZiiTiCpT40lzvy+jJbI3IJQNIQ==
X-Google-Smtp-Source: ABdhPJxGBgOg4XUMLZgE8bHRgl/Ot16rbp7CVs6Kqzly1An+KF889/k2eE5hVl0egydVPzDpTey4aQ==
X-Received: by 2002:a63:135e:: with SMTP id 30mr12705562pgt.6.1615566311426;
        Fri, 12 Mar 2021 08:25:11 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e8sm5899599pgb.35.2021.03.12.08.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 08:25:11 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 14/17] remoteproc: Properly deal with a start request when attached
Date:   Fri, 12 Mar 2021 09:24:50 -0700
Message-Id: <20210312162453.1234145-15-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312162453.1234145-1-mathieu.poirier@linaro.org>
References: <20210312162453.1234145-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch takes into account scenarios where a remote processor
has been attached to when receiving a "start" command from sysfs.

As with the case with the running state, the command can't be
carried out if the remote processor is already in operation.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_cdev.c  | 3 ++-
 drivers/remoteproc/remoteproc_sysfs.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
index b19ea3057bde..b2cee9afb41b 100644
--- a/drivers/remoteproc/remoteproc_cdev.c
+++ b/drivers/remoteproc/remoteproc_cdev.c
@@ -32,7 +32,8 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
 		return -EFAULT;
 
 	if (!strncmp(cmd, "start", len)) {
-		if (rproc->state == RPROC_RUNNING)
+		if (rproc->state == RPROC_RUNNING ||
+		    rproc->state == RPROC_ATTACHED)
 			return -EBUSY;
 
 		ret = rproc_boot(rproc);
diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index f9694def9b54..66801e6fe5cd 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -194,7 +194,8 @@ static ssize_t state_store(struct device *dev,
 	int ret = 0;
 
 	if (sysfs_streq(buf, "start")) {
-		if (rproc->state == RPROC_RUNNING)
+		if (rproc->state == RPROC_RUNNING ||
+		    rproc->state == RPROC_ATTACHED)
 			return -EBUSY;
 
 		ret = rproc_boot(rproc);
-- 
2.25.1

