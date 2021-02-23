Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DFEAC433DB
	for <linux-remoteproc@archiver.kernel.org>; Wed, 24 Feb 2021 00:01:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD1F264E89
	for <linux-remoteproc@archiver.kernel.org>; Wed, 24 Feb 2021 00:01:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233842AbhBXAAV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Feb 2021 19:00:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233828AbhBWXuG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Feb 2021 18:50:06 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB12AC061A27
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:32 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id kr16so42697pjb.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=skygqmTpwpFqHXp0ZsK0QIEBfsju4nOHMOtLAZPE+UA=;
        b=Fkfxqba5KS3e8uLyKOIcfVl1j5B95mT1rMRKDnEO5h2ddnC8Bxa9CP4mbLlZtFtkx9
         vqk+yoMuByYC0Mg/maHGla3K2ROMO0yRNYXC4UAXDJMSuMwhidb/MbVKEnK/pY4fXqEZ
         bWnhoj+R99HcmRPHWIbfZkzulHB214Mmsb2vug7Cr7iclMxThGLcHB0HKQ4oXkhsoB0Y
         HiT7tIEtdaBow9CFuyCQkdgjeOjpka+tXtFfdVjWvIrAYiAP04RduYO/euP+hHmCuy/S
         C2EoCSLs3NyndBUtke4wis2WOyNFxZPZFZCQvPLp9UDUcElnRkGyDJeDTIJxHV/3L8FU
         eGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=skygqmTpwpFqHXp0ZsK0QIEBfsju4nOHMOtLAZPE+UA=;
        b=SIOVMYj1BbiXVFrfz03ezecXzR2i5xM90elxHUbN+k9ZUCtZiUWHxmbY2RCUK5v1xs
         w1eGW2r0gjkZRAKFgzAYWlFvyohpDvvBHKvuMKKzQUAW5M3x9abrcv081Zweir9jg23o
         GpsHfn/t9LoHlP21C0RJwpQN1UZui8RhCcIwme6A7H/kHj88X7+lFIm4H0Q9wYTcFNZF
         Nkvi0jIh07It36SmtKBr3vuQ/czGgUyUnq0YLYWzEq+E2dEMwHUuYkN3shnfB2LcLQfK
         +J/NVMq3Nm9/WHXIOf3JIxIeXVwsJXyVhG0yIdgPK7jOZTQIZh1CiWxoYwvCSSnBAFvX
         n0Tg==
X-Gm-Message-State: AOAM532OctMGys/w+nsJdkTfhQy9Py+cFyuodHXat/0czKaEaowN+K0/
        V3la7kbOvjewyyrnS0JBw4iGWA==
X-Google-Smtp-Source: ABdhPJylws8xRS7yb6Lx8oAsaa4CQlYQ1WGcJw/Rv+dLerg4frRX3/lypczOzj811/g3w5SiIH0aKg==
X-Received: by 2002:a17:902:ec83:b029:e3:ec1f:9def with SMTP id x3-20020a170902ec83b02900e3ec1f9defmr15096233plg.11.1614123332545;
        Tue, 23 Feb 2021 15:35:32 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c24sm311999pfd.11.2021.02.23.15.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 15:35:32 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 15/16] remoteproc: Properly deal with a detach request when attached
Date:   Tue, 23 Feb 2021 16:35:14 -0700
Message-Id: <20210223233515.3468677-16-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
References: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch introduces the capability to detach a remote processor
that has been attached by the remoteproc core.  For that to happen
a rproc::ops::detach() operation needs to be available.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
New for V6:
- The RPROC_RUNNING -> RPROC_DETACHED transition is no longer permitted
  to avoid dealing with complex resource table management problems.
- Removed Peng and Arnaud's RB tags because of the above.
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

