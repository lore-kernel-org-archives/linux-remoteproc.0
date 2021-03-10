Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E79FC433DB
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Mar 2021 21:11:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 364E164FC9
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Mar 2021 21:11:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233815AbhCJVL1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 10 Mar 2021 16:11:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231935AbhCJVK4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 10 Mar 2021 16:10:56 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F57DC061764
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Mar 2021 13:10:45 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id p21so12226485pgl.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 Mar 2021 13:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1QQx7Pxxx+mjFZmngOFSgRWs39Wy/KkcCLmt4JFXcYU=;
        b=pbQ1RvOYSS9mMpaaqnGD602f1QyLBUTtYQ0Ud9mDz5HuiMsfCp8L6gW2bdhfR1FmhR
         3oJlrbAduJI6RUlrT/YbHj4gilA7BS2Pb3SyTV8Y5zZuOqTiUBIrOyy29TFVl0BiPSV4
         SNjRb0LX0dbl5pK+TWjdyBlfAYFppZYdy6iqQ/WVLlfZ5lwWywjgGgYdRcOd1QEiQTvV
         vD1K+TYfX9eK3v2fq9bTw/wnHByPMgKvmQDjzdXD6gTpHwwYwM4VLlpbQEvgk9vARfCR
         PtrRFD3dk+uxySXXd6ATSWKoGJL0HuwSJAS8FQ4trXCKiEUKwvl9htfR/XxMFiDOL4Hk
         DmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1QQx7Pxxx+mjFZmngOFSgRWs39Wy/KkcCLmt4JFXcYU=;
        b=kdOf7um9657owC/z+Yv9ezzoWhBhnKDGkyEJrxJ2tOb3Nq3Y7SvLvKPQJqus4whn88
         9VPTHI39+LhxxofxykcbLYVd2ON1o7kBu5FH90PawnBIpLQMCVRQZJOhaXz35DMDIYV7
         ssB7g9mvO53jqVkMz3ta3MiKpV/scjhi9UAPdBgrLH9xf1kfKMqGsArGPoKGPoA1bVcO
         b9ZkuZPDUcRaz9rdDh+heIlASST4LMLOkQUNeusopge1SkjBfC2LX2CQCzaZVOuXU/Mu
         nLl3epyrGATK2BHdJTI4JgliELkfNCABtx9RDdGTTvR0ixOwdAoBucFsLC5mW2PpT98a
         EHqA==
X-Gm-Message-State: AOAM533nbQAvFXHzcn6XONnzKuX2oHVpZnXzYCqjJh7DONSUs/CW+Rp1
        fKGpDiIhqhelHOhe3uuMZaXXUw==
X-Google-Smtp-Source: ABdhPJzcnnEP/9C1ajt0OE4dPZUc+dynza0TgDIouMzYm24qatT8Y5KboL+6ejQrLMYrWp2BW5rLEg==
X-Received: by 2002:a62:7ac3:0:b029:1f1:5d13:5ec6 with SMTP id v186-20020a627ac30000b02901f15d135ec6mr4671519pfc.14.1615410644837;
        Wed, 10 Mar 2021 13:10:44 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id j21sm371508pfc.114.2021.03.10.13.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 13:10:44 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 12/17] remoteproc: Properly deal with the resource table when stopping
Date:   Wed, 10 Mar 2021 14:10:20 -0700
Message-Id: <20210310211025.1084636-13-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210310211025.1084636-1-mathieu.poirier@linaro.org>
References: <20210310211025.1084636-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

When a remote processor that was attached to is stopped, special care
must be taken to make sure the shutdown process is similar to what
it would be had it been started by the remoteproc core.

This patch takes care of that by making a copy of the resource
table currently used by the remote processor.  From that point on
the copy is used, as if the remote processor had been started by
the remoteproc core.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
New for V7:
  New Patch, used to be part of 11/16 in V6.
---
 drivers/remoteproc/remoteproc_core.c | 53 +++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index e9ea2558432d..c488b1aa6119 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1634,6 +1634,52 @@ static int rproc_reset_rsc_table_on_detach(struct rproc *rproc)
 	return 0;
 }
 
+static int rproc_reset_rsc_table_on_stop(struct rproc *rproc)
+{
+	struct resource_table *table_ptr;
+
+	/* A resource table was never retrieved, nothing to do here */
+	if (!rproc->table_ptr)
+		return 0;
+
+	/*
+	 * If a cache table exists the remote processor was started by
+	 * the remoteproc core.  That cache table should be used for
+	 * the rest of the shutdown process.
+	 */
+	if (rproc->cached_table)
+		goto out;
+
+	/* Remember where the external entity installed the resource table */
+	table_ptr = rproc->table_ptr;
+
+	/*
+	 * If we made it here the remote processor was started by another
+	 * entity and a cache table doesn't exist.  As such make a copy of
+	 * the resource table currently used by the remote processor and
+	 * use that for the rest of the shutdown process.  The memory
+	 * allocated here is free'd in rproc_shutdown().
+	 */
+	rproc->cached_table = kmemdup(rproc->table_ptr,
+				      rproc->table_sz, GFP_KERNEL);
+	if (!rproc->cached_table)
+		return -ENOMEM;
+
+	/*
+	 * Since the remote processor is being switched off the clean table
+	 * won't be needed.  Allocated in rproc_set_rsc_table().
+	 */
+	kfree(rproc->clean_table);
+
+out:
+	/*
+	 * Use a copy of the resource table for the remainder of the
+	 * shutdown process.
+	 */
+	rproc->table_ptr = rproc->cached_table;
+	return 0;
+}
+
 /*
  * Attach to remote processor - similar to rproc_fw_boot() but without
  * the steps that deal with the firmware image.
@@ -1759,7 +1805,12 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 	rproc_stop_subdevices(rproc, crashed);
 
 	/* the installed resource table is no longer accessible */
-	rproc->table_ptr = rproc->cached_table;
+	ret = rproc_reset_rsc_table_on_stop(rproc);
+	if (ret) {
+		dev_err(dev, "can't reset resource table: %d\n", ret);
+		return ret;
+	}
+
 
 	/* power off the remote processor */
 	ret = rproc->ops->stop(rproc);
-- 
2.25.1

