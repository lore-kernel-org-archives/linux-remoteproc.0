Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F17C7C433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 23:40:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0DD364E7C
	for <linux-remoteproc@archiver.kernel.org>; Tue, 23 Feb 2021 23:40:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233626AbhBWXja (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 23 Feb 2021 18:39:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232136AbhBWXgA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 23 Feb 2021 18:36:00 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A454DC06178B
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:19 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id z5so62776pfe.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Feb 2021 15:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eI1kKtC7UxMHnJr2s3EPvhdO8fxk/LLGwiTP5XOosV0=;
        b=JYeh3wnybb4/m/UUR8LYuWcMywXegKKe2DxENoFrS8xZIgUWNzlNef/Jz6v/hiVsiP
         vQeR+YNRluWGmPtmVcduAElrCxHj/amtzcAQsk7k1opnA3cxk1NPbEEfW28RCmrCFU+i
         xinri+qaJjiwsZi+zvHwsgM6I4diKQaopxwU8k4vT4g4pPqHGollzxJtHQv+bfp2WUtv
         qcPJsmhxv+NsT4KYpMXyR77TxvcPjIZc2Zq2dF8STNuhPSr3n1dbBPBvmYz6z+LfOEEh
         uUNSv5lOQLVrFtQ81NC0TcOfgxgJloEjFPkP4RS2+8BeivYwe2Zr8/jqxEdYyVWy6qnP
         YnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eI1kKtC7UxMHnJr2s3EPvhdO8fxk/LLGwiTP5XOosV0=;
        b=ZdWzHMG0sSIjFRgx1X98Wmlo6odIiXJK/37vVzLVQEMRalOUXZQSMZkAJUAeiDoc9E
         MaDm2DM9BoacxZq0jz/SBq1BKiMJpjQtlwL/BF3TMKCOzNgacLxDiq1L9104Xs942xSF
         RZ//d4yiCQ46JSN2yu2AzJB8NlnnMpp2qH1UCjlwgew/a32hG2D/YKwEDtbH6XVdMlbd
         CLW7u6Cb3cGcXbIypH8Q80LCDb36x/U8HD0+RKiZODDil0mUV/IVJfuw2niWy22D+YkO
         5rOp9WUo6bjavD5bIUVkQmISOr/TL78Be4jmvhAXRrpXEtb08ltW8mF1wVizSqcK5y0u
         GabA==
X-Gm-Message-State: AOAM5324iKokRccUZJ4hDtsIhGmZmIb6eJbNHj1GeeUc055CyOpLd+SQ
        FQYb+ErLkV3hfn0bdJynYFhe/A==
X-Google-Smtp-Source: ABdhPJzsi6TXNp0kZzJEbaem3F4zHgJtQu4fTQYb8U7x7qnmSjpWBBr5dEjDShlaI4BKVzv+X/STLQ==
X-Received: by 2002:a62:7c15:0:b029:1ed:9e29:5998 with SMTP id x21-20020a627c150000b02901ed9e295998mr12313479pfc.22.1614123319231;
        Tue, 23 Feb 2021 15:35:19 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c24sm311999pfd.11.2021.02.23.15.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 15:35:18 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 02/16] remoteproc: Rename function rproc_actuate()
Date:   Tue, 23 Feb 2021 16:35:01 -0700
Message-Id: <20210223233515.3468677-3-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
References: <20210223233515.3468677-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Rename function rproc_actuate() to rproc_attach().  That way it is
easy to understand that it does the opposite of rproc_detach().

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index d2704501b653..7b66e1e96e4a 100644
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
 
@@ -1802,7 +1802,7 @@ int rproc_boot(struct rproc *rproc)
 	if (rproc->state == RPROC_DETACHED) {
 		dev_info(dev, "attaching to %s\n", rproc->name);
 
-		ret = rproc_actuate(rproc);
+		ret = rproc_attach(rproc);
 	} else {
 		dev_info(dev, "powering up %s\n", rproc->name);
 
-- 
2.25.1

