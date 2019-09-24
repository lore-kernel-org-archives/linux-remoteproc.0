Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Ding Xiang <dingxiang@cmss.chinamobile.com>
Subject: [PATCH] remoteproc: debug: Remove unneeded NULL check
Date: Tue, 24 Sep 2019 10:58:54 +0800
Message-Id: <1569293934-31451-1-git-send-email-dingxiang@cmss.chinamobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

debugfs_remove_recursive will do NULL check, so remove
the redundant null check

Signed-off-by: Ding Xiang <dingxiang@cmss.chinamobile.com>
---
 drivers/remoteproc/remoteproc_debugfs.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index 8cd4a0a..dd93cf0 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -333,9 +333,6 @@ struct dentry *rproc_create_trace_file(const char *name, struct rproc *rproc,
 
 void rproc_delete_debug_dir(struct rproc *rproc)
 {
-	if (!rproc->dbg_dir)
-		return;
-
 	debugfs_remove_recursive(rproc->dbg_dir);
 }
 
-- 
1.9.1
