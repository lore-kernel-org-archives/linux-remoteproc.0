Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CECBC3526D
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Dec 2020 17:34:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4193D23B6C
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Dec 2020 17:34:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732804AbgLRReY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 18 Dec 2020 12:34:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732841AbgLRReX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 18 Dec 2020 12:34:23 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 113C4C061A4D
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Dec 2020 09:32:48 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id e2so1749181pgi.5
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Dec 2020 09:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vutdwpz2dUDTweVlb30ERc0HCxLnN2+/Hjzz5Y0E1bI=;
        b=BKXSrxbXnh6d2zRd2aZGKoJTdugQUWnvySJCEm8scXWnxe9+TXu4/81oD7MQ7cAa17
         gBO+juB3m0O1fJjMKmtwbmlZgSx+e0JTk0c0HSQxxX0PtJqu1sIPMrzlHOrooOtCcSlV
         jBWWe3U8wAgF2HAAPUjjDl3dn+tkcgA2TspNkWMz0iMrwWGEqpVYwi9SA/2ycdhEX7EB
         ZroR/ixb5Fa5kmAWWEgaoiZgosqZ7gUGLmayhcP9HTnP7Q9Xz3hklPJzJNnEk/sy635S
         mZImmX9q2aaGbnoKtTFr/Lu2XDsdDRBFlAnGqEILryiXq7xAUF5u33LS7NVbe1lAjHJ7
         TgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vutdwpz2dUDTweVlb30ERc0HCxLnN2+/Hjzz5Y0E1bI=;
        b=Fmxp4k5sZg9XfNWC9B7z8PpVuY+N7qYZXYZtXtYcJuiKLla+jzl7af6KlY99kqKpom
         /iAGehz//4HM1b4qGZdW/5LYsHiJG672Fqj9iT3/V2pUxirzlGGDP1KbzqR8ElYM0d2S
         LkihnwNNf8CMEiaEDJRv8+X+QvgD3+KI4XGQ0L9rxN6WLNYUlhtHS5FYdswSDjWny396
         0JYCpLEFuC5hAtQE3V0lOD4GeZnhtnwR0x4gRPzLOoRZ97nPOnifwvUkn9+ZoQnLhfgG
         +QtRh8IGX1/fgiiFY2bqCDlvAL5s3LUJMFIoCNwYIcp8mvg7NUMHnpspe6u4j3EQn2Qk
         S8Hg==
X-Gm-Message-State: AOAM533QwDJ1EOkkFTqQ3mklypK7urtWw8Taml1QpnSBOhrWjTxapYcv
        Akgk3V4CVZYR5fZ7NjekIBzd/FdaHjXFcw+A
X-Google-Smtp-Source: ABdhPJyoSPdQNxv0nHKlET++OnaWfTpvXjLCfYQZndPk5Wlb1V3YDItJACWOCJnUBVrQbDsT25+Nuw==
X-Received: by 2002:a65:4c4b:: with SMTP id l11mr1097792pgr.177.1608312767705;
        Fri, 18 Dec 2020 09:32:47 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id l11sm9892957pgt.79.2020.12.18.09.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 09:32:46 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     arnaud.pouliquen@st.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 15/17] remoteproc: Properly deal with a start request when attached
Date:   Fri, 18 Dec 2020 10:32:26 -0700
Message-Id: <20201218173228.2277032-16-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201218173228.2277032-1-mathieu.poirier@linaro.org>
References: <20201218173228.2277032-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch takes into account scenarios where a remote processor
has been attached to when receiving a "start" command from sysfs.

As with the "running" case, the command can't be carried out if the
remote processor is already in operation.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_cdev.c  | 3 ++-
 drivers/remoteproc/remoteproc_sysfs.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
index d06f8d4919c7..61541bc7d26c 100644
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
index 96751c087585..298052c9d068 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -223,7 +223,8 @@ static ssize_t state_store(struct device *dev,
 	int ret = 0;
 
 	if (sysfs_streq(buf, "start")) {
-		if (rproc->state == RPROC_RUNNING)
+		if (rproc->state == RPROC_RUNNING ||
+		    rproc->state == RPROC_ATTACHED)
 			return -EBUSY;
 
 		ret = rproc_boot(rproc);
-- 
2.25.1

