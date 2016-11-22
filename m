Return-Path: <stanimir.varbanov@linaro.org>
Return-Path: <stanimir.varbanov@linaro.org>
From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 2/3] remoteproc: add empty remoteproc API functions in header
Date: Tue, 22 Nov 2016 19:02:43 +0200
Message-Id: <1479834163-30842-1-git-send-email-stanimir.varbanov@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, linux-remoteproc@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Stanimir Varbanov <stanimir.varbanov@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

With this addition in place the drivers which uses remote
processor APIs will be able to be compile tested on different
architectures with COMPILE_TEST Kconfig option.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 include/linux/remoteproc.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 930023b7c825..a727cb3c9e3d 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -486,6 +486,7 @@ struct rproc_vdev {
 	u32 rsc_offset;
 };
 
+#if IS_ENABLED(CONFIG_REMOTEPROC)
 struct rproc *rproc_get_by_phandle(phandle phandle);
 struct rproc *rproc_alloc(struct device *dev, const char *name,
 			  const struct rproc_ops *ops,
@@ -510,5 +511,28 @@ static inline struct rproc *vdev_to_rproc(struct virtio_device *vdev)
 
 	return rvdev->rproc;
 }
+#else
+static inline struct rproc *
+rproc_get_by_phandle(phandle phandle) { return ERR_PTR(-ENODEV); }
+static inline struct rproc *rproc_alloc(struct device *dev, const char *name,
+					const struct rproc_ops *ops,
+					const char *firmware, int len)
+{ return ERR_PTR(-ENODEV); }
+static inline void rproc_put(struct rproc *rproc) {}
+static inline int rproc_add(struct rproc *rproc) { return -ENODEV; }
+static inline int rproc_del(struct rproc *rproc) { return -ENODEV; }
+static inline void rproc_free(struct rproc *rproc) {}
+
+static inline int rproc_boot(struct rproc *rproc) { return -ENODEV; }
+static inline void rproc_shutdown(struct rproc *rproc) {}
+static inline void
+rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type) {}
+
+static inline struct rproc_vdev *vdev_to_rvdev(struct virtio_device *vdev)
+{ return NULL; }
+
+static inline struct rproc *vdev_to_rproc(struct virtio_device *vdev)
+{ return NULL; }
+#endif
 
 #endif /* REMOTEPROC_H */
-- 
2.7.4
