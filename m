Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH 1/1] remoteproc: fix vdev reference management
Date: Wed, 14 Dec 2016 16:11:00 +0100
Message-ID: <1481728260-21771-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: lee.jones@linaro.org, loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

Commit 2b45cef5868a ("remoteproc: Further extend the vdev life cycle")
extends kref support for vdev management.
It introduces a regression when following sequence is executed:
rproc_boot --> rproc_shutdown --> rproc_boot
Second rproc_boot call crashes on register_virtio_device as device
is already existing.
Issue is previous vdev is never released when rproc is stop because
associated refcount is too high.

kref_get introduces is not needed as kref_init already initializes
krefcount to 1 because it considers associated variable as used.
This introduces a misalignment between kref_get and kref_put calls.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 9a507e7..feb24c4 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -396,9 +396,6 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 			goto unwind_vring_allocations;
 	}
 
-	/* track the rvdevs list reference */
-	kref_get(&rvdev->refcount);
-
 	list_add_tail(&rvdev->node, &rproc->rvdevs);
 
 	rproc_add_subdev(rproc, &rvdev->subdev,
-- 
1.9.1
