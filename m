Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [RFC 07/18] remoteproc: Add component bind/unbind for virtio platform
Date: Thu, 16 Apr 2020 18:13:20 +0200
Message-ID: <20200416161331.7606-8-arnaud.pouliquen@st.com>
In-Reply-To: <20200416161331.7606-1-arnaud.pouliquen@st.com>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, arnaud.pouliquen@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

Add component to declare bind and unbind functions. Theses functions
are used to ensure that the remoteproc virtio device is probed
and registered as a subdev of the rproc device before rproc
request the the prepare and start of the subdevice.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_virtio.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 2a0f33ccd929..e1d7371d2d64 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -10,6 +10,7 @@
  * Brian Swetland <swetland@google.com>
  */
 
+#include <linux/component.h>
 #include <linux/dma-mapping.h>
 #include <linux/export.h>
 #include <linux/module.h>
@@ -426,7 +427,8 @@ static const struct rproc_subdev rproc_virtio_subdev = {
 	.stop		= rproc_vitio_stop
 };
 
-static int rproc_virtio_bind(struct device *dev)
+static int rproc_virtio_bind(struct device *dev, struct device *master,
+			     void *data)
 {
 	struct rproc_vdev *rvdev = dev_get_drvdata(dev);
 	struct rproc *rproc = rvdev->rproc;
@@ -483,7 +485,8 @@ static int rproc_virtio_bind(struct device *dev)
 	return ret;
 }
 
-static void rproc_virtio_unbind(struct device *dev)
+static void rproc_virtio_unbind(struct device *dev, struct device *master,
+				void *data)
 {
 	struct rproc_vdev *rvdev = dev_get_drvdata(dev);
 	struct rproc *rproc = rvdev->rproc;
@@ -504,6 +507,11 @@ static void rproc_virtio_unbind(struct device *dev)
 	dev_dbg(dev, "virtio dev %d unbound\n",  rvdev->index);
 }
 
+static const struct component_ops rproc_virtio_ops = {
+	.bind = rproc_virtio_bind,
+	.unbind = rproc_virtio_unbind,
+};
+
 static int rproc_virtio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -548,14 +556,21 @@ static int rproc_virtio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, rvdev);
 
+	ret = component_add(&pdev->dev, &rproc_virtio_ops);
+	if (ret)
+		return ret;
+
 	rproc_register_rvdev(rproc, rvdev);
 
-	return rproc_virtio_bind(dev);
+	return 0;
 }
 
 static int rproc_virtio_remove(struct platform_device *pdev)
 {
-	rproc_virtio_unbind(&pdev->dev);
+	struct rproc_vdev *rvdev = dev_get_drvdata(&pdev->dev);
+
+	component_del(&pdev->dev, &rproc_virtio_ops);
+	rproc_unregister_rvdev(rvdev);
 
 	return 0;
 }
-- 
2.17.1
