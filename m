Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A70C43381
	for <linux-remoteproc@archiver.kernel.org>; Wed, 24 Feb 2021 00:08:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4EBB764ED1
	for <linux-remoteproc@archiver.kernel.org>; Wed, 24 Feb 2021 00:08:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234100AbhBXABt (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Feb 2021 19:01:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234246AbhBWXuS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Feb 2021 18:50:18 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2128DC0611C3
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:31 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id t11so217480pgu.8
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gj6WF/1oKuVocPkZDr0q35lcZZqhgtjB+hq21nBtWDQ=;
        b=ZkrwA5l6fGRzXKbDLnTP+sAznOgBEqIPSOLtIN2KgJHSPZ4BwfMkB2e9ZC5lzjMPlF
         X/ULwxMUqbVeIGtBxZGIYYv9szkBJOOiuq+735KJ9sCtMvU8T13XtbLE0Og6I5tbgj77
         du0CWnXdaILg/8qmH2LNjdphquJqoWGTSntiXlVed65w8Xt6zRZAELKPgPerQ4HnREsQ
         TDwR3jH7jKHcVSB8CQYrLky9GENdJf8sFbNo6gw8Pk84QyUuKX695nXeotPEtNPIYbhZ
         oK5mHP6Kjql5B/l+VyZDtSGxn0pGHDi7wkN4lxO/lWrQDVoGWOWZ6o+gwxFNmxJvQG5R
         feng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gj6WF/1oKuVocPkZDr0q35lcZZqhgtjB+hq21nBtWDQ=;
        b=E73K3mXH8eXOQRhNlZwSJY/70d661Sa6oIUs32NhYvn0Td5GO8/C/qXk9bW51GMFxO
         Zrs3fhd12ta748eYk4aNXqmr7I0LtyiO0oyZJeTZuT9o5+tlSpnf8gewP4BSJGQKXedf
         yPJj4peE+kG04HhKPF+wlYiYq6VxUFZbW+JNXFtRht360q5fkw7yPe9uCzv4Ryg3t+2g
         qN3hnct/W+lqCwGb4CmxkQqSG+hCdEadHAjPneB3mBR9JuXLMMrdga7ASP8bnEzAet7L
         0ZDlj3k+FjhSbexrlZAitmbh3nXKxvBsP7hfDlL4SECxKUbCxANFCAVv28raqRakBxOG
         LLYQ==
X-Gm-Message-State: AOAM532JOZKZoebowKNdiOm69Uo2GWFRnWQzouiBJWwno1mufEyQ/pTW
        PDc+/3HdOvKa+LqB2tYGsCOemQ==
X-Google-Smtp-Source: ABdhPJxifZVF0IEfjvNgnYfuzrC/lhgLJk67zzdhvo7k9W8T3W4tzIDFjIAhgw6I2UHWX1oqa300pw==
X-Received: by 2002:a63:ce4d:: with SMTP id r13mr25383523pgi.204.1614123330723;
        Tue, 23 Feb 2021 15:35:30 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c24sm311999pfd.11.2021.02.23.15.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 15:35:30 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 13/16] remoteproc: Properly deal with a start request when attached
Date:   Tue, 23 Feb 2021 16:35:12 -0700
Message-Id: <20210223233515.3468677-14-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
References: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
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

