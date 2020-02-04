Return-Path: <cleger@kalray.eu>
From: Clement Leger <cleger@kalray.eu>
Subject: [PATCH] remoteproc: Replace trailing commas with semicolons
Date: Tue,  4 Feb 2020 15:58:53 +0100
Message-Id: <20200204145853.29056-1-cleger@kalray.eu>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Clement Leger <cleger@kalray.eu>
List-ID: <linux-remoteproc@vger.kernel.org>

Replace two misplaced trailing commas by semicolons.

Signed-off-by: Clement Leger <cleger@kalray.eu>
---
 drivers/remoteproc/remoteproc_virtio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 8c07cb2ca8ba..d58c6565f51d 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -376,8 +376,8 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 		ret = -ENOMEM;
 		goto out;
 	}
-	vdev->id.device	= id,
-	vdev->config = &rproc_virtio_config_ops,
+	vdev->id.device	= id;
+	vdev->config = &rproc_virtio_config_ops;
 	vdev->dev.parent = dev;
 	vdev->dev.release = rproc_virtio_dev_release;
 
-- 
2.15.0.276.g89ea799
