Return-Path: <jliang@xilinx.com>
Return-Path: wendy.liang@xilinx.com
From: Wendy Liang <wendy.liang@xilinx.com>
Subject: [RFC LINUX PATCH 18/19] remoteproc: shutdown: set state to OFFLINE after stopping remote
Date: Fri, 24 Mar 2017 12:22:34 -0700
Message-ID: <1490383355-23176-19-git-send-email-jliang@xilinx.com>
In-Reply-To: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
References: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, "Wendy Liang  <wendy.liang@xilinx.com>, Wendy Liang <jliang@xilinx.com>, Michal Simek" <michal.simek@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Wendy Liang <wendy.liang@xilinx.com>

Set rproc state to OFFLINE right after it stops the remote.
Some remoteproc virtio operations depends on rproc state. And thus,
we should set the rproc state to OFFLINE right after it stops
the remote.

Signed-off-by: Wendy Liang <jliang@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
 drivers/remoteproc/remoteproc_core.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ffd1de2..62c0356 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1369,6 +1369,7 @@ void rproc_shutdown(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
 	int ret;
+	int pre_rproc_state;
 
 	ret = mutex_lock_interruptible(&rproc->lock);
 	if (ret) {
@@ -1391,6 +1392,9 @@ void rproc_shutdown(struct rproc *rproc)
 		goto out;
 	}
 
+	pre_rproc_state = rproc->state;
+	rproc->state = RPROC_OFFLINE;
+
 	/* clean up all acquired resources */
 	rproc_resource_cleanup(rproc);
 
@@ -1402,11 +1406,9 @@ void rproc_shutdown(struct rproc *rproc)
 	rproc->table_ptr = NULL;
 
 	/* if in crash state, unlock crash handler */
-	if (rproc->state == RPROC_CRASHED)
+	if (pre_rproc_state == RPROC_CRASHED)
 		complete_all(&rproc->crash_comp);
 
-	rproc->state = RPROC_OFFLINE;
-
 	dev_info(dev, "stopped remote processor %s\n", rproc->name);
 
 out:
-- 
1.9.1
