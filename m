Return-Path: <jliang@xilinx.com>
Return-Path: wendy.liang@xilinx.com
From: Wendy Liang <wendy.liang@xilinx.com>
Subject: [RFC LINUX PATCH 3/3] remoteproc: Release DMA declare mem when cleanup rsc
Date: Fri, 24 Mar 2017 12:22:16 -0700
Message-ID: <1490383336-23117-4-git-send-email-jliang@xilinx.com>
In-Reply-To: <1490383336-23117-1-git-send-email-jliang@xilinx.com>
References: <1490383336-23117-1-git-send-email-jliang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, "Wendy Liang  <wendy.liang@xilinx.com>, Wendy Liang <jliang@xilinx.com>, Michal Simek" <michal.simek@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Wendy Liang <wendy.liang@xilinx.com>

Release the declared DMA memory in the end of resource
cleanup.

Signed-off-by: Wendy Liang <jliang@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---
 drivers/remoteproc/remoteproc_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 0ffd9dc..9d32737 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -882,6 +882,9 @@ static void rproc_resource_cleanup(struct rproc *rproc)
 	/* clean up remote vdev entries */
 	list_for_each_entry_safe(rvdev, rvtmp, &rproc->rvdevs, node)
 		kref_put(&rvdev->refcount, rproc_vdev_release);
+
+	/* Release declared DMA memory */
+	dma_release_declared_memory(dev->parent);
 }
 
 /*
-- 
1.9.1
