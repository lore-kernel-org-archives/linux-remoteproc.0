Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF20FC43332
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 16:26:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7D7164FD9
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Mar 2021 16:26:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232603AbhCLQZi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 12 Mar 2021 11:25:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232731AbhCLQZJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 12 Mar 2021 11:25:09 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D3D5C061761
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Mar 2021 08:25:09 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id s7so12150466plg.5
        for <linux-remoteproc@vger.kernel.org>; Fri, 12 Mar 2021 08:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z++nDe1KbxQOwXuMBZocx2SGGQIMJC2S/9LC839MlY0=;
        b=dEFpi8aTE2Hk60yckTPByYR568S6yUjP9+TvhjVa2Mk/l9ACJ1m2UU4R6sSPSxPSMO
         RaV70NJQvdzkpX8/C98C7Uj+/Q46X9YPeunzqGsOfwYAQ+gykm43WATfCAszb5tyFmuv
         GST6g8cm1qQW1r8kYic1vLYpwNJdc1FL4JIX62mBrpdQj4+Vqvw7XVXCuYVNWd4uEPev
         lhue/blcKkOvz80iV6ApuJ1owjRkcHIYeDhPeGwwiMGO4ZzMpSNTWycONfAano5e7HMn
         rdAWBdkYF1PmTMf4Ejo0EJDDkh75vUmkeF0vJyuScsqy4vdbwwUtyP92yMSb+66mPMwu
         SbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z++nDe1KbxQOwXuMBZocx2SGGQIMJC2S/9LC839MlY0=;
        b=n4W0Oz0uFbMwaJHeqUGq8zHjojg0OzF1RBpVxNntz88ydJ7fMBP1wDBXbjB/pu76z4
         aTJ5rfHZ7xTFNWgOMZCZ6bWyOKr7W7exH4k/u0F9fvigg3G7PDdgcmQ0TZYj6GxQICe4
         0RJ0maxW43Rs9NrJZSRhkCgUqdXQO8cC3Ii+pwJAkstxdaGjBIINyd6dyF/Ao/lF/W33
         nQlLOgweZTAtQ6uzxijnA0aEj7/qRzijewYiLamcviakKahTYAKZQSl6i6S2Gxj20DnL
         Moo0XLadgqrvp0N5l+GL0RLfphqLVl2yXW9tGvbhcdt+meWl9M2JN5NskhXJeav4xcZC
         5uaQ==
X-Gm-Message-State: AOAM531MykTNGCX7LkOlHar/1kCbvzu3+8z3aWp1JE7/rHtd8H4buNKJ
        kFXGOxXxbmNdooltkblK7yPDBA==
X-Google-Smtp-Source: ABdhPJwOn+TVghc8Zxb7SvYP0+bKSsV+pl4TagUXNGdkFQEe3TVTEiXDzb5Y0svsD+5a3xOP4wykMQ==
X-Received: by 2002:a17:902:e5c8:b029:e4:c22d:4da6 with SMTP id u8-20020a170902e5c8b02900e4c22d4da6mr14523152plf.10.1615566309105;
        Fri, 12 Mar 2021 08:25:09 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id e8sm5899599pgb.35.2021.03.12.08.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 08:25:08 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 12/17] remoteproc: Properly deal with the resource table when stopping
Date:   Fri, 12 Mar 2021 09:24:48 -0700
Message-Id: <20210312162453.1234145-13-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312162453.1234145-1-mathieu.poirier@linaro.org>
References: <20210312162453.1234145-1-mathieu.poirier@linaro.org>
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
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Reported-by: kernel test robot <lkp@intel.com>
---
New for V8:
  - Removed variable @table_ptr as it served no purpose.
---
 drivers/remoteproc/remoteproc_core.c | 48 +++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 0f151dbcdc36..37b3b7d494e5 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1634,6 +1634,47 @@ static int rproc_reset_rsc_table_on_detach(struct rproc *rproc)
 	return 0;
 }
 
+static int rproc_reset_rsc_table_on_stop(struct rproc *rproc)
+{
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
@@ -1759,7 +1800,12 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
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

