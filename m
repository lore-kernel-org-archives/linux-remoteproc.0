Return-Path: <SRS0=47aK=EF=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9D4C55178
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49494206ED
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OYnlPOGc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727430AbgJ3T5Z (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 30 Oct 2020 15:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgJ3T5Y (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 30 Oct 2020 15:57:24 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C037BC0613CF
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:24 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id w11so3480339pll.8
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zxmdSo4JQxLa2nmhFO59aat8O4WMfpdpurDih6vkxO4=;
        b=OYnlPOGcbQCb6HJcnxz4GQYzRWntTCV3CcOdX6D4yk5YxzIQexztrfV2frB7TGjwrZ
         1djdaGNkzfuFWTLvyQsU5qfRIuOnI411by55ZLTRbwTEjMZ0HsEiTXJg9gM193aN/TqA
         cAyJYtFf5WZVTRclG9CF01lRgIi/mpndBCJA3NeMsAWtbZIUYTs6d7bgzfhQJ0LjriXT
         1zbeaoBgMi9vFjavg8BYlS4u6foPIrxpvQxg0XPNgc737V4vE428vJukWCNplD/km/n5
         xl0jNabJO0blBJY52EXXsMkAlK7ud9aGKHErrfkkMDsTrVcu+xZJ+davrr4kZxWDuZYB
         ky2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zxmdSo4JQxLa2nmhFO59aat8O4WMfpdpurDih6vkxO4=;
        b=U8gwvS8VRY1RxBxtlXMcJTdrzJcZ8W6xFZDjPpO82fOW2e1ktawPYjTFLg6bxtZUPH
         5GqpXoRksShTJuv1H43sTKhEDK3LYYHzOAP4hmTVlg1ciTZJ0ieBUuZn75LgmUQM9LRq
         4cDz9Lx8z4i8IzgNkaYhCQ1SfT9hBa+/39W+fzEVbnwd+Ccj+ksCSl51fsbopAxx5JLW
         RK7Mdywef9IKZf2TBMBjwJlezhBbeNGrwVjAJ5LI7Oae7h+danSZ6hPqnaO+8+uZLikm
         RHOHt20EkVE+trxEWvWU8zGFJrPXhV6st5KnhiVmbXvILkn5mgIPFLAV8kIqgiTx+eQT
         Ub3g==
X-Gm-Message-State: AOAM533oMK+PKPiV5tvDjriJQ1qvvui/D1vCZEgl5XfpBDtZ4w9A2WJp
        S5OjkuOiOY3YbAilA6NzihI9Dg==
X-Google-Smtp-Source: ABdhPJwUzcGbfhZIbX8FG3MRfWOU4qrSmv1/ivmk5gNLWskl4dPZ/gCXjh16B3S2NZRGLmxPsfG8Cg==
X-Received: by 2002:a17:902:a50f:b029:d6:da2:aaa7 with SMTP id s15-20020a170902a50fb02900d60da2aaa7mr11005031plq.42.1604087844358;
        Fri, 30 Oct 2020 12:57:24 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o15sm6892640pfd.16.2020.10.30.12.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 12:57:23 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 09/14] remoteproc: Rename function rproc_actuate()
Date:   Fri, 30 Oct 2020 13:57:08 -0600
Message-Id: <20201030195713.1366341-10-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Align what was done for rproc_detach() by renaming function
rproc_actuate().  That way it is easier to figure out the
opposite of each functions.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 6b33a83960d2..de5a5720d1e8 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1416,7 +1416,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
-static int rproc_attach(struct rproc *rproc)
+static int __rproc_attach(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
 	int ret;
@@ -1541,7 +1541,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
  * Attach to remote processor - similar to rproc_fw_boot() but without
  * the steps that deal with the firmware image.
  */
-static int rproc_actuate(struct rproc *rproc)
+static int rproc_attach(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
 	int ret;
@@ -1581,7 +1581,7 @@ static int rproc_actuate(struct rproc *rproc)
 		goto clean_up_resources;
 	}
 
-	ret = rproc_attach(rproc);
+	ret = __rproc_attach(rproc);
 	if (ret)
 		goto clean_up_resources;
 
@@ -1825,7 +1825,7 @@ int rproc_boot(struct rproc *rproc)
 	if (rproc->state == RPROC_DETACHED) {
 		dev_info(dev, "attaching to %s\n", rproc->name);
 
-		ret = rproc_actuate(rproc);
+		ret = rproc_attach(rproc);
 	} else {
 		dev_info(dev, "powering up %s\n", rproc->name);
 
@@ -1916,7 +1916,7 @@ EXPORT_SYMBOL(rproc_shutdown);
  *
  * @rproc: the remote processor
  *
- * Detach a remote processor (previously attached to with rproc_actuate()).
+ * Detach a remote processor (previously attached to with rproc_attach()).
  *
  * In case @rproc is still being used by an additional user(s), then
  * this function will just decrement the power refcount and exit,
-- 
2.25.1

