Return-Path: <elder@linaro.org>
Return-Path: <elder@linaro.org>
From: Alex Elder <elder@linaro.org>
Subject: [PATCH 2/4] remoteproc: remoteproc debugfs file fixes
Date: Fri, 28 Feb 2020 12:33:57 -0600
Message-Id: <20200228183359.16229-3-elder@linaro.org>
In-Reply-To: <20200228183359.16229-1-elder@linaro.org>
References: <20200228183359.16229-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Don't bother checking the remoteproc state before calling
rproc_trigger_recovery() because that function will verify the
state, and the state can only be safely checked while holding the
mutex anyway.

Make the mode for "recovery" be writable.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/remoteproc/remoteproc_debugfs.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index dd93cf04e17f..e995dc49c231 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -138,16 +138,14 @@ rproc_recovery_write(struct file *filp, const char __user *user_buf,
 		buf[count - 1] = '\0';
 
 	if (!strncmp(buf, "enabled", count)) {
+		/* change the flag and begin the recovery process if needed */
 		rproc->recovery_disabled = false;
-		/* if rproc has crashed, trigger recovery */
-		if (rproc->state == RPROC_CRASHED)
-			rproc_trigger_recovery(rproc);
+		rproc_trigger_recovery(rproc);
 	} else if (!strncmp(buf, "disabled", count)) {
 		rproc->recovery_disabled = true;
 	} else if (!strncmp(buf, "recover", count)) {
-		/* if rproc has crashed, trigger recovery */
-		if (rproc->state == RPROC_CRASHED)
-			rproc_trigger_recovery(rproc);
+		/* begin the recovery process without changing the flag */
+		rproc_trigger_recovery(rproc);
 	}
 
 	return count;
@@ -349,7 +347,7 @@ void rproc_create_debug_dir(struct rproc *rproc)
 
 	debugfs_create_file("name", 0400, rproc->dbg_dir,
 			    rproc, &rproc_name_ops);
-	debugfs_create_file("recovery", 0400, rproc->dbg_dir,
+	debugfs_create_file("recovery", 0600, rproc->dbg_dir,
 			    rproc, &rproc_recovery_ops);
 	debugfs_create_file("crash", 0200, rproc->dbg_dir,
 			    rproc, &rproc_crash_ops);
-- 
2.20.1
