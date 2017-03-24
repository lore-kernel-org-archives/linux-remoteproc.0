Return-Path: <jliang@xilinx.com>
Return-Path: wendy.liang@xilinx.com
From: Wendy Liang <wendy.liang@xilinx.com>
Subject: [RFC LINUX PATCH 02/19] remtoeproc: Add an operation to check if remote is running
Date: Fri, 24 Mar 2017 12:22:18 -0700
Message-ID: <1490383355-23176-3-git-send-email-jliang@xilinx.com>
In-Reply-To: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
References: <1490383355-23176-1-git-send-email-jliang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, "Wendy Liang  <wendy.liang@xilinx.com>, Wendy Liang <jliang@xilinx.com>, Michal Simek" <michal.simek@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Wendy Liang <wendy.liang@xilinx.com>

Add a remoteproc driver operation to check if the remote is running.

Signed-off-by: Wendy Liang <jliang@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
 drivers/remoteproc/remoteproc_core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 9d32737..dfa2aad 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -888,6 +888,16 @@ static void rproc_resource_cleanup(struct rproc *rproc)
 }
 
 /*
+ * check if the remote is running
+ */
+static bool rproc_is_running(struct rproc *rproc)
+{
+	if (rproc->ops->is_running)
+		return rproc->ops->is_running(rproc);
+	return (rproc->state == RPROC_RUNNING) ? true : false;
+}
+
+/*
  * take a firmware and boot a remote processor with it.
  */
 static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
-- 
1.9.1
