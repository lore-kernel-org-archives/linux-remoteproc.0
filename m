Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 07/11] remoteproc: Further extend the vdev life cycle
Date: Wed, 19 Oct 2016 19:40:08 -0700
Message-Id: <1476931212-1806-8-git-send-email-bjorn.andersson@linaro.org>
In-Reply-To: <1476931212-1806-1-git-send-email-bjorn.andersson@linaro.org>
References: <1476931212-1806-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Tie the vdev (and hence vring) life cycle to the resource parsing and
resource cleanup operations, allowing us to safely register and
unregister virtio devices on the go.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index e4509c8dd8e8..1d2f4b2dd05d 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -377,6 +377,9 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 			goto unwind_vring_allocations;
 	}
 
+	/* track the rvdevs list reference */
+	kref_get(&rvdev->refcount);
+
 	list_add_tail(&rvdev->node, &rproc->rvdevs);
 
 	/* it is now safe to add the virtio device */
@@ -839,8 +842,10 @@ static void rproc_resource_cleanup(struct rproc *rproc)
 	}
 
 	/* clean up remote vdev entries */
-	list_for_each_entry_safe(rvdev, rvtmp, &rproc->rvdevs, node)
+	list_for_each_entry_safe(rvdev, rvtmp, &rproc->rvdevs, node) {
 		rproc_remove_virtio_dev(rvdev);
+		kref_put(&rvdev->refcount, rproc_vdev_release);
+	}
 }
 
 /*
-- 
2.5.0
