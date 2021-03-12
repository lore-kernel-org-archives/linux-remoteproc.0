Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 651D0C433DB
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 16:26:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34DC66501D
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 16:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231849AbhCLQZj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 12 Mar 2021 11:25:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232757AbhCLQZP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 12 Mar 2021 11:25:15 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0C04C061762
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Mar 2021 08:25:13 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id y67so2208543pfb.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Mar 2021 08:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NN7h66rSqKzczqrKUwACdy1DE0E9dT7gEJY334oVOV4=;
        b=DoxVu73kjDBB6G+GqFJuZWjDsELYStjGVY6plUBqlVW8SEESXd4UJfYhxlcENxplnE
         1xJ85jHSD+DESiciZ/whQ0v9aVsTsCxif+CUVhw+6qZFG+jZR077sQ2MC6+yzs8jYm31
         ceCUx/8XDTX9SftcjKYiPXuiIVKRII7oLCTjseZm5RvRVH4ZjhMNt8pl4Jox7SvI5Szv
         VZl1Qd3JBAMUkeeVCDFmYTofk0/nZ9zoYFwvlg2AxNilu/b0S5DrSjpUHHDxYYL9SRO8
         ACKowoV+UgnPTI3nFETwbDA6ejSXNodP39T2sI31UwvblMk4PXFPZdssJYX+pYx8/oAg
         t7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NN7h66rSqKzczqrKUwACdy1DE0E9dT7gEJY334oVOV4=;
        b=orDtCwPzreiKR0eXtN4OQJIdDgaO7ZmRAwMWWyZwWb8LimVdgkfR2/d8kyInLUWtSM
         jdv5QzAa9j7iYnfPN1NKqDtG8CDZRYsB1zYRYTqn5GuBtlzy1g6kTcT/JPPK+I63QFgJ
         5hC9vSEMY2Mr+yelmcgc74I5yKqPUU/Ymlhf4qrU7ifjihgH0UQPVMwPhRZ6deL2v3xZ
         L2ci1R5diPAGPTeSs/5bVtMatLdxJY+o0xM39RZavz6DWp5bNxq574KOqBZifCEWGy/B
         PNFUy5SS27tgEobz6UhXfEYEOPKCThzVvmV6cIwLbKppnx0ZKe6nX8RO7cgmFIBPh/zF
         uUdw==
X-Gm-Message-State: AOAM532OKtsP166gQMF4VmO2LRqZNEsubhGrQ7iJ50JOCtVquzEFjwH+
        bQdpSDJEnOdyivrx7FcQFSIZqg==
X-Google-Smtp-Source: ABdhPJzPJ7a7B2gKd7mX/cHBrA1bcydfqcm9yX2BF56Hal2O0TDosxxZI3SuKPX6uNk5f41tojh1pQ==
X-Received: by 2002:a63:db57:: with SMTP id x23mr12394765pgi.432.1615566313341;
        Fri, 12 Mar 2021 08:25:13 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e8sm5899599pgb.35.2021.03.12.08.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 08:25:13 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 16/17] remoteproc: Properly deal with a detach request when attached
Date:   Fri, 12 Mar 2021 09:24:52 -0700
Message-Id: <20210312162453.1234145-17-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312162453.1234145-1-mathieu.poirier@linaro.org>
References: <20210312162453.1234145-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch introduces the capability to detach a remote processor
that has been attached to by the remoteproc core.  For that to happen
a rproc::ops::detach() operation needs to be available.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_cdev.c  | 5 +++++
 drivers/remoteproc/remoteproc_sysfs.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
index 0249d8f6c3f8..2db494816d5f 100644
--- a/drivers/remoteproc/remoteproc_cdev.c
+++ b/drivers/remoteproc/remoteproc_cdev.c
@@ -43,6 +43,11 @@ static ssize_t rproc_cdev_write(struct file *filp, const char __user *buf, size_
 			return -EINVAL;
 
 		rproc_shutdown(rproc);
+	} else if (!strncmp(cmd, "detach", len)) {
+		if (rproc->state != RPROC_ATTACHED)
+			return -EINVAL;
+
+		ret = rproc_detach(rproc);
 	} else {
 		dev_err(&rproc->dev, "Unrecognized option\n");
 		ret = -EINVAL;
diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 09eb700c5e7e..ad3dd208024c 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -207,6 +207,11 @@ static ssize_t state_store(struct device *dev,
 			return -EINVAL;
 
 		rproc_shutdown(rproc);
+	} else if (sysfs_streq(buf, "detach")) {
+		if (rproc->state != RPROC_ATTACHED)
+			return -EINVAL;
+
+		ret = rproc_detach(rproc);
 	} else {
 		dev_err(&rproc->dev, "Unrecognised option: %s\n", buf);
 		ret = -EINVAL;
-- 
2.25.1

