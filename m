Return-Path: <elder@linaro.org>
Return-Path: <elder@linaro.org>
From: Alex Elder <elder@linaro.org>
Subject: [PATCH 1/4] remoteproc: re-check state in rproc_trigger_recovery()
Date: Fri, 28 Feb 2020 12:33:56 -0600
Message-Id: <20200228183359.16229-2-elder@linaro.org>
In-Reply-To: <20200228183359.16229-1-elder@linaro.org>
References: <20200228183359.16229-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Two places call rproc_trigger_recovery():
  - rproc_crash_handler_work() sets rproc->state to CRASHED under
    protection of the mutex, then calls it if recovery is not
    disabled.  This function is called in workqueue context when
    scheduled in rproc_report_crash().
  - rproc_recovery_write() calls it in two spots, both of which
    the only call it if the rproc->state is CRASHED.

The mutex is taken right away in rproc_trigger_recovery().  However,
by the time the mutex is acquired, something else might have changed
rproc->state to something other than CRASHED.

The work that follows that is only appropriate for a remoteproc in
CRASHED state.  So check the state after acquiring the mutex, and
only proceed with the recovery work if the remoteproc is still in
CRASHED state.

Delay reporting that recovering has begun until after we hold the
mutex and we know the remote processor is in CRASHED state.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 097f33e4f1f3..d327cb31d5c8 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1653,12 +1653,16 @@ int rproc_trigger_recovery(struct rproc *rproc)
 	struct device *dev = &rproc->dev;
 	int ret;
 
+	ret = mutex_lock_interruptible(&rproc->lock);
+	if (ret)
+		return ret;
+
+	/* State could have changed before we got the mutex */
+	if (rproc->state != RPROC_CRASHED)
+		goto unlock_mutex;
+
 	dev_err(dev, "recovering %s\n", rproc->name);
 
-	ret = mutex_lock_interruptible(&rproc->lock);
-	if (ret)
-		return ret;
-
 	ret = rproc_stop(rproc, true);
 	if (ret)
 		goto unlock_mutex;
-- 
2.20.1
