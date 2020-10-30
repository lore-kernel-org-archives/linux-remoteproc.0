Return-Path: <SRS0=47aK=EF=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F095C55179
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50CB5206ED
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oGP3mucw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727441AbgJ3T50 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 30 Oct 2020 15:57:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgJ3T5Z (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 30 Oct 2020 15:57:25 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3FFBC0613CF
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:25 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id z1so3467234plo.12
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fqBYHqMZrZCViq4U5E3PDLbfevo4++oGEAd/a8uU46Q=;
        b=oGP3mucwxu9Y5z5WRp1/AZrThCwT/gL0/vVoflebetyj5fiiZSq4q6PlrX1RJGbPso
         nrnaJ66PGnr4zFzVoPasKq79AzhP6I/IBHnK43lqQBez0t6bgM6ay8Ae9vts89Nb38Ta
         O5pgGwWKemSN1+U48gEVlCiBnJwSFjzn9d8HKxGe2a/b3T4si6hP9/ccOg+eQBrK/5vv
         29W49yGDE4xGDUwMoBxKkeec7Uvzv5FdMjiq8KSLdRyIeuggwqlmmNLfkz0Qulo5UCzy
         f94eA4JOfXjyp5yr3+BUPQU5S330K/ViXepe0x/5yNXdEpgTCsPzqf3KEkf8/tKJpk+9
         Pknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fqBYHqMZrZCViq4U5E3PDLbfevo4++oGEAd/a8uU46Q=;
        b=jpwOe+Pn0SisJdPX5gK5x7zIT1MUTdEtiaFr2vUzD/9ZyPcWS2ur88UDcyOC0YlwW2
         EX6iyYrzTZlaMAot9OLs7nAMlF2O2Snyts373rTjvUcv4w3qgn7f3mgqqA6JgqxBbxpJ
         WR4UZIiMCCZOm7WNEJlNAgMFQqvFryu5XEIpt2hsifG5LguE9mXVXVVqAND8BfDeiVtq
         ErdtdaA1BCF4Cd4pkKk4RMaPjO6bxQAtkK9uk8MhfhvNNSRkeuDQp80AgdfKRZsrKuYs
         5kn4hQ9btfgA25gBTikaRlr/OolhGLWqQduTgbLuLyk2m4zaqMLDGea8DZ5iFuu0UIb3
         Vk1A==
X-Gm-Message-State: AOAM530RMhkFZPI5Dy+Uf/V5v3n4dXIHS/3kSGqIwbqDwDmFlPObey1r
        W/zeQURdp9wIy53zYyQl9q+YCQ==
X-Google-Smtp-Source: ABdhPJxtzzjM5a/pUmxH8b9P2+NaL1fqtV+73cRTYc3UlrJ5A+iYXC0YzlIdcJ1J3GGyiXM6XV24Hg==
X-Received: by 2002:a17:902:74ca:b029:d6:7963:5bae with SMTP id f10-20020a17090274cab02900d679635baemr10634795plt.4.1604087845451;
        Fri, 30 Oct 2020 12:57:25 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o15sm6892640pfd.16.2020.10.30.12.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 12:57:24 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 10/14] remoteproc: Add return value to function rproc_shutdown()
Date:   Fri, 30 Oct 2020 13:57:09 -0600
Message-Id: <20201030195713.1366341-11-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
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
 drivers/remoteproc/remoteproc_core.c | 13 +++++++++----
 include/linux/remoteproc.h           |  2 +-
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index de5a5720d1e8..f58475f6dcab 100644
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
@@ -1907,6 +1911,7 @@ void rproc_shutdown(struct rproc *rproc)
 	rproc->table_ptr = NULL;
 out:
 	mutex_unlock(&rproc->lock);
+	return ret;
 }
 EXPORT_SYMBOL(rproc_shutdown);
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 6713faab6959..71d4d4873164 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -655,7 +655,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
 			     u32 da, const char *name, ...);
 
 int rproc_boot(struct rproc *rproc);
-void rproc_shutdown(struct rproc *rproc);
+int rproc_shutdown(struct rproc *rproc);
 int rproc_detach(struct rproc *rproc);
 void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
 int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
-- 
2.25.1

