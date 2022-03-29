Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43DA0C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Mar 2022 15:46:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238961AbiC2PsP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 29 Mar 2022 11:48:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239113AbiC2PsM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 29 Mar 2022 11:48:12 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF663AA4D
        for <linux-remoteproc@vger.kernel.org>; Tue, 29 Mar 2022 08:46:27 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id t13so13928926pgn.8
        for <linux-remoteproc@vger.kernel.org>; Tue, 29 Mar 2022 08:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IymaKEEG96yzFJdoQrfQ9qormmGi8jgEeOpTl3nqbmc=;
        b=KlpjU76iBJcQ5M0H/u6Bbl1pu3KXof+l0AXSL4W7Er7prOAwuPxw9K7DsIXrPFccA+
         JqqR/jjoCGT1647aFcpfUbxyTDs25IRIEKG/nM53vtEa9WIdSXkBeAW3F/v26XN+yn5i
         TyteqBfV2bBnmEoiSPvr5RQgGS+szesarNGOCpfe/1nUZ0rn/2YF2iOVFuHf8msCXS/4
         m1ti2MMwY6dKM0lYh6ZQ6xSVoWNCZq8ZRlGzrwNjJT6RDWd9gvcapyMhZH84TElORYMF
         RXVhM3VNbh1f8sarDXBedjuh8FeP/OjB7YLjCxYqnPmIQxVCFCiVAVhux+VhuzG7021V
         G4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IymaKEEG96yzFJdoQrfQ9qormmGi8jgEeOpTl3nqbmc=;
        b=sBKIZvWphZ9UE83GNS7Cs8gbm74+HsQMciY3dbkz2O+nM0HpwUvT4Uj0aWF5sUjJQj
         r8cBaoRyk6Ej9EXjD8+C26V92efDwNbgC+F/S6BNsxZi0AFrgI7PECRTQZc4KVog2rOr
         D8Td2TXxBhPc8AeKgx88WeyiblSBG4YcxX7uxSV5HEf1AJdmEPGU9ONkga7C5z5GQDRM
         sxvNegluyhI5A5osUfDKnCIbfMFlJxzIqgHLCRenlduzDUuC/+Sd9+JnXMUeJOrWXNOs
         gER7vMZ8DOeduLgnsUKEj68D00RGxxRT5qpt2xrTAJ+CNrS2OZcHiJJ6mfzJbxKvfQr8
         8JuA==
X-Gm-Message-State: AOAM532MAXLCGY18bayM/G5+wtLOMY1NcPM/zT1t7TCAQSW1WI0QYn5I
        558PgbO9bUy7oizdS6QHzIlGLp2AxwfP
X-Google-Smtp-Source: ABdhPJwCyrAwwxBudKKpkEFBRAEMlFbirCbdVjYmdF4KwLbnX6lqd2ma9ngCAjTL1EikfD6aNwYOAw==
X-Received: by 2002:a63:b55d:0:b0:398:5eeb:e637 with SMTP id u29-20020a63b55d000000b003985eebe637mr2385045pgo.314.1648568787290;
        Tue, 29 Mar 2022 08:46:27 -0700 (PDT)
Received: from localhost.localdomain ([117.217.181.81])
        by smtp.gmail.com with ESMTPSA id 73-20020a62194c000000b004fab3b767ccsm21536034pfz.216.2022.03.29.08.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 08:46:26 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2] remoteproc: Don't bother checking the return value of debugfs_create*
Date:   Tue, 29 Mar 2022 21:16:16 +0530
Message-Id: <20220329154616.58902-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

DebugFS APIs are designed to return only the error pointers and not NULL
in the case of failure. So these return pointers are safe to be passed on
to the successive debugfs_create* APIs.

Therefore, let's just get rid of the checks.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v2:

* Removed the error check of rproc_create_trace_file().

 drivers/remoteproc/remoteproc_core.c    |  4 ----
 drivers/remoteproc/remoteproc_debugfs.c | 17 ++---------------
 2 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 69f51acf235e..56c3f70723a9 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -684,10 +684,6 @@ static int rproc_handle_trace(struct rproc *rproc, void *ptr,
 
 	/* create the debugfs entry */
 	trace->tfile = rproc_create_trace_file(name, rproc, trace);
-	if (!trace->tfile) {
-		kfree(trace);
-		return -EINVAL;
-	}
 
 	list_add_tail(&trace->node, &rproc->traces);
 
diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index b5a1e3b697d9..2e2c4a31c154 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -386,16 +386,8 @@ void rproc_remove_trace_file(struct dentry *tfile)
 struct dentry *rproc_create_trace_file(const char *name, struct rproc *rproc,
 				       struct rproc_debug_trace *trace)
 {
-	struct dentry *tfile;
-
-	tfile = debugfs_create_file(name, 0400, rproc->dbg_dir, trace,
+	return debugfs_create_file(name, 0400, rproc->dbg_dir, trace,
 				    &trace_rproc_ops);
-	if (!tfile) {
-		dev_err(&rproc->dev, "failed to create debugfs trace entry\n");
-		return NULL;
-	}
-
-	return tfile;
 }
 
 void rproc_delete_debug_dir(struct rproc *rproc)
@@ -411,8 +403,6 @@ void rproc_create_debug_dir(struct rproc *rproc)
 		return;
 
 	rproc->dbg_dir = debugfs_create_dir(dev_name(dev), rproc_dbg);
-	if (!rproc->dbg_dir)
-		return;
 
 	debugfs_create_file("name", 0400, rproc->dbg_dir,
 			    rproc, &rproc_name_ops);
@@ -430,11 +420,8 @@ void rproc_create_debug_dir(struct rproc *rproc)
 
 void __init rproc_init_debugfs(void)
 {
-	if (debugfs_initialized()) {
+	if (debugfs_initialized())
 		rproc_dbg = debugfs_create_dir(KBUILD_MODNAME, NULL);
-		if (!rproc_dbg)
-			pr_err("can't create debugfs dir\n");
-	}
 }
 
 void __exit rproc_exit_debugfs(void)
-- 
2.25.1

