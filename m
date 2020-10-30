Return-Path: <SRS0=47aK=EF=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8166EC4741F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A64F206ED
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YNabOr3+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727134AbgJ3T5a (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 30 Oct 2020 15:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgJ3T5a (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 30 Oct 2020 15:57:30 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42EA4C0613CF
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:30 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id a200so6211841pfa.10
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TtNrf4oE1QZKdPj5H3/YLMRhdwk0lWasvYrPepFrEZk=;
        b=YNabOr3+Y+D0EoKbiTUh2n9y1ILlUvyvbK3xjDnAqYkNSS7k1EQ5Mlgi230rrFNgBA
         gXQA1pF+3hgYgr1tC4k3J+CHbF779A+iu/ANsY+GW1kv/Uz9am5DbV69VFwjci/GPeg/
         sNYgbaeEooJn0L2V5aLu4Mg4aZHf06DFddoX96mJGFNQJx0e1+TPZOTiAMw9rr/RrT7P
         I4RIlHxb8GlW/+3JaxycYVuYxaG2EJIBDHRVoO1+Crg3WQAu3P40hxJNaazUKLpPZhn3
         LirhjhU0tzP4t7ppMVqUvhdQkJolA601ynm0C85HGM++jZkGdzamAuNQLWoOfGaLzyqG
         DBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TtNrf4oE1QZKdPj5H3/YLMRhdwk0lWasvYrPepFrEZk=;
        b=oiAOU8lWc2S4U9wzsYpTzOdB+t06Y8WtLxBHnm5T+PRNY4+I453TQKNLgYXg5P4fuo
         ghuf33pxdLRDM5c32XabdRcy14reVTORwKxUXzPl1RgHlTZY5v6YSXG9niGSb7U5rUgG
         rNCA7NKEPiQB7nYn3GGmp3VtJst9O4ydXCVBdLNKf4pqEwFdCqDtSLxkUEKM8Pzq4Syq
         Ut4P/GdaQYtRrIylRruHngdqtg+rokcHapvY6e7sRRFo7y0zMtVw4xD+VBtC7+Grh6y6
         xi6E73uSrsx5UOMoBByMl//ZgVQ+6/cHvcFJSRjGhzOqnBWEMU6/C5eqrKKjNQsmO0A+
         64uQ==
X-Gm-Message-State: AOAM530ehAJJGdAsYG1OqRWZzQZdH/xbq0jVTeWxIOT1dxvBuTQ28J/X
        Z4aQ11IHQVE4izq8+JD7GpjwZ5AhoXd1azLZ
X-Google-Smtp-Source: ABdhPJxIBAqlN9lGflS+FyEF462mVDZsr58w3N76+pigvbzdGjZwRYuZuZ0844pVRrBoyQ14yn4dxw==
X-Received: by 2002:aa7:9682:0:b029:160:b81d:d715 with SMTP id f2-20020aa796820000b0290160b81dd715mr10784476pfk.69.1604087849845;
        Fri, 30 Oct 2020 12:57:29 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o15sm6892640pfd.16.2020.10.30.12.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 12:57:29 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org
Subject: [RFC v2 14/14] remoteproc: Refactor rproc delete and cdev release path
Date:   Fri, 30 Oct 2020 13:57:13 -0600
Message-Id: <20201030195713.1366341-15-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Refactor function rproc_del() and rproc_cdev_release() to take
into account the policy specified in the device tree.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_cdev.c | 13 ++++++++++++-
 drivers/remoteproc/remoteproc_core.c | 12 ++++++++++--
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_cdev.c b/drivers/remoteproc/remoteproc_cdev.c
index 3a3830e27050..2e3f85920e5b 100644
--- a/drivers/remoteproc/remoteproc_cdev.c
+++ b/drivers/remoteproc/remoteproc_cdev.c
@@ -87,7 +87,18 @@ static int rproc_cdev_release(struct inode *inode, struct file *filp)
 {
 	struct rproc *rproc = container_of(inode->i_cdev, struct rproc, cdev);
 
-	if (rproc->cdev_put_on_release && rproc->state == RPROC_RUNNING)
+	if (!rproc->cdev_put_on_release)
+		return 0;
+
+	/*
+	 * The application has crashed or is releasing its file handle.  Detach
+	 * or shutdown the remote processor based on the policy specified in the
+	 * DT.  No need to check rproc->state right away, it will be done
+	 * in either rproc_detach() or rproc_shutdown().
+	 */
+	if (rproc->autonomous_on_core_reboot)
+		rproc_detach(rproc);
+	else
 		rproc_shutdown(rproc);
 
 	return 0;
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index d024367c63e5..9652e543c1ed 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2393,8 +2393,16 @@ int rproc_del(struct rproc *rproc)
 	if (!rproc)
 		return -EINVAL;
 
-	/* TODO: make sure this works with rproc->power > 1 */
-	rproc_shutdown(rproc);
+	/*
+	 * TODO: make sure this works with rproc->power > 1
+	 *
+	 * No need to check rproc->state right away, it will be done in either
+	 * rproc_detach() or rproc_shutdown().
+	 */
+	if (rproc->autonomous_on_core_reboot)
+		rproc_detach(rproc);
+	else
+		rproc_shutdown(rproc);
 
 	mutex_lock(&rproc->lock);
 	rproc->state = RPROC_DELETED;
-- 
2.25.1

