Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [RFC 12/18] remoteproc: Support of pre-registered virtio device
Date: Thu, 16 Apr 2020 18:13:25 +0200
Message-ID: <20200416161331.7606-13-arnaud.pouliquen@st.com>
In-Reply-To: <20200416161331.7606-1-arnaud.pouliquen@st.com>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, arnaud.pouliquen@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

Management of the virtio device declared in the devicetree as
a sub device of the remoteproc.
Instead of creating a new platform device, we parse first the
rvdevs list to look for a pre-registered rvdev with an index, that
matches with the vdev instance of the resource table.
If no pre-registered vdev is found a new platform device is created.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 51 +++++++++++++++++-----------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ecb36f64b1a0..9238aa292644 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -383,8 +383,8 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 {
 	struct device *dev = &rproc->dev;
 	struct rproc_vdev_data vdev_data;
+	struct rproc_vdev *rvdev = NULL, *tmp_rvdev;
 	struct platform_device *pdev;
-	int ret;
 
 	/* make sure resource isn't truncated */
 	if (struct_size(rsc, vring, rsc->num_of_vrings) + rsc->config_len >
@@ -399,27 +399,40 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 		return -EINVAL;
 	}
 
-	vdev_data.rsc_offset = offset;
-	vdev_data.rsc = rsc;
-	vdev_data.id  = rsc->id;
-	vdev_data.index  = rproc->nb_vdev;
+	/* Try to find a pre-registered rproc virtio device  */
+	list_for_each_entry(tmp_rvdev, &rproc->rvdevs, node) {
+		if (tmp_rvdev->index == rproc->nb_vdev) {
+			rvdev = tmp_rvdev;
+			break;
+		}
+	}
 
-	dev_dbg(dev, "%s: rsc_offset = %d rsc = %p id = %d\n",
-		__func__, vdev_data.rsc_offset, vdev_data.rsc, vdev_data.id);
+	if (rvdev) {
+		/* assign the resource offset */
+		rvdev->rsc_offset = offset;
+		rvdev->rsc = rsc;
+		rvdev->id = rsc->id;
 
-	pdev = platform_device_register_data(dev, "rproc-virtio",
-					     rproc->nb_vdev, &vdev_data,
-					     sizeof(vdev_data));
-	ret = PTR_ERR_OR_ZERO(pdev);
-	if (ret) {
-		dev_err(rproc->dev.parent,
-			"failed to create rproc-virtio device\n");
-		return ret;
+	} else {
+		/* no rproc vdev found, register one */
+		vdev_data.rsc_offset = offset;
+		vdev_data.rsc = rsc;
+		vdev_data.id  = rsc->id;
+		vdev_data.index  = rproc->nb_vdev;
+
+		pdev = platform_device_register_data(dev, "rproc-virtio",
+						     rproc->nb_vdev, &vdev_data,
+						     sizeof(vdev_data));
+		if (PTR_ERR_OR_ZERO(pdev)) {
+			dev_err(rproc->dev.parent,
+				"failed to create rproc-virtio device\n");
+			return PTR_ERR_OR_ZERO(pdev);
+		}
+		/* register a component associated to the virtio platform */
+		component_match_add_release(&pdev->dev, &rproc->match,
+					    rproc_release_of, rproc_compare_of,
+					    &pdev->dev);
 	}
-	/* register a component associated to the virtio platform */
-	component_match_add_release(&pdev->dev, &rproc->match,
-				    rproc_release_of, rproc_compare_of,
-				    &pdev->dev);
 	rproc->nb_vdev++;
 
 	return  0;
-- 
2.17.1
