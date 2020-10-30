Return-Path: <SRS0=47aK=EF=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581CFC00A89
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0525F206ED
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vp0P3H3c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727424AbgJ3T5U (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 30 Oct 2020 15:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgJ3T5U (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 30 Oct 2020 15:57:20 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C70BC0613CF
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:20 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id z24so6122633pgk.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mrLtJwnZtNMIcZOlLWTtJgAHRo+y844wAreui1GDutQ=;
        b=Vp0P3H3ckXFAR3pNZMBh+1b/tSEfCJwXIr6dBFWRyghEVFBayC9tpE3fmtdOHF3LEG
         p+bTbbbdREWFW0/r3ccDaINhyPq5ze0bze2gbUc7K76J8xbYCz2PHccbH1yFx9MVRCb8
         VxTYSI/2QuFOI6SnkAC9EJscJ6M+0/nZQ0XNTRf5swI2ygfHzib2SpoKKQOqK0ZSl+Ef
         gi+RICz1Oh//+WIAmLNlu1I834fMCUr3N8KThWhZisyNRDUoyN9kxB1F45tItyxRSXFc
         0GtNwAv7NPVQsQoEvwJKYBQ1CFO9qMWn1iNDYNvwBatHkSvEHA5AYpdXK4prgAy4ZHeZ
         cvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mrLtJwnZtNMIcZOlLWTtJgAHRo+y844wAreui1GDutQ=;
        b=ffIPsR99R7bU0bK4XCJxdWQetf5+m3iVHkSNYR4qkr+CselOzy/dbse5H0ZTNzsMbE
         W7IhOyuF3AbZLwgjwOpG0zc+Lmb+RsTqqdAuJZG0TvTZ4RstfgqZTGZ8m+tA0A04fQjP
         jxCmlHKGVs+GPMRk89+/TDCM1h7atYxPe4R9wreC7g7CSm3vHOslC5cQ1AOf9E9a64Nl
         AI5D2uV8x7XeoE8EpqMM4V3m5SP1DRPYq5dYKZF7hbh4R70d/lhjCdnKy2iRvSfa3U9/
         9WnFj/SGAScEvb8nrBWnbn5rSFMQGCK0wHeaf5RzXD/ScgyjeuoUrV0T7B7rxC8iujQK
         dd6A==
X-Gm-Message-State: AOAM530+BnDjl9mSk8Bq9rrHIU7HBMkk1nxH3qrFJ+ApAKdej9qAWTXV
        sOs9ei2so6+LQPZFgEcUcDDL/Bk74IKzPzMe
X-Google-Smtp-Source: ABdhPJxRWPKSP7P1oKubSE8Z47y/zmRfYPOgsGLSzhZ/+1CgQdgYOztVHX1eu0BqQdkWJyIzx1jIdw==
X-Received: by 2002:a63:1341:: with SMTP id 1mr3431255pgt.6.1604087840102;
        Fri, 30 Oct 2020 12:57:20 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o15sm6892640pfd.16.2020.10.30.12.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 12:57:19 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 05/14] remoteproc: Properly deal with a kernel panic when attached
Date:   Fri, 30 Oct 2020 13:57:04 -0600
Message-Id: <20201030195713.1366341-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The panic handler operation of registered remote processors
should also be called when remote processors have been
attached to.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 63fba1b61840..ed1f9ca4248b 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2408,7 +2408,11 @@ static int rproc_panic_handler(struct notifier_block *nb, unsigned long event,
 
 	rcu_read_lock();
 	list_for_each_entry_rcu(rproc, &rproc_list, node) {
-		if (!rproc->ops->panic || rproc->state != RPROC_RUNNING)
+		if (!rproc->ops->panic)
+			continue;
+
+		if (rproc->state != RPROC_RUNNING &&
+		    rproc->state != RPROC_ATTACHED)
 			continue;
 
 		d = rproc->ops->panic(rproc);
-- 
2.25.1

