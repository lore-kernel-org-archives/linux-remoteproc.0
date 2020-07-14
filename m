Return-Path: <SRS0=gNgS=AZ=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20889C433F1
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Jul 2020 20:05:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB19621D80
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Jul 2020 20:05:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DJ7V8b5i"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730051AbgGNUFJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Jul 2020 16:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730022AbgGNUE5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Jul 2020 16:04:57 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51F5AC061794
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2020 13:04:57 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id w2so8066680pgg.10
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Jul 2020 13:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h12JhHvSO+bmX99ezv3yaLnOJmMzfHeXrbHb3WDJUWc=;
        b=DJ7V8b5i+/Tv/OOoy+U5IAmyq8Y7huOUnzJqHDrYYbiKMKAAdMqDBxq0BIKBWDW2Ut
         rc+fvzDHyx0CTs1SJFC0C/9zNCrGBmp4Ltz/UhnHeINA6Hsug9v4/z5m91Dk5aOAnVhr
         l2JpMzWwsYGEavJG8gJ1+J4Qts/LLzVsTF3MFAeJay7oWq+meeeFI19vytEZBzyMatPK
         aKg/aSWDL5iYuvddNeZ1uTbfQ/lcwpt0pX3hPWWCeily6FupPwcdrPjgNKBuLU5OjqwV
         cWF598r+6Fq8oZMwAnONKN6gvQy3lIAN1k1R+P8Oydladzp4Q5Ftmp/hVxiL6h+eYaYi
         /7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h12JhHvSO+bmX99ezv3yaLnOJmMzfHeXrbHb3WDJUWc=;
        b=D45RD5kRtyussDg/sSl6SjFCDftTNimnn4M460h+zZ++9KWn3ZRgcsHq6V0TTweSn6
         3Nd+rYQyGImQKcofAVkuQyvjjignthxbAioGCVCdySjmx/mOJYUz2N4z/VSgwZqYqufU
         Mjf6Es0z+FBnrDXMFj3K2NWWN4bnxw0UV0t+0IdmH/cJpQKVYrwzB1NNHUNikHYecmsO
         X3vpEiQX1Gn3YZZRxsW85d+hWpdAu3SX5ZFFDlCoPg5z621nSxb5niapGXBKOIMB1akk
         LUiYTMKpvZQiseJhlQ2nn1eNTQJCz/en8CYl+kJgGVPAnZfdMDaxn7SwIbadUIoDBzET
         gWdQ==
X-Gm-Message-State: AOAM533XS14Ho942UPuoiTSZ0Y0YbGQ8yjxOYJUEjlJnjj/1xxh2Qt6u
        sNUfZ1BVYUpzQ4zWaPSXhHE4aA==
X-Google-Smtp-Source: ABdhPJwLad282+1fQ4jA+c/yfEwsyyWdoEjqDQEBZ4Id0zFDntAlCtYcwIWvGi8A9COTD1KdXLIiYQ==
X-Received: by 2002:a65:6106:: with SMTP id z6mr4816217pgu.310.1594757096888;
        Tue, 14 Jul 2020 13:04:56 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id t13sm3262959pjs.17.2020.07.14.13.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 13:04:56 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
        arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v6 07/11] remoteproc: Make function rproc_resource_cleanup() public
Date:   Tue, 14 Jul 2020 14:04:41 -0600
Message-Id: <20200714200445.1427257-8-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
References: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Make function rproc_resource_cleanup() public so that it can be
used by platform drivers when allocating resources to be used by
a detached remote processor.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 3 ++-
 include/linux/remoteproc.h           | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 099c76ab198f..6e0f985e9c9a 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1271,7 +1271,7 @@ static void rproc_coredump_cleanup(struct rproc *rproc)
  * This function will free all resources acquired for @rproc, and it
  * is called whenever @rproc either shuts down or fails to boot.
  */
-static void rproc_resource_cleanup(struct rproc *rproc)
+void rproc_resource_cleanup(struct rproc *rproc)
 {
 	struct rproc_mem_entry *entry, *tmp;
 	struct rproc_debug_trace *trace, *ttmp;
@@ -1315,6 +1315,7 @@ static void rproc_resource_cleanup(struct rproc *rproc)
 
 	rproc_coredump_cleanup(rproc);
 }
+EXPORT_SYMBOL(rproc_resource_cleanup);
 
 static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 {
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index cf5e31556780..7c0567029f7c 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -610,6 +610,7 @@ void rproc_put(struct rproc *rproc);
 int rproc_add(struct rproc *rproc);
 int rproc_del(struct rproc *rproc);
 void rproc_free(struct rproc *rproc);
+void rproc_resource_cleanup(struct rproc *rproc);
 
 struct rproc *devm_rproc_alloc(struct device *dev, const char *name,
 			       const struct rproc_ops *ops,
-- 
2.25.1

