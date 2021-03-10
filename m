Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EAE2C433E0
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Mar 2021 21:11:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5608664FD6
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Mar 2021 21:11:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231935AbhCJVL2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 10 Mar 2021 16:11:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232920AbhCJVLB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 10 Mar 2021 16:11:01 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29B66C061574
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Mar 2021 13:10:48 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id y13so9531848pfr.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Mar 2021 13:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gj6WF/1oKuVocPkZDr0q35lcZZqhgtjB+hq21nBtWDQ=;
        b=DCemT085WWh7HRmlOaLcZsNEkgQDeuaeupj4twDJqjKQMYIBaQDdP4B3pYulTZxogm
         xKs8jVFDs0TwS2xzHbOm6tUFl8uSzVzZ2CcVDZY99hcKfe/B0jOaNGYw8Gw6O2fcMbo5
         885qqJ8rL5U8VlgQAwBwBPIgP6Ez6XbRqFc1Jt2Ia40m5zvNcFI2W2SSeLsx601r05tv
         +/hPPYID+yt1kH6NWkR9Z4dYJhHdrOx2VOzw67BtM6ikWSlR4AdrnpovnkiAxPsWlh9T
         2svoVz9KfinhKNXpxOZ0KVZmcBRVd6WhtjA6It2iFK5L43a7EIfMP/W+6cvdKYOJoP2R
         BV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gj6WF/1oKuVocPkZDr0q35lcZZqhgtjB+hq21nBtWDQ=;
        b=JVHJwUZAD3CeWqjKM2RCaFNci6UqwkDOK893EBDA7TBWlxN+C8zkFxihDtOPn/UkFb
         Io/eP/kZFVbOTix5GkRuj6MQDDpMb7AkF5bI0ktMb7ZwCdlTdztYOc7TinaaeduGtpzE
         apt51p16m++L6/qdJOyUeH/st1rpqmhnm3fQrg4Pr4ir92mYya1Il0c09kRLXSH9n010
         QBugoWH//LAC85mPI4OG0szj7Vvh/6P23B4ntJiM0KTt+SeU/KIP3vutyRxZZCrgwEnB
         /q4Ucs48IQq10t/ne4m8VU9jFecdBX3pmYffkf8BU+DZiSnbnvVxLqOpfAKqur7Y4VfT
         W3Pw==
X-Gm-Message-State: AOAM532ftP/x7WEWdmREiWwYXtqc9xc/VtwxiywyGIv2amt/7a6mhGFd
        L5RJbyHUKcQ5sTgwTfMue9x6oQ==
X-Google-Smtp-Source: ABdhPJwmSvQMeZv5nlUk6YGFMWVuo1FI15Bi7595b0pAlm3b0R0XMWk6pjErVCdzPlnE1EBqEBKZlQ==
X-Received: by 2002:a63:531e:: with SMTP id h30mr4387018pgb.158.1615410647791;
        Wed, 10 Mar 2021 13:10:47 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id j21sm371508pfc.114.2021.03.10.13.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 13:10:47 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 14/17] remoteproc: Properly deal with a start request when attached
Date:   Wed, 10 Mar 2021 14:10:22 -0700
Message-Id: <20210310211025.1084636-15-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210310211025.1084636-1-mathieu.poirier@linaro.org>
References: <20210310211025.1084636-1-mathieu.poirier@linaro.org>
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

