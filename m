Return-Path: <SRS0=FIV4=6E=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A15C54FCB
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Apr 2020 23:16:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5856320B1F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Apr 2020 23:16:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b7QPcnci"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727082AbgDTXQR (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 20 Apr 2020 19:16:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728057AbgDTXQH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Apr 2020 19:16:07 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C70E1C061A0E
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Apr 2020 16:16:06 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id y6so63653pjc.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Apr 2020 16:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dza4hzfaFmzh3Frpav4RG02VUoiCOrQpepiedtPNL7c=;
        b=b7QPcncixOowdwF513j6U8tfP77Wo0PggKWFrKwbYZ+AZhIlNRMWMxvbjH9NTix8d1
         VgiSGYX7jCL7iQwB41rdDoysn8OpMSMMyb6H8kY81Nc37HlxDcKr1vdq8xjk7FYtrvvg
         NuClw43cR1SWUI3OhxNfgvAsoOaTNpcyU4JgbNdqZHAv181LAnFojOMsJpELoNsJtS8d
         RW3sJ/qE0LQk4MbOd0vPS/55LrXM8oE34jhqJEMkiI8QN2pncle4A3hId46+R22aqFmm
         qVLDzhdjfnMK8pq4h7HNLmUjdfovJjMcSfTVmxwAYMLvJTePO9TvZtj5ZJmJlHWxijke
         pAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dza4hzfaFmzh3Frpav4RG02VUoiCOrQpepiedtPNL7c=;
        b=bWVUzuwmfsNBqoYf/x1Dl9B4JYl5IWnetQ612FeFRzy9muyrhGqsTdwgd94sNxL31w
         9sfqnx4XQlWcglA3Sz6G0MZFcBudvJSPcrpl7/m4LMqNFeaXZEHyYZQYI5Md7bnolcyJ
         sW5yhrPWmX1cNckBWobLJIFvYeYXsGq4bEHU+aKPN2ds4N7qapnbnMynlj+9KhIwFsnj
         bgcsEhfUbpApMvrF3iUF522gBjTCdtNBAuhfCtNjD89e0kqBLqW03s8v9Tl2QH/5NGCn
         thqXqAIC72CfplS1xlDqgurWhJeM3twBlq1pCHOja9M53+yw/HoQRldOdz3X+itgt+0T
         iwGQ==
X-Gm-Message-State: AGi0PuYmsA13NLxk3Wh5GrecdRxHW56d8Bdjx8AXweuO2RxGRTKvXqyo
        hlTT/rqn+yencZUTJgjFR/jqhQ==
X-Google-Smtp-Source: APiQypKzxNRdPzrHdiqjIdsTokoS2NTxm85nq87jtVQxHeiZu7I1gt5bgqxgTT5C4qCWWE8/gbk5dQ==
X-Received: by 2002:a17:902:b108:: with SMTP id q8mr19688672plr.214.1587424566380;
        Mon, 20 Apr 2020 16:16:06 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id l15sm435354pgk.59.2020.04.20.16.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 16:16:05 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     elder@linaro.org, s-anna@ti.com, Markus.Elfring@web.de,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] remoteproc: Split rproc_ops allocation from rproc_alloc()
Date:   Mon, 20 Apr 2020 17:16:00 -0600
Message-Id: <20200420231601.16781-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200420231601.16781-1-mathieu.poirier@linaro.org>
References: <20200420231601.16781-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200420231600.KvKgMqa0lOcu1nOhEzPgNnInTGiKPiLn2UEAdybX7ps@z>

Make the rproc_ops allocation a function on its own in an effort
to clean up function rproc_alloc().

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Alex Elder <elder@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 33 ++++++++++++++++++----------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 45529d40342f..15318507aedb 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2028,6 +2028,26 @@ static int rproc_alloc_firmware(struct rproc *rproc,
 	return 0;
 }
 
+static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
+{
+	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
+	if (!rproc->ops)
+		return -ENOMEM;
+
+	if (rproc->ops->load)
+		return 0;
+
+	/* Default to ELF loader if no load function is specified */
+	rproc->ops->load = rproc_elf_load_segments;
+	rproc->ops->parse_fw = rproc_elf_load_rsc_table;
+	rproc->ops->find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table;
+	if (!rproc->ops->sanity_check)
+		rproc->ops->sanity_check = rproc_elf32_sanity_check;
+	rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
+
+	return 0;
+}
+
 /**
  * rproc_alloc() - allocate a remote processor handle
  * @dev: the underlying device
@@ -2067,8 +2087,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	if (rproc_alloc_firmware(rproc, name, firmware))
 		goto free_rproc;
 
-	rproc->ops = kmemdup(ops, sizeof(*ops), GFP_KERNEL);
-	if (!rproc->ops)
+	if (rproc_alloc_ops(rproc, ops))
 		goto free_firmware;
 
 	rproc->name = name;
@@ -2096,16 +2115,6 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 
 	atomic_set(&rproc->power, 0);
 
-	/* Default to ELF loader if no load function is specified */
-	if (!rproc->ops->load) {
-		rproc->ops->load = rproc_elf_load_segments;
-		rproc->ops->parse_fw = rproc_elf_load_rsc_table;
-		rproc->ops->find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table;
-		if (!rproc->ops->sanity_check)
-			rproc->ops->sanity_check = rproc_elf32_sanity_check;
-		rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
-	}
-
 	mutex_init(&rproc->lock);
 
 	INIT_LIST_HEAD(&rproc->carveouts);
-- 
2.20.1

