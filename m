Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [PATCH] remoteproc: fix crashed parameter logic on stop call.
Date: Tue, 10 Apr 2018 10:57:25 +0200
Message-ID: <1523350645-19073-1-git-send-email-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, arnaud.pouliquen@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

Fix rproc_add_subdev parameter name and inverse the crashed logic.

Fixes: "remoteproc: Pass type of shutdown to subdev remove"

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 4 ++--
 include/linux/remoteproc.h           | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 6d9c583..a9609d9 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1163,7 +1163,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
 	if (ret)
 		return ret;
 
-	ret = rproc_stop(rproc, false);
+	ret = rproc_stop(rproc, true);
 	if (ret)
 		goto unlock_mutex;
 
@@ -1316,7 +1316,7 @@ void rproc_shutdown(struct rproc *rproc)
 	if (!atomic_dec_and_test(&rproc->power))
 		goto out;
 
-	ret = rproc_stop(rproc, true);
+	ret = rproc_stop(rproc, false);
 	if (ret) {
 		atomic_inc(&rproc->power);
 		goto out;
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index d09a9c7..dfdaede9 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -569,7 +569,7 @@ static inline struct rproc *vdev_to_rproc(struct virtio_device *vdev)
 void rproc_add_subdev(struct rproc *rproc,
 		      struct rproc_subdev *subdev,
 		      int (*probe)(struct rproc_subdev *subdev),
-		      void (*remove)(struct rproc_subdev *subdev, bool graceful));
+		      void (*remove)(struct rproc_subdev *subdev, bool crashed));
 
 void rproc_remove_subdev(struct rproc *rproc, struct rproc_subdev *subdev);
 
-- 
2.7.4
