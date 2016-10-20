Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 02/11] rpmsg: smd: Expose edge registration functions
Date: Wed, 19 Oct 2016 19:40:03 -0700
Message-Id: <1476931212-1806-3-git-send-email-bjorn.andersson@linaro.org>
In-Reply-To: <1476931212-1806-1-git-send-email-bjorn.andersson@linaro.org>
References: <1476931212-1806-1-git-send-email-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Sarangdhar Joshi <spjoshi@codeaurora.org>, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

The edge registration functions is to be used from a remoteproc driver
to register and unregister an edge as the remote processor comes and
goes.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/qcom_smd.c       |  1 +
 include/linux/rpmsg/qcom_smd.h | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 include/linux/rpmsg/qcom_smd.h

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 952338a6296a..aded7352f089 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -25,6 +25,7 @@
 #include <linux/soc/qcom/smem.h>
 #include <linux/wait.h>
 #include <linux/rpmsg.h>
+#include <linux/rpmsg/qcom_smd.h>
 
 #include "rpmsg_internal.h"
 
diff --git a/include/linux/rpmsg/qcom_smd.h b/include/linux/rpmsg/qcom_smd.h
new file mode 100644
index 000000000000..7c12637a500e
--- /dev/null
+++ b/include/linux/rpmsg/qcom_smd.h
@@ -0,0 +1,33 @@
+
+#ifndef _LINUX_RPMSG_QCOM_SMD_H
+#define _LINUX_RPMSG_QCOM_SMD_H
+
+#include <linux/device.h>
+
+struct qcom_smd_edge;
+
+#if IS_ENABLED(CONFIG_RPMSG_QCOM_SMD)
+
+struct qcom_smd_edge *qcom_smd_register_edge(struct device *parent,
+					     struct device_node *node);
+int qcom_smd_unregister_edge(struct qcom_smd_edge *edge);
+
+#else
+
+static inline struct qcom_smd_edge *
+qcom_smd_register_edge(struct device *parent,
+		       struct device_node *node)
+{
+	return ERR_PTR(-ENXIO);
+}
+
+static inline int qcom_smd_unregister_edge(struct qcom_smd_edge *edge)
+{
+	/* This shouldn't be possible */
+	WARN_ON(1);
+	return -ENXIO;
+}
+
+#endif
+
+#endif
-- 
2.5.0
