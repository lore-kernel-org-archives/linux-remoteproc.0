Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [RFC 16/18] remoteproc: Parse virtio node for memory region
Date: Thu, 16 Apr 2020 18:13:29 +0200
Message-ID: <20200416161331.7606-17-arnaud.pouliquen@st.com>
In-Reply-To: <20200416161331.7606-1-arnaud.pouliquen@st.com>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, arnaud.pouliquen@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

Add the possibility to declare memories associated to the virtio paltform
in the device tree.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_virtio.c | 77 +++++++++++++++++++++++---
 1 file changed, 68 insertions(+), 9 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 0fd938afd146..3302ee7d6c14 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -610,12 +610,71 @@ static const struct component_ops rproc_virtio_ops = {
 	.unbind = rproc_virtio_unbind,
 };
 
+static int rproc_virtio_of_parse(struct device *dev, struct rproc_vdev *rvdev)
+{
+	struct device_node *np = dev->of_node;
+	struct rproc *rproc = rvdev->rproc;
+	struct of_phandle_iterator it;
+	struct rproc_mem_entry *mem;
+	struct reserved_mem *rmem;
+	char name[32];
+	u64 da;
+	int index = 0;
+
+	/* the reg is used to specify the vdev index */
+	if (of_property_read_u32(np, "reg", &rvdev->index))
+		return -EINVAL;
+	/* Register associated reserved memory regions */
+	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
+
+	while (of_phandle_iterator_next(&it) == 0) {
+		rmem = of_reserved_mem_lookup(it.node);
+		if (!rmem) {
+			dev_err(dev, "unable to acquire memory-region\n");
+			return -EINVAL;
+		}
+
+		if (rproc_pa_to_da(rproc, rmem->base, &da) < 0) {
+			dev_err(dev, "memory region not valid %pa\n",
+				&rmem->base);
+			return -EINVAL;
+		}
+
+		snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
+		if (strcmp(it.node->name, name)) {
+			/* Register memory region */
+			mem = rproc_mem_entry_init(dev, NULL,
+						   (dma_addr_t)rmem->base,
+						   rmem->size, da,
+						   rproc_default_mem_alloc,
+						   rproc_default_mem_release,
+						   it.node->name);
+
+			if (mem)
+				rproc_coredump_add_segment(rproc, da,
+							   rmem->size);
+		} else {
+			/* Register reserved memory for vdev buffer alloc */
+			mem = rproc_of_resm_mem_entry_init(dev, index,
+							   rmem->size,
+							   rmem->base,
+							   it.node->name);
+		}
+
+		if (!mem)
+			return -ENOMEM;
+
+		rproc_add_carveout(rproc, mem);
+		index++;
+	}
+
+	return 0;
+}
+
 static int rproc_virtio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
 	struct rproc_vdev *rvdev;
-	struct rproc *rproc;
 	int ret;
 
 	rvdev = devm_kzalloc(&pdev->dev, sizeof(*rvdev), GFP_KERNEL);
@@ -627,18 +686,16 @@ static int rproc_virtio_probe(struct platform_device *pdev)
 		 * The platform device is declared in the device tree
 		 * retrieve rproc struct through the remoteproc platform
 		 */
-		rproc = rproc_get_by_node(dev->parent->of_node);
+		rvdev->rproc = rproc_get_by_node(dev->parent->of_node);
 
-		/* the reg is used to specify the vdev index */
-		if (of_property_read_u32(np, "reg", &rvdev->index))
-			return -EINVAL;
+		ret = rproc_virtio_of_parse(dev, rvdev);
 	} else {
 		struct rproc_vdev_data *vdev_data = pdev->dev.platform_data;
 
 		if (!vdev_data)
 			return -EINVAL;
 
-		rproc = container_of(dev->parent, struct rproc, dev);
+		rvdev->rproc = container_of(dev->parent, struct rproc, dev);
 
 		rvdev->rsc_offset = vdev_data->rsc_offset;
 		rvdev->rsc = vdev_data->rsc;
@@ -649,8 +706,10 @@ static int rproc_virtio_probe(struct platform_device *pdev)
 		if (ret)
 			return ret;
 	}
+	if (ret)
+		return ret;
+
 	rvdev->pdev = pdev;
-	rvdev->rproc = rproc;
 
 	platform_set_drvdata(pdev, rvdev);
 
@@ -658,7 +717,7 @@ static int rproc_virtio_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	rproc_register_rvdev(rproc, rvdev);
+	rproc_register_rvdev(rvdev->rproc, rvdev);
 
 	return 0;
 }
-- 
2.17.1
